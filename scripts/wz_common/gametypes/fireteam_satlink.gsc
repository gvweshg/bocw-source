// Atian COD Tools GSC CW decompiler test
#using script_4e6bcfa8856b2a96;
#using script_b9a55edd207e4ca;
#using script_46192c58ea066d7f;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using script_335d0650ed05d36d;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using script_471b31bd963b388e;
#using scripts\core_common\item_world.gsc;
#using scripts\core_common\item_drop.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace fireteam_satlink;

// Namespace fireteam_satlink/fireteam_satlink
// Params 0, eflags: 0x5
// Checksum 0x59dde666, Offset: 0x490
// Size: 0x44
function private autoexec __init__system__() {
    system::register(#"hash_5979e232eb205c7c", &function_62730899, undefined, undefined, #"territory");
}

// Namespace fireteam_satlink/gametype_init
// Params 1, eflags: 0x20
// Checksum 0x4be9f88c, Offset: 0x4e0
// Size: 0x82e
function event_handler[gametype_init] main(*eventstruct) {
    namespace_2938acdc::init();
    namespace_234f0efc::init();
    spawning::addsupportedspawnpointtype("tdm");
    level.onstartgametype = &onstartgametype;
    level.var_1de522ea = &function_1de522ea;
    level.var_edde2f10 = &function_edde2f10;
    callback::on_player_killed(&on_player_killed);
    level callback::add_callback(#"hash_259e3bcba73a2f14", &function_c0e544cc);
    clientfield::register_clientuimodel("hudItems.uraniumCarryCount", 1, 4, "int");
    clientfield::register_clientuimodel("hudItems.uraniumMaxCarry", 1, 4, "int");
    clientfield::register_clientuimodel("hudItems.uraniumFullCarry", 1, 1, "int");
    clientfield::register_clientuimodel("hudItems.carryingLargeBattery", 1, 1, "int");
    clientfield::register("scriptmover", "scriptid", 1, 5, "int");
    clientfield::register("scriptmover", "objectiveCameraID", 1, 3, "int");
    satlinks = struct::get_array("fireteam_satlink", "variantname");
    for (i = 0; i <= satlinks.size; i++) {
        clientfield::function_5b7d846d("hud_items_fireteam.satLinkBoosters." + i + ".activeCount", 1, 4, "int");
        clientfield::function_5b7d846d("hud_items_fireteam.satLinkBoosters." + i + ".expiring", 1, 1, "int");
    }
    level.var_641271fb = dirtybomb_usebar::register();
    level.var_b9f31e66 = isdefined(getgametypesetting(#"hash_3eeecb0a77c21db1")) ? getgametypesetting(#"hash_3eeecb0a77c21db1") : 100;
    level.var_8c05a764 = isdefined(getgametypesetting(#"hash_2e824e2ee213574d")) ? getgametypesetting(#"hash_2e824e2ee213574d") : 10;
    level.var_89a6bd00 = isdefined(getgametypesetting(#"hash_7b5af9a43263b4a9")) ? getgametypesetting(#"hash_7b5af9a43263b4a9") : 15;
    level.var_65a0fe4d = isdefined(getgametypesetting(#"hash_7b3feba4324cd527")) ? getgametypesetting(#"hash_7b3feba4324cd527") : 30;
    level thread namespace_234f0efc::function_8d066de9(level.var_b9f31e66, level.var_89a6bd00, level.var_65a0fe4d, level.var_8c05a764);
    level.var_574cc797 = &namespace_234f0efc::function_588a586d;
    item_world::function_861f348d(#"hash_75a7db904ba5faed", &function_18f58ab2);
    level.var_d539e0dd = &function_3f63e44f;
    setdvar(#"scr_maxinventory_scorestreaks", 1);
    level.var_e2636f91 = 0;
    level.var_3ea9068a = [];
    level.var_3ea9068a[0] = #"hash_1e3ef2884672600f";
    level.var_3ea9068a[1] = #"hash_1e3ef388467261c2";
    level.var_3ea9068a[2] = #"hash_1e3ef48846726375";
    level.var_3ea9068a[3] = #"hash_1e3eed8846725790";
    level.var_3ea9068a[4] = #"hash_1e3eee8846725943";
    level.var_3ea9068a[5] = #"hash_1e3eef8846725af6";
    level.var_3ea9068a[6] = #"hash_1e3ef08846725ca9";
    level.var_44565297 = getweapon(#"hash_7394b28b8f9b6d60");
    level.var_6f3f9c56 = isdefined(getgametypesetting(#"capturetime")) ? getgametypesetting(#"capturetime") : 20;
    level.var_ad91ffcf = isdefined(getgametypesetting(#"hash_448f94b2a3abdbb9")) ? getgametypesetting(#"hash_448f94b2a3abdbb9") : 6;
    level.var_4b27b03c = isdefined(getgametypesetting(#"hash_f9fc752cf48653")) ? getgametypesetting(#"hash_f9fc752cf48653") : 2;
    level.var_ab27794e = int(120 * 1000);
    level.var_1ff15218 = int((isdefined(getgametypesetting(#"hash_2298689819f46c81")) ? getgametypesetting(#"hash_2298689819f46c81") : 0) * 1000);
    level.var_a9865734 = isdefined(getgametypesetting(#"hash_78b20ae470a01292")) ? getgametypesetting(#"hash_78b20ae470a01292") : 7;
    level.var_34842a14 = 1;
    level.var_ce802423 = 1;
    level.var_97ed7379 = getdvarint(#"hash_3c861ebd76fd24eb");
    /#
        if (getdvarint(#"hash_4b18df8b4341a38b", 0)) {
        }
    #/
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 0, eflags: 0x0
// Checksum 0x54354a32, Offset: 0xd18
// Size: 0x4c
function onstartgametype() {
    level thread function_73ff755a();
    level thread function_962baacc();
    level thread function_a893466c();
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 0, eflags: 0x4
// Checksum 0xf74a635e, Offset: 0xd70
// Size: 0x5c
function private function_62730899() {
    if (isdefined(level.territory) && level.territory.name != "zoo") {
        namespace_2938acdc::function_4212369d();
        namespace_2938acdc::function_20d09030();
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0x191046ff, Offset: 0xdd8
// Size: 0x24
function on_player_killed(*params) {
    self namespace_234f0efc::function_bf29212a();
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0x1dc1788e, Offset: 0xe08
// Size: 0x46
function function_1de522ea(var_4c42f7cf) {
    var_4c42f7cf = self function_2a135bf4(var_4c42f7cf);
    var_4c42f7cf = self function_2025ab1b(var_4c42f7cf + 1);
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 2, eflags: 0x0
// Checksum 0xb865766, Offset: 0xe58
// Size: 0x96
function function_edde2f10(*vehicle, seatindex) {
    var_36dbb87c = is_true(self.var_8c9cccf2) && seatindex == 0;
    if (var_36dbb87c && !isdefined(self.var_85494d43)) {
        self luinotifyevent(#"hash_6b67aa04e378d681", 1, 19);
        self.var_85494d43 = 1;
    }
    return var_36dbb87c;
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x4
// Checksum 0x54c9060c, Offset: 0xef8
// Size: 0x11a
function private function_2a135bf4(var_4c42f7cf) {
    if (!isplayer(self)) {
        assert(0);
        return;
    }
    var_e3483afe = self clientfield::get_player_uimodel("hudItems.uraniumCarryCount");
    self clientfield::set_player_uimodel("hudItems.uraniumCarryCount", 0);
    itempoint = function_4ba8fde("signal_booster_item_t9");
    for (index = 0; index < var_e3483afe; index++) {
        self item_drop::drop_item(var_4c42f7cf + index, undefined, 1, 0, itempoint.id, self.origin, (0, randomintrange(0, 360), 0), 2);
    }
    return var_4c42f7cf + index;
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 0, eflags: 0x0
// Checksum 0x3cba7103, Offset: 0x1020
// Size: 0x486
function function_a893466c() {
    level endon(#"game_ended");
    while (true) {
        time = gettime();
        foreach (satlink in level.satlinks) {
            if (isdefined(satlink.team)) {
                scoreearned = 1;
                var_e3229624 = satlink.var_b534f0c8 + 5 * int(3 * 1000);
                if (time >= var_e3229624 - int(5 * 1000) && time < var_e3229624) {
                    clientfield::set_world_uimodel(satlink.var_9c417693, 1);
                } else {
                    clientfield::set_world_uimodel(satlink.var_9c417693, 0);
                }
                if (time >= var_e3229624) {
                    if (satlink.var_aee3e62d) {
                        satlink.var_a8aaaaa6--;
                    }
                    if (satlink.var_a8aaaaa6 <= 0) {
                        satlink.var_aee3e62d = 0;
                    } else {
                        satlink.var_aee3e62d = 1;
                    }
                    if (satlink.var_aee3e62d) {
                        satlink.var_b534f0c8 = time;
                    }
                }
                if (satlink.var_aee3e62d) {
                    scoreearned++;
                }
                if (satlink.var_e305235f > time) {
                    scoreearned *= 2;
                    satlink.var_9f5ad00f = 1;
                } else if (is_true(satlink.var_9f5ad00f)) {
                    satlink.var_9f5ad00f = 0;
                    if (isdefined(satlink.objectiveid)) {
                        objective_setgamemodeflags(satlink.objectiveid, 0);
                    }
                    teamplayers = getplayers(satlink.team);
                    foreach (player in teamplayers) {
                        if (is_true(player.var_8c9cccf2)) {
                            satlink.var_b20bc5cc setvisibletoplayer(player);
                        }
                    }
                }
                globallogic_score::giveteamscoreforobjective(satlink.team, scoreearned);
                if (level.var_97ed7379 === 1) {
                    teammembers = getplayers(satlink.team);
                    foreach (player in teammembers) {
                        if (!isplayer(player)) {
                            continue;
                        }
                        player stats::function_dad108fa(#"hash_5d76de366ce52bb3", scoreearned);
                    }
                }
            }
            if (clientfield::can_set()) {
                clientfield::set_world_uimodel(satlink.var_cfec45a8, satlink.var_a8aaaaa6);
            }
        }
        level function_28039abb();
        wait(3);
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 0, eflags: 0x0
// Checksum 0xf9efd86f, Offset: 0x14b0
// Size: 0xec
function function_73ff755a() {
    level endon(#"game_ended");
    function_aa9e57ab();
    level flag::wait_till(#"insertion_begin_completed");
    foreach (satlink in level.satlinks) {
        objective_setvisibletoall(satlink.objectiveid);
    }
    level thread function_7d353922();
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 0, eflags: 0x0
// Checksum 0x37aee279, Offset: 0x15a8
// Size: 0x27c
function function_aa9e57ab() {
    level.satlinks = struct::get_array("fireteam_satlink", "variantname");
    if (level.satlinks.size == 0) {
        return;
    }
    function_18ae0114(level.satlinks);
    level.var_a9865734 = min(level.var_a9865734, level.satlinks.size);
    for (i = 0; i < level.var_a9865734; i++) {
        satlink = level.satlinks[i];
        satlink function_db7c16c8();
        satlink function_481bca8a();
        satlink function_7797f2f0(i);
        satlink.var_a8aaaaa6 = 0;
        satlink.var_b534f0c8 = 0;
        satlink.var_aee3e62d = 0;
        satlink.var_cfec45a8 = "hud_items_fireteam.satLinkBoosters." + i + ".activeCount";
        satlink.var_9c417693 = "hud_items_fireteam.satLinkBoosters." + i + ".expiring";
        satlink.var_eb2545e9 = [];
        satlink.var_e305235f = 0;
        if (isdefined(satlink.target)) {
            var_feca0aa5 = getentarray(satlink.target, "targetname");
            for (j = 0; j < var_feca0aa5.size; j++) {
                var_feca0aa5[j] notsolid();
                var_feca0aa5[j] clientfield::set("scriptid", satlink.objectiveid);
                var_feca0aa5[j] setforcenocull();
            }
        }
    }
    for (i = level.satlinks.size - 1; i >= level.var_a9865734; i--) {
        level.satlinks[i] = undefined;
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0x238b497f, Offset: 0x1830
// Size: 0x12a
function function_18ae0114(&structs) {
    var_e8a4ae59 = 64;
    var_a3c01952 = 1024;
    foreach (struct in structs) {
        startorigin = struct.origin + (0, 0, var_e8a4ae59);
        endorigin = startorigin - (0, 0, var_a3c01952);
        trace = physicstraceex(startorigin, endorigin, (-0.5, -0.5, -0.5), (0.5, 0.5, 0.5), undefined, 1);
        struct.origin = trace[#"position"];
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 0, eflags: 0x0
// Checksum 0x1a93031b, Offset: 0x1968
// Size: 0xd4
function function_db7c16c8() {
    self.model = spawn("script_model", self.origin);
    self.model.angles = self.angles;
    self.model setmodel("p9_fxanim_mp_objective_sat_link_mod");
    self.model function_619a5c20();
    self.model thread scene::init(#"hash_3f208262ef475029", self.model);
    self.model playloopsound(#"hash_405628bbd4201492");
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 0, eflags: 0x0
// Checksum 0x5ab3007a, Offset: 0x1a48
// Size: 0x1ae
function function_481bca8a() {
    self.trigger = spawn("trigger_radius", self.origin + (0, 0, 12), 0, 120, 90, 1);
    self.trigger triggerignoreteam();
    self.trigger triggerenable(1);
    self.trigger callback::on_trigger(&function_bd096dfe);
    self.trigger.satlink = self;
    self.var_b20bc5cc = spawn("trigger_radius", self.origin + (0, 0, 12), 0, 120, 90, 1);
    self.var_b20bc5cc triggerignoreteam();
    self.var_b20bc5cc triggerenable(1);
    self.var_b20bc5cc sethintstring("SCRIPT/ACTIVATE_SATLINK");
    self.var_b20bc5cc setinvisibletoall();
    self.var_b20bc5cc callback::on_trigger(&function_75623a73);
    self.var_b20bc5cc.satlink = self;
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0x642d7c7c, Offset: 0x1c00
// Size: 0x184
function function_7797f2f0(objectiveindex) {
    self.objectiveid = gameobjects::get_next_obj_id();
    objective = level.var_3ea9068a[objectiveindex];
    objective_add(self.objectiveid, "active", self.model, objective);
    function_9a8950ee(self.objectiveid, 1);
    objective_setinvisibletoall(self.objectiveid);
    self.var_30b25d38 = spawn("script_model", self.origin);
    self.var_30b25d38 setmodel("tag_origin");
    self.var_30b25d38 clientfield::set("objectiveCameraID", self.objectiveid);
    var_5da1be65 = string(objective);
    addobjectivecameraentity(var_5da1be65, self.objectiveid, #"none", self.var_30b25d38, "tag_origin", (0, 0, 0), (0, 0, 0));
    function_e795803(var_5da1be65, 1);
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 0, eflags: 0x0
// Checksum 0xb1f6b4d7, Offset: 0x1d90
// Size: 0x37c
function function_7d353922() {
    level endon(#"game_ended");
    prevtime = gettime();
    while (true) {
        waitframe(1);
        currtime = gettime();
        deltatime = currtime - prevtime;
        prevtime = currtime;
        foreach (satlink in level.satlinks) {
            var_8f6204ef = [];
            foreach (team, players in satlink.var_eb2545e9) {
                foreach (player in players) {
                    if (!player function_c5b5d604(satlink)) {
                        if (isdefined(player)) {
                            player function_427bdf46(satlink);
                        }
                        arrayremovevalue(players, player);
                        continue;
                    }
                    if (!isdefined(var_8f6204ef)) {
                        var_8f6204ef = [];
                    } else if (!isarray(var_8f6204ef)) {
                        var_8f6204ef = array(var_8f6204ef);
                    }
                    var_8f6204ef[var_8f6204ef.size] = player;
                }
                if (players.size == 0) {
                    satlink.var_eb2545e9[team] = undefined;
                }
            }
            arrayremovevalue(satlink.var_eb2545e9, undefined, 1);
            var_4a744a6a = getarraykeys(satlink.var_eb2545e9);
            if (var_4a744a6a.size == 0) {
                satlink function_32e15bbc(deltatime);
                continue;
            }
            if (var_4a744a6a.size == 1) {
                if (satlink.team === var_4a744a6a[0]) {
                    satlink function_20cea7a4(var_8f6204ef, deltatime);
                    satlink function_32e15bbc(deltatime);
                } else {
                    satlink function_6a9d41cd(var_8f6204ef, deltatime);
                }
                continue;
            }
            satlink function_e8000cda(var_8f6204ef, deltatime);
        }
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0x7bd8161, Offset: 0x2118
// Size: 0x114
function function_32e15bbc(deltatime) {
    if (isdefined(self.captureprogress) && self.captureprogress > 0) {
        self.model stoploopsound(0.25);
        if (!isdefined(self.team)) {
            self.model playloopsound(#"hash_405628bbd4201492");
        }
        self.captureprogress -= deltatime;
        if (self.captureprogress <= 0) {
            self.claimteam = undefined;
            self.captureprogress = 0;
        }
        if (isdefined(self.objectiveid)) {
            objective_setprogress(self.objectiveid, self.captureprogress / int(level.var_6f3f9c56 * 1000));
        }
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 2, eflags: 0x0
// Checksum 0x1fd9b756, Offset: 0x2238
// Size: 0x388
function function_20cea7a4(players, deltatime) {
    foreach (player in players) {
        if (self.var_a8aaaaa6 >= 8) {
            if (!is_true(player.var_633f587d)) {
                player function_1d2864b2(0);
                player function_4c834343();
            }
            player.var_dd6923b0 = 0;
            continue;
        }
        var_51225f7c = player clientfield::get_player_uimodel("hudItems.uraniumCarryCount");
        if (var_51225f7c > 0) {
            if (!is_true(player.var_633f587d)) {
                player function_8955434b(#"hash_b86ebfb5a93f57f");
            }
            player.var_dd6923b0 += deltatime;
            if (player.var_dd6923b0 >= level.var_1ff15218) {
                var_51225f7c--;
                player clientfield::set_player_uimodel("hudItems.uraniumCarryCount", var_51225f7c);
                self.var_a8aaaaa6++;
                player.var_dd6923b0 -= level.var_1ff15218;
                clientfield::set_world_uimodel(self.var_cfec45a8, self.var_a8aaaaa6);
                self.model playsoundontag(#"hash_1389df41a19d0c4f", "swivel_jnt");
                [[ level.var_37d62931 ]](player, 1);
                player.pers[#"satlink_deposits"] = (isdefined(player.pers[#"satlink_deposits"]) ? player.pers[#"satlink_deposits"] : 0) + 1;
                player.satlink_deposits = player.pers[#"satlink_deposits"];
                player globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
                player stats::function_bb7eedf0(#"satlink_deposits", 1);
                if (var_51225f7c <= 0) {
                    if (!is_true(player.var_633f587d)) {
                        player function_4c834343();
                    }
                }
            }
            if (!is_true(player.var_633f587d)) {
                player function_1d2864b2(player.var_dd6923b0 / level.var_1ff15218);
            }
        }
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 2, eflags: 0x0
// Checksum 0xf86def89, Offset: 0x25c8
// Size: 0x25c
function function_6a9d41cd(players, deltatime) {
    var_50b28b05 = players[0].team;
    if (self.claimteam !== var_50b28b05) {
        self.claimteam = var_50b28b05;
        self.captureprogress = 0;
    }
    var_e18791f4 = int(level.var_6f3f9c56 * 1000);
    if (!isdefined(self.captureprogress)) {
        self.captureprogress = 0;
    }
    if (self.captureprogress <= 0) {
        self.model playloopsound(#"hash_50248ac739779bf");
    }
    self.captureprogress += deltatime * players.size;
    if (self.captureprogress >= var_e18791f4) {
        self function_f60cbb01();
        return;
    }
    var_72e8700e = self.captureprogress / var_e18791f4;
    foreach (player in players) {
        if (!is_true(player.var_633f587d)) {
            player function_8955434b(#"hash_4ff55a42344e567e");
            player function_1d2864b2(var_72e8700e);
            player function_7a6bb352(players.size);
        }
        if (isdefined(self.objectiveid)) {
            objective_setplayerusing(self.objectiveid, player);
        }
    }
    if (isdefined(self.objectiveid)) {
        objective_setprogress(self.objectiveid, var_72e8700e);
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 2, eflags: 0x0
// Checksum 0x3ad8c6e6, Offset: 0x2830
// Size: 0xd8
function function_e8000cda(players, *deltatime) {
    foreach (player in deltatime) {
        if (isdefined(self.objectiveid)) {
            objective_setplayerusing(self.objectiveid, player);
        }
        if (!is_true(player.var_633f587d)) {
            player function_4c834343();
        }
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0xd1ad49bf, Offset: 0x2910
// Size: 0xa4
function function_bd096dfe(triggerstruct) {
    if (is_true(level.gameended)) {
        return;
    }
    if (!isdefined(triggerstruct.activator)) {
        return;
    }
    activator = triggerstruct.activator;
    if (is_true(activator.var_bcd73e99)) {
        return;
    }
    if (activator inlaststand()) {
        return;
    }
    self.satlink function_b1dd9185(activator);
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0x7de0ae62, Offset: 0x29c0
// Size: 0x10e
function function_b1dd9185(player) {
    if (!isdefined(self.var_eb2545e9[player.team])) {
        self.var_eb2545e9[player.team] = [];
    }
    if (!isdefined(self.var_eb2545e9[player.team])) {
        self.var_eb2545e9[player.team] = [];
    } else if (!isarray(self.var_eb2545e9[player.team])) {
        self.var_eb2545e9[player.team] = array(self.var_eb2545e9[player.team]);
    }
    self.var_eb2545e9[player.team][self.var_eb2545e9[player.team].size] = player;
    player.var_bcd73e99 = 1;
    player.var_dd6923b0 = 0;
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0x506a2972, Offset: 0x2ad8
// Size: 0x64
function function_427bdf46(satlink) {
    self.var_bcd73e99 = 0;
    self function_4c834343();
    self.var_dd6923b0 = 0;
    if (isdefined(satlink.objectiveid)) {
        objective_clearplayerusing(satlink.objectiveid, self);
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0x14ec8cfc, Offset: 0x2b48
// Size: 0xee
function function_c5b5d604(satlink) {
    if (game.state != #"playing") {
        return false;
    }
    if (!isalive(self)) {
        return false;
    }
    if (self inlaststand()) {
        return false;
    }
    if (!isdefined(satlink.trigger)) {
        return false;
    }
    if (!satlink.trigger istriggerenabled()) {
        return false;
    }
    if (self isinexecutionattack() || self isinexecutionvictim()) {
        return false;
    }
    if (!self istouching(satlink.trigger)) {
        return false;
    }
    return true;
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 0, eflags: 0x4
// Checksum 0x50621b1c, Offset: 0x2c40
// Size: 0x494
function private function_f60cbb01() {
    var_e74281a8 = self.team;
    self.team = self.claimteam;
    if (isarray(self.var_eb2545e9[self.team])) {
        foreach (player in self.var_eb2545e9[self.team]) {
            if (isdefined(self.objectiveid)) {
                objective_clearplayerusing(self.objectiveid, player);
            }
            if (!is_true(player.var_633f587d)) {
                player function_4c834343();
            }
            [[ level.var_37d62931 ]](player, 1);
            player.pers[#"captures"] = (isdefined(player.pers[#"captures"]) ? player.pers[#"captures"] : 0) + 1;
            player.captures = player.pers[#"captures"];
            player globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
            player stats::function_bb7eedf0(#"captures", 1);
        }
    }
    if (self.var_e305235f <= gettime()) {
        captureteam = getplayers(self.team);
        foreach (player in captureteam) {
            if (is_true(player.var_8c9cccf2)) {
                self.var_b20bc5cc setvisibletoplayer(player);
            }
        }
    }
    if (isdefined(self.objectiveid)) {
        objective_setteam(self.objectiveid, self.team);
        objective_setprogress(self.objectiveid, 0);
    }
    if (!isdefined(var_e74281a8)) {
        self.model thread scene::play(#"hash_3f208262ef475029", self.model);
    }
    foreach (team in level.teams) {
        if (self.team === team) {
            globallogic_audio::leader_dialog("satlinkLinkEstablished" + self.objectiveid, team);
            continue;
        }
        if (!isdefined(var_e74281a8)) {
            globallogic_audio::leader_dialog("satlinkLinkEstablishedEnemy" + self.objectiveid, team);
            continue;
        }
        if (var_e74281a8 === team) {
            globallogic_audio::leader_dialog("satlinkLinkCapturedEnemy" + self.objectiveid, team);
        }
    }
    self.captureprogress = 0;
    self.model stoploopsound(0.25);
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0xbeb1ada7, Offset: 0x30e0
// Size: 0xfc
function function_75623a73(triggerstruct) {
    if (is_true(level.gameended)) {
        return;
    }
    if (!isdefined(triggerstruct.activator)) {
        return;
    }
    activator = triggerstruct.activator;
    if (!is_true(activator.var_8c9cccf2)) {
        return;
    }
    if (is_true(activator.var_633f587d)) {
        return;
    }
    satlink = self.satlink;
    if (satlink.var_e305235f > gettime()) {
        return;
    }
    if (!activator usebuttonpressed()) {
        return;
    }
    if (satlink.team !== activator.team) {
        return;
    }
    satlink function_d9f345c3(activator);
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x4
// Checksum 0x8191dd4, Offset: 0x31e8
// Size: 0x144
function private function_d9f345c3(activator) {
    activator.var_633f587d = 1;
    activator function_8955434b(#"hash_59e0e869fbae7705");
    activator function_7a6bb352(1);
    activator function_1d2864b2(0);
    self.activator = activator;
    self.var_b20bc5cc setinvisibletoall();
    self.var_b20bc5cc setvisibletoplayer(activator);
    self.var_b20bc5cc sethintstring(#"");
    self.model playloopsound(#"hash_5093c3a0e7047aa", 0.5);
    if (isdefined(self.objectiveid)) {
        objective_setplayerusing(self.objectiveid, activator);
    }
    self thread function_d0a78df6(activator);
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 0, eflags: 0x4
// Checksum 0xf4e050db, Offset: 0x3338
// Size: 0x1ac
function private function_50e94589() {
    if (isdefined(self.activator)) {
        self.activator.var_633f587d = undefined;
        self.activator function_4c834343();
        if (isdefined(self.objectiveid)) {
            objective_clearplayerusing(self.objectiveid, self.activator);
        }
        assists = self.var_eb2545e9[self.activator.team];
        if (isarray(assists)) {
            foreach (player in assists) {
                player function_4c834343();
                if (isdefined(self.objectiveid)) {
                    objective_clearplayerusing(self.objectiveid, player);
                }
            }
        }
    }
    self.var_b20bc5cc sethintstring("SCRIPT/ACTIVATE_SATLINK");
    self.var_b20bc5cc setinvisibletoall();
    self.activator = undefined;
    self.model stoploopsound(0.25);
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x4
// Checksum 0xca38d59d, Offset: 0x34f0
// Size: 0x49c
function private function_d0a78df6(activator) {
    self endon(#"death");
    prevtime = gettime();
    var_e18791f4 = int(level.var_ad91ffcf * 1000);
    totalprogress = 0;
    var_b1c451bf = int(level.var_4b27b03c / 0.05 * 1000);
    while (isdefined(self)) {
        if (!isdefined(activator) || !activator function_4e33414c(self)) {
            self function_50e94589();
            if (self.var_e305235f <= gettime()) {
                foreach (player in level.players) {
                    if (self.team === player.team && is_true(player.var_8c9cccf2)) {
                        self.var_b20bc5cc setvisibletoplayer(player);
                    }
                }
            }
            return;
        }
        var_82377973 = [];
        if (isarray(self.var_eb2545e9[activator.team])) {
            foreach (player in self.var_eb2545e9[activator.team]) {
                if (player == activator) {
                    continue;
                }
                if (player function_11cf329c(self)) {
                    if (!isdefined(var_82377973)) {
                        var_82377973 = [];
                    } else if (!isarray(var_82377973)) {
                        var_82377973 = array(var_82377973);
                    }
                    var_82377973[var_82377973.size] = player;
                    continue;
                }
                player function_4c834343();
            }
        }
        currtime = gettime();
        deltatime = currtime - prevtime;
        progress = deltatime * (1 + var_82377973.size);
        progress = min(progress, var_b1c451bf);
        totalprogress += progress;
        if (totalprogress >= var_e18791f4) {
            self thread function_c21d7618(activator);
            return;
        }
        if (totalprogress > 0) {
            activator function_1d2864b2(totalprogress / var_e18791f4);
            activator function_7a6bb352(var_82377973.size + 1);
            foreach (var_99e52a8c in var_82377973) {
                var_99e52a8c function_8955434b(#"hash_59e0e869fbae7705");
                var_99e52a8c function_1d2864b2(totalprogress / var_e18791f4);
                var_99e52a8c function_7a6bb352(var_82377973.size + 1);
            }
        }
        prevtime = gettime();
        wait(0.05);
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0xdac19500, Offset: 0x3998
// Size: 0x154
function function_4e33414c(satlink) {
    if (game.state != #"playing") {
        return false;
    }
    if (satlink.var_e305235f > gettime()) {
        return false;
    }
    if (!isalive(self)) {
        return false;
    }
    if (self inlaststand()) {
        return false;
    }
    if (!self usebuttonpressed()) {
        return false;
    }
    if (!isdefined(satlink.var_b20bc5cc)) {
        return false;
    }
    if (!satlink.var_b20bc5cc istriggerenabled()) {
        return false;
    }
    if (self isinexecutionattack() || self isinexecutionvictim()) {
        return false;
    }
    if (!self istouching(satlink.var_b20bc5cc)) {
        return false;
    }
    if (self getcurrentweapon() === level.var_8ef8b9e8) {
        return false;
    }
    if (satlink.team !== self.team) {
        return false;
    }
    return true;
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0x4b5320fb, Offset: 0x3af8
// Size: 0x120
function function_11cf329c(satlink) {
    if (game.state != #"playing") {
        return false;
    }
    if (satlink.var_e305235f > gettime()) {
        return false;
    }
    if (!isalive(self)) {
        return false;
    }
    if (self inlaststand()) {
        return false;
    }
    if (!isdefined(satlink.var_b20bc5cc)) {
        return false;
    }
    if (!satlink.var_b20bc5cc istriggerenabled()) {
        return false;
    }
    if (self isinexecutionattack() || self isinexecutionvictim()) {
        return false;
    }
    if (!self istouching(satlink.var_b20bc5cc)) {
        return false;
    }
    if (self getcurrentweapon() === level.var_8ef8b9e8) {
        return false;
    }
    return true;
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x4
// Checksum 0x4043fc56, Offset: 0x3c20
// Size: 0x1ac
function private function_c21d7618(activator) {
    activator function_cef13ead();
    self function_50e94589();
    self.var_e305235f = gettime() + level.var_ab27794e;
    self.model playsoundontag(#"hash_2c7e2b247d4d2f84", "swivel_jnt");
    if (isdefined(self.objectiveid)) {
        objective_setgamemodeflags(self.objectiveid, 1);
    }
    self.var_b20bc5cc setinvisibletoall();
    [[ level.var_37d62931 ]](activator, 1);
    activator.pers[#"satlink_batteries"] = (isdefined(activator.pers[#"satlink_batteries"]) ? activator.pers[#"satlink_batteries"] : 0) + 1;
    activator.satlink_batteries = activator.pers[#"satlink_batteries"];
    activator globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
    activator stats::function_bb7eedf0(#"satlink_batteries", 1);
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x4
// Checksum 0xad1a673c, Offset: 0x3dd8
// Size: 0x6c
function private function_8955434b(state) {
    if (!level.var_641271fb dirtybomb_usebar::is_open(self)) {
        level.var_641271fb dirtybomb_usebar::open(self, 4);
    }
    level.var_641271fb dirtybomb_usebar::set_state(self, state);
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 0, eflags: 0x4
// Checksum 0x198f6650, Offset: 0x3e50
// Size: 0x5c
function private function_4c834343() {
    if (!isplayer(self)) {
        return;
    }
    if (level.var_641271fb dirtybomb_usebar::is_open(self)) {
        level.var_641271fb dirtybomb_usebar::close(self);
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x4
// Checksum 0x5f386e66, Offset: 0x3eb8
// Size: 0x4c
function private function_1d2864b2(frac) {
    if (level.var_641271fb dirtybomb_usebar::is_open(self)) {
        level.var_641271fb dirtybomb_usebar::function_f0df5702(self, frac);
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x4
// Checksum 0x806df25, Offset: 0x3f10
// Size: 0x4c
function private function_7a6bb352(count) {
    if (level.var_641271fb dirtybomb_usebar::is_open(self)) {
        level.var_641271fb dirtybomb_usebar::function_4aa46834(self, count);
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 0, eflags: 0x4
// Checksum 0x1cbe67ef, Offset: 0x3f68
// Size: 0x192
function private function_962baacc() {
    level endon(#"game_ended");
    while (true) {
        foreach (player in getplayers()) {
            if (!is_true(player.var_8c9cccf2) || !isalive(player) || player inlaststand()) {
                continue;
            }
            isbuttonpressed = player function_28655ef2() || player actionslottwobuttonpressed();
            if (!isbuttonpressed || is_false(player.var_c60ad697)) {
                player.var_c60ad697 = !isbuttonpressed;
                continue;
            }
            player.var_c60ad697 = 0;
            player function_2025ab1b(0);
        }
        waitframe(1);
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x4
// Checksum 0x23f18691, Offset: 0x4108
// Size: 0x66
function private function_2025ab1b(var_4c42f7cf) {
    if (!is_true(self.var_8c9cccf2)) {
        return var_4c42f7cf;
    }
    self function_cef13ead();
    self function_fe50fd48(var_4c42f7cf);
    return var_4c42f7cf + 1;
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 0, eflags: 0x0
// Checksum 0x3018b884, Offset: 0x4178
// Size: 0x218
function function_cef13ead() {
    self val::reset(#"hash_702c007b4c457d3b", "disable_weapon_cycling");
    self val::reset(#"hash_702c007b4c457d3b", "disable_offhand_weapons");
    self val::reset(#"hash_702c007b4c457d3b", "disable_weapon_pickup");
    self val::reset(#"hash_702c007b4c457d3b", "disable_offhand_special");
    self enableweaponswitchhero();
    if (self hasweapon(level.var_44565297)) {
        self takeweapon(level.var_44565297);
    }
    self.var_8c9cccf2 = 0;
    self.var_85494d43 = undefined;
    self clientfield::set_player_uimodel("hudItems.carryingLargeBattery", 0);
    if (is_true(level.var_44565297.var_d2751f9d)) {
        self val::reset(#"gameobject_use", "disable_gestures");
    }
    self setmovespeedscale(1);
    foreach (satlink in level.satlinks) {
        satlink.var_b20bc5cc setinvisibletoplayer(self);
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0x18419b14, Offset: 0x4398
// Size: 0x1ec
function function_fe50fd48(var_4c42f7cf) {
    itempoint = function_4ba8fde("satlink_battery_large_item_t9");
    originoffset = (0, 0, 6);
    dropangles = self.angles + (0, randomintrange(-30, 30), 0);
    forward = anglestoforward(dropangles);
    droporigin = self.origin + originoffset + forward * (randomfloatrange(10, 30) + 18);
    traceresults = physicstraceex(self.origin + originoffset, droporigin, (0, 0, 0), (0, 0, 0), self, 1);
    if (traceresults[#"fraction"] < 1) {
        droporigin = traceresults[#"position"] - forward * 18;
    } else {
        droporigin -= forward * 18;
    }
    waitframe(1);
    if (!isdefined(self)) {
        return;
    }
    dropitem = self item_drop::drop_item(var_4c42f7cf, undefined, 1, 1, itempoint.id, droporigin, dropangles, 2);
    if (!isdefined(dropitem)) {
        return;
    }
    dropitem.var_d25a1503 = self.team;
    self function_58b29f4f();
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x4
// Checksum 0x66411db9, Offset: 0x4590
// Size: 0x3ae
function private function_3f63e44f(item) {
    assert(isdefined(item));
    assert(isdefined(item.itementry));
    if (item.itementry.itemtype == #"generic") {
        switch (item.itementry.name) {
        case #"hash_44cca2edb9c2041c":
            return !namespace_234f0efc::function_d912fa6e(self);
        case #"hash_742db17ef9ee9c3e":
            var_e3483afe = self clientfield::get_player_uimodel("hudItems.uraniumCarryCount");
            canpickup = 5 > var_e3483afe;
            self thread function_c50d8500(canpickup);
            return canpickup;
        default:
            return 0;
        }
    } else if (item.itementry.itemtype == #"scorestreak") {
        if (is_true(self.selectinglocation)) {
            return 0;
        }
        weapons = self getweaponslist();
        foreach (weapon in weapons) {
            var_16f12c31 = item_world_util::function_3531b9ba(weapon.name);
            if (isdefined(var_16f12c31) && self getweaponammostock(weapon) > 0) {
                return 0;
            }
        }
        return 1;
    } else if (item.itementry.itemtype == #"armor_shard") {
        return (self.var_c52363ab > self.var_7d7d976a);
    } else if (item.itementry.itemtype == #"ammo") {
        weaponslist = self getweaponslistprimaries();
        foreach (weapon in weaponslist) {
            if ((isdefined(self getweaponammostock(weapon)) ? self getweaponammostock(weapon) : 0) < (isdefined(self function_5d951520(weapon)) ? self function_5d951520(weapon) : 1)) {
                return 1;
            }
        }
        return 0;
    }
    return 0;
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x4
// Checksum 0x6d3ab206, Offset: 0x4948
// Size: 0x134
function private function_c50d8500(canpickup) {
    assert(isplayer(self));
    if (!isplayer(self)) {
        return;
    }
    if (!isalive(self)) {
        return;
    }
    if (canpickup) {
        self clientfield::set_player_uimodel("hudItems.uraniumFullCarry", 0);
        return;
    }
    if (isdefined(self.var_2717d932) && self.var_2717d932 > gettime()) {
        return;
    }
    self.var_2717d932 = gettime() + int(4 * 1000);
    self clientfield::set_player_uimodel("hudItems.uraniumFullCarry", 1);
    wait(2);
    if (isplayer(self)) {
        self clientfield::set_player_uimodel("hudItems.uraniumFullCarry", 0);
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 7, eflags: 0x4
// Checksum 0x272ca638, Offset: 0x4a88
// Size: 0x118
function private function_18f58ab2(item, player, networkid, itemid, itemcount, var_aec6fa7f, slot) {
    pickup = 0;
    switch (item.itementry.name) {
    case #"hash_44cca2edb9c2041c":
        pickup = namespace_234f0efc::function_dd8cb464(item, player, networkid, itemid, itemcount, var_aec6fa7f, slot);
        break;
    case #"hash_59b05128a1472855":
        pickup = function_a22bb806(item, player, networkid, itemid, itemcount, var_aec6fa7f, slot);
        break;
    case #"hash_742db17ef9ee9c3e":
        pickup = function_60d1226(item, player, networkid, itemid, itemcount, var_aec6fa7f, slot);
        break;
    }
    return itemcount - pickup;
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 7, eflags: 0x4
// Checksum 0x821444c3, Offset: 0x4ba8
// Size: 0x3a6
function private function_a22bb806(*item, player, *networkid, *itemid, *itemcount, *var_aec6fa7f, *slot) {
    if (is_true(slot.var_8c9cccf2)) {
        return false;
    }
    if (slot isswitchingweapons()) {
        return false;
    }
    if (slot getcurrentweapon() === level.var_8ef8b9e8) {
        return false;
    }
    itemweapon = level.var_44565297;
    if (is_true(itemweapon.var_d2751f9d)) {
        slot val::set(#"gameobject_use", "disable_gestures");
    }
    if (!slot hasweapon(itemweapon)) {
        slot giveweapon(itemweapon);
    }
    slot givestartammo(itemweapon);
    slot switchtoweapon(itemweapon);
    slot val::set(#"hash_702c007b4c457d3b", "disable_weapon_cycling", 1);
    slot val::set(#"hash_702c007b4c457d3b", "disable_offhand_weapons", 1);
    slot val::set(#"hash_702c007b4c457d3b", "disable_weapon_pickup", 1);
    slot val::set(#"hash_702c007b4c457d3b", "disable_offhand_special", 1);
    slot disableweaponswitchhero();
    slot.var_8c9cccf2 = 1;
    slot clientfield::set_player_uimodel("hudItems.carryingLargeBattery", 1);
    slot globallogic_audio::leader_dialog_on_player("satlinkBatteryCollect");
    slot setmovespeedscale(0.8);
    time = gettime();
    foreach (satlink in level.satlinks) {
        if (satlink.var_e305235f <= time && satlink.team === slot.team) {
            satlink.var_b20bc5cc setvisibletoplayer(slot);
        }
    }
    if (!isdefined(slot.var_eab2da4d)) {
        slot luinotifyevent(#"hash_6b67aa04e378d681", 1, 18);
        slot.var_eab2da4d = 1;
    }
    return true;
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 7, eflags: 0x4
// Checksum 0xa23a3, Offset: 0x4f58
// Size: 0x186
function private function_60d1226(*item, player, *networkid, *itemid, itemcount, *var_aec6fa7f, *slot) {
    var_e3483afe = var_aec6fa7f clientfield::get_player_uimodel("hudItems.uraniumCarryCount");
    pickup = int(min(5 - var_e3483afe, slot));
    var_aec6fa7f clientfield::set_player_uimodel("hudItems.uraniumCarryCount", var_e3483afe + pickup);
    if (pickup > 0) {
        var_aec6fa7f playsound("fly_uranium_pickup");
        if (!isdefined(var_aec6fa7f.var_47ad3ff0) || var_aec6fa7f.var_47ad3ff0 <= gettime()) {
            var_aec6fa7f globallogic_audio::leader_dialog_on_player("satlinkBoosterCollect");
            var_aec6fa7f.var_47ad3ff0 = gettime() + 15000;
        }
    }
    if (!isdefined(var_aec6fa7f.var_a5f63144)) {
        var_aec6fa7f luinotifyevent(#"hash_6b67aa04e378d681", 1, 17);
        var_aec6fa7f.var_a5f63144 = 1;
    }
    return pickup;
}

// Namespace fireteam_satlink/exit_vehicle
// Params 1, eflags: 0x24
// Checksum 0x645e715, Offset: 0x50e8
// Size: 0x100
function private event_handler[exit_vehicle] codecallback_exitvehicle(eventstruct) {
    if (isplayer(self)) {
        if (eventstruct.seat_index == 0) {
            occupants = eventstruct.vehicle getvehoccupants();
            foreach (occupant in occupants) {
                if (is_true(occupant.var_8c9cccf2)) {
                    occupant unlink();
                }
            }
        }
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0x53d251b8, Offset: 0x51f0
// Size: 0x104
function function_28039abb(var_aaba141c) {
    var_aaba141c = function_7fc57bc9();
    if (var_aaba141c < 0.7) {
        return;
    }
    if (var_aaba141c >= 0.8) {
        if (var_aaba141c >= 0.9) {
            var_9c1ed9ea = "ftdb_endgame_high";
        } else {
            var_9c1ed9ea = "ftdb_endgame_med";
        }
    } else {
        var_9c1ed9ea = "ftdb_endgame_low";
    }
    if (level.var_ada8ae30 !== var_9c1ed9ea) {
        level thread globallogic_audio::function_6fbfba95(var_9c1ed9ea);
        level.var_ada8ae30 = var_9c1ed9ea;
        if (!is_true(level.var_acf54eb7)) {
            level.var_acf54eb7 = 1;
            clientfield::set("sndDeactivateSquadSpawnMusic", 1);
        }
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 0, eflags: 0x0
// Checksum 0xc1360264, Offset: 0x5300
// Size: 0xe8
function function_7fc57bc9() {
    if (!isdefined(level.teams)) {
        return 0;
    }
    bestteamscore = 0;
    foreach (team in level.teams) {
        teamscore = getteamscore(team);
        if (teamscore > bestteamscore) {
            bestteamscore = teamscore;
        }
    }
    return bestteamscore / (level.scorelimit < 0 ? 1 : level.scorelimit);
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0x39b582bf, Offset: 0x53f0
// Size: 0x9c
function function_c0e544cc(params) {
    player = params.player;
    player endon(#"death", #"disconnect");
    while (true) {
        if (player isonground()) {
            break;
        }
        wait(1);
    }
    player luinotifyevent(#"hash_6b67aa04e378d681", 1, 16);
}

