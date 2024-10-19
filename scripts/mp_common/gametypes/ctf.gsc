// Atian COD Tools GSC CW decompiler test
#using scripts\abilities\mp\gadgets\gadget_smart_cover.gsc;
#using scripts\abilities\mp\gadgets\gadget_concertina_wire.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\teams\teams.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\gametypes\overtime.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\hud_message.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_defaults.gsc;
#using script_1cc417743d7c262d;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\mp_common\bb.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using script_3d703ef87a841fe4;
#using scripts\core_common\util_shared.gsc;
#using script_7a8059ca02b7b09e;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using script_335d0650ed05d36d;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace ctf;

// Namespace ctf/ctf
// Params 0, eflags: 0x5
// Checksum 0xa631b5bd, Offset: 0x790
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"ctf", &preinit, undefined, undefined, undefined);
}

// Namespace ctf/ctf
// Params 0, eflags: 0x4
// Checksum 0xe7ac0fdd, Offset: 0x7d8
// Size: 0x1dc
function private preinit() {
    clientfield::register("scriptmover", "ctf_flag_away", 17000, 1, "int");
    clientfield::register("scriptmover", "entityModelsNum", 1, 10, "int");
    clientfield::register("scriptmover", "ctf_flag_objid", 17000, 3, "int");
    clientfield::register("allplayers", "ctf_flag_carried", 17000, 1, "int");
    clientfield::function_5b7d846d("CTFLevelInfo.bestTimeAllies", 17000, 9, "int");
    clientfield::function_5b7d846d("CTFLevelInfo.bestTimeAxis", 17000, 9, "int");
    clientfield::function_5b7d846d("CTFLevelInfo.flagCarrierAllies", 17000, 7, "int");
    clientfield::function_5b7d846d("CTFLevelInfo.flagCarrierAxis", 17000, 7, "int");
    clientfield::function_5b7d846d("CTFLevelInfo.flagStateAllies", 17000, 2, "int");
    clientfield::function_5b7d846d("CTFLevelInfo.flagStateAxis", 17000, 2, "int");
    clientfield::function_5b7d846d("ctf_reset_score", 17000, 1, "int");
}

