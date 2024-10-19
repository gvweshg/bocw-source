// Atian COD Tools GSC CW decompiler test
#using scripts\zm\zm_platinum_vo.gsc;
#using script_488555e9bc2ef7da;
#using script_100835406ec3feaf;
#using script_40627e3239a72ee;
#using script_b64b5c3524ca55e;
#using scripts\zm\zm_platinum_main_quest.gsc;
#using scripts\zm\zm_platinum_ww_quest.gsc;
#using scripts\zm\zm_platinum_pap_quest.gsc;
#using script_7d5a9e4ec34372d0;
#using script_1c92816b36da2771;
#using script_5b190e6124417f5a;
#using script_63b5c2449d0e2f48;
#using scripts\zm\zm_platinum_zones.gsc;
#using scripts\zm\zm_platinum_gamemodes.gsc;
#using scripts\zm\zm_ai_raz.gsc;
#using script_1ea5c1aec36ac889;
#using scripts\zm\ai\zm_ai_soa.gsc;
#using scripts\zm\ai\zm_ai_mimic.gsc;
#using scripts\zm\ai\zm_ai_mechz.gsc;
#using script_5eb334a29c814cf2;
#using scripts\zm\archetype\archetype_zod_companion.gsc;
#using script_76a8f964e4309959;
#using scripts\zm\ai\zm_ai_avogadro.gsc;
#using script_58860a35d0555f74;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using script_353f4332c07d6432;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using script_62caa307a394c18c;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using script_24c32478acf44108;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_fasttravel.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using script_7b1cd3908a825fdd;
#using script_3411bb48d41bd3b;
#using scripts\zm_common\zm_devgui.gsc;
#using script_4ce5d94e8c797350;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\zm_intel.gsc;
#using scripts\zm_common\zm_hazard.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using script_448683444db21d61;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm.gsc;
#using script_ed50e9299d3e143;
#using scripts\zm_common\zm_weapons.gsc;
#using script_2f560596a9a134ab;
#using scripts\zm_common\zm_score.gsc;
#using script_18077945bb84ede7;
#using script_4ccfb58a9443a60b;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\item_drop.gsc;
#using script_340a2e805e35f7a2;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\burnplayer.gsc;
#using scripts\core_common\scriptmodels_shared.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using script_744259b349d834c7;

