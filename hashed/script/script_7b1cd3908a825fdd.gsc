// Atian COD Tools GSC CW decompiler test
#using script_92d4d637814fefa;
#using script_190d6b82bcca0908;
#using script_113dd7f0ea2a1d4f;
#using scripts\zm_common\zm_zonemgr.gsc;
#using script_4421226bbc54b398;
#using scripts\zm_common\zm_vote.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using scripts\zm_common\objective_manager.gsc;
#using scripts\zm_common\callbacks.gsc;
#using script_27347f09888ad15;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\killstreaks\helicopter_shared.gsc;
#using script_72d96920f15049b8;
#using script_1cc417743d7c262d;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\content_manager.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_591b4396;

// Namespace namespace_591b4396/level_init
// Params 1, eflags: 0x20
// Checksum 0x33a37196, Offset: 0x4c8
// Size: 0x154
function event_handler[level_init] main(*eventstruct) {
    objective_manager::register_script(#"exfil", undefined, &function_3b4a24e2, #"exfil", #"hash_550113857d521cf0", #"hash_7d1368d8d487beed", 4, #"hash_248bfcefe7e51481", &function_39eec401);
    hidemiscmodels("exfil_border");
    var_bbdb0dfe = getent("exfil_heli_slick", "targetname");
    if (isdefined(var_bbdb0dfe)) {
        var_bbdb0dfe moveto(var_bbdb0dfe.origin + (0, 0, -100), 0.1);
        var_bbdb0dfe notsolid();
    }
    if (zm_utility::is_classic()) {
        callback::on_round_end(&on_round_end);
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0xa245befa, Offset: 0x628
// Size: 0x55c
function function_3b4a24e2(instance) {
    if (isdefined(level.var_fdcaf3a6)) {
        return;
    }
    level.var_fdcaf3a6 = instance;
    level.var_fdcaf3a6.useweapon = getweapon(#"hash_52ea38778c7d2fb3");
    level.no_powerups = 1;
    level.var_fdcaf3a6.var_de401243 = 0;
    if (!isdefined(level.var_4bc7192d)) {
        level.var_4bc7192d = #"hash_437293ae239af1ab";
    }
    if (isdefined(level.var_baed3b8e)) {
        setdvar(#"hkai_pathfinditerationlimit", level.var_baed3b8e);
    }
    if (isdefined(level.var_ac94c2b8)) {
        function_9d4cc726(#"zombiefindfleshservice", level.var_ac94c2b8);
    }
    level flag::wait_till(#"gameplay_started");
    if (zm_utility::is_classic()) {
        level notify(#"end_round_think");
        level notify(#"end_of_round");
        waitframe(1);
        level zm_utility::function_9ad5aeb1(0, 1);
        if (level clientfield::get("dog_round_fog_bank")) {
            level thread clientfield::set("dog_round_fog_bank", 0);
        }
        showmiscmodels("exfil_border");
        wait(0.75);
        level thread cleanup_main();
    }
    if (zm_utility::is_survival()) {
        level.var_acd0f67e = 7;
    }
    level callback::callback(#"hash_594217387367ebb4");
    if (isdefined(level.var_a353323e)) {
        level thread [[ level.var_a353323e ]]();
    }
    if (isdefined(level.var_c29bf3b6)) {
        if (level.var_c29bf3b6 != "none") {
            level thread util::delay(5, "end_game", &zm_vo::function_7622cb70, level.var_c29bf3b6);
        }
    } else {
        level thread util::delay(5, "end_game", &zm_vo::function_7622cb70, #"hash_42e688981c992280");
    }
    var_28bf3706 = instance.contentgroups[#"heli_spawn"][0];
    do {
        waitframe(1);
        level.var_117d5f10 = vehicle::spawn(undefined, "exfil_heli", level.var_4bc7192d, var_28bf3706.origin, var_28bf3706.angles);
    } while (!isdefined(level.var_117d5f10));
    level.var_117d5f10 function_d733412a(0);
    var_3ec7083c = instance.contentgroups[#"hash_216188a7e7b381a6"][0];
    if (!isdefined(var_3ec7083c.radius)) {
        var_3ec7083c.radius = 2000;
    }
    if (!isdefined(var_3ec7083c.height)) {
        var_3ec7083c.height = 500;
    }
    var_3ec7083c.radius = int(var_3ec7083c.radius);
    var_3ec7083c.height = int(var_3ec7083c.height);
    if (isdefined(level.var_26ed6a07)) {
        var_3ec7083c.radius = level.var_26ed6a07;
    }
    if (isdefined(level.var_c86f12d4)) {
        var_3ec7083c.height = level.var_c86f12d4;
    }
    level thread function_839b3d5a(var_3ec7083c);
    if (is_true(getgametypesetting("zmExfilRound"))) {
        wait(15);
    }
    level thread function_17f88f7c(var_3ec7083c);
    level.var_117d5f10 thread function_c70a47c(var_3ec7083c);
    if (!isdefined(level.var_bc21b9a)) {
        level.var_bc21b9a = &function_5dd89100;
    }
    level thread [[ level.var_bc21b9a ]]();
    level thread function_31125f54();
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0x269a63b6, Offset: 0xb90
// Size: 0x66c
function function_c70a47c(var_3ec7083c) {
    instance = var_3ec7083c.parent;
    self val::set("exfil_heli", "takedamage", 0);
    self makevehicleusable();
    self setrotorspeed(1);
    self setseatoccupied(0, 1);
    self vehicle::toggle_tread_fx(1);
    level thread helicopter::function_eca18f00(self, #"hash_5793213ec26a2aa5");
    if (zm_utility::is_classic()) {
        self.drivepath = 1;
    }
    self vehicle::get_on_and_go_path(function_60c104b6(instance, "heli_spawn"));
    waitframe(1);
    if (getdvarint(#"hash_30cc86d56c8c1b94", 1)) {
        var_90df9642 = function_60c104b6(instance, "exfil_land_path_loop");
        if (isdefined(var_90df9642)) {
            level.var_9cf56dcc = 1;
            self makevehicleunusable();
            self thread vehicle::get_on_and_go_path(var_90df9642);
        }
    }
    level thread function_3919ed28();
    level flag::set("exfil_heli_arrived");
    objective_setposition(level.var_fdcaf3a6.var_e55c8b4e, self.origin + (0, 0, -48));
    objective_onentity(level.var_fdcaf3a6.var_e55c8b4e, self);
    self pathvariableoffset((5, 5, 0), 1);
    self sethoverparams(30, 50, 50);
    level flag::wait_till_any(array(#"hash_81da36e4389f10a", #"exfil_cleared"));
    if (level flag::get(#"exfil_cleared")) {
        if (isdefined(level.var_139ceb46)) {
            if (level.var_139ceb46 != "none") {
                level thread zm_vo::function_7622cb70(level.var_139ceb46);
            }
        } else {
            level thread zm_vo::function_7622cb70(#"hash_6fdeb623f1cd8f6");
        }
    }
    foreach (player in getplayers()) {
        player thread function_2b530a78();
    }
    if (zm_utility::is_survival()) {
        var_6d85de92 = arraycombine(getentitiesinradius(var_3ec7083c.origin, 300, 12), getentitiesinradius(var_3ec7083c.origin, 300, 14));
        foreach (vehicle in var_6d85de92) {
            if (vehicle !== self) {
                vehicle thread zm_utility::function_78e620d();
            }
        }
    }
    if (isdefined(self)) {
        if (!is_true(level.var_9cf56dcc)) {
            self vehicle::get_off_path();
            self makevehicleunusable();
            self sethoverparams(3, 5, 10);
            self pathvariableoffset((5, 5, 0), 1);
        }
        level thread function_595332df();
        level thread function_aee71618(var_3ec7083c);
        var_2d5f5802 = function_60c104b6(instance, "exfil_land_path_start");
        if (isdefined(var_2d5f5802)) {
            if (is_true(level.var_9cf56dcc)) {
                self thread function_6cd23697(var_2d5f5802);
            } else {
                self vehicle::get_on_and_go_path(var_2d5f5802);
            }
        }
    }
    wait(10);
    level thread function_17afb20e(1);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x6 linked
// Checksum 0x614bfd5f, Offset: 0x1208
// Size: 0x64
function private function_6cd23697(var_2d5f5802) {
    self endon(#"death");
    self waittill(#"hash_63190ea460ceb993");
    self vehicle::get_off_path();
    waitframe(1);
    self vehicle::get_on_and_go_path(var_2d5f5802);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x6 linked
// Checksum 0xcb04ae6c, Offset: 0x1278
// Size: 0x8c
function private function_2b530a78() {
    self endon(#"death");
    level endon(#"objective_ended", #"hash_158779eefe4893d1", #"hash_4fbe4720f6f13107", #"end_game");
    wait(3);
    level.var_31028c5d prototype_hud::set_active_objective_string(self, #"hash_1ea76eb37bb646db");
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x6 linked
// Checksum 0x384669d, Offset: 0x1310
// Size: 0x154
function private function_aee71618(var_3ec7083c) {
    level endon(#"objective_ended", #"hash_158779eefe4893d1", #"hash_4fbe4720f6f13107", #"end_game");
    if (isdefined(level.var_de28bf87)) {
        wait(level.var_de28bf87);
    } else {
        wait(5);
    }
    s_interact = spawnstruct();
    s_interact.origin = var_3ec7083c.origin;
    if (is_true(level.var_9cf56dcc)) {
        n_trigger_radius = 3000;
    } else {
        n_trigger_radius = 450;
    }
    level.var_fdcaf3a6.trigger = content_manager::spawn_interact(s_interact, &function_39f35c4e, #"hash_1192710f818f1e47", undefined, n_trigger_radius, 400, undefined, (0, 0, 0));
    level.var_fdcaf3a6.trigger usetriggerrequirelookat(0);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x6 linked
// Checksum 0x4b3247e3, Offset: 0x1470
// Size: 0x12c
function private function_3919ed28() {
    if (isdefined(level.var_6363395e)) {
        if (level.var_6363395e != "none") {
            level zm_vo::function_7622cb70(level.var_6363395e);
        }
    } else {
        level zm_vo::function_7622cb70(#"hash_4e85c1603ed42114");
    }
    if (level flag::get(#"exfil_cleared")) {
        return;
    }
    level flag::wait_till(#"hash_fdc24944f59c262");
    if (isdefined(level.var_7c027cbe)) {
        if (level.var_7c027cbe != "none") {
            level thread zm_vo::function_7622cb70(level.var_7c027cbe, 2);
        }
        return;
    }
    level thread zm_vo::function_7622cb70(#"hash_362860f460a29841");
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0x26d856e3, Offset: 0x15a8
// Size: 0x104
function function_39f35c4e(*eventstruct) {
    level.var_fdcaf3a6.trigger delete();
    foreach (player in getplayers()) {
        objective_setinvisibletoplayer(level.var_fdcaf3a6.var_e55c8b4e, player);
        level.var_31028c5d prototype_hud::function_817e4d10(player, 0);
    }
    level thread function_17afb20e(1);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 2, eflags: 0x2 linked
// Checksum 0xf17a3585, Offset: 0x16b8
// Size: 0x6c
function function_60c104b6(instance, var_eece1f6a) {
    var_ec14921 = instance.contentgroups[var_eece1f6a][0].targetname;
    if (isdefined(var_ec14921)) {
        node = getvehiclenode(var_ec14921, "target");
        return node;
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x4
// Checksum 0xeebdcf52, Offset: 0x1730
// Size: 0xd4
function private function_3eef60e4(helicopter) {
    assert(!isdefined(helicopter.rope));
    helicopter.rope = util::spawn_anim_model(#"hash_508e38dfaf48d104", helicopter.origin);
    assert(isdefined(helicopter.rope));
    helicopter.rope notsolid();
    helicopter.rope linkto(helicopter, "tag_origin_animate");
    helicopter.rope hide();
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x6 linked
// Checksum 0xdcdeb636, Offset: 0x1810
// Size: 0x104
function private function_7082507b(helicopter) {
    assert(isdefined(helicopter.rope));
    helicopter endon(#"death", #"hash_4c9df8896f727a2e");
    helicopter.rope endon(#"death");
    helicopter.rope show();
    helicopter.rope animation::play(#"hash_2216bcebd33b5779", helicopter, "tag_origin_animate", 1, 0.2, 0.1, undefined, undefined, undefined, 0);
    helicopter notify(#"hash_13b3aacf002f7c8f");
    childthread function_89baf3(helicopter);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x6 linked
// Checksum 0x3f116ef4, Offset: 0x1920
// Size: 0x88
function private function_89baf3(helicopter) {
    assert(isdefined(helicopter.rope));
    while (true) {
        helicopter.rope animation::play(#"hash_79f7c6405bc5958e", helicopter, "tag_origin_animate", 1, 0.1, 0.1, undefined, undefined, undefined, 0);
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x0
// Checksum 0xa867dfa5, Offset: 0x19b0
// Size: 0x2f4
function function_1913632(helicopter) {
    level endon(#"exfil_cleared");
    wait(1.5);
    helicopter thread function_7082507b(helicopter);
    helicopter waittill(#"hash_13b3aacf002f7c8f");
    var_4adc70ee = (0, 0, 825);
    var_e442adb8 = helicopter.rope gettagorigin("carabiner_jnt") + var_4adc70ee;
    level.var_fdcaf3a6.trigger = spawn("trigger_radius_use", var_e442adb8, 0, 80, 100);
    level.var_fdcaf3a6.trigger setcursorhint("HINT_NOICON");
    level.var_fdcaf3a6.trigger sethintstring(#"hash_611e948769ca0bdf");
    level.var_fdcaf3a6.trigger triggerignoreteam();
    var_8e875f24 = gameobjects::create_use_object(#"none", level.var_fdcaf3a6.trigger, [], (0, 0, 0), #"hash_4339ca3866fea623", 1);
    var_8e875f24 gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
    var_8e875f24 gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
    var_8e875f24 gameobjects::set_use_time(1.5);
    var_8e875f24 gameobjects::set_onbeginuse_event(&onbeginuse);
    var_8e875f24 gameobjects::set_onenduse_event(&onenduse);
    var_8e875f24 gameobjects::set_onuse_event(&function_7c255771);
    var_8e875f24.useweapon = getweapon(#"hash_52ea38778c7d2fb3");
    var_8e875f24.var_dddda5d8 = 1;
    var_8e875f24.dontlinkplayertotrigger = 1;
    var_8e875f24 gameobjects::function_8f776dd0(1);
    level.var_fdcaf3a6.gameobject = var_8e875f24;
    level.var_b290ca72 = &function_d236f851;
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0x626a351b, Offset: 0x1cb0
// Size: 0x58
function function_d236f851(*player) {
    if (isdefined(level.var_fdcaf3a6.trigger) && self istouching(level.var_fdcaf3a6.trigger)) {
        return false;
    }
    return true;
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x2 linked
// Checksum 0xf7a3b04b, Offset: 0x1d10
// Size: 0x94
function function_7c255771() {
    var_3a8b4ddf = level.vip;
    if (!isdefined(var_3a8b4ddf) || is_true(var_3a8b4ddf.var_2c27f919)) {
        return;
    }
    level.var_fdcaf3a6.gameobject gameobjects::set_visible(#"hash_161f03feaadc9b8f");
    level thread function_93ef48b(var_3a8b4ddf, level.var_117d5f10);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 2, eflags: 0x2 linked
// Checksum 0x8bc9a77a, Offset: 0x1db0
// Size: 0x694
function function_93ef48b(vip, helicopter) {
    if (!isdefined(vip) || !isalive(vip) || !isdefined(helicopter) || !isdefined(self)) {
        return;
    }
    helicopter endon(#"death");
    vip val::set(#"exfil", "show_hud", 0);
    vip dontinterpolate();
    vip val::set(#"exfil", "disable_weapon_fire", 1);
    vip val::set(#"exfil", "takedamage", 0);
    vip val::set(#"exfil", "freezecontrols", 1);
    vip.oobdisabled = 1;
    var_867f5d0 = spawn("script_model", vip.origin);
    var_867f5d0.angles = vip getplayerangles();
    var_867f5d0 dontinterpolate();
    vip playerlinkto(var_867f5d0, undefined, 0, 0, 0, 0, 0);
    var_2bf4050a = 0.6;
    var_d892ba80 = helicopter.rope gettagorigin("carabiner_jnt") + (0, 0, 825);
    var_de324c05 = 5;
    var_867f5d0 function_3b897a2(vip, var_d892ba80, var_de324c05, var_2bf4050a);
    waittillframeend();
    if (!isdefined(vip) || !isalive(vip) || !isdefined(var_867f5d0)) {
        return;
    }
    helicopter thread function_ce44e2a8(helicopter);
    var_ba5977f4 = 40;
    var_a080de98 = helicopter gettagorigin("tag_enter_passenger1")[2] - var_ba5977f4;
    var_867f5d0.angles = vip getplayerangles();
    goalyaw = helicopter.angles[1] - 90;
    var_867f5d0 thread function_d914539a(goalyaw);
    while (isdefined(var_867f5d0) && isalive(vip) && var_867f5d0.origin[2] < var_a080de98 && isdefined(helicopter.rope)) {
        var_443bf2ea = vip gettagorigin("j_spineupper");
        var_70f8d8e1 = vip.origin - var_443bf2ea + var_de324c05 * anglestoforward(vip.angles);
        var_867f5d0.origin = helicopter.rope gettagorigin("carabiner_jnt") + var_70f8d8e1 + (0, 0, 825);
        waitframe(1);
    }
    if (!isdefined(vip) || !isalive(vip) || !isdefined(var_867f5d0)) {
        return;
    }
    level flag::set(#"hash_23a3320be9d9bcbb");
    vip unlink();
    var_867f5d0 delete();
    lerptime = 0.4;
    helicopter thread function_a34ad686();
    var_a3476af7 = helicopter gettagorigin("tag_passenger2");
    var_eb72be15 = helicopter gettagangles("tag_passenger2");
    vip startcameratween(lerptime, 0, 0);
    vip animation::play(#"hash_2021a3a93fd63eef", var_a3476af7, var_eb72be15, 1, 0, 0, lerptime, undefined, undefined, 1);
    waitframe(1);
    vip val::set(#"exfil", "disable_weapon_fire", 0);
    helicopter usevehicle(vip, 2);
    b_in_vehicle = 1;
    if (vip hasweapon(level.var_fdcaf3a6.useweapon)) {
        vip takeweapon(level.var_fdcaf3a6.useweapon);
    }
    helicopter makevehicleunusable();
    level flag::set(#"hash_1442cccc0c2806d6");
    if (isdefined(level.var_fdcaf3a6.trigger)) {
        level.var_fdcaf3a6.trigger delete();
    }
    vip function_9e79b1b7();
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x2 linked
// Checksum 0xb8400757, Offset: 0x2450
// Size: 0x3c
function function_a34ad686() {
    self animation::play(#"hash_2bf79afeff76c7d3", self, "tag_passenger2", 1, 0, 0, undefined, undefined, undefined, 0);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 4, eflags: 0x2 linked
// Checksum 0xd4619d4b, Offset: 0x2498
// Size: 0x12e
function function_3b897a2(vip, var_d892ba80, var_10890b28, movetime) {
    self endon(#"death");
    endtime = gettime() + int(movetime * 1000);
    while (isdefined(self) && isalive(vip) && gettime() < endtime) {
        var_443bf2ea = vip gettagorigin("j_spineupper");
        var_70f8d8e1 = vip.origin - var_443bf2ea + var_10890b28 * anglestoforward(vip.angles);
        goalpos = var_d892ba80 + var_70f8d8e1;
        self moveto(goalpos, movetime);
        waitframe(1);
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x6 linked
// Checksum 0x3a75027c, Offset: 0x25d0
// Size: 0xec
function private function_ce44e2a8(helicopter) {
    if (!isdefined(helicopter.rope)) {
        return;
    }
    helicopter endon(#"death");
    helicopter.rope endon(#"death");
    helicopter notify(#"hash_4c9df8896f727a2e");
    var_2e2c7ee7 = 0.5;
    helicopter.rope animation::play(#"hash_3f5deb4729726f2c", helicopter, "tag_origin_animate", var_2e2c7ee7, 0.2, 0.1, undefined, undefined, undefined, 0);
    if (isdefined(helicopter.rope)) {
        helicopter.rope delete();
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0xa60a0681, Offset: 0x26c8
// Size: 0x1ac
function function_d914539a(goalyaw) {
    self endon(#"death");
    var_ecaa456b = 1.9;
    var_9546359 = min(-75, self.angles[0]);
    var_64165cee = 0.6;
    var_44cf825 = math::clamp(var_64165cee / var_ecaa456b, 0, 1);
    var_bc4bc17d = anglelerp(self.angles[1], goalyaw, var_44cf825);
    var_fc27b3e3 = (var_9546359, var_bc4bc17d, 0);
    self rotateto(var_fc27b3e3, var_64165cee, 0.2, 0.1);
    wait(var_64165cee);
    if (!isdefined(self)) {
        return;
    }
    var_3c4cc94a = -60;
    var_f0d8f62c = math::clamp(var_ecaa456b - var_64165cee, 0, var_ecaa456b);
    var_cbb558d8 = (var_3c4cc94a, goalyaw, 0);
    self rotateto(var_cbb558d8, var_f0d8f62c, 0, min(var_f0d8f62c, 0.5));
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x2 linked
// Checksum 0x931741db, Offset: 0x2880
// Size: 0x9c
function function_9e79b1b7() {
    objective_setinvisibletoplayer(level.var_fdcaf3a6.var_e55c8b4e, self);
    level.var_31028c5d prototype_hud::function_817e4d10(self, 0);
    self function_3a488e53(0);
    self.var_2c27f919 = 1;
    self val::set(#"hash_4086023ba6ea23e2", "ignoreme", 1);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0x97cd6bc9, Offset: 0x2928
// Size: 0xc8
function function_17afb20e(b_success = 0) {
    level thread objective_manager::stop_timer();
    /#
        if (getdvarint(#"hash_33b0be96bf3cd69a", 0) && level flag::get(#"hash_23a3320be9d9bcbb")) {
            iprintlnbold("<unknown string>");
            return;
        }
    #/
    level notify(#"hash_4fbe4720f6f13107", {#b_success:b_success});
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0xa874f977, Offset: 0x29f8
// Size: 0x498
function function_839b3d5a(var_48236d2c) {
    level endon(#"objective_ended");
    foreach (player in getplayers()) {
        level.var_31028c5d prototype_hud::function_7491d6c5(player, #"hash_2138b0d3ea594968");
    }
    wait(5);
    foreach (player in getplayers()) {
        level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_2138b0d3ea594968");
        level.var_31028c5d prototype_hud::function_817e4d10(player, 2);
    }
    n_time = function_385ab693(var_48236d2c.origin);
    /#
        var_8e2567b1 = getdvarint(#"hash_1cd8f9d3f2b7a00e", 0);
        if (var_8e2567b1 > 0) {
            n_time = var_8e2567b1;
        }
    #/
    if (!is_true(level.var_921e6e85)) {
        level thread objective_manager::start_timer(n_time, "exfil");
        level thread function_c504b2d1();
        level thread function_8fcb0a(n_time);
    }
    var_48236d2c.var_4cdbc624 = spawn("trigger_radius", var_48236d2c.origin - (0, 0, var_48236d2c.height), 0, var_48236d2c.radius, var_48236d2c.height * 2);
    if (zm_utility::is_classic()) {
        var_652c0aa1 = 0;
        while (!var_652c0aa1) {
            foreach (player in getplayers()) {
                if (player zm_zonemgr::is_player_in_zone(level.var_ad5e81fe)) {
                    var_652c0aa1 = 1;
                    break;
                }
            }
            wait(0.5);
        }
    } else {
        var_48236d2c.var_4cdbc624 waittill(#"trigger");
        var_69c8822d = var_48236d2c.parent.contentgroups[#"hash_5819d8571ea7c838"][0];
        if (isdefined(var_69c8822d.script_noteworthy)) {
            level.var_97e461d4 = var_69c8822d.script_noteworthy;
        }
    }
    level flag::set(#"hash_3babb5bf72d208da");
    foreach (player in getplayers()) {
        player thread function_bf33dd82(var_48236d2c.var_4cdbc624);
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0xc1825a9b, Offset: 0x2e98
// Size: 0x234
function function_bf33dd82(var_4cdbc624) {
    self endon(#"death");
    self.v_train_inbound_igc = 0;
    while (!level flag::get(#"exfil_cleared") || !level flag::get(#"hash_fdc24944f59c262")) {
        if (isdefined(level.var_fdcaf3a6.var_d4245663)) {
            var_4cdbc624 = level.var_fdcaf3a6.var_d4245663;
        }
        if (is_true(self.var_2c27f919) || !self.v_train_inbound_igc && self function_591cb2f4(var_4cdbc624)) {
            level flag::set(#"hash_fdc24944f59c262");
            if (!level flag::get(#"exfil_cleared")) {
                if (zm_utility::is_classic()) {
                    level.var_31028c5d prototype_hud::set_active_objective_string(self, #"hash_1530af61f721d3e7");
                } else {
                    level.var_31028c5d prototype_hud::set_active_objective_string(self, #"hash_18a40982c5569db2");
                }
            }
            self.v_train_inbound_igc = 1;
        } else if (self.v_train_inbound_igc && !self function_591cb2f4(var_4cdbc624)) {
            level.var_31028c5d prototype_hud::set_active_objective_string(self, #"hash_2138b0d3ea594968");
            self.v_train_inbound_igc = 0;
        }
        wait(0.25);
    }
    self function_3a488e53(0, 0);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0x2d215018, Offset: 0x30d8
// Size: 0x3b4
function function_8fcb0a(var_3aeede0b) {
    level endon(#"objective_ended", #"hash_158779eefe4893d1", #"hash_4fbe4720f6f13107", #"end_game", #"exfil_cleared");
    if (var_3aeede0b >= 30) {
        var_cb54863d = max(var_3aeede0b - 30 - 1, 0);
        wait(var_cb54863d);
        if (isdefined(level.var_82a4a07)) {
            if (level.var_82a4a07 != "none") {
                level thread zm_vo::function_7622cb70(level.var_82a4a07);
            }
        } else {
            level thread zm_vo::function_7622cb70(#"hash_3c826fece0b3646c");
        }
        wait(15);
        if (isdefined(level.var_ee721ef7)) {
            if (level.var_ee721ef7 != "none") {
                level thread zm_vo::function_7622cb70(level.var_ee721ef7);
            }
        } else {
            level thread zm_vo::function_7622cb70(#"hash_785b3e9905f6511d");
        }
        wait(10);
        if (isdefined(level.var_24cfb8fb)) {
            if (level.var_24cfb8fb != "none") {
                level thread zm_vo::function_7622cb70(level.var_24cfb8fb);
            }
        } else {
            level thread zm_vo::function_7622cb70(#"hash_2aeb990c0cb76e97");
        }
        return;
    }
    if (var_3aeede0b >= 15) {
        var_a079cb0a = max(var_3aeede0b - 15 - 1, 0);
        wait(var_a079cb0a);
        if (isdefined(level.var_ee721ef7)) {
            if (level.var_ee721ef7 != "none") {
                level thread zm_vo::function_7622cb70(level.var_ee721ef7);
            }
        } else {
            level thread zm_vo::function_7622cb70(#"hash_785b3e9905f6511d");
        }
        wait(10);
        if (isdefined(level.var_24cfb8fb)) {
            if (level.var_24cfb8fb != "none") {
                level thread zm_vo::function_7622cb70(level.var_24cfb8fb);
            }
        } else {
            level thread zm_vo::function_7622cb70(#"hash_2aeb990c0cb76e97");
        }
        return;
    }
    var_a079cb0a = var_3aeede0b - 5 - 1;
    if (var_a079cb0a > 0) {
        wait(var_a079cb0a);
        if (isdefined(level.var_24cfb8fb)) {
            if (level.var_24cfb8fb != "none") {
                level thread zm_vo::function_7622cb70(level.var_24cfb8fb);
            }
            return;
        }
        level thread zm_vo::function_7622cb70(#"hash_2aeb990c0cb76e97");
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0x3b60fd8e, Offset: 0x3498
// Size: 0x1f2
function function_385ab693(var_fda8dff8) {
    if (isdefined(level.contentmanager.var_c4181ea)) {
        v_start = level.contentmanager.var_c4181ea.origin;
    } else {
        v_start = (0, 0, 0);
        a_players = function_a1ef346b();
        foreach (player in a_players) {
            v_start += player.origin;
        }
        v_start /= a_players.size;
    }
    n_dist = distance2d(var_fda8dff8, v_start);
    var_6b68b20f = n_dist / 10000;
    if (isdefined(level.var_aaf7505f)) {
        var_5dc3d377 = level.var_aaf7505f;
    } else {
        var_5dc3d377 = max(var_6b68b20f * 60, 60) + 45 + max(-30, min(30, 3 * level.var_b48509f9));
    }
    return int(min(900, var_5dc3d377));
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x2 linked
// Checksum 0x61b8ddcd, Offset: 0x3698
// Size: 0xc8
function function_c504b2d1() {
    level endon(#"objective_ended", #"hash_4fbe4720f6f13107");
    level waittill(#"hash_158779eefe4893d1");
    b_success = 0;
    if (level flag::get(#"exfil_cleared") && level flag::get(#"hash_fdc24944f59c262")) {
        b_success = 1;
    }
    level notify(#"hash_4fbe4720f6f13107", {#b_success:b_success});
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x2 linked
// Checksum 0x5cef6d87, Offset: 0x3768
// Size: 0xfd4
function function_31125f54() {
    if (!is_true(level.var_7dfc84b7)) {
        if (isdefined(level.var_8bb7479c)) {
            level thread scene::init_streamer(level.var_8bb7479c, getplayers(), 0, 0);
        }
        if (isdefined(level.var_72a3d8bc)) {
            level thread scene::init_streamer(level.var_72a3d8bc, getplayers(), 0, 0);
        }
    }
    waitresult = level waittill(#"hash_4fbe4720f6f13107");
    level.var_117d5f10 makevehicleunusable();
    if (isdefined(level.var_ae2fe3bd)) {
        level thread [[ level.var_ae2fe3bd ]](waitresult.b_success);
    } else {
        music::setmusicstate("none");
    }
    objective_setinvisibletoall(level.var_fdcaf3a6.var_e55c8b4e);
    level.var_117d5f10.animname = "helicopter";
    if (isdefined(level.var_fdcaf3a6.trigger)) {
        level.var_fdcaf3a6.trigger delete();
    }
    b_success = waitresult.b_success;
    if (b_success) {
        foreach (player in function_a1ef346b()) {
            player val::set("exfil", "takedamage", 0);
            player val::set("exfil", "allowdeath", 0);
            player namespace_d4ecbbf0::function_3a2e46e0(1);
            player zm_stats::function_fbce465a(#"hash_3d9156bfdb044b3b");
            if (zm_utility::is_survival()) {
                if ((isdefined(level.var_b48509f9) ? level.var_b48509f9 : 1) >= 3) {
                    player zm_stats::function_fbce465a(#"hash_7208e7149645434d");
                }
            } else if ((isdefined(level.round_number) ? level.round_number : 1) >= 15) {
                player zm_stats::function_fbce465a(#"hash_7208e7149645434d");
            }
            player zm_stats::increment_challenge_stat(#"hash_1a7ff6d1e1ff03b0");
            level.var_7c7c6c35 zm_game_over::set_state(player, isdefined(level.var_9f6064a4) ? level.var_9f6064a4 : #"hash_4677c7e6d02d1a65");
            player zm_stats::function_9daadcaa("survivalOutcome", isdefined(level.var_73677dfc) ? level.var_73677dfc : 1);
            player function_3a488e53(0);
            player function_8cf53a19();
        }
        foreach (player in getplayers()) {
            player.pers[#"outcome"] = #"win";
            if (is_true(player.var_e8bee75e)) {
                player stats::function_d0de7686(#"hash_5da5da5770a64639", 1, #"hash_4edbfffde3c9a22e");
            }
            if (isdefined(level.var_72a3d8bc) && isarray(player.var_231881b1) && isdefined(player.var_231881b1[level.var_72a3d8bc])) {
                player playerstreamerrequest("clear", player.var_231881b1[level.var_72a3d8bc]);
            }
            if (is_true(player.var_1bee6f4b)) {
                namespace_e8c18978::function_cf58dcdd(player, 1);
            }
        }
        level thread function_a7394b94(1);
        if (isdefined(level.var_6e297a0d)) {
            level [[ level.var_6e297a0d ]]();
        }
        level.var_117d5f10 unlink();
        if (isdefined(level.var_8bb7479c)) {
            if (is_true(level.var_9cf56dcc)) {
                level lui::screen_fade_out(0.5);
                level util::delay(0.3, undefined, &lui::screen_fade_in, 0.5);
            }
            level scene::play(level.var_8bb7479c, level.var_117d5f10);
            array::thread_all(getplayers(), &zm_utility::function_ee6da6f6);
        } else if (!isdefined(level.var_fdcaf3a6.target2) || level flag::get(#"hash_69567098e4924a9c")) {
            str_scene = #"aib_t9_vign_cust_sr_outro_success_01";
            s_scene = spawnstruct();
            s_scene.origin = level.var_117d5f10.origin;
            s_scene.angles = level.var_117d5f10.angles;
            s_scene thread scene::play(str_scene, level.var_117d5f10);
            wait(5);
        } else {
            a_s_scenes = struct::get_array(level.var_fdcaf3a6.target2);
            var_5770166f = [];
            foreach (s_scene in a_s_scenes) {
                str_scene = hash(s_scene.scriptbundlename);
                if (isdefined(str_scene) && isinarray(array(#"aib_t9_vign_cust_sr_outro_success_01", #"hash_58a2d842cde3bfdf"), str_scene)) {
                    if (!isdefined(var_5770166f)) {
                        var_5770166f = [];
                    } else if (!isarray(var_5770166f)) {
                        var_5770166f = array(var_5770166f);
                    }
                    var_5770166f[var_5770166f.size] = s_scene;
                }
            }
            var_88184ecd = array::random(var_5770166f);
            if (isdefined(var_88184ecd)) {
                var_88184ecd scene::play(level.var_117d5f10);
            } else {
                str_scene = #"aib_t9_vign_cust_sr_outro_success_01";
                s_scene = spawnstruct();
                s_scene.origin = level.var_117d5f10.origin;
                s_scene.angles = level.var_117d5f10.angles;
                s_scene scene::play(str_scene, level.var_117d5f10);
            }
            array::thread_all(getplayers(), &zm_utility::function_ee6da6f6, 23);
        }
    } else {
        foreach (player in getplayers()) {
            if (isdefined(level.var_8bb7479c) && isarray(player.var_231881b1) && isdefined(player.var_231881b1[level.var_8bb7479c])) {
                player playerstreamerrequest("clear", player.var_231881b1[level.var_8bb7479c]);
            }
            level.var_7c7c6c35 zm_game_over::set_state(player, isdefined(level.var_9f6064a4) ? level.var_9f6064a4 : #"hash_5f1b73095bbb3a7a");
            player zm_stats::function_9daadcaa("survivalOutcome", isdefined(level.var_73677dfc) ? level.var_73677dfc : 2);
            if (is_true(player.var_1bee6f4b)) {
                namespace_e8c18978::function_cf58dcdd(player, 1);
            }
        }
        level thread function_a7394b94(0);
        if (isdefined(level.var_3d458005)) {
            level [[ level.var_3d458005 ]]();
        }
        if (isdefined(level.var_72a3d8bc)) {
            level.var_117d5f10 unlink();
            level.var_117d5f10 show();
            level scene::play(level.var_72a3d8bc, level.var_117d5f10);
            array::thread_all(getplayers(), &function_e0bf1963);
        } else if (!isdefined(level.var_fdcaf3a6.target2)) {
            str_scene = #"aib_t9_vign_cust_sr_outro_fail_01";
            s_scene = spawnstruct();
            s_scene.origin = level.var_117d5f10.origin;
            s_scene.angles = level.var_117d5f10.angles;
            s_scene scene::play(str_scene, level.var_117d5f10);
            array::thread_all(getplayers(), &zm_utility::function_ee6da6f6, 23);
        } else {
            a_s_scenes = struct::get_array(level.var_fdcaf3a6.target2);
            var_cc790f89 = [];
            foreach (s_scene in a_s_scenes) {
                str_scene = hash(s_scene.scriptbundlename);
                if (isdefined(str_scene) && isinarray(array(#"aib_t9_vign_cust_sr_outro_fail_01", #"hash_7615f90f10ebb540"), str_scene)) {
                    if (!isdefined(var_cc790f89)) {
                        var_cc790f89 = [];
                    } else if (!isarray(var_cc790f89)) {
                        var_cc790f89 = array(var_cc790f89);
                    }
                    var_cc790f89[var_cc790f89.size] = s_scene;
                }
            }
            var_decc23d8 = array::random(var_cc790f89);
            if (isdefined(var_decc23d8)) {
                var_decc23d8 scene::play(level.var_117d5f10);
            } else {
                str_scene = #"aib_t9_vign_cust_sr_outro_fail_01";
                s_scene = spawnstruct();
                s_scene.origin = level.var_117d5f10.origin;
                s_scene.angles = level.var_117d5f10.angles;
                s_scene scene::play(str_scene, level.var_117d5f10);
            }
            array::thread_all(getplayers(), &zm_utility::function_ee6da6f6, 23);
        }
    }
    objective_manager::objective_ended(level.var_fdcaf3a6, b_success);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0xca69695f, Offset: 0x4748
// Size: 0x18c
function function_a7394b94(b_success) {
    if (b_success) {
        if (isdefined(level.var_f1a8b5e6)) {
            if (level.var_f1a8b5e6 != "none") {
                level zm_vo::function_7622cb70(level.var_f1a8b5e6);
            }
        } else {
            level zm_vo::function_7622cb70(#"hash_eab292e698335c7");
        }
        if (isdefined(level.var_6ceeb30a)) {
            if (level.var_6ceeb30a != "none") {
                level zm_vo::function_7622cb70(level.var_6ceeb30a);
            }
        } else {
            level zm_vo::function_7622cb70(#"hash_1c2b56fb48ce36fa", isdefined(level.var_df07292e) ? level.var_df07292e : 1);
        }
        return;
    }
    if (isdefined(level.var_f9d84559)) {
        if (level.var_f9d84559 != "none") {
            level zm_vo::function_7622cb70(level.var_f9d84559, level.var_c03946f1);
        }
        return;
    }
    level zm_vo::function_7622cb70(#"hash_6779beacf80a7a26", 4);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x2 linked
// Checksum 0xf6b4d4f8, Offset: 0x48e0
// Size: 0x34
function function_e0bf1963() {
    self function_3a488e53(0);
    self zm_utility::function_ee6da6f6();
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0xa10939e9, Offset: 0x4920
// Size: 0x2d4
function onbeginuse(player) {
    if (!isdefined(level.var_a5030fa0)) {
        level.var_a5030fa0 = spawn("script_model", player.origin);
    }
    playerangles = player getplayerangles();
    level.var_a5030fa0 dontinterpolate();
    level.var_a5030fa0.origin = player.origin;
    level.var_a5030fa0.angles = playerangles;
    player playerlinkto(level.var_a5030fa0, undefined, 0, 0, 0, 0, 0);
    player function_66f3a713();
    var_a35cd71 = min(-14, playerangles[0]);
    lookat = isdefined(self.helicopter.rope) ? self.helicopter.rope gettagorigin("carabiner_jnt") + (0, 0, 825) : self.origin;
    goalyaw = vectortoyaw(lookat - player getplayercamerapos());
    var_8eef4f81 = absangleclamp180(playerangles[0] - var_a35cd71);
    var_9756b1d4 = absangleclamp180(playerangles[1] - goalyaw);
    var_f4f58cca = 0.25;
    var_bd70ec3f = 0.75;
    var_d9a208ec = math::clamp(max(var_8eef4f81, var_9756b1d4) / 180, 0, 1);
    var_7e42472f = var_f4f58cca + var_d9a208ec * (var_bd70ec3f - var_f4f58cca);
    level.var_a5030fa0 rotateto((var_a35cd71, goalyaw, 0), var_7e42472f, var_7e42472f * 0.25, var_7e42472f * 0.25);
    level.vip = player;
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 3, eflags: 0x2 linked
// Checksum 0xc7a36ff8, Offset: 0x4c00
// Size: 0x6e
function onenduse(*team, player, success) {
    if (isdefined(level.var_a5030fa0)) {
        player unlink();
        if (success) {
            level.var_a5030fa0 deletedelay();
            level.var_a5030fa0 = undefined;
        }
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x0
// Checksum 0xb0d9c6e3, Offset: 0x4c78
// Size: 0x1e
function function_bf315481(*player) {
    self notify(#"hash_21fb1bf7c34422cd");
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0x2b5d157d, Offset: 0x4ca0
// Size: 0x4f4
function function_17f88f7c(var_68cc0f1f) {
    level endon(#"objective_ended");
    level thread function_5ddbfe57(var_68cc0f1f);
    if (zm_utility::is_classic()) {
        callback::on_ai_spawned(&on_ai_spawned);
    }
    var_fda8dff8 = var_68cc0f1f.origin;
    var_b538af19 = isdefined(level.var_fdcaf3a6.contentgroups[#"hash_1f59ed48456964e4"]) ? level.var_fdcaf3a6.contentgroups[#"hash_1f59ed48456964e4"] : [];
    foreach (spawn in var_b538af19) {
        level thread function_4b115eba(spawn);
    }
    var_ca838126 = zm_utility::is_classic() ? level.zombie_ai_limit : getailimit();
    while (true) {
        if (level flag::get(#"hash_58df1e8b20eb71d2") && !level flag::get(#"hash_47ded767d48dfe83")) {
            function_9feae843(var_fda8dff8);
            level flag::set(#"hash_47ded767d48dfe83");
        }
        a_players = function_a1ef346b();
        if (zm_utility::is_classic()) {
            var_62455b3e = 5;
        } else {
            var_62455b3e = min(var_ca838126 / (a_players.size + 1), var_ca838126 / 3);
        }
        foreach (player in a_players) {
            if (is_true(player.var_652c0aa1) || player laststand::player_is_in_laststand()) {
                continue;
            }
            if (zm_utility::is_classic()) {
                v_spawn = player.origin;
            } else {
                n_dist = distancesquared(var_fda8dff8, player.origin);
                if (sqr(3000) > n_dist) {
                    v_spawn = var_fda8dff8;
                } else {
                    v_mod = function_411bb920(player);
                    v_dir = vectornormalize(var_fda8dff8 - player.origin + v_mod);
                    v_spawn = player.origin + v_dir * 3000;
                }
            }
            /#
                if (getdvarint(#"hash_33b0be96bf3cd69a", 0) || getdvarint(#"hash_7466f1c38ea3ceab", 0)) {
                    cylinder(v_spawn, v_spawn + (0, 0, 5000), 500, (1, 0, 0), 0, 10000);
                }
            #/
            player thread function_64df57fc(v_spawn, var_62455b3e);
        }
        level waittilltimeout(10, #"hash_3babb5bf72d208da", #"hash_58df1e8b20eb71d2");
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0x8115a7e5, Offset: 0x51a0
// Size: 0x8c
function function_411bb920(player) {
    if (player isinvehicle()) {
        velocity = player getvehicleoccupied() getvelocity();
        n_weight = 2;
    } else {
        velocity = player getvelocity();
        n_weight = 7;
    }
    return velocity * n_weight;
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0x149e2807, Offset: 0x5238
// Size: 0x19e
function function_5ddbfe57(var_68cc0f1f) {
    var_a789c878 = level.var_fdcaf3a6.contentgroups[#"hash_4c80dd6ba453f9f9"][0];
    if (isdefined(var_a789c878)) {
        n_radius = int(var_a789c878.radius);
        n_height = int(var_a789c878.height);
        v_origin = var_a789c878.origin;
    } else {
        n_radius = 4000;
        n_height = 2000;
        v_origin = var_68cc0f1f.origin - (0, 0, n_height / 2);
    }
    var_196e22fd = spawn("trigger_radius", v_origin, 0, n_radius, n_height);
    while (!level flag::get(#"exfil_cleared")) {
        s_result = var_196e22fd waittill(#"trigger");
        level flag::set(#"hash_58df1e8b20eb71d2");
        if (isplayer(s_result.activator)) {
            s_result.activator.var_652c0aa1 = 1;
        }
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 2, eflags: 0x2 linked
// Checksum 0xe06b66b, Offset: 0x53e0
// Size: 0x80e
function function_64df57fc(v_spawn, var_ca838126) {
    self notify("25cf06a3b7b2f3f8");
    self endon("25cf06a3b7b2f3f8");
    self endon(#"death");
    level endon(#"exfil_cleared");
    if (level flag::get(#"exfil_cleared")) {
        return;
    }
    var_5789be51 = 1024;
    var_4c93765a = 512;
    n_z_offset = 0;
    if (isdefined(self.var_36462255)) {
        function_1eaaceab(self.var_36462255);
        foreach (ai in self.var_36462255) {
            ai.var_921627ad = 0;
        }
    }
    n_z_diff = abs(v_spawn[2] - self.origin[2]);
    if (n_z_diff > var_4c93765a / 2) {
        n_z_offset += n_z_diff;
    }
    var_51753f08 = 0;
    var_5bec4f0e = 0;
    if (zm_utility::is_classic()) {
        var_4c93765a = 40;
        var_5789be51 = 300;
        var_51753f08 = 0;
        var_5bec4f0e = var_ca838126 * 3;
        if (is_true(level.var_7b24e6e4) && self === level.var_3c5bdfe7) {
            var_2041cc26 = struct::get(#"hash_5612e33fc1c84900");
            v_spawn = var_2041cc26.origin;
        } else {
            var_10ed23ba = level.var_fdcaf3a6.contentgroups[#"smoke"][0];
            pathdata = generatenavmeshpath(self.origin, var_10ed23ba.origin, undefined, self getpathfindingradius(), self function_6a9ae71());
            if (pathdata.status === "succeeded") {
                a_v_points = arraysortclosest(pathdata.pathpoints, self.origin, undefined, 500, 1000);
                if (isdefined(a_v_points[0])) {
                    v_spawn = a_v_points[0];
                }
            } else {
                v_spawn = self.origin;
                var_5bec4f0e = var_ca838126 * 5;
                var_5789be51 = 400;
                var_51753f08 = 150;
            }
        }
    }
    if (isdefined(level.var_495b36fa) && ![[ level.var_495b36fa ]](v_spawn)) {
        return;
    }
    self.var_36462255 = [];
    var_2eb61c8a = namespace_85745671::function_e4791424(v_spawn, var_ca838126 + var_5bec4f0e, var_4c93765a + n_z_offset, var_5789be51, var_51753f08);
    if (!isarray(var_2eb61c8a) || var_2eb61c8a.size === 0) {
        return;
    }
    var_2eb61c8a = array::randomize(var_2eb61c8a);
    n_ai_count = 0;
    i = 0;
    str_bundle = "exfil_per_player_realm_" + level.realm;
    if (isdefined(level.var_7f72eddd)) {
        str_bundle = level.var_7f72eddd;
    }
    var_6443acc = namespace_679a22ba::function_77be8a83(str_bundle);
    while (var_2eb61c8a.size && n_ai_count < var_ca838126) {
        if (isdefined(level.var_9fbbf524)) {
            [[ level.var_9fbbf524 ]]();
        } else {
            waitframe(randomintrange(3, 5));
        }
        function_9782bc57();
        v_angles = vectortoangles(self.origin - v_spawn);
        var_4bf95f4c = namespace_679a22ba::function_ca209564(str_bundle, var_6443acc);
        if (!isdefined(var_4bf95f4c)) {
            break;
        }
        if (zm_utility::is_classic() && !isdefined(zm_zonemgr::get_zone_from_position(var_2eb61c8a[i].origin))) {
            i++;
            if (i >= var_2eb61c8a.size) {
                i = 0;
            }
            continue;
        }
        if (var_4bf95f4c.var_990b33df == #"spawner_bo5_avogadro_sr" && getaiarchetypearray(#"avogadro").size > getplayers().size) {
            var_4bf95f4c.var_990b33df = #"hash_7cba8a05511ceedf";
        }
        ai = namespace_85745671::function_9d3ad056(var_4bf95f4c.var_990b33df, var_2eb61c8a[i].origin, (0, v_angles[1], 0), "exfil_ai");
        if (isalive(ai)) {
            namespace_679a22ba::function_266ee075(var_4bf95f4c.list_name, var_6443acc);
            if (zm_utility::is_classic()) {
                ai.var_d2e2380c = var_2eb61c8a[i].origin;
                level.var_cd95afd4++;
                ai callback::function_d8abfc3d(#"on_ai_killed", &function_9974f649);
                ai callback::function_dfd4b1a0(&function_98a1d2ef);
                ai.var_126d7bef = 1;
                ai.ignore_round_spawn_failsafe = 1;
                ai.b_ignore_cleanup = 1;
                ai.ignore_enemy_count = 1;
                ai.var_45063b80 = 1;
                ai thread function_9e722b25("sprint");
            }
            n_ai_count++;
            ai.var_921627ad = 0;
            ai thread awareness::function_c241ef9a(ai, self, isdefined(level.var_f045e945) ? level.var_f045e945 : 10);
            if (!isdefined(self.var_36462255)) {
                self.var_36462255 = [];
            } else if (!isarray(self.var_36462255)) {
                self.var_36462255 = array(self.var_36462255);
            }
            self.var_36462255[self.var_36462255.size] = ai;
        }
        i++;
        if (i >= var_2eb61c8a.size) {
            i = 0;
        }
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0x2eb3d3b2, Offset: 0x5bf8
// Size: 0x4a0
function function_4b115eba(struct) {
    if (!isdefined(struct.radius)) {
        struct.radius = 1024;
    }
    if (!isdefined(struct.height)) {
        struct.height = 256;
    }
    if (!isdefined(struct.spawn_radius)) {
        struct.spawn_radius = 256;
    }
    if (!isdefined(struct.var_48d0f926)) {
        struct.var_48d0f926 = 64;
    }
    struct.radius = int(struct.radius);
    struct.height = int(struct.height);
    struct.spawn_radius = int(struct.spawn_radius);
    struct.var_48d0f926 = int(struct.var_48d0f926);
    trigger = spawn("trigger_radius", struct.origin - (0, 0, struct.height), 0, struct.radius, struct.height * 2);
    s_result = trigger waittill(#"trigger");
    trigger delete();
    str_bundle = "default_zombies_realm_" + level.realm;
    if (isdefined(level.var_7f72eddd)) {
        str_bundle = level.var_7f72eddd;
    }
    var_e456940b = function_a1ef346b(#"allies", struct.origin, int(struct.radius + struct.radius / 3)).size;
    n_ai_count = 0;
    i = 0;
    var_a77909d4 = randomintrangeinclusive(3, 5) + var_e456940b;
    if (isplayer(s_result.activator)) {
        v_angles = vectortoangles(s_result.activator.origin - struct.origin);
    } else {
        v_angles = struct.angles;
    }
    a_v_points = array::randomize(namespace_85745671::function_e4791424(struct.origin, var_a77909d4, struct.var_48d0f926, struct.spawn_radius));
    while (n_ai_count < var_a77909d4 && a_v_points.size) {
        function_9782bc57();
        var_4bf95f4c = namespace_679a22ba::function_ca209564(str_bundle);
        if (!isdefined(var_4bf95f4c)) {
            break;
        }
        ai = namespace_85745671::function_9d3ad056(var_4bf95f4c.var_990b33df, a_v_points[i].origin, (0, v_angles[1], 0), "exfil_ai");
        if (isdefined(ai)) {
            n_ai_count++;
            ai.var_921627ad = 0;
            if (isalive(s_result.activator)) {
                target = s_result.activator;
            } else {
                target = arraysortclosest(function_a1ef346b(), a_v_points[i].origin, 1)[0];
            }
            if (isdefined(target)) {
                ai thread awareness::function_c241ef9a(ai, target, 10);
            }
        }
        i++;
        if (i >= a_v_points.size) {
            i = 0;
        }
        waitframe(randomintrange(1, 5));
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0xd601ac7b, Offset: 0x60a0
// Size: 0x54
function function_9e722b25(speed) {
    self endon(#"death");
    self waittilltimeout(0.1, #"zombie_init_done");
    self zombie_utility::set_zombie_run_cycle(speed);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0xa94e885d, Offset: 0x6100
// Size: 0xc54
function function_9feae843(var_fda8dff8) {
    var_3ec7083c = level.var_fdcaf3a6.contentgroups[#"hash_216188a7e7b381a6"][0];
    var_5789be51 = 850;
    var_4c93765a = var_3ec7083c.height;
    str_bundle = "exfil_realm_" + level.realm;
    level.var_fdcaf3a6.var_1961f29a = luielemcounter::register();
    if (isdefined(level.var_dafeed10)) {
        realm = math::clamp(level.var_b48509f9 - 1, 1, 4);
        str_bundle = level.var_dafeed10 + realm;
    }
    if (isdefined(level.var_26ed6a07)) {
        var_5789be51 = level.var_26ed6a07;
    }
    if (isdefined(level.var_c86f12d4)) {
        var_4c93765a = level.var_c86f12d4;
    }
    var_6443acc = namespace_679a22ba::function_77be8a83(str_bundle);
    var_560dcc36 = 0;
    foreach (spawn_list in var_6443acc.var_7c88c117) {
        var_bba6879d = namespace_679a22ba::function_b9ea4226(isdefined(spawn_list.var_cffbc08) ? spawn_list.var_cffbc08 : 0, var_6443acc.var_b0abb10e);
        var_560dcc36 += var_bba6879d;
    }
    n_ai_count = 0;
    var_4ebe6ac0 = 0;
    b_force_spawn = 0;
    level.var_560dcc36 = int(var_560dcc36);
    var_d6c33c06 = level.var_fdcaf3a6.contentgroups[#"hash_67801799a6276af4"][0];
    var_bf2dd48a = struct::get_array(var_d6c33c06.targetname, "target");
    var_e17c6474 = int(var_560dcc36 * randomfloatrange(0.35, 0.45));
    var_52edf274 = [];
    n = 0;
    foreach (s_spawn in var_bf2dd48a) {
        if (n >= var_e17c6474) {
            break;
        }
        if (!isdefined(var_52edf274)) {
            var_52edf274 = [];
        } else if (!isarray(var_52edf274)) {
            var_52edf274 = array(var_52edf274);
        }
        var_52edf274[var_52edf274.size] = s_spawn;
        s_spawn.var_8789040f = 1;
        n++;
    }
    var_f39e9df9 = level.var_fdcaf3a6.contentgroups[#"landing_zone"][0];
    var_addaff1 = isdefined(var_f39e9df9) ? var_f39e9df9.origin : var_fda8dff8;
    var_16895360 = var_560dcc36 - var_52edf274.size;
    var_fc44ef88 = namespace_85745671::function_e4791424(var_addaff1, var_16895360, var_4c93765a, var_5789be51);
    a_s_points = arraycombine(isdefined(var_fc44ef88) ? var_fc44ef88 : [], isdefined(array::randomize(var_52edf274)) ? array::randomize(var_52edf274) : []);
    var_9cc58c14 = zm_utility::is_classic() || level.realm !== 4 ? 0 : 1;
    i = 0;
    level.var_fdcaf3a6.var_d4245663 = spawn("trigger_radius", var_fda8dff8 - (0, 0, var_4c93765a), 512 | 1, var_5789be51 + 1024, var_4c93765a * 2);
    if (isdefined(level.var_ad5e81fe)) {
        if (!zm_zonemgr::zone_is_enabled(level.var_ad5e81fe[0])) {
            zm_zonemgr::zone_wait_till_enabled(level.var_ad5e81fe[0]);
            wait(3);
        }
        level function_91fb235d();
    }
    while (n_ai_count < var_560dcc36 && a_s_points.size) {
        function_9782bc57();
        var_4bf95f4c = namespace_679a22ba::function_ca209564(str_bundle, var_6443acc);
        if (!isdefined(var_4bf95f4c)) {
            break;
        }
        if (level flag::get(#"exfil_cleared")) {
            break;
        }
        var_e532fd36 = 0;
        if (var_9cc58c14 && var_4bf95f4c.list_name == #"survival_ai_zombie") {
            var_82706add = array::random(array(#"spawner_zm_steiner", #"spawner_bo5_mechz_sr"));
            b_force_spawn = 1;
            var_e532fd36 = 1;
        } else {
            var_82706add = var_4bf95f4c.var_990b33df;
        }
        s_spawn_point = a_s_points[i];
        if (is_true(s_spawn_point.var_8789040f) && (var_82706add == #"spawner_zm_steiner" || var_82706add == #"spawner_bo5_mechz_sr" || var_82706add == #"hash_4f87aa2a203d37d0")) {
            s_spawn_point = array::random(var_fc44ef88);
        }
        if (zm_utility::is_classic()) {
            ai = undefined;
            if (getaiarray().size < level.zombie_ai_limit) {
                if (math::cointoss(25)) {
                    ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], "exfil_ai", undefined, level.round_number);
                } else {
                    ai = namespace_85745671::function_9d3ad056(var_82706add, s_spawn_point.origin, (0, randomint(360), 0), "exfil_ai", 0, s_spawn_point.var_90d0c0ff);
                }
            }
        } else {
            ai = namespace_85745671::function_9d3ad056(var_82706add, s_spawn_point.origin, (0, randomint(360), 0), "exfil_ai", b_force_spawn, s_spawn_point.var_90d0c0ff);
        }
        if (isdefined(ai)) {
            namespace_679a22ba::function_266ee075(var_4bf95f4c.list_name, var_6443acc);
            var_9cc58c14 = var_e532fd36 ? 0 : var_9cc58c14;
            n_ai_count++;
            var_4ebe6ac0 = 0;
            b_force_spawn = 0;
            if (zm_utility::is_classic()) {
                if (ai.aitype == #"spawner_zm_steiner") {
                    level.var_560dcc36 += 2;
                    n_ai_count += 2;
                }
                ai.var_126d7bef = 1;
                ai.ignore_round_spawn_failsafe = 1;
                ai.ignore_enemy_count = 1;
                ai.b_ignore_cleanup = 1;
                ai.var_d2e2380c = s_spawn_point.origin;
                ai thread function_9e722b25("sprint");
                ai callback::function_dfd4b1a0(&function_98a1d2ef);
            }
            ai callback::function_d8abfc3d(#"on_ai_killed", &function_9974f649);
            if (is_true(s_spawn_point.var_8789040f)) {
                event = {#type:0, #position:var_fda8dff8};
                ai callback::function_d8abfc3d(#"hash_790882ac8688cee5", &function_b5b18121, undefined, array(event));
            }
            if (n_ai_count >= var_560dcc36) {
                break;
            }
        } else {
            var_4ebe6ac0++;
            if (var_4ebe6ac0 > 10 && n_ai_count < var_560dcc36 / 2) {
                b_force_spawn = 1;
            }
        }
        i++;
        if (i >= a_s_points.size) {
            i = 0;
        }
        if (level flag::get(#"hash_3babb5bf72d208da")) {
            if (!zm_utility::is_classic() && n_ai_count < var_560dcc36 * 0.666 && level.var_fdcaf3a6.var_de401243 < var_560dcc36 * 0.333) {
                var_9427911d = int(var_560dcc36);
            } else {
                var_9427911d = function_9a11ff2(level.var_fdcaf3a6.var_d4245663);
            }
            function_cad382ce(var_9427911d);
        }
        waitframe(randomintrange(2, 5));
    }
    if (zm_utility::is_classic()) {
        level.var_560dcc36 = n_ai_count;
    }
    level thread function_6cbcd4dd(level.var_fdcaf3a6.var_d4245663);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0xfcb0bc54, Offset: 0x6d60
// Size: 0x20a
function function_9a11ff2(var_d4245663) {
    level flag::clear(#"hash_111df3215a630023");
    if (zm_utility::is_classic()) {
        var_9427911d = level.var_560dcc36 + level.var_cd95afd4 - level.var_fdcaf3a6.var_de401243;
    } else {
        var_c7597757 = getaiteamarray(#"axis");
        function_1eaaceab(var_c7597757);
        var_c7597757 = array::get_touching(var_c7597757, var_d4245663);
        foreach (ai in var_c7597757) {
            if (ai.archetype !== #"zombie" && ai.archetype !== #"zombie_dog") {
                level flag::set(#"hash_111df3215a630023");
            }
        }
        if (level flag::get(#"hash_178cddf0409be677")) {
            level flag::set(#"hash_111df3215a630023");
        }
        var_9427911d = max(0, var_c7597757.size);
    }
    return int(var_9427911d);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 2, eflags: 0x2 linked
// Checksum 0x442ebc13, Offset: 0x6f78
// Size: 0x84
function function_b5b18121(*params, event) {
    awareness::function_1db27761(self, event);
    self.var_3eaac485 = gettime() + int(3 * 1000);
    self callback::function_52ac9652(#"hash_790882ac8688cee5", &function_b5b18121);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0x17fc0cbe, Offset: 0x7008
// Size: 0x31c
function function_9974f649(params) {
    function_cad382ce();
    if (zm_utility::is_classic()) {
        if (is_true(self.aat_turned)) {
            return;
        }
        if (!isdefined(params.eattacker) && !is_true(self.var_8576e0be) || isplayer(params.eattacker) && params.eattacker.v_train_inbound_igc !== 1 && params.weapon !== getweapon(#"hash_1734871fef9c0549")) {
            var_990b33df = self.aitype;
            var_d2e2380c = self.var_d2e2380c;
            var_45063b80 = self.var_45063b80;
            do {
                wait(0.1);
                if (getaiarray().size < level.zombie_ai_limit) {
                    if (is_true(var_45063b80) && zm_zonemgr::zone_is_enabled(level.var_ad5e81fe[0])) {
                        ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], "exfil_ai", undefined, level.round_number);
                        continue;
                    }
                    ai = namespace_85745671::function_9d3ad056(var_990b33df, var_d2e2380c, (0, randomint(360), 0), "exfil_ai", 0);
                }
            } while (!isdefined(ai));
            if (isdefined(ai)) {
                ai.var_126d7bef = 1;
                ai.ignore_round_spawn_failsafe = 1;
                ai.ignore_enemy_count = 1;
                ai.var_d2e2380c = var_d2e2380c;
                if (is_true(var_45063b80)) {
                    ai.var_45063b80 = 1;
                }
                ai zm_score::function_acaab828(1);
                ai thread function_9e722b25("sprint");
                ai callback::function_d8abfc3d(#"on_ai_killed", &function_9974f649);
                ai callback::function_dfd4b1a0(&function_98a1d2ef);
            }
        } else {
            level.var_fdcaf3a6.var_de401243++;
        }
        return;
    }
    level.var_fdcaf3a6.var_de401243++;
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0x801d2696, Offset: 0x7330
// Size: 0x20
function function_98a1d2ef(*params) {
    level.var_fdcaf3a6.var_de401243++;
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0xe50a6b76, Offset: 0x7358
// Size: 0x37e
function function_6cbcd4dd(var_d4245663) {
    var_a328c44d = zm_utility::is_classic() ? 0 : 3;
    do {
        if (level flag::get(#"hash_23a3320be9d9bcbb") && getplayers().size == 1 && !getdvarint(#"hash_33b0be96bf3cd69a", 0)) {
            level flag::set(#"hash_69567098e4924a9c");
            break;
        }
        v_train_inbound_igc = 0;
        foreach (player in laststand::function_7fb2bbfc()) {
            if (is_true(player.v_train_inbound_igc)) {
                v_train_inbound_igc = 1;
                level flag::set(#"hash_fdc24944f59c262");
                break;
            }
        }
        if (!v_train_inbound_igc) {
            level flag::clear(#"hash_fdc24944f59c262");
        }
        wait(1);
        var_9427911d = function_9a11ff2(var_d4245663);
        function_cad382ce(var_9427911d, var_d4245663);
    } while (var_9427911d > var_a328c44d || level flag::get(#"hash_111df3215a630023"));
    level flag::set(#"exfil_cleared");
    if (!level flag::get(#"hash_69567098e4924a9c")) {
        var_4ba6c205 = getaiteamarray(#"axis");
        function_1eaaceab(var_4ba6c205);
        foreach (ai in var_4ba6c205) {
            if (isalive(ai)) {
                gibserverutils::annihilate(ai);
                ai.allowdeath = 1;
                ai kill(undefined, undefined, undefined, undefined, undefined, 1);
            }
            waitframe(1);
        }
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 2, eflags: 0x2 linked
// Checksum 0xd0060769, Offset: 0x76e0
// Size: 0x150
function function_cad382ce(var_9427911d, var_d4245663) {
    if (level flag::get(#"exfil_cleared")) {
        return;
    }
    if (!isdefined(var_9427911d)) {
        if (!isdefined(var_d4245663)) {
            var_d4245663 = level.var_fdcaf3a6.var_d4245663;
        }
        var_9427911d = function_9a11ff2(var_d4245663);
    }
    foreach (player in getplayers()) {
        if (is_true(player.v_train_inbound_igc)) {
            player function_3a488e53(1, var_9427911d);
            continue;
        }
        player function_3a488e53(0);
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x2 linked
// Checksum 0x8855eb75, Offset: 0x7838
// Size: 0x34
function function_9782bc57() {
    if (!zm_utility::is_classic()) {
        level flag::wait_till("spawn_zombies");
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x2 linked
// Checksum 0x481a1749, Offset: 0x7878
// Size: 0x104
function function_5dd89100() {
    level flag::wait_till(#"exfil_heli_arrived");
    if (level flag::get(#"exfil_cleared")) {
        return;
    }
    var_10ed23ba = level.var_fdcaf3a6.contentgroups[#"smoke"][0];
    if (!isdefined(var_10ed23ba)) {
        var_10ed23ba = level.var_fdcaf3a6.contentgroups[#"hash_216188a7e7b381a6"][0];
    }
    v_loc = var_10ed23ba.origin;
    v_angles = var_10ed23ba.angles;
    level fx::play(#"hash_7789ba1857e7bd0a", v_loc, v_angles, #"exfil_cleared");
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x2 linked
// Checksum 0xb6524258, Offset: 0x7988
// Size: 0x1a0
function function_b5019d74() {
    var_10ed23ba = level.var_fdcaf3a6.contentgroups[#"smoke"][0];
    if (!isdefined(var_10ed23ba)) {
        var_10ed23ba = level.var_fdcaf3a6.contentgroups[#"hash_216188a7e7b381a6"][0];
    }
    v_loc = var_10ed23ba.origin;
    v_angles = var_10ed23ba.angles;
    level flag::wait_till(#"exfil_heli_arrived");
    if (level flag::get(#"exfil_cleared")) {
        return;
    }
    if (util::get_map_name() === "wz_sanatorium") {
        e_fx = level fx::play(#"hash_2d68894620b57383", v_loc, v_angles, #"exfil_cleared");
    } else {
        e_fx = level fx::play(#"hash_1ebbe325fb97bb3", v_loc, v_angles, #"exfil_cleared");
    }
    level flag::wait_till(#"exfil_cleared");
    if (isdefined(e_fx)) {
        e_fx notify(#"exfil_cleared");
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x0
// Checksum 0xa45e6792, Offset: 0x7b30
// Size: 0x24
function function_fa5bd408(a_zones) {
    if (isdefined(a_zones)) {
        level.var_ad5e81fe = a_zones;
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x2 linked
// Checksum 0x6c101fab, Offset: 0x7b60
// Size: 0x1b6
function function_91fb235d() {
    foreach (zone in level.zones) {
        var_2757561 = isinarray(level.var_ad5e81fe, zone.name) ? 1 : 0;
        if (var_2757561) {
            level.zones[zone.name].is_spawning_allowed = var_2757561;
            level.zones[zone.name].is_active = var_2757561;
        }
    }
    foreach (zone in level.zones) {
        var_2757561 = isinarray(level.var_ad5e81fe, zone.name) ? 1 : 0;
        if (!var_2757561) {
            level.zones[zone.name].is_spawning_allowed = var_2757561;
        }
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 2, eflags: 0x6 linked
// Checksum 0x1346293a, Offset: 0x7d20
// Size: 0x2c
function private function_3a488e53(b_show, n_remaining) {
    self thread function_a99586e3(b_show, n_remaining);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 2, eflags: 0x6 linked
// Checksum 0xfdbc7480, Offset: 0x7d58
// Size: 0x32c
function private function_a99586e3(b_show, n_remaining) {
    if (!isplayer(self)) {
        return;
    }
    if (!isdefined(level.var_fdcaf3a6.var_1961f29a)) {
        return;
    }
    if (b_show) {
        if (!level.var_fdcaf3a6.var_1961f29a luielemcounter::is_open(self)) {
            level.var_fdcaf3a6.var_1961f29a luielemcounter::open(self, 1);
            waitframe(1);
            if (!isclass(level.var_fdcaf3a6.var_1961f29a) || !isplayer(self)) {
                return;
            }
            level.var_fdcaf3a6.var_1961f29a luielemcounter::function_5d4dff63(self, n_remaining);
            level.var_fdcaf3a6.var_1961f29a luielemcounter::set_x(self, int(10));
            level.var_fdcaf3a6.var_1961f29a luielemcounter::set_y(self, int(26.6667));
            level.var_fdcaf3a6.var_1961f29a luielemcounter::set_green(self, 1);
            level.var_fdcaf3a6.var_1961f29a luielemcounter::set_blue(self, 1);
            level.var_fdcaf3a6.var_1961f29a luielemcounter::set_red(self, 1);
            level.var_fdcaf3a6.var_1961f29a luielemcounter::set_alpha(self, 0.75);
            level.var_fdcaf3a6.var_1961f29a luielemcounter::set_horizontal_alignment(self, 1);
        } else {
            level.var_fdcaf3a6.var_1961f29a luielemcounter::function_5d4dff63(self, n_remaining);
        }
        return;
    }
    if (level.var_fdcaf3a6.var_1961f29a luielemcounter::is_open(self)) {
        if (n_remaining === 0) {
            level.var_fdcaf3a6.var_1961f29a thread function_ac6aac5d(3, self);
            self function_3a488e53(1, 0);
            return;
        }
        level.var_fdcaf3a6.var_1961f29a luielemcounter::close(self);
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 2, eflags: 0x6 linked
// Checksum 0xe4ab6f5d, Offset: 0x8090
// Size: 0x84
function private function_ac6aac5d(n_delay = 3, player) {
    wait(n_delay);
    if (isclass(self) && isplayer(player) && self luielemcounter::is_open(player)) {
        self luielemcounter::close(player);
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0x6f065ea5, Offset: 0x8120
// Size: 0x54
function function_591cb2f4(var_4cdbc624) {
    if (zm_utility::is_classic()) {
        return self zm_zonemgr::is_player_in_zone(level.var_ad5e81fe);
    }
    return self istouching(var_4cdbc624);
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0xfd9d5e8d, Offset: 0x8180
// Size: 0x1b8
function function_7c05a985(destination) {
    level endon(#"hash_345e9169ebba28fb");
    if (!is_false(getgametypesetting(#"hash_7d1368d8d487beed")) || getdvarint(#"hash_33b0be96bf3cd69a", 0)) {
        exfil = function_5a957da0(destination);
        if (isdefined(exfil)) {
            content_manager::spawn_instance(exfil);
        }
        s_result = level waittill(#"objective_ended");
    }
    if (isdefined(level.contentmanager.var_14f09b99)) {
        [[ level.contentmanager.var_14f09b99 ]](s_result);
        return;
    }
    if (is_true(s_result.completed)) {
        str_reason = #"hash_6ebafb1370ab6c93";
        level.winningteam = #"allies";
    } else {
        str_reason = #"hash_22a0611dcd352614";
        level.winningteam = #"axis";
    }
    level notify(#"end_game", {#reason:str_reason});
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0x2ded896e, Offset: 0x8348
// Size: 0x30a
function function_5a957da0(destination) {
    var_1dc01e72 = [];
    foreach (location in destination.locations) {
        instances = array::randomize(content_manager::get_children(location));
        foreach (instance in instances) {
            if (instance.content_script_name === #"exfil" && !is_true(instance.var_ea25c617)) {
                var_60bfdf49 = instance;
                var_3007472f = instance.var_d5b937da;
                if (isdefined(var_3007472f)) {
                    var_df889249 = array::random(strtok(var_3007472f, ","));
                } else {
                    var_df889249 = undefined;
                }
                /#
                    var_a9dd0fe1 = getdvarint(#"hash_33b0be96bf3cd69a", 0);
                    if (var_a9dd0fe1) {
                        if (var_a9dd0fe1 === instance.script_int) {
                            return instance;
                        } else {
                            continue;
                        }
                    }
                #/
                if (!isdefined(instance.var_a07fca34) || instance.var_a07fca34 <= zm_utility::function_e3025ca5()) {
                    if (!isdefined(var_df889249) || level.contentmanager.var_c4181ea.script_int === var_df889249) {
                        if (!isdefined(var_1dc01e72)) {
                            var_1dc01e72 = [];
                        } else if (!isarray(var_1dc01e72)) {
                            var_1dc01e72 = array(var_1dc01e72);
                        }
                        var_1dc01e72[var_1dc01e72.size] = instance;
                    }
                }
            }
        }
    }
    exfil = array::random(var_1dc01e72);
    if (!isdefined(exfil)) {
        exfil = var_60bfdf49;
    }
    return exfil;
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x6 linked
// Checksum 0x6f413bcf, Offset: 0x8660
// Size: 0x1e6
function private function_39eec401(instance) {
    script = content_manager::get_script(instance.content_script_name);
    if (!getdvarint(#"hash_33b0be96bf3cd69a", 0)) {
        s_result = level waittill(#"hash_345e9169ebba28fb", #"hash_3e765c26047c9f54");
    }
    if (s_result._notify === #"hash_3e765c26047c9f54" || getdvarint(#"hash_33b0be96bf3cd69a", 0)) {
        objective_manager::start_objective(instance);
        if (isdefined(level.var_b2fde059)) {
            [[ level.var_b2fde059 ]](script.var_331b7cc3, instance.contentgroups[#"hash_216188a7e7b381a6"][0].origin, instance);
        } else {
            objective_manager::function_9751c453(script.var_331b7cc3, instance.contentgroups[#"hash_216188a7e7b381a6"][0].origin, instance);
        }
        return;
    }
    if (isdefined(instance.var_e55c8b4e)) {
        var_7d0e37f8 = instance.contentgroups[#"hash_3966465c498df3a6"][0];
        var_7d0e37f8 zm_utility::function_48d9a9c9();
        zm_utility::function_bc5a54a8(instance.var_e55c8b4e);
        instance.var_e55c8b4e = undefined;
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x2 linked
// Checksum 0xd73674b3, Offset: 0x8850
// Size: 0xc4
function function_595332df() {
    level endon(#"end_game");
    var_bbdb0dfe = getent("exfil_heli_slick", "targetname");
    if (isdefined(var_bbdb0dfe)) {
        zombie_utility::clear_all_corpses();
        var_bbdb0dfe solid();
        var_bbdb0dfe moveto(var_bbdb0dfe.origin + (0, 0, 100), 3);
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x0
// Checksum 0x3f502682, Offset: 0x8920
// Size: 0x488
function function_5a22584f() {
    level endon(#"end_game", #"hash_3e765c26047c9f54");
    v_trigger_offset = (0, 0, 0);
    level.var_560dcc36 = 0;
    level.var_cd95afd4 = 0;
    s_beacon = struct::get("exfil_radio");
    if (!isdefined(s_beacon)) {
        return;
    }
    level flag::set("rbz_exfil_allowed");
    mdl_beacon = content_manager::spawn_script_model(s_beacon, #"hash_615f17c2d8b69f96");
    mdl_beacon playloopsound(#"hash_1c4b0081e8984d28");
    mdl_beacon function_23a29590();
    while (true) {
        level flag::wait_till("rbz_exfil_beacon_active");
        mdl_beacon playloopsound(#"hash_48f43a95480d8b91");
        mdl_beacon function_619a5c20();
        level.var_1ea1d494 = spawn("trigger_radius_use", s_beacon.origin + v_trigger_offset, 0, 100);
        level.var_1ea1d494 setcursorhint("HINT_NOICON");
        level.var_1ea1d494 sethintstring(#"hash_24961462354ea22");
        level.var_1ea1d494 usetriggerignoreuseholdtime();
        level.var_1ea1d494 function_268e4500();
        level.var_1ea1d494 usetriggerrequirelookat(0);
        level.var_1ea1d494 triggerignoreteam();
        level.var_1ea1d494.var_9d7362a4 = #"hash_24961462354ea22";
        var_f354b9b2 = gameobjects::create_use_object(#"any", level.var_1ea1d494, [], (0, 0, 0), #"hash_3cf318117c602737", 1);
        var_f354b9b2 gameobjects::set_visible(#"hash_5ccfd7bbbf07c770");
        var_f354b9b2 gameobjects::allow_use(#"hash_5ccfd7bbbf07c770");
        var_f354b9b2 gameobjects::set_use_time(1.5);
        var_f354b9b2 gameobjects::set_onuse_event(&onuse);
        var_f354b9b2 gameobjects::set_onbeginuse_event(&function_69ea81e2);
        var_f354b9b2 gameobjects::set_onenduse_event(&function_6ab13d0f);
        var_f354b9b2.dontlinkplayertotrigger = 1;
        var_f354b9b2.keepweapon = 1;
        e_fx = util::spawn_model("tag_origin", mdl_beacon.origin, mdl_beacon.angles);
        playfxontag(#"hash_507d21e96f587fc4", e_fx, "tag_origin");
        level flag::wait_till_clear("rbz_exfil_beacon_active");
        if (isdefined(e_fx)) {
            e_fx delete();
        }
        mdl_beacon playloopsound(#"hash_1c4b0081e8984d28");
        mdl_beacon function_23a29590();
        var_f354b9b2 function_992dc59a();
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0xd1ea3c5, Offset: 0x8db0
// Size: 0x164
function onuse(player) {
    if (getgametypesetting(#"hash_704e4a94667cfe72")) {
        b_passed = zm_vote::function_c65468ef(player, 1, #"hash_37a354c147ec32f0");
        if (!b_passed) {
            return;
        }
    }
    if (isplayer(player)) {
        if (isdefined(level.var_9f4fcdec)) {
            if (level.var_9f4fcdec != "none") {
                player thread zm_vo::function_d342796e(level.var_9f4fcdec, 1.5);
            }
        } else {
            player thread zm_vo::function_d342796e(#"hash_7e50fb36129dc24b", 1.5);
        }
        level.var_3c5bdfe7 = player;
    }
    level flag::clear("spawn_zombies");
    level flag::set(#"hash_3e765c26047c9f54");
    self thread function_992dc59a();
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0xd8d04dff, Offset: 0x8f20
// Size: 0x3c
function function_69ea81e2(player) {
    if (isdefined(self.trigger) && isdefined(player)) {
        self.trigger setinvisibletoplayer(player);
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 3, eflags: 0x2 linked
// Checksum 0xc165efc6, Offset: 0x8f68
// Size: 0x4c
function function_6ab13d0f(*team, player, *success) {
    if (isdefined(self.trigger) && isdefined(success)) {
        self.trigger setvisibletoplayer(success);
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x2 linked
// Checksum 0xd49c33db, Offset: 0x8fc0
// Size: 0x3e
function function_992dc59a() {
    zm_vote::function_3728d19b();
    self gameobjects::destroy_object(1, 1);
    level.var_1ea1d494 = undefined;
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x6 linked
// Checksum 0xb8eec16e, Offset: 0x9008
// Size: 0xd4
function private on_round_end() {
    round_number = zm_utility::get_round_number();
    if (round_number === getgametypesetting("zmExfilRound") && getgametypesetting("zmExfilRound") != 0) {
        level notify(#"hash_61e8a39b3a4bee6a");
        level flag::wait_till("rbz_exfil_allowed");
        level.var_aaf7505f += 15;
        level flag::set(#"hash_3e765c26047c9f54");
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x2 linked
// Checksum 0x50dad0f1, Offset: 0x90e8
// Size: 0x132
function on_ai_spawned() {
    if (!isactor(self) || !isdefined(self.aitype)) {
        return;
    }
    switch (self.aitype) {
    case #"spawner_zm_steiner_split_radiation_bomb":
    case #"spawner_zm_steiner_split_radiation_blast":
        self.var_126d7bef = 1;
        self.ignore_round_spawn_failsafe = 1;
        self.b_ignore_cleanup = 1;
        self.ignore_enemy_count = 1;
        var_f39e9df9 = level.var_fdcaf3a6.contentgroups[#"landing_zone"][0];
        self.var_d2e2380c = var_f39e9df9.origin;
        self callback::function_dfd4b1a0(&function_98a1d2ef);
        self callback::function_d8abfc3d(#"on_ai_killed", &function_9974f649);
        break;
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x6 linked
// Checksum 0x7f0bc56b, Offset: 0x9228
// Size: 0x194
function private cleanup_main() {
    level endon(#"end_game");
    n_next_eval = 0;
    while (true) {
        util::wait_network_frame();
        n_time = gettime();
        if (n_time < n_next_eval) {
            continue;
        }
        if (!level flag::get(#"hash_3babb5bf72d208da")) {
            continue;
        }
        n_next_eval += 3000;
        a_ai_enemies = getaiteamarray(#"axis");
        foreach (ai_enemy in a_ai_enemies) {
            if (level.n_cleanups_processed_this_frame >= 1) {
                level.n_cleanups_processed_this_frame = 0;
                util::wait_network_frame();
            }
            ai_enemy do_cleanup_check(1000000);
        }
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 1, eflags: 0x2 linked
// Checksum 0x4249b666, Offset: 0x93c8
// Size: 0x22c
function do_cleanup_check(n_cleanup_dist_sq) {
    if (!isalive(self)) {
        return;
    }
    if (self.var_2bf69a41 === 1) {
        return;
    }
    n_time_alive = gettime() - self.spawn_time;
    if (n_time_alive < 5000) {
        return;
    }
    if (is_true(self.var_61c270)) {
        return;
    }
    if (n_time_alive < 45000 && self.completed_emerging_into_playable_area !== 1 && !is_true(self.var_357c108b)) {
        return;
    }
    var_846b034e = self function_268efd73();
    level.n_cleanups_processed_this_frame++;
    if (!var_846b034e) {
        n_dist_sq_min = 10000000;
        players = getplayers();
        e_closest_player = players[0];
        foreach (player in players) {
            if (!isalive(player)) {
                continue;
            }
            n_dist_sq = distancesquared(self.origin, player.origin);
            if (n_dist_sq < n_dist_sq_min) {
                n_dist_sq_min = n_dist_sq;
                e_closest_player = player;
            }
        }
        if (n_dist_sq_min >= n_cleanup_dist_sq) {
            self thread function_96f7787d();
        }
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x2 linked
// Checksum 0x2775141f, Offset: 0x9600
// Size: 0xaa
function function_268efd73() {
    if (!isdefined(level.var_ad5e81fe)) {
        return false;
    }
    foreach (zone in level.var_ad5e81fe) {
        if (self zm_zonemgr::entity_in_zone(zone)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x6 linked
// Checksum 0x9b3978f7, Offset: 0x96b8
// Size: 0x36
function private function_96f7787d() {
    self.var_61c270 = 1;
    self delete_zombie_noone_looking();
    if (isdefined(self)) {
        self.var_61c270 = undefined;
    }
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x6 linked
// Checksum 0x7200351e, Offset: 0x96f8
// Size: 0xec
function private delete_zombie_noone_looking() {
    if (is_true(self.in_the_ground)) {
        return;
    }
    if (!self.allowdeath) {
        return;
    }
    foreach (player in level.players) {
        if (player.sessionstate == "spectator") {
            continue;
        }
        if (self zm_cleanup::player_can_see_me(player)) {
            return;
        }
    }
    self cleanup_zombie();
}

// Namespace namespace_591b4396/namespace_591b4396
// Params 0, eflags: 0x2 linked
// Checksum 0xde3f36d, Offset: 0x97f0
// Size: 0xcc
function cleanup_zombie() {
    if (!isalive(self)) {
        println("<unknown string>");
        return;
    }
    self zombie_utility::reset_attack_spot();
    /#
    #/
    self.var_c39323b5 = 1;
    self.var_e700d5e2 = 1;
    self.allowdeath = 1;
    self.var_98f1f37c = 1;
    self kill(undefined, undefined, undefined, undefined, undefined, 1);
    waitframe(1);
    if (isdefined(self)) {
        self delete();
    }
}