// Namespace ctf/gametype_init
// Params 1, eflags: 0x20
// Checksum 0xd44da67d, Offset: 0x9c0
// Size: 0x524
function event_handler[gametype_init] main(*eventstruct) {
    globallogic::init();
    util::registertimelimit(0, 1440);
    util::registerroundlimit(0, 10);
    util::registerroundwinlimit(0, 10);
    util::registerroundswitch(0, 9);
    util::registerscorelimit(0, 5000);
    level.flagcapturecondition = getgametypesetting(#"flagcapturecondition");
    level.doubleovertime = 1;
    level.onstartgametype = &onstartgametype;
    level.onspawnplayer = &onspawnplayer;
    level.onprecachegametype = &onprecachegametype;
    player::function_cf3aa03d(&onplayerkilled);
    level.onendround = &onendround;
    level.onendgame = &onendgame;
    level.shouldplayovertimeround = &shouldplayovertimeround;
    level.ctfreturnflag = &returnflag;
    level.var_17ae20ae = &function_17ae20ae;
    level.ontimelimit = &ontimelimit;
    spawning::addsupportedspawnpointtype("ctf");
    callback::on_connect(&onconnect);
    callback::on_joined_team(&onconnect);
    callback::on_joined_spectate(&onconnect);
    if (!isdefined(game.ctf_teamscore_cache)) {
        game.ctf_teamscore_cache[#"allies"] = 0;
        game.ctf_teamscore_cache[#"axis"] = 0;
    }
    level.var_537d7278 = [];
    level.var_537d7278[#"allies"] = spawnstruct();
    level.var_537d7278[#"allies"].friendly = #"hash_284308e81d362553";
    level.var_537d7278[#"allies"].enemy = #"hash_104d7846da83e67e";
    level.var_537d7278[#"axis"] = spawnstruct();
    level.var_537d7278[#"axis"].friendly = #"hash_5a946f3f24347a8e";
    level.var_537d7278[#"axis"].enemy = #"hash_34ce58df766f54dd";
    level thread ctf_icon_hide();
    game.flagmodels[#"allies"] = spawnstruct();
    game.flagmodels[#"allies"].allies = #"hash_1f046ad8773b6c3";
    game.flagmodels[#"allies"].axis = #"hash_1001e79caa6049ce";
    game.flagmodels[#"axis"] = spawnstruct();
    game.flagmodels[#"axis"].axis = #"hash_4409a354dd61569e";
    game.flagmodels[#"axis"].allies = #"hash_592aa91190e3938d";
    game.carry_flagmodels[#"allies"] = #"hash_284308e81d362553";
    game.carry_flagmodels[#"axis"] = #"hash_5a946f3f24347a8e";
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x605d8487, Offset: 0xef0
// Size: 0x4c
function onprecachegametype() {
    game.flag_dropped_sound = "mp_war_objective_lost";
    game.flag_recovered_sound = "mp_war_objective_taken";
    game.strings[#"score_limit_reached"] = #"hash_5218d2db23ab36aa";
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xd121b8d6, Offset: 0xf48
// Size: 0x5c
function function_b4530b39() {
    level endon(#"game_ended");
    while (game.state != #"playing") {
        waitframe(1);
    }
    globallogic_audio::leader_dialog("sfgStartOvertime");
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x369e806c, Offset: 0xfb0
// Size: 0x23c
function onstartgametype() {
    updategametypedvars();
    globallogic_score::resetteamscores();
    if (overtime::is_overtime_round()) {
        game.ctf_teamscore_cache[#"allies"] = game.ctf_teamscore_cache[#"allies"] + [[ level._getteamscore ]](#"allies");
        game.ctf_teamscore_cache[#"axis"] = game.ctf_teamscore_cache[#"axis"] + [[ level._getteamscore ]](#"axis");
        if (!isdefined(game.var_8f9c5645)) {
            game.var_8f9c5645[#"allies"] = 0;
            game.var_8f9c5645[#"axis"] = 0;
        }
        [[ level._setteamscore ]](#"allies", 0);
        [[ level._setteamscore ]](#"axis", 0);
        util::registerscorelimit(1, 1);
        if (isdefined(game.ctf_overtime_time_to_beat)) {
            util::registertimelimit(game.ctf_overtime_time_to_beat / 60000, game.ctf_overtime_time_to_beat / 60000);
        }
        thread function_b4530b39();
        thread function_bc074337(3);
    }
    thread ctf();
    waitframe(1);
    if (game.roundsplayed > 0 && is_true(level.scoreroundwinbased)) {
        level clientfield::set_world_uimodel("ctf_reset_score", !clientfield::get_world_uimodel("ctf_reset_score"));
    }
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x3af9b1b7, Offset: 0x11f8
// Size: 0x118
function function_bc074337(var_69437f64) {
    level endon(#"game_ended");
    level waittill(#"game_playing");
    wait(2);
    foreach (player in level.players) {
        team = player.pers[#"team"];
        if (team === #"spectator") {
            continue;
        }
        player luinotifyevent(#"hash_4d1556cff740e470", 1, var_69437f64);
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x7d9de3b3, Offset: 0x1318
// Size: 0x88
function onconnect() {
    foreach (flag in level.flags) {
        flag function_ef8d5fb5();
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xc36c4ca2, Offset: 0x13a8
// Size: 0x1ea
function shouldplayovertimeround() {
    if (overtime::is_overtime_round()) {
        if (game.overtime_round == 1 || !level.gameended) {
            return true;
        }
        return false;
    }
    if (!level.scoreroundwinbased) {
        if (game.stat[#"teamscores"][#"allies"] == game.stat[#"teamscores"][#"axis"] && (util::hitroundlimit() || game.stat[#"teamscores"][#"allies"] == level.scorelimit - 1)) {
            return true;
        }
    } else {
        alliesroundswon = util::getroundswon(#"allies");
        axisroundswon = util::getroundswon(#"axis");
        if (!isdefined(level.var_933889c0) && level.roundwinlimit > 0 && axisroundswon == level.roundwinlimit - 1 && alliesroundswon == level.roundwinlimit - 1) {
            return true;
        }
        if (util::hitroundlimit() && alliesroundswon == axisroundswon) {
            return true;
        }
    }
    return false;
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x6f85833d, Offset: 0x15a0
// Size: 0xc8
function minutesandsecondsstring(milliseconds) {
    minutes = floor(float(milliseconds) / 60000);
    milliseconds -= minutes * 60000;
    seconds = floor(float(milliseconds) / 1000);
    if (seconds < 10) {
        return (minutes + ":0" + seconds);
    }
    return minutes + ":" + seconds;
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x1f4654fc, Offset: 0x1670
// Size: 0x24c
function onendround(*var_c1e98979) {
    winning_team = round::get_winning_team();
    if (round::get_flag("overtime")) {
        level clientfield::set_world_uimodel("CTFLevelInfo.bestTimeAllies", int(isdefined(game.var_8f9c5645[#"allies"]) ? game.var_8f9c5645[#"allies"] : 0));
        level clientfield::set_world_uimodel("CTFLevelInfo.bestTimeAxis", int(isdefined(game.var_8f9c5645[#"axis"]) ? game.var_8f9c5645[#"axis"] : 0));
        if (game.overtime_round < 2 && isdefined(winning_team) && !round::get_flag("tie")) {
            game.overtime_first_winner = winning_team;
            game.ctf_overtime_time_to_beat = globallogic_utils::gettimepassed();
        }
    } else {
        game.overtime_second_winner[#"ctf"] = winning_team;
        game.overtime_best_time[#"ctf"] = globallogic_utils::gettimepassed();
        globallogic_score::function_9779ac61();
        if (winning_team === #"allies" || winning_team === #"axis") {
            [[ level._setteamscore ]](winning_team, game.stat[#"roundswon"][winning_team] + 1);
        }
    }
    level thread function_4e84324e();
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xf9169652, Offset: 0x18c8
// Size: 0x140
function function_4e84324e() {
    wait(5);
    if (!isarray(level.flags)) {
        return;
    }
    foreach (flag in level.flags) {
        if (isdefined(flag.visuals[0])) {
            flag.visuals[0] setinvisibletoall();
            flag.visuals[1] setinvisibletoall();
        }
        if (isdefined(flag.var_94885886)) {
            flag.var_94885886 setinvisibletoall();
        }
        if (isdefined(flag.var_fa01a5fa)) {
            flag.var_fa01a5fa setinvisibletoall();
        }
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x381ad074, Offset: 0x1a10
// Size: 0xbc
function updateteamscorebyflagscaptured() {
    if (level.scoreroundwinbased) {
        return;
    }
    foreach (team, _ in level.teams) {
        [[ level._setteamscore ]](team, [[ level._getteamscore ]](team) + game.ctf_teamscore_cache[team]);
    }
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xedeab236, Offset: 0x1ad8
// Size: 0x194
function onendgame(*var_c1e98979) {
    if (level.scoreroundwinbased) {
        globallogic_score::function_9779ac61();
    } else {
        updateteamscorebyflagscaptured();
    }
    if (overtime::is_overtime_round()) {
        if (isdefined(game.overtime_first_winner)) {
            if (game.outcome.var_aefc8b8d.team == #"none") {
                winningteam = game.overtime_first_winner;
            } else {
                winningteam = game.outcome.var_aefc8b8d.team;
            }
            if (game.overtime_first_winner == winningteam) {
                level.endvictoryreasontext = #"hash_7cafa946822ee652";
                level.enddefeatreasontext = #"hash_34d0ee5d4c21542d";
            } else {
                level.endvictoryreasontext = #"hash_7cafa946822ee652";
                level.enddefeatreasontext = #"hash_5235bbca93844647";
            }
        } else {
            winningteam = game.outcome.var_aefc8b8d.team;
        }
        winner = winningteam;
    } else {
        winner = match::function_6d0354e3();
    }
    match::function_af2e264f(winner);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x9a782cb8, Offset: 0x1c78
// Size: 0x164
function onspawnplayer(predictedspawn) {
    self.isflagcarrier = 0;
    self.flagcarried = undefined;
    self clientfield::set("ctf_flag_carrier", 0);
    self clientfield::set("ctf_flag_carried", 0);
    spawning::onspawnplayer(predictedspawn);
    team = self.team;
    var_88d4d927 = level.teamflags[team].objectiveid;
    var_36a11ac1 = level.teamflags[util::get_enemy_team(team)].objectiveid;
    friendlyflagcarrier = level.teamflags[team].carrier;
    if (isdefined(friendlyflagcarrier) && friendlyflagcarrier.team != self.team) {
        objective_setinvisibletoplayer(var_88d4d927, self);
    } else {
        objective_setvisibletoplayer(var_88d4d927, self);
    }
    objective_setvisibletoplayer(var_36a11ac1, self);
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x7429c6ea, Offset: 0x1de8
// Size: 0x1c8
function updategametypedvars() {
    level.flagcapturetime = getgametypesetting(#"capturetime");
    level.flagtouchreturntime = getgametypesetting(#"defusetime");
    level.idleflagreturntime = getgametypesetting(#"idleflagresettime");
    level.flagrespawntime = getgametypesetting(#"flagrespawntime");
    level.enemycarriervisible = getgametypesetting(#"enemycarriervisible");
    level.roundlimit = getgametypesetting(#"roundlimit");
    level.cumulativeroundscores = getgametypesetting(#"cumulativeroundscores");
    level.scoreroundwinbased = level.cumulativeroundscores == 0;
    level.teamkillpenaltymultiplier = getgametypesetting(#"teamkillpenalty");
    level.teamkillscoremultiplier = getgametypesetting(#"teamkillscore");
    if (level.flagtouchreturntime >= 0 && level.flagtouchreturntime != 63) {
        level.touchreturn = 1;
        return;
    }
    level.touchreturn = 0;
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x67a20b63, Offset: 0x1fb8
// Size: 0x144
function function_ef8d5fb5() {
    self.visuals[0] setinvisibletoall();
    self.visuals[0] setvisibletoteam(#"allies");
    self.visuals[1] setinvisibletoall();
    self.visuals[1] setvisibletoteam(#"axis");
    if (isdefined(self.var_94885886)) {
        self.var_94885886 setinvisibletoall();
        self.var_94885886 setvisibletoteam(self.ctf_team);
    }
    if (isdefined(self.var_fa01a5fa)) {
        otherteam = util::get_enemy_team(self.ctf_team);
        self.var_fa01a5fa setinvisibletoall();
        self.var_fa01a5fa setvisibletoteam(otherteam);
    }
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xe6f0a9f4, Offset: 0x2108
// Size: 0x622
function createflag(trigger) {
    if (isdefined(trigger.target)) {
        visuals[0] = getent(trigger.target, "targetname");
    } else {
        visuals[0] = spawn("script_model", trigger.origin);
        visuals[0].angles = trigger.angles;
    }
    visuals[1] = spawn("script_model", visuals[0].origin);
    visuals[1].angles = trigger.angles;
    entityteam = util::function_6f4ff113(trigger.script_team);
    visuals[0] setmodel(game.flagmodels[entityteam].allies);
    visuals[0] setteam(entityteam);
    visuals[0] notsolid();
    visuals[0] function_619a5c20();
    visuals[1] setmodel(game.flagmodels[entityteam].axis);
    visuals[1] setteam(entityteam);
    visuals[1] notsolid();
    visuals[1] function_619a5c20();
    flag = gameobjects::create_carry_object(entityteam, trigger, visuals, (0, 0, 0), entityteam + "_flag");
    flag gameobjects::function_3c3a122f(#"hash_150a20fa4efc5c7a", level.flagtouchreturntime);
    flag gameobjects::function_3c3a122f(#"hash_33c49a99551acae7", level.flagcapturetime);
    flag gameobjects::allow_carry(#"hash_33c49a99551acae7");
    flag gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
    flag.var_22389d70 = 0;
    flag function_ef8d5fb5();
    visuals[0] clientfield::set("ctf_flag_objid", flag.objectiveid);
    if (!getdvarint(#"hash_3127d4491fda6ae0", 0)) {
        flag gameobjects::set_visible_carrier_model(game.carry_flagmodels[entityteam]);
    }
    flag gameobjects::set_2d_icon(#"hash_150a20fa4efc5c7a", level.icondefend2d);
    flag gameobjects::set_3d_icon(#"hash_150a20fa4efc5c7a", level.icondefend3d);
    flag gameobjects::set_2d_icon(#"hash_33c49a99551acae7", level.iconcapture2d);
    flag gameobjects::set_3d_icon(#"hash_33c49a99551acae7", level.iconcapture3d);
    var_a319c814 = getgametypesetting(#"carrier_manualdrop");
    if (var_a319c814 === 1) {
        flag gameobjects::function_a8c842d6(1, 1, 0);
    } else if (var_a319c814 === 2) {
        flag gameobjects::function_98c39cbc(1);
    }
    if (level.enemycarriervisible == 2) {
        flag.objidpingfriendly = 1;
    }
    if (getdvarint(#"hash_3127d4491fda6ae0", 0)) {
        flag.usetime = 0;
        flag.objectiveonvisuals = 1;
        flag.allowweapons = 0;
        flag.carryweapon = getweapon("ball");
        flag.keepcarryweapon = 1;
        flag.waterbadtrigger = 0;
        flag.disallowremotecontrol = 1;
        flag.disallowplaceablepickup = 1;
        flag.var_22389d70 = 0;
        flag.canuseobject = &function_a5f40b8e;
    } else {
        flag.allowweapons = 1;
        flag.identifier = #"hash_7044a4ac19b5324e";
    }
    flag.onpickup = &onpickup;
    flag.onpickupfailed = &onpickup;
    flag.ondrop = &ondrop;
    flag.onreset = &onreset;
    if (level.idleflagreturntime > 0) {
        flag.autoresettime = level.idleflagreturntime;
    } else {
        flag.autoresettime = undefined;
    }
    flag.var_ac304f56 = 1;
    return flag;
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xde77cced, Offset: 0x2738
// Size: 0x1f8
function createflagzone(trigger) {
    visuals = [];
    entityteam = util::function_6f4ff113(trigger.script_team);
    flagzone = gameobjects::create_use_object(entityteam, trigger, visuals, (0, 0, 0), entityteam + "_base");
    flagzone gameobjects::allow_use(#"hash_150a20fa4efc5c7a");
    flagzone gameobjects::set_use_time(0);
    flagzone gameobjects::set_use_text(#"mp/capturing_flag");
    flagzone gameobjects::set_visible(#"hash_150a20fa4efc5c7a");
    enemyteam = util::getotherteam(entityteam);
    flagzone gameobjects::set_key_object(level.teamflags[enemyteam]);
    flagzone.onuse = &oncapture;
    flag = level.teamflags[entityteam];
    flag.flagbase = flagzone;
    flagzone.flag = flag;
    flagzone createflagspawninfluencer(entityteam);
    var_e68cc7ba = spawn("trigger_radius", trigger.origin, 120);
    smart_cover::function_18f38647(var_e68cc7ba);
    concertina_wire::function_18f38647(var_e68cc7ba);
    return flagzone;
}

// Namespace ctf/ctf
// Params 2, eflags: 0x0
// Checksum 0xb1f59419, Offset: 0x2938
// Size: 0xc8
function createflaghint(*team, origin) {
    radius = 128;
    height = 64;
    trigger = spawn("trigger_radius", origin, 0, radius, height);
    trigger sethintstring(#"hash_479e7adbf3e4f211");
    trigger setcursorhint("HINT_NOICON");
    trigger.original_origin = origin;
    trigger turn_off();
    return trigger;
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xf79f0d51, Offset: 0x2a08
// Size: 0x3ac
function ctf() {
    level.flags = [];
    level.teamflags = [];
    level.flagzones = [];
    level.teamflagzones = [];
    flag_triggers = getentarray("ctf_flag_pickup_trig", "targetname");
    if (!isdefined(flag_triggers) || flag_triggers.size != 2) {
        /#
            util::error("ctf_carrier_friendly");
        #/
        return;
    }
    for (index = 0; index < flag_triggers.size; index++) {
        trigger = flag_triggers[index];
        flag = createflag(trigger);
        team = flag gameobjects::get_owner_team();
        flag.ctf_team = team;
        level.flags[level.flags.size] = flag;
        level.teamflags[team] = flag;
    }
    flag_zones = getentarray("ctf_flag_zone_trig", "targetname");
    if (!isdefined(flag_zones) || flag_zones.size != 2) {
        /#
            util::error("<unknown string>");
        #/
        return;
    }
    for (index = 0; index < flag_zones.size; index++) {
        trigger = flag_zones[index];
        flagzone = createflagzone(trigger);
        team = flagzone gameobjects::get_owner_team();
        level.flagzones[level.flagzones.size] = flagzone;
        level.teamflagzones[team] = flagzone;
        level.flaghints[team] = createflaghint(team, trigger.origin);
        facing_angle = getdvarint(#"scr_ctf_spawnpointfacingangle", 0);
    }
    var_786a6f75 = getent("ctf_flag_allies_base", "targetname");
    var_846ab111 = getent("ctf_flag_axis_base", "targetname");
    if (isdefined(var_786a6f75) && isdefined(var_846ab111)) {
        if (game.switchedsides) {
            var_b226f916 = var_786a6f75.origin;
            var_786a6f75.origin = var_846ab111.origin;
            var_846ab111.origin = var_b226f916;
        }
        var_786a6f75.team = #"allies";
        playfxontag(#"hash_56da9f8d4180ae4b", var_786a6f75, "tag_origin");
        var_846ab111.team = #"axis";
        playfxontag(#"hash_47e717b473ae9708", var_846ab111, "tag_origin");
    }
    level thread function_d45df32e();
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x696cc7b7, Offset: 0x2dc0
// Size: 0xf0
function function_d45df32e() {
    level endon(#"game_ended");
    while (level.inprematchperiod) {
        waitframe(1);
    }
    foreach (flag in level.flags) {
        if (isdefined(flag.visuals[0])) {
            flag clientfield::set("entityModelsNum", flag.visuals[0] getentitynumber());
        }
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x1c53a170, Offset: 0x2eb8
// Size: 0xcc
function ctf_icon_hide() {
    level waittill(#"game_ended");
    if (isdefined(level.teamflags[#"allies"])) {
        level.teamflags[#"allies"] gameobjects::set_visible(#"hash_161f03feaadc9b8f");
    }
    if (isdefined(level.teamflags[#"axis"])) {
        level.teamflags[#"axis"] gameobjects::set_visible(#"hash_161f03feaadc9b8f");
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x17ebd882, Offset: 0x2f90
// Size: 0xa6
function removeinfluencers() {
    if (isdefined(self.spawn_influencer_enemy_carrier)) {
        self influencers::remove_influencer(self.spawn_influencer_enemy_carrier);
        self.spawn_influencer_enemy_carrier = undefined;
    }
    if (isdefined(self.spawn_influencer_friendly_carrier)) {
        self influencers::remove_influencer(self.spawn_influencer_friendly_carrier);
        self.spawn_influencer_friendly_carrier = undefined;
    }
    if (isdefined(self.spawn_influencer_dropped)) {
        self.trigger influencers::remove_influencer(self.spawn_influencer_dropped);
        self.spawn_influencer_dropped = undefined;
    }
}

// Namespace ctf/ctf
// Params 2, eflags: 0x0
// Checksum 0xc0fd7d29, Offset: 0x3040
// Size: 0x9a
function function_d1b40f6e(flagteam, var_f1930417) {
    switch (flagteam) {
    case #"allies":
        level clientfield::set_world_uimodel("CTFLevelInfo.flagStateAllies", var_f1930417);
        break;
    case #"axis":
    default:
        level clientfield::set_world_uimodel("CTFLevelInfo.flagStateAxis", var_f1930417);
        break;
    }
}

// Namespace ctf/ctf
// Params 2, eflags: 0x0
// Checksum 0xc9593631, Offset: 0x30e8
// Size: 0x132
function function_18d7960(flagteam, player) {
    entnum = int(min(getdvarint(#"com_maxclients", 0), pow(2, 7))) - 1;
    if (isdefined(player)) {
        entnum = player getentitynumber();
    }
    switch (flagteam) {
    case #"allies":
        level clientfield::set_world_uimodel("CTFLevelInfo.flagCarrierAllies", entnum);
        break;
    case #"axis":
    default:
        level clientfield::set_world_uimodel("CTFLevelInfo.flagCarrierAxis", entnum);
        break;
    }
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x90d76203, Offset: 0x3228
// Size: 0x67c
function ondrop(player) {
    self gameobjects::set_flags(1);
    self gameobjects::set_owner_team(util::get_enemy_team(self.team));
    flag_allies = getplayers(self.team);
    foreach (var_ba17692e in flag_allies) {
        objective_setvisibletoplayer(self.objectiveid, var_ba17692e);
    }
    team = self gameobjects::get_owner_team();
    otherteam = util::getotherteam(team);
    function_18d7960(team, undefined);
    function_d1b40f6e(team, 1);
    if (isdefined(self.var_94885886)) {
        self.var_94885886 delete();
    }
    if (isdefined(self.var_fa01a5fa)) {
        self.var_fa01a5fa delete();
    }
    util::function_a3f7de13(26, player.team, player getentitynumber());
    bb::function_95a5b5c2("ctf_flagdropped", undefined, team, self.origin);
    self.visuals[0] clientfield::set("ctf_flag_away", 1);
    self function_ef8d5fb5();
    if (level.touchreturn) {
        self gameobjects::allow_carry(#"hash_5ccfd7bbbf07c770");
        level.flaghints[otherteam] turn_off();
    }
    if (isdefined(player)) {
        util::printandsoundoneveryone(team, undefined, #"", undefined, "mp_war_objective_lost");
        level thread popups::displayteammessagetoteam(#"hash_3118e621ec8d35b8", player, team, undefined, undefined, 4, 1);
        level thread popups::displayteammessagetoteam(#"hash_6730bd6c7d8d0567", player, otherteam, undefined, undefined, 4, 2);
    } else {
        util::printandsoundoneveryone(team, undefined, #"", undefined, "mp_war_objective_lost");
    }
    globallogic_audio::leader_dialog("ctfFriendlyFlagDropped", team, "ctf_flag");
    globallogic_audio::leader_dialog("ctfEnemyFlagDropped", otherteam, "ctf_flag_enemy");
    /#
        if (isdefined(player)) {
            print(team + "<unknown string>");
        } else {
            print(team + "<unknown string>");
        }
    #/
    if (isdefined(player)) {
        player playlocalsound(#"mpl_flag_drop_plr");
    }
    globallogic_audio::play_2d_on_team("mpl_flagdrop_sting_friend", otherteam);
    globallogic_audio::play_2d_on_team("mpl_flagdrop_sting_enemy", team);
    if (level.touchreturn) {
        self gameobjects::set_3d_icon(#"hash_150a20fa4efc5c7a", level.iconreturn3d);
        self gameobjects::set_2d_icon(#"hash_150a20fa4efc5c7a", level.iconreturn2d);
    } else {
        self gameobjects::set_3d_icon(#"hash_150a20fa4efc5c7a", level.icondropped3d);
        self gameobjects::set_2d_icon(#"hash_150a20fa4efc5c7a", level.icondropped2d);
    }
    self gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
    self gameobjects::set_3d_icon(#"hash_33c49a99551acae7", level.iconcapture3d);
    self gameobjects::set_2d_icon(#"hash_33c49a99551acae7", level.iconcapture2d);
    thread sound::play_on_players(game.flag_dropped_sound, game.attackers);
    self removeinfluencers();
    if (isdefined(player)) {
        player removeinfluencers();
    }
    ss = level.spawnsystem;
    player_team_mask = util::getteammask(otherteam);
    enemy_team_mask = util::getteammask(team);
    self.spawn_influencer_dropped = self.trigger influencers::create_entity_influencer("ctf_flag_dropped", player_team_mask | enemy_team_mask);
    setinfluencertimeout(self.spawn_influencer_dropped, level.idleflagreturntime);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xec2c0fc8, Offset: 0x38b0
// Size: 0xcea
function onpickup(player) {
    carrierkilledby = self.carrierkilledby;
    self.carrierkilledby = undefined;
    if (isdefined(self.spawn_influencer_dropped)) {
        self.trigger influencers::remove_influencer(self.spawn_influencer_dropped);
        self.spawn_influencer_dropped = undefined;
    }
    player stats::function_bb7eedf0(#"pickups", 1);
    if (level.touchreturn) {
        self gameobjects::allow_carry(#"hash_33c49a99551acae7");
    }
    self removeinfluencers();
    team = self gameobjects::get_owner_team();
    otherteam = util::getotherteam(team);
    if (isdefined(player) && player.pers[#"team"] == team) {
        self notify(#"picked_up");
        util::printandsoundoneveryone(team, undefined, #"", undefined, "mp_obj_returned");
        if (isdefined(player.pers[#"returns"])) {
            player.pers[#"returns"]++;
            player.returns = player.pers[#"returns"];
        }
        if (isdefined(carrierkilledby) && carrierkilledby == player) {
            scoreevents::processscoreevent(#"flag_carrier_kill_return_close", player, undefined, undefined);
        } else if (distancesquared(self.trigger.baseorigin, player.origin) > 90000) {
            scoreevents::processscoreevent(#"flag_return", player, undefined, undefined);
        }
        demo::bookmark(#"event", gettime(), player);
        potm::bookmark(#"event", gettime(), player);
        player stats::function_bb7eedf0(#"returns", 1);
        level thread popups::displayteammessagetoteam(#"hash_347504f7414c2861", player, team, undefined, undefined, 4, 1, 1);
        level thread popups::displayteammessagetoteam(#"hash_565752dc258425f0", player, otherteam, undefined, undefined, 4, 2, 1);
        self.visuals[0] clientfield::set("ctf_flag_away", 0);
        self gameobjects::set_flags(0);
        self function_ef8d5fb5();
        bb::function_95a5b5c2("ctf_flagreturn", undefined, team, player.origin);
        player recordgameevent("return");
        level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#player:player, #eventtype:#"return"});
        [[ level.var_37d62931 ]](player, 1);
        self returnflag();
        /#
            if (isdefined(player)) {
                print(team + "<unknown string>");
            } else {
                print(team + "<unknown string>");
            }
        #/
        util::function_a3f7de13(12, player.team, player getentitynumber());
        return;
    }
    bb::function_95a5b5c2("ctf_flagpickup", undefined, team, player.origin);
    player recordgameevent("pickup");
    level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#player:player, #eventtype:#"pickup"});
    util::function_a3f7de13(9, player.team, player getentitynumber());
    scoreevents::processscoreevent(#"flag_grab", player, undefined, undefined);
    demo::bookmark(#"event", gettime(), player);
    potm::bookmark(#"event", gettime(), player);
    util::printandsoundoneveryone(otherteam, undefined, #"", undefined, "mp_obj_taken", "mp_enemy_obj_taken");
    level thread popups::displayteammessagetoteam(#"hash_6b94e754d048dae9", player, team, undefined, undefined, 4, 1);
    level thread popups::displayteammessagetoteam(#"hash_25ed0737f009ca72", player, otherteam, undefined, undefined, 4, 2);
    globallogic_audio::leader_dialog("ctfFriendlyFlagTaken", team, "ctf_flag");
    globallogic_audio::leader_dialog("ctfEnemyFlagTaken", otherteam, "ctf_flag_enemy");
    player.isflagcarrier = 1;
    player.flagcarried = self;
    player playlocalsound(#"mpl_flag_pickup_plr");
    player clientfield::set("ctf_flag_carrier", 1);
    player clientfield::set("ctf_flag_carried", 1);
    self gameobjects::set_flags(0);
    self gameobjects::set_owner_team(util::get_enemy_team(self.team));
    function_18d7960(team, player);
    function_d1b40f6e(team, 2);
    flagorigin = player gettagorigin("tag_stowed_back");
    tagangles = player gettagangles("j_spineupper");
    var_23c6d66c = anglestoright(tagangles);
    var_167c23b1 = anglestoforward(tagangles);
    var_cfd0f67d = axistoangles(var_23c6d66c, var_167c23b1);
    self.var_94885886 = util::spawn_model(level.var_537d7278[team].friendly, flagorigin, var_cfd0f67d);
    self.var_94885886 setinvisibletoall();
    self.var_94885886 setvisibletoteam(team);
    self.var_94885886 setinvisibletoplayer(player);
    self.var_94885886 linkto(player, "tag_stowed_back");
    self.var_fa01a5fa = util::spawn_model(level.var_537d7278[team].enemy, flagorigin, var_cfd0f67d);
    self.var_fa01a5fa setinvisibletoall();
    self.var_fa01a5fa setvisibletoteam(otherteam);
    self.var_fa01a5fa setinvisibletoplayer(player);
    self.var_fa01a5fa linkto(player, "tag_stowed_back");
    flag_allies = getplayers(util::get_enemy_team(self.team));
    foreach (var_ba17692e in flag_allies) {
        objective_setinvisibletoplayer(self.objectiveid, var_ba17692e);
    }
    globallogic_audio::play_2d_on_team("mpl_flagget_sting_friend", otherteam);
    globallogic_audio::play_2d_on_team("mpl_flagget_sting_enemy", team);
    if (level.enemycarriervisible) {
        self gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
    } else {
        self gameobjects::set_visible(#"hash_33c49a99551acae7");
    }
    self gameobjects::set_2d_icon(#"hash_150a20fa4efc5c7a", level.iconkill2d);
    self gameobjects::set_3d_icon(#"hash_150a20fa4efc5c7a", level.iconkill3d);
    self gameobjects::set_2d_icon(#"hash_33c49a99551acae7", level.iconescort2d);
    self gameobjects::set_3d_icon(#"hash_33c49a99551acae7", level.iconescort3d);
    player thread claim_trigger(level.flaghints[otherteam]);
    update_hints();
    /#
        print(team + "<unknown string>");
    #/
    ss = level.spawnsystem;
    player_team_mask = util::getteammask(otherteam);
    enemy_team_mask = util::getteammask(team);
    player.spawn_influencer_friendly_carrier = player influencers::create_entity_influencer("ctf_carrier_friendly", player_team_mask);
    player.spawn_influencer_enemy_carrier = player influencers::create_entity_influencer("ctf_carrier_enemy", enemy_team_mask);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x9a974ee5, Offset: 0x45a8
// Size: 0x32
function onpickupmusicstate(player) {
    self endon(#"death");
    wait(6);
    if (player.isflagcarrier) {
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x5e621220, Offset: 0x45e8
// Size: 0x38
function ishome() {
    if (isdefined(self.carrier)) {
        return false;
    }
    if (self.curorigin != self.trigger.baseorigin) {
        return false;
    }
    return true;
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x5d3558d7, Offset: 0x4628
// Size: 0x26c
function returnflag() {
    team = self gameobjects::get_owner_team();
    otherteam = util::getotherteam(team);
    function_18d7960(team, undefined);
    function_d1b40f6e(team, 0);
    globallogic_audio::play_2d_on_team("mpl_flagreturn_sting", team);
    globallogic_audio::play_2d_on_team("mpl_flagreturn_sting", otherteam);
    level.teamflagzones[otherteam] gameobjects::allow_use(#"hash_150a20fa4efc5c7a");
    level.teamflagzones[otherteam] gameobjects::set_visible(#"hash_150a20fa4efc5c7a");
    update_hints();
    if (level.touchreturn) {
        self gameobjects::allow_carry(#"hash_33c49a99551acae7");
    }
    self gameobjects::return_home();
    self gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
    self gameobjects::set_3d_icon(#"hash_150a20fa4efc5c7a", level.icondefend3d);
    self gameobjects::set_2d_icon(#"hash_150a20fa4efc5c7a", level.icondefend2d);
    self gameobjects::set_3d_icon(#"hash_33c49a99551acae7", level.iconcapture3d);
    self gameobjects::set_2d_icon(#"hash_33c49a99551acae7", level.iconcapture2d);
    globallogic_audio::leader_dialog("ctfFriendlyFlagReturned", team, "ctf_flag");
    globallogic_audio::leader_dialog("ctfEnemyFlagReturned", otherteam, "ctf_flag_enemy");
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xf95a1ade, Offset: 0x48a0
// Size: 0x154
function function_883c46cc(team) {
    wait(2);
    if (isdefined(game.stat[#"roundswon"])) {
        alliesroundswon = game.stat[#"roundswon"][#"allies"];
        axisroundswon = game.stat[#"roundswon"][#"axis"];
        if (team == #"allies") {
            alliesroundswon--;
        } else {
            axisroundswon--;
        }
        game.stat[#"roundswon"][#"allies"] = alliesroundswon;
        game.stat[#"roundswon"][#"axis"] = axisroundswon;
        clientfield::set_world_uimodel("hudItems.team1.roundsWon", alliesroundswon);
        clientfield::set_world_uimodel("hudItems.team2.roundsWon", axisroundswon);
    }
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x619e7aca, Offset: 0x4a00
// Size: 0x7fc
function oncapture(player) {
    team = player.pers[#"team"];
    enemyteam = util::getotherteam(team);
    time = gettime();
    playerteamsflag = level.teamflags[team];
    if (level.flagcapturecondition == 1 && playerteamsflag gameobjects::is_object_away_from_home()) {
        return;
    }
    if (overtime::is_overtime_round()) {
        besttime = int(float(globallogic_utils::gettimepassed()) / 1000);
        if ((isdefined(game.var_8f9c5645[team]) ? game.var_8f9c5645[team] : 0) != 0) {
            besttime = min(besttime, game.var_8f9c5645[team]);
        }
        game.var_8f9c5645[team] = besttime;
        level thread function_883c46cc(team);
        [[ level._setteamscore ]](team, 1);
    }
    if (!isdefined(player.carryobject)) {
        return;
    }
    if (isdefined(player.carryobject.var_94885886)) {
        player.carryobject.var_94885886 delete();
    }
    if (isdefined(player.carryobject.var_fa01a5fa)) {
        player.carryobject.var_fa01a5fa delete();
    }
    util::printandsoundoneveryone(team, undefined, #"", undefined, "mp_obj_captured", "mp_enemy_obj_captured");
    bb::function_95a5b5c2("ctf_flagcapture", undefined, enemyteam, player.origin);
    game.challenge[team][#"capturedflag"] = 1;
    if (isdefined(player.pers[#"captures"])) {
        player.pers[#"captures"]++;
        player.captures = player.pers[#"captures"];
    }
    [[ level.var_37d62931 ]](player, 1);
    demo::bookmark(#"event", gettime(), player);
    potm::bookmark(#"event", gettime(), player);
    player stats::function_bb7eedf0(#"captures", 1);
    player stats::function_bb7eedf0(#"captures_in_capture_area", 1);
    player contracts::increment_contract(#"contract_mp_objective_capture");
    player globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
    level thread popups::displayteammessagetoteam(#"hash_97b6e279104e355", player, team, undefined, undefined, 4, 1, 1);
    level thread popups::displayteammessagetoteam(#"hash_352c694daa4f9440", player, enemyteam, undefined, undefined, 4, 2, 1);
    globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_enemy", enemyteam);
    globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_friend", team);
    player giveflagcapturexp(player);
    /#
        print(enemyteam + "<unknown string>");
    #/
    flag = player.carryobject;
    player challenges::capturedobjective(time, flag.trigger);
    flag.dontannouncereturn = 1;
    flag gameobjects::return_home();
    flag gameobjects::set_owner_team(util::get_enemy_team(flag.team));
    flag.dontannouncereturn = undefined;
    flag_allies = getplayers(flag.team);
    foreach (var_ba17692e in flag_allies) {
        objective_setvisibletoplayer(flag.objectiveid, var_ba17692e);
    }
    otherteam = util::getotherteam(team);
    level.teamflags[otherteam] gameobjects::allow_carry(#"hash_33c49a99551acae7");
    level.teamflags[otherteam] gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
    level.teamflags[otherteam] gameobjects::return_home();
    level.teamflagzones[otherteam] gameobjects::allow_use(#"hash_150a20fa4efc5c7a");
    player.isflagcarrier = 0;
    player.flagcarried = undefined;
    player clientfield::set("ctf_flag_carrier", 0);
    player clientfield::set("ctf_flag_carried", 0);
    function_18d7960(enemyteam, undefined);
    function_d1b40f6e(team, 0);
    globallogic_score::giveteamscoreforobjective(team, 1);
    globallogic_audio::leader_dialog("ctfEnemyFlagCaptured", team, "ctf_flag_enemy");
    globallogic_audio::leader_dialog("ctfFriendlyFlagCaptured", enemyteam, "ctf_flag");
    flag removeinfluencers();
    player removeinfluencers();
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xdf88f8ea, Offset: 0x5208
// Size: 0xd4
function giveflagcapturexp(player) {
    scoreevents::processscoreevent(#"flag_capture", player, undefined, undefined);
    player recordgameevent("capture");
    level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#player:player, #eventtype:#"capture"});
    util::function_a3f7de13(10, player.team, player getentitynumber());
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x50a2a096, Offset: 0x52e8
// Size: 0x214
function onreset() {
    update_hints();
    team = self gameobjects::get_owner_team();
    self gameobjects::set_3d_icon(#"hash_150a20fa4efc5c7a", level.icondefend3d);
    self gameobjects::set_2d_icon(#"hash_150a20fa4efc5c7a", level.icondefend2d);
    self gameobjects::set_3d_icon(#"hash_33c49a99551acae7", level.iconcapture3d);
    self gameobjects::set_2d_icon(#"hash_33c49a99551acae7", level.iconcapture2d);
    if (level.touchreturn) {
        self gameobjects::allow_carry(#"hash_33c49a99551acae7");
        self.trigger triggerenable(1);
    }
    level.teamflagzones[team] gameobjects::set_visible(#"hash_150a20fa4efc5c7a");
    level.teamflagzones[team] gameobjects::allow_use(#"hash_150a20fa4efc5c7a");
    self.visuals[0] clientfield::set("ctf_flag_away", 0);
    self gameobjects::set_flags(0);
    function_d1b40f6e(team, 0);
    self function_ef8d5fb5();
    self removeinfluencers();
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xa9fdb4e1, Offset: 0x5508
// Size: 0x40
function getotherflag(flag) {
    if (flag == level.flags[0]) {
        return level.flags[1];
    }
    return level.flags[0];
}

// Namespace ctf/ctf
// Params 9, eflags: 0x0
// Checksum 0xeb9e313d, Offset: 0x5550
// Size: 0x994
function onplayerkilled(*einflictor, attacker, *idamage, *smeansofdeath, weapon, *vdir, *shitloc, *psoffsettime, *deathanimduration) {
    if (isdefined(psoffsettime) && isplayer(psoffsettime)) {
        for (index = 0; index < level.flags.size; index++) {
            flagteam = "invalidTeam";
            inflagradius = 0;
            defendedflag = 0;
            offendedflag = 0;
            flagcarrier = level.flags[index].carrier;
            if (isdefined(flagcarrier)) {
                flagorigin = level.flags[index].carrier.origin;
                iscarried = 1;
                if (isplayer(psoffsettime) && psoffsettime.pers[#"team"] != self.pers[#"team"]) {
                    if (isdefined(level.flags[index].carrier.attackerdata)) {
                        if (level.flags[index].carrier != psoffsettime) {
                            if (isdefined(level.flags[index].carrier.attackerdata[self.clientid])) {
                                scoreevents::processscoreevent(#"rescue_flag_carrier", psoffsettime, undefined, deathanimduration);
                            }
                        }
                    }
                }
            } else {
                flagorigin = level.flags[index].curorigin;
                iscarried = 0;
            }
            dist = distance2dsquared(self.origin, flagorigin);
            if (dist < level.defaultoffenseradiussq) {
                inflagradius = 1;
                if (level.flags[index].ctf_team == psoffsettime.pers[#"team"]) {
                    defendedflag = 1;
                } else {
                    offendedflag = 1;
                }
            }
            dist = distance2dsquared(psoffsettime.origin, flagorigin);
            if (dist < level.defaultoffenseradiussq) {
                inflagradius = 1;
                if (level.flags[index].ctf_team == psoffsettime.pers[#"team"]) {
                    defendedflag = 1;
                } else {
                    offendedflag = 1;
                }
            }
            if (inflagradius && isplayer(psoffsettime) && psoffsettime.pers[#"team"] != self.pers[#"team"]) {
                psoffsettime challenges::function_82bb78f7(deathanimduration, self);
                psoffsettime.pers[#"objectiveekia"]++;
                psoffsettime.objectiveekia = psoffsettime.pers[#"objectiveekia"];
                if (defendedflag) {
                    if (isdefined(self.isflagcarrier) && self.isflagcarrier) {
                        scoreevents::processscoreevent(#"kill_flag_carrier", psoffsettime, undefined, deathanimduration);
                        psoffsettime stats::function_dad108fa(#"kill_carrier", 1);
                    } else {
                        scoreevents::processscoreevent(#"killed_attacker", psoffsettime, undefined, deathanimduration);
                    }
                    level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#player:self, #var_bdc4bbd2:#"assaulting"});
                }
                if (offendedflag) {
                    if (iscarried == 1) {
                        if (isdefined(flagcarrier) && psoffsettime == flagcarrier) {
                            scoreevents::processscoreevent(#"killed_enemy_while_carrying_flag", psoffsettime, undefined, deathanimduration);
                        } else {
                            scoreevents::processscoreevent(#"defend_flag_carrier", psoffsettime, undefined, deathanimduration);
                            psoffsettime stats::function_dad108fa(#"defend_carrier", 1);
                        }
                    } else {
                        scoreevents::processscoreevent(#"killed_defender", psoffsettime, undefined, deathanimduration);
                    }
                    level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#player:self, #var_bdc4bbd2:#"defending"});
                }
            }
        }
        victim = self;
        foreach (flag_zone in level.flagzones) {
            if (isdefined(psoffsettime.team) && psoffsettime != victim && isdefined(victim.team)) {
                dist_to_zone_origin = distance2dsquared(psoffsettime.origin, flag_zone.origin);
                victim_dist_to_zone_origin = distance2dsquared(victim.origin, flag_zone.origin);
                if (victim_dist_to_zone_origin < level.defaultoffenseradiussq || dist_to_zone_origin < level.defaultoffenseradiussq) {
                    if (victim.team == flag_zone.team) {
                        psoffsettime thread challenges::killedbasedefender(flag_zone.trigger);
                        continue;
                    }
                    psoffsettime thread challenges::killedbaseoffender(flag_zone.trigger, deathanimduration);
                }
            }
        }
    }
    if (!isdefined(self.isflagcarrier) || !self.isflagcarrier) {
        return;
    }
    if (isdefined(psoffsettime) && isplayer(psoffsettime) && psoffsettime.pers[#"team"] != self.pers[#"team"]) {
        if (isdefined(self.flagcarried)) {
            for (index = 0; index < level.flags.size; index++) {
                currentflag = level.flags[index];
                if (currentflag.ctf_team == self.team) {
                    if (currentflag.curorigin == currentflag.trigger.baseorigin) {
                        dist = distance2dsquared(self.origin, currentflag.curorigin);
                        if (dist < level.defaultoffenseradiussq) {
                            self.flagcarried.carrierkilledby = psoffsettime;
                            break;
                        }
                    }
                }
            }
        }
        psoffsettime recordgameevent("kill_carrier");
        level thread telemetry::function_18135b72(#"hash_540cddd637f71a5e", {#player:psoffsettime, #eventtype:#"kill_carrier"});
        level thread telemetry::function_18135b72(#"hash_37f96a1d3c57a089", {#player:self, #var_bdc4bbd2:#"carrying"});
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xeef05dd0, Offset: 0x5ef0
// Size: 0x22
function turn_on() {
    if (level.hardcoremode) {
        return;
    }
    self.origin = self.original_origin;
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xa5b26766, Offset: 0x5f20
// Size: 0x3a
function turn_off() {
    self.origin = (self.original_origin[0], self.original_origin[1], self.original_origin[2] - 10000);
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x57a39c08, Offset: 0x5f68
// Size: 0x164
function update_hints() {
    allied_flag = level.teamflags[#"allies"];
    axis_flag = level.teamflags[#"axis"];
    if (!level.touchreturn) {
        return;
    }
    if (isdefined(allied_flag.carrier) && axis_flag gameobjects::is_object_away_from_home()) {
        level.flaghints[#"axis"] turn_on();
    } else {
        level.flaghints[#"axis"] turn_off();
    }
    if (isdefined(axis_flag.carrier) && allied_flag gameobjects::is_object_away_from_home()) {
        level.flaghints[#"allies"] turn_on();
        return;
    }
    level.flaghints[#"allies"] turn_off();
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xaf2d555d, Offset: 0x60d8
// Size: 0x64
function claim_trigger(trigger) {
    self endon(#"disconnect");
    self clientclaimtrigger(trigger);
    self waittill(#"drop_object");
    self clientreleasetrigger(trigger);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x18eaf387, Offset: 0x6148
// Size: 0xda
function createflagspawninfluencer(entityteam) {
    otherteam = util::getotherteam(entityteam);
    team_mask = util::getteammask(entityteam);
    other_team_mask = util::getteammask(otherteam);
    self.spawn_influencer_friendly = self influencers::create_influencer("ctf_base_friendly", self.trigger.origin, team_mask);
    self.spawn_influencer_enemy = self influencers::create_influencer("ctf_base_friendly", self.trigger.origin, other_team_mask);
}

// Namespace ctf/ctf
// Params 4, eflags: 0x0
// Checksum 0xf3175fdd, Offset: 0x6230
// Size: 0x44
function function_17ae20ae(*einflictor, *attacker, *smeansofdeath, *weapon) {
    if (isdefined(self.isflagcarrier) && self.isflagcarrier) {
        return true;
    }
    return false;
}

// Namespace ctf/ctf
// Params 0, eflags: 0x4
// Checksum 0xc63cdc59, Offset: 0x6280
// Size: 0x1f4
function private ontimelimit() {
    winner = teams::function_d85770f0("teamScores");
    if (util::isfirstround() && !isdefined(winner)) {
        game.stat[#"teamscores"][#"allies"] = 1;
        game.stat[#"teamscores"][#"axis"] = 1;
        setteamscore(#"allies", game.stat[#"teamscores"][#"allies"]);
        setteamscore(#"axis", game.stat[#"teamscores"][#"axis"]);
        game.stat[#"roundswon"][#"allies"] = 1;
        game.stat[#"roundswon"][#"axis"] = 1;
        level.var_933889c0 = 1;
        thread globallogic::end_round(2);
        return;
    }
    if (isdefined(winner)) {
        thread globallogic::function_a3e3bd39(winner, 2);
        return;
    }
    thread globallogic::end_round(2);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xb825fd9b, Offset: 0x6480
// Size: 0x34e
function function_a5f40b8e(player) {
    if (!isdefined(player)) {
        return false;
    }
    if (isdefined(self.droptime) && self.droptime >= gettime()) {
        return false;
    }
    if (isdefined(player.resurrect_weapon) && player getcurrentweapon() == player.resurrect_weapon) {
        return false;
    }
    if (player iscarryingturret()) {
        return false;
    }
    currentweapon = player getcurrentweapon();
    if (isdefined(currentweapon)) {
        if (!function_da0a9f3c(currentweapon)) {
            return false;
        }
    }
    nextweapon = player.changingweapon;
    if (isdefined(nextweapon) && player isswitchingweapons()) {
        if (!function_da0a9f3c(nextweapon)) {
            return false;
        }
    }
    if (player player_no_pickup_time()) {
        return false;
    }
    flag = self.visuals[0];
    thresh = 15;
    dist2 = distance2dsquared(flag.origin, player.origin);
    if (dist2 < thresh * thresh) {
        return true;
    }
    start = player geteye();
    end = (self.curorigin[0], self.curorigin[1], self.curorigin[2] + 5);
    if (isdefined(flag)) {
        end = (flag.origin[0], flag.origin[1], flag.origin[2] + 5);
    }
    if (isdefined(self.carrier) && isplayer(self.carrier)) {
        end = self.carrier geteye();
    }
    first_skip_ent = flag;
    second_skip_ent = flag;
    if (isdefined(self.projectile)) {
        first_skip_ent = self.projectile;
    }
    if (isdefined(self.lastprojectile)) {
        second_skip_ent = self.lastprojectile;
    }
    if (!bullettracepassed(end, start, 0, first_skip_ent, second_skip_ent, 0, 0)) {
        player_origin = (player.origin[0], player.origin[1], player.origin[2] + 10);
        if (!bullettracepassed(end, player_origin, 0, first_skip_ent, second_skip_ent, 0, 0)) {
            return false;
        }
    }
    return true;
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x285f7d56, Offset: 0x67d8
// Size: 0x6e
function function_da0a9f3c(weapon) {
    if (weapon == level.weaponnone) {
        return false;
    }
    if (weapon == getweapon("ball")) {
        return false;
    }
    if (killstreaks::is_killstreak_weapon(weapon)) {
        return false;
    }
    return true;
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xa202efd0, Offset: 0x6850
// Size: 0x1c
function player_no_pickup_time() {
    return isdefined(self.nopickuptime) && self.nopickuptime > gettime();
}

// Namespace ctf/grenade_stuck
// Params 1, eflags: 0x20
// Checksum 0x142ac0b9, Offset: 0x6878
// Size: 0xa8
function event_handler[grenade_stuck] function_de1402a2(eventstruct) {
    waitframe(1);
    foreach (flag in level.flags) {
        if (eventstruct.hitent === flag) {
            flag function_ef8d5fb5();
        }
    }
}

