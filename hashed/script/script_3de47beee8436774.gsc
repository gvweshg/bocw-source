// Atian COD Tools GSC CW decompiler test
#using scripts\cp\cp_nam_armada.gsc;
#using script_3711e526ec2a3863;
#using script_25b0725f0d26dbf5;
#using script_32399001bdb550da;
#using script_48a4cce0f86a3f65;
#using script_4ae261b2785dda9f;
#using script_7d0013bbc05623b9;
#using scripts\cp_common\dialogue.gsc;
#using scripts\cp_common\util.gsc;
#using scripts\cp_common\objectives.gsc;
#using scripts\cp_common\snd.gsc;
#using scripts\cp_common\skipto.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\vehicleriders_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\turret_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\colors_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace armada_mortar;

// Namespace armada_mortar/namespace_e6855491
// Params 2, eflags: 0x2 linked
// Checksum 0x60b8e3f1, Offset: 0x2a30
// Size: 0xaf4
function function_6ad1ac64(var_d3440450, var_50cc0d4f) {
    util::function_3e65fe0b(0);
    level namespace_b7cfe907::function_d777fe61();
    level.player setorigin(struct::get("mortar_obj_landing_spot").origin);
    level.player val::set(#"hash_ed07d10944e0fd5", "freezecontrols", 1);
    level.player val::set(#"hash_680eb654d9e9d2ad", "show_hud", 0);
    level.player setnosunshadow();
    level.player util::create_streamer_hint((-22405, 41199, 880), (14, -21, 0), 1);
    level thread namespace_b7cfe907::function_2647f901("mortar_village_completed");
    if (var_50cc0d4f) {
        level util::delay(0.25, "disconnect", &namespace_b7cfe907::function_abeb9b2d, 1, 0);
        level namespace_b7cfe907::function_6a03d24d(var_d3440450);
    } else {
        level vehicle::get_in(level.buddy, level.var_7466d419, "crew", 1);
        level vehicle::get_in(level.pilot, level.var_7466d419, "driver", 1);
        level vehicle::get_in(level.copilot, level.var_7466d419, "passenger1", 1);
        level namespace_b7cfe907::function_28dd3085();
    }
    level thread function_92d60a9d();
    level thread namespace_722cc932::function_59656f55(1, 0, 0);
    level thread scene::init(#"hash_45aea7646e25ef1f");
    level thread scene::init(#"hash_1849fb3a90d16a1");
    level thread scene::init(#"hash_60671afc06cb038e");
    level thread scene::init(#"hash_7d136efada0c9af0");
    level thread scene::init(#"hash_72f8f56116f32b17");
    level thread scene::init(#"hash_35db7f3d2c472306");
    level thread scene::init(#"hash_5e055056aa386e1f");
    level thread scene::init(#"hash_6c7177a6718884b8");
    level thread scene::init(#"hash_1fb12697821542a1");
    level thread scene::init(#"hash_1464d638ee5e23aa");
    callback::on_ai_spawned(&function_e59c6d2a);
    level scene::function_27f5972e(#"hash_45aea7646e25ef1f");
    level clientfield::set("toggle_gameplay_character_visibility", 1);
    level clientfield::set("toggle_dynsignage_mortartown", 1);
    level thread function_ac42a1bb();
    level flag::set("flag_mortar_orbit_start");
    snd::function_7db65a93(#"hash_2b94ea847ae2b667");
    level thread namespace_b7cfe907::function_d3acba36(#"allies");
    level.var_52874eb2 = undefined;
    level function_6b5096fe();
    var_507c8182 = getvehiclenode("mortar_orbit_landing", "targetname");
    level thread function_9ca7e163();
    level thread function_e1c02ad2();
    level thread function_a1de7ea2(1);
    level flag::clear("flag_player_flying_ambience_start");
    level flag::set("flag_player_flying_ambience_kill");
    level flag::set("flag_vo_mortar_orbit_arrival_start");
    var_74dc28cf = getvehiclenode("mortar_orbit_player_start_node", "targetname");
    var_c7e452f5 = getvehiclenode("mortar_orbit_adler_start_node", "targetname");
    level.var_52874eb2.origin = var_c7e452f5.origin;
    level.var_52874eb2.angles = var_c7e452f5.angles;
    level.var_52874eb2 setspeedimmediate(0);
    level.var_52874eb2.drivepath = 1;
    level.var_7466d419.origin = var_74dc28cf.origin;
    level.var_7466d419.angles = var_74dc28cf.angles;
    level.var_7466d419 setspeedimmediate(0);
    level.var_7466d419.drivepath = 1;
    level.var_52874eb2 thread vehicle::get_on_path(var_c7e452f5);
    level.var_7466d419 thread vehicle::get_on_path(var_74dc28cf);
    level.var_1a2a8b6f = spawnstruct();
    level.var_1a2a8b6f.var_57a6f59c = util::spawn_model(#"tag_origin");
    level.var_1a2a8b6f.var_cfa81957 = function_d8afd6c7();
    level.var_7466d419.overridevehicledamage = &function_c343823c;
    level.overrideplayerdamage = &function_6760b772;
    level.player dialogue::queue("vox_cp_armd_00009_adlr_firsttimeperseu_cd");
    level objectives::scripted(#"hash_4911c9bd27e58ec4", undefined, #"hash_a1263ddeb213c22");
    level thread function_5985d444();
    level thread function_5901663e();
    level thread function_428180d();
    level thread function_1eb807e1();
    level.var_52874eb2 thread function_ba10e034();
    level.var_52874eb2 thread function_6cce8b8e();
    level.var_52874eb2 setspeedimmediate(75);
    level.var_52874eb2 thread vehicle::go_path();
    level.var_7466d419 thread function_19288a46();
    level.var_7466d419 thread function_6cce8b8e();
    level.var_7466d419 clientfield::set("" + #"hash_354296015ca81fd", 1);
    level.var_7466d419 setspeedimmediate(77);
    level.var_7466d419 vehicle::go_path();
    level flag::set("flag_orbit_mortar_allow_land");
    level thread function_7ed7f625();
    level.var_7466d419 vehicle::detach_path();
    waitframe(1);
    level.var_7466d419 vehicle::get_on_and_go_path(var_507c8182);
    level objectives::complete(#"hash_4911c9bd27e58ec4");
    if (isdefined(level.var_1a2a8b6f)) {
        level.var_1a2a8b6f.var_57a6f59c delete();
        level.var_1a2a8b6f struct::delete();
    }
    level.var_7466d419.overridevehicledamage = undefined;
    level.overrideplayerdamage = undefined;
    next_obj = "armada_mortar_start";
    savegame::function_379f84b3();
    level skipto::function_4e3ab877("armada_mortar_orbit", 0);
    level skipto::function_51726ac8([next_obj], 0, level.player);
    level clientfield::set("toggle_dynsignage_mortartown", 0);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x53bd913a, Offset: 0x3530
// Size: 0x2e
function function_e59c6d2a() {
    if (self.team === #"axis") {
        self.dontdropweapon = 1;
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xb22ad33e, Offset: 0x3568
// Size: 0x84
function function_5985d444() {
    wait(1);
    for (i = 0; i < 2; i++) {
        while (true) {
            ai = spawner::simple_spawn_single("sp_mortar_landing_vc", &function_d96fcf75, i);
            if (isdefined(ai)) {
                break;
            }
            waitframe(1);
        }
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x2990d859, Offset: 0x35f8
// Size: 0x5c
function function_d96fcf75(n_index) {
    self endon(#"death");
    if (n_index <= 0) {
        level.var_35f6b1e0 = self;
    } else {
        level.var_841a4e26 = self;
    }
    self function_b0db9d0f();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x6fa52b95, Offset: 0x3660
// Size: 0x1bc
function function_b0db9d0f() {
    self val::set(#"landing_vc", "ignoreall", 1);
    self val::set(#"landing_vc", "ignoreme", 1);
    self val::set(#"landing_vc", "hide", 1);
    self val::set(#"landing_vc", "takedamage", 0);
    self val::set(#"landing_vc", "allowdeath", 0);
    self.var_af613220 = util::spawn_model(#"tag_origin", self.origin, self.angles);
    self linkto(self.var_af613220);
    self thread util::delete_on_death_or_notify(self.var_af613220, #"hash_3d8430a495ffefcc");
    self clearforcedgoal();
    self cleargoalvolume();
    self function_d4c687c9();
    self clearpath();
}

// Namespace armada_mortar/namespace_e6855491
// Params 15, eflags: 0x2 linked
// Checksum 0xd9d4ec3c, Offset: 0x3828
// Size: 0x2b0
function function_c343823c(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, *vpoint, *vdir, shitloc, *vdamageorigin, *psoffsettime, *damagefromunderneath, *modelindex, *partname, *vsurfacenormal) {
    if (!isdefined(level.var_1a2a8b6f) || isgodmode(level.player) || !isdefined(vdamageorigin) || !isdefined(partname) || vdamageorigin util::is_on_side(self.team)) {
        return 0;
    }
    var_53bb8ef2 = level.var_1a2a8b6f;
    var_d5788a84 = 0;
    var_83af05db = 0;
    if (modelindex === "MOD_PROJECTILE" || modelindex === "MOD_PROJECTILE_SPLASH") {
        var_d5788a84 = 1;
    } else if (is_true(var_53bb8ef2.var_b0bffa0a)) {
        return 0;
    } else {
        var_d5788a84 = 1;
        var_53bb8ef2.var_b0bffa0a = 1;
        level thread function_902ac76();
        if (!is_true(var_53bb8ef2.var_6f17e122)) {
            self thread namespace_722cc932::function_76a52ae7();
        }
    }
    n_damage = min(psoffsettime, 195);
    var_53bb8ef2.var_cfa81957 -= n_damage;
    if (var_53bb8ef2.var_cfa81957 <= 0) {
        var_53bb8ef2.var_4ec7cb08 = 1;
        self vehicle::get_off_path();
        self thread namespace_722cc932::function_ff36634b();
    } else {
        self thread function_8feeb0be();
    }
    if (var_d5788a84 > 0) {
        level.player dodamage(var_d5788a84, vdamageorigin.origin, var_53bb8ef2.var_57a6f59c, shitloc, vsurfacenormal, modelindex, damagefromunderneath, partname);
    }
    return var_83af05db;
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x7795a30f, Offset: 0x3ae0
// Size: 0x96
function function_d8afd6c7() {
    n_health = 800;
    if (isdefined(level.gameskill)) {
        switch (level.gameskill) {
        case 0:
            n_health = 1000;
            break;
        case 3:
            n_health = 600;
            break;
        case 4:
            n_health = 400;
            break;
        }
    }
    return n_health;
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xd6f5f9ee, Offset: 0x3b80
// Size: 0x3a
function function_902ac76() {
    self notify("10e36f8fbae598fa");
    self endon("10e36f8fbae598fa");
    wait(1.5);
    level.var_1a2a8b6f.var_b0bffa0a = 0;
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x14bf0833, Offset: 0x3bc8
// Size: 0x180
function function_8feeb0be() {
    self notify("7ace23d9a9cd017");
    self endon("7ace23d9a9cd017");
    self endon(#"death", #"hash_455ac689d741c96b");
    self function_e7152de8();
    var_be81a997 = function_d8afd6c7();
    wait(5);
    var_53bb8ef2 = level.var_1a2a8b6f;
    var_c62824cc = var_53bb8ef2.var_cfa81957;
    if (var_c62824cc >= var_be81a997) {
        return;
    }
    var_61dc66d2 = 5 * (1 - var_c62824cc / var_be81a997);
    var_8fc81e63 = gettime();
    while (true) {
        n_time_passed = float(gettime() - var_8fc81e63) / 1000;
        n_percent = min(1, n_time_passed / var_61dc66d2);
        var_53bb8ef2.var_cfa81957 = lerpfloat(var_c62824cc, var_be81a997, n_percent);
        self function_e7152de8();
        if (n_percent >= 1) {
            break;
        }
        waitframe(1);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x7cfaae38, Offset: 0x3d50
// Size: 0xfa
function function_e7152de8() {
    var_be81a997 = function_d8afd6c7();
    var_82c2d032 = var_be81a997 / 4;
    if (!isdefined(level.var_1a2a8b6f.var_9df3157)) {
        level.var_1a2a8b6f.var_9df3157 = 0;
    }
    var_53bb8ef2 = level.var_1a2a8b6f;
    var_4cd42d59 = 0;
    for (i = 0; i < 4; i++) {
        if (var_53bb8ef2.var_cfa81957 <= var_be81a997 - var_82c2d032 * i) {
            var_4cd42d59 = i;
        }
    }
    if (var_53bb8ef2.var_9df3157 != var_4cd42d59) {
        self vehicle::set_damage_fx_level(var_4cd42d59);
        var_53bb8ef2.var_9df3157 = var_4cd42d59;
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 12, eflags: 0x2 linked
// Checksum 0x7b82797b, Offset: 0x3e58
// Size: 0x9c
function function_6760b772(*einflictor, eattacker, idamage, *idflags, *smeansofdeath, *weapon, *var_fd90b0bb, *vpoint, *vdir, *shitloc, *psoffsettime, *boneindex) {
    if (isdefined(psoffsettime) && psoffsettime != level.var_1a2a8b6f.var_57a6f59c) {
        return 0;
    }
    self.health++;
    return boneindex;
}

// Namespace armada_mortar/namespace_e6855491
// Params 4, eflags: 0x2 linked
// Checksum 0xf5e0c028, Offset: 0x3f00
// Size: 0x9c
function function_e160f453(*name, *starting, *direct, *player) {
    level flag::set("flag_mortar_orbit_complete");
    level flag::set("flag_mortar_orbit_rappel_start");
    level thread function_2e52b6f9();
    callback::remove_on_ai_spawned(&function_e59c6d2a);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x0
// Checksum 0xcbd35948, Offset: 0x3fa8
// Size: 0x7c
function function_234b1ce() {
    level.var_7466d419 makevehicleusable();
    level.var_7466d419 usevehicle(level.player, 2);
    level.var_7466d419 setseatoccupied(2, 1);
    level.var_7466d419 makevehicleunusable();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xdcb6c81b, Offset: 0x4030
// Size: 0x18c
function function_e1c02ad2() {
    level endon(#"hash_85243554b3f96e1");
    s_target = struct::get("mortar_courtyard_sign_target");
    var_d231fd39 = getent("mortar_courtyard_sign_model", "targetname");
    level scene::init(#"hash_3e6782ff3f9727c5");
    var_d231fd39 hide();
    level waittill(#"hash_6d5dee70f2cbd555");
    level thread scene::play(#"hash_3e6782ff3f9727c5");
    radiusdamage(s_target.origin - (0, 0, 200), 512, 500, 500);
    earthquake(0.25, 1, s_target.origin, 2500);
    level.player playrumbleonentity("damage_heavy");
    level waittill(#"hash_f8089be6fd4f682");
    var_d231fd39 show();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x350f763, Offset: 0x41c8
// Size: 0x138
function function_9ca7e163() {
    level endon(#"hash_7ebf01549650f780", #"hash_1f70cff16347cb6b");
    trigger = getent("trigger_bell_tower_damage", "targetname");
    hidemiscmodels("bell_tower_final");
    var_4e227252 = 0;
    level clientfield::set("" + #"hash_147afd2c82d374fe", 1);
    while (true) {
        s_waitresult = trigger waittill(#"damage");
        if (s_waitresult.attacker === level.player) {
            var_4e227252 += s_waitresult.amount;
            if (var_4e227252 >= 250) {
                level thread function_2c4d7184();
            }
        }
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x46f4dd48, Offset: 0x4308
// Size: 0x94
function function_7ed7f625() {
    if (!level flag::get("flag_bell_tower_destroyed")) {
        s_target = struct::get("mortar_orbit_bell_tower_target");
        if (isdefined(level.var_52874eb2)) {
            level.var_52874eb2 thread function_8060162f(s_target.origin);
        }
        wait(2);
        level thread function_2c4d7184();
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x38988762, Offset: 0x43a8
// Size: 0x15c
function function_2c4d7184() {
    level flag::set("flag_bell_tower_destroyed");
    s_tower = struct::get("mortar_orbit_bell_tower_target");
    radiusdamage(s_tower.origin, 128, 300, 100);
    earthquake(0.25, 1, s_tower.origin, 10000);
    level.player playrumbleonentity("damage_heavy");
    level thread scene::play(#"hash_45aea7646e25ef1f");
    level waittill(#"hash_3057933f3c7c3d18");
    showmiscmodels("bell_tower_final");
    level scene::function_f81475ae(#"hash_45aea7646e25ef1f");
    level clientfield::set("" + #"hash_147afd2c82d374fe", 0);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xfade653e, Offset: 0x4510
// Size: 0x314
function function_19288a46() {
    wait(2.5);
    level namespace_b7cfe907::function_d777fe61(2);
    level.player setplayerangles(anglestoforward(level.var_7466d419 function_90d45d34(2)));
    level.player hide();
    a_ents = [];
    a_ents[#"fakearms"] = util::spawn_player_clone(level.player);
    wait(1);
    level util::delay(0.65, undefined, &namespace_b7cfe907::function_abeb9b2d, 0, 2.5);
    level util::delay(0.65, undefined, &snd::function_7db65a93, #"hash_4a41082a1d97f925");
    namespace_72b0499b::music("4.0_chopper_combat", 0.65);
    snd::function_7db65a93(#"hash_3d8cbffebe7b249f");
    self clientfield::set("" + #"hash_4ddf67f7aa0f6884", 1);
    self thread scene::play(#"hash_40dd76ac89c3fdb5", a_ents);
    self setanim(#"hash_30cafb59b2924e48");
    wait(getanimlength(#"hash_30cafb59b2924e48"));
    self clearanim(#"hash_30cafb59b2924e48", 0.2);
    level.player show();
    level.player val::reset(#"hash_680eb654d9e9d2ad", "show_hud");
    level.player val::reset(#"hash_ed07d10944e0fd5", "freezecontrols");
    level thread function_5f51bebf();
    wait(2);
    level.var_7466d419 setvehicletype(#"hash_56f2823854475ea7");
    level thread function_e4c44785();
    level savegame::function_7790f03();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xac6fc0cc, Offset: 0x4830
// Size: 0x198
function function_e4c44785() {
    self notify("78a7000ddd1cc0f9");
    self endon("78a7000ddd1cc0f9");
    level endon(#"hash_5f68eb2d344b2ef0", #"disconnect");
    while (true) {
        level waittill(#"save_restore");
        waitframe(1);
        level lui::screen_fade_out(0, "white");
        level.player val::set(#"hash_ed07d10944e0fd5", "freezecontrols", 1);
        level.player val::set(#"hash_680eb654d9e9d2ad", "show_hud", 0);
        wait(3);
        level function_713a956d();
        level.player val::reset(#"hash_680eb654d9e9d2ad", "show_hud");
        level.player val::reset(#"hash_ed07d10944e0fd5", "freezecontrols");
        level thread lui::screen_fade_in(2, "white");
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0xab6fda63, Offset: 0x49d0
// Size: 0x6c
function function_713a956d(var_1728e1fe = vectortoangles(level.vip.origin - level.player.origin)) {
    level.player setplayerangles(var_1728e1fe);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x7293abf9, Offset: 0x4a48
// Size: 0x11c
function function_6cce8b8e() {
    level endon(#"hash_7ebf01549650f780");
    self endon(#"death");
    self setyawspeed(15, 15, 15);
    self setmaxpitchroll(60, 60);
    level trigger::wait_till("trigger_mortar_orbit_rpg_attack");
    self setspeed(60);
    self waittill(#"hash_2717c5ec282f117c");
    self setspeed(20, 30, 30);
    self waittill(#"hash_2717c8ec282f1695");
    self setspeed(15, 20, 20);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x1a5dd244, Offset: 0x4b70
// Size: 0xd4
function function_97a20289() {
    a_ents = [];
    a_ents[#"player"] = level.player;
    a_ents[#"buddy"] = level.buddy;
    a_ents[#"pilot"] = level.pilot;
    a_ents[#"copilot"] = level.copilot;
    a_ents[#"hash_4972abe0166bbc73"] = level.var_7466d419;
    level scene::init(#"hash_32b809763b13c282", a_ents);
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x7bc36c51, Offset: 0x4c50
// Size: 0x674
function function_6acbfbb1(var_50cc0d4f = 0) {
    self endon(#"death");
    if (!isalive(level.var_7466d419)) {
        return;
    }
    if (!var_50cc0d4f) {
        var_8720c122 = getvehiclenode("nd_mortar_orbit_final_pos", "targetname");
        n_speed = level.var_7466d419 getspeed();
        n_dist = distance(level.var_7466d419.origin, var_8720c122.origin);
        n_time = n_dist / n_speed;
        self thread function_27b92aed(n_time);
        var_67ae4496 = util::spawn_model(#"tag_origin", level.var_7466d419.origin, level.var_7466d419.angles);
        level.var_7466d419 linkto(var_67ae4496);
        var_67ae4496 moveto(var_8720c122.origin, n_time);
        var_67ae4496 rotateto(var_8720c122.angles, n_time, 1);
        var_67ae4496 waittill(#"movedone", #"rotatedone");
        var_67ae4496 delete();
    }
    level.var_7466d419 clientfield::set("" + #"hash_354296015ca81fd", 0);
    function_114d3739();
    level util::delay(7.5, undefined, &function_8199c444);
    level namespace_b7cfe907::function_3af72756(level.var_7466d419, level.pilot, "driver");
    level namespace_b7cfe907::function_3af72756(level.var_7466d419, level.copilot, "passenger1");
    level function_d380c058();
    level function_7b3aab80();
    if (isdefined(level.var_35f6b1e0)) {
        level.var_35f6b1e0 notify(#"hash_3d8430a495ffefcc");
        level.var_35f6b1e0 val::reset_all(#"landing_vc");
    }
    if (isdefined(level.var_841a4e26)) {
        level.var_841a4e26 notify(#"hash_3d8430a495ffefcc");
        level.var_841a4e26 val::reset_all(#"landing_vc");
    }
    level flag::set("flag_start_mortar_landing_scene");
    level.var_7466d419 clientfield::set("" + #"hash_4ddf67f7aa0f6884", 0);
    level.var_7466d419 thread function_15739fec();
    self thread function_2ee152cc();
    self val::set(#"hash_60e4a6089561f03e", "takedamage", 0);
    level scene::add_scene_func(#"hash_32b809763b13c282", &function_4ca07f70, "play");
    a_ents = [];
    a_ents[#"player"] = self;
    a_ents[#"buddy"] = level.buddy;
    a_ents[#"pilot"] = level.pilot;
    a_ents[#"copilot"] = level.copilot;
    a_ents[#"hash_4972abe0166bbc73"] = level.var_7466d419;
    a_ents[#"actor 1"] = level.var_35f6b1e0;
    a_ents[#"actor 2"] = level.var_841a4e26;
    a_ents[#"prop 1"] = self namespace_b7cfe907::function_ca2b95a();
    level scene::play(#"hash_32b809763b13c282", a_ents);
    level.buddy thread colors::set_force_color("g");
    level flag::set("flag_enable_mortar_courtyard_color_chain");
    level.pilot util::stop_magic_bullet_shield();
    level.copilot util::stop_magic_bullet_shield();
    level.pilot delete();
    level.copilot delete();
    level.var_7466d419 scene::stop(#"hash_65f973650bb861a3", 1);
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0xb8d422e6, Offset: 0x52d0
// Size: 0x7c
function function_27b92aed(n_delay) {
    self endon(#"death");
    wait(n_delay - float(function_60d95f53()) / 1000);
    self startcameratween(0.5, 0, 0);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xf33fa144, Offset: 0x5358
// Size: 0x94
function function_2ee152cc() {
    self endon(#"death");
    self waittill(#"hash_789df94ad317ad94");
    self setviewclamp(25, 15, 5, 5, 0, 0, 1);
    self waittill(#"hash_249a18df76edaab6");
    self setviewclamp(0, 0, 0, 0, 0, 1, 1);
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x422076a4, Offset: 0x53f8
// Size: 0x74
function function_4ca07f70(*a_ents) {
    level.player clientfield::set_to_player("" + #"hash_1d5f8429329030", 2);
    level.player val::reset(#"hash_60e4a6089561f03e", "takedamage");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x8456e00c, Offset: 0x5478
// Size: 0x9c
function function_15739fec() {
    self endon(#"death");
    self waittill(#"hash_280a21704e38e3d8");
    self.drivepath = 1;
    self setspeed(40, 10, 5);
    self vehicle::get_on_and_go_path(getvehiclenode("mortar_chopper_landing_exit_spline", "targetname"));
    self deletedelay();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x74cc307f, Offset: 0x5520
// Size: 0x6c
function function_5f51bebf() {
    level.player util::function_749362d7(0);
    level.player setmovespeedscale(1);
    level.player val::reset_all(#"armada_intro");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x27a56d7c, Offset: 0x5598
// Size: 0x64
function function_7b3aab80() {
    if (level flag::get("flag_player_chopper_screenshake_active")) {
        level flag::clear("flag_player_chopper_screenshake_active");
    }
    level flag::set("flag_orbit_mortar_player_on_ground");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xd0a79966, Offset: 0x5608
// Size: 0xa4
function function_d380c058() {
    tele = struct::get("mortar_buddy_teleport_landing_4", "targetname");
    if (isdefined(level.buddy)) {
        level namespace_b7cfe907::function_3af72756(level.var_7466d419, level.buddy, "crew");
        level.buddy thread namespace_b7cfe907::function_1f7fdfdb();
        return;
    }
    namespace_b7cfe907::function_ed68628c(0, tele, 1);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x39d4613e, Offset: 0x56b8
// Size: 0x9c
function function_5901663e() {
    spawner::add_spawn_function_ai_group("mortar_team_a", &function_40972ba8);
    level thread function_6610ecb5();
    level thread function_4d73a251();
    level flag::wait_till("flag_orbit_mortar_player_on_ground");
    level flag::set("flag_vo_mortar_orbit_landing_requested");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x7c90bfc7, Offset: 0x5760
// Size: 0xc4
function function_40972ba8() {
    self endon(#"death");
    self val::set("mortart_orbit_ai", "ignoreme", 1);
    if (level.gameskill === 0) {
        return;
    }
    if (isdefined(self.var_99b46f13) && isdefined(level.var_7466d419)) {
        trigger::wait_till("mortar_orbit_courtyard");
        wait(5);
        self.script_accuracy = 1000;
        self setpersonalthreatbias(level.var_7466d419, 100000);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xc6891246, Offset: 0x5830
// Size: 0xf0
function function_4d73a251() {
    level trigger::wait_till("mortar_orbit_alley");
    a_ai_enemies = getaiarray("mortar_orbit_site_e_enemy", "targetname");
    foreach (ai_enemy in a_ai_enemies) {
        if (!level.player islookingat(ai_enemy)) {
            ai_enemy delete();
        }
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xcce1af6a, Offset: 0x5928
// Size: 0x94
function function_1eb807e1() {
    level endon(#"hash_7ebf01549650f780");
    level flag::wait_till(#"hash_5c48d464408d21ee");
    level.player clientfield::set_to_player("" + #"hash_1d5f8429329030", 1);
    level.player thread dialogue::queue("vox_cp_armd_00004_plt2_visualonlztakin_f1");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x8500ff77, Offset: 0x59c8
// Size: 0x364
function function_428180d() {
    level endon(#"hash_7ebf01549650f780");
    wait(3);
    level.player dialogue::queue("vox_cp_armd_00004_plt1_approachingthev_53");
    wait(2);
    level.player dialogue::queue("vox_cp_armd_00004_plt2_rogerthatmoving_53");
    level trigger::wait_till("trigger_mortar_orbit_rpg_attack");
    level.player dialogue::queue("vox_cp_armd_00004_adlr_rpg_0a");
    wait(1);
    level.player dialogue::queue("vox_cp_armd_00004_adlr_chalktwolightem_b3");
    wait(0.5);
    if (!level flag::get("flag_bell_tower_destroyed")) {
        level.player dialogue::queue("vox_cp_armd_00004_sims_thereinthebellt_ae");
        level flag::wait_till_timeout(4, "flag_bell_tower_destroyed");
    }
    if (level flag::get("flag_bell_tower_destroyed")) {
        wait(1);
        level.player dialogue::queue("vox_cp_armd_00004_sims_fuckyeah_7e");
    }
    wait(2);
    level.player dialogue::queue("vox_cp_armd_00004_adlr_focusfireonthec_42");
    s_waitresult = level waittilltimeout(4, #"hash_20b54b22a8747044");
    if (s_waitresult._notify === "mortar_orbit_red_barrel_destroyed") {
        wait(1);
        level.player dialogue::queue("vox_cp_armd_00004_sims_niceshootingbel_f6");
    }
    level flag::wait_till("flag_mortar_orbit_rooftop_vo");
    wait(1);
    level.player dialogue::queue("vox_cp_armd_00004_adlr_goddammitmorerp_01");
    wait(0.5);
    level.player dialogue::queue("vox_cp_armd_00004_plt2_holdonswinginga_21");
    wait(2);
    if (!level.player attackbuttonpressed()) {
        level.player dialogue::queue("vox_cp_armd_00004_adlr_dontletupbell_e6");
        wait(1);
    }
    s_waitresult = level waittilltimeout(4, #"hash_20b54b22a8747044");
    if (s_waitresult._notify === "mortar_orbit_red_barrel_destroyed") {
        wait(1);
        var_e56066b6 = array("vox_cp_armd_00004_sims_thatishowyoufuc_90", "vox_cp_armd_00004_sims_goodhitbell_da", "vox_cp_armd_00004_sims_yeahblowthefuck_ed");
        level.player dialogue::queue(array::random(var_e56066b6));
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x71b8f88f, Offset: 0x5d38
// Size: 0x248
function function_6610ecb5() {
    level.var_7466d419 endon(#"death");
    trigger::wait_till("trigger_mortar_orbit_rpg_attack");
    ai_enemy = spawner::simple_spawn_single("mortar_orbit_tower_rpg_enemy");
    var_33d2e98f = struct::get("mortar_orbit_tower_upper");
    s_target = struct::get("mortar_orbit_rpg_end_1");
    var_98997b7 = getweapon(#"hash_513c26c6a751d20e");
    v_velocity = vectornormalize(s_target.origin - var_33d2e98f.origin) * 2000;
    for (i = 0; i < 3; i++) {
        missle = ai_enemy magicmissile(var_98997b7, var_33d2e98f.origin, v_velocity);
        missle thread function_48ac87db();
        wait(0.1);
    }
    if (level.gameskill === 0) {
        return;
    }
    trigger::wait_till("mortar_orbit_courtyard");
    var_697fc91a = getaiarray("mortar_tower_rpg_enemy", "script_noteworthy");
    foreach (ai_enemy in var_697fc91a) {
        ai_enemy.script_accuracy = 1000;
        ai_enemy setpersonalthreatbias(level.var_7466d419, 100000);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x9a50e8fb, Offset: 0x5f88
// Size: 0x2c
function function_48ac87db() {
    if (isdefined(self)) {
        self playrumblelooponentity("damage_heavy");
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 2, eflags: 0x2 linked
// Checksum 0x18deec01, Offset: 0x5fc0
// Size: 0x61c
function function_94a21d8b(var_d3440450, var_50cc0d4f) {
    level.player endon(#"death");
    if (var_50cc0d4f) {
        level util::screen_fade_out(0.05, "black", "mortar_main_start");
        level clientfield::set("toggle_dynsignage_mortartown", 1);
        level util::delay(0.5, undefined, &clientfield::set, "toggle_dynsignage_mortartown", 0);
        level thread namespace_b7cfe907::function_2647f901("mortar_village_completed");
        level thread function_a1de7ea2(1);
        level thread function_e1c02ad2();
        level thread function_110866d(1);
        level thread function_7ed7f625();
        level util::delay(1, "disconnect", &util::screen_fade_in, 2, "black", "mortar_main_start");
    }
    snd::function_7db65a93(#"hash_664776555d3b2bdc");
    callback::on_ai_spawned(&function_5cce18fe);
    level.var_52874eb2 thread function_17cadeb1();
    foreach (e_corpse in getcorpsearray()) {
        e_corpse delete();
    }
    level scene::stop(#"hash_45aea7646e25ef1f", 1);
    level scene::stop(#"hash_1849fb3a90d16a1", 1);
    level scene::stop(#"hash_60671afc06cb038e", 1);
    level scene::stop(#"hash_7d136efada0c9af0", 1);
    level scene::stop(#"hash_72f8f56116f32b17", 1);
    level scene::stop(#"hash_35db7f3d2c472306", 1);
    level scene::stop(#"hash_5e055056aa386e1f", 1);
    level scene::stop(#"hash_6c7177a6718884b8", 1);
    level scene::stop(#"hash_1fb12697821542a1", 1);
    level scene::stop(#"hash_1464d638ee5e23aa", 1);
    function_92d60a9d();
    namespace_72b0499b::music("5.0_village_combat");
    level thread function_a65af49d();
    level.player function_6acbfbb1(var_50cc0d4f);
    level flag::set("flag_play_landed_vo");
    level snd::function_7db65a93(#"hash_2086d5e690a6ff1b");
    level thread function_80089cc9();
    level thread function_b2d38e15();
    level util::function_f6847a11();
    level flag::wait_till("obj_flag_mortar_site_a");
    callback::remove_on_ai_spawned(&function_5cce18fe);
    spawner::remove_spawn_function_ai_group("mortar_ai", &function_af189a4c);
    spawner::remove_spawn_function_ai_group("tea_house", &function_af189a4c);
    spawner::remove_spawn_function_ai_group("mortar_ai_wave_3_right", &function_287230c8);
    spawner::remove_spawn_function_ai_group("mortar_ai_wave_3_left", &function_287230c8);
    savegame::function_379f84b3();
    level skipto::function_4e3ab877(var_d3440450, 0);
    level skipto::function_51726ac8(["armada_mortar_exfil"], 0, level.player);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x487ad495, Offset: 0x65e8
// Size: 0x34c
function function_a65af49d() {
    level endon(#"hash_85243554b3f96e1");
    level flag::wait_till("flag_play_landed_vo");
    wait(3);
    level.buddy dialogue::queue("vox_cp_armd_00004_sims_yousureaboutthi_d1");
    wait(1);
    level.player dialogue::queue("vox_cp_armd_00004_adlr_yourpriorityiss_9f");
    level thread function_1f0a8cc0();
    level flag::wait_till_any_timeout(30, array("mortar_ai_landing_ground_cleared", "flag_getting_close_vo"));
    level.player dialogue::queue("vox_cp_armd_00004_adlr_oursourceeyebal_6f");
    wait(3);
    level.buddy dialogue::queue("vox_cp_armd_00004_sims_letsgobellyoure_38");
    wait(0.5);
    level flag::wait_till("flag_getting_close_vo");
    level.player dialogue::queue("vox_cp_armd_00004_adlr_keeppushingforw_aa");
    level flag::wait_till_any(array("flag_mortar_courtyard_mg_gunner_attack", "flag_mortar_courtyard_chopper_attack_right", "flag_mortar_courtyard_chopper_attack_left"));
    level.player dialogue::queue("vox_cp_armd_00004_adlr_simsbellthatsth_a6");
    s_waitresult = level flag::wait_till_any_timeout(15, array("flag_fire_at_courtyard_sign", "flag_destory_courtyard_sign"));
    if (level flag::get("flag_destory_courtyard_sign")) {
        var_8e98393 = "vox_cp_armd_00004_adlr_getclearwereabo_9a";
    } else {
        var_8e98393 = "vox_cp_armd_00004_adlr_keepyourheadsdo_0a";
    }
    level.player dialogue::queue(var_8e98393);
    level flag::wait_till_any(array("flag_mortar_courtyard_ai_cleared", "flag_player_reached_tea_house_vo"));
    if (level flag::get("flag_mortar_courtyard_ai_cleared")) {
        wait(3);
        level.player dialogue::queue("vox_cp_armd_00004_plt1_areaclear_ce");
        wait(0.5);
        level.player dialogue::queue("vox_cp_armd_00004_adlr_okaygetinsidese_90");
    }
    level flag::wait_till_all(array("flag_player_reached_tea_house_vo", "flag_sims_reached_tea_house_vo"));
    level.buddy dialogue::queue("vox_cp_armd_00004_sims_gobellimrightbe_12");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x7c22a27c, Offset: 0x6940
// Size: 0xf6
function function_1f0a8cc0() {
    level endon(#"hash_85243554b3f96e1");
    callback::on_ai_killed(&function_a02983f8);
    var_27188c5 = array("vox_cp_armd_00004_sims_fuckyou_27", "vox_cp_armd_00004_sims_notyourdaybitch_d5", "vox_cp_armd_00004_sims_yourefuckingdon_0a");
    while (var_27188c5.size) {
        level waittill(#"hash_5204055d93065011");
        var_3edd7009 = array::random(var_27188c5);
        level.buddy dialogue::queue(var_3edd7009, 3);
        arrayremovevalue(var_27188c5, var_3edd7009, 0);
        wait(15);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x7ec81d21, Offset: 0x6a40
// Size: 0x48
function function_a02983f8(s_params) {
    attacker = s_params.eattacker;
    if (attacker === level.buddy) {
        level notify(#"hash_5204055d93065011");
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xab5e32f6, Offset: 0x6a90
// Size: 0xa4
function function_b2d38e15() {
    level endon(#"hash_85243554b3f96e1");
    level savegame::checkpoint_save();
    level flag::wait_till("flag_set_teahouse_checkpoint");
    level savegame::checkpoint_save();
    level flag::wait_till("flag_mortar_reached_red_door");
    level savegame::checkpoint_save();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x23d723ef, Offset: 0x6b40
// Size: 0x84
function function_5cce18fe() {
    if (isdefined(level.var_52874eb2) && is_true(self.var_99b46f13)) {
        if (self.aitype === "spawner_bo5_human_enemy_vc_rpg_armada") {
            var_f7511ee8 = 10000;
        } else {
            var_f7511ee8 = 500;
        }
        self setpersonalthreatbias(level.var_52874eb2, var_f7511ee8);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x0
// Checksum 0x54388df9, Offset: 0x6bd0
// Size: 0x94
function function_11e2bd76() {
    self endon(#"death");
    self val::set(#"hash_fbe5c5727eb30d7", "ignoreme", 1);
    level flag::wait_till_timeout(1.5, "flag_mortar_landing_player_pushed_forward");
    self val::reset(#"hash_fbe5c5727eb30d7", "ignoreme");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x67b26ebd, Offset: 0x6c70
// Size: 0x54
function function_17cadeb1() {
    s_start = struct::get("adler_chopper_starting_path_01");
    self function_97519340(s_start);
    wait(5);
    self thread function_ab1c35d7();
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x50dfc47f, Offset: 0x6cd0
// Size: 0x134
function function_97519340(nd_start) {
    self.origin = nd_start.origin;
    self.angles = nd_start.angles;
    self setspeed(0.01);
    self.origin = nd_start.origin;
    self.angles = nd_start.angles;
    self setgoalyaw((0, self.angles[1], 0)[1]);
    self function_a57c34b7(self.origin + (0, 0, 4), 1, 0);
    self setyawspeed(120, 60, 60);
    self setmaxpitchroll(30, 60);
    self.var_cb55c804 = 256;
    self setneargoalnotifydist(self.var_cb55c804);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x4b515dfe, Offset: 0x6e10
// Size: 0x3a2
function function_ab1c35d7() {
    level endon(#"hash_14c598f73c025763");
    level.player endon(#"death");
    self endon(#"death");
    var_98576f20 = undefined;
    var_54081ff9 = undefined;
    var_a9ad8d56 = struct::get_array("adler_heli_loop_anchor");
    var_a9ad8d56 = array::sort_by_script_int(var_a9ad8d56, 1);
    var_777b7e33 = struct::get_array("adler_heli_hover_anchor");
    var_777b7e33 = array::sort_by_script_int(var_777b7e33, 1);
    s_anchor = var_777b7e33[0];
    self thread function_1e3fd6e0();
    self setspeedimmediate(30);
    while (true) {
        self turret::disable(1);
        self turret::disable(2);
        self turret::disable(3);
        self turret::disable(4);
        if (!isdefined(s_anchor)) {
            s_anchor = function_478310c9(var_777b7e33, var_a9ad8d56);
            if (isdefined(s_anchor)) {
                s_anchor.var_6281c93d = 1;
            }
        }
        if (!isdefined(s_anchor)) {
            s_anchor = function_506eaf20(var_777b7e33, var_a9ad8d56);
        }
        if (s_anchor.targetname === "adler_heli_loop_anchor") {
            var_90df9642 = getvehiclenode(s_anchor.target, "targetname");
            if (isdefined(var_90df9642)) {
                self thread turret::enable(1);
                self function_f7dc2ff0(var_90df9642, s_anchor, var_777b7e33, var_a9ad8d56);
            }
        } else if (s_anchor.targetname === "adler_heli_hover_anchor") {
            var_ab11eba4 = struct::get_array(s_anchor.target);
            if (var_ab11eba4.size && isdefined(var_98576f20)) {
                arrayremovevalue(var_ab11eba4, var_98576f20);
            }
            var_98576f20 = array::random(var_ab11eba4);
            if (isdefined(var_98576f20)) {
                if (var_54081ff9 === s_anchor.script_int) {
                    var_1eea8080 = 0;
                } else {
                    var_54081ff9 = s_anchor.script_int;
                    var_1eea8080 = 1;
                }
                self function_5a365113(var_98576f20, var_1eea8080);
                self function_ba67d417(s_anchor);
                self waittilltimeout(randomfloatrange(1, 1.5), #"damage");
            }
        }
        waitframe(1);
        s_anchor = undefined;
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x96032b78, Offset: 0x71c0
// Size: 0x15a
function function_ba67d417(s_anchor) {
    switch (s_anchor.script_int) {
    case 0:
        self thread function_f1b25856(s_anchor, 0);
        break;
    case 1:
        break;
    case 2:
        self thread function_f1b25856(s_anchor, 1);
        break;
    case 3:
        self thread function_f1b25856(s_anchor, 1);
        break;
    case 4:
        break;
    case 5:
        self thread function_f1b25856(s_anchor, 1);
        break;
    case 6:
        self thread function_f1b25856(s_anchor, 1);
        break;
    default:
        break;
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 2, eflags: 0x2 linked
// Checksum 0x8a528daa, Offset: 0x7328
// Size: 0x238
function function_f1b25856(s_anchor, var_d94e669c = 1) {
    self notify("6983c21f38d5a8b6");
    self endon("6983c21f38d5a8b6");
    self endon(#"death");
    if (isinarray(array(3, 5, 6), s_anchor.script_int) && !level flag::get("flag_fire_at_courtyard_sign")) {
        level flag::set("flag_fire_at_courtyard_sign");
        level flag::delay_set(5, "flag_mortar_courtyard_chopper_loop");
    }
    a_enemies = self getenemiesinradius(s_anchor.origin, s_anchor.radius);
    a_enemies = array::filter(a_enemies, 0, &function_e7ff3aa4);
    foreach (enemy in a_enemies) {
        if (var_d94e669c) {
            self function_7c644fb3(enemy, 1);
        } else {
            self thread function_7c644fb3(enemy, 3);
            self function_7c644fb3(enemy, 4);
        }
        wait(randomfloatrange(0.5, 0.7));
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x9ea131a2, Offset: 0x7568
// Size: 0x110
function function_5ebe746e() {
    var_b23598c7 = struct::get("mortar_courtyard_sign_target");
    level flag::wait_till_any(array("flag_fire_at_courtyard_sign", "flag_destory_courtyard_sign"));
    if (!level flag::get("flag_destory_courtyard_sign")) {
        while (!level.player util::is_looking_at(var_b23598c7, 0.96, 1) && !level flag::get("flag_destory_courtyard_sign")) {
            wait(0.5);
        }
    }
    level.var_52874eb2 thread function_382a326a();
    wait(0.3);
    level notify(#"hash_6d5dee70f2cbd555");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x859d4ec, Offset: 0x7680
// Size: 0xf4
function function_382a326a() {
    s_target = struct::get("mortar_courtyard_sign_target");
    var_98997b7 = getweapon(#"hash_513c26c6a751d20e");
    rocketorigin = self gettagorigin("tag_flash");
    v_velocity = vectornormalize(s_target.origin - rocketorigin) * 2000;
    for (i = 0; i < 3; i++) {
        self magicmissile(var_98997b7, rocketorigin, v_velocity);
        wait(0.1);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 2, eflags: 0x2 linked
// Checksum 0x7e5d6560, Offset: 0x7780
// Size: 0xb8
function function_478310c9(var_777b7e33, var_a9ad8d56) {
    if (level flag::get("flag_reached_tea_house_upper_floor")) {
        return var_a9ad8d56[2];
    }
    if (level flag::get("flag_mortar_upper_mortar_building_reached")) {
        return var_777b7e33[4];
    }
    if (level flag::get("flag_mortar_courtyard_ai_cleared")) {
        return var_a9ad8d56[2];
    }
    if (level flag::get("flag_mortar_courtyard_chopper_loop")) {
        return var_a9ad8d56[3];
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 2, eflags: 0x2 linked
// Checksum 0x67e84aed, Offset: 0x7840
// Size: 0x25a
function function_506eaf20(var_777b7e33, var_a9ad8d56) {
    s_anchor = arraygetclosest(level.player.origin, var_777b7e33);
    if (!isdefined(s_anchor.radius)) {
        return s_anchor;
    }
    a_enemies = self getenemiesinradius(s_anchor.origin, s_anchor.radius);
    if (isdefined(s_anchor.script_int) && isinarray(array(0, 2, 3, 5, 6), s_anchor.script_int)) {
        a_enemies = array::filter(a_enemies, 0, &function_e7ff3aa4);
        if (s_anchor.script_int == 5) {
            if (a_enemies.size && level flag::get("flag_mortar_courtyard_chopper_attack_right")) {
                return s_anchor;
            }
        } else if (s_anchor.script_int == 6) {
            if (a_enemies.size && level flag::get("flag_mortar_courtyard_chopper_attack_left")) {
                return s_anchor;
            }
        } else if (a_enemies.size) {
            return s_anchor;
        }
        s_anchor = arraygetclosest(level.player.origin, var_a9ad8d56);
        return s_anchor;
    }
    if (!isdefined(s_anchor.radius)) {
        s_anchor.radius = 800;
    }
    if (!isdefined(s_anchor.var_c7c70d7)) {
        s_anchor.var_c7c70d7 = 3;
    }
    if (a_enemies.size < s_anchor.var_c7c70d7) {
        s_anchor = arraygetclosest(level.player.origin, var_a9ad8d56);
    }
    return s_anchor;
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x806c1436, Offset: 0x7aa8
// Size: 0x1c
function function_e7ff3aa4(e_ent) {
    return e_ent.var_99b46f13 === 1;
}

// Namespace armada_mortar/namespace_e6855491
// Params 4, eflags: 0x2 linked
// Checksum 0xca4f2051, Offset: 0x7ad0
// Size: 0x126
function function_f7dc2ff0(var_90df9642, s_anchor, var_777b7e33, var_a9ad8d56) {
    level endon(#"hash_14c598f73c025763");
    self endon(#"death", #"stop path");
    self notify("303ef9c9f0be2c59");
    self endon("303ef9c9f0be2c59");
    if (!is_true(s_anchor.var_6281c93d)) {
        self thread function_7882569f(s_anchor, var_777b7e33, var_a9ad8d56);
    }
    self function_536cff7e(var_90df9642);
    self function_24c9e377();
    self vehicle::get_on_path(var_90df9642);
    self vehicle::go_path();
    self notify(#"hash_3a86066a301e90fc");
}

// Namespace armada_mortar/namespace_e6855491
// Params 3, eflags: 0x2 linked
// Checksum 0x3e3a1f01, Offset: 0x7c00
// Size: 0xf8
function function_7882569f(s_anchor, var_777b7e33, var_a9ad8d56) {
    level endon(#"hash_14c598f73c025763");
    self endon(#"death", #"hash_3a86066a301e90fc", #"stop path");
    self notify("16a7ca31dd85221b");
    self endon("16a7ca31dd85221b");
    while (true) {
        var_ab252334 = function_506eaf20(var_777b7e33, var_a9ad8d56);
        if (s_anchor.targetname !== var_ab252334.targetname || s_anchor.script_int !== var_ab252334.script_int) {
            self notify(#"stop path");
        }
        wait(1);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x0
// Checksum 0xca2cd97a, Offset: 0x7d00
// Size: 0x1c4
function function_82ba400e(s_target) {
    self endon(#"death");
    self turret::enable(1, 0);
    self turret::enable(3, 0);
    self turret::enable(4, 0);
    self waittill(#"hash_3ea4db032aff8725");
    if (isdefined(s_target)) {
        self function_8060162f(s_target.origin, 1);
    }
    a_ai_enemies = getaiteamarray(#"axis");
    foreach (e_enemy in a_ai_enemies) {
        if (is_true(e_enemy.var_99b46f13)) {
            e_target_1 = e_enemy;
            break;
        }
    }
    if (!isdefined(e_target_1)) {
        e_target_1 = function_67565f43(1);
    }
    if (isdefined(e_target_1)) {
        self thread function_8060162f(e_target_1.origin, 1);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 2, eflags: 0x2 linked
// Checksum 0x86cd7e46, Offset: 0x7ed0
// Size: 0x174
function function_8060162f(v_target, n_index = 1) {
    self endon(#"death");
    if (n_index == 1) {
        var_9012c9b0 = getweapon(#"hash_2f6f5a990bc32cbd");
        var_1620c159 = #"hash_10f4fd64af1dfe61";
    } else {
        var_9012c9b0 = getweapon(#"hash_73d955d55fddba26");
        var_1620c159 = #"hash_6d6d720fe18d9609";
    }
    for (i = 0; i < 50; i++) {
        v_start = self gettagorigin("tag_gunner_flash" + n_index);
        playfxontag(var_1620c159, self, "tag_gunner_flash" + n_index);
        magicbullet(var_9012c9b0, v_start, v_target);
        wait(0.05);
        magicbullet(var_9012c9b0, v_start, v_target);
        wait(0.1);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x4bc7dd89, Offset: 0x8050
// Size: 0x94
function function_1e3fd6e0() {
    self turret::function_41c79ce4(1, 1);
    self turret::clear_target(1);
    self turret::set_burst_parameters(0.25, 0.5, 0.25, 0.5, 1);
}

// Namespace armada_mortar/namespace_e6855491
// Params 2, eflags: 0x2 linked
// Checksum 0xc496db73, Offset: 0x80f0
// Size: 0x1d2
function function_67565f43(n_index, var_2e91c04f) {
    a_ai_enemies = getaiteamarray(#"axis");
    if (isdefined(var_2e91c04f)) {
        arrayremovevalue(a_ai_enemies, var_2e91c04f);
    }
    var_20e463d4 = array::filter_classname(a_ai_enemies, 0, "actor_spawner_bo5_human_enemy_vc_rpg_armada");
    foreach (ai_enemy in var_20e463d4) {
        if (isalive(ai_enemy) && self turret::can_hit_target(ai_enemy, n_index)) {
            return ai_enemy;
        }
    }
    foreach (ai_enemy in a_ai_enemies) {
        if (isalive(ai_enemy) && self turret::can_hit_target(ai_enemy, n_index)) {
            return ai_enemy;
        }
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 2, eflags: 0x2 linked
// Checksum 0xa466f5e2, Offset: 0x82d0
// Size: 0x1a2
function function_536cff7e(start_node, n_speed = 40) {
    level endon(#"hash_14c598f73c025763");
    self endon(#"death", #"stop path");
    self.var_cb55c804 = 256;
    self setneargoalnotifydist(self.var_cb55c804);
    self setspeed(n_speed);
    self vehlookat(start_node.origin);
    self function_a57c34b7(start_node.origin, 1, 0);
    self setgoalyaw((0, start_node.angles[1], 0)[1]);
    self settargetyaw((0, start_node.angles[1], 0)[1]);
    self waittill(#"goal", #"near_goal", #"reached_end_node", #"reached_node", #"stop path");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x5d3549ae, Offset: 0x8480
// Size: 0xec
function function_24c9e377() {
    level endon(#"hash_14c598f73c025763");
    self endon(#"death", #"stop path");
    self vehclearlookat();
    self cleartargetyaw();
    self cleargoalyaw();
    self function_d4c687c9();
    self function_a57c34b7(self.origin + (0, 0, 4), 1, 0);
    self setspeed(30, 20, 20);
}

// Namespace armada_mortar/namespace_e6855491
// Params 2, eflags: 0x2 linked
// Checksum 0xfde5609e, Offset: 0x8578
// Size: 0x32c
function function_5a365113(var_7e2d8151, var_1eea8080 = 0) {
    level endon(#"hash_14c598f73c025763");
    self endon(#"death");
    self vehicle_ai::clearallmovement();
    if (var_1eea8080) {
        self setspeed(30, 20, 20);
        self vehlookat(var_7e2d8151.origin);
        self function_a57c34b7(var_7e2d8151.origin + (0, 0, 500), 1, 0);
        self.var_cb55c804 = 256;
        self setneargoalnotifydist(self.var_cb55c804);
        self sethoverparams(30, 20, 20);
        self waittilltimeout(10, #"near_goal", #"goal");
        self vehclearlookat();
        self settargetyaw((0, var_7e2d8151.angles[1], 0)[1]);
        self setgoalyaw((0, var_7e2d8151.angles[1], 0)[1]);
        self notify(#"hash_147d5f5088eee4af");
    }
    self setspeed(30, 20, 20);
    self function_a57c34b7(var_7e2d8151.origin, 1, 0);
    self.var_cb55c804 = 96;
    self setneargoalnotifydist(self.var_cb55c804);
    self sethoverparams(30, 20, 20);
    self waittilltimeout(10, #"near_goal", #"goal");
    self sethoverparams(256, 30, 20);
    self settargetyaw((0, var_7e2d8151.angles[1], 0)[1]);
    self setgoalyaw((0, var_7e2d8151.angles[1], 0)[1]);
    self function_d4c687c9();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xaacaa640, Offset: 0x88b0
// Size: 0x104
function function_8199c444() {
    spawner::add_spawn_function_ai_group("mortar_ai", &function_af189a4c);
    spawner::add_spawn_function_ai_group("tea_house", &function_af189a4c);
    spawner::add_spawn_function_ai_group("mortar_ai_wave_3_right", &function_287230c8);
    spawner::add_spawn_function_ai_group("mortar_ai_wave_3_left", &function_287230c8);
    level thread function_fb965703();
    level thread function_dcf0253();
    level thread function_ded27710();
    level thread function_5ebe746e();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x9758a7d3, Offset: 0x89c0
// Size: 0xa4
function function_114d3739() {
    array::delete_all(spawner::get_ai_group_ai("mortar_orbit_ai"));
    array::delete_all(spawner::get_ai_group_ai("mortar_team_a"));
    array::delete_all(spawner::get_ai_group_ai("mortar_team_b"));
    array::delete_all(spawner::get_ai_group_ai("mortar_team_e"));
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xbfec574, Offset: 0x8a70
// Size: 0xec
function function_fb965703() {
    spawner::simple_spawn("mortar_enemy_landing_upper_floors");
    level util::delay(1, undefined, &spawner::simple_spawn_single, "mortar_enemy_landing_ground_flank_left", &function_a807976b);
    level flag::set("flag_start_vign_mortar_first_battle_1st_wave");
    level flag::wait_till_timeout(3, "flag_mortar_landing_player_pushed_forward");
    spawner::simple_spawn("mortar_enemy_landing_ground_flank");
    level flag::wait_till_timeout(15, "flag_mortar_landing_player_pushed_forward");
    spawner::simple_spawn("mortar_enemy_landing_ground");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xfe4b2bd8, Offset: 0x8b68
// Size: 0x74
function function_a807976b() {
    self thread ai::set_behavior_attribute("disablepeek", 1);
    if (isdefined(level.var_52874eb2)) {
        self setpersonalthreatbias(level.var_52874eb2, -10000);
    }
    self setpersonalthreatbias(level.player, 2000);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xf0d3be0a, Offset: 0x8be8
// Size: 0x19c
function function_ded27710() {
    level thread function_4a54e325();
    waitframe(1);
    level thread function_f2cbcaaa();
    waitframe(1);
    level thread function_81654d37();
    waitframe(1);
    level thread function_d250e19f();
    waitframe(1);
    level thread function_aaf84792();
    waitframe(1);
    level thread function_eb90b3e8();
    waitframe(1);
    level thread function_c1a89a46();
    waitframe(1);
    level thread function_c6c2c276();
    waitframe(1);
    level thread function_9a05c498();
    waitframe(1);
    level thread function_6b05b315();
    waitframe(1);
    level thread function_e79a5a5d();
    waitframe(1);
    level thread function_c728f547();
    waitframe(1);
    level thread function_529acf84();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x7993bc49, Offset: 0x8d90
// Size: 0x11c
function function_c6c2c276() {
    level flag::wait_till("flag_mortar_landing_player_pushed_forward");
    wait(4);
    level scene::add_scene_func(#"hash_47c1f9bed49aef1b", &function_469dbbc4, "init");
    level scene::add_scene_func(#"hash_4e497ef04688df0e", &function_ecf10386, "init");
    level scene::add_scene_func(#"hash_4e497ef04688df0e", &function_b6a33802, "play");
    level scene::init(#"hash_47c1f9bed49aef1b");
    waitframe(1);
    level scene::init(#"hash_4e497ef04688df0e");
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x21f94e09, Offset: 0x8eb8
// Size: 0x264
function function_469dbbc4(a_ents) {
    level endon(#"hash_bf9e9b05d9f258d", #"hash_5bab0ce6d92081c5");
    enemy = a_ents[#"actor 1"];
    enemy endon(#"death");
    enemy.a.nodeath = 1;
    enemy.skipdeath = 1;
    enemy.script_objective = "armada_mortar_start";
    enemy thread function_77ff9ff2();
    enemy thread function_aad3f658();
    level scene::remove_scene_func(#"hash_47c1f9bed49aef1b", &function_469dbbc4, "init");
    waitresult = enemy waittill(#"damage");
    self thread function_119bac80(waitresult.attacker);
    level notify(#"hash_6c9ae8bf940ed483");
    enemy.var_c681e4c1 = 1;
    if (level scene::is_playing(#"hash_47c1f9bed49aef1b", "if_not_shot_go_to_crc_shoot") || level scene::is_playing(#"hash_47c1f9bed49aef1b", "shoot_loop")) {
        level scene::play(#"hash_47c1f9bed49aef1b", "if_shot_in_crc_exposed");
    } else {
        level scene::play(#"hash_47c1f9bed49aef1b", "if_shot_right_away");
    }
    if (isalive(enemy)) {
        util::stop_magic_bullet_shield(enemy);
        enemy.allowdeath = 1;
        enemy kill();
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0xc177e725, Offset: 0x9128
// Size: 0x80
function function_119bac80(attacker) {
    self endon(#"death");
    function_c1a275eb(attacker);
    while (isdefined(self)) {
        waitresult = self waittill(#"damage");
        function_c1a275eb(waitresult.attacker);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0xa56f8c19, Offset: 0x91b0
// Size: 0x54
function function_c1a275eb(attacker) {
    if (isplayer(attacker)) {
        attacker playhitmarker(#"hash_31e38d8520839566", 5, undefined, 1);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x2f0e77d6, Offset: 0x9210
// Size: 0x18e
function function_aad3f658() {
    level endon(#"hash_6c9ae8bf940ed483", #"hash_bf9e9b05d9f258d");
    self endon(#"death");
    level flag::wait_till("flag_aib_t9_vign_cust_arm_ammo_cache_play");
    level scene::play(#"hash_47c1f9bed49aef1b", "react");
    level scene::play(#"hash_47c1f9bed49aef1b", "if_not_shot_go_to_crc_shoot");
    level thread scene::play(#"hash_47c1f9bed49aef1b", "shoot_loop");
    level flag::wait_till_timeout(0.5, "flag_stop_ammo_cache_scene");
    level notify(#"hash_5bab0ce6d92081c5");
    level thread scene::stop(#"hash_47c1f9bed49aef1b");
    if (isalive(self)) {
        util::stop_magic_bullet_shield(self);
        self.allowdeath = 1;
        self.a.nodeath = 0;
        self.skipdeath = 0;
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x69ee8376, Offset: 0x93a8
// Size: 0xbc
function function_77ff9ff2() {
    level endon(#"hash_6c9ae8bf940ed483", #"hash_5bab0ce6d92081c5");
    self endon(#"death");
    level flag::wait_till("flag_mortar_disable_ammo_cache_scene");
    level notify(#"hash_bf9e9b05d9f258d");
    level scene::stop(#"hash_4e497ef04688df0e", 1);
    level scene::stop(#"hash_47c1f9bed49aef1b", 1);
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x4de11a33, Offset: 0x9470
// Size: 0xc4
function function_ecf10386(a_ents) {
    level scene::remove_scene_func(#"hash_4e497ef04688df0e", &function_ecf10386, "init");
    enemy = a_ents[#"actor 1"];
    enemy endon(#"death");
    level flag::wait_till("flag_aib_t9_vign_cust_arm_ammo_cache_play");
    wait(0.5);
    level scene::play(#"hash_4e497ef04688df0e", "react", enemy);
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0xb555fcbb, Offset: 0x9540
// Size: 0xbc
function function_b6a33802(a_ents) {
    enemy = a_ents[#"actor 1"];
    if (isalive(enemy)) {
        enemy.script_objective = "armada_mortar_start";
        enemy thread ai::force_goal(getent("mortar_courtyard_vol", "targetname"));
    }
    level scene::remove_scene_func(#"hash_4e497ef04688df0e", &function_b6a33802, "play");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x56d3a183, Offset: 0x9608
// Size: 0xa4
function function_9a05c498() {
    level endon(#"hash_6f51e6fd732d2e8b", #"hash_353db9a2edb70b2e");
    level scene::add_scene_func(#"hash_4e497df04688dd5b", &function_a2024273, "done");
    level flag::wait_till("flag_aib_t9_vign_cust_arm_jump_out_window_02");
    level scene::play(#"hash_4e497df04688dd5b");
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0xf9821112, Offset: 0x96b8
// Size: 0xac
function function_a2024273(a_ents) {
    ent = a_ents[#"actor 1"];
    if (isalive(ent)) {
        ent thread ai::force_goal(level.player.origin);
        ent.script_objective = "armada_mortar_start";
    }
    level scene::remove_scene_func(#"hash_4e497df04688dd5b", &function_a2024273, "done");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x3b54f751, Offset: 0x9770
// Size: 0x94
function function_6b05b315() {
    level endon(#"hash_353db9a2edb70b2e");
    level scene::add_scene_func(#"hash_d6565e31fc629f2", &function_32447d79, "done");
    level trigger::wait_till("flag_aib_t9_cust_down_stairs_shootin_vc");
    level scene::play(#"hash_d6565e31fc629f2");
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x85199ab0, Offset: 0x9810
// Size: 0xbc
function function_32447d79(a_ents) {
    ent = a_ents[#"actor 1"];
    if (isalive(ent)) {
        ent.script_objective = "armada_mortar_start";
        ent thread ai::force_goal(getnode("vign_down_stairs_shootin_cover", "targetname"));
    }
    level scene::remove_scene_func(#"hash_d6565e31fc629f2", &function_32447d79, "done");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x789086f2, Offset: 0x98d8
// Size: 0x54
function function_e79a5a5d() {
    level flag::wait_till("flag_mortar_landing_player_pushed_forward");
    wait(2);
    spawner::simple_spawn_single("vign_peaking_window_spawner", &function_ce14c867);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xa81ceed1, Offset: 0x9938
// Size: 0x16c
function function_ce14c867() {
    level endon(#"hash_353db9a2edb70b2e", #"hash_5978cad75e234c6");
    self endon(#"death");
    self scene::init(#"hash_667342d5ad8c3596", self);
    self thread function_fd33933d();
    level flag::wait_till("flag_aib_t9_vign_cust_arm_peaking_window_intro");
    self thread function_ded00ef3();
    level util::waittill_any_ents(level, "flag_aib_t9_vign_cust_arm_peaking_window_react", self, "damage");
    level notify(#"hash_2e8b756548c58545");
    self scene::play(#"hash_667342d5ad8c3596", "react", self);
    if (isalive(self)) {
        self thread ai::set_goal_ent(getent("mortar_alley_defend_vol", "targetname"));
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x13bdc8f8, Offset: 0x9ab0
// Size: 0xcc
function function_ded00ef3() {
    level endon(#"hash_2e8b756548c58545", #"hash_353db9a2edb70b2e", #"hash_5978cad75e234c6");
    self endon(#"death");
    self scene::play(#"hash_667342d5ad8c3596", "intro", self);
    self thread scene::play(#"hash_667342d5ad8c3596", "loop", self);
    wait(1.5);
    level flag::set("flag_aib_t9_vign_cust_arm_peaking_window_react");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xc0235b5f, Offset: 0x9b88
// Size: 0x8c
function function_fd33933d() {
    level endon(#"hash_1a3514639ca156a", #"hash_2e8b756548c58545");
    self endon(#"death");
    level waittill(#"hash_353db9a2edb70b2e", #"hash_5978cad75e234c6");
    level scene::stop(#"hash_667342d5ad8c3596", 1);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x0
// Checksum 0xbfaa96f3, Offset: 0x9c20
// Size: 0x74
function function_6dfe5db1() {
    level scene::add_scene_func("aib_t9_vign_tplt_ent_around_corner_l_2_stnd_spray_shoot_01", &function_41c74d6e, "play");
    level flag::wait_till("start_vign_corner_spry_shoot_01");
    level scene::play(#"hash_6be70ccea1f54709");
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x26651c18, Offset: 0x9ca0
// Size: 0x11c
function function_41c74d6e(ents) {
    var_adfb6bb7 = getent("mortar_landing_defend_vol", "targetname");
    foreach (ent in ents) {
        if (isalive(ent)) {
            ent thread ai::set_goal_ent(var_adfb6bb7);
            ent.script_objective = "armada_mortar_start";
            ent.script_grenades = 0;
        }
    }
    level scene::remove_scene_func("aib_t9_vign_tplt_ent_around_corner_l_2_stnd_spray_shoot_01", &function_41c74d6e, "play");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x1cd25368, Offset: 0x9dc8
// Size: 0x7c
function function_4a54e325() {
    level scene::add_scene_func("aib_t9_vign_cust_arm_mortar_first_battle_1st_wave", &function_67118793, "play");
    level flag::wait_till("flag_start_vign_mortar_first_battle_1st_wave");
    wait(1.5);
    level scene::play(#"hash_775ef8a4a603e0c0");
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x15cbeb83, Offset: 0x9e50
// Size: 0x16c
function function_67118793(ents) {
    var_adfb6bb7 = getent("mortar_landing_defend_vol", "targetname");
    foreach (ent in ents) {
        if (isalive(ent)) {
            if (ent.anim_debug_name === "actor 1" || ent.anim_debug_name === "actor 4") {
                ent.var_99b46f13 = 1;
                ent thread function_6ca545eb();
            }
            ent thread ai::set_goal_ent(var_adfb6bb7);
            ent.script_objective = "armada_mortar_start";
            ent.script_grenades = 0;
        }
    }
    level scene::remove_scene_func("aib_t9_vign_cust_arm_mortar_first_battle_1st_wave", &function_67118793, "play");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xb9b47e02, Offset: 0x9fc8
// Size: 0x4c
function function_6ca545eb() {
    self endon(#"death");
    self waittill(#"hash_35611a5995a2a1d7");
    level.var_52874eb2 thread function_8060162f(self.origin, 1);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x7bb2fdd2, Offset: 0xa020
// Size: 0x2c
function function_f2cbcaaa() {
    spawner::simple_spawn_single("mortar_landing_dth_fall_over_railing_f_01_guy", &function_291146ea);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x5646954e, Offset: 0xa058
// Size: 0xbc
function function_291146ea() {
    self.a.nodeath = 1;
    self.skipdeath = 1;
    waitresult = self waittill(#"damage", #"death");
    self thread function_119bac80(waitresult.attacker);
    self scene::play(#"hash_7766f548c20a2de7", "Shot 1", self);
    if (isdefined(self)) {
        self startragdoll(1);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x507f6c5e, Offset: 0xa120
// Size: 0x5c
function function_aaf84792() {
    level endon(#"hash_5978cad75e234c6");
    level flag::wait_till("vignette_mortar_brks_wndw_1_base_1_flag");
    spawner::simple_spawn_single("mortar_brks_wndw_1_base_1_guy", &function_c25d3a03);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xab8fd1b, Offset: 0xa188
// Size: 0x1cc
function function_c25d3a03() {
    self endon(#"death");
    self thread scene::play(#"hash_23d756fc375caf0b", "break_glass", self);
    var_cc8a06e0 = getent("windowbash_shutter_left", "targetname");
    var_706eb820 = getent("windowbash_shutter_right", "targetname");
    var_9914920b = getent("windowbash_shutter_collision", "targetname");
    self waittill(#"hash_55c9dfd739723702");
    var_cc8a06e0 rotateto((0, 290, 0), 0.1);
    var_706eb820 rotateto((0, 170, 0), 0.1);
    var_9914920b delete();
    if (isdefined(level.var_52874eb2)) {
        self setpersonalthreatbias(level.var_52874eb2, -10000);
    }
    level waittill(#"hash_e1ae1f1d66672eb", #"hash_5978cad75e234c6");
    self util::stop_magic_bullet_shield();
    self kill();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x8ece48f8, Offset: 0xa360
// Size: 0x6c
function function_c728f547() {
    level endon(#"hash_5978cad75e234c6", #"hash_353db9a2edb70b2e");
    level trigger::wait_till("trigger_mortar_left_path");
    spawner::simple_spawn_single("vign_scan_for_heli_balcony_guy", &function_d64dcfe2);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xfd03212e, Offset: 0xa3d8
// Size: 0x12c
function function_d64dcfe2() {
    self endon(#"death", #"hash_b6f8e557673187c");
    self thread function_2136dc79();
    level thread scene::play(#"hash_72d2ff97930299b1", "loop", self);
    level util::waittill_any_ents(level, "flag_start_vign_scan_for_heli_balcony", self, "damage");
    self notify(#"hash_28b58f626b1379ac");
    level thread scene::play(#"hash_72d2ff97930299b1", "react", self);
    self setpersonalthreatbias(level.player, 2000);
    var_6fd474cd = getnode(self.target, "targetname");
    self thread ai::set_goal_node(var_6fd474cd);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xaab100d6, Offset: 0xa510
// Size: 0xd4
function function_2136dc79() {
    self endon(#"death", #"hash_28b58f626b1379ac");
    level flag::wait_till_any(array("flag_mortar_right_path", "flag_mortar_upper_mortar_building_reached", "flag_mortar_cleanup_mortar_alley", "flag_spawn_mortar_upper_spawner_wave_3"));
    self notify(#"hash_b6f8e557673187c");
    self scene::stop(#"hash_72d2ff97930299b1", 1);
    if (isalive(self)) {
        self kill();
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x45f0e781, Offset: 0xa5f0
// Size: 0x6c
function function_529acf84() {
    level endon(#"hash_5978cad75e234c6", #"hash_353db9a2edb70b2e");
    level trigger::wait_till("start_vign_startled_ent_balcony_death");
    spawner::simple_spawn_single("vign_startled_ent_balcony_death_guy", &function_7f4a10e5);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x9d49e5f5, Offset: 0xa668
// Size: 0x17e
function function_7f4a10e5() {
    self endon(#"death");
    level scene::play(#"hash_2b1584529efce6e9", "intro", self);
    level thread scene::play(#"hash_2b1584529efce6e9", "loop", self);
    waitresult = self waittilltimeout(1.3, #"damage");
    self thread function_119bac80(waitresult.attacker);
    if (waitresult._notify == "damage") {
        level thread scene::play(#"hash_2b1584529efce6e9", "death", self);
        return;
    }
    level thread scene::stop(#"hash_2b1584529efce6e9");
    if (isalive(self)) {
        util::stop_magic_bullet_shield(self);
        self.allowdeath = 1;
        self.a.nodeath = 0;
        self.skipdeath = 0;
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x9490a8ca, Offset: 0xa7f0
// Size: 0x4c
function function_81654d37() {
    level flag::wait_till("start_vignette_dth_against_wall_2_stairs");
    spawner::simple_spawn_single("vign_dth_against_wall_2_stairs_guy", &function_c98cbd4e);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xfa6c6d7, Offset: 0xa848
// Size: 0x7c
function function_c98cbd4e() {
    self endon(#"death");
    var_cc827aa1 = getnode("vign_dth_against_wall_2_stairs_node", "targetname");
    self thread function_558f59db(var_cc827aa1);
    self thread ai::force_goal(var_cc827aa1, 0, undefined, 0, 1);
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x849e713e, Offset: 0xa8d0
// Size: 0x17c
function function_558f59db(var_cc827aa1) {
    self endon(#"death");
    waitresult = self waittill(#"damage");
    self thread function_119bac80(waitresult.attacker);
    if (isdefined(self) && isdefined(waitresult.attacker)) {
        if (isdefined(waitresult.weapon) && waitresult.weapon.weapclass != "spread" && distance2d(self.origin, var_cc827aa1.origin) < 41) {
            self.var_c681e4c1 = 1;
            self.a.nodeath = 1;
            self.skipdeath = 1;
            self scene::play(#"hash_63e7247bd535ac3", "death", self);
        }
    }
    if (isalive(self)) {
        self util::stop_magic_bullet_shield();
        self kill();
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x8265998f, Offset: 0xaa58
// Size: 0x11c
function function_d250e19f() {
    level endon(#"hash_5165eae58971e849");
    level scene::add_scene_func(#"hash_3da87aac371213c7", &function_28a8f735, "init");
    level scene::add_scene_func(#"hash_3da87aac371213c7", &function_e9a58f7a, "done");
    level flag::wait_till("flag_reached_tea_house_upper_floor");
    level thread scene::play(#"hash_3da87aac371213c7", "init");
    level flag::wait_till("start_vignette_react_surprise_doorway");
    level scene::play(#"hash_3da87aac371213c7", "play");
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0xaa146278, Offset: 0xab80
// Size: 0xc4
function function_28a8f735(ents) {
    level endon(#"hash_5165eae58971e849", #"hash_40479a1aa0d08514");
    util::waittill_any_ents(ents[#"hash_7dff84d726898ca9"], "damage", ents[#"hash_7dff83d726898af6"], "damage", ents[#"hash_7dff84d726898ca9"], "start_context_melee", ents[#"hash_7dff83d726898af6"], "start_context_melee");
    level flag::set("start_vignette_react_surprise_doorway");
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x44d02a39, Offset: 0xac50
// Size: 0x1bc
function function_e9a58f7a(ents) {
    level endon(#"hash_5165eae58971e849");
    var_adfb6bb7 = getent("red_door_defend_vol", "targetname");
    foreach (ent in ents) {
        if (isalive(ent)) {
            ent thread ai::set_goal_ent(var_adfb6bb7);
        }
    }
    trigger::wait_till("trigger_mortar_upper_enemy_mortar_building_balcony_fodder");
    function_1eaaceab(ents);
    a_enemies = array::get_touching(ents, var_adfb6bb7);
    spawner::simple_spawn_single("mortar_red_door_defender", &function_1aeb0a0a);
    for (i = a_enemies.size; i < 1; i++) {
        spawner::simple_spawn_single("mortar_red_door_defender", &function_1aeb0a0a);
        wait(0.5);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xad99c54f, Offset: 0xae18
// Size: 0x24
function function_1aeb0a0a() {
    self setpersonalthreatbias(level.player, 2000);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x1e54e8, Offset: 0xae48
// Size: 0xd4
function function_eb90b3e8() {
    level endon(#"hash_5165eae58971e849");
    level scene::add_scene_func(#"hash_28a87063776ee7d0", &function_6c337113, "init");
    level flag::wait_till("flag_mortar_upper_mortar_building_reached");
    level scene::play(#"hash_28a87063776ee7d0", "init");
    level scene::remove_scene_func(#"hash_28a87063776ee7d0", &function_6c337113, "init");
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0xd3089771, Offset: 0xaf28
// Size: 0x11c
function function_6c337113(a_ents) {
    enemy = a_ents[#"actor 1"];
    level endon(#"hash_7f77ed6cb213acc2");
    enemy endon(#"death");
    enemy thread function_566d3929();
    level flag::wait_till("vign_cust_arm_engage_2_wall_death_01_flag");
    enemy thread function_e12e064f();
    enemy thread function_be0c7630();
    enemy scene::play(#"hash_28a87063776ee7d0", "start", enemy);
    if (!isdefined(enemy.var_724e738)) {
        enemy scene::play(#"hash_28a87063776ee7d0", "loop", enemy);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x741be43c, Offset: 0xb050
// Size: 0xe4
function function_be0c7630() {
    self endon(#"death");
    if (!level flag::get("vign_cust_arm_engage_2_wall_death_01_flag_proximity")) {
        level flag::wait_till_timeout(5, "vign_cust_arm_engage_2_wall_death_01_flag_proximity");
    }
    if (isalive(self)) {
        self.var_724e738 = 1;
        if (!isdefined(self.var_b0587b14)) {
            self scene::stop(#"hash_28a87063776ee7d0");
            self ai::force_goal(getnode("node_tea_house_walkway", "targetname"), 1);
        }
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x8115fbe1, Offset: 0xb140
// Size: 0x114
function function_566d3929() {
    level endon(#"hash_c03b08566d9b84");
    self endon(#"death");
    self waittill(#"damage");
    level notify(#"hash_7f77ed6cb213acc2");
    self thread scene::play(#"hash_28a87063776ee7d0", "start", self);
    wait(0.5);
    level scene::stop(#"hash_28a87063776ee7d0");
    if (isalive(self)) {
        self util::stop_magic_bullet_shield();
        self ai::force_goal(getnode("node_tea_house_walkway", "targetname"), 1);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xca246661, Offset: 0xb260
// Size: 0x1ec
function function_e12e064f() {
    waitresult = self waittill(#"damage", #"death");
    self thread function_119bac80(waitresult.attacker);
    self scene::stop();
    if (isdefined(waitresult.weapon) && isdefined(waitresult.attacker)) {
        if (waitresult.weapon.weapclass === "spread" && distance2dsquared(self.origin, waitresult.attacker.origin) < sqr(300) && !isdefined(self.var_724e738)) {
            self.a.nodeath = 1;
            self.skipdeath = 1;
            self.var_b0587b14 = 1;
            self thread scene::play(#"hash_28a87063776ee7d0", "death", self);
            self waittill(#"hash_2491f09933c1ede5");
            physicsexplosionsphere(self.origin, 300, 0, 0.5, 0, 0);
            return;
        }
    }
    if (isalive(self)) {
        self util::stop_magic_bullet_shield();
        self kill();
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xf0ead255, Offset: 0xb458
// Size: 0x84
function function_c1a89a46() {
    level endon(#"hash_5165eae58971e849");
    level flag::wait_till("flag_mortar_upper_mortar_building_reached");
    while (true) {
        ai_enemy = spawner::simple_spawn_single("vign_cust_arm_door_roll_entr_01_guy", &function_5e509636);
        if (isdefined(ai_enemy)) {
            break;
        }
        waitframe(1);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xde7a2d5f, Offset: 0xb4e8
// Size: 0x1b4
function function_5e509636() {
    self endon(#"death");
    self val::set(#"hash_1fb751fa6e63d1a1", "takedamage", 0);
    self val::set(#"hash_1fb751fa6e63d1a1", "allowdeath", 0);
    if (!isalive(level.player)) {
        return;
    }
    level.player endon(#"death");
    level scene::init(#"hash_784dfc24afdbcdbc", self);
    level trigger::wait_till("start_vignette_door_roll_enter");
    s_lookat = struct::get("s_door_roll_enter_lookat");
    while (!level.player util::is_looking_at(s_lookat, 0.92, 1) && !level flag::get("flag_vignette_door_roll_enter_failsafe")) {
        waitframe(1);
    }
    level scene::add_scene_func(#"hash_784dfc24afdbcdbc", &function_a3bea266, "play");
    level scene::play(#"hash_784dfc24afdbcdbc", self);
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x194b0eb2, Offset: 0xb6a8
// Size: 0xc4
function function_a3bea266(a_ents) {
    var_a10bca5b = a_ents[#"actor"];
    if (isalive(var_a10bca5b)) {
        var_a10bca5b val::reset(#"hash_1fb751fa6e63d1a1", "takedamage");
        var_a10bca5b val::reset(#"hash_1fb751fa6e63d1a1", "allowdeath");
    }
    level scene::remove_scene_func(#"hash_784dfc24afdbcdbc", &function_a3bea266, "play");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x1bc568e, Offset: 0xb778
// Size: 0x12c
function function_dcf0253() {
    level flag::set("flag_mortar_start_upper");
    level thread function_9f638ce0("trigger_mortar_right_path", "trigger_mortar_upper_right_path", "flag_mortar_right_path");
    level thread function_9f638ce0("trigger_mortar_left_path", "trigger_mortar_upper_left_path", "flag_mortar_left_path");
    level thread function_de2d35ad();
    level thread function_320d2594();
    level thread function_696dc659();
    level thread function_ebdd60f9();
    level thread function_2f56897b();
    level thread function_cee5e544();
    level thread function_d0039deb();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xc7ea58de, Offset: 0xb8b0
// Size: 0x148
function function_2f56897b() {
    level endon(#"hash_5978cad75e234c6");
    level flag::wait_till_any(array("flag_mortar_cleanup_mortar_alley", "flag_spawn_mortar_upper_spawner_wave_3"));
    e_volume = getent("vol_cleanup_mortar_alley", "targetname");
    var_e8643004 = array::get_touching(level.player getenemies(), e_volume);
    foreach (enemy in var_e8643004) {
        enemy util::stop_magic_bullet_shield();
        enemy kill();
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xbed639db, Offset: 0xba00
// Size: 0xe4
function function_696dc659() {
    level endon(#"hash_5978cad75e234c6");
    level flag::wait_till("flag_mortar_left_path");
    if (isdefined(getent("mortar_center_alley_spawn_trig", "targetname"))) {
        getent("mortar_center_alley_spawn_trig", "targetname") delete();
    }
    if (isdefined(getent("mortar_upper_center_alley_spawn_trig", "targetname"))) {
        getent("mortar_upper_center_alley_spawn_trig", "targetname") delete();
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x9e6ef25f, Offset: 0xbaf0
// Size: 0x11c
function function_ebdd60f9() {
    level endon(#"hash_3f5c464766ee575b");
    level scene::add_scene_func(#"hash_42257f84442daa06", &function_cbca12b3, "play");
    waitresult = level flag::wait_till_any(array("flag_mortar_center_alley_guys_spawned", "flag_mortar_center_alley_scene"));
    if (waitresult._notify === "flag_mortar_center_alley_guys_spawned") {
        spawner::simple_spawn("mortar_spawner_center_alley");
    } else {
        level scene::play(#"hash_42257f84442daa06");
    }
    level scene::remove_scene_func(#"hash_42257f84442daa06", &function_cbca12b3, "play");
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0xd6acb8cd, Offset: 0xbc18
// Size: 0x1a0
function function_cbca12b3(a_ents) {
    a_nodes = getnodearray("mortar_alley_cover_node", "script_noteworthy");
    a_nodes = array::sort_by_script_int(a_nodes, 1);
    foreach (ent in a_ents) {
        if (isalive(ent)) {
            switch (ent.anim_debug_name) {
            case #"actor 1":
                var_fd0cc5ae = a_nodes[0];
                break;
            case #"actor 2":
                var_fd0cc5ae = a_nodes[1];
                break;
            case #"actor 3":
                var_fd0cc5ae = a_nodes[2];
                break;
            }
            ent.script_objective = "armada_mortar_start";
            ent ai::set_behavior_attribute("disablepeek", 1);
            ent thread ai::set_goal_node(var_fd0cc5ae);
        }
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 3, eflags: 0x2 linked
// Checksum 0x4dd68c89, Offset: 0xbdc0
// Size: 0xdc
function function_9f638ce0(str_trigger, var_d1f6ccc2, str_flag) {
    level flag::wait_till_any(array("flag_mortar_upper_mortar_building_reached", str_flag));
    e_trigger = getent(str_trigger, "targetname");
    var_5122a7f4 = getent(var_d1f6ccc2, "targetname");
    if (isdefined(e_trigger)) {
        e_trigger delete();
    }
    if (isdefined(var_5122a7f4)) {
        var_5122a7f4 delete();
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xeb64862, Offset: 0xbea8
// Size: 0xfc
function function_320d2594() {
    level endon(#"hash_4bed89f9695b49f4", #"hash_5978cad75e234c6");
    trigger::wait_till("mg_spawn_go");
    wait(8);
    enemies = spawner::simple_spawn("mortar_enemy_spawner_main_building", &function_6f2bf98c);
    wait(randomfloatrange(8, 12));
    spawner::waittill_ai_group_ai_count("mortar_ai_final_building", 4);
    enemies = spawner::simple_spawn("mortar_upper_spawner_wave_2", &function_6f2bf98c);
    level thread function_6d64338f();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x9044f7de, Offset: 0xbfb0
// Size: 0x54
function function_6f2bf98c() {
    self endon(#"death");
    level flag::wait_till("flag_mortar_upper_mortar_building_reached");
    self ai::set_goal("mortar_tea_house_vol");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x4efe4b9, Offset: 0xc010
// Size: 0x23c
function function_d0039deb() {
    level endon(#"hash_4bed89f9695b49f4");
    level flag::wait_till("flag_mortar_upper_mortar_building_reached");
    ai_enemy = spawner::simple_spawn_single("upper_floor_teahouse_enemy_spawner");
    ai_enemy endon(#"death");
    ai_enemy val::set(#"hash_fb8bee3ba8ce5d1", "ignoreme", 1);
    ai_enemy val::set(#"hash_1fac57f5e88471f2", "ignoreall", 1);
    ai_enemy thread ai::set_goal_node(getnode("node_teahouse_enemy_start", "targetname"));
    level util::waittill_any_ents(ai_enemy, "damage", level, "flag_tea_house_enemy_fall_back");
    ai_enemy val::reset(#"hash_1fac57f5e88471f2", "ignoreall");
    ai_enemy clearforcedgoal();
    ai_enemy setignoreent(level.buddy, 1);
    ai_enemy setpersonalthreatbias(level.player, 2000);
    ai_enemy ai::set_goal_node(getnode("node_teahouse_enemy_fallback_01", "targetname"));
    level flag::wait_till_timeout(20, "vign_cust_arm_engage_2_wall_death_01_flag");
    ai_enemy val::reset(#"hash_fb8bee3ba8ce5d1", "ignoreme");
    ai_enemy setignoreent(level.buddy, 0);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x7d1bd55e, Offset: 0xc258
// Size: 0x144
function function_cee5e544() {
    level endon(#"hash_5978cad75e234c6");
    while (!isdefined(level.buddy)) {
        wait(0.5);
    }
    level.buddy endon(#"death");
    level flag::wait_till_all(array("mortar_ai_final_building_cleared", "mortar_ai_wave_2_cleared"));
    level flag::set("flag_mortar_courtyard_ai_cleared");
    level flag::clear("flag_enable_mortar_courtyard_color_chain");
    level.buddy colors::color_force_goal(getnode("nd_mortar_tea_house_exterior", "targetname"));
    level.buddy waittill(#"goal", #"near_goal");
    level flag::set("flag_sims_reached_tea_house_vo");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x8387fd62, Offset: 0xc3a8
// Size: 0x13c
function function_6d64338f() {
    level endon(#"hash_4bed89f9695b49f4");
    s_waitresult = level flag::wait_till_any(array("flag_mortar_right_path", "flag_mortar_left_path", "flag_mortar_upper_courtyard_reached", "flag_spawn_mortar_upper_spawner_wave_3", "flag_mortar_courtyard_mg_gunner_attack"));
    if (s_waitresult._notify === "flag_mortar_left_path") {
        str_spawner = "right";
    } else {
        str_spawner = "left";
    }
    spawner::waittill_ai_group_ai_count("mortar_ai_final_building", 3);
    enemies = spawner::simple_spawn("mortar_upper_spawner_wave_3_" + str_spawner);
    level flag::wait_till("mortar_ai_wave_3_" + str_spawner + "_cleared");
    level flag::set("mortar_ai_wave_3_cleared");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x63b95671, Offset: 0xc4f0
// Size: 0x94
function function_287230c8() {
    self endon(#"death");
    level flag::wait_till_all(array("mortar_ai_final_building_cleared", "mortar_ai_wave_2_cleared"));
    self.grenadeammo = 0;
    self.health = 25;
    wait(randomfloatrange(0.5, 1));
    self kill();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x8fb14daa, Offset: 0xc590
// Size: 0xdc
function function_de2d35ad() {
    level endon(#"hash_4bed89f9695b49f4");
    var_2c462f31 = function_ac42a1bb();
    trigger::wait_till("mg_spawn_go");
    var_5deea171 = spawner::simple_spawn_single("mortar_combat_enemy_spawner_main_turret");
    if (isdefined(var_5deea171)) {
        var_5deea171.health *= 2;
        var_5deea171 thread function_250de527();
        var_5deea171 thread function_8ed36c06();
    }
    var_2c462f31[0] thread function_ce707a4(var_2c462f31[1]);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x34caef50, Offset: 0xc678
// Size: 0xa0
function function_ac42a1bb() {
    var_d93ed883 = getnode("mortar_alley_turret_node", "targetname");
    var_1280faf3 = function_1a2a3760(var_d93ed883);
    if (!is_true(var_1280faf3.magic_bullet_shield)) {
        var_1280faf3 util::magic_bullet_shield();
    }
    return [var_1280faf3, var_d93ed883];
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x71144c08, Offset: 0xc720
// Size: 0x4c
function function_8ed36c06() {
    self endon(#"death");
    level waittill(#"hash_6d5dee70f2cbd555");
    wait(0.25);
    self kill();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x6bc2fbd0, Offset: 0xc778
// Size: 0x60
function function_250de527() {
    self waittill(#"death");
    level notify(#"hash_443f87164a353a53");
    wait(randomfloatrange(3, 5));
    level notify(#"hash_2ddc22588860a7a5");
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x89caff8f, Offset: 0xc7e0
// Size: 0x28c
function function_ce707a4(var_d93ed883) {
    self endon(#"death");
    if (!isalive(level.player)) {
        return;
    }
    level.player endon(#"death");
    self val::set(#"hash_31f9be3fd33c0a82", "ignoreme", 1);
    self util::make_sentient();
    self setteam(#"axis");
    self turret::set_on_target_angle(5);
    self turret::set_burst_parameters(1, 2, 0.25, 0.5, 0);
    self turret::set_ignore_line_of_sight(0);
    self turret::function_f5e3e1de(1);
    self turret::set_target(level.player);
    self turret::function_49c3b892(level.player);
    self val::set(#"hash_6825518d9d655f50", "ignoreme", 1);
    self thread function_7b37dd50(var_d93ed883);
    level waittill(#"hash_443f87164a353a53");
    setenablenode(var_d93ed883, 0);
    s_weapon = struct::get("mg42_weapon_spawn_loc");
    var_e77bdd5f = util::spawn_model(s_weapon.model, s_weapon.origin, s_weapon.angles);
    waitframe(1);
    self util::stop_magic_bullet_shield();
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x2d493f82, Offset: 0xca78
// Size: 0x120
function function_7b37dd50(var_d93ed883) {
    level endon(#"hash_443f87164a353a53");
    self endon(#"death");
    while (true) {
        level function_ad03d12c(1);
        level function_ad03d12c(0);
        setenablenode(var_d93ed883, 0);
        if (issentient(self)) {
            self function_60d50ea4();
        }
        wait(randomintrange(15, 20));
        setenablenode(var_d93ed883, 1);
        if (!issentient(self)) {
            self makesentient();
        }
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0xd21af146, Offset: 0xcba0
// Size: 0xa4
function function_ad03d12c(b_used) {
    level endon(#"hash_443f87164a353a53");
    if (b_used) {
        level flag::wait_till("flag_mortar_mg_turret_in_use");
        level flag::clear("flag_mortar_mg_turret_not_in_use");
        return;
    }
    level flag::wait_till("flag_mortar_mg_turret_not_in_use");
    level flag::clear("flag_mortar_mg_turret_in_use");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x80f724d1, Offset: 0xcc50
// Size: 0x4
function function_af189a4c() {
    
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x9532363d, Offset: 0xcc60
// Size: 0x5c
function function_80089cc9() {
    level thread function_3d691322();
    level flag::wait_till("obj_flag_mortar_site_a");
    level objectives::complete("armada_obj_mortar_orbit_clear_mortar");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xb5147478, Offset: 0xccc8
// Size: 0x75c
function function_3d691322() {
    var_e361d345 = struct::get("obj_mortar_bunker_door", "targetname");
    var_dadfdd0e = struct::get("obj_mortar_bunker", "targetname");
    var_83809bc3 = struct::get("obj_upper_mortar_dossier", "targetname");
    level thread namespace_72b0499b::function_132ea7de();
    namespace_72b0499b::music("6.0_red_door_stinger", undefined, "flag_reached_tea_house_upper_floor_hallway");
    level objectives::goto("armada_obj_mortar_goto_red_door", struct::get("obj_mortar_alley").origin, #"hash_56b4845f8e5f7fe6");
    level objectives::function_67f87f80("armada_obj_mortar_goto_red_door", undefined, #"hash_51461abc9db00516");
    level flag::wait_till_any(array("flag_mortar_alley_reached", "flag_mortar_upper_mortar_building_reached", "flag_reached_tea_house_upper_floor", "flag_mortar_reached_red_door"));
    level objectives::function_60645c02("armada_obj_mortar_goto_red_door", struct::get("obj_mortar_tea_house_exterior").origin);
    level flag::wait_till_any(array("flag_mortar_upper_mortar_building_reached", "flag_reached_tea_house_upper_floor", "flag_mortar_reached_red_door"));
    level objectives::function_60645c02("armada_obj_mortar_goto_red_door", struct::get("obj_mortar_tea_house_upper_floor").origin);
    level flag::wait_till_any(array("flag_reached_tea_house_upper_floor", "flag_mortar_reached_red_door"));
    level objectives::function_60645c02("armada_obj_mortar_goto_red_door", struct::get("obj_mortar_tea_house_upper_floor_door").origin);
    level flag::wait_till_any(array("flag_reached_tea_house_upper_floor_door", "flag_mortar_reached_red_door"));
    level objectives::function_60645c02("armada_obj_mortar_goto_red_door", struct::get("obj_mortar_tea_house_upper_floor_hallway").origin);
    level flag::wait_till_any(array("flag_reached_tea_house_upper_floor_hallway", "flag_mortar_reached_red_door"));
    level objectives::complete("armada_obj_mortar_goto_red_door");
    level.buddy.allowbattlechatter[#"bc"] = 0;
    level objectives::function_4eb5c04a("armada_obj_mortar_open_red_door", var_e361d345.origin, #"hash_56b4845f8e5f7fe6");
    var_e361d345 util::create_cursor_hint(undefined, (0, 0, 3), #"hash_725b894f542049b0", 64, undefined, undefined, undefined, 128);
    var_e361d345 prompts::set_objective("armada_obj_mortar_open_red_door");
    var_e361d345 waittill(#"trigger");
    playsoundatposition(#"hash_122a651ea798052a", (0, 0, 0));
    namespace_72b0499b::music("7.0_intel");
    level notify(#"hash_1c61fc6e80974e9");
    level function_315508be();
    if (isdefined(getent("mortar_brush_main_door_closed", "targetname"))) {
        getent("mortar_brush_main_door_closed", "targetname") delete();
    }
    level objectives::complete("armada_obj_mortar_open_red_door");
    level notify(#"hash_3354b2d7a0b8d36a");
    level thread function_110866d();
    level thread function_766af271();
    level.player thread function_4bf5cfff();
    level waittilltimeout(23, #"hash_e17270abc5bbc3a");
    level objectives::goto("armada_obj_mortar_pickup_dossier", var_83809bc3.origin + (0, 0, 3), #"hash_6d35027c1e7e2463", 1, 0);
    var_83809bc3 util::create_cursor_hint(undefined, (0, 0, 0), #"hash_2830457a70bfc369", 64, undefined, undefined, undefined, 256);
    var_83809bc3 prompts::set_objective("armada_obj_mortar_pickup_dossier");
    var_83809bc3 waittill(#"trigger");
    player_decision::function_8c0836dd(1);
    objectives::complete("armada_obj_mortar_pickup_dossier");
    level thread function_a1de7ea2();
    level waittill(#"hash_5084b114ffe7e4aa");
    namespace_72b0499b::music("8.0_landing");
    if (isdefined(getent("mortar_brush_exfil_door_closed", "targetname"))) {
        getent("mortar_brush_exfil_door_closed", "targetname") delete();
    }
    level flag::set("obj_flag_mortar_site_a");
    level flag::set("flag_mortar_site_a_complete");
    level notify(#"hash_85243554b3f96e1");
    callback::remove_on_ai_killed(&function_a02983f8);
    level savegame::function_7790f03();
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0xfecbb3ea, Offset: 0xd430
// Size: 0x8c
function function_a6fea06f(*params) {
    if (isdefined(level.player)) {
        level.player setmovespeedscale(1);
        level.player util::function_749362d7(0);
        level.player val::reset(#"hash_34ed04d5046328af", "show_crosshair");
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x78759f7f, Offset: 0xd4c8
// Size: 0x164
function function_e49e80d4() {
    level objectives::goto("armada_obj_meet_adler", struct::get("obj_courtyard_mortar", "targetname").origin, #"hash_7287f315f3148647");
    level objectives::function_67f87f80("armada_obj_meet_adler", undefined, #"hash_328f8e17f92baffd");
    level flag::wait_till("flag_obj_mortar_exfil_coutryard");
    level objectives::function_60645c02("armada_obj_meet_adler", struct::get("mortar_exfil_chopper_land_loc", "targetname").origin);
    level flag::wait_till("obj_flag_mortar_exfil_location");
    level objectives::function_60645c02("armada_obj_meet_adler", level.var_7466d419);
    level flag::wait_till("obj_flag_mortar_exfil");
    level objectives::complete("armada_obj_meet_adler");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xc8fd1d86, Offset: 0xd638
// Size: 0xac
function function_ca649730() {
    level flag::wait_till("flag_sims_moveto_stairs_cover");
    level.player dialogue::queue("vox_cp_armd_00007_adlr_alrightletsgore_10");
    level flag::wait_till("exfil_flyby_go");
    wait(2);
    level.buddy dialogue::queue("vox_cp_armd_00006_sims_gobacktothebird_ae");
    wait(1);
    level thread function_4c8e7a76(0);
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x49f5b690, Offset: 0xd6f0
// Size: 0x174
function function_4c8e7a76(var_7e2c51d8) {
    if (!is_true(var_7e2c51d8)) {
        namespace_b7cfe907::function_51923449();
        level.player dialogue::queue("vox_cp_armd_00007_rpcd_badgernineronet_ae");
        wait(0.5);
        level.vip dialogue::queue("vox_cp_armd_00007_adlr_wereinboundnowr_fe");
        wait(0.5);
        level.player dialogue::queue("vox_cp_armd_00007_rpcd_rogerthatninero_42");
        namespace_b7cfe907::function_f1a80dd();
    }
    level flag::wait_till("flag_player_controlled_huey");
    namespace_b7cfe907::function_51923449();
    wait(1);
    level.player dialogue::queue("vox_cp_armd_00007_plt1_badgernineronei_92");
    wait(1);
    level.player dialogue::queue("vox_cp_armd_00007_adlr_vcarealloverthe_69");
    wait(0.5);
    level.player dialogue::queue("vox_cp_armd_00007_adlr_alltargetsareva_e9");
    namespace_b7cfe907::function_f1a80dd();
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x9dc178f3, Offset: 0xd870
// Size: 0x14c
function function_110866d(b_init = 0) {
    level.player endon(#"death");
    a_ents = [];
    a_ents[#"player"] = level.player;
    a_ents[#"maindoor"] = getent("mortar_bunker_door", "targetname");
    if (b_init) {
        level scene::init(#"hash_604c13090504ecb1", a_ents);
        return;
    }
    level thread scene::play(#"hash_604c13090504ecb1", "open_door", a_ents);
    level waittill(#"hash_688abb2ff6189b0b");
    level.player setmovespeedscale(0.43);
    level.player util::function_749362d7(1);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x371974c8, Offset: 0xd9c8
// Size: 0xc4
function function_766af271() {
    a_ents = [];
    a_ents[#"buddy"] = level.buddy;
    level scene::add_scene_func(#"hash_5705e398ad93ac99", &function_e8f2d444, "play");
    level scene::add_scene_func(#"hash_5705e398ad93ac99", &function_ce1faca, "stop");
    level thread scene::play(#"hash_5705e398ad93ac99", a_ents);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x1167a6af, Offset: 0xda98
// Size: 0xf4
function function_4bf5cfff() {
    self endon(#"disconnect");
    self thread lui::screen_fade(1.5, 0.5, 0, "white", 0, "red_door_postfx_fade", 0);
    wait(0.15);
    self clientfield::set_to_player("" + #"hash_7474973a37272b2c", 2);
    wait(2);
    self thread lui::screen_fade(1.5, 0, 0.5, "white", 0, "red_door_postfx_fade", 0);
    wait(0.15);
    self clientfield::set_to_player("" + #"hash_7474973a37272b2c", 0);
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x16c41cb8, Offset: 0xdb98
// Size: 0x1fc
function function_a1de7ea2(b_init = 0) {
    a_ents = [];
    a_ents[#"player"] = level.player;
    a_ents[#"buddy"] = level.buddy;
    a_ents[#"hash_43d8e88908e5b103"] = getent("mortar_door_exfil_right", "targetname");
    a_ents[#"hash_123dc66ffa6dca8e"] = getent("mortar_door_exfil_left", "targetname");
    if (b_init) {
        level scene::add_scene_func(#"hash_7d15d57d22684df", &function_cd1dcfed, "sims_exit");
        level scene::init(#"hash_7d15d57d22684df", a_ents);
        return;
    }
    level scene::stop(#"hash_5705e398ad93ac99");
    level flag::set("flag_start_mv_intell_collect_scene");
    level flag::set("flag_enable_mortar_exfil_color_chain");
    level thread scene::play(#"hash_7d15d57d22684df", "sims_exit", a_ents);
    level waittill(#"hash_75b0c983ee63db5");
    level thread function_262e8906();
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x80dec50d, Offset: 0xdda0
// Size: 0x5c
function function_e8f2d444(a_ents) {
    a_ents[#"enemy2"].var_c681e4c1 = 1;
    level scene::remove_scene_func(#"hash_5705e398ad93ac99", &function_e8f2d444, "play");
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0xbc105294, Offset: 0xde08
// Size: 0x7c
function function_ce1faca(a_ents) {
    if (isdefined(a_ents[#"prop 1"])) {
        a_ents[#"prop 1"] delete();
    }
    level scene::remove_scene_func(#"hash_5705e398ad93ac99", &function_ce1faca, "stop");
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0xc8b403e4, Offset: 0xde90
// Size: 0xec
function function_262e8906(var_50cc0d4f) {
    a_ents = [];
    a_ents[#"buddy"] = level.buddy;
    if (!is_true(var_50cc0d4f)) {
        level scene::play(#"hash_7d15d57d22684df", "sims_stairs", a_ents);
    }
    level thread scene::play(#"hash_7d15d57d22684df", "sims_stairs_idle", a_ents);
    level flag::wait_till("flag_sims_moveto_stairs_cover");
    level thread scene::play(#"hash_7d15d57d22684df", "sims_stairs_exit", a_ents);
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0xebf03fa2, Offset: 0xdf88
// Size: 0x10c
function function_cd1dcfed(ents) {
    var_fe4a8480 = ents[#"hash_5ceedd5d7dd341aa"];
    waitframe(10);
    level.player playgestureviewmodel("ges_body_shield_gundown");
    level.player val::set(#"hash_34ed04d5046328af", "show_crosshair", 0);
    if (isdefined(var_fe4a8480)) {
        var_fe4a8480 endon(#"death");
        level waittill(#"hash_71953685356f645f");
        var_fe4a8480 hide();
    }
    level scene::remove_scene_func(#"hash_7d15d57d22684df", &function_cd1dcfed, "sims_exit");
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x0
// Checksum 0xa2779f8d, Offset: 0xe0a0
// Size: 0x34
function function_6896ea8a(var_43baa908) {
    spawner::simple_spawn_single("aib_t9_vign_cust_arm_run_2_cover_guy", &function_cb65a5e8, var_43baa908);
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x4e7bf1cb, Offset: 0xe0e0
// Size: 0xd4
function function_cb65a5e8(var_43baa908) {
    self val::set(#"hash_2cb3bfd28a6ec1d8", "ignoreme", 1);
    self thread scene::play(#"hash_2cb3bfd28a6ec1d8", "Shot 1", self);
    if (var_43baa908) {
        level waittill(#"hash_75b0c983ee63db5");
    }
    self scene::play(#"hash_2cb3bfd28a6ec1d8", "Shot 2", self);
    self val::reset(#"hash_2cb3bfd28a6ec1d8", "ignoreme");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x724efd7e, Offset: 0xe1c0
// Size: 0xb8
function function_315508be() {
    foreach (enemy in getaiteamarray(#"axis")) {
        enemy util::stop_magic_bullet_shield();
        enemy deletedelay();
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 2, eflags: 0x2 linked
// Checksum 0xcb94c6e5, Offset: 0xe280
// Size: 0x3f4
function function_997dda5e(var_d3440450, var_50cc0d4f) {
    if (var_50cc0d4f) {
        level thread util::screen_fade_out(0, "black", "mortar_exfil_flow_fade");
        level namespace_b7cfe907::function_6a03d24d(var_d3440450);
        level flag::set("flag_enable_mortar_exfil_color_chain");
        level clientfield::set("toggle_dynsignage_mortartown", 1);
        level util::delay(0.5, undefined, &clientfield::set, "toggle_dynsignage_mortartown", 0);
        level thread namespace_b7cfe907::function_2647f901("mortar_village_completed");
        level thread util::screen_fade_in(1.5, "black", "mortar_exfil_flow_fade");
        level.player util::function_749362d7(1);
        level function_a1de7ea2();
        level.buddy thread colors::set_force_color("g");
        level thread function_92d60a9d();
        level function_6b5096fe();
        level thread savegame::checkpoint_save();
    }
    spawner::add_spawn_function_ai_group("exfil_ambush_ai", &function_d4168442);
    level thread function_b2b6c923();
    level thread function_e49e80d4();
    level thread function_ca649730();
    level flag::wait_till("flag_mortar_exfil_fly_finished");
    level.player endon(#"disconnect", #"death");
    snd::function_7db65a93(#"hash_2b94ea847ae2b667");
    level function_9290ebb3();
    level.var_7466d419 vehicle_ai::clearallmovement(1);
    level.var_7466d419 function_24c9e377();
    level flag::set("mortar_village_completed");
    level skipto::function_4e3ab877(var_d3440450, 0);
    next_obj = "player_controlled_huey_01";
    level skipto::function_51726ac8([next_obj], 0, level.player);
    level.buddy ai::disable_careful();
    level.buddy thread colors::set_force_color("b");
    level.buddy.allowbattlechatter[#"bc"] = 1;
    level.player util::delay(5, "death", &show);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x9324bd3c, Offset: 0xe680
// Size: 0x1bc
function function_a4b20ce7() {
    if (isdefined(getent("mortar_door_exfil_right", "targetname"))) {
        getent("mortar_door_exfil_right", "targetname") delete();
    }
    if (isdefined(getent("mortar_door_exfil_left", "targetname"))) {
        getent("mortar_door_exfil_left", "targetname") delete();
    }
    if (isdefined(getent("mortar_brush_exfil_door_closed", "targetname"))) {
        getent("mortar_brush_exfil_door_closed", "targetname") delete();
    }
    if (isdefined(getent("mortar_brush_main_door_closed", "targetname"))) {
        getent("mortar_brush_main_door_closed", "targetname") delete();
    }
    if (isdefined(getent("mortar_brush_main_door_open", "targetname"))) {
        getent("mortar_brush_main_door_open", "targetname") delete();
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x0
// Checksum 0xacbeb8c6, Offset: 0xe848
// Size: 0x184
function function_b74e1deb() {
    mdl_door_right = getent("mortar_door_exfil_right", "targetname");
    mdl_door_left = getent("mortar_door_exfil_left", "targetname");
    var_717add76 = struct::get("mortar_door_exfil_right_open");
    var_669027f4 = struct::get("mortar_door_exfil_left_open");
    mdl_door_right.origin = var_717add76.origin;
    mdl_door_right.angles = var_717add76.angles;
    mdl_door_left.origin = var_669027f4.origin;
    mdl_door_left.angles = var_669027f4.angles;
    if (isdefined(getent("mortar_brush_main_door_open", "targetname"))) {
        getent("mortar_brush_main_door_open", "targetname") delete();
    }
    if (isdefined(getent("mortar_brush_exfil_door_closed", "targetname"))) {
        getent("mortar_brush_exfil_door_closed", "targetname") delete();
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 4, eflags: 0x2 linked
// Checksum 0x3b1c5a8f, Offset: 0xe9d8
// Size: 0x124
function function_a11d0dcc(*name, *starting, *direct, *player) {
    level flag::set("flag_mortar_village_complete");
    level flag::set("flag_bamboo_end_end");
    level thread function_a4b20ce7();
    if (isdefined(getent("mortar_courtyard_sign_model", "targetname"))) {
        getent("mortar_courtyard_sign_model", "targetname") delete();
    }
    if (isdefined(level.var_52874eb2)) {
        level.var_52874eb2 entname::remove();
    }
    if (isdefined(level.var_7466d419)) {
        level.var_7466d419 entname::remove();
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xb0c7b3a6, Offset: 0xeb08
// Size: 0xc4
function function_b2b6c923() {
    level.player endon(#"death");
    level thread function_e6ca6b4d();
    level thread function_91c4756f();
    level notify(#"hash_14c598f73c025763");
    level function_2d9dc4d1();
    level function_58771ad7();
    level function_bd16430c();
    level flag::set("flag_mortar_exfil_fly_finished");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x347675c9, Offset: 0xebd8
// Size: 0xdc
function function_e6ca6b4d() {
    level scene::add_scene_func(#"hash_8c22a80935b1a86", &function_9c91c0b5, "done");
    level flag::wait_till("flag_exfil_exit_guards");
    level thread scene::play(#"hash_8c22a80935b1a86");
    level flag::wait_till("flag_spawn_exfil_courtyard_enemies");
    if (level scene::is_active(#"hash_8c22a80935b1a86")) {
        level scene::stop(#"hash_8c22a80935b1a86");
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x9d7efed0, Offset: 0xecc0
// Size: 0x14c
function function_9c91c0b5(a_ents) {
    var_1f3a4780 = getnodearray("mortar_exit_cover_nodes", "targetname");
    foreach (ent in a_ents) {
        if (isalive(ent)) {
            ent.script_objective = "armada_mortar_exfil";
            var_fd0cc5ae = arraygetclosest(ent.origin, var_1f3a4780);
            if (isdefined(var_fd0cc5ae)) {
                ent thread ai::force_goal(var_fd0cc5ae);
            }
        }
    }
    level scene::remove_scene_func(#"hash_8c22a80935b1a86", &function_9c91c0b5, "done");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xccd47e6a, Offset: 0xee18
// Size: 0x9c
function function_79299255() {
    level endon(#"hash_4f204ce88e3333b7", #"hash_aeed06d84cf1327");
    self endon(#"death");
    level flag::wait_till("flag_entered_exfil_courtyard");
    level flag::clear("flag_enable_mortar_exfil_color_chain");
    level scene::play(#"hash_15f9f35b939d1d86", self);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x1f895f61, Offset: 0xeec0
// Size: 0x96
function function_7cbced04() {
    self playsound("evt_chopper_strafe_flyby");
    wait(0.3);
    self thread function_be014f32();
    self turret::fire_for_time(1, 3);
    self turret::fire_for_time(1, 4);
    self notify(#"hash_254e7fb941cc8d9d");
}

// Namespace armada_mortar/namespace_e6855491
// Params 3, eflags: 0x2 linked
// Checksum 0x9cd84e89, Offset: 0xef60
// Size: 0xfc
function function_7c644fb3(ai, var_9114191, var_8b118adb) {
    if (!isdefined(ai)) {
        return;
    }
    ai endon(#"death");
    self endon(#"death");
    self thread turret::function_1bc8c31c(ai, undefined, var_9114191, var_8b118adb);
    wait(randomfloatrange(0.3, 0.7));
    if (isalive(ai) && is_true(ai.allowdeath)) {
        ai dodamage(self.health + 666, self.origin);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x48061cd, Offset: 0xf068
// Size: 0x9c
function function_be014f32() {
    self playsound("wpn_strafe_fire_start_npc");
    self playloopsound("wpn_strafe_fire_loop_npc");
    self waittill(#"hash_254e7fb941cc8d9d");
    wait(0.5);
    self playsound("wpn_strafe_fire_stop_npc");
    self stoploopsound(1);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x121c0631, Offset: 0xf110
// Size: 0x694
function function_58771ad7() {
    level notify(#"hash_78f5eb15e6763d58");
    level.var_7466d419 thread turret::disable(1);
    level.var_7466d419 thread turret::disable(2);
    var_48236d2c = struct::get("tag_align_mortar_exfil");
    a_ents = [];
    a_ents[#"pilot"] = level.pilot;
    a_ents[#"copilot"] = level.copilot;
    a_ents[#"buddy"] = level.buddy;
    a_ents[#"hash_4972abe0166bbc73"] = level.var_7466d419;
    a_ents[#"player"] = level.player;
    a_ents[#"vip"] = level.vip;
    a_ents[#"gunner"] = level.gunner;
    level namespace_b7cfe907::function_3af72756(level.var_7466d419, level.pilot, "driver");
    level namespace_b7cfe907::function_3af72756(level.var_7466d419, level.copilot, "passenger1");
    level namespace_b7cfe907::function_3af72756(level.var_7466d419, level.vip, "crew");
    level namespace_b7cfe907::function_3af72756(level.var_7466d419, level.gunner, "gunner1");
    level scene::init(#"hash_3ed153e5b694beab", a_ents);
    level flag::wait_till(#"hash_126584dbc61499eb");
    level.gunner sethighdetail(1);
    level.vip sethighdetail(1);
    level.buddy sethighdetail(1);
    level clientfield::set("" + #"hash_4ee03d623b77b0c2", 1);
    level.var_7466d419 makevehicleunusable();
    level.var_7466d419 thread function_7cbced04();
    level.buddy thread function_79299255();
    level scene::play(#"hash_3ed153e5b694beab", "arrival", a_ents);
    level scene::play(#"hash_3ed153e5b694beab", "in", a_ents);
    level flag::set("obj_flag_mortar_exfil_location");
    level thread function_c09e7d39();
    level.var_7466d419 thread turret::disable(3);
    level.var_7466d419 thread turret::disable(4);
    level thread scene::play(#"hash_3ed153e5b694beab", "loop", a_ents);
    level flag::set("obj_flag_mortar_exfil");
    level function_cdf5e193();
    namespace_72b0499b::music("9.0_flying");
    level flag::set("flag_start_mortar_exfil");
    level scene::stop(#"hash_15f9f35b939d1d86");
    level.var_7466d419 turretsettargetangles(1, (0, 0, 0));
    level scene::play(#"hash_3ed153e5b694beab", "out", a_ents);
    level.gunner sethighdetail(0);
    level.vip sethighdetail(0);
    level.buddy sethighdetail(0);
    level clientfield::set("" + #"hash_4ee03d623b77b0c2", 0);
    level.player val::reset(#"animation_shared", "disable_weapons");
    level vehicle::get_in(level.pilot, level.var_7466d419, "driver");
    level vehicle::get_in(level.copilot, level.var_7466d419, "passenger1");
    level vehicle::get_in(level.vip, level.var_7466d419, "crew");
    level vehicle::get_in(level.buddy, level.var_7466d419, "crew");
    function_e9339cdf();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x310079c6, Offset: 0xf7b0
// Size: 0xdc
function function_e9339cdf() {
    if (!level flag::get(#"hash_53c7d32dc75bd3ea")) {
        a_ents = [];
        a_ents[#"gunner"] = level.gunner;
        a_ents[#"hash_4972abe0166bbc73"] = level.var_7466d419;
        level.var_7466d419 thread scene::play(#"hash_51fd44b722fb5b2d", a_ents);
        level flag::set(#"hash_53c7d32dc75bd3ea");
    }
    level.var_7466d419 turretsettargetangles(1, (0, 0, 0));
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x101c746, Offset: 0xf898
// Size: 0xec
function function_cdf5e193() {
    var_338850b9 = struct::get("obj_mortar_exfil_chopper", "targetname");
    level objectives::function_4eb5c04a("armada_obj_board_exfil_huey", var_338850b9.origin, #"hash_18816c129c6324ee");
    var_338850b9 util::create_cursor_hint(undefined, (0, 0, -3), #"hash_3b23a8397807c7de", 64, undefined, undefined, undefined, 128);
    var_338850b9 prompts::set_objective("armada_obj_board_exfil_huey");
    var_338850b9 waittill(#"trigger");
    objectives::complete("armada_obj_board_exfil_huey");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xbe7404f4, Offset: 0xf990
// Size: 0xa6
function function_c09e7d39() {
    foreach (ai in spawner::get_ai_group_ai("mortar_village_exfil")) {
        if (isalive(ai)) {
            ai.health = 25;
        }
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xab081cbb, Offset: 0xfa40
// Size: 0xac
function function_9290ebb3() {
    a_ents = [];
    a_ents[#"player"] = level.player;
    a_ents[#"hash_4972abe0166bbc73"] = level.var_7466d419;
    level.var_7466d419 thread function_f89fbd1e();
    level.var_7466d419 scene::play(#"hash_4535fa2b00f13577", a_ents);
    level.player hide();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xd3de7826, Offset: 0xfaf8
// Size: 0x124
function function_f89fbd1e() {
    self endon(#"death");
    var_48236d2c = struct::get("s_mortar_exfil_takeoff_2");
    s_lookat = struct::get("obj_fly_3_return_00_m");
    self setspeed(30, 20, 20);
    self vehlookat(s_lookat.origin);
    self function_a57c34b7(var_48236d2c.origin, 1, 0);
    self settargetyaw((0, var_48236d2c.angles[1], 0)[1]);
    self setgoalyaw((0, var_48236d2c.angles[1], 0)[1]);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xd0af3940, Offset: 0xfc28
// Size: 0x44
function function_bd16430c() {
    level.var_7466d419 vehicle::script_resume_speed("setspeed", 50);
    util::stop_magic_bullet_shield(level.var_7466d419);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xee2ef5ee, Offset: 0xfc78
// Size: 0x8c
function function_d4168442() {
    self endon(#"death");
    self val::set("exfil_ambush", "ignoreme", 1);
    self setpersonalthreatbias(level.player, 2000);
    wait(3);
    self val::reset("exfil_ambush", "ignoreme");
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x38522d30, Offset: 0xfd10
// Size: 0x71c
function function_6b5096fe() {
    if (!isdefined(level.var_52874eb2)) {
        level.var_52874eb2 = vehicle::simple_spawn_single("spawner_heli_adler");
        level.var_52874eb2 thread namespace_b7cfe907::function_9ac0bc90([0, 1]);
        level.var_52874eb2 turret::set_team(#"allies", 1);
        level.var_52874eb2 turret::set_team(#"allies", 2);
        level.var_52874eb2 turret::set_team(#"allies", 3);
        level.var_52874eb2 turret::set_team(#"allies", 4);
        level.var_52874eb2 turret::set_burst_parameters(1, 2, 0.25, 0.5, 1);
        level.var_52874eb2 turret::set_burst_parameters(1, 2, 0.25, 0.5, 2);
        level.var_52874eb2 turret::set_burst_parameters(1, 2, 0.25, 0.5, 3);
        level.var_52874eb2 turret::set_burst_parameters(1, 2, 0.25, 0.5, 4);
        level.var_52874eb2 turret::set_torso_targetting(1, -12);
        level.var_52874eb2 turret::set_torso_targetting(2, -12);
        level.var_52874eb2 turret::set_torso_targetting(3, -12);
        level.var_52874eb2 turret::set_torso_targetting(4, -12);
        level.var_52874eb2 turret::set_target_leading(1, 0.1);
        level.var_52874eb2 turret::set_target_leading(2, 0.1);
        level.var_52874eb2 turret::set_target_leading(3, 0.1);
        level.var_52874eb2 turret::set_target_leading(4, 0.1);
    }
    if (level.var_52874eb2.vehicletype != #"hash_308369147254321b") {
        level.var_52874eb2 setvehicletype(#"hash_308369147254321b");
    }
    if (!isdefined(level.gunner)) {
        namespace_b7cfe907::function_166083c9(0, undefined, 1);
    }
    if (!isdefined(level.vip)) {
        namespace_b7cfe907::function_882e6973(0, undefined, 1);
    }
    level.var_52874eb2 flag::set("crew1_occupied");
    level vehicle::get_in(level.vip, level.var_52874eb2, "crew", 1);
    level vehicle::get_in(level.gunner, level.var_52874eb2, "gunner1", 1);
    level.var_52874eb2 turretsettargetangles(1, (0, 0, 0));
    level.var_52874eb2 thread entname::add(#"hash_2dac672dcc262015", #"allies");
    level.var_52874eb2 setteam(#"allies");
    util::magic_bullet_shield(level.var_52874eb2);
    level.var_52874eb2.drivepath = 1;
    level.var_52874eb2.var_54b19f55 = 1;
    params = spawnstruct();
    params.no_clear_movement = 1;
    params.var_a22ee662 = 1;
    level.var_52874eb2.soundmod = "heli";
    level.var_52874eb2 vehicle_ai::set_state("scripted", params);
    level.var_52874eb2 vehicle::toggle_sounds(1);
    level.var_52874eb2 setrotorspeed(1);
    level.var_52874eb2 cleartargetyaw();
    level.var_52874eb2 cleargoalyaw();
    level.var_52874eb2 setyawspeed(20, 20, 20);
    level.var_52874eb2 setmaxpitchroll(60, 60);
    level.var_52874eb2.var_cb55c804 = 256;
    level.var_52874eb2 setneargoalnotifydist(level.var_52874eb2.var_cb55c804);
    level.var_52874eb2 turret::disable(1);
    level.var_52874eb2 turret::disable(2);
    level.var_52874eb2 turret::disable(3);
    level.var_52874eb2 turret::disable(4);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x7d3480da, Offset: 0x10438
// Size: 0xe4
function function_73b45723() {
    if (isdefined(level.var_52874eb2)) {
        if (is_true(level.var_52874eb2.var_2295c5e7)) {
            level.var_52874eb2 namespace_b7cfe907::function_5677b6eb();
        }
        level namespace_b7cfe907::function_3af72756(level.var_52874eb2, level.vip, "crew");
        level namespace_b7cfe907::function_3af72756(level.var_52874eb2, level.gunner, "gunner1");
        util::stop_magic_bullet_shield(level.var_52874eb2);
        level.var_52874eb2 deletedelay();
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0xdfe252b0, Offset: 0x10528
// Size: 0x1ac
function function_2d9dc4d1() {
    if (!isdefined(level.var_7466d419)) {
        namespace_b7cfe907::function_27e76b4c("heli_spawn_mortar_exit_to_bamboo");
    }
    if (is_true(level.var_7466d419.var_2295c5e7)) {
        level.var_7466d419 namespace_b7cfe907::function_5677b6eb();
    }
    level function_73b45723();
    level.var_7466d419 thread entname::add(#"hash_681bce072c58be1f", #"allies");
    level.var_7466d419 cleartargetyaw();
    level.var_7466d419 cleargoalyaw();
    level.var_7466d419 setyawspeed(40, 20, 20);
    level.var_7466d419 setmaxpitchroll(10, 30);
    level namespace_b7cfe907::function_882e6973(1);
    level namespace_b7cfe907::function_14a42357(1);
    level namespace_b7cfe907::function_e1635dfe(1);
    level namespace_b7cfe907::function_166083c9(1);
    level namespace_b7cfe907::function_37fc8bb();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x3e32b3ce, Offset: 0x106e0
// Size: 0xd4
function function_ba10e034() {
    self endon(#"death");
    self waittill(#"hash_2717c5ec282f117c");
    self turret::set_burst_parameters(1, 2, 0.25, 0.5, 1);
    self turret::set_torso_targetting(1, -12);
    self turret::set_target_leading(1, 0.1);
    self turret::enable(1, 0);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x0
// Checksum 0xe5a6d553, Offset: 0x107c0
// Size: 0x5c
function function_285ff4e4() {
    for (i = 0; i < 5; i++) {
        spawner::simple_spawn_single("sp_vh_pch_convoy_01", &function_13d13395, i);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x15dc7f7f, Offset: 0x10828
// Size: 0x14c
function function_13d13395(n_index) {
    self endon(#"death");
    self setteam(#"axis");
    self.health = int(self.health * 0.1);
    self callback::function_d8abfc3d(#"on_vehicle_killed", &namespace_722cc932::function_edf88bbb);
    var_8be533d2 = "nd_pch_convoy_01_0" + n_index + 1;
    nd_path = getvehiclenode(var_8be533d2, "targetname");
    self thread vehicle::get_on_and_go_path(nd_path);
    level flag::wait_till("flag_mortar_orbit_site_b_enemies_spawn");
    wait(5);
    self vehicle::detach_path();
    self deletedelay();
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x330b816d, Offset: 0x10980
// Size: 0xdc
function function_92d60a9d() {
    hidemiscmodels("p9_fxanim_cp_armada_town_bldg_06_01_static_mod");
    hidemiscmodels("p9_fxanim_cp_armada_town_bldg_06_02_static_mod");
    hidemiscmodels("p9_fxanim_cp_armada_town_bldg_06_03_static_mod");
    hidemiscmodels("p9_fxanim_cp_armada_town_bldg_14_01_static_mod");
    hidemiscmodels("p9_fxanim_cp_armada_town_bldg_14_02_static_mod");
    hidemiscmodels("p9_fxanim_cp_armada_town_bldg_14_03_static_mod");
    hidemiscmodels("p9_fxanim_cp_armada_town_bldg_14_04_static_mod");
    hidemiscmodels("p9_fxanim_cp_armada_town_court_01_static_mod");
    hidemiscmodels("p9_fxanim_cp_armada_town_court_02_static_mod");
}

// Namespace armada_mortar/namespace_e6855491
// Params 7, eflags: 0x2 linked
// Checksum 0xf3c14e3, Offset: 0x10a68
// Size: 0x4ca
function function_1df2273d(*destructible_event, attacker, *weapon, *piece_index, *point, *dir, *mod) {
    if (mod === level.player) {
        level notify(#"hash_20b54b22a8747044");
    }
    if (!isdefined(self.script_noteworthy)) {
        return;
    }
    earthquake(0.25, 1, self.origin, 10000);
    level.player playrumbleonentity("damage_heavy");
    switch (self.script_noteworthy) {
    case #"hash_ca1398592862981":
        level scene::play(#"hash_7d136efada0c9af0");
        showmiscmodels("p9_fxanim_cp_armada_town_bldg_06_01_static_mod");
        level function_97bcc0e9(#"hash_7d136efada0c9af0");
        break;
    case #"hash_ca1368592862468":
        level scene::play(#"hash_72f8f56116f32b17");
        showmiscmodels("p9_fxanim_cp_armada_town_bldg_06_02_static_mod");
        level function_97bcc0e9(#"hash_72f8f56116f32b17");
        break;
    case #"hash_ca137859286261b":
        level scene::play(#"hash_35db7f3d2c472306");
        showmiscmodels("p9_fxanim_cp_armada_town_bldg_06_03_static_mod");
        level function_97bcc0e9(#"hash_35db7f3d2c472306");
        break;
    case #"hash_65f4d60588e2b888":
        level scene::play(#"hash_5e055056aa386e1f");
        showmiscmodels("p9_fxanim_cp_armada_town_bldg_14_01_static_mod");
        level function_97bcc0e9(#"hash_5e055056aa386e1f");
        break;
    case #"hash_65f4d90588e2bda1":
        level scene::play(#"hash_6c7177a6718884b8");
        showmiscmodels("p9_fxanim_cp_armada_town_bldg_14_02_static_mod");
        level function_97bcc0e9(#"hash_6c7177a6718884b8");
        break;
    case #"hash_65f4d80588e2bbee":
        level scene::play(#"hash_1fb12697821542a1");
        showmiscmodels("p9_fxanim_cp_armada_town_bldg_14_03_static_mod");
        level function_97bcc0e9(#"hash_1fb12697821542a1");
        break;
    case #"hash_65f4db0588e2c107":
        level scene::play(#"hash_1464d638ee5e23aa");
        showmiscmodels("p9_fxanim_cp_armada_town_bldg_14_04_static_mod");
        level function_97bcc0e9(#"hash_1464d638ee5e23aa");
        break;
    case #"hash_27d72049793f0ba2":
        level scene::play(#"hash_1849fb3a90d16a1");
        showmiscmodels("p9_fxanim_cp_armada_town_court_01_static_mod");
        level function_97bcc0e9(#"hash_1849fb3a90d16a1");
        break;
    case #"hash_27d71f49793f09ef":
        level scene::play(#"hash_60671afc06cb038e");
        showmiscmodels("p9_fxanim_cp_armada_town_court_02_static_mod");
        level function_97bcc0e9(#"hash_60671afc06cb038e");
        break;
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x214daf4b, Offset: 0x10f40
// Size: 0x2c
function function_97bcc0e9(var_22702838) {
    level scene::stop(var_22702838, 1);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x1053f5af, Offset: 0x10f78
// Size: 0x44
function function_2e52b6f9() {
    array::run_all(getentarray("mortar_orbit_barrels", "script_barrel_group"), &delete);
}

// Namespace armada_mortar/namespace_e6855491
// Params 0, eflags: 0x2 linked
// Checksum 0x13e71db, Offset: 0x10fc8
// Size: 0x64
function function_91c4756f() {
    for (i = 1; i <= 2; i++) {
        spawner::simple_spawn_single("sp_vh_mortar_town_escape_0" + i, &function_11696ae, i);
    }
}

// Namespace armada_mortar/namespace_e6855491
// Params 1, eflags: 0x2 linked
// Checksum 0x74f3ca8e, Offset: 0x11038
// Size: 0x194
function function_11696ae(n_index) {
    self endon(#"death");
    self setteam(#"axis");
    self vehicle::lights_on();
    self vehicle::toggle_force_driver_taillights(1);
    self vehicle::toggle_sounds(1);
    self vehicle::toggle_exhaust_fx(1);
    self callback::function_d8abfc3d(#"on_vehicle_killed", &namespace_722cc932::function_edf88bbb);
    nd_path = getvehiclenode("nd_mortar_town_escape_0" + n_index, "targetname");
    self thread vehicle::get_on_path(nd_path);
    level flag::wait_till("exfil_flyby_go");
    self thread vehicle::go_path();
    util::waittill_any_ents(level, "mortar_village_completed", self, "reached_end_node");
    self deletedelay();
}

