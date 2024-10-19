// Atian COD Tools GSC CW decompiler test
#using script_6196bd4e1ff26cc0;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\callbacks.gsc;
#using script_18077945bb84ede7;
#using script_5f261a5d57de5f7c;
#using script_3751b21462a54a7d;
#using script_34ab99a4ca1a43d;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using script_193d6fcd3b319d05;
#using script_113dd7f0ea2a1d4f;
#using script_7a8059ca02b7b09e;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\gamestate.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using script_67ce8e728d8f37ba;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using script_165beea08a63a243;

#namespace zcranked;

// Namespace zcranked/gametype_init
// Params 1, eflags: 0x20
// Checksum 0x8a565488, Offset: 0x4e0
// Size: 0x604
function event_handler[gametype_init] main(*eventstruct) {
    clientfield::register("allplayers", "cranked_explode_fx", 1, 1, "counter");
    clientfield::register("toplayer", "cranked_timer_sfx", 1, 1, "int");
    clientfield::register_clientuimodel("hud_items_cranked.crankedMax", 6000, 5, "int", 0);
    clientfield::register_clientuimodel("hud_items_cranked.crankedPct", 6000, 16, "float", 0);
    clientfield::register_clientuimodel("hud_items_cranked.crankedTimerReset", 6000, 1, "counter", 0);
    clientfield::register_clientuimodel("ZMHud.zmCrankedRoundNotification", 6000, 1, "int", 0);
    clientfield::register_clientuimodel("hud_items_cranked.crankedTier", 6000, 1, "int", 0);
    level.var_2f5a329e = 1;
    level.var_75c2c45f = 50;
    level.var_eaa19257 = 1;
    if (!isdefined(level.var_31028c5d)) {
        level.var_31028c5d = prototype_hud::register();
    }
    level.givecustomloadout = &function_da6accd0;
    level.var_6c10f162 = 1;
    level.var_26342339 = 1;
    level.var_a9ebf2c6 = getweapon(#"knife_loadout");
    level.str_magicbox_weapon_itemspawnlist = #"hash_6b07c24817b7820f";
    level.var_e2f02558 = #"hash_3dd30890ce81cf71";
    level.var_430d4cfe = #"hash_32e3a7aed2bd9ea7";
    level.var_3d802d78 = #"hash_4192cf85cfcd19d9";
    level.var_5793d07d = #"hash_7ef9ab3656b301fc";
    level.var_5396aa34 = #"hash_3d30f9cc0ad51ea0";
    level.var_887d12df = #"hash_52eca1d03520a059";
    level.var_5cf89c5c = #"hash_52eff7500a12a414";
    level.var_95f4d593 = #"hash_1d5d3b585ea6bb9f";
    level.var_54c1f9aa = 40;
    level.var_f6bc1355 = 1;
    setdvar(#"hash_34cae673a047c202", 1);
    zm_gametype::main();
    level.onprecachegametype = &onprecachegametype;
    level.onstartgametype = &onstartgametype;
    level._game_module_custom_spawn_init_func = &zm_gametype::custom_spawn_init_func;
    level._game_module_stat_update_func = &zm_stats::survival_classic_custom_stat_update;
    level._round_start_func = &zm_round_logic::round_start;
    level.round_wait_func = &function_b982cd4d;
    level.func_get_delay_between_rounds = &function_271fd5ed;
    level.var_54d9d726 = 2;
    level.var_4d30a9f0 = 1;
    level.var_cdc822b = &function_38499d79;
    level.callbackplayerkilled = &function_62dd8e0c;
    level.callbackplayerlaststand = &function_2f8f38e7;
    level.var_deb2145c = &zombie_move_speed_override;
    level.var_57cc29f3 = &function_aa5777b3;
    level.var_a4e9271b = &function_26cf03ff;
    level.musicsystemoverride = 1;
    zm_vo::function_2cf4b07f(#"hash_33e242de9ff79fce", #"hash_566a2e8557ec05e");
    spawner::add_ai_spawn_function(&function_a143f9d1);
    namespace_58949729::function_5a12541e();
    level thread intro_cinematic();
    level thread function_8e58680e();
    callback::function_74872db6(&function_74872db6);
    callback::on_round_end(&on_round_end);
    callback::add_callback(#"hash_3b7d3ed9e484ef72", &give_match_bonus);
    callback::on_spawned(&on_player_spawn);
    callback::on_revived(&on_player_revived);
    callback::on_actor_killed(&function_b3791df9);
    callback::on_actor_damage(&function_3d2684c5);
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x4
// Checksum 0xb070d13e, Offset: 0xaf0
// Size: 0x84
function private function_da6accd0() {
    zm_loadout::init_player(isdefined(self.var_1fa95cc));
    zm_loadout::function_f436358b(self.curclass);
    zm_weapons::give_start_weapons();
    telemetry::function_18135b72(#"hash_27cccc0731de1722", {#player:self});
}

// Namespace zcranked/zcranked
// Params 1, eflags: 0x4
// Checksum 0x5415cb54, Offset: 0xb80
// Size: 0x10
function private function_aa5777b3(*player) {
    return true;
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x0
// Checksum 0xcc4dd27f, Offset: 0xb98
// Size: 0x92
function zombie_move_speed_override() {
    if (zm_utility::get_round_number() >= 30) {
        if (math::cointoss()) {
            self.zombie_move_speed = "super_sprint";
        } else {
            self.zombie_move_speed = "run";
        }
        return;
    }
    if (math::cointoss()) {
        self.zombie_move_speed = "sprint";
        return;
    }
    self.zombie_move_speed = "walk";
}

// Namespace zcranked/zcranked
// Params 1, eflags: 0x0
// Checksum 0xb18709cd, Offset: 0xc38
// Size: 0x2c
function function_a143f9d1(*params) {
    self.var_1b2af7dc = 1;
    self thread function_acafdd66();
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x0
// Checksum 0x9ef6254f, Offset: 0xc70
// Size: 0x4c
function function_acafdd66() {
    self endon(#"death");
    while (true) {
        self waittill(#"bad_path");
        self.var_4fe4e626 = 1;
        wait(0.5);
    }
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x0
// Checksum 0xf4e81b42, Offset: 0xcc8
// Size: 0x24
function function_38499d79() {
    return !is_true(self.cached_zone_volume.var_8e4005b6);
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x0
// Checksum 0x10370682, Offset: 0xcf8
// Size: 0x1c
function onprecachegametype() {
    level.canplayersuicide = &zm_gametype::canplayersuicide;
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x0
// Checksum 0x24b18f76, Offset: 0xd20
// Size: 0x1a4
function onstartgametype() {
    zm_behavior::preinit();
    zm_cleanup::preinit();
    zm_spawner::init();
    zm_behavior::postinit();
    zm_cleanup::postinit();
    level.spawnmins = (0, 0, 0);
    level.spawnmaxs = (0, 0, 0);
    structs = struct::get_array("player_respawn_point", "targetname");
    foreach (struct in structs) {
        level.spawnmins = math::expand_mins(level.spawnmins, struct.origin);
        level.spawnmaxs = math::expand_maxs(level.spawnmaxs, struct.origin);
    }
    level.mapcenter = math::find_box_center(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x0
// Checksum 0xca588c3d, Offset: 0xed0
// Size: 0x194
function on_player_spawn() {
    self.specialty = self getloadoutperks(0);
    self.var_d66589da = 0;
    self.var_5d4c5daf = 0;
    self zm::register_perks();
    if (!level.var_31028c5d prototype_hud::is_open(self)) {
        level.var_31028c5d prototype_hud::open(self, 1);
    }
    if (is_true(self.is_hotjoin)) {
        var_c6b6dcea = level.round_number * 500;
        self.score = var_c6b6dcea;
        /#
            if (getdvarint(#"zombie_cheat", 0) >= 1) {
                self.score = 100000;
            }
        #/
        self.is_hotjoin = undefined;
    }
    if (!is_true(self.is_hotjoining) && !self util::is_spectating()) {
        self thread function_89af9d5f();
        self thread function_54e7be9c();
    }
    self clientfield::set_player_uimodel("hud_items_cranked.crankedTier", 1);
}

// Namespace zcranked/zcranked
// Params 1, eflags: 0x0
// Checksum 0xe82fe331, Offset: 0x1070
// Size: 0x24
function on_player_revived(*params) {
    self thread on_player_spawn();
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x0
// Checksum 0xbd3177dc, Offset: 0x10a0
// Size: 0x84
function function_89af9d5f() {
    level endon(#"end_game");
    self endon(#"death", #"disconnect", #"become_cranked");
    level flag::wait_till("start_zombie_round_logic");
    wait(30);
    self function_5d44c2ba();
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x4
// Checksum 0x8af11212, Offset: 0x1130
// Size: 0xac
function private function_54e7be9c() {
    level endon(#"end_game");
    self endon(#"disconnect");
    self val::set(#"hash_47e92389d3114637", "ignoreme", 1);
    self waittilltimeout(5, #"death", #"become_cranked");
    self val::reset(#"hash_47e92389d3114637", "ignoreme");
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x4
// Checksum 0xfa5b3989, Offset: 0x11e8
// Size: 0x2fc
function private intro_cinematic() {
    level flag::wait_till("initial_blackscreen_passed");
    music::setmusicstate("cranked_intro");
    if (isdefined(level.var_dfee7fc2) && !getdvarint(#"hash_39af51993585a73e", 0)) {
        foreach (player in getplayers()) {
            player.var_f4e33249 = 1;
        }
        namespace_66d6aa44::function_bb17da18();
        level.var_3dfa8db4 = 1;
        util::wait_network_frame(2);
        level scene::play(level.var_dfee7fc2);
        callback::callback(#"hash_41e282f5ec98e877");
        namespace_66d6aa44::function_db62d086();
        level.var_dfee7fc2 = undefined;
        foreach (player in getplayers()) {
            player dontinterpolate();
            player setorigin(player.spectator_respawn.origin);
            player setplayerangles(player.spectator_respawn.angles);
            player.var_f4e33249 = undefined;
        }
    }
    level flag::set(#"intro_scene_done");
    gamestate::set_state(#"playing");
    level flag::wait_till("start_zombie_round_logic");
    level thread zm_vo::function_8abe0568(#"hash_33e242de9ff79fce", 1);
}

// Namespace zcranked/zcranked
// Params 1, eflags: 0x0
// Checksum 0x484d99ee, Offset: 0x14f0
// Size: 0xba
function function_ef580a0c(round) {
    switch (round) {
    case 5:
        return 1;
    case 10:
        return 1;
    case 15:
        return 2;
    case 20:
        return 3;
    case 25:
        return 4;
    default:
        return 5;
    }
}

// Namespace zcranked/zcranked
// Params 1, eflags: 0x0
// Checksum 0x8ae8fed, Offset: 0x15b8
// Size: 0xa2
function function_b03d7dd0(round) {
    switch (round) {
    case 5:
        return 1;
    case 10:
        return 2;
    case 15:
        return 3;
    case 20:
        return 4;
    default:
        return 5;
    }
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x0
// Checksum 0xcf2a1d7f, Offset: 0x1668
// Size: 0x310
function on_round_end() {
    playsoundatposition(#"hash_409b69424385812a", (0, 0, 0));
    var_370ac26d = zm::function_d3113f01().var_bd588afd;
    luinotifyevent(#"hash_3e6dd0ad7b864154", 1, var_370ac26d);
    foreach (player in getplayers()) {
        if (!isdefined(player.var_8d41c907)) {
            player.var_8d41c907 = 0;
        }
        if (zm_utility::function_1a01f2f7(player)) {
            player addrankxpvalue("round_end_xp", var_370ac26d, 4);
            player.var_8d41c907 -= var_370ac26d;
        }
        if (!isdefined(player.var_a160c21d) || player.var_a160c21d === 0) {
            println("<unknown string>" + player getentitynumber() + "<unknown string>");
            player.var_a160c21d = 0;
        }
        player.var_8d41c907 += player zm_round_logic::function_f4c57bbe();
        player.var_a160c21d = 0;
        if (level.round_number % 5 == 0 && level.round_number >= 5) {
            var_36bda4b = function_ef580a0c(level.round_number);
            var_ef5aac55 = var_36bda4b * 100;
            var_ef5aac55 = math::clamp(var_ef5aac55, 0, 900);
            var_1ac981fc = function_b03d7dd0(level.round_number);
            var_a9b93bb4 = var_1ac981fc * 50;
            var_a9b93bb4 = math::clamp(var_a9b93bb4, 0, 450);
            player thread namespace_2a9f256a::function_afab250a(var_ef5aac55);
            player thread namespace_2a9f256a::function_a6d4221f(var_a9b93bb4);
        }
    }
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x0
// Checksum 0xd8ba23ee, Offset: 0x1980
// Size: 0x19c
function function_74872db6() {
    if (!isdefined(level.var_d041f60d)) {
        level.var_d041f60d = 30;
    }
    if (!isdefined(level.var_e78b055a)) {
        level.var_e78b055a = 30;
    }
    var_e4eea632 = 0;
    if (level.round_number > 0 && level.round_number % 3 == 0) {
        level.var_e78b055a = level.var_d041f60d;
        level.var_d041f60d -= 3;
        level.var_d041f60d = math::clamp(level.var_d041f60d, 5, 30);
        if (level.var_d041f60d > 6) {
            var_e4eea632 = 1;
        }
    }
    if (var_e4eea632) {
        playsoundatposition(#"hash_32635012b4632180", (0, 0, 0));
        array::thread_all(getplayers(), &clientfield::set_player_uimodel, "ZMHud.zmCrankedRoundNotification", 1);
        return;
    }
    array::thread_all(getplayers(), &clientfield::set_player_uimodel, "ZMHud.zmCrankedRoundNotification", 0);
}

// Namespace zcranked/zcranked
// Params 1, eflags: 0x0
// Checksum 0xf3f96198, Offset: 0x1b28
// Size: 0x2a8
function give_match_bonus(*data) {
    players = getplayers();
    foreach (player in players) {
        var_22ba849f = getdvarint(#"hash_3f0689f4ecc2fbab", 0);
        var_900d44db = zm::function_d3113f01();
        if (!isdefined(player.var_8d41c907)) {
            player.var_8d41c907 = 0;
        }
        var_103c65cc = player.var_8d41c907;
        var_7a7b21ad = player zm_round_logic::function_f4c57bbe();
        var_370ac26d = var_103c65cc + var_7a7b21ad;
        var_370ac26d = int(max(var_370ac26d, 0));
        if (zm_utility::get_round_number() > 3) {
            var_370ac26d = int(max(var_370ac26d, randomintrangeinclusive(1000, 1250)));
        }
        player zm::function_78e7b549(var_370ac26d);
        /#
            println("<unknown string>" + player getentnum() + "<unknown string>" + player.name + "<unknown string>" + var_370ac26d);
            println("<unknown string>" + var_22ba849f);
            println("<unknown string>" + var_103c65cc);
            println("<unknown string>" + var_7a7b21ad);
            println("<unknown string>");
        #/
    }
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x4
// Checksum 0x6a77629d, Offset: 0x1dd8
// Size: 0x8
function private function_271fd5ed() {
    return 2;
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x4
// Checksum 0x1b4ebd2e, Offset: 0x1de8
// Size: 0x232
function private function_b982cd4d() {
    level endon(#"restart_round", #"kill_round_wait");
    /#
        level endon(#"kill_round");
        if (getdvarint(#"zombie_rise_test", 0)) {
            level waittill(#"forever");
        }
    #/
    if (zm::cheat_enabled(2)) {
        level waittill(#"forever");
    }
    /#
        if (getdvarint(#"zombie_default_max", 0) == 0) {
            level waittill(#"forever");
        }
    #/
    wait(1);
    while (true) {
        if (level.zombie_total <= 0 && !level.intermission && !level flag::get(#"infinite_round_spawning") && !level flag::get(#"hold_round_end")) {
            var_9427911d = zombie_utility::get_current_zombie_count();
            if (level.round_number > 1 || var_9427911d <= 2) {
                if (level.round_number == 1 || var_9427911d == 0) {
                    wait(1);
                    return;
                }
                wait(5);
                return;
            }
        }
        if (level flag::get("end_round_wait")) {
            return;
        }
        if (level flag::get("round_reset")) {
            return;
        }
        wait(1);
    }
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x0
// Checksum 0x14c28f37, Offset: 0x2028
// Size: 0x112
function function_26cf03ff() {
    var_c1abcf30 = 0;
    foreach (str_archetype in self.var_d7d3cd31) {
        a_ai_enemies = getaiarchetypearray(str_archetype, level.zombie_team);
        if (a_ai_enemies.size > 0) {
            var_c1abcf30 = 1;
            break;
        }
    }
    if (!var_c1abcf30 && level.zombie_total <= 0 && !level flag::get(#"hold_round_end")) {
        return true;
    }
    return false;
}

// Namespace zcranked/zcranked
// Params 1, eflags: 0x4
// Checksum 0x2ff2a00f, Offset: 0x2148
// Size: 0x3a
function private function_9b42df5c(*round_number) {
    return int(isdefined(level.var_d041f60d) ? level.var_d041f60d : 30);
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x4
// Checksum 0x6f6f9db2, Offset: 0x2190
// Size: 0x3a
function private function_600547a4() {
    assert(isdefined(level.round_number));
    return function_9b42df5c(level.round_number);
}

// Namespace zcranked/zcranked
// Params 1, eflags: 0x4
// Checksum 0xc197fb00, Offset: 0x21d8
// Size: 0xf0
function private function_3d2684c5(params) {
    player = params.eattacker;
    if (!isplayer(player) || !isalive(player)) {
        return;
    }
    if (!isdefined(self.var_68812391)) {
        self.var_68812391 = [];
    }
    if (!isdefined(self.var_68812391)) {
        self.var_68812391 = [];
    } else if (!isarray(self.var_68812391)) {
        self.var_68812391 = array(self.var_68812391);
    }
    if (!isinarray(self.var_68812391, player)) {
        self.var_68812391[self.var_68812391.size] = player;
    }
}

// Namespace zcranked/zcranked
// Params 1, eflags: 0x4
// Checksum 0xab7a4384, Offset: 0x22d0
// Size: 0x16c
function private function_b3791df9(params) {
    if (is_true(self.var_c39323b5)) {
        return;
    }
    if (isdefined(self.var_68812391) && self.var_68812391.size > 0) {
        arrayremovevalue(self.var_68812391, undefined);
        foreach (damaged_player in self.var_68812391) {
            damaged_player function_5d44c2ba(1);
            if (damaged_player !== params.eattacker) {
                damaged_player.assists++;
            }
        }
    }
    player = params.eattacker;
    if (isplayer(player) && !player flag::get("become_cranked")) {
        player function_5d44c2ba();
    }
}

// Namespace zcranked/zcranked
// Params 1, eflags: 0x4
// Checksum 0xa5f73486, Offset: 0x2448
// Size: 0x18c
function private function_5d44c2ba(var_d02140db = 0) {
    player = self;
    if (!isalive(player)) {
        return;
    }
    if (is_true(var_d02140db) && !player flag::get("become_cranked")) {
        return;
    }
    if (!isdefined(player.var_5f356773)) {
        player.var_5f356773 = 0;
    }
    player.var_5f356773 = int(max(player.var_5f356773, function_600547a4()));
    player clientfield::increment_uimodel("hud_items_cranked.crankedTimerReset");
    if (!player function_64030a52()) {
        player thread function_bab1a386(player.var_5f356773);
    }
    if (!player flag::get("become_cranked")) {
        player thread function_bbdbb1b6();
        return;
    }
    scoreevents::processscoreevent(#"hash_1655db4904ecaf05", player);
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x4
// Checksum 0xd1212337, Offset: 0x25e0
// Size: 0x146
function private function_52203507() {
    level endon(#"end_game");
    self endon(#"disconnect");
    self notify(#"hash_196c728dd1cf1842");
    self endon(#"hash_196c728dd1cf1842");
    while (isdefined(self) && isalive(self)) {
        if (isdefined(self.var_5f356773) && self.var_5f356773 > 0) {
            self clientfield::set_player_uimodel("hud_items_cranked.crankedPct", min(1, self.var_5f356773 / function_600547a4()));
        } else {
            self clientfield::set_player_uimodel("hud_items_cranked.crankedPct", 0);
        }
        self clientfield::set_player_uimodel("hud_items_cranked.crankedMax", function_600547a4());
        waitframe(1);
    }
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x4
// Checksum 0xfec20ced, Offset: 0x2730
// Size: 0x5bc
function private function_bbdbb1b6() {
    level endon(#"end_game");
    self endon(#"disconnect");
    self thread function_52203507();
    self flag::set("become_cranked");
    self playsoundtoplayer(#"hash_702e9fc4e46d0bf1", self);
    scoreevents::processscoreevent("cranked_start_zm", self, undefined, undefined);
    self perks::perk_setperk(#"specialty_fastweaponswitch");
    self perks::perk_setperk(#"specialty_staminup");
    self perks::perk_setperk(#"specialty_fastreload");
    while (isalive(self) && self.var_5f356773 > 0) {
        self.var_5f356773 -= float(function_60d95f53()) / 1000;
        if (self function_64030a52()) {
            self function_50454ebf(1);
            while (self function_64030a52()) {
                waitframe(1);
            }
            self.var_5f356773 = int(ceil(self.var_5f356773));
            self thread function_bab1a386(self.var_5f356773);
        }
        waitframe(1);
    }
    if (!isdefined(self)) {
        return;
    }
    if (self laststand::player_is_in_laststand()) {
        self notify(#"fake_death");
        self zm_laststand::function_4d7504fd();
        self notify(#"stop_revive_trigger");
        if (isdefined(self.revivetrigger)) {
            self.revivetrigger delete();
        }
        self namespace_791d0451::function_a173ab53();
        self zm_laststand::laststand_enable_player_weapons(1);
        self.laststand = undefined;
        self.var_67ec7eb0 = 1;
        self clientfield::set("zmbLastStand", 0);
        self undolaststand();
        self clientfield::set("zm_last_stand_postfx", 0);
        clientfield::set_world_uimodel("PlayerList.client" + self.entnum + ".playerIsDowned", 0);
        self val::reset(#"laststand", "ignoreme");
        self clientfield::set_player_uimodel("hud_items_cranked.crankedPct", 0);
        self clientfield::increment("cranked_explode_fx");
        wait(0.1);
        self dodamage(self.health + 1, self.origin);
        self thread function_50454ebf(0, 2);
    } else if (isalive(self)) {
        self clientfield::set_player_uimodel("hud_items_cranked.crankedPct", 0);
        self clientfield::increment("cranked_explode_fx");
        wait(0.1);
        self dodamage(self.health + 1, self.origin);
        self thread function_50454ebf(0, 2);
    } else {
        self thread function_50454ebf(0);
    }
    if (self perks::perk_hasperk(#"specialty_fastweaponswitch")) {
        self perks::perk_unsetperk(#"specialty_fastweaponswitch");
    }
    if (self perks::perk_hasperk(#"specialty_staminup")) {
        self perks::perk_unsetperk(#"specialty_staminup");
    }
    if (self perks::perk_hasperk(#"specialty_fastreload")) {
        self perks::perk_unsetperk(#"specialty_fastreload");
    }
    self flag::clear("become_cranked");
}

// Namespace zcranked/zcranked
// Params 1, eflags: 0x0
// Checksum 0x45c3ef23, Offset: 0x2cf8
// Size: 0x13a
function function_bab1a386(n_seconds) {
    self notify(#"hash_2968dc9f8d9c8186");
    self endon(#"death", #"hash_2968dc9f8d9c8186");
    self clientfield::set_to_player("sr_defend_timer", 0);
    self clientfield::set_to_player("cranked_timer_sfx", 0);
    util::wait_network_frame();
    n_seconds = int(ceil(n_seconds));
    if (!level.var_4f12f6d0 sr_objective_timer::is_open(self)) {
        level.var_4f12f6d0 sr_objective_timer::open(self, 0);
    }
    self clientfield::set_to_player("sr_defend_timer", n_seconds);
    self clientfield::set_to_player("cranked_timer_sfx", 1);
    wait(n_seconds);
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x0
// Checksum 0xc3e4fcb0, Offset: 0x2e40
// Size: 0xa8
function function_64030a52() {
    if (level flag::get("cranked_pause") || isgodmode(self) || self isinmovemode("noclip", "ufo") || self getinvulnerability() || is_true(self.var_16735873)) {
        return true;
    }
    return false;
}

// Namespace zcranked/zcranked
// Params 2, eflags: 0x0
// Checksum 0xa6155ff1, Offset: 0x2ef0
// Size: 0x10e
function function_50454ebf(b_paused, waittime = 0) {
    level endon(#"end_game");
    self endon(#"disconnect");
    self notify(#"hash_3d27f53ca284b924");
    self endon(#"hash_3d27f53ca284b924");
    if (isdefined(waittime) && waittime > 0) {
        wait(waittime);
    }
    if (!b_paused && level.var_4f12f6d0 sr_objective_timer::is_open(self)) {
        level.var_4f12f6d0 sr_objective_timer::close(self);
    }
    self clientfield::set_to_player("cranked_timer_sfx", 0);
    self notify(#"hash_2968dc9f8d9c8186");
}

// Namespace zcranked/zcranked
// Params 10, eflags: 0x4
// Checksum 0x41d8907f, Offset: 0x3008
// Size: 0xe4
function private function_2f8f38e7(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration) {
    self endon(#"disconnect");
    if ((self namespace_e86ffa8::function_33d837e4() || self namespace_e86ffa8::function_8923370c(5)) && !is_true(self.var_b895a3ff)) {
        self zm_player::callback_playerlaststand(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration);
    }
}

// Namespace zcranked/zcranked
// Params 10, eflags: 0x4
// Checksum 0x6608ff8f, Offset: 0x30f8
// Size: 0x32c
function private function_62dd8e0c(einflictor, attacker, *idamage, smeansofdeath, weapon, *var_fd90b0bb, vdir, *shitloc, psoffsettime, deathanimduration) {
    self endon(#"disconnect");
    self callback::callback(#"on_player_bleedout");
    globallogic::updateteamstatus(1);
    foreach (talent in self.var_7341f980) {
        namespace_791d0451::function_4c1d0e25(talent);
    }
    if (!isdefined(self.var_3b511a7c)) {
        self.var_3b511a7c = 0;
    }
    self.var_3b511a7c++;
    self.deaths++;
    self.statusicon = "hud_status_dead";
    self recordplayerdeathzombies();
    self zm_stats::increment_player_stat("deaths");
    self zm_stats::increment_client_stat("deaths");
    self zm_stats::function_8f10788e("boas_deaths");
    body = self cloneplayer(deathanimduration, vdir, weapon, shitloc);
    self.body = body;
    body.player = self;
    body.iscorpse = 1;
    self thread delayed_ragdoll(body);
    var_a8cdcd4a = killcam::get_killcam_entity_info(weapon, smeansofdeath, vdir);
    clientnum = self getentitynumber();
    self thread killcam::killcam(clientnum, clientnum, var_a8cdcd4a, vdir, var_fd90b0bb, self.deathtime, 0, psoffsettime, 0, undefined, [], [], weapon, 0);
    wait(0.1);
    if (isdefined(level.player_becomes_zombie)) {
        self util::delay(5, "disconnect", level.player_becomes_zombie);
    }
    level util::delay(2, undefined, &zm_player::function_8ef51109, self, 1);
}

// Namespace zcranked/zcranked
// Params 1, eflags: 0x4
// Checksum 0xf32809b2, Offset: 0x3430
// Size: 0x1d4
function private delayed_ragdoll(ent) {
    if (isdefined(ent)) {
        if (is_true(ent.var_6f9e9dc9)) {
            if (!ent isragdoll()) {
                ent zm_utility::start_ragdoll();
            }
            return;
        }
        deathanim = ent getcorpseanim();
        if (isdefined(deathanim) && animhasnotetrack(deathanim, "ignore_ragdoll")) {
            return;
        }
    }
    waittillframeend();
    if (!isdefined(ent)) {
        return;
    }
    if (ent isragdoll()) {
        return;
    }
    deathanim = ent getcorpseanim();
    if (!isdefined(deathanim) || animhasnotetrack(deathanim, "ignore_ragdoll")) {
        return;
    }
    startfrac = 0.35;
    if (animhasnotetrack(deathanim, "start_ragdoll")) {
        times = getnotetracktimes(deathanim, "start_ragdoll");
        if (isdefined(times)) {
            startfrac = times[0];
        }
    }
    waittime = startfrac * getanimlength(deathanim);
    if (waittime > 0) {
        wait(waittime);
    }
    if (isdefined(ent)) {
        ent zm_utility::start_ragdoll();
    }
}

// Namespace zcranked/zcranked
// Params 0, eflags: 0x4
// Checksum 0xc674c645, Offset: 0x3610
// Size: 0x94
function private function_8e58680e() {
    level endon(#"end_game");
    level flag::set("disable_weapon_machine");
    level flag::wait_till(#"power_on");
    level flag::clear("disable_weapon_machine");
    level flag::set(#"pap_quest_completed");
}

