// Atian COD Tools GSC CW decompiler test
#using script_4a5e7e929ab4ac21;
#using script_31f2188ef4e5f1ef;
#using script_3711e526ec2a3863;
#using script_3de47beee8436774;
#using script_25b0725f0d26dbf5;
#using script_32399001bdb550da;
#using script_7d0013bbc05623b9;
#using script_4937c6974f43bb71;
#using script_1478fbd17fe393cf;
#using script_3dc93ca9902a9cda;
#using scripts\cp_common\snd.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\objectives.gsc;
#using scripts\cp_common\skipto.gsc;
#using scripts\cp_common\util.gsc;
#using scripts\cp_common\dialogue.gsc;
#using script_32ff16d71b77016b;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\vehicleriders_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_e871b49a;

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x2 linked
// Checksum 0xceda3a25, Offset: 0x1f78
// Size: 0x4fc
function function_71347d32(*var_d3440450, *var_50cc0d4f) {
    level thread util::screen_fade_out(0, "black", "armada_intro_black_screen");
    util::function_3e65fe0b(1);
    level function_55d23d1e();
    level clientfield::set("toggle_gameplay_character_visibility", 0);
    level util::delay(2, undefined, &function_3f7b5c03);
    level thread function_19aa0f5d();
    level flag::set("flag_vo_intro_start");
    level.player clientfield::set_to_player("" + #"force_stream_weapons", 1);
    level.player thread namespace_b7cfe907::function_6666cad6("flag_intro_adler_walk_talk_pos_1");
    level thread function_d7d6110f();
    level thread function_9180c609("intro_ambient_runners_loopers", "flag_intro_start_fake_runners");
    level thread function_e2df4629("intro_drone_spawner_group_1", "flag_intro_start_fake_runners", "intro_spawn_drone", 8);
    level thread namespace_72b0499b::function_816f9a23();
    level util::delay(0.75, undefined, &function_e04385cb, 0, "flag_intro_player_boarded_chopper");
    level thread function_3705ef2f("flag_intro_player_boarded_chopper");
    level thread function_3bfb9b07();
    level.player thread function_2549ca47();
    level.player thread function_4c403681();
    level thread namespace_9a981837::function_ba76755f();
    level thread function_edd0551c();
    snd::function_7db65a93(#"hash_394162110e28e4d1");
    level thread function_d697a743();
    level flag::wait_till("flag_intro_player_vm_done");
    level namespace_82bfe441::fade(0, "FadeSlow");
    if (getdvarint(#"hash_2bf6d0a7334fd086", 1) == 1) {
        level util::delay(0.5, undefined, &globallogic_ui::function_7bc0e4b9, 0);
    }
    level thread objectives::follow("armada_obj_intro_follow_vip", level.vip, #"hash_33eb8fa6e913e996");
    level clientfield::set("" + #"hash_7705eee7a483781a", 0);
    level savegame::checkpoint_save();
    level flag::wait_till("flag_intro_base_tent_leave");
    level flag::set("flag_intro_ambient_vehicles_start");
    level function_fba221f2();
    level thread function_f62c89bf(#"hash_7db21cc0d9eaa733", "run", "flag_intro_running_guys_go");
    level util::delay(1.5, undefined, &function_c9528d2b);
    level util::delay(3, undefined, &function_48b95055);
    level flag::wait_till("flag_intro_wave_take_off");
    savegame::function_379f84b3();
    skipto::function_4e3ab877("armada_intro");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xd4f0dbc7, Offset: 0x2480
// Size: 0x1fc
function function_fba221f2() {
    level namespace_b7cfe907::function_27e76b4c("heli_spawn_airbase", undefined, 0);
    level namespace_b7cfe907::function_14a42357(0, struct::get("spawn_vip_intro", "targetname"));
    level namespace_b7cfe907::function_e1635dfe(0, struct::get("spawn_vip_intro", "targetname"));
    level namespace_b7cfe907::function_ed68628c(0, struct::get("spawn_vip_intro", "targetname"));
    level flag::wait_till_all(["flag_armada_player_chopper_spawned", "flag_armada_buddy_spawned", "flag_armada_copilot_spawned", "flag_armada_pilot_spawned"]);
    level.var_7466d419 setrotorspeed(0.2);
    a_ents = [];
    a_ents[#"buddy"] = level.buddy;
    a_ents[#"pilot"] = level.pilot;
    a_ents[#"copilot"] = level.copilot;
    a_ents[#"hash_4972abe0166bbc73"] = level.var_7466d419;
    level thread scene::play(#"hash_69b8e06afe12b8f9", "idle", a_ents);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xb7214865, Offset: 0x2688
// Size: 0x124
function function_19aa0f5d() {
    var_8c871ee9 = getdvar(#"hash_7fb1be9520b9a725");
    var_f7b104b2 = getdvar(#"hash_6b57212fd4fcdd3a");
    level flag::wait_till("flag_adler_walk_02_done");
    setdvar(#"hash_7fb1be9520b9a725", 400);
    setdvar(#"hash_6b57212fd4fcdd3a", 600);
    level flag::wait_till("flag_butcher_done_talking");
    setdvar(#"hash_7fb1be9520b9a725", var_8c871ee9);
    setdvar(#"hash_6b57212fd4fcdd3a", var_f7b104b2);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x69b42da4, Offset: 0x27b8
// Size: 0x14c
function function_edd0551c() {
    level flag::wait_till("flag_intro_player_vm_done");
    level util::delay(0.35, undefined, &scene::init, #"hash_65c743e9446696f6");
    level util::delay(0.5, undefined, &function_42f61091);
    level util::delay(0.75, undefined, &scene::play, #"hash_44651ae1de4c2f41");
    level flag::wait_till("flag_intro_player_boarded_chopper");
    level util::delay(0.25, undefined, &scene::init, #"hash_5cceffc35d2de027");
    level util::delay(0.5, undefined, &scene::init, #"hash_4c4df92bd76b4be6");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x4f557343, Offset: 0x2910
// Size: 0x7c
function function_42f61091() {
    a_ents = [];
    if (isdefined(level.gunner)) {
        level.gunner ai::gun_remove();
        a_ents[#"hash_2082d5270bdcf457"] = level.gunner;
    }
    level scene::init(#"hash_4c4df82bd76b4a33", a_ents);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x771823b3, Offset: 0x2998
// Size: 0x12c
function function_2549ca47() {
    self notify("5711ea5d73fadedf");
    self endon("5711ea5d73fadedf");
    self endon(#"death");
    self waittill(#"hash_471925ec14b4374f");
    self setviewclamp(20, 20, 15, 15, 0, 0, 1);
    self waittill(#"hash_76056e58357b2855");
    self setviewclamp(0, 0, 0, 0, 0, 1, 1);
    self waittill(#"hash_691a95e33c3f31cf");
    self setviewclamp(20, 20, 15, 15, 0, 0, 1);
    self waittill(#"hash_1a277ed0faa745f7");
    self setviewclamp(30, 30, 15, 15, 0, 0, 1);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x3361047d, Offset: 0x2ad0
// Size: 0x8c
function function_4c403681() {
    self endon(#"death");
    level waittill(#"hash_4230b97af87a8a34");
    self playrumblelooponentity(#"hash_3c2b94894227f3cf");
    level waittill(#"hash_1a97a982320ab27a");
    wait(1.5);
    self stoprumble(#"hash_3c2b94894227f3cf");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x2 linked
// Checksum 0x9d418f10, Offset: 0x2b68
// Size: 0x18c
function function_efd3381d(var_a3ad3414, var_646aad9f = 1) {
    self endon(#"death");
    self waittill(#"scene_done", #"hash_7e6af87c24bbe364");
    self.script_radius = 128;
    self.delete_on_path_end = 1;
    if (!var_646aad9f || self.aitype === #"hash_4d52bea52bd00dbd" || self.aitype === #"hash_421500ac712b73b2") {
        self ai::gun_remove();
    }
    self thread namespace_b7cfe907::delete_on_flag("flag_intro_base_cleanup");
    if (isdefined(self.var_5ca26d2d) && isdefined(self.var_b11e7fca)) {
        var_5ca26d2d = self.var_5ca26d2d;
        var_c356b2bd = "armada_fake_uh1d_crew_pos_" + self.var_b11e7fca;
        level thread function_a8db30d2(var_c356b2bd, var_5ca26d2d, self);
        return;
    }
    if (isdefined(var_a3ad3414)) {
        self thread spawner::go_to_node(getnode(var_a3ad3414, "script_noteworthy"));
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x557eeb5f, Offset: 0x2d00
// Size: 0x6ac
function function_d697a743() {
    level endon(#"hash_51a413763f592840");
    a_ents = [];
    a_ents[#"vip"] = level.vip;
    var_c5e9076a = [];
    var_c5e9076a[#"prop 1"] = level.player namespace_b7cfe907::function_ca2b95a();
    level.vip.var_5b22d53 = 0;
    level.player dialogue::queue("vox_cp_armd_00009_sims_fracturejawthat_44");
    wait(0.5);
    level thread scene::play(#"hash_215ce8323a3558f2", "intro", var_c5e9076a);
    level thread scene::play(#"armada_intro", "intro", a_ents);
    level util::delay(4.3, "disconnect", &util::screen_fade_in, 1.5, "black", "armada_intro_black_screen");
    level flag::wait_till("flag_intro_adler_first_walk_done");
    waitframe(1);
    if (level flag::get("flag_intro_adler_walk_talk_pos_1")) {
        level thread flag::set("flag_vo_gearup_walk");
        level scene::play(#"armada_intro", "walk_01", a_ents);
    } else {
        level scene::play(#"armada_intro", "idle_01_enter", a_ents);
        level thread flag::set("flag_vo_intro_walk_and_talk_nags");
        level thread scene::play(#"armada_intro", "idle_01", a_ents);
        level flag::wait_till("flag_intro_adler_walk_talk_pos_1");
        level thread flag::clear("flag_vo_intro_walk_and_talk_nags");
        level thread flag::set("flag_vo_gearup_walk");
        level scene::play(#"armada_intro", "idle_01_exit", a_ents);
    }
    level scene::play(#"armada_intro", "walk_02", a_ents);
    level flag::set("flag_adler_walk_02_done");
    if (level flag::get("flag_intro_adler_walk_talk_pos_2")) {
        level thread flag::set("flag_vo_gearup_walk_pt2");
        level scene::play(#"armada_intro", "walk_02b", a_ents);
    } else {
        level scene::play(#"armada_intro", "idle_02_enter", a_ents);
        level thread flag::set("flag_vo_intro_walk_and_talk_nags");
        level thread scene::play(#"armada_intro", "idle_02", a_ents);
        level flag::wait_till("flag_intro_adler_walk_talk_pos_2");
        level thread flag::clear("flag_vo_intro_walk_and_talk_nags");
        level thread flag::set("flag_vo_gearup_walk_pt2");
        level scene::play(#"armada_intro", "idle_02_exit", a_ents);
    }
    level scene::play(#"armada_intro", "walk_03", a_ents);
    if (level flag::get("flag_intro_adler_walk_talk_pos_3")) {
        level thread flag::set("flag_vo_gearup_walk_pt3");
        level scene::play(#"armada_intro", "walk_03b", a_ents);
    } else {
        level scene::play(#"armada_intro", "idle_03_enter", a_ents);
        level thread flag::set("flag_vo_intro_walk_and_talk_nags");
        level thread scene::play(#"armada_intro", "idle_03", a_ents);
        level flag::wait_till("flag_intro_adler_walk_talk_pos_3");
        level thread flag::clear("flag_vo_intro_walk_and_talk_nags");
        level thread flag::set("flag_vo_gearup_walk_pt3");
        level scene::play(#"armada_intro", "idle_03_exit", a_ents);
    }
    level scene::play(#"armada_intro", "walk_04", a_ents);
    level thread scene::play(#"armada_intro", "idle_at_huey", a_ents);
    level.vip thread function_13a39590();
    level flag::set("flag_intro_adler_at_chopper");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x28f668e5, Offset: 0x33b8
// Size: 0xcc
function function_ecf2431c(var_4a42e1d5) {
    if (var_4a42e1d5) {
        level.player disableweapons();
        level.player freezecontrolsallowlook(1);
        wait(0.5);
        return;
    }
    level.player switchtoweapon(getweapon(#"hash_4ff481a4f55ed901"));
    level.player enableweapons();
    level.player freezecontrolsallowlook(0);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xc4afc999, Offset: 0x3490
// Size: 0xb4
function function_c9528d2b() {
    level scene::init(#"hash_546965da456bebee");
    wait(1);
    level flag::wait_till("flag_intro_mixed_flyover_guys_go");
    level thread scene::play(#"hash_546965da456bebee", "in");
    wait(13);
    level flag::wait_till("flag_intro_hueys_take_off");
    level scene::play(#"hash_546965da456bebee", "out");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x7b5f29c4, Offset: 0x3550
// Size: 0x2b4
function function_3f7b5c03() {
    level.player endon(#"disconnect");
    level thread scene::init(#"hash_7faf0cdd480159ac");
    level thread scene::play(#"hash_761a6203426b6798", "Shot 1");
    level thread scene::play(#"hash_4ce8271dd8f2244a", "Shot 1");
    level flag::wait_till("flag_intro_player_vm_done");
    level thread scene::play(#"hash_7faf0cdd480159ac", "hover");
    level thread scene::play(#"hash_2108e18b1a8b5de3");
    level thread scene::play(#"hash_2108e08b1a8b5c30");
    var_bd62ddf0 = "flag_intro_cobras_take_off";
    level thread function_eb674c04(var_bd62ddf0);
    level flag::wait_till_any([var_bd62ddf0, "flag_intro_look_at_cobras"]);
    level thread scene::play(#"hash_7faf0cdd480159ac", "flyout");
    level scene::play(#"hash_761a6203426b6798", "Shot 2");
    level thread scene::play(#"hash_761a6203426b6798", "Shot 3");
    wait(2.8);
    level scene::play(#"hash_4ce8271dd8f2244a", "Shot 2");
    level thread scene::play(#"hash_4ce8271dd8f2244a", "Shot 3");
    level flag::wait_till("flag_intro_base_cleanup");
    level thread scene::stop(#"hash_2978a9b1c68ba898", 1);
    level thread scene::stop(#"hash_641c6501310adb27", 1);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x7b3ac2f4, Offset: 0x3810
// Size: 0xa4
function function_eb674c04(var_bd62ddf0) {
    level endon(var_bd62ddf0);
    level.player endon(#"death");
    var_fddd8e7 = struct::get("lookat_target_cobras", "targetname");
    level.player util::waittill_player_looking_at(var_fddd8e7.origin, 90, 1, self);
    level flag::set("flag_intro_look_at_cobras");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 3, eflags: 0x2 linked
// Checksum 0xca73200f, Offset: 0x38c0
// Size: 0x6c
function function_f62c89bf(scene, var_5bd781e2, var_f2fdaafa) {
    level scene::init(scene);
    level flag::wait_till(var_f2fdaafa);
    level thread scene::play(scene, var_5bd781e2);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 3, eflags: 0x2 linked
// Checksum 0xb3a05966, Offset: 0x3938
// Size: 0x84
function function_5a637552(scene, var_f2fdaafa, var_151c9966) {
    level flag::wait_till(var_f2fdaafa);
    level thread scene::play(scene);
    level flag::wait_till(var_151c9966);
    level scene::stop(scene, 1);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x2 linked
// Checksum 0x5a01f3a8, Offset: 0x39c8
// Size: 0x84
function function_3a5d1f07(scene, var_6d028304) {
    level scene::init(scene);
    level thread scene::play(scene, "idle");
    level flag::wait_till(var_6d028304);
    level scene::stop(scene, 1);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 3, eflags: 0x2 linked
// Checksum 0x77886a02, Offset: 0x3a58
// Size: 0x36c
function function_9180c609(struct_targetname, start_flag, var_74056fba = "intro_fake_runner_spawner") {
    guys = [];
    spawner = getent(var_74056fba, "targetname");
    var_62983392 = struct::get_array(struct_targetname);
    foreach (struct in var_62983392) {
        guy = spawner spawner::spawn(1, "", struct.origin, struct.angles);
        guy.delete_on_path_end = 1;
        guy.script_radius = 128;
        e_goal = getnode(struct.target, "targetname");
        guy.var_e97a6587 = e_goal;
        if (!isdefined(guys)) {
            guys = [];
        } else if (!isarray(guys)) {
            guys = array(guys);
        }
        guys[guys.size] = guy;
        waitframe(1);
    }
    if (isdefined(start_flag)) {
        level flag::wait_till_any([start_flag, "flag_intro_cleanup_runners", "flag_intro_base_cleanup"]);
    }
    if (!level flag::get_all(["flag_intro_cleanup_runners", "flag_intro_base_cleanup"])) {
        foreach (guy in guys) {
            guy thread spawner::go_to_node(guy.var_e97a6587);
            wait(randomfloatrange(0.15, 0.25));
        }
        level flag::wait_till_any(["flag_intro_cleanup_runners", "flag_intro_base_cleanup"]);
    }
    function_1eaaceab(guys);
    array::delete_all(guys);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x2c842b91, Offset: 0x3dd0
// Size: 0xec
function function_b34d0584(a_ents) {
    level endon(#"hash_51a413763f592840");
    if (!function_72a9e321()) {
        return;
    }
    guy1 = a_ents[#"hash_700317227822abe3"];
    guy2 = a_ents[#"hash_700318227822ad96"];
    level flag::wait_till("flag_intro_player_vm_done");
    wait(2);
    guy2 dialogue::queue("vox_cp_armd_00001_ars1_likeisaidsometi_3d");
    wait(1);
    guy1 dialogue::queue("vox_cp_armd_00001_ars2_yeahyeah_a8");
    level flag::set("flag_tent_guys_vo_done");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x9f71453, Offset: 0x3ec8
// Size: 0x10c
function function_1b50aed2(a_ents) {
    level endon(#"hash_51a413763f592840");
    guy1 = a_ents[#"actor 1"];
    guy2 = a_ents[#"actor 2"];
    level flag::wait_till_all(["flag_intro_base_tent_leave", "flag_tent_guys_vo_done"]);
    wait(1);
    guy2 dialogue::queue("vox_cp_armd_00002_ars3_charliestillhol_bb");
    wait(0.5);
    guy1 dialogue::queue("vox_cp_armd_00002_ars4_sowhyhaventwebo_a3");
    wait(0.5);
    guy2 dialogue::queue("vox_cp_armd_00002_ars3_shitlikethattak_b3");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0xf156dda6, Offset: 0x3fe0
// Size: 0x9c
function function_c9f69e1b(a_ents) {
    guy = a_ents[#"actor 2"];
    guy.propername = #"hash_2a35e27eee2368d";
    level waittill(#"hash_15656e74128aee0e");
    guy dialogue::queue("vox_cp_armd_00002_butc_stillhurtslikeh_3d");
    level flag::set("flag_butcher_done_talking");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x8b2bf413, Offset: 0x4088
// Size: 0x394
function function_d7d6110f() {
    waitframe(1);
    level thread scene::play(#"hash_4e2911483e0977d1", "idle");
    waitframe(1);
    if (function_72a9e321()) {
        level thread scene::play(#"hash_50b717d4d81fd84", "idle");
        waitframe(1);
    }
    level thread scene::play(#"hash_2a375e5568424fe8", "idle");
    waitframe(1);
    level thread scene::play(#"hash_5b05957a16a5cc9a", "idle");
    waitframe(1);
    level thread scene::play(#"hash_140385b56b0d72f6", "idle");
    waitframe(1);
    level thread scene::play(#"hash_5c50c9a83f5516ac", "idle");
    waitframe(1);
    level thread scene::play(#"hash_2e9f4f58613173d0", "idle");
    waitframe(1);
    level thread scene::play(#"hash_3a25ebd0676dbfbf", "idle");
    level flag::wait_till("flag_intro_player_boarded_chopper");
    level scene::stop(#"hash_50b717d4d81fd84", 1);
    level scene::stop(#"hash_4e2911483e0977d1", 1);
    level scene::stop(#"hash_140385b56b0d72f6", 1);
    level scene::stop(#"hash_5c50c9a83f5516ac", 1);
    level thread function_b803eeb0(#"hash_2e9f4f58613173d0");
    level thread function_b803eeb0(#"hash_3a25ebd0676dbfbf");
    level thread function_b803eeb0(#"hash_2a375e5568424fe8");
    level thread function_b803eeb0(#"hash_5b05957a16a5cc9a");
    level flag::wait_till("flag_intro_base_cleanup");
    level scene::stop(#"hash_2e9f4f58613173d0", 1);
    level scene::stop(#"hash_3a25ebd0676dbfbf", 1);
    level scene::stop(#"hash_2a375e5568424fe8", 1);
    level scene::stop(#"hash_5b05957a16a5cc9a", 1);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x3173bd5, Offset: 0x4428
// Size: 0xb8
function function_b803eeb0(str_scene_name) {
    var_471e04b9 = level scene::get_active_scenes(str_scene_name);
    foreach (ent in var_471e04b9[0].scene_ents) {
        ent setnosunshadow();
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x5e7854e5, Offset: 0x44e8
// Size: 0x294
function function_48b95055() {
    level endon(#"hash_34f048d2fedcfa3e");
    level thread function_4ce9d8f6();
    level thread scene::play(#"hash_61e4263a57561de4", "idle_relax");
    level flag::wait_till("flag_intro_air_marshall_relax_to_ready");
    level scene::play(#"hash_61e4263a57561de4", "relax_to_ready");
    level thread scene::play(#"hash_61e4263a57561de4", "idle_ready");
    level flag::wait_till("flag_intro_air_marshall_ready_to_revup");
    level scene::play(#"hash_61e4263a57561de4", "ready_to_revup");
    level thread scene::play(#"hash_61e4263a57561de4", "idle_revup");
    level flag::wait_till("flag_intro_air_marshall_revup_to_liftoff");
    level scene::play(#"hash_61e4263a57561de4", "revup_to_liftoff");
    level thread scene::play(#"hash_61e4263a57561de4", "idle_liftoff");
    level flag::wait_till("flag_intro_hueys_take_off");
    level scene::play(#"hash_61e4263a57561de4", "liftoff_to_turn");
    level thread scene::play(#"hash_61e4263a57561de4", "idle_turn");
    wait(5);
    level scene::play(#"hash_61e4263a57561de4", "signal_and_walk_left");
    level thread scene::play(#"hash_61e4263a57561de4", "idle_relax_02");
    level flag::set("flag_intro_air_marhsall_first_column_complete");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xda4d05b6, Offset: 0x4788
// Size: 0x244
function function_4ce9d8f6() {
    level flag::wait_till("flag_intro_air_marshall_tele");
    if (!flag::get("flag_intro_air_marhsall_first_column_complete")) {
        level notify(#"hash_34f048d2fedcfa3e");
        level thread scene::play(#"hash_61e4263a57561de4", "idle_relax_02");
    }
    level flag::wait_till("flag_intro_air_marshall_start_player_takeoff");
    level scene::play(#"hash_61e4263a57561de4", "relax_to_ready_02");
    level scene::play(#"hash_61e4263a57561de4", "ready_to_revup_02");
    level thread scene::play(#"hash_61e4263a57561de4", "idle_revup_02");
    level waittilltimeout(5, #"hash_7f95cc84bb312faa");
    level.var_7466d419 setrotorspeed(1);
    level scene::play(#"hash_61e4263a57561de4", "revup_to_liftoff_02");
    level thread scene::play(#"hash_61e4263a57561de4", "idle_liftoff_02");
    wait(5);
    level scene::play(#"hash_61e4263a57561de4", "liftoff_to_turn_02");
    level thread scene::play(#"hash_61e4263a57561de4", "idle_turn_02");
    level flag::wait_till("flag_intro_base_cleanup");
    level thread scene::stop(#"hash_61e4263a57561de4", 1);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x2 linked
// Checksum 0x7bc4b8cf, Offset: 0x49d8
// Size: 0xd4
function function_e04385cb(var_4a5a95d5, var_e3b80211) {
    level endon(#"hash_51a413763f592840");
    level flag::wait_till("flag_chinook_takeoff");
    for (i = 1; i <= 3; i++) {
        if (i == 2) {
            var_87b63437 = 4;
        } else {
            var_87b63437 = 3;
        }
        level thread function_7675bb9d(i, var_4a5a95d5, var_e3b80211, var_87b63437);
        wait(randomfloatrange(15, 20));
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 4, eflags: 0x2 linked
// Checksum 0xa4d1720e, Offset: 0x4ab8
// Size: 0x474
function function_7675bb9d(var_e8e79806, var_4a5a95d5, var_e3b80211, var_87b63437) {
    a_ents = [];
    a_scene_ents = [];
    if (is_true(var_4a5a95d5)) {
        var_f199fa90 = array(#"hash_13946ff41d6832f5", #"hash_361d94364e01ac90", #"hash_5cce1213c6e8f16f");
    } else {
        var_2c4dfb60 = array(#"hash_1bef6284ab630592", #"hash_405ba997da57b6db", #"hash_1c1310d069b4a4a2");
    }
    var_161f6e1e = struct::get_array("vehicle_convoy_spawn_loc");
    for (i = 0; i <= var_87b63437 - 1; i++) {
        if (is_true(var_4a5a95d5)) {
            var_ff72be84 = util::spawn_anim_model(array::random(var_f199fa90), var_161f6e1e[i].origin, var_161f6e1e[i].angles);
        } else {
            var_ff72be84 = vehicle::spawn(undefined, "intro_base_tent_convoy", array::random(var_2c4dfb60), var_161f6e1e[i].origin, var_161f6e1e[i].angles);
        }
        if (is_true(var_4a5a95d5)) {
            var_ff72be84 thread function_b0db2a33(1);
        } else {
            var_ff72be84 thread function_a515aac6(1);
        }
        if (!isdefined(a_ents)) {
            a_ents = [];
        } else if (!isarray(a_ents)) {
            a_ents = array(a_ents);
        }
        a_ents[a_ents.size] = var_ff72be84;
        waitframe(1);
    }
    switch (var_e8e79806) {
    case 1:
        a_scene_ents[#"vehicle 2"] = a_ents[0];
        a_scene_ents[#"vehicle 3"] = a_ents[1];
        a_scene_ents[#"hash_5c059a141887868b"] = a_ents[2];
        break;
    case 2:
        a_scene_ents[#"vehicle 1"] = a_ents[0];
        a_scene_ents[#"vehicle 3"] = a_ents[1];
        a_scene_ents[#"hash_5c059a141887868b"] = a_ents[2];
        a_scene_ents[#"hash_5c059914188784d8"] = a_ents[3];
        break;
    case 3:
        a_scene_ents[#"hash_5c059a141887868b"] = a_ents[0];
        a_scene_ents[#"hash_5c059914188784d8"] = a_ents[1];
        a_scene_ents[#"hash_5c059c14188789f1"] = a_ents[2];
        break;
    }
    level thread scene::play("t9_arm_haskins_trucks_convoy_0" + var_e8e79806, "targetname", a_scene_ents);
    level flag::wait_till(var_e3b80211);
    self scene::stop(#"hash_53f5d6c174b9f834", 1);
    level scene::stop("t9_arm_haskins_trucks_convoy_0" + var_e8e79806, "targetname", 1);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x0
// Checksum 0xf0de18d7, Offset: 0x4f38
// Size: 0x240
function function_4fa68c0a() {
    var_efbe0740 = vehicle::simple_spawn("intro_base_tent_convoy");
    array::thread_all(var_efbe0740, &function_a515aac6, 1);
    var_50988c48 = getvehiclearray("intro_lead_convoy_truck", "script_noteworthy");
    var_576fb569 = getvehiclenodearray("intro_ambient_vehicle_start_node", "targetname");
    var_2c4dfb60 = array(#"hash_1bef6284ab630592", #"hash_877630a32441b2a", #"hash_405ba997da57b6db", #"hash_1c1310d069b4a4a2");
    str_notify = "spawn_new_intro_truck";
    var_3195dfe3 = "flag_intro_truck_intersection_occupied";
    var_efbe0740 = arraysortclosest(var_efbe0740, var_50988c48[0].origin);
    level flag::wait_till("flag_vo_gearup_walk");
    level thread function_7fabe565(str_notify, var_576fb569, var_2c4dfb60, var_3195dfe3, 1);
    foreach (var_ff72be84 in var_efbe0740) {
        var_ff72be84 thread vehicle::go_path();
        var_ff72be84 thread function_b4dd21d4(str_notify);
        wait(randomfloatrange(0.8, 1.2));
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x51bd2bf6, Offset: 0x5180
// Size: 0x1c4
function function_a515aac6(var_7e49f78c = 1) {
    self vehicle::lights_on();
    self vehicle::toggle_force_driver_taillights(1);
    self vehicle::toggle_sounds(1);
    self vehicle::toggle_exhaust_fx(1);
    self thread namespace_b7cfe907::delete_on_flag("flag_intro_base_cleanup", 1);
    self setcandamage(0);
    self setnosunshadow();
    if (var_7e49f78c) {
        if (isinarray(array(#"hash_1bef6284ab630592", #"hash_1c1310d069b4a4a2", #"hash_405ba997da57b6db"), self.vehicletype)) {
            self thread scene::play(#"hash_53f5d6c174b9f834");
            return;
        }
        if (self.vehicletype === #"hash_877630a32441b2a") {
            if (math::cointoss()) {
                str_scene = #"hash_5823504556939fca";
            } else {
                str_scene = #"hash_58234f4556939e17";
            }
            self thread scene::play(str_scene);
        }
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x7f32aec8, Offset: 0x5350
// Size: 0xd0
function function_f7dd4794() {
    level thread function_e04385cb(0, "flag_intro_base_cleanup");
    var_e4fcc2c1 = getvehiclearray("flyin_leave_trucks", "targetname");
    foreach (var_ff72be84 in var_e4fcc2c1) {
        var_ff72be84 setnosunshadow();
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x174eb2e8, Offset: 0x5428
// Size: 0x7c
function function_b0db2a33(var_7e49f78c = 1) {
    self thread namespace_b7cfe907::delete_on_flag("flag_intro_base_cleanup", 1);
    self setnosunshadow();
    if (var_7e49f78c) {
        self thread scene::play(#"hash_53f5d6c174b9f834");
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x80c7e284, Offset: 0x54b0
// Size: 0x9c
function function_b4dd21d4(str_notify) {
    level endon(#"hash_4d46078cfbdcc621");
    self endon(#"death");
    self setnosunshadow();
    self waittill(#"reached_end_node");
    level notify(str_notify);
    self scene::stop(1);
    self deletedelay();
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 5, eflags: 0x2 linked
// Checksum 0x8c9a9b54, Offset: 0x5558
// Size: 0x188
function function_7fabe565(str_notify, var_576fb569, var_2c4dfb60, var_3195dfe3, var_d437c203 = 1) {
    level endon(#"hash_4d46078cfbdcc621");
    while (true) {
        level waittill(#"hash_9289689e4ceb55c");
        nd_start = array::random(var_576fb569);
        var_d240817d = array::random(var_2c4dfb60);
        wait(randomfloatrange(1, 2));
        if (isdefined(var_3195dfe3)) {
            while (level flag::get(var_3195dfe3)) {
                waitframe(1);
            }
        }
        var_ff72be84 = vehicle::spawn(undefined, "intro_base_tent_convoy", var_d240817d, nd_start.origin, nd_start.angles);
        var_ff72be84 function_a515aac6(var_d437c203);
        var_ff72be84 thread function_b4dd21d4(str_notify);
        var_ff72be84 thread vehicle::get_on_and_go_path(nd_start);
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x21859145, Offset: 0x56e8
// Size: 0x1d4
function function_3bfb9b07() {
    chinook = vehicle::simple_spawn_single("intro_chinook_lift_off");
    chinook endon(#"death");
    chinook thread namespace_b7cfe907::delete_on_flag("flag_intro_base_cleanup");
    chinook vehicle::toggle_tread_fx(1);
    chinook vehicle::toggle_exhaust_fx(1);
    chinook setrotorspeed(0.3);
    chinook setnosunshadow();
    var_eb73902e = getvehiclenode("intro_chinook_lift_off_node_start", "targetname");
    level flag::wait_till("flag_vo_gearup_walk");
    chinook setrotorspeed(1);
    chinook playsound(#"hash_19f7d46bb05dc655");
    wait(1.8);
    chinook vehicle::set_goal_pos(var_eb73902e.origin, 1);
    chinook waittill(#"goal");
    level flag::set("flag_chinook_takeoff");
    chinook vehicle::get_on_and_go_path(var_eb73902e);
    chinook deletedelay();
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xa21e6617, Offset: 0x58c8
// Size: 0x50c
function function_55d23d1e() {
    scene::add_scene_func(#"hash_50b717d4d81fd84", &function_b34d0584, "init");
    scene::add_scene_func(#"hash_2e9f4f58613173d0", &function_1b50aed2, "init");
    scene::add_scene_func(#"hash_140385b56b0d72f6", &function_c9f69e1b, "init");
    scene::add_scene_func(#"hash_18d1fb728f438332", &function_50941fc1, "init");
    scene::add_scene_func(#"hash_7faf0cdd480159ac", &namespace_b7cfe907::function_a641ac8b, "init");
    scene::add_scene_func(#"hash_546965da456bebee", &function_8f9d1155, "init");
    scene::add_scene_func(#"hash_546965da456bebee", &namespace_b7cfe907::function_a641ac8b, "init");
    scene::add_scene_func(#"hash_546965da456bebee", &function_c4b6673f, "done");
    scene::add_scene_func(#"hash_5cceffc35d2de027", &namespace_b7cfe907::function_a641ac8b, "init");
    scene::add_scene_func(#"hash_65c743e9446696f6", &function_ea6224e, "init");
    scene::add_scene_func(#"hash_65c743e9446696f6", &namespace_b7cfe907::function_1eff410c, "init");
    scene::add_scene_func(#"hash_4c4df82bd76b4a33", &function_ea6224e, "init");
    scene::add_scene_func(#"hash_4c4df82bd76b4a33", &namespace_b7cfe907::function_1eff410c, "init");
    scene::add_scene_func(#"hash_4c4df92bd76b4be6", &function_ea6224e, "init");
    scene::add_scene_func(#"hash_4c4df92bd76b4be6", &namespace_b7cfe907::function_1eff410c, "init");
    scene::add_scene_func(#"hash_5cceffc35d2de027", &function_ea6224e, "gear_up_pt02");
    scene::add_scene_func(#"hash_4c4df82bd76b4a33", &function_b281d751, "gear_up_pt02");
    scene::add_scene_func(#"hash_4c4df82bd76b4a33", &namespace_b7cfe907::function_a641ac8b, "gear_up_pt02");
    scene::add_scene_func(#"hash_4c4df92bd76b4be6", &function_b281d751, "gear_up_pt02");
    scene::add_scene_func(#"hash_4c4df92bd76b4be6", &namespace_b7cfe907::function_a641ac8b, "gear_up_pt02");
    scene::add_scene_func(#"hash_69b8e06afe12b8f9", &function_88216172, "init");
    scene::add_scene_func(#"hash_45e2dd5c24266fcf", &function_7429a059, "precheck");
    scene::function_d8a83a50(#"hash_45e2dd5c24266fcf", &function_d4337a8d, "approaching_firebase");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x8f2aa2ba, Offset: 0x5de0
// Size: 0x1b0
function function_70c35833(a_ents) {
    foreach (index, ent in a_ents) {
        if (!isdefined(ent)) {
            continue;
        }
        if (index === #"hash_68349b88b62197f0") {
            ent ai::set_behavior_attribute(#"hash_78e762abc4fbf1de", "run");
        }
        if (index === #"hash_68349e88b6219d09") {
            ent ai::set_behavior_attribute(#"hash_78e762abc4fbf1de", "run");
        }
        if (index === #"hash_68349b88b62197f0" || index === #"hash_68349e88b6219d09" || index === #"hash_4b43389515b6fa6f" || index === #"hash_4b43399515b6fc22" || index === #"hash_4b433a9515b6fdd5" || index === #"hash_4b43339515b6f1f0") {
            ent thread function_efd3381d("intro_guys_mid_node");
        }
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x1f541366, Offset: 0x5f98
// Size: 0x3c
function function_50941fc1(a_ents) {
    thread function_9222bf72(a_ents[#"actor 1"], a_ents[#"actor 2"]);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x2 linked
// Checksum 0xd66aa2da, Offset: 0x5fe0
// Size: 0xcc
function function_9222bf72(guy1, guy2) {
    guy1 endon(#"hash_7e6af87c24bbe364");
    guy2 endon(#"hash_7e6af87c24bbe364");
    level flag::wait_till("flag_butcher_done_talking");
    guy1 waittill(#"hash_23c657a5cbcd0970");
    guy1 thread dialogue::queue("vox_cp_armd_00002_ars7_sohotdontthinki_11");
    guy2 waittill(#"hash_696109201bf8e0ad");
    guy2 dialogue::queue("vox_cp_armd_00002_ars8_noshitnorthdako_b6");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x170528e6, Offset: 0x60b8
// Size: 0x276
function function_8f9d1155(a_ents) {
    str_model = #"hash_262ebc4f609e2513";
    weapon = getweapon(#"hash_4ff481a4f55ed901");
    var_129f138 = #"hash_4d52bea52bd00dbd";
    var_a61227dc = #"hash_421500ac712b73b2";
    foreach (index, ent in a_ents) {
        if (!isdefined(ent)) {
            continue;
        }
        switch (index) {
        case #"vehicle 1":
            ent thread namespace_b7cfe907::function_9ac0bc90([0, 1]);
            break;
        case #"vehicle 2":
            ent thread namespace_b7cfe907::function_9ac0bc90([0, 1, 7, 8, 9, 10]);
            break;
        case #"vehicle 3":
            ent thread namespace_b7cfe907::function_9ac0bc90([0, 1, 9, 10]);
            break;
        case #"hash_5c059a141887868b":
            ent thread namespace_b7cfe907::function_9ac0bc90([0, 1]);
            break;
        }
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 3, eflags: 0x2 linked
// Checksum 0xe615f5cc, Offset: 0x6338
// Size: 0x24c
function function_a8db30d2(scene, chopper, var_45514840) {
    chopper endon(#"death");
    var_45514840 endon(#"death");
    pos = var_45514840.var_b11e7fca;
    var_f37b2ff0 = undefined;
    if (isdefined(var_45514840.var_642dba7f)) {
        var_1942660b = var_45514840.var_642dba7f;
        var_f37b2ff0 = var_1942660b;
    } else {
        var_8a4b462a = ["climbin"];
        if (var_45514840.var_b11e7fca == 9 || var_45514840.var_b11e7fca == 10) {
            if (!isdefined(var_8a4b462a)) {
                var_8a4b462a = [];
            } else if (!isarray(var_8a4b462a)) {
                var_8a4b462a = array(var_8a4b462a);
            }
            var_8a4b462a[var_8a4b462a.size] = "climbin2";
            if (!isdefined(var_8a4b462a)) {
                var_8a4b462a = [];
            } else if (!isarray(var_8a4b462a)) {
                var_8a4b462a = array(var_8a4b462a);
            }
            var_8a4b462a[var_8a4b462a.size] = "climbin_slow";
        }
        var_1942660b = array::random(var_8a4b462a);
    }
    chopper thread scene::play(scene, var_1942660b, var_45514840);
    var_45514840 waittill(#"hash_3c8bef57ea1e5af");
    chopper flag::set("flag_intro_crew_" + var_45514840.var_b11e7fca + "_boarded");
    chopper thread scene::stop(scene, 1);
    chopper.var_2295c5e7 = 1;
    level thread namespace_b7cfe907::function_b50b1da4(chopper, pos, var_f37b2ff0);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x3730100a, Offset: 0x6590
// Size: 0x148
function function_c4b6673f(a_ents) {
    foreach (ent in a_ents) {
        if (is_true(ent.var_2295c5e7)) {
            ent notify(#"hash_2ec2df211f113591");
            foreach (guy in ent.var_ad845fd6) {
                if (isdefined(guy)) {
                    guy delete();
                }
            }
        }
        ent deletedelay();
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x21c9f7ae, Offset: 0x66e0
// Size: 0x47e
function function_ea6224e(a_ents) {
    foreach (index, ent in a_ents) {
        if (!isdefined(ent)) {
            continue;
        }
        switch (index) {
        case #"hash_505d54dd2b523ca3":
            if (!isdefined(level.var_da19489d)) {
                level.var_da19489d = ent;
                level.var_da19489d setrotorspeed(0.23);
            }
            break;
        case #"hash_4441cc1284fe31e6":
            if (!isdefined(level.var_52874eb2)) {
                level.var_52874eb2 = ent;
                level.var_52874eb2 setrotorspeed(0.28);
            }
            break;
        case #"hash_25a9a33c7c596183":
        case #"hash_25a9a43c7c596336":
        case #"hash_25a9a53c7c5964e9":
        case #"hash_25a9a63c7c59669c":
        case #"hash_25a9a73c7c59684f":
        case #"hash_25a9a83c7c596a02":
            ent thread namespace_b7cfe907::function_80a8e837();
            break;
        case #"hash_3c898b6644de1c74":
            ent thread namespace_b7cfe907::function_9ac0bc90([0, 1]);
            ent thread function_e0c430cb("flag_intro_player_boarded_chopper");
            break;
        case #"hash_3c898e6644de218d":
            ent thread namespace_b7cfe907::function_9ac0bc90([0, 1, 7, 9, 10]);
            ent thread function_e0c430cb("flag_intro_player_boarded_chopper");
            break;
        case #"hash_3c898d6644de1fda":
            ent thread namespace_b7cfe907::function_9ac0bc90([0, 1, 7, 9, 10]);
            ent thread function_e0c430cb("flag_play_gear_up_pt02");
            break;
        case #"hash_3c89876644de15a8":
        case #"hash_3c89886644de175b":
            ent thread function_e0c430cb("flag_intro_player_boarded_chopper");
            break;
        case #"hash_7f1ef323fbb683c9":
            break;
        case #"hash_3cd20118e4cb9c68":
            ent thread namespace_b7cfe907::function_9ac0bc90([0, 1, 9, 10]);
            break;
        case #"hash_5f084b741ecc845c":
            ent thread namespace_b7cfe907::function_9ac0bc90([0, 1]);
            break;
        case #"hash_25d7fb931fa86afc":
            ent thread namespace_b7cfe907::function_9ac0bc90([0, 7, 9]);
            break;
        }
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x1319ec23, Offset: 0x6b68
// Size: 0x3c
function function_e0c430cb(var_90a59057) {
    level flag::wait_till(var_90a59057);
    self thread namespace_b7cfe907::function_a7574a48();
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0xa3fa0653, Offset: 0x6bb0
// Size: 0x9c
function function_7429a059(a_ents) {
    level flag::wait_till("flag_play_gear_up_pt02");
    if (isdefined(a_ents[#"hash_243517ef16a6bf3a"])) {
        a_ents[#"hash_243517ef16a6bf3a"] delete();
    }
    if (isdefined(a_ents[#"hash_243516ef16a6bd87"])) {
        a_ents[#"hash_243516ef16a6bd87"] delete();
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x9b116172, Offset: 0x6c58
// Size: 0x94
function function_88216172(a_ents) {
    ent = a_ents[#"prop 1"];
    if (isdefined(ent)) {
        level.var_4af7ba12 = ent;
    }
    level flag::wait_till("flag_intro_base_cleanup");
    if (isdefined(a_ents[#"vehicle 1"])) {
        a_ents[#"vehicle 1"] delete();
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0xdf4fb414, Offset: 0x6cf8
// Size: 0x1c6
function function_b281d751(a_ents) {
    foreach (index, ent in a_ents) {
        if (!isdefined(ent)) {
            continue;
        }
        if (ent.vehicleclass === "helicopter") {
            ent setrotorspeed(1);
        }
        switch (index) {
        case #"hash_505d54dd2b523ca3":
            if (!isdefined(level.var_da19489d)) {
                level.var_da19489d = ent;
            }
            break;
        case #"hash_4441cc1284fe31e6":
            if (!isdefined(level.var_52874eb2)) {
                level.var_52874eb2 = ent;
            }
            break;
        case #"hash_7f1ef323fbb683c9":
            ent thread function_f9c12ca2();
            ent turretsettargetangles(1, (0, 0, 0));
            break;
        case #"hash_25d7fb931fa86afc":
        case #"hash_3cd20118e4cb9c68":
        case #"hash_5f084b741ecc845c":
            ent thread function_f9c12ca2();
            break;
        }
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xb0588e4c, Offset: 0x6ec8
// Size: 0x64
function function_f9c12ca2() {
    if (is_true(self.var_2295c5e7)) {
        self namespace_b7cfe907::function_5677b6eb();
    }
    self thread namespace_b7cfe907::function_9ac0bc90([0, 1]);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xebad7bc4, Offset: 0x6f38
// Size: 0xac
function function_d4337a8d() {
    level.player util::function_749362d7(0);
    level.player setmovespeedscale(1);
    level.player val::reset("armada_intro", "allow_crouch");
    level.player val::reset("armada_intro", "allow_prone");
    namespace_b7cfe907::function_d777fe61(2);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x2 linked
// Checksum 0xb2dcd77f, Offset: 0x6ff0
// Size: 0x70c
function function_50d6beb5(*var_d3440450, *var_50cc0d4f) {
    level thread function_38197823();
    level flag::wait_till_any(array("flag_intro_adler_at_chopper", "flag_intro_player_at_chopper"));
    objectives::complete("armada_obj_intro_follow_vip", level.vip);
    level function_e46c8c06();
    level flag::set("flag_intro_player_boarded_chopper");
    level snd::function_7db65a93("introboardsubmix");
    level.vip.var_5b22d53 = undefined;
    level thread function_f7dd4794();
    namespace_72b0499b::music("2.0_briefing");
    level notify(#"hash_57df777459b5086");
    level thread namespace_9a981837::function_7e002ff8();
    level flag::set("flag_vo_gearup_reach_chopper");
    level thread namespace_9a981837::function_121aeba5();
    level thread function_24cba40();
    level.player thread function_7e91061f();
    a_ents = [];
    a_ents[#"vip"] = level.vip;
    a_ents[#"buddy"] = level.buddy;
    a_ents[#"pilot"] = level.pilot;
    a_ents[#"player"] = level.player;
    a_ents[#"copilot"] = level.copilot;
    a_ents[#"hash_4972abe0166bbc73"] = level.var_7466d419;
    a_ents[#"prop 1"] = level.var_4af7ba12;
    level scene::stop(#"armada_intro");
    level scene::stop(#"hash_69b8e06afe12b8f9");
    level scene::play(#"hash_45e2dd5c24266fcf", "precheck", a_ents);
    var_d0e0aa50 = [];
    var_5010a8d6 = [];
    if (isdefined(level.var_52874eb2)) {
        var_5010a8d6[#"hash_4441cc1284fe31e6"] = level.var_52874eb2;
    }
    if (isdefined(level.var_da19489d)) {
        var_5010a8d6[#"hash_505d54dd2b523ca3"] = level.var_da19489d;
    }
    level namespace_b7cfe907::function_166083c9(0, struct::get("spawn_vip_intro"));
    if (isdefined(level.gunner)) {
        var_d0e0aa50[#"hash_2082d5270bdcf457"] = level.gunner;
    }
    level scene::stop(#"hash_65c743e9446696f6");
    level thread scene::play(#"hash_4c4df82bd76b4a33", "gear_up_pt02", var_d0e0aa50);
    level thread scene::play(#"hash_4c4df92bd76b4be6", "gear_up_pt02", var_5010a8d6);
    level thread scene::play(#"hash_5cceffc35d2de027", "gear_up_pt02");
    snd::function_7db65a93(#"hash_2b94ea847ae2b667");
    level thread function_b1b08de();
    a_ents = [];
    a_ents[#"vip"] = level.vip;
    a_ents[#"buddy"] = level.buddy;
    a_ents[#"pilot"] = level.pilot;
    a_ents[#"copilot"] = level.copilot;
    a_ents[#"hash_4972abe0166bbc73"] = level.var_7466d419;
    snd::function_7db65a93(#"hash_391dd8e0fb7ccb35");
    level flag::set("flag_play_gear_up_pt02");
    level.var_7466d419 thread scene::play(#"hash_65f973650bb861a3", "Shot 2");
    level scene::play(#"hash_45e2dd5c24266fcf", "gear_up_pt02", a_ents);
    level thread function_ecf2431c(0);
    level flag::set("flag_intro_base_cleanup");
    level scene::stop(#"hash_45e2dd5c24266fcf");
    level scene::stop(#"hash_44651ae1de4c2f41", 1);
    if (isdefined(level.var_4af7ba12)) {
        level.var_4af7ba12 delete();
    }
    level thread function_3d2235e0();
    next_obj = "armada_mortar_orbit";
    level skipto::function_4e3ab877("armada_flyin");
    level skipto::function_51726ac8([next_obj], 0, level.player);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xf0da2a27, Offset: 0x7708
// Size: 0xec
function function_e46c8c06() {
    var_338850b9 = struct::get("obj_haskins_board_chopper", "targetname");
    level objectives::function_4eb5c04a("armada_obj_haskins_board_chopper", var_338850b9.origin, #"hash_2c9448553a6a5c07");
    var_338850b9 util::create_cursor_hint(undefined, (0, 0, -3), #"hash_37e62971018a0abd", 64, undefined, undefined, undefined, 128);
    var_338850b9 prompts::set_objective("armada_obj_haskins_board_chopper");
    var_338850b9 waittill(#"trigger");
    objectives::complete("armada_obj_haskins_board_chopper");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x29b09c2a, Offset: 0x7800
// Size: 0x10c
function function_7e91061f() {
    self endon(#"death");
    self waittill(#"hash_691a95e33c3f31cf");
    self dialogue::queue("vox_cp_armd_00003_bcmd_allbirdscheckin_97");
    wait(0.3);
    self dialogue::queue("vox_cp_armd_00003_plt1_badgernineroneg_a0");
    wait(0.3);
    self dialogue::queue("vox_cp_armd_00003_plt2_badgerninertwoc_16");
    wait(0.3);
    self dialogue::queue("vox_cp_armd_00003_plt3_badgerninerthre_82");
    wait(0.3);
    self dialogue::queue("vox_cp_armd_00003_bcmd_allbirdsgogogoc_41");
    wait(0.3);
    self dialogue::queue("vox_cp_armd_00003_bcmd_allbirdsareinth_87");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x6d060272, Offset: 0x7918
// Size: 0x74
function function_6b21ec6d() {
    a_ents = [];
    a_ents[#"vip"] = level.vip;
    level thread scene::play(#"armada_intro", "idle_at_huey", a_ents);
    level.vip thread function_13a39590();
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x5e887001, Offset: 0x7998
// Size: 0x16c
function function_13a39590() {
    self endon(#"death");
    if (!level flag::get(#"hash_51a413763f592840")) {
        self.var_e282ccde = util::spawn_model(#"hash_1ffb5690253b45dd", self gettagorigin("tag_weapon_left"), self gettagangles("tag_weapon_left"));
        self.var_e282ccde linkto(self, "tag_weapon_left");
        level flag::wait_till_timeout(0.5, #"hash_51a413763f592840");
        if (!level flag::get(#"hash_51a413763f592840")) {
            self ai::gun_remove();
            level flag::wait_till("flag_intro_player_boarded_chopper");
        }
        if (isdefined(self.var_e282ccde)) {
            self.var_e282ccde delete();
        }
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x20433042, Offset: 0x7b10
// Size: 0x50c
function function_3d2235e0() {
    scene::remove_scene_func(#"armada_intro", &function_70c35833, "init");
    scene::remove_scene_func(#"hash_50b717d4d81fd84", &function_b34d0584, "init");
    scene::remove_scene_func(#"hash_2e9f4f58613173d0", &function_1b50aed2, "init");
    scene::remove_scene_func(#"hash_140385b56b0d72f6", &function_c9f69e1b, "init");
    scene::remove_scene_func(#"hash_7faf0cdd480159ac", &namespace_b7cfe907::function_a641ac8b, "init");
    scene::remove_scene_func(#"hash_546965da456bebee", &function_8f9d1155, "init");
    scene::remove_scene_func(#"hash_546965da456bebee", &namespace_b7cfe907::function_a641ac8b, "init");
    scene::remove_scene_func(#"hash_546965da456bebee", &function_c4b6673f, "done");
    scene::remove_scene_func(#"hash_5cceffc35d2de027", &namespace_b7cfe907::function_a641ac8b, "init");
    scene::remove_scene_func(#"hash_65c743e9446696f6", &function_ea6224e, "init");
    scene::remove_scene_func(#"hash_65c743e9446696f6", &namespace_b7cfe907::function_a641ac8b, "init");
    scene::remove_scene_func(#"hash_4c4df82bd76b4a33", &function_ea6224e, "init");
    scene::remove_scene_func(#"hash_4c4df82bd76b4a33", &namespace_b7cfe907::function_a641ac8b, "init");
    scene::remove_scene_func(#"hash_4c4df92bd76b4be6", &function_ea6224e, "init");
    scene::remove_scene_func(#"hash_4c4df92bd76b4be6", &namespace_b7cfe907::function_a641ac8b, "init");
    scene::remove_scene_func(#"hash_5cceffc35d2de027", &function_ea6224e, "gear_up_pt02");
    scene::remove_scene_func(#"hash_4c4df82bd76b4a33", &function_b281d751, "gear_up_pt02");
    scene::remove_scene_func(#"hash_4c4df82bd76b4a33", &namespace_b7cfe907::function_a641ac8b, "gear_up_pt02");
    scene::remove_scene_func(#"hash_4c4df92bd76b4be6", &function_b281d751, "gear_up_pt02");
    scene::remove_scene_func(#"hash_4c4df92bd76b4be6", &namespace_b7cfe907::function_a641ac8b, "gear_up_pt02");
    scene::remove_scene_func(#"hash_45e2dd5c24266fcf", &function_d4337a8d, "approaching_firebase");
    scene::remove_scene_func(#"hash_45e2dd5c24266fcf", &function_7429a059, "precheck");
    scene::remove_scene_func(#"hash_69b8e06afe12b8f9", &function_88216172, "init");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x7fc0badb, Offset: 0x8028
// Size: 0x9c
function function_b1b08de() {
    level endon(#"hash_4d46078cfbdcc621");
    var_a4974804 = vehicle::simple_spawn("flying_last_haskins_convoy");
    array::thread_all(var_a4974804, &function_ebd340e1);
    var_4da89348 = vehicle::simple_spawn("flying_shore_boat");
    array::thread_all(var_4da89348, &function_3a4f35e8);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x178e1576, Offset: 0x80d0
// Size: 0xe4
function function_ebd340e1() {
    self endon(#"death");
    level endon(#"hash_4d46078cfbdcc621");
    self thread vehicle::go_path();
    self vehicle::pause_path();
    level waittill(#"hash_3442258823c9b167");
    self vehicle::lights_on();
    self vehicle::toggle_force_driver_taillights(1);
    self vehicle::toggle_sounds(1);
    self vehicle::toggle_exhaust_fx(1);
    self thread vehicle::resume_path();
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x7cc490a7, Offset: 0x81c0
// Size: 0xe4
function function_3a4f35e8() {
    self endon(#"death");
    level endon(#"hash_4d46078cfbdcc621");
    self thread vehicle::go_path();
    self vehicle::pause_path();
    level waittill(#"hash_48e8c654a7efb0e8");
    self vehicle::lights_on();
    self vehicle::toggle_force_driver_taillights(1);
    self vehicle::toggle_sounds(1);
    self vehicle::toggle_exhaust_fx(1);
    self thread vehicle::resume_path();
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x329e5939, Offset: 0x82b0
// Size: 0x3c
function function_38197823() {
    level waittill(#"hash_2db50a1c92ceda2e");
    snd::function_7db65a93(#"hash_5afc55d02e0ee09e");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xfb0d8465, Offset: 0x82f8
// Size: 0x5c
function function_24cba40() {
    level waittill(#"hash_1a97a982320ab27a");
    snd::function_7db65a93(#"hash_443b18ddc7cacdc4");
    level namespace_b7cfe907::function_abeb9b2d(1, 2);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x0
// Checksum 0x5e82bd1b, Offset: 0x8360
// Size: 0x44
function function_d3f013d7() {
    music::setmusicstate("death");
    playsoundatposition(#"hash_12f61c9ed705c06b", (0, 0, 0));
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 4, eflags: 0x2 linked
// Checksum 0x66006f5b, Offset: 0x83b0
// Size: 0x3e0
function function_e2df4629(var_74056fba, start_flag, var_887853be, max_drones) {
    if (isdefined(start_flag)) {
        level flag::wait_till_any([start_flag, "flag_intro_cleanup_runners", "flag_intro_base_cleanup"]);
    }
    if (!level flag::get_all(["flag_intro_cleanup_runners", "flag_intro_base_cleanup"])) {
        spawners = getspawnerarray(var_74056fba, "targetname");
        drones = spawner::simple_spawn(spawners);
        foreach (drone in drones) {
            drone namespace_4e75a347::function_cab4b520("alert");
        }
        while (true) {
            s_waitresult = level waittill(var_887853be, #"hash_4affce8b3ea8ab6d", #"hash_4d46078cfbdcc621");
            if (s_waitresult._notify == "flag_intro_base_cleanup" || s_waitresult._notify == "flag_intro_cleanup_runners") {
                break;
            }
            level flag::wait_till_any_timeout(randomfloatrange(0.25, 0.5), ["flag_intro_cleanup_runners", "flag_intro_base_cleanup"]);
            if (level flag::get_any(["flag_intro_cleanup_runners", "flag_intro_base_cleanup"])) {
                break;
            }
            arrayremovevalue(drones, undefined);
            if (drones.size <= max_drones) {
                drone = spawner::simple_spawn_single(array::random(spawners));
                drone namespace_4e75a347::function_cab4b520("alert");
                if (!isdefined(drones)) {
                    drones = [];
                } else if (!isarray(drones)) {
                    drones = array(drones);
                }
                drones[drones.size] = drone;
                waitframe(1);
            }
        }
        foreach (drone in drones) {
            if (isdefined(drone)) {
                drone delete();
            }
        }
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x90b19e7d, Offset: 0x8798
// Size: 0x260
function function_3705ef2f(wait_flag) {
    if (isdefined(wait_flag)) {
        level flag::wait_till_any([wait_flag, "flag_intro_base_cleanup"]);
    }
    if (!level flag::get("flag_intro_base_cleanup")) {
        var_576fb569 = getvehiclenodearray("intro_ambient_vehicle_outer_start_node", "targetname");
        var_2c4dfb60 = array("vehicle_t9_mil_us_truck_m35_canvas_cp", "vehicle_t9_mil_us_truck_m35_tanker_cp", "vehicle_t9_mil_us_truck_m35_cargo_cp");
        str_notify = "spawn_new_outer_truck";
        var_3195dfe3 = "flag_intro_truck_flyaway_occupied";
        wait(5);
        var_efbe0740 = vehicle::simple_spawn("flyin_leave_trucks");
        array::thread_all(var_efbe0740, &function_a515aac6, 1);
        level flag::wait_till_any(["flag_intro_trucks_start", "flag_intro_base_cleanup"]);
        if (!level flag::get("flag_intro_base_cleanup")) {
            level thread function_7fabe565(str_notify, var_576fb569, var_2c4dfb60, var_3195dfe3, 1);
            foreach (var_ff72be84 in var_efbe0740) {
                if (isdefined(var_ff72be84)) {
                    var_ff72be84 thread function_b4dd21d4(str_notify);
                    var_ff72be84 thread vehicle::go_path();
                }
            }
        }
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x0
// Checksum 0xc6dca38f, Offset: 0x8a00
// Size: 0x28c
function function_c81e0f3f(*var_d3440450, *var_50cc0d4f) {
    var_a129a5ee = getent("trigger_oob_firebase_to_branch", "targetname");
    thread function_d97a8605();
    thread function_b53b7c30(34);
    a_ents = [];
    if (isdefined(level.var_52874eb2)) {
        a_ents[#"hash_4441cc1284fe31e6"] = level.var_52874eb2;
    }
    if (isdefined(level.var_da19489d)) {
        a_ents[#"hash_505d54dd2b523ca3"] = level.var_da19489d;
    }
    level thread scene::play(#"hash_3dd341991cbe55b0", "approaching_firebase", a_ents);
    level thread scene::play(#"hash_48cd9e602ec868e7");
    var_a129a5ee triggerenable(0);
    level flag::set("flag_intro_base_cleanup");
    a_ents = [];
    a_ents[#"vip"] = level.vip;
    a_ents[#"buddy"] = level.buddy;
    a_ents[#"pilot"] = level.pilot;
    a_ents[#"copilot"] = level.copilot;
    a_ents[#"hash_4972abe0166bbc73"] = level.var_7466d419;
    level.player util::delay(5, undefined, &camerasetlookat, level.var_52874eb2);
    level scene::play(#"hash_45e2dd5c24266fcf", "approaching_firebase", a_ents);
    namespace_b7cfe907::function_1c2abcda();
    skipto::function_4e3ab877("armada_flyin_beach");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x2 linked
// Checksum 0x643fbff3, Offset: 0x8c98
// Size: 0x6c
function function_b53b7c30(wait_time) {
    setdvar(#"cg_viewvehicleinfluencegunner", (1, 1, 1));
    wait(wait_time);
    setdvar(#"cg_viewvehicleinfluencegunner", (0.1, 1, 0));
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xfb5926f8, Offset: 0x8d10
// Size: 0xcc
function function_d97a8605() {
    level flag::wait_till("flag_firebase_base_intro_exploders");
    level flag::wait_till("flag_firebase_base_enemy_trucks_start");
    vehicle::add_spawn_function_group("firebase_arrival_spawner_enemey_road_truck", "targetname", &function_7e705caf);
    vehicle::simple_spawn_and_drive("firebase_arrival_spawner_enemey_road_truck");
    thread function_49aeb63a();
    level flag::wait_till("flag_firebase_enemy_cliff_start");
    thread function_20c273a1();
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x0
// Checksum 0xd814aa13, Offset: 0x8de8
// Size: 0x264
function function_67f53057(*var_d3440450, *var_50cc0d4f) {
    level flag::wait_till("flag_armada_player_chopper_spawned");
    callback::on_player_damage(&namespace_b7cfe907::function_38a76cc5);
    var_802ba9ea = struct::get("obj_firebase", "targetname");
    level thread objectives::goto("armada_obj_intro_defend_firebase", var_802ba9ea, #"hash_19a45c5bffdb799b");
    level objectives::function_67f87f80("armada_obj_intro_defend_firebase", undefined, #"hash_6e75fb2a7203f21f");
    thread function_ca46ecf9();
    a_ents = [];
    if (isdefined(level.var_52874eb2)) {
        a_ents[#"hash_4441cc1284fe31e6"] = level.var_52874eb2;
    }
    if (isdefined(level.var_da19489d)) {
        a_ents[#"hash_505d54dd2b523ca3"] = level.var_da19489d;
    }
    level thread scene::play(#"hash_3dd341991cbe55b0", "approaching_firebase_pt2");
    a_ents = [];
    a_ents[#"vip"] = level.vip;
    a_ents[#"buddy"] = level.buddy;
    a_ents[#"hash_4972abe0166bbc73"] = level.var_7466d419;
    level scene::play(#"hash_45e2dd5c24266fcf", "approaching_firebase_pt2", a_ents);
    namespace_b7cfe907::function_1c2abcda();
    level notify(#"hash_5785c9d099726172");
    objectives::complete("armada_obj_intro_defend_firebase", var_802ba9ea);
    skipto::function_4e3ab877("armada_flyin_firebase");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xe5457b38, Offset: 0x9058
// Size: 0x22c
function function_ca46ecf9() {
    level flag::wait_till("flag_firebase_ally_cobra_entrance");
    function_ddf0c097();
    level flag::wait_till("flag_firebase_ally_littlebird_entrance");
    thread function_f56d55e3();
    wait(1.5);
    level spawner::simple_spawn("firebase_arrival_spawner_enemy_cliff_solider", &function_c66e98bf);
    level flag::wait_till("flag_firebase_ally_bunker_start");
    level flag::wait_till("flag_firebase_ally_heli_entrance");
    level thread function_188f0d9e();
    wait(2);
    level flag::wait_till("flag_firebase_enemy_cliff_to_trench_spawn");
    level spawner::simple_spawn("firebase_arrival_spawner_enemy_cliff_trench_transition", &function_8bad9c5d);
    level flag::wait_till("flag_firebase_enemy_cliff_despawn");
    wait(1.5);
    level flag::wait_till("flag_firebase_enemy_trench");
    level spawner::simple_spawn("firebase_arrival_spawner_enemy_trench_solider", &function_267a1d12);
    level spawner::simple_spawn("firebase_arrival_spawner_ally_trench_solider", &function_e2697bde);
    thread function_fe25ebb();
    level flag::wait_till("flag_firebase_trench_littlebird_spawn");
    function_82bec60b();
    level flag::wait_till("flag_firebase_approach_complete");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x0
// Checksum 0xf071c83c, Offset: 0x9290
// Size: 0xa6
function function_535f1a04() {
    level endon(#"hash_5785c9d099726172");
    level.player endon(#"death");
    level.var_7466d419 endon(#"death");
    while (true) {
        iprintlnbold("Player health: " + level.player.health + " Chopper Health: " + level.var_7466d419.health);
        wait(1);
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x63cd4361, Offset: 0x9340
// Size: 0x176
function function_49aeb63a() {
    var_3744c167 = getentarray("firebase_arrival_spawner_enemey_road_truck", "targetname");
    level.var_4d1fc307 = [];
    foreach (truck in var_3744c167) {
        if (isdefined(truck.script_noteworthy)) {
            switch (truck.script_noteworthy) {
            case #"hash_5f1c4271b44a354a":
                thread function_5a9f70a0("firebase_arrival_spawner_enemy_road_solider_truck_end_01", "firebase_arrival_road_enemy_truck_01_end");
                break;
            case #"hash_5f1c4171b44a3397":
                thread function_5a9f70a0("firebase_arrival_spawner_enemy_road_solider_truck_end_02", "firebase_arrival_road_enemy_truck_02_end");
                break;
            case #"hash_5f1c3f71b44a3031":
                thread function_5a9f70a0("firebase_arrival_spawner_enemy_road_solider_truck_end_04", "firebase_arrival_road_enemy_truck_04_end");
                break;
            }
        }
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x2 linked
// Checksum 0xac97d117, Offset: 0x94c0
// Size: 0x128
function function_5a9f70a0(spawner_name, script_notify) {
    self waittill(script_notify);
    var_271de830 = level spawner::simple_spawn(spawner_name, &function_8c53017d);
    level flag::wait_till("flag_firebase_road_enemy_despawn");
    function_1eaaceab(var_271de830);
    arrayremovevalue(var_271de830, undefined);
    foreach (var_b66f958d in var_271de830) {
        var_b66f958d delete();
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x67018bac, Offset: 0x95f0
// Size: 0xa4
function function_7e705caf() {
    self endon(#"death");
    waitframe(1);
    self.script_startinghealth = 8500;
    self.health = 8500;
    self.script_crashtypeoverride = "ground_vehicle_on_spline";
    waitframe(1);
    self.do_scripted_crash = 1;
    self thread function_abaeb1f1();
    level flag::wait_till("flag_firebase_road_enemy_despawn");
    self delete();
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xeb6e42c3, Offset: 0x96a0
// Size: 0x134
function function_abaeb1f1() {
    self waittill(#"death");
    weapon = getweapon(#"hash_513c26c6a751d20e");
    min_distance = 62500;
    foreach (var_956bb363 in level.var_4d1fc307) {
        if (isdefined(var_956bb363)) {
            distance = distancesquared(self.origin, var_956bb363.origin);
            if (distance < min_distance) {
                var_956bb363 kill();
            }
        }
    }
    function_1eaaceab(level.var_4d1fc307);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xfcc8a19, Offset: 0x97e0
// Size: 0x84
function function_8c53017d() {
    level.var_4d1fc307[level.var_4d1fc307.size] = self;
    self.script_accuracy = 25;
    self setentitytarget(level.player, 1);
    self.grenadeammo = 0;
    self endon(#"death");
    self thread namespace_b7cfe907::delete_on_flag("flag_firebase_road_enemy_despawn");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xdb634b66, Offset: 0x9870
// Size: 0xc8
function function_ddf0c097() {
    cobras = level vehicle::simple_spawn_and_drive("firebase_arrival_spawner_ally_road_cobra");
    foreach (gunship in cobras) {
        gunship thread namespace_b7cfe907::function_53c06d6e();
        gunship function_60d50ea4();
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xa0a61998, Offset: 0x9940
// Size: 0xe4
function function_c66e98bf() {
    self.grenadeammo = 0;
    self.script_accuracy = 1000;
    self.ignoreall = 1;
    self endon(#"death");
    self thread namespace_b7cfe907::delete_on_flag("flag_firebase_enemy_cliff_despawn");
    if (isdefined(self.script_noteworthy) && self.script_noteworthy == "chopper_attacker") {
        trigger = getent(self.var_23da1376, "targetname");
        trigger waittill(#"trigger");
        self.ignoreall = 0;
        self setentitytarget(level.player, 1);
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xd9f60bbe, Offset: 0x9a30
// Size: 0x2ac
function function_20c273a1() {
    level endon(#"hash_5785c9d099726172");
    level.var_bc8550ea = [];
    while (!level flag::get("flag_firebase_ally_bunker_start")) {
        arrayremovevalue(level.var_bc8550ea, undefined);
        var_d4b5c88e = getentarray("firebase_arrival_spawner_enemy_cliff_solider_drone_group_1", "targetname");
        var_715501ce = getentarray("firebase_arrival_spawner_enemy_cliff_solider_drone_group_2", "targetname");
        var_61ac62b5 = getentarray("firebase_arrival_spawner_enemy_cliff_solider_drone_group_3", "targetname");
        var_9df3db0b = getentarray("firebase_arrival_spawner_enemy_cliff_solider_drone_group_4", "targetname");
        var_8fac3e7c = getentarray("firebase_arrival_spawner_enemy_cliff_solider_drone_group_5", "targetname");
        spawn_delay = 2;
        group = level spawner::simple_spawn(var_d4b5c88e, &function_fccd2779);
        level.var_3d50c11b[level.var_bc8550ea.size] = group;
        wait(spawn_delay);
        group = level spawner::simple_spawn(var_715501ce, &function_fccd2779);
        level.var_3d50c11b[level.var_bc8550ea.size] = group;
        wait(spawn_delay);
        group = level spawner::simple_spawn(var_61ac62b5, &function_fccd2779);
        level.var_3d50c11b[level.var_bc8550ea.size] = group;
        wait(spawn_delay);
        group = level spawner::simple_spawn(var_9df3db0b, &function_fccd2779);
        level.var_3d50c11b[level.var_bc8550ea.size] = group;
        wait(spawn_delay);
        group = level spawner::simple_spawn(var_8fac3e7c, &function_fccd2779);
        level.var_3d50c11b[level.var_bc8550ea.size] = group;
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x7efc820c, Offset: 0x9ce8
// Size: 0xcc
function function_fccd2779() {
    level.var_bc8550ea[level.var_bc8550ea.size] = self;
    var_8b0fd67e = randomfloatrange(0.75, 1);
    self.drone.moveplaybackrate = var_8b0fd67e;
    level flag::wait_till("flag_firebase_enemy_cliff_despawn");
    if (isdefined(self) && self.health > 0) {
        self kill();
    }
    wait(1.4);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xb33a4770, Offset: 0x9dc0
// Size: 0x1a6
function function_f56d55e3() {
    spawner = level vehicle::simple_spawn_and_drive("firebase_arrival_spawner_cliff_friendly_littlebird");
    var_dd4aa81d = getent("lb_01_target_01", "targetname");
    var_af91cca8 = getent("lb_02_target_01", "targetname");
    foreach (littlebirds in spawner) {
        littlebirds thread namespace_b7cfe907::function_53c06d6e();
        littlebirds function_60d50ea4();
        if (isdefined(littlebirds.script_noteworthy)) {
            switch (littlebirds.script_noteworthy) {
            case #"hash_1c366d4d206df5a5":
                littlebirds thread function_903f2e76(var_dd4aa81d, 2.5);
                break;
            case #"hash_1c366a4d206df08c":
                littlebirds thread function_903f2e76(var_af91cca8, 2.5);
                break;
            }
        }
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x2 linked
// Checksum 0x350de161, Offset: 0x9f70
// Size: 0xdc
function function_903f2e76(var_6003262d, fire_time) {
    self endon(#"death");
    self waittill(#"hash_688f3a473e5d0a38");
    self turretsettarget(1, var_6003262d);
    self turretsettarget(2, var_6003262d);
    self thread vehicle_ai::fire_for_time(fire_time, 1, var_6003262d);
    self thread vehicle_ai::fire_for_time(fire_time, 2, var_6003262d);
    self turretcleartarget(1);
    self turretcleartarget(2);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x3b3dd4fa, Offset: 0xa058
// Size: 0x150
function function_fe25ebb() {
    level endon(#"hash_5785c9d099726172");
    level.var_4a9b655c = [];
    var_758c1be3 = 14;
    var_3c42c434 = randomfloatrange(0.75, 1.5);
    spawner::add_spawn_function_group("firebase_arrival_spawner_enemy_trench_solider_drone", "targetname", &function_891263de);
    var_af1f5f1 = getspawnerarray("firebase_arrival_spawner_enemy_trench_solider_drone", "targetname");
    while (!flag::get("flag_firebase_trench_littlebird_spawn")) {
        function_1eaaceab(level.var_4a9b655c);
        if (level.var_4a9b655c.size < var_758c1be3) {
            var_e47bd9e8 = array::random(var_af1f5f1);
            var_8be09689 = spawner::simple_spawn(var_e47bd9e8);
        }
        wait(var_3c42c434);
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x9d0c02e5, Offset: 0xa1b0
// Size: 0x5c
function function_891263de() {
    level.var_4a9b655c[level.var_4a9b655c.size] = self;
    self endon(#"death");
    level waittill(#"hash_70ebdd9b5272c930");
    wait(1);
    self delete();
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xc43d55aa, Offset: 0xa218
// Size: 0x1b4
function function_267a1d12() {
    self.grenadeammo = 0;
    self endon(#"death");
    if (isdefined(self.script_noteworthy) && self.script_noteworthy == "trench_chopper_attacker") {
        self.script_accuracy = 125;
        trigger = getent(self.var_ff2b3d8a, "targetname");
        trigger waittill(#"trigger");
        self.ignoreall = 0;
        self setentitytarget(level.player, 1);
    } else if (isdefined(self.script_noteworthy) && self.script_noteworthy == "trench_entrance") {
        self setentitytarget(level.player, 1);
        trigger = getent(self.var_ff2b3d8a, "targetname");
        trigger waittill(#"trigger");
        var_63e464d1 = getent("info_vol_trench_enemy_position_02", "targetname");
        wait(5.5);
        self setgoal(var_63e464d1);
    }
    level waittill(#"hash_694afd05742a031b");
    self kill();
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xf78239dd, Offset: 0xa3d8
// Size: 0xc4
function function_8bad9c5d() {
    self.grenadeammo = 0;
    self endon(#"death");
    if (isdefined(self.script_noteworthy) && self.script_noteworthy == "trench_runner") {
        self.ignoreall = 1;
        self waittill(#"goal");
        self.ignoreall = 0;
        self setentitytarget(level.player, 1);
    }
    level waittill(#"hash_694afd05742a031b");
    wait(1);
    self kill();
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x542d5689, Offset: 0xa4a8
// Size: 0x94
function function_e2697bde() {
    self.grenadeammo = 0;
    self.script_accuracy = 0.15;
    self util::magic_bullet_shield();
    self endon(#"death");
    level flag::wait_till("flag_firebase_approach_complete");
    self util::stop_magic_bullet_shield();
    self delete();
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xda1d59e3, Offset: 0xa548
// Size: 0xc0
function function_188f0d9e() {
    var_b8a343ea = vehicle::simple_spawn_and_drive("firebase_arrival_spawner_ally_trench_helicopter");
    foreach (chopper in var_b8a343ea) {
        chopper namespace_b7cfe907::function_53c06d6e();
        chopper function_60d50ea4();
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x75e44642, Offset: 0xa610
// Size: 0x1fe
function function_82bec60b() {
    spawner = level vehicle::simple_spawn_and_drive("firebase_arrival_spawner_ally_trench_cobra");
    var_ad0b0321 = getent("t_gs01_t01", "targetname");
    var_2a30fd77 = getent("t_gs01_t02", "targetname");
    var_3875fce7 = getent("t_gs02_t01", "targetname");
    var_a3ca075 = getent("t_gs02_t02", "targetname");
    foreach (gunship in spawner) {
        gunship thread namespace_b7cfe907::function_53c06d6e();
        gunship function_60d50ea4();
        if (isdefined(gunship.script_noteworthy)) {
            switch (gunship.script_noteworthy) {
            case #"hash_4b32ffd1558c840a":
                gunship thread function_c4d91c06(var_3875fce7, var_a3ca075, var_ad0b0321, var_2a30fd77);
                break;
            case #"hash_4b32fed1558c8257":
                gunship thread function_c4d91c06(var_3875fce7, var_a3ca075, var_ad0b0321, undefined, "gunship_02_road_rockets_complete");
                break;
            }
        }
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 5, eflags: 0x2 linked
// Checksum 0xcea29ddd, Offset: 0xa818
// Size: 0x16e
function function_c4d91c06(var_8bb4b3f5, var_81769f79, var_fff01c66, var_2e2ef8e3, level_notify) {
    self endon(#"death");
    if (isdefined(var_8bb4b3f5)) {
        self waittill(#"hash_5eb7693ca5c5d7c");
        self thread namespace_b7cfe907::function_f48ca525(var_8bb4b3f5, "tag_flash3");
    }
    if (isdefined(var_81769f79)) {
        self waittill(#"hash_5eb7993ca5c6295");
        self thread namespace_b7cfe907::function_f48ca525(var_81769f79, "tag_flash4");
    }
    if (isdefined(var_fff01c66)) {
        self waittill(#"hash_5eb7893ca5c60e2");
        self thread namespace_b7cfe907::function_f48ca525(var_fff01c66, "tag_flash3");
    }
    if (isdefined(var_2e2ef8e3)) {
        self waittill(#"hash_5eb7393ca5c5863");
        self thread namespace_b7cfe907::function_f48ca525(var_2e2ef8e3, "tag_flash4");
    }
    self thread namespace_b7cfe907::function_f48ca525(var_2e2ef8e3, "tag_flash4");
    if (isdefined(level_notify)) {
        level notify(level_notify);
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x0
// Checksum 0x56fbcad4, Offset: 0xa990
// Size: 0x20c
function function_90b53888(*var_d3440450, *var_50cc0d4f) {
    a_ents = [];
    if (isdefined(level.var_52874eb2)) {
        a_ents[#"hash_4441cc1284fe31e6"] = level.var_52874eb2;
    }
    if (isdefined(level.var_da19489d)) {
        a_ents[#"hash_505d54dd2b523ca3"] = level.var_da19489d;
    }
    level thread scene::play(#"hash_685d9366db60f4e6", a_ents);
    a_ents = [];
    a_ents[#"buddy"] = level.buddy;
    a_ents[#"hash_4972abe0166bbc73"] = level.var_7466d419;
    level scene::play(#"hash_2b12d20bc56156e9", a_ents);
    level scene::play(#"hash_7eda5092580dbf92", a_ents);
    org = struct::get("heli_spawn_fly_to_branch", "script_noteworthy");
    level.var_7466d419.origin = org.origin;
    level.var_7466d419.angles = org.angles;
    if (isdefined(level.weaponbasemeleeheld) && level.player hasweapon(level.weaponbasemeleeheld)) {
        level.player takeweapon(level.weaponbasemeleeheld);
    }
    flag::set("flag_firebase_checkin_complete");
    skipto::function_4e3ab877("armada_firebase_checkin");
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 1, eflags: 0x0
// Checksum 0xf0ac4272, Offset: 0xaba8
// Size: 0x4c
function function_4c73716e(*a_ents) {
    level.pilot ai::gun_remove();
    level.copilot ai::gun_remove();
    namespace_b7cfe907::function_1c2abcda();
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x0
// Checksum 0xaf162d97, Offset: 0xac00
// Size: 0x49c
function function_55a3220(var_d3440450, var_50cc0d4f) {
    org = struct::get("heli_spawn_fly_to_branch", "script_noteworthy");
    level.var_7466d419.origin = org.origin;
    level.var_7466d419.angles = org.angles;
    level.player setplayerangles(org.angles);
    callback::remove_on_player_damage(&namespace_b7cfe907::function_38a76cc5);
    namespace_b7cfe907::function_d777fe61(0);
    var_a129a5ee = getent("trigger_oob_firebase_to_branch", "targetname");
    var_a129a5ee triggerenable(1);
    if (!is_true(var_50cc0d4f)) {
        if (!isdefined(level.buddy)) {
            thread namespace_b7cfe907::function_ed68628c(1);
        }
        if (!isdefined(level.buddy.var_ec30f5da)) {
            vehicle::get_in(level.buddy, level.var_7466d419, "crew");
        }
        if (is_true(level.buddy.gun_removed)) {
            level.buddy ai::gun_recall();
        }
    }
    level thread function_548f49fd();
    level flag::clear("flag_player_flying_ambience_kill");
    level flag::set("flag_player_flying_ambience_start");
    level flag::clear("flag_player_chopper_screenshake_active");
    var_368e1037 = struct::get("obj_fly_to_branch_checkpoint_01", "targetname");
    var_9a89095b = struct::get("obj_fly_to_branch_checkpoint_02", "targetname");
    var_432ab03d = struct::get("obj_fly_to_branch_reach", "targetname");
    level objectives::goto("armada_obj_fly_to_mortar", var_368e1037.origin, #"hash_4a4781bc1af428d0", 1);
    level objectives::function_67f87f80("armada_obj_fly_to_mortar", undefined, #"hash_106c2eff717a77c8");
    level flag::wait_till("flag_fly_to_branch_objective_01");
    level thread objectives::function_60645c02("armada_obj_fly_to_mortar", var_9a89095b.origin);
    level flag::wait_till("flag_fly_to_branch_objective_02");
    level thread objectives::function_60645c02("armada_obj_fly_to_mortar", var_432ab03d.origin);
    level flag::wait_till("flag_fly_to_branch_trigger_ally_heli");
    level thread objectives::complete("armada_obj_fly_to_mortar");
    iprintlnbold("Adler crash scene");
    level flag::set("flag_vo_flying_ally_down_react");
    flag::set("flag_vo_flying_ally_down_choice");
    level skipto::function_4e3ab877(var_d3440450, 0);
    level skipto::function_51726ac8(["armada_fly_to_branch_reached"], 0, level.player);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xfc684fd4, Offset: 0xb0a8
// Size: 0x364
function function_548f49fd() {
    level.player endon(#"disconnect", #"death");
    level.var_7466d419 endon(#"death", #"crashing");
    level flag::init("flag_fly_to_branch_player_moved_left_stick");
    level flag::init("flag_fly_to_branch_player_moved_right_stick");
    level flag::init("flag_fly_to_branch_player_moved_both_sticks");
    level flag::init("flag_fly_to_branch_player_used_height");
    level thread function_e0598f16("left_stick", "flag_fly_to_branch_player_moved_left_stick", "player_moved");
    level thread function_e0598f16("right_stick", "flag_fly_to_branch_player_moved_right_stick", "player_turned");
    level thread function_e0598f16("height", "flag_fly_to_branch_player_used_height", "player_used_height");
    wait(1);
    if (level flag::get("flag_fly_to_branch_trigger_ally_heli")) {
        return;
    }
    if (!level flag::get("flag_fly_to_branch_player_moved_left_stick") || !level flag::get("flag_fly_to_branch_player_moved_right_stick")) {
        hint_tutorial::function_4c2d4fc4(#"hash_a7ac2ae0aa75b62", #"hash_746bba5dae7f3eaf");
        level thread function_8d3184fa(["flag_fly_to_branch_player_moved_left_stick", "flag_fly_to_branch_player_moved_right_stick"], "flag_fly_to_branch_player_moved_both_sticks");
        level flag::wait_till_any_timeout(15, ["flag_fly_to_branch_player_moved_both_sticks", "flag_fly_to_branch_trigger_ally_heli"]);
        hint_tutorial::function_9f427d88(5);
    }
    wait(2);
    if (!level flag::get("flag_fly_to_branch_player_used_height") && !level flag::get("flag_fly_to_branch_trigger_ally_heli")) {
        hint_tutorial::function_4c2d4fc4(#"hash_4d1a07a1e7f2e8f8", #"hash_746bba5dae7f3eaf");
        level flag::wait_till_any_timeout(15, ["flag_fly_to_branch_player_used_height", "flag_fly_to_branch_trigger_ally_heli"]);
        hint_tutorial::function_9f427d88(2);
    }
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x2 linked
// Checksum 0xaed9b060, Offset: 0xb418
// Size: 0x44
function function_8d3184fa(var_3cc9b800, var_335a8dcc) {
    level flag::wait_till_all(var_3cc9b800);
    level flag::set(var_335a8dcc);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 3, eflags: 0x2 linked
// Checksum 0x7a5ebb6d, Offset: 0xb468
// Size: 0x1cc
function function_e0598f16(input, var_aff9d4d0, var_8c5bec46) {
    level.player endon(#"disconnect", #"death");
    level.var_7466d419 endon(#"death", #"crashing");
    if (input == "left_stick" || input == "right_stick") {
        if (input == "left_stick") {
            var_7d0e0dac = &orbit::function_b7ead280;
        } else if (input == "right_stick") {
            var_7d0e0dac = &orbit::function_5cf12924;
        }
        for (var_2e35e6c1 = [[ var_7d0e0dac ]](); var_2e35e6c1[0] == 0 && var_2e35e6c1[1] == 0; var_2e35e6c1 = [[ var_7d0e0dac ]]()) {
            wait(0.05);
        }
    } else if (input == "height") {
        while (!level.player attackbuttonpressed() && !level.player adsbuttonpressed()) {
            wait(0.05);
        }
    }
    level flag::set(var_aff9d4d0);
    level.player notify(var_8c5bec46);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x0
// Checksum 0x26b9338b, Offset: 0xb640
// Size: 0x274
function function_216af582(*var_d3440450, *var_50cc0d4f) {
    level flag::wait_till("flag_armada_player_chopper_spawned");
    namespace_b7cfe907::function_d777fe61(0);
    var_8bd1af86 = struct::get("obj_branch_reached_mortar_choice", "targetname");
    var_d62ba599 = struct::get("obj_branch_reached_mortar_entrance", "targetname");
    level objectives::goto("armada_obj_fly_to_mortar", var_8bd1af86.origin, #"hash_4a4781bc1af428d0", 1);
    level objectives::function_67f87f80("armada_obj_fly_to_mortar", undefined, #"hash_106c2eff717a77c8");
    level flag::wait_till("flag_fly_to_branch_reached_mortar_choice");
    level objectives::goto("armada_obj_fly_to_mortar", var_d62ba599.origin, #"hash_4a4781bc1af428d0", 1);
    next_obj = undefined;
    level flag::wait_till("flag_mortar_start");
    level flag::set("flag_orbit_mortar_started");
    level flag::set("flag_vo_mortar_orbit_start");
    next_obj = "armada_mortar_orbit";
    level thread armada_mortar::function_110866d(1);
    level thread objectives::complete("armada_obj_fly_to_mortar");
    level skipto::function_4e3ab877("armada_fly_to_branch_reached", 0);
    level skipto::function_51726ac8([next_obj], 0, level.player);
    snd::stop(level.var_4dcf3b93, 2);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x0
// Checksum 0xd5eaefa0, Offset: 0xb8c0
// Size: 0xdc
function function_6eb72af2(var_d3440450, *var_50cc0d4f) {
    namespace_b7cfe907::function_d777fe61(0);
    level thread function_d428a291();
    level thread function_27fafffc();
    level flag::clear("flag_player_flying_ambience_start");
    level flag::set("flag_player_flying_ambience_kill");
    namespace_b7cfe907::function_9c308f91();
    trigger::wait_till("trig_reached_firebase");
    skipto::function_4e3ab877(var_50cc0d4f);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0xb8b43f4, Offset: 0xb9a8
// Size: 0x334
function function_d428a291() {
    var_802ba9ea = struct::get("obj_fly_3_return_01_m", "targetname");
    level thread objectives::goto("armada_obj_fly_to_firebase", var_802ba9ea, #"hash_5483ae2de22e69c8");
    level flag::wait_till("flag_obj_fly_3_return_01_m");
    objectives::complete("armada_obj_fly_to_firebase", var_802ba9ea);
    var_802ba9ea = struct::get("obj_fly_3_return_02", "targetname");
    level thread objectives::goto("armada_obj_fly_to_firebase", var_802ba9ea, #"hash_5483ae2de22e69c8");
    level flag::wait_till("flag_obj_fly_3_return_02");
    objectives::complete("armada_obj_fly_to_firebase", var_802ba9ea);
    var_802ba9ea = struct::get("obj_fly_3_return_03", "targetname");
    level thread objectives::goto("armada_obj_fly_to_firebase", var_802ba9ea, #"hash_5483ae2de22e69c8");
    level flag::wait_till("flag_obj_fly_3_return_03");
    objectives::complete("armada_obj_fly_to_firebase", var_802ba9ea);
    var_802ba9ea = struct::get("obj_fly_3_return_04", "targetname");
    level thread objectives::goto("armada_obj_fly_to_firebase", var_802ba9ea, #"hash_5483ae2de22e69c8");
    level flag::wait_till("flag_obj_fly_3_return_04");
    objectives::complete("armada_obj_fly_to_firebase", var_802ba9ea);
    var_802ba9ea = struct::get("obj_fly_3_return_05", "targetname");
    level thread objectives::goto("armada_obj_fly_to_firebase", var_802ba9ea, #"hash_5483ae2de22e69c8");
    level flag::wait_till("flag_obj_fly_3_return_05");
    objectives::complete("armada_obj_fly_to_firebase", var_802ba9ea);
    var_802ba9ea = struct::get("obj_firebase", "targetname");
    level thread objectives::goto("armada_obj_fly_to_firebase", var_802ba9ea, #"hash_5483ae2de22e69c8");
    trigger::wait_till("trig_reached_firebase");
    objectives::complete("armada_obj_fly_to_firebase", var_802ba9ea);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x80f724d1, Offset: 0xbce8
// Size: 0x4
function function_27fafffc() {
    
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 2, eflags: 0x0
// Checksum 0x61474bde, Offset: 0xbcf8
// Size: 0x7c
function function_78be51a6(var_d3440450, *var_50cc0d4f) {
    level thread function_9137167f();
    level thread function_72cfe867();
    level flag::wait_till("flag_obj_firebase_defend_complete");
    wait(5);
    skipto::function_4e3ab877(var_50cc0d4f);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x35ffa0dc, Offset: 0xbd80
// Size: 0x2dc
function function_9137167f() {
    /#
        iprintlnbold("idle_03");
    #/
    var_db1c0995 = struct::get("firebase_defend_obj_trench", "targetname");
    var_a7dafa1d = struct::get("firebase_defend_obj_cliff", "targetname");
    var_61e6d791 = struct::get("firebase_defend_obj_road", "targetname");
    var_729580af = struct::get("firebase_defend_obj_entrance", "targetname");
    /#
        iprintlnbold("relax_to_ready");
    #/
    level thread objectives::goto("armada_obj_firebase_defend", var_db1c0995, #"hash_19a45c5bffdb799b");
    wait(5);
    objectives::complete("armada_obj_firebase_defend", var_db1c0995);
    /#
        iprintlnbold("liftoff_to_turn_02");
    #/
    level thread objectives::goto("armada_obj_firebase_defend", var_a7dafa1d, #"hash_19a45c5bffdb799b");
    wait(5);
    objectives::complete("armada_obj_firebase_defend", var_a7dafa1d);
    /#
        iprintlnbold("intro_guys_mid_node");
    #/
    level thread objectives::goto("armada_obj_firebase_defend", var_61e6d791, #"hash_19a45c5bffdb799b");
    wait(5);
    objectives::complete("armada_obj_firebase_defend", var_61e6d791);
    /#
        iprintlnbold("armada_flyin");
    #/
    level thread objectives::goto("armada_obj_firebase_defend", var_729580af, #"hash_19a45c5bffdb799b");
    wait(5);
    objectives::complete("armada_obj_firebase_defend", var_729580af);
    level flag::set("flag_obj_firebase_defend_complete");
    /#
        iprintlnbold("flag_intro_trucks_start");
    #/
    objectives::complete("armada_obj_firebase_defend", var_729580af);
}

// Namespace namespace_e871b49a/namespace_dbe8ebbb
// Params 0, eflags: 0x2 linked
// Checksum 0x80f724d1, Offset: 0xc068
// Size: 0x4
function function_72cfe867() {
    
}

