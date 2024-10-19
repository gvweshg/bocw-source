// Atian COD Tools GSC CW decompiler test
#using script_3a704cbcf4081bfb;
#using script_58860a35d0555f74;
#using script_63b5c2449d0e2f48;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_audio_sq.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using script_34ab99a4ca1a43d;
#using script_7a5293d92c61c788;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using script_5b190e6124417f5a;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm\zm_platinum.gsc;
#using script_1c92816b36da2771;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using script_340a2e805e35f7a2;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\zm_common\zm_fasttravel.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\item_world.gsc;
#using scripts\core_common\item_drop.gsc;
#using scripts\core_common\content_manager.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_958b287a;

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0x808999a0, Offset: 0x6d0
// Size: 0xbc
function init() {
    init_clientfields();
    if (!zm_utility::is_ee_enabled()) {
        var_22e48c9c = getentarray("pl_by_pt", "targetname");
        array::run_all(var_22e48c9c, &hide);
        return;
    }
    init_quests();
    namespace_1fd59e39::function_1376ec37(undefined, undefined, "vol_bc_restrict");
    /#
        level thread function_eea3cf4a();
    #/
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0x4b837b70, Offset: 0x798
// Size: 0x214
function init_clientfields() {
    clientfield::register("scriptmover", "" + #"hash_7171d4768b724a65", 24000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_5fca7cdab0e93f71", 24000, 1, "int");
    clientfield::register("world", "" + #"hash_866e71344110f38", 24000, getminbitcountfornum(2), "int");
    clientfield::register("actor", "" + #"hash_54e2a4e02a26cc62", 24000, 1, "counter");
    clientfield::register("toplayer", "" + #"hash_721d42a28d7461ea", 24000, 1, "int");
    clientfield::register("world", "" + #"hash_27f831b48c21166f", 24000, 1, "int");
    clientfield::register("world", "" + #"hash_28f70ef210665b53", 24000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_e4552abd8fb5506", 24000, 1, "int");
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0x67927873, Offset: 0x9b8
// Size: 0x29c
function init_quests() {
    zm_audio_sq::init();
    level zm_sq::register(#"hash_532d4747d3b67ad1", #"step_1", #"hash_48ae75f4de9892ec", &function_92105cc8, &function_1e78f5fa);
    level zm_sq::register(#"hash_532d4747d3b67ad1", #"step_2", #"hash_48ae78f4de989805", &function_3c076e85, &function_b23edced);
    level zm_sq::register(#"hash_532d4747d3b67ad1", #"step_3", #"hash_48ae77f4de989652", &function_5897cf56, &function_c50aa817);
    level zm_sq::register(#"hash_8d1695b3c81e6cd", #"step_1", #"hash_5b18caca7fbd28f0", &function_e80810b4, &function_ba11058a);
    level zm_sq::register(#"hash_8d1695b3c81e6cd", #"step_2", #"hash_5b18cdca7fbd2e09", &function_9a22f9c2, &function_1c35e44a);
    level zm_sq::register(#"hash_156c18c15a84ac22", #"step_1", #"hash_35da5c7d8af226fd", &function_af042db0, &function_6c660ed5);
    level thread function_f1e68db9();
    level thread function_aa9d9702();
    level thread function_2abef8da();
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x6 linked
// Checksum 0x356a101, Offset: 0xc60
// Size: 0x7c
function private function_2abef8da() {
    level zm_sq::start(#"hash_532d4747d3b67ad1", 1);
    level zm_sq::start(#"hash_8d1695b3c81e6cd", 1);
    level zm_sq::start(#"hash_156c18c15a84ac22", 1);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0xc13670ad, Offset: 0xce8
// Size: 0x1f4
function function_f1e68db9() {
    if (!isdefined(level.var_84644da3)) {
        level.var_84644da3 = 0;
    }
    level.var_84644da3++;
    level.var_fe700d1d = #"hash_41a84b48c5688d5e" + level.var_84644da3;
    level zm_sq::register(#"hash_7305ed0bfae697c1" + level.var_84644da3, #"step_1", #"hash_505bb72ac14a72b8" + level.var_84644da3, &function_ae1c3581, &function_6d225cba);
    level zm_sq::register(#"hash_7305ed0bfae697c1" + level.var_84644da3, #"step_2", #"hash_505eb72ac14ca88f" + level.var_84644da3, &function_1117e359, &function_b0e382eb);
    level zm_sq::register(#"hash_7305ed0bfae697c1" + level.var_84644da3, #"step_3", #"hash_5062772ac15024a6" + level.var_84644da3, &function_a04ddc18, &function_87440364);
    level zm_sq::start(#"hash_7305ed0bfae697c1" + level.var_84644da3, 1);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0x46fdec15, Offset: 0xee8
// Size: 0x104
function function_aa9d9702() {
    if (!isdefined(level.var_d3450438)) {
        level.var_d3450438 = 0;
    }
    level.var_d3450438++;
    level.var_fd9dec51 = #"hash_66e2d62d9b36999b" + level.var_d3450438;
    level zm_sq::register(#"hash_7868beb4ca9e1449" + level.var_d3450438, #"step_1", #"hash_557e01adc0c8790" + level.var_d3450438, &function_d745ca5e, &function_23cef26a);
    level zm_sq::start(#"hash_7868beb4ca9e1449" + level.var_d3450438, 1);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0xbbb51f92, Offset: 0xff8
// Size: 0x184
function function_92105cc8(*var_a276c861) {
    level endon(#"game_ended", #"hash_57e6e0188d82d9e6");
    var_22e48c9c = getentarray("pl_by_pt", "targetname");
    foreach (e_part in var_22e48c9c) {
        e_part thread function_f108e709();
    }
    var_fc90ddf0 = 0;
    while (true) {
        level waittill(#"hash_3cfc9bc31cad5e4a");
        var_fc90ddf0 += 1;
        /#
            iprintlnbold(var_fc90ddf0 + "supply_drop_fx");
        #/
        namespace_b574e135::function_f5d0eb85(var_fc90ddf0);
        if (var_fc90ddf0 >= 6) {
            break;
        }
    }
    /#
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0xbca81e23, Offset: 0x1188
// Size: 0xa4
function function_f108e709() {
    self zm_unitrigger::function_fac87205(&function_7f55d66, 96);
    self clientfield::set("" + #"hash_5fca7cdab0e93f71", 1);
    level notify(#"hash_3cfc9bc31cad5e4a");
    self ghost();
    wait(1);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0xba53156b, Offset: 0x1238
// Size: 0x144
function function_7f55d66(e_player) {
    s_parent = self.stub.related_parent;
    if (!isdefined(s_parent)) {
        return false;
    }
    var_5168e40f = e_player zm_utility::is_player_looking_at(s_parent.origin, 0.9);
    var_f7675868 = !level flag::get(#"hash_434bc775e67b7233") || level flag::get(#"hash_434bc775e67b7233") && level flag::get(#"hash_20afa38b1f1c339e");
    var_77251cc8 = level flag::get(#"hash_25372b8b89ab540c");
    return is_true(var_5168e40f) && is_true(var_77251cc8) && is_true(var_f7675868);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 2, eflags: 0x2 linked
// Checksum 0x92807d45, Offset: 0x1388
// Size: 0xa2
function function_1e78f5fa(var_a276c861, var_19e802fa) {
    level flag::set(#"hash_7b5643f5ecc16c8f");
    if (var_a276c861 || var_19e802fa) {
        level flag::set(#"hash_57e6e0188d82d9e6");
        for (i = 1; i <= 6; i++) {
            namespace_b574e135::function_f5d0eb85(i);
            waitframe(1);
        }
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0x952b18bf, Offset: 0x1438
// Size: 0x15c
function function_ae1c3581(*var_a276c861) {
    level endon(#"game_ended", level.var_fe700d1d);
    level flag::wait_till(#"hash_7cc4347161a79b86");
    var_a2b82573 = level.round_number + 15;
    level waittill(#"start_of_round");
    while (level.round_number < var_a2b82573) {
        level waittill(#"end_of_round");
    }
    var_6fed2eb5 = struct::get("bc_return");
    level.var_6cd28a87 = util::spawn_model(#"hash_7f311e8d38b7d936", var_6fed2eb5.origin, var_6fed2eb5.angles);
    level.var_6cd28a87 function_da10c3e7();
    level.var_6cd28a87 thread function_957e8ad3();
    level flag::wait_till(level.var_fe700d1d);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0xbeb02dcf, Offset: 0x15a0
// Size: 0x94
function function_da10c3e7() {
    level endon(#"game_ended", level.var_fe700d1d);
    self endon(#"death");
    self clientfield::set("" + #"hash_7171d4768b724a65", 1);
    wait(1);
    self clientfield::set("" + #"hash_7171d4768b724a65", 0);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0xa3f8ac2b, Offset: 0x1640
// Size: 0xf8
function function_957e8ad3() {
    level endon(#"game_ended", level.var_fe700d1d);
    self endon(#"death");
    self.takedamage = 1;
    while (true) {
        waitresult = self waittill(#"damage");
        if (isplayer(waitresult.attacker) && level flag::get(#"hash_25372b8b89ab540c")) {
            level flag::set(#"hash_7b5643f5ecc16c8f");
            level flag::set(level.var_fe700d1d);
        }
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 2, eflags: 0x2 linked
// Checksum 0x1f3c415, Offset: 0x1740
// Size: 0xe4
function function_6d225cba(var_a276c861, var_19e802fa) {
    if (var_a276c861 || var_19e802fa) {
        level flag::set(level.var_fe700d1d);
        level flag::set(#"hash_7b5643f5ecc16c8f");
    }
    if (isdefined(level.var_6cd28a87)) {
        level.var_6cd28a87 clientfield::set("" + #"hash_5fca7cdab0e93f71", 1);
        level.var_6cd28a87 ghost();
        level.var_6cd28a87 util::function_f9af3d43(2);
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0x9ad25582, Offset: 0x1830
// Size: 0x24
function function_3c076e85(var_a276c861) {
    level function_ae62fd54(var_a276c861);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0x608aae81, Offset: 0x1860
// Size: 0x24
function function_1117e359(var_a276c861) {
    level function_ae62fd54(var_a276c861);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0x713e96a9, Offset: 0x1890
// Size: 0x492
function function_ae62fd54(var_a276c861) {
    level endon(#"hash_399c68f64eb1b589");
    var_3a49bb20 = struct::get("bny_club_dj_loc");
    level thread zm_platinum::function_4cc5fca6();
    level clientfield::increment("" + #"hash_56c7e620d1de163a");
    level flag::set(#"in_dark_side");
    level flag::set(#"hash_13cd183e1c6cadd2");
    wait(6.5);
    foreach (player in getplayers()) {
        player notify(#"hash_42b83a8bd6b040d3");
    }
    level thread function_6b4c16f8();
    level flag::clear("spawn_zombies");
    level zm_utility::function_9ad5aeb1(1, 1, 1, 0);
    level thread namespace_99d0d95e::function_8f85d169(1);
    level clientfield::set("" + #"hash_866e71344110f38", 1);
    zm_zonemgr::enable_zone("zone_bunny_club");
    function_b04a544a(1);
    function_51a95461(1);
    var_39aa2909 = struct::get_array("pl_by_cl_spn");
    var_9ab9f5a5 = [(1590, 10561, -952), (1626, 10367, -952), (1631, 10172, -952), (1580, 9973, -952)];
    for (i = 0; i < var_39aa2909.size; i++) {
        var_39aa2909[i].origin = var_9ab9f5a5[i];
        var_39aa2909[i].angles = (0, 360, 0);
    }
    foreach (player in function_a1ef346b()) {
        player clientfield::set_to_player("" + #"hash_721d42a28d7461ea", 1);
        n_index = zm_fasttravel::get_player_index(player);
        var_8828e30f = var_39aa2909[n_index];
        player thread function_59ebeee9(var_8828e30f);
    }
    wait(3);
    var_3a49bb20 thread function_135c5a05();
    level flag::set(#"hash_43c360bf8cccea00");
    if (var_a276c861) {
        return;
    }
    var_3a49bb20.b_reward = function_ef40fc60();
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0xef72195c, Offset: 0x1d30
// Size: 0xb4
function function_135c5a05() {
    level endon(#"hash_51047505aeee86ad");
    wait(3);
    var_6cd28a87 = util::spawn_model(#"hash_7f311e8d38b7d936", self.origin, self.angles);
    self.var_6cd28a87 = var_6cd28a87;
    var_6cd28a87 clientfield::set("" + #"hash_7171d4768b724a65", 1);
    wait(1);
    var_6cd28a87 thread function_15741b86();
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0xd52e71fe, Offset: 0x1df0
// Size: 0x84
function function_6b4c16f8() {
    level endon(#"hash_6d16c284cbb301d1");
    if (level flag::get(#"hash_6d16c284cbb301d1")) {
        level flag::wait_till(#"hash_279a97271de2b7e1");
        level notify(#"hash_2394f251215a8fae");
        thread namespace_6fb22263::function_55bd650c();
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 2, eflags: 0x2 linked
// Checksum 0xfdb12767, Offset: 0x1e80
// Size: 0x104
function function_b04a544a(b_enabled, *var_51eca06c = 1) {
    a_e_clip = getentarray("bny_club_energy_barrier_clip", "targetname");
    if (var_51eca06c) {
        level clientfield::set("" + #"hash_28f70ef210665b53", 1);
        array::run_all(a_e_clip, &solid);
        return;
    }
    level clientfield::set("" + #"hash_28f70ef210665b53", 0);
    array::run_all(a_e_clip, &notsolid);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0x5d2ca74e, Offset: 0x1f90
// Size: 0xc0
function function_15741b86() {
    self endon(#"death");
    level endon(#"hash_51047505aeee86ad");
    self scene::play(#"hash_4380575dd04b7eeb", "entry_1", self);
    while (true) {
        if (math::cointoss()) {
            str_scene = "loop_1";
        } else {
            str_scene = "loop_2";
        }
        self scene::play(#"hash_4380575dd04b7eeb", str_scene, self);
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0xa9f9f71b, Offset: 0x2058
// Size: 0xcc
function function_190fd035(var_3a49bb20) {
    self endon(#"death");
    if (is_true(var_3a49bb20.b_reward)) {
        str_scene = "exit_1";
    } else {
        str_scene = "exit_2";
    }
    self scene::play(#"hash_4380575dd04b7eeb", str_scene, self);
    self clientfield::set("" + #"hash_7171d4768b724a65", 0);
    self ghost();
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0x86f84d1a, Offset: 0x2130
// Size: 0x988
function function_ef40fc60() {
    var_cc4ef50c = struct::get_array("bny_spn_loc_regular");
    var_6efc5897 = struct::get_array("bny_spn_loc_mimic");
    var_14043e22 = struct::get_array("bny_spn_loc_raz");
    var_8aa89b6d = struct::get_array("bny_spn_loc_steiner");
    var_abe26193 = struct::get_array("bny_spn_loc_tormentor");
    n_players = zm_utility::get_number_of_valid_players();
    switch (n_players) {
    case 1:
    default:
        n_zombie_count = 30;
        var_262fa864 = 3;
        var_61453888 = 1;
        var_31fe02a0 = 1;
        var_178d3856 = 1;
        var_81c652e4 = 0;
        var_65aa30c0 = 0.5;
        break;
    case 2:
        n_zombie_count = 30;
        var_262fa864 = 4;
        var_61453888 = 2;
        var_31fe02a0 = 2;
        var_178d3856 = 1;
        var_81c652e4 = 1;
        var_65aa30c0 = 0.75;
        break;
    case 3:
        n_zombie_count = 30;
        var_262fa864 = 5;
        var_61453888 = 3;
        var_31fe02a0 = 3;
        var_178d3856 = 4;
        var_81c652e4 = 1;
        var_65aa30c0 = 1;
        break;
    case 4:
        n_zombie_count = 30;
        var_262fa864 = 6;
        var_61453888 = 4;
        var_31fe02a0 = 4;
        var_178d3856 = 4;
        var_81c652e4 = 1;
        var_65aa30c0 = 1;
        break;
    }
    music::setmusicstate("bunny_wave_1");
    level thread function_b6e1020(var_cc4ef50c, n_zombie_count, ["spawner_bo5_zombie_zm_platinum", "spawner_bo5_zombie_zm_platinum_female"]);
    function_bbc799ae("dance");
    wait(15.9);
    level notify(#"hash_5c03540b79cae9cf");
    level thread function_b6e1020(var_14043e22, var_61453888, #"hash_4f87aa2a203d37d0", 3);
    level thread function_b6e1020(var_cc4ef50c, int(n_zombie_count * var_65aa30c0), ["spawner_bo5_zombie_zm_platinum", "spawner_bo5_zombie_zm_platinum_female"], 3, 0, #"hash_55bea83d2a2aeacd", 1);
    function_bbc799ae("attack");
    level util::delay_notify(35, #"hash_55bea83d2a2aeacd");
    wait(40);
    level notify(#"hash_7a134b0bf63aef2e");
    music::setmusicstate("bunny_wave_2");
    level thread function_b6e1020(var_cc4ef50c, n_zombie_count, ["spawner_bo5_zombie_zm_platinum", "spawner_bo5_zombie_zm_platinum_female"], 0.2);
    function_bbc799ae("dance");
    wait(16);
    level notify(#"hash_5c03540b79cae9cf");
    level thread function_b6e1020(var_abe26193, var_262fa864, #"hash_51edd7595ecda822", 5);
    level thread function_b6e1020(var_6efc5897, var_31fe02a0, #"spawner_bo5_mimic", 3);
    level thread function_b6e1020(var_cc4ef50c, int(n_zombie_count * var_65aa30c0), ["spawner_bo5_zombie_zm_platinum", "spawner_bo5_zombie_zm_platinum_female"], 3, 0, #"hash_783bf496a0ca4bae", 1);
    function_bbc799ae("attack");
    level util::delay_notify(35, #"hash_783bf496a0ca4bae");
    wait(40);
    level notify(#"hash_4380f9020039678d");
    music::setmusicstate("bunny_wave_3");
    level thread function_b6e1020(var_cc4ef50c, n_zombie_count, ["spawner_bo5_zombie_zm_platinum", "spawner_bo5_zombie_zm_platinum_female"], 0.2);
    function_bbc799ae("dance");
    wait(16);
    level notify(#"hash_5c03540b79cae9cf");
    level notify(#"hash_7f556459f0655689");
    level thread function_b6e1020(var_abe26193, var_262fa864, #"hash_51edd7595ecda822", 5);
    level thread function_b6e1020(var_8aa89b6d, var_81c652e4, #"spawner_zm_steiner", 3);
    level thread function_b6e1020(var_cc4ef50c, var_178d3856, #"spawner_bo5_soa", 2);
    level thread function_b6e1020(var_cc4ef50c, int(n_zombie_count * var_65aa30c0), ["spawner_bo5_zombie_zm_platinum", "spawner_bo5_zombie_zm_platinum_female"], 3, 0, #"hash_7bbb97a6df558f88", 1);
    level thread function_38c50cf3();
    level thread function_704910e8(var_81c652e4);
    function_bbc799ae("attack");
    level flag::wait_till_all_timeout(64, [#"hash_3239b4eb1e8b1e3b", #"hash_6273dc2c0d03eec6"]);
    level notify(#"hash_7bbb97a6df558f88");
    if (level flag::get_all([#"hash_3239b4eb1e8b1e3b", #"hash_6273dc2c0d03eec6"])) {
        level zm_utility::function_9ad5aeb1(1, 1, 0, 0);
        music::setmusicstate("bunny_outro");
        function_bbc799ae("dance");
        zm_powerups::specific_powerup_drop("full_ammo", (2365, 10272, -986), undefined, undefined, undefined, 0);
        wait(10);
        function_bbc799ae("prize");
        return 1;
    }
    var_89c89228 = struct::get("bny_club_dj_loc");
    playsoundatposition(#"hash_6f7017b0648740c3", var_89c89228.origin);
    music::setmusicstate("bunny_outro_fail");
    level notify(#"hash_6ba7212a7d50425c");
    wait(3);
    function_bbc799ae("dance");
    return 0;
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0x900a703e, Offset: 0x2ac0
// Size: 0xc0
function function_38c50cf3() {
    level endon(#"hash_3239b4eb1e8b1e3b", #"hash_6ba7212a7d50425c");
    while (true) {
        a_enemies = array::filter(getaiarray("bq_ai", "targetname"), 0, &function_1043505b);
        if (a_enemies.size === 0) {
            level flag::set(#"hash_3239b4eb1e8b1e3b");
        }
        util::wait_network_frame();
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0x821457eb, Offset: 0x2b88
// Size: 0x2e
function function_1043505b(ai) {
    if (is_true(ai.aat_turned)) {
        return false;
    }
    return true;
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0x40e3bad3, Offset: 0x2bc0
// Size: 0xc0
function function_704910e8(var_81c652e4) {
    level endon(#"hash_6273dc2c0d03eec6", #"hash_6ba7212a7d50425c");
    if (var_81c652e4 < 1) {
        level flag::set(#"hash_6273dc2c0d03eec6");
        return;
    }
    n_kill_count = 0;
    while (true) {
        level waittill(#"hash_7e3660d8d125a63a");
        n_kill_count++;
        if (n_kill_count == var_81c652e4) {
            level flag::set(#"hash_6273dc2c0d03eec6");
        }
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 7, eflags: 0x2 linked
// Checksum 0x6fc7f5ee, Offset: 0x2c88
// Size: 0x3cc
function function_b6e1020(a_loc, n_spawn, var_84296e0, var_5c263237, var_67b2128e = 1, str_endon, var_4e08b638) {
    if (isdefined(str_endon)) {
        level endon(str_endon);
    }
    if (!isarray(var_84296e0)) {
        if (!isdefined(var_84296e0)) {
            var_84296e0 = [];
        } else if (!isarray(var_84296e0)) {
            var_84296e0 = array(var_84296e0);
        }
    }
    if (!isdefined(var_5c263237)) {
        for (i = 0; i < n_spawn; i++) {
            if (a_loc.size == 0) {
                return;
            }
            while (getfreeactorcount() < 1) {
                waitframe(1);
            }
            e_loc = array::random(a_loc);
            arrayremovevalue(a_loc, e_loc);
            str_type = array::random(var_84296e0);
            ai = spawnactor(str_type, e_loc.origin, e_loc.angles);
            if (isdefined(ai)) {
                ai thread function_43ea27c1(var_4e08b638);
                if (is_true(var_67b2128e) && isinarray(["spawner_bo5_zombie_zm_platinum", "spawner_bo5_zombie_zm_platinum_female"], str_type)) {
                    ai thread function_e6020995();
                }
            }
        }
        return;
    }
    for (i = 0; i < n_spawn; i++) {
        if (a_loc.size == 0) {
            /#
                iprintlnbold("<unknown string>");
            #/
            return;
        }
        wait(var_5c263237);
        while (getfreeactorcount() < 1) {
            waitframe(1);
        }
        e_loc = array::random(a_loc);
        arrayremovevalue(a_loc, e_loc);
        str_type = array::random(var_84296e0);
        ai = spawnactor(str_type, e_loc.origin, e_loc.angles);
        if (isdefined(ai)) {
            ai thread function_43ea27c1(var_4e08b638);
            if (is_true(var_67b2128e) && isinarray(["spawner_bo5_zombie_zm_platinum", "spawner_bo5_zombie_zm_platinum_female"], str_type)) {
                ai thread function_e6020995();
            }
            if (str_type !== #"spawner_bo5_soa") {
                ai clientfield::increment("" + #"hash_54e2a4e02a26cc62", 1);
            }
        }
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0xaee14aa3, Offset: 0x3060
// Size: 0x1dc
function function_43ea27c1(var_4e08b638) {
    self endon(#"death");
    if (!is_true(var_4e08b638) && isdefined(self.aitype) && isinarray(["spawner_bo5_zombie_zm_platinum", "spawner_bo5_zombie_zm_platinum_female"], self.aitype)) {
        self clientfield::set("" + #"hash_3e4641a9ea00d061", 1);
    }
    self.maxhealth = self zm_ai_utility::function_b5fe98(level.round_number);
    self.health = self.maxhealth;
    if (!is_true(var_4e08b638)) {
        self.targetname = "bq_ai";
    }
    self zm_score::function_acaab828();
    self.b_ignore_cleanup = 1;
    self.ignore_enemy_count = 1;
    self.no_powerups = 1;
    self pathmode("dont move");
    self.completed_emerging_into_playable_area = 1;
    self.zombie_think_done = 1;
    if (isdefined(self)) {
        if (self.archetype === #"tormentor") {
            self.zombie_move_speed = "super_sprint";
        } else {
            self.zombie_move_speed = "run";
        }
        self pathmode("move allowed");
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0xb5e83d40, Offset: 0x3248
// Size: 0x55c
function function_e6020995() {
    self endon(#"death");
    self val::set(#"hash_53de14c58f4c6053", "ignoreme", 1);
    self val::set(#"hash_53de14c58f4c6053", "takedamage", 0);
    self.var_e8920729 = 1;
    n_index = randomint(17);
    if (isalive(self)) {
        switch (n_index) {
        case 0:
            self thread animation::play(#"hash_561a21e28579ab65");
            break;
        case 1:
            self thread animation::play(#"hash_561a1ee28579a64c");
            break;
        case 2:
            self thread animation::play(#"hash_561a1fe28579a7ff");
            break;
        case 3:
            self thread animation::play(#"hash_561a1ce28579a2e6");
            break;
        case 4:
            self thread animation::play(#"hash_561a1de28579a499");
            break;
        case 5:
            self thread animation::play(#"hash_561a1be28579a133");
            break;
        case 6:
            self thread animation::play(#"hash_561a28e28579b74a");
            break;
        case 7:
            self thread animation::play(#"hash_561a29e28579b8fd");
            break;
        case 8:
            self thread animation::play(#"hash_561da6e2857cc33b");
            break;
        case 9:
            self thread animation::play(#"hash_561da5e2857cc188");
            break;
        case 10:
            self thread animation::play(#"hash_561da8e2857cc6a1");
            break;
        case 11:
            self thread animation::play(#"hash_561da7e2857cc4ee");
            break;
        case 12:
            self thread animation::play(#"hash_561daae2857cca07");
            break;
        case 13:
            self thread animation::play(#"hash_561da9e2857cc854");
            break;
        case 14:
            self thread animation::play(#"hash_561dace2857ccd6d");
            break;
        case 15:
            self thread animation::play(#"hash_561dabe2857ccbba");
            break;
        case 16:
            self thread animation::play(#"hash_561d9ee2857cb5a3");
            break;
        }
    }
    level waittill(#"hash_5c03540b79cae9cf");
    self animation::stop();
    if (isdefined(self)) {
        self clientfield::set("" + #"hash_3e4641a9ea00d061", 0);
        self val::reset(#"hash_53de14c58f4c6053", "ignoreme");
        self val::reset(#"hash_53de14c58f4c6053", "takedamage");
        self.var_e8920729 = 0;
        bhtnactionstartevent(self, "sprint");
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0x1fe52fd9, Offset: 0x37b0
// Size: 0x24
function function_5897cf56(*var_a276c861) {
    level function_17a56fb7(0);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0xecd6f77f, Offset: 0x37e0
// Size: 0x24
function function_a04ddc18(*var_a276c861) {
    level function_17a56fb7(1);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0x6c955866, Offset: 0x3810
// Size: 0x144
function function_17a56fb7(b_return) {
    var_3a49bb20 = struct::get("bny_club_dj_loc");
    level flag::set(#"hash_51047505aeee86ad");
    if (isdefined(var_3a49bb20.var_6cd28a87)) {
        var_3a49bb20.var_6cd28a87 function_190fd035(var_3a49bb20);
    }
    if (is_true(var_3a49bb20.b_reward)) {
        util::setclientsysstate("platMusUnlock", "unlockSqueak");
        array::thread_all(function_a1ef346b(), &zm_equipment::show_hint_text, #"hash_548ca4bd420c313b");
        /#
            iprintlnbold("<unknown string>");
        #/
        function_b04a544a(0);
        function_f93fd05a(b_return);
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0x3a3cfc28, Offset: 0x3960
// Size: 0x33c
function function_f93fd05a(b_return) {
    var_f07d7204 = ["gold", "large", "medium"];
    var_854257c7 = getentarray("pl_by_dr", "targetname");
    level clientfield::set("" + #"hash_866e71344110f38", 2);
    foreach (door in var_854257c7) {
        switch (door.script_int) {
        case 1:
            door setmodel(#"hash_7397833b8712c7ca");
            break;
        case 2:
            door setmodel(#"hash_1cffa5303cbeb301");
            break;
        case 3:
            door setmodel(#"hash_465c4328a120422c");
            break;
        }
        door clientfield::set("" + #"hash_e4552abd8fb5506", 1);
        door.var_9171844e = array::random(var_f07d7204);
        arrayremovevalue(var_f07d7204, door.var_9171844e, 0);
        door thread function_3d06cff4();
    }
    level thread function_ae615a59(15);
    waitresult = level waittilltimeout(15, #"hash_6b43aad842b32a54");
    level notify(#"hash_129e2d746ff4a406");
    if (isdefined(waitresult.var_2cdf7adf)) {
        level thread function_5ed2e797(var_854257c7, waitresult.var_2cdf7adf, waitresult.var_9171844e, b_return);
        level thread function_ae615a59(20);
        wait(20);
        return;
    }
    level thread function_ac1676db(var_854257c7, b_return);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 2, eflags: 0x2 linked
// Checksum 0x3f9e3db9, Offset: 0x3ca8
// Size: 0x7c
function function_ac1676db(var_854257c7, b_return) {
    waitresult = level waittilltimeout(7, #"hash_6b43aad842b32a54");
    if (isdefined(waitresult.var_2cdf7adf)) {
        level thread function_5ed2e797(var_854257c7, waitresult.var_2cdf7adf, waitresult.var_9171844e, b_return);
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0xefb4bf70, Offset: 0x3d30
// Size: 0x6c
function function_ae615a59(n_time) {
    level endon(#"hash_129e2d746ff4a406");
    var_a35366e7 = max(n_time - 10, 0);
    wait(var_a35366e7);
    level function_ea45ba4c();
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x6 linked
// Checksum 0x6944b4b5, Offset: 0x3da8
// Size: 0x158
function private function_3d06cff4() {
    self endon(#"hash_4d2eb428daff2ffc");
    self.s_door = struct::get(self.target);
    self.s_door zm_unitrigger::function_fac87205(#"hash_1cc0ecca8014ce5", 96);
    level notify(#"hash_6b43aad842b32a54", {#var_2cdf7adf:self.script_int, #var_9171844e:self.var_9171844e});
    self moveto(self.origin + (0, 0, 400), 6);
    self playsound(#"hash_15edf5c3ecb9eada");
    wait(1);
    var_cf64509e = getent(self.target, "targetname");
    if (isdefined(var_cf64509e)) {
        var_cf64509e notsolid();
    }
    level.var_31938aae = self;
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 4, eflags: 0x2 linked
// Checksum 0xa51090c6, Offset: 0x3f08
// Size: 0x37c
function function_5ed2e797(var_854257c7, var_2cdf7adf, var_9171844e, b_return) {
    foreach (door in var_854257c7) {
        zm_unitrigger::unregister_unitrigger(door.s_door.s_unitrigger);
        door.s_door.s_unitrigger = undefined;
    }
    var_53313495 = struct::get("club_reward_door_" + var_2cdf7adf);
    var_5e809a1a = function_84571027();
    var_6f7eb70f = hash(var_9171844e + "_chest_level_" + var_5e809a1a);
    if (var_9171844e == "medium") {
        var_3a053962 = #"p9_fxanim_zm_gp_chest_01_med_low_xmodel";
        var_5b69f831 = #"p9_fxanim_zm_gp_chest_01_med_bundle";
        var_dae71351 = 2;
    } else {
        if (var_9171844e == "gold") {
            var_3a053962 = #"hash_401a47741ffd646f";
        } else {
            var_3a053962 = #"p9_fxanim_zm_gp_chest_01_lrg_low_xmodel";
        }
        var_5b69f831 = #"p9_fxanim_zm_gp_chest_01_lrg_bundle";
        var_dae71351 = 3;
    }
    wait(0.5);
    namespace_58949729::function_4ec9fc99(var_53313495, var_6f7eb70f, var_3a053962, var_5b69f831, var_dae71351);
    if (var_9171844e == "gold") {
        if (is_true(b_return)) {
            n_chance = 40;
        } else {
            n_chance = 10;
        }
        if (math::cointoss(n_chance)) {
            level thread function_e0b9a88e(var_2cdf7adf);
            foreach (player in getplayers()) {
                player zm_stats::increment_challenge_stat(#"hash_5699cbd949051396");
            }
        }
    }
    var_53313495.var_f3a3c164 = 1;
    var_53313495.scriptmodel solid();
    var_53313495 thread function_d81ba0fe();
    var_53313495 util::delay(50, undefined, &function_3076a002);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0xc087dfeb, Offset: 0x4290
// Size: 0x114
function function_e0b9a88e(var_2cdf7adf) {
    var_222825ae = struct::get("club_reward_ww_" + var_2cdf7adf);
    point = function_4ba8fde(#"ww_mega_barrel_fullauto_copycat_t9_item_sr");
    item_ww = item_drop::drop_item(0, getweapon(#"ww_mega_barrel_fullauto_copycat_t9"), 1, 0, point.id, var_222825ae.origin, var_222825ae.angles, 0);
    item_ww.var_dd21aec2 = 1 | 16;
    item_ww moveto(var_222825ae.origin - (0, 0, 62), 10, 0.05, 0.05);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0x265e760b, Offset: 0x43b0
// Size: 0x82
function function_84571027() {
    if (level.round_number <= 5) {
        return 1;
    }
    if (level.round_number <= 10) {
        return 2;
    }
    if (level.round_number <= 15) {
        return 3;
    }
    if (level.round_number <= 20) {
        return 4;
    }
    if (level.round_number <= 25) {
        return 5;
    }
    return 6;
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0x36c2fd76, Offset: 0x4440
// Size: 0x134
function function_d81ba0fe() {
    level endon(#"hash_40f6eac419f5f36a");
    self endon(#"death");
    self.trigger endon(#"death");
    playsoundatposition(#"hash_78ab7aaf4da20422", self.origin);
    self.var_e886e882 = util::spawn_model("tag_origin", self.origin);
    self.var_e886e882 playloopsound(#"hash_5376822de0ce03cd");
    self.trigger waittill(#"chest_opened");
    self notify(#"chest_opened");
    self.var_e886e882 stoploopsound(1);
    if (isdefined(self.var_e886e882)) {
        self.var_e886e882 delete();
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0xd3e618b1, Offset: 0x4580
// Size: 0x1c4
function function_3076a002() {
    self endon(#"death");
    chest = self.scriptmodel;
    trigger = self.trigger;
    if (isdefined(chest)) {
        chest thread item_world::loop_sound("wpn_semtex_alert", 0.84);
        chest clientfield::set("supply_drop_fx", 0);
        util::wait_network_frame(1);
    }
    wait(5);
    if (isdefined(chest)) {
        chest scene::stop();
        playfx(#"hash_131031222bb89ea", chest.origin);
        playsoundatposition(#"wpn_grenade_explode", chest.origin);
        chest radiusdamage(chest.origin, 128, 50, 10, undefined, "MOD_EXPLOSIVE", getweapon(#"supplydrop"));
        chest delete();
    }
    if (isdefined(self.var_e886e882)) {
        self.var_e886e882 delete();
    }
    if (isdefined(trigger)) {
        trigger delete();
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 2, eflags: 0x2 linked
// Checksum 0x377d609d, Offset: 0x4750
// Size: 0x34
function function_b23edced(var_a276c861, var_19e802fa) {
    level function_a9a742f6(var_a276c861, var_19e802fa);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 2, eflags: 0x2 linked
// Checksum 0x2efadcbe, Offset: 0x4790
// Size: 0x34
function function_b0e382eb(var_a276c861, var_19e802fa) {
    level function_a9a742f6(var_a276c861, var_19e802fa);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 2, eflags: 0x2 linked
// Checksum 0xa4ba11a2, Offset: 0x47d0
// Size: 0x74
function function_a9a742f6(var_a276c861, var_19e802fa) {
    if (var_a276c861 || var_19e802fa) {
        level notify(#"hash_399c68f64eb1b589");
        struct::get("bny_club_dj_loc").b_reward = 1;
        function_bbc799ae("prize");
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 2, eflags: 0x2 linked
// Checksum 0x93f31a, Offset: 0x4850
// Size: 0x9c
function function_c50aa817(var_a276c861, var_19e802fa) {
    if (var_a276c861 || var_19e802fa) {
        struct::get("bny_club_dj_loc").b_reward = 0;
    }
    level function_280f5788();
    level function_795e0560();
    level flag::set(#"hash_7cc4347161a79b86");
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 2, eflags: 0x2 linked
// Checksum 0x4c468488, Offset: 0x48f8
// Size: 0x94
function function_87440364(var_a276c861, var_19e802fa) {
    if (var_a276c861 || var_19e802fa) {
        struct::get("bny_club_dj_loc").b_reward = 0;
    }
    level function_280f5788();
    level function_795e0560();
    level thread function_f1e68db9();
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0xff81f18c, Offset: 0x4998
// Size: 0x264
function function_795e0560() {
    level thread function_b04a544a(0);
    if (isdefined(struct::get("bny_club_dj_loc").var_6cd28a87)) {
        struct::get("bny_club_dj_loc").var_6cd28a87 delete();
    }
    if (isdefined(level.var_31938aae)) {
        mdl_door = level.var_31938aae;
        mdl_door moveto(mdl_door.origin - (0, 0, 400), 0.5);
        e_clip = getent(mdl_door.target, "targetname");
        if (isdefined(e_clip)) {
            e_clip solid();
        }
        level.var_31938aae = undefined;
    }
    foreach (mdl_door in getentarray("pl_by_dr", "targetname")) {
        mdl_door notify(#"hash_4d2eb428daff2ffc");
        mdl_door thread function_554f4e20();
        if (isdefined(mdl_door.s_door)) {
            zm_unitrigger::unregister_unitrigger(mdl_door.s_door.s_unitrigger);
            mdl_door.s_door.s_unitrigger = undefined;
        }
    }
    level flag::clear(#"hash_3239b4eb1e8b1e3b");
    level flag::clear(#"hash_6273dc2c0d03eec6");
    level flag::clear(#"hash_7b5643f5ecc16c8f");
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0xb0f0f607, Offset: 0x4c08
// Size: 0xf4
function function_554f4e20() {
    if (isdefined(self.script_int)) {
        switch (self.script_int) {
        case 1:
            self setmodel(#"hash_77662e1e464eaaa");
            break;
        case 2:
            self setmodel(#"hash_77661e1e464e8f7");
            break;
        case 3:
            self setmodel(#"hash_77660e1e464e744");
            break;
        }
    }
    self clientfield::set("" + #"hash_e4552abd8fb5506", 0);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0x508cc5e7, Offset: 0x4d08
// Size: 0x4ac
function function_280f5788() {
    level thread zm_platinum::function_4cc5fca6();
    level clientfield::increment("" + #"hash_56c7e620d1de163a");
    wait(7);
    var_fe91f83b = struct::get_array("pl_by_ot_spn");
    var_9ab9f5a5 = [(-203, 10502, 40), (-207, 10295, 40), (10, 10488, 40), (-11, 10276, 40)];
    for (i = 0; i < var_fe91f83b.size; i++) {
        var_fe91f83b[i].origin = var_9ab9f5a5[i];
        var_fe91f83b[i].angles = (0, 180, 0);
    }
    foreach (player in function_a1ef346b()) {
        player clientfield::set_to_player("" + #"hash_721d42a28d7461ea", 0);
        n_index = zm_fasttravel::get_player_index(player);
        var_bb57932b = var_fe91f83b[n_index];
        player thread function_59ebeee9(var_bb57932b);
    }
    level zm_utility::function_9ad5aeb1(1, 1, 1, 0);
    wait(3);
    level flag::clear(#"in_dark_side");
    level flag::clear(#"hash_43c360bf8cccea00");
    level thread namespace_99d0d95e::function_8f85d169(0);
    level clientfield::set("" + #"hash_866e71344110f38", 0);
    level notify(#"hash_30ec56bfd9c6963c");
    function_bbc799ae("off");
    function_51a95461(0);
    zm_zonemgr::function_d68ef0f9("zone_bunny_club");
    level flag::set("spawn_zombies");
    level flag::clear(#"hash_13cd183e1c6cadd2");
    var_3a49bb20 = struct::get("bny_club_dj_loc");
    if (!is_true(var_3a49bb20.b_reward)) {
        var_120fe9cc = array::randomize([(-453.77, 10437, 13), (-390.77, 10331, 13), (-430, 10560, 13)]);
        zm_powerups::specific_powerup_drop("full_ammo", var_120fe9cc[0], undefined, undefined, undefined, 0);
        zm_powerups::specific_powerup_drop("carpenter", var_120fe9cc[1], undefined, undefined, undefined, 0);
        zm_powerups::specific_powerup_drop("bonus_points_team", var_120fe9cc[2], undefined, undefined, undefined, 0);
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0x67707cee, Offset: 0x51c0
// Size: 0xe2
function function_ea45ba4c(n_time_remaining = 10) {
    level endon(#"hash_129e2d746ff4a406");
    while (n_time_remaining > 0) {
        if (n_time_remaining == 1) {
            array::run_all(getplayers(), &playlocalsound, #"hash_5952b2eecab41e38");
        } else {
            array::run_all(getplayers(), &playlocalsound, #"hash_4474c2da74d7cdb9");
        }
        n_time_remaining--;
        wait(1);
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0xab78b4e9, Offset: 0x52b0
// Size: 0x114
function function_bbc799ae(str_state) {
    switch (str_state) {
    case #"off":
    default:
        var_6a25fa7 = 0;
        var_d0b16504 = 0;
        break;
    case #"dance":
        var_6a25fa7 = 1;
        var_d0b16504 = 0;
        break;
    case #"attack":
        var_6a25fa7 = 2;
        var_d0b16504 = 1;
        break;
    case #"prize":
        var_6a25fa7 = 3;
        var_d0b16504 = 0;
        break;
    }
    level clientfield::set("" + #"hash_27f831b48c21166f", var_d0b16504);
    namespace_b574e135::function_471f4c0f(var_6a25fa7);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0x9f9090d3, Offset: 0x53d0
// Size: 0xac
function function_59ebeee9(var_10fb1677) {
    level endon(#"end_game");
    if (!isalive(self)) {
        return;
    }
    self endon(#"death");
    while (self isziplining() || self function_b4813488()) {
        waitframe(1);
    }
    self thread zm_fasttravel::function_66d020b0(undefined, undefined, undefined, undefined, var_10fb1677, undefined, "bunny_club_teleport", 1);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0xda171e25, Offset: 0x5488
// Size: 0x94
function function_51a95461(b_rotate) {
    var_46405031 = getent("bc_disco_ball", "targetname");
    if (is_true(b_rotate)) {
        var_46405031 rotate((0, 15, 0));
        return;
    }
    var_46405031 rotate((0, 0, 0));
}

/#

    // Namespace namespace_958b287a/namespace_958b287a
    // Params 0, eflags: 0x0
    // Checksum 0x5aabb9af, Offset: 0x5528
    // Size: 0x74
    function function_eea3cf4a() {
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        zm_devgui::add_custom_devgui_callback(&cmd);
    }

    // Namespace namespace_958b287a/namespace_958b287a
    // Params 1, eflags: 0x0
    // Checksum 0x38f59a38, Offset: 0x55a8
    // Size: 0x1b2
    function cmd(cmd) {
        var_22e48c9c = getentarray("<unknown string>", "<unknown string>");
        switch (cmd) {
        case #"hash_2555bbb92d1fe771":
            foreach (e_part in var_22e48c9c) {
                e_part thread function_35393ef2(1);
            }
            break;
        case #"hash_27e8451459a42bde":
            foreach (e_part in var_22e48c9c) {
                e_part thread function_35393ef2(0);
            }
            break;
        case #"hash_ee6d09286bb442d":
            level flag::set(#"hash_7cc4347161a79b86");
            break;
        }
    }

    // Namespace namespace_958b287a/namespace_958b287a
    // Params 1, eflags: 0x0
    // Checksum 0x6d250189, Offset: 0x5768
    // Size: 0x7e
    function function_35393ef2(state) {
        self notify("<unknown string>");
        self endon("<unknown string>");
        self endon(#"death");
        if (state) {
            while (true) {
                circle(self.origin, 10, (0, 0, 1));
                waitframe(1);
            }
        }
    }

#/

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0x82e5741d, Offset: 0x57f0
// Size: 0x294
function function_e80810b4() {
    flag::wait_till("power_on");
    flag::init("shoot_target_timeout");
    var_bc3709b9 = struct::get("s_shoot_start", "targetname");
    var_d1792325 = util::spawn_model("p9_sr_manilla_folder_01", var_bc3709b9.origin, var_bc3709b9.angles);
    var_d1792325 zm_unitrigger::function_fac87205(&function_aacafb6e);
    playsoundatposition(#"hash_38b49dbc108cca56", var_d1792325.origin);
    if (isdefined(var_d1792325)) {
        var_d1792325 delete();
    }
    wait(randomfloatrange(2, 3));
    var_d8f1c196 = struct::get("shoot_target", "targetname");
    mdl_target = util::spawn_model("P9_usa_kgb_target_dummy_02", (0, 0, 0));
    while (isdefined(var_d8f1c196)) {
        var_411cc8d4 = struct::get(var_d8f1c196.target, "targetname");
        mdl_target thread function_efcfff5b();
        level function_db3d8ac(mdl_target, var_d8f1c196, var_411cc8d4);
        mdl_target rotateroll(90, 0.5);
        wait(0.5);
        if (flag::get("shoot_target_timeout")) {
            break;
        }
        if (isdefined(var_411cc8d4.target)) {
            wait(randomfloatrange(1, 2));
            var_d8f1c196 = struct::get(var_411cc8d4.target, "targetname");
            continue;
        }
        break;
    }
    if (isdefined(mdl_target)) {
        mdl_target delete();
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0x2093f857, Offset: 0x5a90
// Size: 0x7a
function function_aacafb6e(e_player) {
    s_parent = self.stub.related_parent;
    if (!isdefined(s_parent)) {
        return 0;
    }
    var_5168e40f = e_player zm_utility::is_player_looking_at(s_parent.origin, 0.9, 0);
    return is_true(var_5168e40f);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 3, eflags: 0x2 linked
// Checksum 0xa102f49, Offset: 0x5b18
// Size: 0x1c8
function function_db3d8ac(mdl_target, var_d8f1c196, var_411cc8d4) {
    level endon(#"hash_7c8a1026b606ae9c");
    mdl_target ghost();
    util::wait_network_frame();
    mdl_target.origin = var_d8f1c196.origin;
    mdl_target.angles = var_d8f1c196.angles + (0, 0, 90);
    util::wait_network_frame();
    mdl_target show();
    mdl_target rotateroll(-90, 0.5);
    mdl_target playsound(#"hash_2ba42e10437f5fe9");
    wait(0.5);
    mdl_target setcandamage(1);
    n_move_time = randomfloatrange(3, 5);
    mdl_target moveto(var_411cc8d4.origin, n_move_time);
    wait(n_move_time);
    mdl_target playsound(#"hash_573eeda95b9d883a");
    mdl_target setcandamage(0);
    flag::set("shoot_target_timeout");
    level notify(#"hash_7c8a1026b606ae9c");
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0x7693873, Offset: 0x5ce8
// Size: 0xcc
function function_efcfff5b() {
    level endon(#"hash_7c8a1026b606ae9c");
    while (true) {
        waitresult = self waittill(#"damage");
        w_weapon = waitresult.weapon;
        if (isdefined(w_weapon) && (w_weapon.firetype == "Single Shot" || w_weapon.firetype == "Burst")) {
            self playsound(#"hash_3274951195522bc0");
            level notify(#"hash_7c8a1026b606ae9c");
        }
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 2, eflags: 0x2 linked
// Checksum 0x7020aa7b, Offset: 0x5dc0
// Size: 0x14
function function_ba11058a(*var_a276c861, *var_19e802fa) {
    
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0x457f65db, Offset: 0x5de0
// Size: 0xfc
function function_9a22f9c2() {
    var_d8f1c196 = struct::get("shoot_target", "targetname");
    if (flag::get("shoot_target_timeout")) {
        playsoundatposition(#"hash_41f370ee19a5ddc1", var_d8f1c196.origin);
        return;
    }
    playsoundatposition(#"hash_6742a6bf8c87fa0c", var_d8f1c196.origin);
    var_bc3709b9 = struct::get("s_shoot_start", "targetname");
    level thread namespace_58949729::function_f82f361c(var_bc3709b9, #"survival_aether_tool_item_list", 2, 1);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 2, eflags: 0x2 linked
// Checksum 0x7ac942c7, Offset: 0x5ee8
// Size: 0x14
function function_1c35e44a(*var_a276c861, *var_19e802fa) {
    
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0xe3cc2dd3, Offset: 0x5f08
// Size: 0x4c
function function_d745ca5e(var_a276c861) {
    if (var_a276c861) {
        return;
    }
    level thread function_f602a366();
    level flag::wait_till(level.var_fd9dec51);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0x2062c8a6, Offset: 0x5f60
// Size: 0x188
function function_f602a366() {
    level endon(#"game_ended", level.var_fd9dec51);
    var_6de806b5 = getent("t_sq_ms", "targetname");
    var_f73afc46 = 0;
    s_struct = struct::get("s_sq_ms");
    while (true) {
        waitresult = var_6de806b5 waittill(#"damage");
        if (isplayer(waitresult.attacker) && waitresult.mod === "MOD_GRENADE_SPLASH" && !is_true(function_7fb7c83c(waitresult.weapon.name))) {
            var_f73afc46++;
            if (var_f73afc46 == 13) {
                level flag::set(level.var_fd9dec51);
                continue;
            }
            playsoundatposition(#"hash_5c495fd106561715", s_struct.origin);
        }
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0x9cb6fef9, Offset: 0x60f0
// Size: 0x82
function function_7fb7c83c(weaponname) {
    if (!isdefined(weaponname)) {
        return 0;
    }
    if (isweapon(weaponname)) {
        weaponname = weaponname.name;
    }
    if (weaponname === #"hash_7e4053e6965bafa7") {
        return 1;
    }
    inarray = isinarray(level.var_1b527536, weaponname);
    return inarray;
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 2, eflags: 0x2 linked
// Checksum 0x5893f43c, Offset: 0x6180
// Size: 0x1bc
function function_23cef26a(var_a276c861, var_19e802fa) {
    if (var_a276c861 || var_19e802fa) {
        level flag::set(level.var_fd9dec51);
    }
    s_struct = struct::get("s_sq_ms");
    playsoundatposition(#"hash_3daf67f534357c93", s_struct.origin);
    n_count = 6;
    var_98d110e6 = 2;
    dropstruct = {#origin:s_struct.origin, #angles:s_struct.angles, #var_738dfc81:n_count};
    a_items = dropstruct namespace_65181344::function_fd87c780(#"hash_57d0cc12ced6ab79", n_count, var_98d110e6);
    if (level.var_d3450438 < 3) {
        level thread function_aa9d9702();
        return;
    }
    if (isdefined(getent("t_sq_ms", "targetname"))) {
        getent("t_sq_ms", "targetname") delete();
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0xd61a0e99, Offset: 0x6348
// Size: 0x16c
function function_af042db0(var_a276c861) {
    if (var_a276c861) {
        return;
    }
    var_69d81f37 = randomintrangeinclusive(17, 19);
    level waittill(#"start_of_round");
    while (level.round_number < var_69d81f37) {
        level waittill(#"end_of_round");
    }
    if (level.round_number == var_69d81f37 && !level flag::get("hvt_event_steiner_spawned")) {
        /#
            iprintlnbold("<unknown string>");
        #/
        level.var_15a5fa7f = #"hash_4a900af3fc47cdd5";
        level.var_3db96efc = struct::get_array("mimic_item_spawn_point");
        callback::on_ai_spawned(&function_c50aa4b2);
        level thread function_6b214340();
        level waittill(#"end_of_round", #"hvt_event_steiner_spawned");
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 2, eflags: 0x2 linked
// Checksum 0xdc5898bb, Offset: 0x64c0
// Size: 0xec
function function_6c660ed5(var_a276c861, var_19e802fa) {
    if (var_a276c861 || var_19e802fa) {
    }
    var_2a1f535d = mimic_prop_spawn::function_2e8c33f6();
    foreach (trap_prop in var_2a1f535d) {
        level thread mimic_prop_spawn::clean_up_prop(trap_prop);
    }
    callback::remove_callback(&function_c50aa4b2);
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 1, eflags: 0x2 linked
// Checksum 0x52b2b687, Offset: 0x65b8
// Size: 0x784
function function_6b214340(var_d3329483 = 1) {
    var_a2134c4e = [];
    foreach (zone_key in level.zone_keys) {
        if (!isdefined(var_a2134c4e)) {
            var_a2134c4e = [];
        } else if (!isarray(var_a2134c4e)) {
            var_a2134c4e = array(var_a2134c4e);
        }
        if (!isinarray(var_a2134c4e, zone_key)) {
            var_a2134c4e[var_a2134c4e.size] = zone_key;
        }
    }
    var_71fc1453 = [];
    var_6dcebc54 = function_7b8e26b3(level.var_3db96efc, 0, "inClaimedLocation");
    foreach (s_spawn_point in level.var_3db96efc) {
        var_1d4c3ee8 = hash(s_spawn_point.script_noteworthy);
        if (isinarray(var_a2134c4e, var_1d4c3ee8) && !is_true(s_spawn_point.claimed)) {
            var_bbde0cda = 0;
            a_players = getplayers();
            var_100cd7d = function_72d3bca6(a_players, s_spawn_point.origin, undefined, undefined, 750);
            if (var_100cd7d.size < 1) {
                var_95ca13d1 = function_72d3bca6(a_players, s_spawn_point.origin, undefined, 750, 10000);
                if (var_95ca13d1.size > 0) {
                    var_bbde0cda = 1;
                    if (var_6dcebc54.size > 0) {
                        var_1072e0bb = 0;
                        var_e240bc30 = [];
                        foreach (point in var_6dcebc54) {
                            if (!isdefined(var_e240bc30)) {
                                var_e240bc30 = [];
                            } else if (!isarray(var_e240bc30)) {
                                var_e240bc30 = array(var_e240bc30);
                            }
                            if (!isinarray(var_e240bc30, point.script_noteworthy)) {
                                var_e240bc30[var_e240bc30.size] = point.script_noteworthy;
                            }
                        }
                        if (!isinarray(var_e240bc30, s_spawn_point.script_noteworthy)) {
                            var_f5682dc1 = arraygetclosest(s_spawn_point.origin, var_6dcebc54, 1200);
                            if (isdefined(var_f5682dc1)) {
                                var_1072e0bb = 1;
                            }
                        }
                    } else {
                        var_1072e0bb = 1;
                    }
                    if (var_bbde0cda && var_1072e0bb) {
                        if (!isdefined(var_71fc1453)) {
                            var_71fc1453 = [];
                        } else if (!isarray(var_71fc1453)) {
                            var_71fc1453 = array(var_71fc1453);
                        }
                        if (!isinarray(var_71fc1453, s_spawn_point)) {
                            var_71fc1453[var_71fc1453.size] = s_spawn_point;
                        }
                    }
                }
            }
        }
    }
    for (i = 1; i <= var_d3329483; i++) {
        if (var_71fc1453.size > 0) {
            var_e933f1de = 0;
            if (var_71fc1453.size > 1) {
                var_e933f1de = randomint(var_71fc1453.size);
            }
            var_ed94ce04 = [];
            if (!isdefined(var_ed94ce04)) {
                var_ed94ce04 = [];
            } else if (!isarray(var_ed94ce04)) {
                var_ed94ce04 = array(var_ed94ce04);
            }
            if (!isinarray(var_ed94ce04, var_71fc1453[var_e933f1de])) {
                var_ed94ce04[var_ed94ce04.size] = var_71fc1453[var_e933f1de];
            }
            mdl_prop = mimic_prop_spawn::function_b309db61(var_ed94ce04, undefined, var_ed94ce04[0], #"hash_552fe46053ee49fa");
            /#
                if (isdefined(mdl_prop)) {
                    mdl_prop thread function_a1c5be67();
                }
            #/
            var_e969bf8e = array::get_all_closest(var_ed94ce04[0].origin, var_71fc1453, undefined, undefined, 1200);
            if (is_true(1)) {
                foreach (spawn_point in var_71fc1453) {
                    if (spawn_point.script_noteworthy === var_ed94ce04[0].script_noteworthy) {
                        arrayremovevalue(var_71fc1453, spawn_point);
                    }
                }
            }
            if (var_e969bf8e.size > 0) {
                foreach (loc in var_e969bf8e) {
                    arrayremovevalue(var_71fc1453, loc);
                }
            }
            wait(0.5);
            continue;
        }
        println("<unknown string>");
    }
}

// Namespace namespace_958b287a/namespace_958b287a
// Params 0, eflags: 0x2 linked
// Checksum 0x80082ae5, Offset: 0x6d48
// Size: 0x5a
function function_c50aa4b2() {
    self endon(#"death");
    if (self.archetype === #"mimic") {
        wait(0.5);
        if (self.targetname === "mq_hvt_mimic") {
            return;
        }
        self.ignore_enemy_count = 1;
    }
}

/#

    // Namespace namespace_958b287a/namespace_958b287a
    // Params 0, eflags: 0x0
    // Checksum 0xa74258ab, Offset: 0x6db0
    // Size: 0x66
    function function_a1c5be67() {
        self endon(#"death", #"hash_484127e0cbd8f8cb");
        while (true) {
            sphere(self.origin, 15, (1, 0, 0), 0.75);
            waitframe(1);
        }
    }

#/