#namespace zm_platinum;

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x1
// Checksum 0x5ef50ef1, Offset: 0x1490
// Size: 0x84
function autoexec opt_in() {
    level.aat_in_use = 1;
    level.random_pandora_box_start = 1;
    level.var_33833303 = &function_23c31b4e;
    level.var_e2f95698 = #"hash_103f5ac44716cbe4";
    level.var_462ca9bb = #"cdp_taacom";
    level.var_6ff1cc71[#"hash_4cc252a7609d289"] = 1;
}

// Namespace zm_platinum/level_init
// Params 1, eflags: 0x20
// Checksum 0xc8a0ff87, Offset: 0x1520
// Size: 0x186c
function event_handler[level_init] main(*eventstruct) {
    level.var_dfee7fc2 = #"hash_684819b1dcad20f5";
    level.var_775a83a7 = 1;
    namespace_1fd59e39::function_1376ec37(undefined, undefined, "tunnel_boundary_damage_volume");
    zm_intel::function_88645994(#"hash_4eeb1c7447479151", #"hash_5efbc7b901eeb16c", undefined, undefined, #"hash_62c9a6dffc5a51c2", #"zmintel_list_zm_platinum_omega_intel_all", #"zmintel_list_zm_platinum_darkaether_intel_all", undefined, #"zmintel_list_zm_platinum_requiem_intel_all");
    zm::init_fx();
    namespace_b574e135::init();
    namespace_bce659ef::init();
    namespace_6fb22263::init();
    zm_platinum_ww_quest::init();
    namespace_7a518726::init();
    namespace_1fc8f2e3::init();
    namespace_4e8d47b1::init();
    namespace_54685ebd::init();
    zm_platinum_vo::init();
    clientfield::register_clientuimodel("player_lives", 1, 2, "int");
    clientfield::register("toplayer", "" + #"hash_7c5d3ac35353f95c", 24000, 1, "int");
    clientfield::register("toplayer", "" + #"hash_3c8a07f3b4eaf129", 1, 1, "int");
    clientfield::register("toplayer", "" + #"hash_4be33f9c734f0cb9", 1, 2, "int");
    clientfield::register("world", "" + #"hash_2a93d12c263f2d68", 24000, getminbitcountfornum(7), "int");
    clientfield::register("world", "" + #"hash_7d7dcebcb0511b14", 1, 1, "int");
    clientfield::register("world", "" + #"hash_2971ea22ea5a646a", 1, 3, "int");
    clientfield::register("scriptmover", "" + #"hash_19a76e1eb767b16b", 1, 1, "int");
    clientfield::register("toplayer", "" + #"hash_6e5cc4162abd613f", 24000, 1, "int");
    clientfield::register("actor", "" + #"hash_15e37ba2a31217b8", 24000, 1, "int");
    clientfield::register("world", "" + #"hash_3a84ac42abd608d2", 24000, 1, "int");
    clientfield::register("world", "" + #"hash_600dd9c10bd3447b", 24000, 2, "int");
    clientfield::register("world", "" + #"hash_228f0acdd4255cb", 24000, 1, "int");
    clientfield::register("actor", "" + #"hash_3e4641a9ea00d061", 24000, 1, "int");
    clientfield::register("actor", "" + #"hash_703543ca871a0f75", 24000, 2, "int");
    clientfield::register("toplayer", "" + #"hash_46bbaae5eb8a7080", 24000, 1, "int");
    clientfield::register("world", "" + #"hash_6eb96d2ad043aa56", 1, 1, "int");
    clientfield::register("world", "" + #"hash_7b3ada6e5b1cf81e", 1, 1, "int");
    clientfield::register("world", "" + #"hash_56c7e620d1de163a", 1, 1, "counter");
    clientfield::register("toplayer", "fogofwareffects", 1, getminbitcountfornum(2), "int");
    clientfield::register("vehicle", "" + #"hash_315d8062badb2345", 24000, getminbitcountfornum(2), "int");
    clientfield::register("allplayers", "" + #"hash_1fb207d10fbe27ce", 24000, 1, "int");
    clientfield::register("allplayers", "" + #"hash_73227fdae7d9bc0e", 28000, 2, "int");
    level.default_start_location = "zone_rooftops_start";
    level.default_game_mode = "zclassic";
    level._allow_melee_weapon_switching = 1;
    level.zombiemode_reusing_pack_a_punch = 1;
    level.var_88672174 = 116;
    level.var_5b8c6c9b = 117;
    level.var_f1662fe9 = 118;
    level.var_d2ba1c27 = &namespace_33c196c8::function_bad0c914;
    level.var_e0ee1b1d = &namespace_33c196c8::function_bad0c914;
    level.var_71f14231 = &namespace_33c196c8::function_b926dcfd;
    level.var_15eefdd = 10;
    level.custom_spawner_entry[#"crawl"] = &zm_spawner::function_45bb11e4;
    level.custom_spawner_entry[#"hash_23e56c56dab2f6fc"] = &zm_spawner::function_814fc0d0;
    level.var_d0ab70a2 = #"hash_499ec58230cbe8b6";
    level.var_dbf9c70d = &function_452e5ad6;
    level.player_out_of_playable_area_monitor = 1;
    level.addrbuff = &function_65c65feb;
    level.local_doors_stay_open = 1;
    level.var_1b57c9ca = 1;
    level.var_76e8fb05 = 1;
    level.var_dfe80386 = 1;
    callback::function_532a4f74(&function_a648d1a6);
    callback::function_c16ce2bc(&function_dc9b097c);
    callback::function_74872db6(&function_a56b42c0);
    util::registerclientsys("platMusUnlock");
    level.var_6f6cc58 = &function_6f6cc58;
    scene::function_497689f6(#"hash_684819b1dcad20f5", "helicopter", "tag_probe_attach", "prb_mil_ru_heli_trans");
    scene::add_scene_func(#"hash_684819b1dcad20f5", &function_a0f98b8b, "sh010", "sh010");
    scene::add_scene_func(#"hash_684819b1dcad20f5", &function_a0f98b8b, "sh020", "sh020");
    scene::add_scene_func(#"hash_684819b1dcad20f5", &function_a0f98b8b, "stop");
    load::main();
    namespace_958b287a::init();
    compass::setupminimap("");
    setdvar(#"hash_64d8f355a9e6daa5", 1);
    setdvar(#"hash_b3395a8d3abf84a", 1);
    setdvar(#"hash_75a2e23bc66a08a7", 0);
    setdvar(#"hash_2d56e13848a82d14", 0);
    setdvar(#"hash_384191a42356d34", 1);
    setdvar(#"hash_7b06b8037c26b99b", 30);
    level.var_f30c7ef1 = 1;
    level.var_e714f814 = 1;
    callback::on_spawned(&on_player_spawned);
    callback::on_player_killed(&namespace_207ea311::function_31b6f21e);
    callback::add_callback(#"hash_594217387367ebb4", &function_d81240c3);
    level._effect[#"hash_10dedae3d37c056f"] = #"hash_1337a37de3e6690";
    level.var_fc439a95 = #"ww_mega_barrel_fullauto_copycat_t9";
    level.var_7f72eddd = "default_zombies_platinum";
    level.var_dafeed10 = "exfil_platinum_";
    level.var_4bc7192d = #"hash_3f8c4e1a10327ae3";
    level.var_8bb7479c = #"hash_3e633e5380f3653b";
    level.var_72a3d8bc = #"hash_53349c8b66ec5f42";
    level.var_26ed6a07 = 600;
    level.var_c86f12d4 = 200;
    level.var_aaf7505f = 120;
    level.var_baed3b8e = 1750;
    level.var_ac94c2b8 = 2;
    namespace_591b4396::function_fa5bd408(array("zone_destroyed_upper_floors", "zone_destroyed_upper_floors2", "zone_destroyed_upper_room"));
    level.zones = [];
    level.zone_manager_init_func = &namespace_3d14a28e::zone_init;
    level thread zm_zonemgr::manage_zones("zone_rooftops_start");
    namespace_207ea311::function_c6b98f73(["zone_east_berlin_street_alley", "zone_east_berlin_street_1", "zone_east_berlin_street_2", "zone_east_berlin_street_3", "zone_east_berlin_street_4", "zone_bar", "zone_market", "zone_electronics_store", "zone_secret_spy_tunnel", "zone_sewers_and_escape_tunnel", "zone_sewers_and_escape_tunnel2", "zone_destroyed_upper_floors", "zone_rooftops_start", "zone_rooftops_interior", "zone_east_berlin_hotel_1", "zone_east_berlin_hotel_2", "zone_east_berlin_hotel_3", "zone_east_berlin_hotel_4", "zone_hotel_jack_room", "zone_korber_roof", "zone_korber_stairs", "zone_korber_roof2", "zone_korber_sewing_room", "zone_destroyed_upper_floors2", "zone_destroyed_upper_room", "zone_east_berlin_street", "zone_ghost_station", "zone_ghost_station_2", "zone_ghost_station_3", "zone_ghost_station_4", "zone_ghost_station_stairs", "zone_basement_2", "zone_basement_1", "zone_power_substation", "zone_power_substation2", "zone_hidden_lab", "zone_lab_tunnel", "zone_safe_house", "zone_control_room", "zone_no_mans_land_2", "zone_no_mans_land_3", "zone_sewers_stairs"]);
    level.var_666d1958 = ["zone_ghost_station_stairs", "zone_ghost_station", "zone_ghost_station_2", "zone_ghost_station_3", "zone_ghost_station_4"];
    level.var_7baf05a7 = ["zone_power_substation", "zone_power_substation2"];
    level.var_e40bce8f = ["zone_ghost_station_stairs", "zone_ghost_station", "zone_ghost_station_2", "zone_ghost_station_3", "zone_ghost_station_4", "zone_sewers_and_escape_tunnel", "zone_sewers_and_escape_tunnel2", "zone_secret_spy_tunnel", "zone_control_room"];
    level.var_cef1cab5 = ["zone_hidden_lab", "zone_power_substation", "zone_power_substation2", "zone_sewers_stairs", "zone_basement_2", "zone_basement_1"];
    level.var_65c43c31 = ["zone_safe_house", "zone_ghost_station_stairs", "zone_ghost_station", "zone_ghost_station_2", "zone_ghost_station_3", "zone_ghost_station_4", "zone_basement_2", "zone_basement_1", "zone_control_room", "zone_sewers_and_escape_tunnel", "zone_sewers_and_escape_tunnel2", "zone_secret_spy_tunnel", "zone_hidden_lab", "zone_power_substation", "zone_sewers_stairs", "zone_power_substation2"];
    level.var_692bc53a = ["zone_ghost_station", "zone_ghost_station_2", "zone_ghost_station_3", "zone_ghost_station_4", "zone_ghost_station_stairs"];
    level.var_aeef5b56 = ["zone_safe_house", "zone_ghost_station", "zone_ghost_station_2", "zone_ghost_station_3", "zone_ghost_station_4", "zone_basement_2", "zone_control_room", "zone_sewers_and_escape_tunnel", "zone_sewers_and_escape_tunnel2", "zone_secret_spy_tunnel", "zone_hidden_lab", "zone_power_substation", "zone_sewers_stairs", "zone_power_substation2", "zone_bunny_club"];
    level thread zm_perks::spare_change();
    level thread function_e0a4ccda();
    level thread sndfunctions();
    namespace_99d0d95e::init();
    namespace_178eb32b::init();
    level thread function_859fa480(16);
    level thread function_32401229(11);
    level thread function_9e6f187d(25);
    level thread function_ae72b4d0(15);
    level thread function_b4a55178();
    level thread function_ae76beb4();
    level thread function_f37d9da7();
    level thread function_3297eca5();
    level thread function_8c581f55();
    level thread function_92d44ee0();
    level callback::on_revived(&on_player_revived);
    zm_player::register_player_damage_callback(&on_player_damaged);
    level thread namespace_47c5b560::function_470c9a51(["vol_ladder_east_berlin_street"]);
    level thread function_90cffb5b(["rappel_spy_tunnel_upper", "rappel_spy_tunnel_lower", "rappel_sewer_upper", "rappel_sewer_lower"]);
    /#
        level thread function_cd7a3de4();
    #/
    /#
        level thread function_c13a2cf5();
    #/
    level thread function_4c86cc5();
    level thread function_66efff7a();
    namespace_9ff9f642::register_burn(#"ghost_train_fire", 6, 9999);
    level thread function_49fa8c75();
    level thread open_sesame_watcher();
    level.var_6103ecd9 = 15;
    level function_419047b9();
    level thread function_9feaaed();
    level.round_start_custom_func = &function_565ac641;
    level.round_end_custom_logic = &function_e0b47006;
    level.var_9d96d174 = 1;
    level thread function_9d23c457();
    level thread function_d888610a();
    zm_utility::function_89dbd679((-2802, 11162.2, 570), 96, 50, (-3038, 11230.2, 498.5), 256);
    zm_utility::function_89dbd679((-2627, 9895, 8), 96, 50, (-2594, 9919, 8), 96);
    level.player_out_of_playable_area_monitor_callback = &player_out_of_playable_area_monitor_callback;
    level thread function_a8a85013();
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x849d5205, Offset: 0x2d98
// Size: 0x64
function function_a8a85013() {
    spawncollision("collision_clip_wall_512x512x10", "collider", (-2597, 11344, 634), (0, 0, 0));
    spawncollision("collision_clip_wall_512x512x10", "collider", (-2597, 11196, 634), (0, 0, 0));
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xbdf25f44, Offset: 0x2e08
// Size: 0x24
function function_565ac641() {
    level flag::set(#"hash_3dfd0dd4caef92a9");
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x4805dbc7, Offset: 0x2e38
// Size: 0x24
function function_e0b47006() {
    level flag::clear(#"hash_3dfd0dd4caef92a9");
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x19e98c10, Offset: 0x2e68
// Size: 0xf2
function player_out_of_playable_area_monitor_callback() {
    if (isdefined(self)) {
        if (distance2dsquared(self.origin, (-2159.5, 13415, 115)) <= sqr(96) || distance2dsquared(self.origin, (-1381.1, 13774, 206.4)) <= sqr(96) || distance2dsquared(self.origin, (-2552.5, 11568.4, 56.2)) <= sqr(96)) {
            return false;
        }
    }
    return true;
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xabe7483c, Offset: 0x2f68
// Size: 0x62e
function function_452e5ad6() {
    self endon(#"disconnect");
    if (level flag::get(#"in_dark_side")) {
        var_1a672bba = struct::get_array("zone_bunny_club_respawn_points");
        s_player_spawn = array::random(var_1a672bba);
        return s_player_spawn;
    }
    spawn_points = zm_gametype::get_player_spawns_for_gametype();
    spawn_points = arraysortclosest(spawn_points, self.origin, undefined, 0, 2000);
    var_a6107c9 = array("zone_bunny_club");
    var_bdf9e3c2 = self zm_zonemgr::get_player_zone();
    a_adjacent_zones = level.zones[var_bdf9e3c2].adjacent_zones;
    var_d117c934 = [];
    if (isdefined(var_bdf9e3c2)) {
        foreach (point in spawn_points) {
            if (isentity(level.var_22a21403) && !istouching(point.origin, level.var_22a21403)) {
                continue;
            }
            if (!zm_zonemgr::zone_is_enabled(point.script_noteworthy) || isinarray(var_a6107c9, point.script_noteworthy)) {
                continue;
            }
            if (isdefined(a_adjacent_zones) && a_adjacent_zones.size > 0) {
                var_1d4c3ee8 = zm_zonemgr::get_zone_from_position(point.origin);
                if (!isdefined(var_1d4c3ee8) || !isinarray(a_adjacent_zones, var_1d4c3ee8) && var_1d4c3ee8 != var_bdf9e3c2) {
                    continue;
                }
            } else {
                var_1d4c3ee8 = zm_zonemgr::get_zone_from_position(point.origin);
                if (var_1d4c3ee8 != var_bdf9e3c2) {
                    continue;
                }
            }
            if (!isdefined(var_d117c934)) {
                var_d117c934 = [];
            } else if (!isarray(var_d117c934)) {
                var_d117c934 = array(var_d117c934);
            }
            if (!isinarray(var_d117c934, point)) {
                var_d117c934[var_d117c934.size] = point;
            }
        }
    }
    if (var_d117c934.size == 0) {
        foreach (point in spawn_points) {
            if (isentity(level.var_22a21403) && !istouching(point.origin, level.var_22a21403)) {
                continue;
            }
            if (!zm_zonemgr::zone_is_enabled(point.script_noteworthy) || isinarray(var_a6107c9, point.script_noteworthy)) {
                continue;
            }
            if (!isdefined(var_d117c934)) {
                var_d117c934 = [];
            } else if (!isarray(var_d117c934)) {
                var_d117c934 = array(var_d117c934);
            }
            if (!isinarray(var_d117c934, point)) {
                var_d117c934[var_d117c934.size] = point;
            }
        }
    }
    var_7fc5b7c3 = arraysortclosest(var_d117c934, self.origin, 20, 0, 2000);
    var_5d59bb63 = arraysortclosest(var_d117c934, self.origin, 20, 1000, 2000);
    if (isarray(level.var_fe1757e7)) {
        var_5d59bb63 = arraycombine(var_5d59bb63, level.var_fe1757e7);
    }
    var_1a672bba = var_5d59bb63.size ? var_5d59bb63 : var_7fc5b7c3;
    s_player_spawn = array::random(var_1a672bba);
    if (s_player_spawn.script_noteworthy === #"zone_ghost_station_2") {
        s_player_spawn.origin = (-2335.62, 11589.8, -278);
    }
    if (s_player_spawn.script_noteworthy === #"zone_ghost_station_3") {
        s_player_spawn.origin = (-2481.43, 11584.8, -285);
    }
    if (s_player_spawn.script_noteworthy === #"zone_ghost_station_4") {
        s_player_spawn.origin = (-1209.13, 11597.9, -284.75);
    }
    return s_player_spawn;
}

// Namespace zm_platinum/zm_platinum
// Params 2, eflags: 0x2 linked
// Checksum 0xf46f70cf, Offset: 0x35a0
// Size: 0x5c
function function_a0f98b8b(*a_ents, str_shot) {
    if (str_shot === "sh010") {
        level util::set_lighting_state(1);
        return;
    }
    level util::set_lighting_state(0);
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x54b4bf2f, Offset: 0x3608
// Size: 0x74
function on_player_spawned() {
    self.var_6dfeb5ef = &function_6eba65ea;
    self thread function_bf14bffe();
    self thread function_20ad9d07();
    self thread function_833114ef();
    self thread function_512d6468();
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x58e8ee85, Offset: 0x3688
// Size: 0x11e
function function_512d6468() {
    self endon(#"death");
    while (true) {
        util::waittill_any_ents(self, "zone_change", level, "end_of_round");
        if (self.cached_zone_name === "zone_no_mans_land_2" || self.cached_zone_name === "zone_no_mans_land_3") {
            var_b7f7d612 = level.round_number;
            while (self.cached_zone_name === "zone_no_mans_land_2" || self.cached_zone_name === "zone_no_mans_land_3") {
                util::waittill_any_ents(self, "zone_change", level, "end_of_round");
                if (level.round_number - var_b7f7d612 >= 5) {
                    self zm_stats::increment_challenge_stat(#"hash_53f2c142041511ec");
                    return;
                }
            }
        }
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x6cb3a996, Offset: 0x37b0
// Size: 0xf8
function function_833114ef() {
    self endon(#"death");
    level flag::wait_till("start_zombie_round_logic");
    while (true) {
        self clientfield::set("" + #"hash_1fb207d10fbe27ce", 1);
        util::wait_network_frame();
        level flag::wait_till("power_on");
        self clientfield::set("" + #"hash_1fb207d10fbe27ce", 0);
        util::wait_network_frame();
        level flag::wait_till_clear("power_on");
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x8d4b8ecd, Offset: 0x38b0
// Size: 0x1f6
function function_bf14bffe() {
    self endon(#"death", #"disconnect", #"hash_7f3f3b496fcd3707");
    level flag::wait_till_all([#"load_main_complete", #"intro_scene_done"]);
    while (true) {
        var_1e8cb595 = bullettracepassed(self.origin, self.origin + (0, 0, 10000), 0, self);
        if (var_1e8cb595 && !self flag::get(#"hash_1561f2d74277f5a1") && !is_true(self.var_16735873)) {
            self flag::set(#"hash_1561f2d74277f5a1");
            self clientfield::set_to_player("" + #"hash_7c5d3ac35353f95c", 1);
        } else if (!var_1e8cb595 && self flag::get(#"hash_1561f2d74277f5a1")) {
            self flag::clear(#"hash_1561f2d74277f5a1");
            self clientfield::set_to_player("" + #"hash_7c5d3ac35353f95c", 0);
        }
        wait(3);
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x1f4f83d4, Offset: 0x3ab0
// Size: 0xe0
function function_4af68b() {
    foreach (player in getplayers()) {
        player notify(#"hash_7f3f3b496fcd3707");
        player flag::clear(#"hash_1561f2d74277f5a1");
        player clientfield::set_to_player("" + #"hash_7c5d3ac35353f95c", 0);
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x0
// Checksum 0x2b3f5b3c, Offset: 0x3b98
// Size: 0x2c
function offhand_weapon_overrride() {
    zm_loadout::register_tactical_grenade_for_level(#"zhield_dw", 1);
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x0
// Checksum 0xccbffc10, Offset: 0x3bd0
// Size: 0xc6
function offhand_weapon_give_override(str_weapon) {
    self endon(#"death");
    if (zm_loadout::is_tactical_grenade(str_weapon) && isdefined(self zm_loadout::get_player_tactical_grenade()) && !self zm_loadout::is_player_tactical_grenade(str_weapon)) {
        self setweaponammoclip(self zm_loadout::get_player_tactical_grenade(), 0);
        self takeweapon(self zm_loadout::get_player_tactical_grenade());
    }
    return false;
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x9e3ff4e7, Offset: 0x3ca0
// Size: 0x3c
function function_e0a4ccda() {
    level clientfield::set("" + #"hash_7d7dcebcb0511b14", 1);
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x9e65868a, Offset: 0x3ce8
// Size: 0x54
function sndfunctions() {
    zm_utility::add_sound("zmb_heavy_door_open", "zmb_heavy_door_open");
    level thread setup_personality_character_exerts();
    level thread setupmusic();
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x9e4aeb97, Offset: 0x3d48
// Size: 0x3c2
function setup_personality_character_exerts() {
    level.exert_sounds[1][#"hitmed"] = "vox_plr_1_exert_pain";
    level.exert_sounds[2][#"hitmed"] = "vox_plr_2_exert_pain";
    level.exert_sounds[3][#"hitmed"] = "vox_plr_3_exert_pain";
    level.exert_sounds[4][#"hitmed"] = "vox_plr_4_exert_pain";
    level.exert_sounds[1][#"hitlrg"] = "vox_plr_1_exert_pain";
    level.exert_sounds[2][#"hitlrg"] = "vox_plr_2_exert_pain";
    level.exert_sounds[3][#"hitlrg"] = "vox_plr_2_exert_pain";
    level.exert_sounds[4][#"hitlrg"] = "vox_plr_3_exert_pain";
    level.exert_sounds[1][#"drowning"] = "vox_plr_1_exert_underwater_air_low";
    level.exert_sounds[2][#"drowning"] = "vox_plr_2_exert_underwater_air_low";
    level.exert_sounds[3][#"drowning"] = "vox_plr_3_exert_underwater_air_low";
    level.exert_sounds[4][#"drowning"] = "vox_plr_4_exert_underwater_air_low";
    level.exert_sounds[1][#"cough"] = "vox_plr_1_exert_gas_cough";
    level.exert_sounds[2][#"cough"] = "vox_plr_2_exert_gas_cough";
    level.exert_sounds[3][#"cough"] = "vox_plr_3_exert_gas_cough";
    level.exert_sounds[4][#"cough"] = "vox_plr_4_exert_gas_cough";
    level.exert_sounds[1][#"underwater_emerge"] = "vox_plr_1_exert_underwater_emerge_breath";
    level.exert_sounds[2][#"underwater_emerge"] = "vox_plr_2_exert_underwater_emerge_breath";
    level.exert_sounds[3][#"underwater_emerge"] = "vox_plr_3_exert_underwater_emerge_breath";
    level.exert_sounds[4][#"underwater_emerge"] = "vox_plr_4_exert_underwater_emerge_breath";
    level.exert_sounds[1][#"underwater_gasp"] = "vox_plr_1_exert_underwater_emerge_gasp";
    level.exert_sounds[2][#"underwater_gasp"] = "vox_plr_2_exert_underwater_emerge_gasp";
    level.exert_sounds[3][#"underwater_gasp"] = "vox_plr_3_exert_underwater_emerge_gasp";
    level.exert_sounds[4][#"underwater_gasp"] = "vox_plr_4_exert_underwater_emerge_gasp";
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xad08fa68, Offset: 0x4118
// Size: 0x1bc
function setupmusic() {
    zm_audio::musicstate_create("round_start_first", 3, "round_start_first");
    zm_audio::musicstate_create("round_start", 3, "round_start_00", "round_start_01", "round_start_02");
    zm_audio::musicstate_create("round_end", 3, "round_end_00", "round_end_01", "round_end_02");
    zm_audio::musicstate_create("round_start_special", 3, "round_start_special_00");
    zm_audio::musicstate_create("round_end_special", 3, "round_end_special_00");
    zm_audio::musicstate_create("game_over", 5, "gameover_platinum");
    zm_audio::musicstate_create("ee_song", 4, "ee_song");
    zm_audio::musicstate_create("papevent", 4, "papevent");
    zm_audio::function_e441162b("papevent");
    zm_audio::musicstate_create("tribes", 4, "tribes");
    zm_audio::function_e441162b("tribes");
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0xc43ecf9f, Offset: 0x42e0
// Size: 0x178
function function_65c65feb(b_active = 0) {
    if (b_active) {
        foreach (player in getplayers()) {
            player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 2);
        }
        return;
    }
    foreach (player in getplayers()) {
        player clientfield::set_to_player("" + #"hash_4be33f9c734f0cb9", 3);
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x7ca69042, Offset: 0x4460
// Size: 0xbc
function function_23c31b4e() {
    if (is_true(self.is_hotjoining) || self util::is_spectating()) {
        return;
    }
    self endoncallback(&namespace_207ea311::function_31b6f21e, #"death");
    if (!isdefined(self.var_19f4406e)) {
        self.var_19f4406e = 0;
    }
    self thread function_6e0fa6eb();
    self thread function_6cb44e03();
    self function_3ba2978d();
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x30ba2cca, Offset: 0x4528
// Size: 0x132
function function_6e0fa6eb() {
    self endon(#"death", #"disconnect");
    while (true) {
        if (!is_true(self.var_eddb113e) && (self actionslotonebuttonpressed() || self buttonbitstate("BUTTON_BIT_FLASHLIGHT")) && !self clientfield::get_player_uimodel("hudItems.srOverlayOpen")) {
            var_ba127c46 = (is_true(self.var_c6af46f9) ? 2 : 1) + 1;
            self.var_19f4406e = (self.var_19f4406e + 1) % var_ba127c46;
            self flag::set(#"hash_2d6980738132f263");
            wait(0.5);
            continue;
        }
        waitframe(1);
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x5f33e5ca, Offset: 0x4668
// Size: 0x4e0
function function_3ba2978d() {
    level endon(#"hash_31a61be99d69708a");
    level flag::wait_till_all([#"intro_scene_done", "all_players_spawned", "start_zombie_round_logic"]);
    wait(1);
    if (!level flag::get("power_on")) {
        self thread zm_equipment::show_hint_text(#"hash_77929503066a286b", 5);
        self flag::wait_till_timeout(5, #"hash_2d6980738132f263");
        self thread zm_equipment::function_57fbff5c();
        self flag::clear(#"hash_2d6980738132f263");
    }
    while (true) {
        var_a08cd817 = self flag::get(#"hash_2d6980738132f263");
        if (!var_a08cd817) {
            if (level flag::get("power_on")) {
                var_cef36b49 = self zm_zonemgr::is_player_in_zone(level.var_666d1958);
            } else {
                var_cef36b49 = self zm_zonemgr::is_player_in_zone(level.var_b80c4ecc);
            }
            self.var_19f4406e = var_cef36b49 ? 1 : 0;
        }
        switch (self.var_19f4406e) {
        case 0:
        case 1:
            if (!self flag::get(#"hash_8b791c5e5b0b269") && !self flag::get(#"hash_7fb35d12e64cf793")) {
                self clientfield::set("" + #"hash_63af42145e260fb5", self.var_19f4406e);
                self clientfield::set_to_player("" + #"hash_6d58634b9c00e983", 0);
            } else {
                self clientfield::set("" + #"hash_63af42145e260fb5", 0);
                self clientfield::set_to_player("" + #"hash_6d58634b9c00e983", 0);
            }
            break;
        case 2:
            if (!self flag::get(#"hash_8b791c5e5b0b269") && !self flag::get(#"hash_7fb35d12e64cf793")) {
                self clientfield::set("" + #"hash_63af42145e260fb5", 3);
                self clientfield::set_to_player("" + #"hash_6d58634b9c00e983", 1);
            } else {
                self clientfield::set("" + #"hash_63af42145e260fb5", 0);
                self clientfield::set_to_player("" + #"hash_6d58634b9c00e983", 0);
            }
            break;
        }
        if (var_a08cd817) {
            util::waittill_any_ents(self, #"hash_2d6980738132f263", self, #"hash_8b791c5e5b0b269", self, #"hash_7fb35d12e64cf793");
            continue;
        }
        util::waittill_any_ents(self, "zone_change", level, "power_on", self, #"hash_2d6980738132f263", self, #"hash_8b791c5e5b0b269", self, #"hash_7fb35d12e64cf793");
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x6 linked
// Checksum 0x18673825, Offset: 0x4b50
// Size: 0x98
function private function_6cb44e03() {
    self endon(#"death", #"disconnect");
    while (true) {
        if (self isonladder()) {
            self flag::set(#"hash_8b791c5e5b0b269");
        } else {
            self flag::clear(#"hash_8b791c5e5b0b269");
        }
        wait(0.5);
    }
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x40a81a4a, Offset: 0x4bf0
// Size: 0x352
function function_6f6cc58(e_player) {
    if (isdefined(self) && isdefined(e_player)) {
        if (self.archetype === #"zombie" || self.archetype === #"tormentor") {
            if (isplayer(e_player)) {
                if (isdefined(self.v_zombie_custom_goal_pos) && isdefined(self.var_29656770)) {
                    return 1;
                }
                zone_path = zm_zonemgr::function_54fc7938(e_player, self);
                if (isdefined(zone_path)) {
                    return 1;
                }
            }
        } else if (isplayer(e_player) && self.archetype === #"soa") {
            zone_path = zm_zonemgr::function_54fc7938(e_player, self);
            zipline = zm_ai_soa::function_4a3e695a(self, e_player);
            if (isdefined(zipline) || isdefined(zone_path)) {
                return 1;
            }
            if (distance2dsquared(self.origin, e_player.origin) < sqr(500)) {
                return 1;
            }
            return 0;
        } else if (isplayer(e_player) && self.archetype === #"mechz") {
            if (!is_true(self.var_7c4488fd)) {
                var_1ea000f7 = ["zone_american_sector_street", "zone_american_sector_right_building", "zone_american_sector_left_building"];
                zone_name = self zm_utility::get_current_zone();
                if (!isdefined(zone_name)) {
                    zone_name = self.var_5e54763a;
                }
                zone_path = zm_zonemgr::function_54fc7938(e_player, zone_name);
                if (isinarray(var_1ea000f7, zone_name)) {
                    var_b41144a7 = isdefined(zone_path) && (!isdefined(zone_path.to_zone) || !isinarray(var_1ea000f7, zone_path.to_zone));
                    if (!var_b41144a7 && !isdefined(self.var_cc1c538e)) {
                        self.zone_name = zone_name;
                        self.var_11f7a9af = 1;
                        self.var_cc1c538e = zm_cleanup::get_escape_position_in_current_zone();
                    }
                    return var_b41144a7;
                }
                self.var_11f7a9af = undefined;
                return isdefined(zone_path);
            }
            return 1;
        } else {
            return 1;
        }
    }
    return 0;
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x6 linked
// Checksum 0xd10286c3, Offset: 0x4f50
// Size: 0x44
function private function_b4a55178() {
    level.fn_custom_zombie_spawner_selection = &function_ddc13fd6;
    level.zombie_spawners = array::sort_by_script_int(level.zombie_spawners, 1);
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xfe7cfbfd, Offset: 0x4fa0
// Size: 0x2f6
function function_ddc13fd6() {
    s_loc = array::random(level.zm_loc_types[#"zombie_location"]);
    var_87e4f82c = randomintrange(0, 100);
    var_b62ee10a = [0];
    if (level.round_number >= 13 || level flag::get(#"hash_5fff608f0c23a53f")) {
        if (var_87e4f82c <= 5) {
            if (level.round_number < 30 && !level flag::get(#"hash_14ac8b5a5e403984")) {
                return level.zombie_spawners[2];
            } else if (math::cointoss()) {
                return level.zombie_spawners[3];
            } else {
                return level.zombie_spawners[2];
            }
        }
    }
    if (var_87e4f82c <= 20) {
        return level.zombie_spawners[1];
    }
    if (level flag::get(#"hash_6e41f0a5d92ae86b")) {
        if (!isdefined(var_b62ee10a)) {
            var_b62ee10a = [];
        } else if (!isarray(var_b62ee10a)) {
            var_b62ee10a = array(var_b62ee10a);
        }
        var_b62ee10a[var_b62ee10a.size] = 6;
    }
    if (isdefined(s_loc) && isdefined(s_loc.zone_name)) {
        if (isinarray(level.var_57c0b4c1, s_loc.zone_name)) {
            if (!isdefined(var_b62ee10a)) {
                var_b62ee10a = [];
            } else if (!isarray(var_b62ee10a)) {
                var_b62ee10a = array(var_b62ee10a);
            }
            var_b62ee10a[var_b62ee10a.size] = 4;
        }
        if (!isinarray(level.var_28a7d418, s_loc.zone_name)) {
            if (!isdefined(var_b62ee10a)) {
                var_b62ee10a = [];
            } else if (!isarray(var_b62ee10a)) {
                var_b62ee10a = array(var_b62ee10a);
            }
            var_b62ee10a[var_b62ee10a.size] = 5;
        }
    }
    return level.zombie_spawners[array::random(var_b62ee10a)];
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x6 linked
// Checksum 0x40dd9629, Offset: 0x52a0
// Size: 0x84
function private function_859fa480(n_round) {
    zm_round_spawning::function_306ce518(#"mechz", &function_5e8a178a);
    level.var_1db9948 = n_round;
    zm_round_spawning::function_cc103b38(#"mechz", n_round);
    level.var_e333bf92 = &function_65c98960;
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x6 linked
// Checksum 0x7dacdedd, Offset: 0x5330
// Size: 0xb4
function private function_32401229(n_round) {
    zm_round_spawning::function_2876740e(#"soa", &function_76a7a9ef);
    zm_round_spawning::function_306ce518(#"soa", &function_2927859c);
    level.var_a1c6ba48 = n_round;
    zm_round_spawning::function_cc103b38(#"soa", n_round);
    level.var_194823e7 = &function_41a4961d;
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x6 linked
// Checksum 0xb44bc5a, Offset: 0x53f0
// Size: 0xb4
function private function_9e6f187d(n_round) {
    zm_round_spawning::function_2876740e(#"raz", &function_d4f11e3c);
    zm_round_spawning::function_306ce518(#"raz", &function_f1355240);
    level.var_36678664 = n_round;
    zm_round_spawning::function_376e51ef(#"raz", n_round);
    level.var_2e33420c = &function_218424b3;
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x6 linked
// Checksum 0xf7703065, Offset: 0x54b0
// Size: 0x5c
function private function_ae72b4d0(n_round) {
    zm_round_spawning::function_2876740e(#"tormentor", &function_44d45595);
    zm_round_spawning::function_376e51ef(#"tormentor", n_round);
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0xf513ab72, Offset: 0x5518
// Size: 0xba
function function_65c98960(get_all = 0) {
    if (isdefined(level.zm_loc_types[#"mechz_location"]) && level.zm_loc_types[#"mechz_location"].size) {
        if (get_all) {
            s_spawn_loc = level.zm_loc_types[#"mechz_location"];
        } else {
            s_spawn_loc = array::random(level.zm_loc_types[#"mechz_location"]);
        }
    }
    return s_spawn_loc;
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0xb1b8d963, Offset: 0x55e0
// Size: 0x382
function function_41a4961d(get_all = 0) {
    if (isdefined(level.zm_loc_types[#"tempest_location"]) && level.zm_loc_types[#"tempest_location"].size) {
        if (get_all) {
            s_spawn_loc = level.zm_loc_types[#"tempest_location"];
        } else {
            locs = level.zm_loc_types[#"tempest_location"];
            if (getplayers().size > 1) {
                var_a6c95035 = [];
                var_b0becd1e = namespace_19c99142::function_a64f7068();
                if (!isdefined(var_b0becd1e)) {
                    return undefined;
                }
                str_target_zone = var_b0becd1e zm_zonemgr::get_player_zone();
                if (!isdefined(str_target_zone)) {
                    return undefined;
                }
                target_zone = level.zones[str_target_zone];
                var_24f5d9f8 = array(target_zone.name);
                a_str_adj_zones = getarraykeys(target_zone.adjacent_zones);
                foreach (str_zone in a_str_adj_zones) {
                    if (target_zone.adjacent_zones[str_zone].is_connected) {
                        if (!isdefined(var_24f5d9f8)) {
                            var_24f5d9f8 = [];
                        } else if (!isarray(var_24f5d9f8)) {
                            var_24f5d9f8 = array(var_24f5d9f8);
                        }
                        var_24f5d9f8[var_24f5d9f8.size] = str_zone;
                    }
                }
                foreach (loc in locs) {
                    if (array::contains(var_24f5d9f8, loc.zone_name)) {
                        if (!isdefined(var_a6c95035)) {
                            var_a6c95035 = [];
                        } else if (!isarray(var_a6c95035)) {
                            var_a6c95035 = array(var_a6c95035);
                        }
                        var_a6c95035[var_a6c95035.size] = loc;
                    }
                }
                if (var_a6c95035.size === 0) {
                    var_a6c95035 = locs;
                }
                s_spawn_loc = array::random(var_a6c95035);
            } else {
                s_spawn_loc = array::random(locs);
            }
        }
    }
    return s_spawn_loc;
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x3c576cc2, Offset: 0x5970
// Size: 0xba
function function_218424b3(get_all = 0) {
    if (isdefined(level.zm_loc_types[#"tempest_location"]) && level.zm_loc_types[#"tempest_location"].size) {
        if (get_all) {
            s_spawn_loc = level.zm_loc_types[#"tempest_location"];
        } else {
            s_spawn_loc = array::random(level.zm_loc_types[#"tempest_location"]);
        }
    }
    return s_spawn_loc;
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x5f06ad1a, Offset: 0x5a38
// Size: 0xba
function function_d9f5ec34(get_all = 0) {
    if (isdefined(level.zm_loc_types[#"tempest_location"]) && level.zm_loc_types[#"tempest_location"].size) {
        if (get_all) {
            s_spawn_loc = level.zm_loc_types[#"tempest_location"];
        } else {
            s_spawn_loc = array::random(level.zm_loc_types[#"tempest_location"]);
        }
    }
    return s_spawn_loc;
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xeb89d55e, Offset: 0x5b00
// Size: 0xfc
function function_ae76beb4() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    level flag::wait_till(#"connect_no_mans_land_to_east_berlin_street");
    wait(2);
    charlie_rubble = struct::get("charlie_rubble", "targetname");
    util::spawn_model(#"hash_73d31ba007bb147d", charlie_rubble.origin, charlie_rubble.angles);
    var_69708f86 = getentarray("charlie_razorwire", "targetname");
    array::delete_all(var_69708f86);
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xc63445db, Offset: 0x5c08
// Size: 0x244
function function_f37d9da7() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    var_df192c8d = getent("manhole_cover_navmesh", "targetname");
    var_23a64dc = getnodearray("manhole_cover_connect_navmesh_node", "targetname");
    var_df192c8d setmovingplatformenabled(1);
    waitframe(1);
    foreach (node in var_23a64dc) {
        linktraversal(node);
    }
    level flag::wait_till(#"connect_east_berlin_street_to_ghost_station2");
    foreach (node in var_23a64dc) {
        unlinktraversal(node);
    }
    var_df192c8d setmovingplatformenabled(0);
    var_df192c8d disconnectpaths();
    var_df192c8d ghost();
    var_df192c8d notsolid();
    level thread function_d47fe1d8(var_df192c8d);
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0xd108862f, Offset: 0x5e58
// Size: 0x1c4
function function_d47fe1d8(var_df192c8d) {
    level endon(#"game_ended");
    zombies = getaiarchetypearray(#"zombie", level.zombie_team);
    origin = var_df192c8d getcentroid();
    zombies = function_72d3bca6(zombies, origin, undefined, undefined, 128);
    foreach (zombie in zombies) {
        if (isalive(zombie) && distance2dsquared(zombie.origin, origin) < sqr(100)) {
            zombie zm_cleanup::cleanup_zombie(1);
            if (isdefined(zombie)) {
                gibserverutils::annihilate(zombie);
            }
        }
    }
    if (!isdefined(var_df192c8d)) {
        return;
    }
    var_df192c8d delete();
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xd6464bb8, Offset: 0x6028
// Size: 0xac
function function_3297eca5() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    var_f6042708 = getnode("market_window_node", "targetname");
    unlinktraversal(var_f6042708);
    level flag::wait_till("power_on");
    linktraversal(var_f6042708);
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x6 linked
// Checksum 0xb8fec066, Offset: 0x60e0
// Size: 0x6c4
function private function_8c581f55() {
    level endon(#"end_game");
    level thread function_850f10bc();
    level.var_e1b1f602 = struct::get("p9_fxainm_zm_platinum_ghost_train_south", "scriptbundlename");
    level.var_d05c528b = struct::get("p9_fxanim_zm_platinum_ghost_train_north", "scriptbundlename");
    level.var_3c41ed40 = struct::get("p9_fxainm_zm_platinum_ghost_train_south_sewer", "scriptbundlename");
    level.var_93504ea8 = struct::get("p9_fxanim_zm_platinum_ghost_train_north_sewer", "scriptbundlename");
    scene::add_scene_func(#"p9_fxainm_zm_platinum_ghost_train_south", &function_388594e2, "play");
    scene::add_scene_func(#"p9_fxanim_zm_platinum_ghost_train_north", &function_adcf116f, "play");
    scene::add_scene_func(#"p9_fxainm_zm_platinum_ghost_train_south_sewer", &function_388594e2, "play");
    scene::add_scene_func(#"p9_fxanim_zm_platinum_ghost_train_north_sewer", &function_adcf116f, "play");
    scene::add_scene_func(#"p9_fxainm_zm_platinum_ghost_train_south", &function_1ad17524, "done");
    scene::add_scene_func(#"p9_fxanim_zm_platinum_ghost_train_north", &function_5d303617, "done");
    scene::add_scene_func(#"p9_fxainm_zm_platinum_ghost_train_south_sewer", &function_1ad17524, "done");
    scene::add_scene_func(#"p9_fxanim_zm_platinum_ghost_train_north_sewer", &function_5d303617, "done");
    level.var_3daf2eb1 = struct::get("first_ghost_train_trigger", "targetname");
    level.var_2b758a3e = struct::get("first_ghost_train_trigger_02", "targetname");
    level.var_dd757193 = getentarray("train_clip_south", "targetname");
    level.var_4075a99d = getentarray("train_clip_north", "targetname");
    level.var_520a143d = struct::get_array("train_hit_down_loc", "targetname");
    while (!level flag::get(#"hash_69bc64a0ea76c1b9")) {
        if (!level flag::get(#"hash_13cd183e1c6cadd2")) {
            a_players = function_a1ef346b();
            foreach (player in a_players) {
                if (player zm_zonemgr::is_player_in_zone(level.var_65c43c31)) {
                    if (distancesquared(player.origin, level.var_3daf2eb1.origin) < 562500 || distancesquared(player.origin, level.var_2b758a3e.origin) < 562500) {
                        level flag::set(#"hash_69bc64a0ea76c1b9");
                        break;
                    }
                }
            }
        }
        wait(1);
    }
    level.var_f528a88c = gettime();
    level.var_b458389e = gettime() + int(1 * 1000);
    while (true) {
        if (!level flag::get(#"hash_13cd183e1c6cadd2") && level flag::get(#"hash_69bc64a0ea76c1b9") && !level flag::get(#"hash_59a4499797529045")) {
            if (gettime() > level.var_f528a88c) {
                function_bf105732();
                level.var_f528a88c = gettime() + randomfloatrange(int(120 * 1000), int(180 * 1000));
            }
            if (gettime() > level.var_b458389e) {
                function_bf105732(0);
                level.var_b458389e = gettime() + randomfloatrange(int(120 * 1000), int(180 * 1000));
            }
        }
        wait(0.1);
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x93d34019, Offset: 0x67b0
// Size: 0x54
function function_92d44ee0() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    level scene::play(#"hash_25ac32fd2e8d74b0");
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x6a4eb9e9, Offset: 0x6810
// Size: 0xa4
function function_850f10bc() {
    level endon(#"end_game");
    level clientfield::set("" + #"hash_2a6acb420c3bb07e", 1);
    level flag::wait_till(#"hash_7632e33ae2122338");
    level clientfield::set("" + #"hash_43c03ae4aff2ba0", 1);
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x69a23d06, Offset: 0x68c0
// Size: 0x120
function function_18a5cf8b(a_zombies) {
    if (!isdefined(a_zombies)) {
        a_zombies = [];
    } else if (!isarray(a_zombies)) {
        a_zombies = array(a_zombies);
    }
    foreach (zombie in a_zombies) {
        if (isalive(zombie)) {
            zombie ghost();
            zombie dontinterpolate();
            zombie thread function_3e1598cc(0.25);
        }
    }
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x6 linked
// Checksum 0xee1893d4, Offset: 0x69e8
// Size: 0x64
function private function_3e1598cc(delay_time = 0.25) {
    level endon(#"end_game");
    wait(delay_time);
    if (isalive(self)) {
        self show();
    }
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x6 linked
// Checksum 0xe774d490, Offset: 0x6a58
// Size: 0x25c
function private function_bf105732(var_4a8bf1a3 = 1) {
    if (is_true(var_4a8bf1a3)) {
        if (!level.var_e1b1f602 scene::is_playing(#"p9_fxainm_zm_platinum_ghost_train_south") && !level.var_3c41ed40 scene::is_playing(#"p9_fxainm_zm_platinum_ghost_train_south_sewer")) {
            level function_66dff432(1);
            function_18a5cf8b(level.var_4a7e5bf7);
            if (function_9c91ed70()) {
                level.var_3c41ed40 thread scene::play(#"p9_fxainm_zm_platinum_ghost_train_south_sewer", level.var_4a7e5bf7);
            } else {
                level.var_e1b1f602 thread scene::play(#"p9_fxainm_zm_platinum_ghost_train_south", level.var_4a7e5bf7);
            }
        }
        return;
    }
    if (!level.var_d05c528b scene::is_playing(#"p9_fxanim_zm_platinum_ghost_train_north") && !level.var_93504ea8 scene::is_playing(#"p9_fxanim_zm_platinum_ghost_train_north_sewer")) {
        level function_66dff432(0);
        function_18a5cf8b(level.var_9351a555);
        if (function_9c91ed70()) {
            level.var_93504ea8 thread scene::play(#"p9_fxanim_zm_platinum_ghost_train_north_sewer", level.var_9351a555);
            return;
        }
        level.var_d05c528b thread scene::play(#"p9_fxanim_zm_platinum_ghost_train_north", level.var_9351a555);
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x6 linked
// Checksum 0xfd26f965, Offset: 0x6cc0
// Size: 0x134
function private function_9c91ed70() {
    var_768cef1 = 0;
    var_925e4a10 = 0;
    a_players = function_a1ef346b();
    foreach (player in a_players) {
        if (distancesquared(player.origin, level.var_3daf2eb1.origin) < 562500) {
            var_925e4a10++;
        }
        if (distancesquared(player.origin, level.var_2b758a3e.origin) < 562500) {
            var_768cef1++;
        }
    }
    if (var_768cef1 > var_925e4a10) {
        return 1;
    }
    return 0;
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x5630ca86, Offset: 0x6e00
// Size: 0x2d8
function function_e803401a(var_4a8bf1a3 = 1) {
    self notify("5b44c4755ba672bb");
    self endon("5b44c4755ba672bb");
    if (var_4a8bf1a3) {
        level endon(#"hash_3e8b4d2fb40996c6", #"end_game", #"hash_4250ffb13b75ed1d");
    } else {
        level endon(#"hash_1641307dd5ec1dc4", #"end_game", #"hash_4250ffb13b75ed1d");
    }
    level.var_4308c048 = #"light";
    level thread function_825111ad(var_4a8bf1a3);
    while (true) {
        a_players = function_a1ef346b();
        switch (level.var_4308c048) {
        case #"light":
            foreach (player in a_players) {
                if (player zm_zonemgr::is_player_in_zone(level.var_e40bce8f)) {
                    player function_bc82f900(#"hash_109abe9169de475f");
                }
            }
            break;
        case #"heavy":
            foreach (player in a_players) {
                if (player zm_zonemgr::is_player_in_zone(level.var_e40bce8f)) {
                    player function_bc82f900(#"hash_1f89166fed72f570");
                    continue;
                }
                if (player zm_zonemgr::is_player_in_zone(level.var_cef1cab5)) {
                    player function_bc82f900(#"hash_109abe9169de475f");
                }
            }
            break;
        }
        wait(0.4);
    }
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0xbdb43f28, Offset: 0x70e0
// Size: 0xe8
function function_1f4205cd(str_suffix) {
    str_alias = #"hash_497b810942ea6cbd" + str_suffix;
    a_players = function_a1ef346b();
    foreach (player in a_players) {
        if (player zm_zonemgr::is_player_in_zone(level.var_e40bce8f)) {
            player playsoundtoplayer(str_alias, player);
        }
    }
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x6 linked
// Checksum 0xf75f76f, Offset: 0x71d0
// Size: 0xa4
function private function_825111ad(var_4a8bf1a3 = 1) {
    if (var_4a8bf1a3) {
        level endon(#"hash_3e8b4d2fb40996c6", #"end_game");
    } else {
        level endon(#"hash_1641307dd5ec1dc4", #"end_game");
    }
    level waittill(#"hash_b45cb9af027d66f");
    level.var_4308c048 = #"heavy";
}

// Namespace zm_platinum/zm_platinum
// Params 10, eflags: 0x2 linked
// Checksum 0x640374af, Offset: 0x7280
// Size: 0xe8
function on_player_damaged(*einflictor, eattacker, *idamage, *idflags, smeansofdeath, *weapon, *vpoint, *vdir, *shitloc, *psoffsettime) {
    if (psoffsettime == "MOD_CRUSH") {
        self thread function_1a360399();
    }
    if (isdefined(shitloc) && shitloc.team == level.zombie_team && is_true(shitloc.var_cb27a574)) {
        self burnplayer::setplayerburning(7, 1, 5);
    }
    return -1;
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xd0d021fb, Offset: 0x7370
// Size: 0x74
function function_1a360399() {
    self endon(#"death");
    self clientfield::set_to_player("" + #"hash_6e5cc4162abd613f", 1);
    wait(3.5);
    self clientfield::set_to_player("" + #"hash_6e5cc4162abd613f", 0);
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x6 linked
// Checksum 0x4b3b256c, Offset: 0x73f0
// Size: 0x84
function private function_d7fb6a4c() {
    if (isactor(self)) {
        self pathmode("move allowed");
        self.completed_emerging_into_playable_area = 1;
        self.zombie_think_done = 1;
        self.zombie_move_speed = "run";
        self flag::set(#"hash_2cf0b6ebfb6c98f3");
    }
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x60775e1a, Offset: 0x7480
// Size: 0x1f4
function function_388594e2(a_ents) {
    if (!level.var_d05c528b scene::is_playing(#"p9_fxanim_zm_platinum_ghost_train_north") && !level.var_93504ea8 scene::is_playing(#"p9_fxanim_zm_platinum_ghost_train_north_sewer")) {
        level clientfield::set("" + #"hash_3a84ac42abd608d2", 1);
    }
    if (level flag::get(#"hash_7632e33ae2122338")) {
        level clientfield::set("" + #"hash_43c03ae4aff2ba0", 3);
    }
    level clientfield::set("" + #"hash_600dd9c10bd3447b", 1);
    level namespace_b574e135::function_d508d5d8(1);
    level clientfield::set("" + #"hash_2a93d12c263f2d68", 2);
    level thread function_e803401a();
    level thread function_1f4205cd("south");
    level function_a67ccd4e(a_ents, 1);
    level flag::set(#"hash_1c8cee37d4ebb24b");
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x54e937db, Offset: 0x7680
// Size: 0x1f4
function function_adcf116f(a_ents) {
    if (!level.var_e1b1f602 scene::is_playing(#"p9_fxainm_zm_platinum_ghost_train_south") && !level.var_3c41ed40 scene::is_playing(#"p9_fxainm_zm_platinum_ghost_train_south_sewer")) {
        level clientfield::set("" + #"hash_3a84ac42abd608d2", 1);
    }
    if (level flag::get(#"hash_7632e33ae2122338")) {
        level clientfield::set("" + #"hash_43c03ae4aff2ba0", 4);
    }
    level clientfield::set("" + #"hash_600dd9c10bd3447b", 2);
    level namespace_b574e135::function_4b599595(1);
    level clientfield::set("" + #"hash_2a93d12c263f2d68", 1);
    level thread function_e803401a(0);
    level thread function_1f4205cd("north");
    level function_a67ccd4e(a_ents, 0);
    level flag::set(#"hash_50aa91e49479ab59");
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0xa174c048, Offset: 0x7880
// Size: 0x1ac
function function_1ad17524(*a_ents) {
    if (!level.var_d05c528b scene::is_playing(#"p9_fxanim_zm_platinum_ghost_train_north") && !level.var_93504ea8 scene::is_playing(#"p9_fxanim_zm_platinum_ghost_train_north_sewer")) {
        level clientfield::set("" + #"hash_3a84ac42abd608d2", 0);
        level clientfield::set("" + #"hash_2a93d12c263f2d68", 4);
    }
    level clientfield::set("" + #"hash_600dd9c10bd3447b", 0);
    level namespace_b574e135::function_d508d5d8(0);
    level function_d6aff0b3();
    if (level flag::get(#"hash_7632e33ae2122338")) {
        level clientfield::set("" + #"hash_43c03ae4aff2ba0", 5);
    }
    level flag::clear(#"hash_1c8cee37d4ebb24b");
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x9106a52d, Offset: 0x7a38
// Size: 0x1ac
function function_5d303617(*a_ents) {
    if (!level.var_e1b1f602 scene::is_playing(#"p9_fxainm_zm_platinum_ghost_train_south") && !level.var_3c41ed40 scene::is_playing(#"p9_fxainm_zm_platinum_ghost_train_south_sewer")) {
        level clientfield::set("" + #"hash_3a84ac42abd608d2", 0);
        level clientfield::set("" + #"hash_2a93d12c263f2d68", 4);
    }
    level clientfield::set("" + #"hash_600dd9c10bd3447b", 0);
    level namespace_b574e135::function_4b599595(0);
    level function_d6aff0b3(0);
    if (level flag::get(#"hash_7632e33ae2122338")) {
        level clientfield::set("" + #"hash_43c03ae4aff2ba0", 6);
    }
    level flag::clear(#"hash_50aa91e49479ab59");
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x6 linked
// Checksum 0xe910399b, Offset: 0x7bf0
// Size: 0xb4
function private function_4dbee530() {
    if (isdefined(self)) {
        var_6b9acd61 = getweapon("ghost_train_fire_zm");
        self clientfield::set("" + #"hash_15e37ba2a31217b8", 1);
        self.var_cb27a574 = 1;
        n_dmg = zm_equipment::function_379f6b5d(6, var_6b9acd61);
        self namespace_9ff9f642::burn(#"ghost_train_fire", undefined, undefined, n_dmg);
    }
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x6 linked
// Checksum 0x7d89433e, Offset: 0x7cb0
// Size: 0x1ec
function private function_66dff432(var_2fb6fe4e) {
    if (var_2fb6fe4e) {
        if (!isdefined(level.var_4a7e5bf7)) {
            level.var_4a7e5bf7 = [];
        }
        level.var_4a7e5bf7 = [];
    } else {
        if (!isdefined(level.var_9351a555)) {
            level.var_9351a555 = [];
        }
        level.var_9351a555 = [];
    }
    var_52a410d1 = 0;
    var_4298996d = randomintrangeinclusive(3, 4);
    var_be18ffe8 = 1;
    if (level flag::get(#"hash_6ca740d4a9204938")) {
        for (i = 0; i < 6; i++) {
            if (level.zombie_total > 0) {
                if (var_52a410d1 < var_4298996d) {
                    var_be18ffe8 = 1;
                    var_52a410d1++;
                } else {
                    var_be18ffe8 = 0;
                }
                function_b9dd887f(var_2fb6fe4e, var_be18ffe8);
                level.zombie_total--;
            } else {
                break;
            }
            waitframe(1);
        }
    } else {
        for (i = 0; i < 6; i++) {
            if (var_52a410d1 < var_4298996d) {
                var_be18ffe8 = 1;
                var_52a410d1++;
            } else {
                var_be18ffe8 = 0;
            }
            function_b9dd887f(var_2fb6fe4e, var_be18ffe8);
            waitframe(1);
        }
    }
    if (!level flag::get(#"hash_6ca740d4a9204938")) {
        level flag::set(#"hash_6ca740d4a9204938");
    }
}

// Namespace zm_platinum/zm_platinum
// Params 2, eflags: 0x2 linked
// Checksum 0x427dfc2c, Offset: 0x7ea8
// Size: 0x1d0
function function_b9dd887f(var_2fb6fe4e, var_be18ffe8) {
    zombie = zm_utility::function_cce73165("riser_location", #"spawner_bo5_zombie_zm_platinum", #"zone_ghost_station");
    if (isactor(zombie) && isalive(zombie)) {
        zombie function_d7fb6a4c();
        if (is_true(var_be18ffe8)) {
            zombie function_4dbee530();
        }
    }
    if (var_2fb6fe4e) {
        if (!isdefined(level.var_4a7e5bf7)) {
            level.var_4a7e5bf7 = [];
        } else if (!isarray(level.var_4a7e5bf7)) {
            level.var_4a7e5bf7 = array(level.var_4a7e5bf7);
        }
        level.var_4a7e5bf7[level.var_4a7e5bf7.size] = zombie;
        return;
    }
    if (!isdefined(level.var_9351a555)) {
        level.var_9351a555 = [];
    } else if (!isarray(level.var_9351a555)) {
        level.var_9351a555 = array(level.var_9351a555);
    }
    level.var_9351a555[level.var_9351a555.size] = zombie;
}

// Namespace zm_platinum/zm_platinum
// Params 2, eflags: 0x2 linked
// Checksum 0x4e2fe822, Offset: 0x8080
// Size: 0x41c
function function_a67ccd4e(a_ents, var_4a8bf1a3 = 1) {
    if (var_4a8bf1a3) {
        for (i = 1; i < 9; i++) {
            train = a_ents["Vehicle " + i];
            train setforcenocull();
            if (!isdefined(level.var_8790bd5c)) {
                level.var_8790bd5c = [];
            } else if (!isarray(level.var_8790bd5c)) {
                level.var_8790bd5c = array(level.var_8790bd5c);
            }
            level.var_8790bd5c[level.var_8790bd5c.size] = train;
        }
        assert(level.var_dd757193.size == level.var_8790bd5c.size, "zone_electronics_store");
        for (i = 0; i < level.var_dd757193.size; i++) {
            level.var_dd757193[i].origin = level.var_8790bd5c[i].origin;
            level.var_dd757193[i] enablelinkto();
            level.var_dd757193[i] linkto(level.var_8790bd5c[i]);
            if (i > 0) {
                level.var_dd757193[i] thread function_5e09fe1();
                continue;
            }
            level.var_dd757193[i] thread function_5e09fe1(1, 0);
        }
        return;
    }
    for (i = 1; i < 9; i++) {
        train = a_ents["Vehicle " + i];
        train setforcenocull();
        if (!isdefined(level.var_43aa8d26)) {
            level.var_43aa8d26 = [];
        } else if (!isarray(level.var_43aa8d26)) {
            level.var_43aa8d26 = array(level.var_43aa8d26);
        }
        level.var_43aa8d26[level.var_43aa8d26.size] = train;
    }
    assert(level.var_4075a99d.size == level.var_43aa8d26.size, "zone_american_sector_right_building");
    for (i = 0; i < level.var_4075a99d.size; i++) {
        level.var_4075a99d[i].origin = level.var_43aa8d26[i].origin;
        level.var_4075a99d[i] enablelinkto();
        level.var_4075a99d[i] linkto(level.var_43aa8d26[i]);
        if (i > 0) {
            level.var_4075a99d[i] thread function_5e09fe1(0);
            continue;
        }
        level.var_4075a99d[i] thread function_5e09fe1(0, 0);
    }
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x66443f40, Offset: 0x84a8
// Size: 0x148
function function_d6aff0b3(var_4a8bf1a3 = 1) {
    if (var_4a8bf1a3) {
        level.var_8790bd5c = [];
        foreach (clip in level.var_dd757193) {
            clip unlink();
        }
        return;
    }
    level.var_43aa8d26 = [];
    foreach (clip in level.var_4075a99d) {
        clip unlink();
    }
}

// Namespace zm_platinum/zm_platinum
// Params 2, eflags: 0x2 linked
// Checksum 0x64874579, Offset: 0x85f8
// Size: 0x718
function function_5e09fe1(var_4a8bf1a3 = 1, var_d15e3ab = 1) {
    if (var_4a8bf1a3) {
        level endon(#"hash_3e8b4d2fb40996c6");
        var_8179aee4 = struct::get("spawn_klaus_south", "targetname");
    } else {
        level endon(#"hash_1641307dd5ec1dc4");
        var_8179aee4 = struct::get("spawn_klaus_north", "targetname");
    }
    self endon(#"death");
    while (true) {
        a_zombies = getaiteamarray(level.zombie_team);
        a_players = function_a1ef346b();
        foreach (zombie in a_zombies) {
            if (isdefined(zombie) && zombie.health > 0) {
                if (zombie istouching(self)) {
                    if (zombie.archetype === #"mechz") {
                        zombie dodamage(zombie.maxhealth * 0.1, self.origin, self, self, 0, "MOD_CRUSH");
                        if (zombie.health > 0) {
                            locs = function_65c98960();
                            zombie zm_ai_utility::function_a8dc3363(locs);
                        }
                        continue;
                    }
                    if (zombie.archetype === #"hash_7c0d83ac1e845ac2") {
                        var_edc4ca59 = arraygetclosest(zombie.origin, level.var_520a143d);
                        if (isdefined(var_edc4ca59)) {
                            zombie forceteleport(var_edc4ca59.origin);
                        }
                        continue;
                    }
                    if (!zombie flag::get(#"hash_2cf0b6ebfb6c98f3")) {
                        a_players = function_a1ef346b();
                        foreach (player in a_players) {
                            if (player.cached_zone_name === "zone_ghost_station" || player.cached_zone_name === "zone_ghost_station_2") {
                                player zm_stats::increment_challenge_stat(#"hash_64e4655b2bad9f63");
                            }
                        }
                        zombie.allowdeath = 1;
                        zombie kill(undefined, undefined, undefined, undefined, undefined, 1);
                        playfxontag(#"zm_weapons/fx9_ww_ieu_death", zombie, "J_Spine4");
                        zombie deletedelay();
                    }
                }
            }
        }
        foreach (player in a_players) {
            if (isalive(player)) {
                if (player istouching(self)) {
                    if (player laststand::player_is_in_laststand() && !player flag::get(#"hash_6dd5946508e5689a")) {
                        player.bleedout_time = 0;
                        continue;
                    }
                    if (var_d15e3ab) {
                        player dodamage(30, self.origin, self, self, 0);
                        var_a6470558 = vectornormalize(player.origin - self.origin);
                        /#
                            line(self.origin, player.origin, (1, 0, 0), 1, 1, 300);
                        #/
                        player playerknockback(1);
                        player applyknockback(2000, var_a6470558);
                        player playerknockback(0);
                        continue;
                    }
                    player thread function_3dae6b8b();
                    player thread function_1a360399();
                    player dodamage(player.maxhealth + 100, self.origin, self, self, 0, "MOD_CRUSH");
                    player flag::set(#"hash_6dd5946508e5689a");
                }
            }
        }
        if (isdefined(level.klaus) && level.klaus istouching(self)) {
            level.klaus forceteleport(getclosestpointonnavmesh(var_8179aee4.origin, 300, 10), (0, 0, 0), 0);
        }
        wait(0.1);
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x5cc146e7, Offset: 0x8d18
// Size: 0x11c
function function_3dae6b8b() {
    level endon(#"end_game");
    var_781b19f5 = 99999;
    var_7b794373 = level.var_520a143d[0];
    foreach (loc in level.var_520a143d) {
        var_6bde26ff = distance(loc.origin, self.origin);
        if (var_6bde26ff < var_781b19f5) {
            var_781b19f5 = var_6bde26ff;
            var_7b794373 = loc;
        }
    }
    self setorigin(var_7b794373.origin);
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0xd3641110, Offset: 0x8e40
// Size: 0x4c
function on_player_revived(*params) {
    if (self flag::get(#"hash_6dd5946508e5689a")) {
        self flag::clear(#"hash_6dd5946508e5689a");
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x7391d2d8, Offset: 0x8e98
// Size: 0x8c
function function_419047b9() {
    if (!isdefined(level.var_f4b9daca)) {
        level.var_f4b9daca = 0;
    }
    zm_round_spawning::function_b4a8f95a(#"tormentor", level.var_6103ecd9, &special_round_start, &function_5714e44d, &namespace_abfee9ba::function_44d45595, &function_dd0b40e0, 0);
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x0
// Checksum 0xdf5ac680, Offset: 0x8f30
// Size: 0xa4
function function_55413772(s_spawn_loc) {
    level endon(#"end_game");
    var_c0ef5a0c = util::spawn_model("tag_origin", s_spawn_loc.origin, s_spawn_loc.angles);
    var_c0ef5a0c clientfield::increment("" + #"hash_3220b44880f1807c");
    wait(5);
    if (isdefined(var_c0ef5a0c)) {
        var_c0ef5a0c delete();
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x6 linked
// Checksum 0x655d112d, Offset: 0x8fe0
// Size: 0x164
function private function_9feaaed() {
    self notify("215b19a05fd0a643");
    self endon("215b19a05fd0a643");
    level endon(#"end_game");
    level flag::wait_till(#"hash_3f926cd1d573549d");
    if (level flag::get("rbz_exfil_started")) {
        return;
    }
    if (level flag::get(#"rbz_exfil_beacon_active")) {
        level flag::clear("rbz_exfil_beacon_active");
    }
    if (level flag::get("rbz_exfil_allowed")) {
        level flag::clear("rbz_exfil_allowed");
    }
    if (level.round_number < 15) {
        zm_round_spawning::function_d36196b1(15);
    } else if (isdefined(level.var_6103ecd9)) {
        zm_round_spawning::function_d36196b1(level.var_6103ecd9);
    }
    function_efb7d5c9();
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x6 linked
// Checksum 0xfa5403ba, Offset: 0x9150
// Size: 0x2dc
function private function_efb7d5c9() {
    if (level flag::get(#"hash_3dfd0dd4caef92a9")) {
        level.var_6103ecd9 = level.round_number + 1;
    } else {
        level.var_6103ecd9 = level.round_number;
    }
    if (level.var_6103ecd9 == 16) {
        function_ccae0e94(16);
        var_c968853d = level.round_number + 2;
        var_b652419c = function_b854a36e(var_c968853d);
        level thread function_859fa480(var_b652419c);
    }
    if (level.var_6103ecd9 == 11) {
        function_ccae0e94(11);
        var_c968853d = level.round_number + 2;
        var_47a1335a = function_b854a36e(var_c968853d);
        level thread function_32401229(var_47a1335a);
    }
    if (level.var_6103ecd9 == 15) {
        function_ccae0e94(15);
        var_c968853d = level.round_number + 2;
        var_c17aa866 = function_b854a36e(var_c968853d);
        level thread function_ae72b4d0(var_c17aa866);
    }
    level function_419047b9();
    /#
        iprintlnbold("portal_spawn_fx_volume" + level.var_6103ecd9);
        println("portal_spawn_fx_volume" + level.var_6103ecd9);
    #/
    level.zombie_total = 0;
    level notify(#"kill_round");
    level notify(#"kill_round_wait");
    level zm_utility::function_9ad5aeb1(0, 1, 0, 0);
    if (!level flag::get(#"hash_3dfd0dd4caef92a9")) {
        level flag::set("end_round_start_delay");
        wait(1);
        level flag::clear("end_round_start_delay");
    }
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x6 linked
// Checksum 0xcb3419a5, Offset: 0x9438
// Size: 0x60
function private function_b854a36e(var_dc34e3b6) {
    while (isinarray(level.var_865ea9f, var_dc34e3b6) || var_dc34e3b6 % 5 == 1 && var_dc34e3b6 > 10) {
        var_dc34e3b6++;
    }
    return var_dc34e3b6;
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x6 linked
// Checksum 0xd32766ec, Offset: 0x94a0
// Size: 0x5c
function private function_ccae0e94(var_2ae1a08f) {
    if (isdefined(level.var_ff78f6de)) {
        level.var_ff78f6de[var_2ae1a08f] = undefined;
    }
    if (isdefined(level.var_865ea9f)) {
        arrayremovevalue(level.var_865ea9f, var_2ae1a08f);
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x0
// Checksum 0xa005f3fe, Offset: 0x9508
// Size: 0x12a
function function_2fea91a2() {
    if (!isdefined(level.var_19a4a8bb)) {
        level.var_19a4a8bb = 0;
    }
    level.var_19a4a8bb++;
    if (level.var_19a4a8bb > 6) {
        level.var_19a4a8bb = 1;
    }
    switch (level.var_19a4a8bb) {
    case 1:
    default:
        return #"avogadro";
    case 2:
    case 3:
        return #"soa";
    case 4:
        return #"avogadro";
    case 5:
        return #"soa";
    case 6:
        return #"avogadro";
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xe16569b9, Offset: 0x9640
// Size: 0xc4
function special_round_start() {
    level flag::set(#"hash_6b9171e3b39fb7ed");
    level flag::clear(#"hash_69bc64a0ea76c1b9");
    level flag::clear(#"hash_855089a4d12dc49");
    function_e2610c23();
    if (!level flag::get(#"hash_bb9098b117819a")) {
        level thread zm_vo::function_7622cb70(#"hash_b710973bfe77e06");
    }
    function_532b11c9();
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x27f72c02, Offset: 0x9710
// Size: 0x184
function function_5714e44d(*var_d25bbdd5) {
    if (!level flag::get("rbz_exfil_allowed")) {
        level flag::set("rbz_exfil_allowed");
    }
    level flag::clear(#"hash_6b9171e3b39fb7ed");
    level flag::set(#"hash_69bc64a0ea76c1b9");
    if (!level flag::get(#"hash_5c97d613e20f93e4")) {
        level flag::set(#"hash_5c97d613e20f93e4");
    }
    function_e2610c23();
    a_alive_player = function_a1ef346b();
    if (level flag::get(#"hash_bb9098b117819a")) {
    }
    a_alive_player = function_a1ef346b();
    if (isdefined(a_alive_player[0])) {
        level thread zm_powerups::specific_powerup_drop("full_ammo", a_alive_player[0].origin);
    }
    level flag::set(#"hash_855089a4d12dc49");
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x0
// Checksum 0xce8b9b1d, Offset: 0x98a0
// Size: 0xe0
function function_83aae371() {
    players = getplayers();
    switch (level.var_f4b9daca) {
    case 1:
        level.var_40f837cf = 300;
        break;
    case 2:
        level.var_40f837cf = 700;
        break;
    case 3:
        level.var_40f837cf = 1100;
        break;
    case 4:
        level.var_40f837cf = 1500;
        break;
    }
    if (level.var_40f837cf > 2000) {
        level.var_40f837cf = 2000;
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x0
// Checksum 0xd58d266f, Offset: 0x9988
// Size: 0x92
function function_8d2936b1() {
    switch (getplayers().size) {
    case 1:
        return 3;
    case 2:
        return 5;
    case 3:
        return 7;
    case 4:
        return 10;
    default:
        return 14;
    }
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0xbc6ae3a9, Offset: 0x9a28
// Size: 0x11a
function function_44d45595(*var_de4a9f7a) {
    if (zm_round_spawning::function_fab464c4(level.round_number)) {
        a_e_players = getplayers();
        if (level.var_f4b9daca < 3) {
            n_max = a_e_players.size * 8;
        } else {
            n_max = a_e_players.size * 10;
        }
        return n_max;
    }
    if (level.round_number < 20) {
        var_a5e820a7 = 0.02;
    } else if (level.round_number < 30) {
        var_a5e820a7 = 0.03;
    } else {
        var_a5e820a7 = 0.04;
    }
    n_max = int(ceil(level.zombie_total * var_a5e820a7));
    return n_max;
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x0
// Checksum 0xc61b6841, Offset: 0x9b50
// Size: 0xea
function function_d30fa080() {
    a_players = getplayers();
    switch (a_players.size) {
    case 1:
        level.var_57f3dce4 = 6;
        break;
    case 2:
        level.var_57f3dce4 = 10;
        break;
    case 3:
        level.var_57f3dce4 = 13;
        break;
    case 4:
        level.var_57f3dce4 = 15;
        break;
    default:
        level.var_57f3dce4 = 6;
        break;
    }
    return level.var_57f3dce4;
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x29b8c30e, Offset: 0x9c48
// Size: 0x15c
function function_dd0b40e0() {
    var_850bf822 = 0;
    var_115de5b6 = 0;
    var_d9dcedb1 = 0;
    a_players = getplayers();
    switch (a_players.size) {
    case 1:
        var_115de5b6 = 2;
        var_d9dcedb1 = 3;
        break;
    case 2:
        var_115de5b6 = 1.2;
        var_d9dcedb1 = 2;
        break;
    case 3:
        var_115de5b6 = 1;
        var_d9dcedb1 = 1.5;
        break;
    case 4:
        var_115de5b6 = 0.5;
        var_d9dcedb1 = 1;
        break;
    default:
        var_115de5b6 = 2;
        var_d9dcedb1 = 3;
        break;
    }
    wait(randomfloatrange(var_115de5b6, var_d9dcedb1));
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x103118d0, Offset: 0x9db0
// Size: 0x182
function function_d4f11e3c(*var_de4a9f7a) {
    if (isdefined(level.var_36678664) && level.round_number < level.var_36678664) {
        return 0;
    }
    if (isdefined(level.var_1db9948) && isdefined(level.var_a1c6ba48)) {
        if ((level.var_1db9948 <= level.round_number || level.var_a1c6ba48 <= level.round_number) && level.round_number < 20) {
            return 0;
        }
        if (level.var_1db9948 <= level.round_number && level.var_a1c6ba48 <= level.round_number && level.round_number < 30) {
            return 0;
        }
    }
    if (level.round_number < 20) {
        var_74475add = 0.02;
    } else if (level.round_number < 30) {
        var_74475add = 0.03;
    } else {
        var_74475add = 0.04;
    }
    n_max = int(ceil(level.zombie_total * var_74475add));
    return n_max;
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x1b28c01e, Offset: 0x9f40
// Size: 0x134
function function_f1355240(*n_round_number) {
    level endon(#"end_game");
    if (!isdefined(level.var_2f45d799)) {
        level.var_2f45d799 = 0;
    }
    while (true) {
        level waittill(#"hash_5d3012139f083ccb");
        if (zm_round_spawning::function_d0db51fc(#"raz")) {
            level.var_2f45d799++;
            n_player_count = zm_utility::function_a2541519(getplayers().size);
            if (n_player_count == 1) {
                level.var_36678664 = level.round_number + randomintrangeinclusive(2, 4);
                continue;
            }
            level.var_36678664 = level.round_number + randomintrangeinclusive(2, 3);
        }
    }
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x291712ea, Offset: 0xa080
// Size: 0x17c
function function_5e8a178a(*n_round_number) {
    level endon(#"end_game");
    if (!isdefined(level.var_ea1e9b1e)) {
        level.var_ea1e9b1e = 0;
    }
    while (true) {
        level waittill(#"hash_5d3012139f083ccb");
        if (zm_round_spawning::function_d0db51fc(#"mechz")) {
            level.var_ea1e9b1e++;
            if (level.var_ea1e9b1e == 1 || level.var_ea1e9b1e == 2) {
                level.var_1db9948 = level.round_number + 6;
                continue;
            }
            n_player_count = zm_utility::function_a2541519(getplayers().size);
            if (n_player_count === 1) {
                level.var_1db9948 = level.round_number + randomintrangeinclusive(3, 5);
                continue;
            }
            level.var_1db9948 = level.round_number + randomintrangeinclusive(3, 4);
        }
    }
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0xdaed035a, Offset: 0xa208
// Size: 0x112
function function_76a7a9ef(*var_de4a9f7a) {
    if (isdefined(level.var_a1c6ba48) && level.round_number < level.var_a1c6ba48) {
        return 0;
    }
    if (isdefined(level.var_1db9948) && level.var_1db9948 <= level.round_number && level.round_number < 20) {
        return 0;
    }
    if (level.round_number < 20) {
        var_e5d49e0f = 0.02;
    } else if (level.round_number < 30) {
        var_e5d49e0f = 0.03;
    } else {
        var_e5d49e0f = 0.04;
    }
    n_max = int(ceil(level.zombie_total * var_e5d49e0f));
    return n_max;
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x8d100f71, Offset: 0xa328
// Size: 0x10c
function function_2927859c(*n_round_number) {
    level endon(#"end_game");
    if (!isdefined(level.var_d8db349d)) {
        level.var_d8db349d = 0;
    }
    while (true) {
        level waittill(#"hash_5d3012139f083ccb");
        if (zm_round_spawning::function_d0db51fc(#"soa")) {
            level.var_d8db349d++;
            if (level.round_number <= 20) {
                level.var_a1c6ba48 = level.round_number + randomintrangeinclusive(2, 3);
                continue;
            }
            level.var_a1c6ba48 = level.round_number + randomintrangeinclusive(1, 2);
        }
    }
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x0
// Checksum 0x9b089a12, Offset: 0xa440
// Size: 0x4c
function function_bee969f1(*s_params) {
    if (isdefined(self)) {
        level thread zm_powerups::specific_powerup_drop("full_ammo", self.origin, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x6 linked
// Checksum 0x43ddeb88, Offset: 0xa498
// Size: 0x134
function private function_532b11c9() {
    level.var_f4b9daca++;
    if (level.var_f4b9daca == 1) {
        level.var_6103ecd9 = 20;
    } else {
        level.var_6103ecd9 = level.round_number + randomintrangeinclusive(5, 7);
        while (isinarray(level.var_865ea9f, level.var_6103ecd9) || level.var_6103ecd9 % 5 == 1 && level.var_6103ecd9 > 10) {
            level.var_6103ecd9++;
        }
    }
    level function_419047b9();
    /#
        iprintlnbold("<unknown string>" + level.var_6103ecd9);
        println("<unknown string>" + level.var_6103ecd9);
    #/
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xda611135, Offset: 0xa5d8
// Size: 0xd4
function function_e2610c23() {
    if (level flag::get(#"hash_74fd3f682346ea69")) {
        level thread clientfield::set("" + #"hash_228f0acdd4255cb", 0);
        level flag::clear(#"hash_74fd3f682346ea69");
        return;
    }
    level thread clientfield::set("" + #"hash_228f0acdd4255cb", 1);
    level flag::set(#"hash_74fd3f682346ea69");
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x6e38aef, Offset: 0xa6b8
// Size: 0x524
function function_4c86cc5() {
    level endon(#"game_ended");
    level flag::wait_till("start_zombie_round_logic");
    wait(2);
    var_49f892f0 = struct::get("zipline_to_destroyed_apartments");
    zm_sq::function_266d66eb(#"hash_6540714f9d2b59fb", var_49f892f0, undefined, #"hash_6a19188591b0ab07", undefined, 96);
    var_2aa1d292 = struct::get("zipline_to_east_berlin_hotel");
    zm_sq::function_266d66eb(#"hash_6540724f9d2b5bae", var_2aa1d292, undefined, #"hash_6a19188591b0ab07", undefined, 96);
    level flag::wait_till_any(["power_on", "connect_rooftops_interior_to_east_berlin_hotel", "connect_rooftops_to_destroyed_upper_floors"]);
    zm_sq::objective_complete(#"hash_6540714f9d2b59fb", var_49f892f0);
    zm_sq::objective_complete(#"hash_6540724f9d2b5bae", var_2aa1d292);
    wait(1);
    var_5bad9552 = struct::get("garment_warehouse_door");
    zm_sq::function_266d66eb(#"hash_6540734f9d2b5d61", var_5bad9552, undefined, #"hash_6a19188591b0ab07", undefined, 96);
    level flag::wait_till_any(["power_on", "connect_korber_roof_to_korber_interior"]);
    zm_sq::objective_complete(#"hash_6540734f9d2b5d61", var_5bad9552);
    wait(1);
    var_74d25c9e = struct::get("ghost_station_door");
    zm_sq::function_266d66eb(#"hash_6540744f9d2b5f14", var_74d25c9e, undefined, #"hash_6a19188591b0ab07", undefined, 96);
    var_e3b2d4f9 = struct::get("ghost_station2_door");
    zm_sq::function_266d66eb(#"hash_6540754f9d2b60c7", var_e3b2d4f9, undefined, #"hash_6a19188591b0ab07", undefined, 96);
    level flag::wait_till_any(["power_on", "connect_east_berlin_street_to_ghost_station", "connect_east_berlin_street_to_ghost_station2"]);
    zm_sq::objective_complete(#"hash_6540744f9d2b5f14", var_74d25c9e);
    zm_sq::objective_complete(#"hash_6540754f9d2b60c7", var_e3b2d4f9);
    wait(1);
    var_7b6eae07 = getent("elec_switch", "script_noteworthy");
    zm_sq::function_266d66eb(#"hash_50971d60dd167421", var_7b6eae07, undefined, #"hash_6a19188591b0ab07", undefined, 96);
    var_7b6eae07 function_619a5c20();
    level flag::wait_till_any([#"hash_7b0e9fd705e66691", "power_on"]);
    zm_sq::objective_complete(#"hash_50971d60dd167421", var_7b6eae07);
    level flag::wait_till_any([#"hash_7d72f2dda7a4104e", #"power_on"]);
    zm_sq::function_266d66eb(#"hash_50971d60dd167421", var_7b6eae07, undefined, #"hash_6a19188591b0ab07", undefined, 96);
    level flag::wait_till("power_on");
    zm_sq::objective_complete(#"hash_50971d60dd167421", var_7b6eae07);
    var_7b6eae07 function_23a29590();
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x3d442423, Offset: 0xabe8
// Size: 0x3c
function open_sesame_watcher() {
    level waittill(#"open_sesame");
    level flag::set(#"hash_7d72f2dda7a4104e");
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xa04c1d01, Offset: 0xac30
// Size: 0x28a
function function_49fa8c75() {
    level endon(#"game_ended");
    level flag::wait_till("start_zombie_round_logic");
    level.var_3b115519 = getentarray("tunnel_boundary_damage_volume", "targetname");
    if (isdefined(level.var_3b115519)) {
        while (true) {
            players = getplayers();
            foreach (player in players) {
                if (player is_touching_any(level.var_3b115519)) {
                    if (!is_true(player.var_b2373233)) {
                        if (isdefined(player.maxhealth) && player.maxhealth > 0) {
                            n_damage = int(player.maxhealth / 6 + 1);
                        } else {
                            n_damage = 31;
                        }
                        player.var_b2373233 = 1;
                        player thread function_7fd17b10();
                        player dodamage(n_damage, player.origin, undefined, undefined, undefined, "MOD_DEATH_CIRCLE", 8192);
                    }
                    player function_bc82f900(#"damage_light");
                    if (!isalive(player) || player scene::is_igc_active()) {
                        player function_fb28bd2c();
                    } else {
                        player function_1251f723();
                    }
                    continue;
                }
                player function_fb28bd2c();
            }
            waitframe(1);
        }
    }
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x632bdf4c, Offset: 0xaec8
// Size: 0x10e
function is_touching_any(a_volumes) {
    self endon(#"death");
    if (zm_utility::is_player_valid(self, 0, 1)) {
        if (isdefined(a_volumes) && a_volumes.size > 0) {
            foreach (volume in a_volumes) {
                if (isdefined(volume) && self istouching(volume)) {
                    if (isdefined(volume.damage_type)) {
                        self.var_878ca565 = volume.damage_type;
                    }
                    return true;
                }
            }
        }
    }
    return false;
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xdb5405f2, Offset: 0xafe0
// Size: 0x54
function function_1251f723() {
    if (self.var_878ca565 === "damage_electric") {
        n_value = 2;
    } else {
        n_value = 1;
    }
    self clientfield::set_to_player("fogofwareffects", n_value);
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xc97dbbd7, Offset: 0xb040
// Size: 0x24
function function_fb28bd2c() {
    self clientfield::set_to_player("fogofwareffects", 0);
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x26a93e8e, Offset: 0xb070
// Size: 0x42
function function_7fd17b10() {
    self notify("3b1ece6427c61fe");
    self endon("3b1ece6427c61fe");
    self endon(#"death");
    wait(1);
    self.var_b2373233 = 0;
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x92a885b8, Offset: 0xb0c0
// Size: 0x34
function function_a648d1a6() {
    self val::set(#"hash_29bdcb17a4141af3", "freezecontrols", 1);
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xdd9b502c, Offset: 0xb100
// Size: 0x3e
function function_dc9b097c() {
    self val::reset(#"hash_29bdcb17a4141af3", "freezecontrols");
    self notify(#"hash_163042b25fa57fdb");
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x6 linked
// Checksum 0x51f03baf, Offset: 0xb148
// Size: 0xac
function private function_6eba65ea() {
    gender = self getplayergendertype();
    if (gender === "female") {
        self clientfield::set("" + #"hash_73227fdae7d9bc0e", 2);
    } else {
        self clientfield::set("" + #"hash_73227fdae7d9bc0e", 1);
    }
    self thread function_7015204c();
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x6 linked
// Checksum 0xf299da4c, Offset: 0xb200
// Size: 0xbc
function private function_7015204c(timeout = 5) {
    level endon(#"end_game");
    self endon(#"disconnect");
    self notify("718416e56310ca1e");
    self endon("718416e56310ca1e");
    self waittilltimeout(timeout, #"death", #"hash_163042b25fa57fdb");
    self clientfield::set("" + #"hash_73227fdae7d9bc0e", 0);
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x9f883045, Offset: 0xb2c8
// Size: 0xac
function function_66efff7a() {
    level endon(#"end_game");
    hidemiscmodels("zm_pt_static_mdl_stuff");
    level flag::wait_till("power_on");
    util::setclientsysstate("platMusUnlock", "unlockDia1");
    util::setclientsysstate("platMusUnlock", "unlockDia2");
    showmiscmodels("zm_pt_static_mdl_stuff");
}

// Namespace zm_platinum/zm_platinum
// Params 1, eflags: 0x2 linked
// Checksum 0x523d2b1a, Offset: 0xb380
// Size: 0x25a
function function_90cffb5b(var_f52c2c29) {
    level endon(#"end_game");
    level flag::wait_till("zones_initialized");
    level.var_141e4a5f = [];
    foreach (var_8c8031b6 in var_f52c2c29) {
        rappel = struct::get(var_8c8031b6, "targetname");
        if (!isdefined(rappel)) {
            continue;
        }
        posonnavmesh = getclosestpointonnavmesh(rappel.origin, 64, 16);
        if (!isdefined(posonnavmesh)) {
            continue;
        }
        var_49360d05 = struct::get(rappel.target, "targetname");
        if (!isdefined(var_49360d05)) {
            continue;
        }
        var_db90fcba = getclosestpointonnavmesh(var_49360d05.origin, 64, 16);
        if (!isdefined(var_db90fcba)) {
            continue;
        }
        str_zone = zm_zonemgr::get_zone_from_position(posonnavmesh, 1);
        str_target_zone = zm_zonemgr::get_zone_from_position(var_db90fcba, 1);
        if (isdefined(str_zone) && isdefined(str_target_zone)) {
            if (!isdefined(level.var_141e4a5f[str_target_zone])) {
                level.var_141e4a5f[str_target_zone] = [];
            }
            level.var_141e4a5f[str_target_zone][str_zone] = {#rappel:rappel, #posonnavmesh:posonnavmesh, #var_db90fcba:var_db90fcba};
        }
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x6 linked
// Checksum 0xd821980f, Offset: 0xb5e8
// Size: 0x47c
function private function_20ad9d07() {
    level endon(#"end_game");
    self endon(#"death", #"disconnect");
    level flag::wait_till("zones_initialized");
    var_ff00218d = 1000000;
    max_dist_sq = 90000;
    while (true) {
        waitresult = self waittill(#"zone_change");
        str_target_zone = waitresult.zone_name;
        if (!isdefined(str_target_zone) || !isdefined(level.var_141e4a5f[str_target_zone])) {
            continue;
        }
        a_ai_zombies = getaiarchetypearray(#"zombie", level.zombie_team);
        var_b8855d07 = [];
        foreach (zombie in a_ai_zombies) {
            if (isdefined(zombie.var_29656770) && zombie.var_29656770.var_990bf66b === str_target_zone) {
                var_b8855d07[var_b8855d07.size] = zombie;
                continue;
            }
            if (distancesquared(zombie.origin, self.origin) < var_ff00218d) {
                var_b8855d07[var_b8855d07.size] = zombie;
            }
        }
        foreach (zombie in var_b8855d07) {
            if (is_true(zombie.interdimensional_gun_kill)) {
                continue;
            }
            if (is_true(zombie.var_61c270)) {
                continue;
            }
            if (zombie.favoriteenemy === self) {
                if (isdefined(zombie.var_29656770) && zombie.var_29656770.var_990bf66b === str_target_zone) {
                    zombie.v_zombie_custom_goal_pos = zombie.var_29656770.var_178696d;
                    zombie.var_29656770.target_zone = str_target_zone;
                    continue;
                }
                str_zone = zombie zm_utility::get_current_zone();
                if (isdefined(str_zone) && isdefined(level.var_141e4a5f[str_target_zone][str_zone])) {
                    var_71c80ceb = level.var_141e4a5f[str_target_zone][str_zone];
                    rappel = var_71c80ceb.rappel;
                    if (distancesquared(zombie.origin, rappel.origin) < max_dist_sq) {
                        println("<unknown string>" + zombie getentitynumber() + "<unknown string>" + str_target_zone);
                        zombie.var_29656770 = {#var_990bf66b:str_zone, #var_178696d:var_71c80ceb.posonnavmesh, #target_zone:str_target_zone};
                        zombie.v_zombie_custom_goal_pos = var_71c80ceb.var_db90fcba;
                        zombie.var_b0709fcc = &function_ab69ca2e;
                        zombie thread function_85dc9b9d();
                    }
                }
            }
        }
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x8c0e7a5d, Offset: 0xba70
// Size: 0x26
function function_ab69ca2e() {
    if (isdefined(self.v_zombie_custom_goal_pos) && isdefined(self.var_29656770)) {
        return true;
    }
    return false;
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x37d6b31f, Offset: 0xbaa0
// Size: 0x352
function function_85dc9b9d() {
    level endon(#"end_game");
    self endon(#"death");
    var_17b7891d = "32aed7d26661bece" + #"hash_5875102b7da237bc";
    self notify(var_17b7891d);
    self endon(var_17b7891d);
    var_41611e5c = self.favoriteenemy;
    while (true) {
        waitresult = self waittill(#"zone_change", #"goal", #"bad_path");
        if (is_true(self.interdimensional_gun_kill)) {
            self.var_29656770 = undefined;
            self.var_b0709fcc = undefined;
            return;
        }
        if (!isdefined(self.favoriteenemy) || self.favoriteenemy !== var_41611e5c) {
            println("<unknown string>" + self getentitynumber() + "<unknown string>");
            break;
        }
        if (waitresult._notify == #"bad_path") {
            /#
                if (isdefined(self.v_zombie_custom_goal_pos)) {
                    println("<unknown string>" + self getentitynumber() + "<unknown string>" + self.origin + "<unknown string>" + self.v_zombie_custom_goal_pos);
                }
            #/
            self setgoal(self.origin);
            waitframe(1);
            break;
        }
        str_zone = self zm_utility::get_current_zone();
        if (str_zone === self.var_29656770.target_zone) {
            println("<unknown string>" + self getentitynumber() + "<unknown string>" + str_zone);
            break;
        }
        if (waitresult._notify == "goal" && isdefined(self.v_zombie_custom_goal_pos)) {
            if (distancesquared(self.origin, self.v_zombie_custom_goal_pos) < sqr(self.goalradius)) {
                println("<unknown string>" + self getentitynumber() + "<unknown string>");
                break;
            }
            self setgoal(self.v_zombie_custom_goal_pos);
        }
    }
    self.var_29656770 = undefined;
    self.v_zombie_custom_goal_pos = undefined;
    self.var_b0709fcc = undefined;
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xb31eeb77, Offset: 0xbe00
// Size: 0x8c
function function_9d23c457() {
    level clientfield::set("" + #"hash_6eb96d2ad043aa56", 1);
    level flag::wait_till(#"intro_scene_done");
    level clientfield::set("" + #"hash_6eb96d2ad043aa56", 0);
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xc9ec4114, Offset: 0xbe98
// Size: 0xac
function function_4cc5fca6() {
    level endon(#"end_game");
    level clientfield::set("" + #"hash_7b3ada6e5b1cf81e", 1);
    array::wait_till(function_a1ef346b(), "fasttravel_over", 15);
    level clientfield::set("" + #"hash_7b3ada6e5b1cf81e", 0);
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x0
// Checksum 0x5b7744e0, Offset: 0xbf50
// Size: 0xa4
function function_4a62319d() {
    self endon(#"death");
    self waittill(#"risen");
    if (self istouching(getent("portal_spawn_fx_volume", "targetname")) && self.archetype === #"zombie") {
        self clientfield::increment("" + #"hash_636aa4e3dd50512a");
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0xd76af5de, Offset: 0xc000
// Size: 0x19c
function function_d81240c3() {
    level endon(#"game_ended", #"hash_4fbe4720f6f13107");
    while (!isdefined(level.var_117d5f10)) {
        waitframe(1);
    }
    level.var_117d5f10 endon(#"death");
    level.var_117d5f10 clientfield::set("" + #"hash_315d8062badb2345", 1);
    level flag::wait_till("exfil_heli_arrived");
    var_fcda785d = getent("prb_mil_ru_heli_trans", "targetname");
    if (isdefined(var_fcda785d)) {
        var_fcda785d unlink();
        var_fcda785d linkto(level.var_117d5f10, "tag_probe_attach", (0, 0, 0), (0, 0, 0));
    }
    exploder::exploder("fxexp_exfil_rotorwash");
    level flag::wait_till("exfil_cleared");
    level.var_117d5f10 clientfield::set("" + #"hash_315d8062badb2345", 2);
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x2 linked
// Checksum 0x83b792e9, Offset: 0xc1a8
// Size: 0x11a
function function_a56b42c0() {
    if (level.round_number === 10 && !zm_round_spawning::function_fab464c4()) {
        level waittill(#"start_of_round");
        while (true) {
            active_zones = zm_zonemgr::get_active_zone_names();
            zone_name = array::random(active_zones);
            if (isdefined(zone_name)) {
                spawn_ai = zm_utility::function_cce73165("mechz_location", #"spawner_bo5_mechz_sr", zone_name);
                if (isdefined(spawn_ai)) {
                    spawn_ai.var_5e54763a = zone_name;
                    spawn_ai.var_98f1f37c = 1;
                    callback::function_50fdac80(&function_a56b42c0);
                    break;
                }
            }
            wait(1);
        }
    }
}

// Namespace zm_platinum/zm_platinum
// Params 0, eflags: 0x6 linked
// Checksum 0xc6867444, Offset: 0xc2d0
// Size: 0x154
function private function_d888610a() {
    level endon(#"end_game");
    while (true) {
        a_players = function_a1ef346b();
        foreach (player in a_players) {
            if (player.cached_zone_name === "zone_power_substation2" || player.cached_zone_name === "zone_secret_spy_tunnel") {
                player clientfield::set_to_player("" + #"hash_46bbaae5eb8a7080", 1);
                continue;
            }
            player clientfield::set_to_player("" + #"hash_46bbaae5eb8a7080", 0);
        }
        wait(0.5);
    }
}

/#

    // Namespace zm_platinum/zm_platinum
    // Params 0, eflags: 0x0
    // Checksum 0xf37c3e0b, Offset: 0xc430
    // Size: 0x124
    function function_c13a2cf5() {
        if (!zm_utility::is_ee_enabled()) {
            return;
        }
        util::waittill_can_add_debug_command();
        util::add_devgui("<unknown string>", "<unknown string>");
        util::add_devgui("<unknown string>", "<unknown string>");
        util::add_devgui("<unknown string>", "<unknown string>");
        util::add_devgui("<unknown string>", "<unknown string>");
        level flag::wait_till_all([#"intro_scene_done", "<unknown string>", "<unknown string>"]);
        wait(2);
        level thread function_dd856618();
    }

    // Namespace zm_platinum/zm_platinum
    // Params 0, eflags: 0x0
    // Checksum 0x7e9f8ed0, Offset: 0xc560
    // Size: 0x4c6
    function function_dd856618() {
        while (true) {
            if (getdvarint(#"hash_7f4e76de02a19b25", 0) > 0) {
                if (!is_true(level.var_f979d504)) {
                    level function_dd3953d3();
                    level.var_f979d504 = 1;
                }
                setdvar(#"hash_7f4e76de02a19b25", 0);
            }
            if (getdvarint(#"hash_31ba51c79831310b", 0)) {
                if (!is_true(level.var_6d81f20c)) {
                    level function_58f27026();
                    level function_42f2b8ac();
                    level function_81acf2cf();
                    level zombie_devgui_goto_round(8);
                    level function_284985a5(#"hash_532d4747d3b67ad1", #"step_2");
                    level.var_6d81f20c = 1;
                }
                setdvar(#"hash_31ba51c79831310b", 0);
            }
            if (getdvarint(#"hash_3c2831f7935e7323", 0)) {
                if (!is_true(level.var_68bddf8a)) {
                    foreach (player in function_a1ef346b()) {
                        player function_e6b581e7(1);
                    }
                    level.var_68bddf8a = 1;
                }
                setdvar(#"hash_3c2831f7935e7323", 0);
            }
            if (getdvarint(#"hash_23fec5164390c16f", 0)) {
                if (!is_true(level.var_f87312e7)) {
                    foreach (player in function_a1ef346b()) {
                        player function_e6b581e7(0);
                    }
                    level.var_f87312e7 = 1;
                }
                setdvar(#"hash_23fec5164390c16f", 0);
            }
            if (getdvarint(#"hash_59cf9e74e0825b8a", 0)) {
                if (!is_true(level.var_29fe9e88)) {
                    level function_e4146082();
                    level.var_29fe9e88 = 1;
                }
                setdvar(#"hash_59cf9e74e0825b8a", 0);
            }
            if (getdvarint(#"hash_67e70c8f0396cfa8", 0)) {
                if (!is_true(level.var_5860e2da)) {
                    level function_115a1fd();
                    level.var_5860e2da = 1;
                }
                setdvar(#"hash_67e70c8f0396cfa8", 0);
            }
            waitframe(3);
        }
    }

    // Namespace zm_platinum/zm_platinum
    // Params 0, eflags: 0x0
    // Checksum 0x3bd0954c, Offset: 0xca30
    // Size: 0x224
    function function_dd3953d3() {
        level function_58f27026();
        level function_42f2b8ac();
        level function_81acf2cf();
        level function_1365e765();
        level zombie_devgui_goto_round(8);
        switch (getdvarint(#"hash_7f4e76de02a19b25", 0)) {
        case 1:
        default:
            step_name = #"hash_587e74fe327f43fb";
            break;
        case 2:
            step_name = #"hash_428542f9f5e07c8e";
            break;
        case 3:
            step_name = #"hash_2eee1c712127c1ca";
            break;
        case 4:
            step_name = #"hash_4b1700b8df69481b";
            break;
        case 5:
            step_name = #"hash_63dee3cf914e5e20";
            break;
        case 6:
            step_name = #"hash_19376fa43a7e085c";
            break;
        case 7:
            step_name = #"hash_58a40205ad8ede62";
            break;
        case 8:
            step_name = #"hash_284338cc7c9db648";
            break;
        }
        level function_284985a5(#"hash_389d6ed2b350d4ea", step_name);
    }

    // Namespace zm_platinum/zm_platinum
    // Params 1, eflags: 0x0
    // Checksum 0x8d8eda2e, Offset: 0xcc60
    // Size: 0x1b4
    function zombie_devgui_goto_round(target_round) {
        player = getplayers()[0];
        if (target_round < 1) {
            target_round = 1;
        }
        level.devcheater = 1;
        level.zombie_total = 0;
        level.zombie_health = isdefined(level.var_41dd92fd[#"zombie"].health) ? level.var_41dd92fd[#"zombie"].health : 100;
        zm_round_logic::set_round_number(target_round - 1);
        if (isdefined(level.var_e63636af)) {
            [[ level.var_e63636af ]](target_round - 1);
        }
        level notify(#"kill_round");
        wait(1);
        zombies = getaiteamarray(level.zombie_team);
        if (isdefined(zombies)) {
            for (i = 0; i < zombies.size; i++) {
                if (is_true(zombies[i].ignore_devgui_death)) {
                    continue;
                }
                zombies[i] dodamage(zombies[i].health + 666, zombies[i].origin);
            }
        }
    }

    // Namespace zm_platinum/zm_platinum
    // Params 0, eflags: 0x0
    // Checksum 0xa15c2dde, Offset: 0xce20
    // Size: 0x464
    function function_58f27026() {
        setdvar(#"zombie_unlock_all", 1);
        level flag::set("<unknown string>");
        level clientfield::set("<unknown string>", 1);
        power_trigs = getentarray("<unknown string>", "<unknown string>");
        foreach (trig in power_trigs) {
            if (isdefined(trig.script_int)) {
                level flag::set("<unknown string>" + trig.script_int);
                level clientfield::set("<unknown string>", trig.script_int + 1);
            }
        }
        players = getplayers();
        foreach (player in players) {
            player zm_score::add_to_player_score(100000);
            player namespace_2a9f256a::function_afab250a(100000);
            player namespace_2a9f256a::function_a6d4221f(100000);
        }
        zombie_doors = getentarray("<unknown string>", "<unknown string>");
        for (i = 0; i < zombie_doors.size; i++) {
            if (!is_true(zombie_doors[i].has_been_opened)) {
                zombie_doors[i] notify(#"trigger", {#activator:players[0]});
            }
            if (is_true(zombie_doors[i].power_door_ignore_flag_wait)) {
                zombie_doors[i] notify(#"power_on");
            }
            waitframe(1);
        }
        zombie_airlock_doors = getentarray("<unknown string>", "<unknown string>");
        for (i = 0; i < zombie_airlock_doors.size; i++) {
            zombie_airlock_doors[i] notify(#"trigger", {#activator:players[0]});
            waitframe(1);
        }
        zombie_debris = getentarray("<unknown string>", "<unknown string>");
        for (i = 0; i < zombie_debris.size; i++) {
            if (isdefined(zombie_debris[i])) {
                zombie_debris[i] notify(#"trigger", {#activator:players[0]});
            }
            waitframe(1);
        }
        level notify(#"open_sesame");
        wait(1);
        setdvar(#"zombie_unlock_all", 0);
    }

    // Namespace zm_platinum/zm_platinum
    // Params 0, eflags: 0x0
    // Checksum 0x432ee303, Offset: 0xd290
    // Size: 0x4c
    function function_42f2b8ac() {
        level flag::set(#"hash_7d72f2dda7a4104e");
        level flag::set("<unknown string>");
    }

    // Namespace zm_platinum/zm_platinum
    // Params 0, eflags: 0x0
    // Checksum 0x9d5b6302, Offset: 0xd2e8
    // Size: 0x272
    function function_81acf2cf() {
        level flag::set(#"hash_20afa38b1f1c339e");
        level clientfield::set("<unknown string>" + #"hash_2e8ad83a0edc8ab4", 0);
        var_b9deb373 = struct::get_script_bundle_instances("<unknown string>", ["<unknown string>", "<unknown string>"]);
        var_f501ee56 = struct::get_script_bundle_instances("<unknown string>", ["<unknown string>", "<unknown string>"]);
        var_bc5ea9bc = arraycombine(var_b9deb373, var_f501ee56, 0, 0);
        var_1a4d3aef = struct::get_script_bundle_instances("<unknown string>", ["<unknown string>", "<unknown string>"]);
        var_bc5ea9bc = arraycombine(var_bc5ea9bc, var_1a4d3aef, 0, 0);
        foreach (var_8a36246d in var_bc5ea9bc) {
            if (var_8a36246d scene::is_playing()) {
                var_8a36246d scene::stop(1);
            }
        }
        for (i = 0; i <= 10; i++) {
            level clientfield::set("<unknown string>" + #"hash_3fb8ca8c017ba7ac", i);
            waitframe(1);
        }
    }

    // Namespace zm_platinum/zm_platinum
    // Params 0, eflags: 0x0
    // Checksum 0x9ec1aa9c, Offset: 0xd568
    // Size: 0x4c
    function function_1365e765() {
        level flag::set(#"hash_5503fb2f49e6a242");
        level flag::set(#"hash_75f07aed08b6bb5e");
    }

    // Namespace zm_platinum/zm_platinum
    // Params 1, eflags: 0x0
    // Checksum 0x7f468439, Offset: 0xd5c0
    // Size: 0x32c
    function function_e6b581e7(var_9ff20235) {
        level flag::wait_till("<unknown string>");
        start_weapon = self getcurrentweapon();
        if (is_true(var_9ff20235)) {
            var_7625b6cc = "<unknown string>";
            var_27751b99 = 3;
        } else {
            var_7625b6cc = "<unknown string>";
            var_27751b99 = 1;
        }
        str_weapon_name = array::random(["<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>"]);
        self function_749d2cfc(hash(str_weapon_name), hash(str_weapon_name + var_7625b6cc), var_27751b99);
        self aat::acquire(self getcurrentweapon());
        self waittill(#"weapon_change_complete");
        foreach (weapon in self getweaponslistprimaries()) {
            if (weapon == start_weapon) {
                self switchtoweaponimmediate(weapon);
                self waittill(#"weapon_change_complete");
            }
        }
        self thread zm_perks::function_29387491(#"hash_47d7a8105237c88");
        self thread zm_perks::function_29387491(#"hash_38c08136902fd553");
        self thread zm_perks::function_29387491(#"hash_210097a75bb6c49a");
        self thread zm_perks::function_29387491(#"hash_7f98b3dd3cce95aa");
        str_item_name = namespace_f999c142::function_ff28876a(3);
        self namespace_f999c142::function_923efc48(str_item_name, 3);
        self namespace_1cc7b406::give_item(#"armor_item_lv3_t9_sr");
    }

    // Namespace zm_platinum/zm_platinum
    // Params 3, eflags: 0x0
    // Checksum 0x9996620f, Offset: 0xd8f8
    // Size: 0x266
    function function_749d2cfc(*str_weapon_name, str_item_name, var_27751b99) {
        self endon(#"disconnect");
        if (isdefined(str_item_name)) {
            point = function_4ba8fde(str_item_name);
            if (isdefined(point) && isdefined(var_27751b99) && isdefined(level.var_fee1eaaf)) {
                new_item = [[ level.var_fee1eaaf ]](point);
                if (isdefined(new_item)) {
                    point = new_item;
                    point.paplv = var_27751b99;
                }
            }
            if (isdefined(point.itementry.var_a53e9db0)) {
                weapon = namespace_65181344::function_67456242(point.itementry);
                dropitem = item_drop::drop_item(0, weapon, 1, weapon.maxammo, point.id, self.origin, self.angles, 1);
                dropitem.var_519e776c = 1;
                dropitem.hidetime = 1;
                dropitem hide();
                self zm_weapons::function_98776900(dropitem, 0, 0, 1);
            } else {
                self zm_weapons::function_98776900(point, 0, 0, 1);
            }
            if (isdefined(var_27751b99)) {
                self item_inventory::function_d92c6b5b(self.currentweapon, 0);
                maxammo = self.currentweapon.maxammo;
                maxclip = self function_b7f1fd2c(self.currentweapon);
                self setweaponammoclip(self.currentweapon, maxclip);
                self setweaponammostock(self.currentweapon, maxammo);
                self notify(#"hash_75ec9942d2d5fd0f");
            }
        }
    }

    // Namespace zm_platinum/zm_platinum
    // Params 0, eflags: 0x0
    // Checksum 0x6102c2c9, Offset: 0xdb68
    // Size: 0x98
    function function_e4146082() {
        foreach (player in function_a1ef346b()) {
            player function_86af79f6();
        }
    }

    // Namespace zm_platinum/zm_platinum
    // Params 0, eflags: 0x0
    // Checksum 0xa9b17c86, Offset: 0xdc08
    // Size: 0x7c
    function function_86af79f6() {
        self endon(#"disconnect", #"death");
        while (self zm_utility::is_drinking()) {
            wait(0.1);
        }
        self zm_weapons::weapon_give(getweapon("<unknown string>"), 1);
    }

    // Namespace zm_platinum/zm_platinum
    // Params 0, eflags: 0x0
    // Checksum 0x64caec76, Offset: 0xdc90
    // Size: 0x98
    function function_115a1fd() {
        foreach (player in function_a1ef346b()) {
            player thread function_c026e69b();
        }
    }

    // Namespace zm_platinum/zm_platinum
    // Params 0, eflags: 0x0
    // Checksum 0xd22183ee, Offset: 0xdd30
    // Size: 0x7c
    function function_c026e69b() {
        self endon(#"disconnect", #"death");
        while (self zm_utility::is_drinking()) {
            wait(0.1);
        }
        self zm_weapons::weapon_give(getweapon("<unknown string>"), 1);
    }

    // Namespace zm_platinum/zm_platinum
    // Params 2, eflags: 0x0
    // Checksum 0xbdc8c3e5, Offset: 0xddb8
    // Size: 0xca
    function function_284985a5(ee_name, step_name) {
        ee = self._ee[ee_name];
        step_index = zm_sq::function_9212ff4d(ee_name, step_name);
        if (ee.started && step_index <= ee.current_step) {
            return 0;
        }
        ee.skip_to_step = step_index;
        if (ee.started) {
            function_905781df(ee_name);
        } else {
            level zm_sq::start(ee.name);
        }
        return 1;
    }

    // Namespace zm_platinum/zm_platinum
    // Params 1, eflags: 0x0
    // Checksum 0xd5a8403b, Offset: 0xde90
    // Size: 0xa4
    function function_905781df(ee_name) {
        ee = self._ee[ee_name];
        if (ee.started) {
            while (ee.current_step <= ee.skip_to_step - 1) {
                ee.steps[ee.current_step] notify(#"end_early");
                wait(0.5);
            }
            return;
        }
        iprintlnbold("<unknown string>");
    }

    // Namespace zm_platinum/zm_platinum
    // Params 3, eflags: 0x0
    // Checksum 0x83f5fb55, Offset: 0xdf40
    // Size: 0x234
    function run_step(ee, step, var_5ea5c94d) {
        var_4ef8d79b = isentity(self);
        if (var_4ef8d79b) {
            self endon(#"death");
            self endon(#"disconnect");
        }
        self endon(#"game_ended");
        ee.started = 1;
        step.started = 1;
        self thread function_3f795dc3(ee, step, var_5ea5c94d);
        if (!step.completed) {
            waitresult = self waittill(step.var_e788cdd7 + "<unknown string>", step.var_e788cdd7 + "<unknown string>");
        }
        if (game.state === #"postgame") {
            return;
        }
        ended_early = isdefined(waitresult) && waitresult._notify == step.var_e788cdd7 + "<unknown string>";
        [[ step.cleanup_func ]](var_5ea5c94d, ended_early);
        step.cleaned_up = 1;
        if (game.state === #"postgame") {
            return;
        }
        self flag::set(step.var_e788cdd7 + "<unknown string>");
        if (isdefined(step.next_step)) {
            var_5ea5c94d = 0;
            ee.current_step++;
            self thread run_step(ee, step.next_step, var_5ea5c94d);
            return;
        }
        ee.completed = 1;
        self flag::set(ee.name + "<unknown string>");
    }

    // Namespace zm_platinum/zm_platinum
    // Params 3, eflags: 0x4
    // Checksum 0xdbe0e3bf, Offset: 0xe180
    // Size: 0x154
    function private function_3f795dc3(*ee, step, var_5ea5c94d) {
        if (isentity(self)) {
            self endon(#"death");
            self endon(#"disconnect");
        }
        self endon(#"game_ended");
        step endoncallback(&function_df365859, #"end_early");
        self notify(step.var_e788cdd7 + "<unknown string>");
        if (isdefined(step.var_6cc77d4e)) {
            level zm_sq::function_266d66eb(step.var_6cc77d4e, step.a_targets, undefined, step.var_441061cd);
        }
        [[ step.setup_func ]](var_5ea5c94d);
        step.completed = 1;
        if (isdefined(step.var_6cc77d4e)) {
            level zm_sq::objective_complete(step.var_6cc77d4e, step.a_targets);
        }
        self notify(step.var_e788cdd7 + "<unknown string>");
    }

    // Namespace zm_platinum/zm_platinum
    // Params 1, eflags: 0x4
    // Checksum 0xa7b7f7eb, Offset: 0xe2e0
    // Size: 0x9c
    function private function_df365859(*notifyhash) {
        self.completed = 1;
        if (isdefined(self.var_6cc77d4e)) {
            level zm_sq::objective_complete(self.var_6cc77d4e, self.a_targets);
        }
        waittillframeend();
        self.ee.owner notify(self.var_e788cdd7 + "<unknown string>");
        self.ee.owner notify(self.var_e788cdd7 + "<unknown string>");
    }

    // Namespace zm_platinum/zm_platinum
    // Params 0, eflags: 0x0
    // Checksum 0x45eb9eeb, Offset: 0xe388
    // Size: 0xd4
    function function_cd7a3de4() {
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        zm_devgui::add_custom_devgui_callback(&cmd);
    }

    // Namespace zm_platinum/zm_platinum
    // Params 1, eflags: 0x0
    // Checksum 0x5d6a28e3, Offset: 0xe468
    // Size: 0x262
    function cmd(cmd) {
        switch (cmd) {
        case #"hash_164c82054a4ebab8":
            function_bf105732(1);
            break;
        case #"hash_841ce5811a32fe":
            function_bf105732(0);
            break;
        case #"hash_1dfa325a761c2516":
            function_e2610c23();
            break;
        case #"hash_3cdd5eae8d7817ac":
            function_30e6bbd6();
            break;
        case #"hash_6be1051cba4047d8":
            foreach (player in function_a1ef346b()) {
                player thread function_23c31b4e();
            }
            break;
        case #"hash_f883dd07b22ce92":
            level notify(#"hash_31a61be99d69708a");
            foreach (player in function_a1ef346b()) {
                player clientfield::set("<unknown string>" + #"hash_63af42145e260fb5", 0);
            }
            break;
        case #"hash_1b44e1a5f513a996":
            function_7b342056();
            break;
        }
    }

    // Namespace zm_platinum/zm_platinum
    // Params 0, eflags: 0x4
    // Checksum 0x9903846e, Offset: 0xe6d8
    // Size: 0x2c
    function private function_30e6bbd6() {
        level flag::set(#"hash_3f926cd1d573549d");
    }

    // Namespace zm_platinum/zm_platinum
    // Params 0, eflags: 0x0
    // Checksum 0xc77d7c15, Offset: 0xe710
    // Size: 0xb0
    function function_7b342056() {
        foreach (player in function_a1ef346b()) {
            player zm_weapons::weapon_give(getweapon("<unknown string>"), 1);
        }
    }

#/
