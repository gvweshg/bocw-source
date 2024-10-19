// Atian COD Tools GSC CW decompiler test
#using script_34ab99a4ca1a43d;
#using script_176597095ddfaa17;
#using script_4163291d6e693552;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using script_5a525a75a8f1f7e4;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using scripts\zm_common\objective_manager.gsc;
#using script_27347f09888ad15;
#using script_113dd7f0ea2a1d4f;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using script_1471eea5d2e60f83;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\content_manager.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_e69881c5;

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0xf89c4dc1, Offset: 0x4a8
// Size: 0x22c
function function_4f8b33df(instance) {
    instance.var_7a9e6505 = 1;
    var_6201c191 = content_manager::function_31e8da78(instance.location.destination, "loot_pods");
    instance thread function_c97fdd1d(var_6201c191);
    self function_9e96f231(#"laser");
    self.var_aa4b496 = 0;
    self.health = 6000;
    self.var_265cb589 = 1;
    self.var_a123c71 = 0;
    self vehicle::toggle_sounds(0);
    self vehicle::lights_off();
    self vehicle::get_on_path(getvehiclenode("node_phase_rover", "targetname"));
    self.overridevehicledamage = &function_978eec63;
    namespace_c09ae6c3::function_9ed7339b(instance);
    function_4e0f32cf(instance);
    self thread function_81f989d5(instance);
    level flag::wait_till(#"hash_4b060b9820d4141d");
    self.mdl_orb.e_fx = util::spawn_model("tag_origin", self.mdl_orb.origin, self.var_dafa2b89.angles);
    util::wait_network_frame();
    if (isdefined(self.mdl_orb.e_fx)) {
        self.mdl_orb.e_fx linkto(self, "tag_cage_attach", (0, 0, 17));
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x5620498a, Offset: 0x6e0
// Size: 0x474
function function_540c0d15(instance) {
    if (level flag::get(#"hash_1558183088c6ccff")) {
        return;
    }
    self endon(#"death");
    instance endon(#"objective_ended");
    showmiscmodels("sv_phase_aetherfungus");
    instance thread function_17f1d0f3();
    instance thread function_a528be11();
    level thread zm_vo::function_7622cb70("Step4PhaseRoverStart");
    self vehicle::toggle_lights_group(4, 1);
    self vehicle::toggle_sounds(1);
    self vehicle::lights_on();
    self playsound(#"hash_388c12acd0e0928");
    self playrumblelooponentity(#"sr_machinery_rumble");
    self clientfield::increment("" + #"hash_738f0a13dc61e2ec");
    self clientfield::set("" + #"hash_711d7caaed939f5f", 1);
    self clientfield::set("" + #"hash_3178e1dcaee33fd3", 1);
    wait(2);
    if (isdefined(self.mdl_orb)) {
        if (isdefined(self.mdl_orb.e_fx)) {
            self.mdl_orb.e_fx clientfield::set("" + #"hash_4bedc093642e28f6", 1);
        }
        self.mdl_orb notify(#"hash_62901a3385d3e7af");
        self.mdl_orb notify(#"hash_4708ec2a663db459");
    }
    wait(1);
    self clientfield::set("" + #"hash_1e59af4706036a79", 1);
    self playrumbleonentity(#"hash_2d43d9987e4a73a8");
    self thread function_3c40b07a();
    self thread function_1e4eea8e(instance);
    self thread function_d30f71c4(instance);
    wait(2);
    self clientfield::set("" + #"hash_3178e1dcaee33fd3", 0);
    wait(2);
    function_f928c8f5();
    self thread function_c8b3217e(instance);
    self thread function_a7ae3459(instance);
    self thread function_d4694f6c(instance);
    self thread function_7ae500b2(instance);
    self thread function_24735dd6(instance);
    self thread function_9072f256(instance);
    self thread function_a76b2c1f(instance);
    self thread function_738143f5(instance);
    self thread function_79ae8e99(instance);
    self thread function_2db63909(instance);
    self thread function_1eef26bc(instance);
    self thread function_ca92ed05(instance);
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 0, eflags: 0x2 linked
// Checksum 0x9447407c, Offset: 0xb60
// Size: 0xc0
function function_206ee608() {
    a_vehicles = getvehiclearray();
    foreach (vehicle in a_vehicles) {
        if (vehicle.vehicletype !== #"vehicle_motorcycle_mil_us_offroad") {
            if (isdefined(vehicle)) {
                vehicle delete();
            }
        }
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 0, eflags: 0x2 linked
// Checksum 0x502915e1, Offset: 0xc28
// Size: 0x160
function function_a528be11() {
    foreach (player in getplayers()) {
        level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_37c638fd5c6acd16");
        level.var_31028c5d prototype_hud::function_817e4d10(player, 2);
    }
    self waittill(#"objective_ended");
    foreach (player in getplayers()) {
        level.var_31028c5d thread prototype_hud::function_817e4d10(player, 0);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 0, eflags: 0x2 linked
// Checksum 0xf96acfa, Offset: 0xd90
// Size: 0x8a
function function_17f1d0f3() {
    self.var_61c57c53 = self namespace_7589cf5c::function_1b53cdc7() + 3;
    self.var_5de17ec9 = self namespace_7589cf5c::function_56fa33d9() + 1;
    self.var_2133c784 = 0;
    self.var_b803db9c = 0;
    self.var_74ec00fb = 0;
    self.n_zombies_max = function_e677fbe0();
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x188a462b, Offset: 0xe28
// Size: 0x110
function function_c8b3217e(instance) {
    instance endon(#"objective_ended");
    self endon(#"death");
    while (true) {
        foreach (player in getplayers()) {
            if (distance2dsquared(player.origin, self.origin) <= 250000) {
                player.b_ignore_fow_damage = 1;
                continue;
            }
            player.b_ignore_fow_damage = 0;
        }
        wait(0.25);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0xa615e4a7, Offset: 0xf40
// Size: 0x1e8
function function_a7ae3459(instance) {
    instance endon(#"objective_ended");
    self endon(#"death");
    a_vehicles = getvehiclearray();
    foreach (vehicle in a_vehicles) {
        if (isalive(vehicle) && distance2dsquared(vehicle.origin, self.origin) <= 250000) {
            vehicle.var_e5f956c5 = 1;
        }
    }
    while (true) {
        foreach (vehicle in a_vehicles) {
            if (isalive(vehicle)) {
                if (distance2dsquared(vehicle.origin, self.origin) <= 250000) {
                    vehicle.b_ignore_fow_damage = 1;
                    continue;
                }
                vehicle.b_ignore_fow_damage = 0;
            }
        }
        wait(0.25);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 0, eflags: 0x2 linked
// Checksum 0x2b03dff4, Offset: 0x1130
// Size: 0x138
function function_f928c8f5() {
    foreach (mdl_clip in getentarray("sr_boundary_clip", "targetname")) {
        mdl_clip notsolid();
    }
    foreach (mdl_clip in getentarray("sr_boundary_clip_island", "targetname")) {
        mdl_clip notsolid();
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x11479ae9, Offset: 0x1270
// Size: 0x3a8
function function_7ae500b2(instance) {
    instance endon(#"objective_ended");
    self endon(#"death", #"destruct");
    self.var_a123c71 = 0;
    self.var_f8edfabd = 0;
    self.var_59078fae = 0;
    self thread vehicle::go_path();
    self setbrake(1);
    self setspeedimmediate(0);
    self thread function_36359055(instance);
    while (true) {
        self.b_proximity = 1;
        self.n_players = 0;
        foreach (player in getplayers()) {
            if (distance2dsquared(player.origin, self.origin) > 250000 || player laststand::player_is_in_laststand()) {
                self.b_proximity = 0;
            }
        }
        wait(0.25);
        if (!self.b_proximity || is_true(self.abnormal_status.emped)) {
            self setspeed(0, 5, 3);
            self.var_a123c71 = 0;
            self setbrake(1);
            self vehicle::toggle_lights_group(4, 1);
            self clientfield::set("" + #"hash_db052f565349c0d", 0);
            self notify(#"hash_4e0c5de3e24d5af8");
            if (!isdefined(self.var_b79a8ac7) && !self.var_f8edfabd) {
                self thread function_174dde71();
            }
            continue;
        }
        self notify(#"hash_d2f2236898d7b64");
        self setspeed(6, 5, 3);
        self.var_a123c71 = 1;
        self setbrake(0);
        self vehicle::toggle_lights_group(4, 0);
        self clientfield::set("" + #"hash_db052f565349c0d", 1);
        self.var_f8edfabd = 0;
        namespace_85745671::function_b70e2a37(self);
        if (self.var_59078fae) {
            self.var_59078fae = 0;
            self connectpaths();
        }
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0xbfbc34f3, Offset: 0x1620
// Size: 0x714
function function_2db63909(instance) {
    self endon(#"death");
    self waittill(#"hash_4d73332b0eee788d");
    exploder::exploder("fxexp_aether_state_new");
    exploder::exploder("fxexp_aether_state_new_2");
    exploder::exploder("lgtexp_dark_aether_bridge");
    exploder::exploder("lgtexp_dark_aether_bridge_2");
    exploder::exploder("fxexp_mq_phase_amb");
    level flag::set(#"in_dark_side");
    foreach (player in getplayers()) {
        player clientfield::set_to_player("" + #"hash_34af381c063f6611", 1);
        player.var_e5f956c5 = 1;
    }
    self waittill(#"hash_afde535fe1be7d0");
    namespace_d0ab5955::function_d4dec4e8(instance.location.destination, #"hash_77c04aaf41a18e41");
    self waittill(#"hash_654e85dc63fd03c5");
    exploder::stop_exploder("fxexp_aether_state_new");
    exploder::stop_exploder("fxexp_aether_state_new_2");
    exploder::stop_exploder("lgtexp_dark_aether_bridge");
    exploder::stop_exploder("lgtexp_dark_aether_bridge_2");
    exploder::stop_exploder("fxexp_mq_phase_amb");
    level flag::clear(#"in_dark_side");
    foreach (player in getplayers()) {
        player.var_e5f956c5 = undefined;
        player.var_41c16555 = undefined;
    }
    self clientfield::set("" + #"hash_1e59af4706036a79", 0);
    self waittill(#"reached_end_node");
    foreach (mdl_clip in getentarray("sr_boundary_clip_island", "targetname")) {
        mdl_clip solid();
    }
    level flag::set(#"hash_2ae96d681e4ea79f");
    if (isdefined(self.mdl_orb)) {
        self.mdl_orb playsound(#"hash_f029e59bea76d50");
    }
    objective_manager::objective_ended(instance, 1);
    namespace_7589cf5c::function_3899cfea();
    level thread function_af7669e6();
    self vehicle::toggle_lights_group(4, 1);
    self vehicle::toggle_sounds(0);
    self vehicle::lights_off();
    wait(2);
    if (isdefined(self.mdl_orb)) {
        self.mdl_orb.e_fx clientfield::set("" + #"hash_4bedc093642e28f6", 0);
        self.mdl_orb fx::play(#"hash_1b9b90f45278a5ae", self.mdl_orb.origin + (0, 0, 22), self.mdl_orb.angles, #"hash_62901a3385d3e7af", 1);
        self.mdl_orb playsound(#"hash_75c73a4779a02dbb");
    }
    util::wait_network_frame();
    if (isdefined(self.mdl_orb.e_fx)) {
        self.mdl_orb.e_fx delete();
    }
    if (isdefined(self.mdl_orb)) {
        self.mdl_orb delete();
    }
    wait(0.25);
    level notify(#"hash_62901a3385d3e7af");
    foreach (player in getplayers()) {
        player.b_ignore_fow_damage = 0;
    }
    level flag::set(#"hash_1558183088c6ccff");
    self playrumbleonentity(#"hash_2d43d9987e4a73a8");
    self kill();
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 0, eflags: 0x2 linked
// Checksum 0x43defb6f, Offset: 0x1d40
// Size: 0x4c
function function_af7669e6() {
    level zm_vo::function_7622cb70("Step4PhaseRoverEnd");
    wait(0.5);
    level zm_vo::function_7622cb70("Step4PhaseRoverEndResponse");
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 0, eflags: 0x2 linked
// Checksum 0x6c59a1c9, Offset: 0x1d98
// Size: 0x122
function function_174dde71() {
    self endon(#"hash_d2f2236898d7b64", #"death");
    self.var_f8edfabd = 1;
    wait(1);
    self disconnectpaths();
    self.var_59078fae = 1;
    wait(1);
    slots = namespace_85745671::function_bdb2b85b(self, self.origin, self.angles, 64, 4, 300);
    if (!isdefined(slots) || slots.size <= 0) {
        self.var_f8edfabd = 0;
        return;
    }
    self.var_b79a8ac7 = {#var_f019ea1a:1000, #slots:slots};
    level.attackables[level.attackables.size] = self;
    self.var_f8edfabd = 0;
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0xae16d0c5, Offset: 0x1ec8
// Size: 0x86
function function_36359055(instance) {
    instance endon(#"objective_ended");
    self endon(#"death");
    while (true) {
        if (!is_true(self.var_a123c71)) {
            self playsound(#"hash_52af5fa9a4db69a2");
        }
        wait(3);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x9ac8afd5, Offset: 0x1f58
// Size: 0x208
function function_a76b2c1f(instance) {
    self endon(#"death");
    instance endon(#"objective_ended");
    while (true) {
        s_result = self waittill(#"bridge", #"stairs");
        if (s_result._notify === "bridge") {
            s_pos = struct::get("bridge_pos");
            self thread namespace_7589cf5c::function_ac709d66(instance, #"hash_206f96ca8a8b9649");
        } else {
            s_pos = struct::get("stairs_pos");
        }
        if (!isdefined(s_pos)) {
            return;
        }
        a_s_pts = namespace_85745671::function_e4791424(s_pos.origin, 40, 40, s_pos.radius);
        if (!isdefined(a_s_pts)) {
            return;
        }
        var_559503f1 = array::randomize(a_s_pts);
        n_spawns = function_dae1a57b() + int(function_dae1a57b() * 0.5);
        for (i = 0; i < n_spawns; i++) {
            if (isdefined(var_559503f1[i])) {
                self thread function_dd9b1007(instance, var_559503f1[i].origin, var_559503f1[i].angles);
            }
            wait(0.1);
        }
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x64bf4e5, Offset: 0x2168
// Size: 0x70
function function_738143f5(instance) {
    self endon(#"death");
    instance endon(#"objective_ended");
    while (true) {
        self waittill(#"assault");
        self thread function_95015f9a(instance);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0xf3ded88, Offset: 0x21e0
// Size: 0x14c
function function_95015f9a(instance) {
    self endon(#"death");
    instance endon(#"objective_ended");
    v_ground = self function_6d122cef();
    if (!isdefined(v_ground)) {
        return;
    }
    a_s_pts = namespace_85745671::function_e4791424(v_ground, 40, 40, 2400);
    if (!isdefined(a_s_pts)) {
        return;
    }
    var_559503f1 = array::randomize(a_s_pts);
    n_spawns = function_dae1a57b();
    for (i = 0; i < n_spawns; i++) {
        if (isdefined(var_559503f1[i]) && instance.var_74ec00fb < instance.n_zombies_max) {
            self thread function_dd9b1007(instance, var_559503f1[i].origin, var_559503f1[i].angles);
        }
        wait(0.1);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 0, eflags: 0x2 linked
// Checksum 0xb82013f6, Offset: 0x2338
// Size: 0x14a
function function_6d122cef() {
    self endon(#"death");
    nd_current = self.currentnode;
    if (isdefined(nd_current)) {
        v_forward = vectornormalize(anglestoforward(nd_current.angles)) * 2400 + nd_current.origin;
    } else {
        v_forward = vectornormalize(anglestoforward(self.angles)) * 2400 + self.origin;
    }
    if (isdefined(v_forward)) {
        v_ground = groundtrace(v_forward + (0, 0, 1000), v_forward + (0, 0, -1000), 0, self)[#"position"];
    }
    if (!isdefined(v_ground)) {
        if (isdefined(self.nextnode)) {
            v_ground = self.nextnode.origin;
        } else {
            v_ground = self.origin;
        }
    }
    return v_ground;
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 3, eflags: 0x2 linked
// Checksum 0x22eecc49, Offset: 0x2490
// Size: 0x294
function function_dd9b1007(instance, v_spawnpt, v_ang) {
    self endon(#"death");
    instance endon(#"objective_ended");
    level flag::wait_till("spawn_zombies");
    var_7ecdee63 = function_aece4588(level.var_b48509f9);
    if (namespace_7589cf5c::function_82e262cf(var_7ecdee63)) {
        if (isdefined(instance.var_38c710c3)) {
            n_cooldown = namespace_7589cf5c::function_190c51a9();
            var_be32c966 = float(gettime()) / 1000 - instance.var_38c710c3;
            if (var_be32c966 < n_cooldown) {
                var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
            } else {
                instance.var_38c710c3 = undefined;
            }
        }
        if (instance.var_2133c784 >= instance.var_61c57c53 || instance.var_b803db9c >= instance.var_5de17ec9) {
            var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
        }
    }
    ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, v_spawnpt, v_ang, "rover_zombie");
    wait(0.1);
    if (isdefined(ai_spawned)) {
        ai_spawned.var_a950813d = 1;
        instance.var_74ec00fb++;
        if (namespace_7589cf5c::function_82e262cf(ai_spawned.aitype)) {
            instance.var_38c710c3 = float(gettime()) / 1000;
            instance.var_2133c784++;
            instance.var_b803db9c++;
            ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &function_c36cb7b1);
        } else {
            ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &function_b3791df9);
        }
        ai_spawned thread function_bf606a73(self, instance);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 0, eflags: 0x2 linked
// Checksum 0xaaa36f4d, Offset: 0x2730
// Size: 0xce
function function_dae1a57b() {
    n_players = getplayers().size;
    switch (n_players) {
    case 1:
        n_spawns = 6;
        break;
    case 2:
        n_spawns = 9;
        break;
    case 3:
        n_spawns = 13;
        break;
    case 4:
        n_spawns = 18;
        break;
    default:
        n_spawns = 8;
        break;
    }
    return n_spawns;
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 0, eflags: 0x2 linked
// Checksum 0x451dd5c2, Offset: 0x2808
// Size: 0x18e
function function_e677fbe0() {
    switch (getplayers().size) {
    case 1:
        n_spawns = 8;
        n_spawns = min(12, int(level.var_b48509f9 * 0.5 + n_spawns));
        break;
    case 2:
        n_spawns = 12;
        n_spawns = min(16, int(level.var_b48509f9 * 0.5 + n_spawns));
        break;
    case 3:
        n_spawns = 18;
        n_spawns = min(22, int(level.var_b48509f9 * 0.5 + n_spawns));
        break;
    case 4:
        n_spawns = 24;
        n_spawns = min(28, int(level.var_b48509f9 * 0.5 + n_spawns));
        break;
    }
    return n_spawns;
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x1bd47c64, Offset: 0x29a0
// Size: 0x186
function function_aece4588(var_3afe334f) {
    switch (var_3afe334f) {
    case 1:
        var_e7a1cbae = #"objective_rover_ailist_1";
        break;
    case 2:
        var_e7a1cbae = #"objective_rover_ailist_2";
        break;
    case 3:
        var_e7a1cbae = #"objective_rover_ailist_3";
        break;
    case 4:
        var_e7a1cbae = #"objective_rover_ailist_4";
        break;
    case 5:
        var_e7a1cbae = #"objective_rover_ailist_5";
        break;
    case 6:
        var_e7a1cbae = #"objective_rover_ailist_6";
        break;
    case 7:
        var_e7a1cbae = #"objective_rover_ailist_7";
        break;
    default:
        var_e7a1cbae = #"objective_rover_ailist_8";
        break;
    }
    var_6017f33e = namespace_679a22ba::function_ca209564(var_e7a1cbae);
    return var_6017f33e.var_990b33df;
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 2, eflags: 0x2 linked
// Checksum 0x893c3b32, Offset: 0x2b30
// Size: 0x15e
function function_bf606a73(var_29611f04, instance) {
    self endon(#"death");
    var_29611f04 endon(#"death");
    instance endon(#"objective_ended");
    self.str_move = "sprint";
    self callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_fd68cae4);
    wait(0.1);
    while (true) {
        a_players = getplayers();
        player = awareness::function_d7fedde2(self);
        if (!isdefined(self.var_b7e90547) && isalive(self) && isalive(player)) {
            self.var_b7e90547 = 1;
            awareness::function_c241ef9a(self, player, 16);
        }
        wait(15);
        self.var_b7e90547 = undefined;
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x829fd80f, Offset: 0x2c98
// Size: 0x6c
function function_c36cb7b1(*params) {
    if (isdefined(level.contentmanager.activeobjective.var_b803db9c) && level.contentmanager.activeobjective.var_b803db9c > 0) {
        level.contentmanager.activeobjective.var_b803db9c--;
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0xf6ecd7, Offset: 0x2d10
// Size: 0x6c
function function_b3791df9(*params) {
    if (isdefined(level.contentmanager.activeobjective.var_74ec00fb) && level.contentmanager.activeobjective.var_74ec00fb > 0) {
        level.contentmanager.activeobjective.var_74ec00fb--;
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 0, eflags: 0x2 linked
// Checksum 0x9d7fc9d5, Offset: 0x2d88
// Size: 0x3c
function function_fd68cae4() {
    if (self.archetype == #"zombie") {
        self namespace_85745671::function_9758722("super_sprint");
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0xfe3392b8, Offset: 0x2dd0
// Size: 0x4bc
function function_79ae8e99(instance) {
    instance endon(#"objective_ended");
    self endon(#"death");
    while (true) {
        a_zombies = function_a38db454(self.origin, 200);
        foreach (zombie in a_zombies) {
            if (zombie.archetype === #"zombie" && is_true(self.var_a123c71) && !is_true(zombie.knockdown)) {
                if (distance2dsquared(self.origin, zombie.origin) > sqr(60)) {
                    continue;
                }
                zombie dodamage(50, self.origin, self, undefined, undefined, "MOD_CRUSH");
                zombie.knockdown = 1;
                zombie.knockdown_type = "knockdown_shoved";
                var_7d6a995e = self.origin - zombie.origin;
                var_1040735c = vectornormalize((var_7d6a995e[0], var_7d6a995e[1], 0));
                zombie_forward = anglestoforward(zombie.angles);
                zombie_forward_2d = vectornormalize((zombie_forward[0], zombie_forward[1], 0));
                zombie_right = anglestoright(zombie.angles);
                zombie_right_2d = vectornormalize((zombie_right[0], zombie_right[1], 0));
                dot = vectordot(var_1040735c, zombie_forward_2d);
                if (dot >= 0.5) {
                    zombie.knockdown_direction = "front";
                    zombie.getup_direction = "getup_back";
                    zombie thread function_c93a6362(self);
                } else if (dot < 0.5 && dot > -0.5) {
                    dot = vectordot(var_1040735c, zombie_right_2d);
                    if (dot > 0) {
                        zombie.knockdown_direction = "right";
                        if (math::cointoss()) {
                            zombie.getup_direction = "getup_back";
                        } else {
                            zombie.getup_direction = "getup_belly";
                        }
                    } else {
                        zombie.knockdown_direction = "left";
                        zombie.getup_direction = "getup_belly";
                    }
                } else {
                    zombie.knockdown_direction = "back";
                    zombie.getup_direction = "getup_belly";
                }
                continue;
            }
            if (zombie.archetype === #"zombie" && is_true(self.var_a123c71) && is_true(zombie.knockdown)) {
                if (distance2dsquared(self.origin, zombie.origin) > sqr(60)) {
                    continue;
                }
                zombie thread function_c93a6362(self);
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x39993cf3, Offset: 0x3298
// Size: 0x6c
function function_c93a6362(var_b8ca9d7) {
    self endon(#"death");
    var_b8ca9d7 endon(#"death");
    if (isdefined(self.knockdown_direction) && isalive(self)) {
        self thread function_1b4b0c63(var_b8ca9d7);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x2e05485, Offset: 0x3310
// Size: 0x14a
function function_1b4b0c63(var_b8ca9d7) {
    self endon(#"death");
    var_b8ca9d7 endon(#"death");
    wait(1);
    v_forward = var_b8ca9d7.origin + anglestoforward(var_b8ca9d7.angles) * 60;
    if (distance2dsquared(var_b8ca9d7.origin, self.origin) < sqr(70)) {
        gibserverutils::annihilate(self);
        if (isalive(self)) {
            if (zm_utility::is_magic_bullet_shield_enabled(self)) {
                self util::stop_magic_bullet_shield();
            }
            if (isalive(self)) {
                self kill();
            }
        }
        return;
    }
    self.knockdown_direction = undefined;
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 0, eflags: 0x0
// Checksum 0xf2a6da27, Offset: 0x3468
// Size: 0xec
function player_rover_pos() {
    level flag::wait_till("all_players_spawned");
    a_s_pos = struct::get_array("player_rover_pos");
    a_players = getplayers();
    for (i = 0; i < a_players.size; i++) {
        a_players[i] setorigin(a_s_pos[i].origin);
        a_players[i] setplayerangles(a_s_pos[i].angles);
    }
    level thread function_6b7297f6();
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 0, eflags: 0x2 linked
// Checksum 0x87e2aba3, Offset: 0x3560
// Size: 0x160
function function_3c40b07a() {
    self endon(#"death");
    self.n_start_health = self.health;
    self.max_health = self.n_start_health;
    var_8da3e170 = self.health / self.n_start_health;
    zm_sq::sndonoverride_eye_(var_8da3e170);
    zm_sq::function_2398ab16("objective_ended");
    while (true) {
        var_c3a3ae13 = self.health / self.n_start_health;
        if (var_c3a3ae13 >= 0 && var_8da3e170 != var_c3a3ae13) {
            zm_sq::sndonoverride_eye_(var_c3a3ae13);
        }
        var_8da3e170 = var_c3a3ae13;
        if (var_c3a3ae13 <= 0.5 && !is_true(self.var_5e22f781)) {
            self.var_5e22f781 = 1;
        }
        if (var_c3a3ae13 <= 0.2 && !is_true(self.var_2eb5c0e8)) {
            self.var_2eb5c0e8 = 1;
        }
        waitframe(1);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x47d0e88, Offset: 0x36c8
// Size: 0xe0
function function_1e4eea8e(instance) {
    self endon(#"death");
    instance endon(#"objective_ended");
    var_ad5fcb11 = 0;
    while (true) {
        if (is_true(self.var_a123c71)) {
            if (var_ad5fcb11 != 1) {
                self playsound(#"hash_432c591c600ef4d2");
                var_ad5fcb11 = 1;
            }
        } else if (var_ad5fcb11 != 0) {
            self playsound(#"hash_5d9bb1a3ab5cf792");
            var_ad5fcb11 = 0;
        }
        wait(0.25);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x9610b09f, Offset: 0x37b0
// Size: 0xd4
function function_d30f71c4(instance) {
    instance endon(#"objective_ended");
    self endon(#"reached_end_node");
    self waittill(#"death");
    if (isdefined(self)) {
        self clientfield::set("" + #"hash_1e59af4706036a79", 0);
        self.var_a123c71 = 0;
    }
    if (isdefined(self)) {
        radiusdamage(self.origin, 1200, 1000, 500, self, "MOD_EXPLOSIVE");
    }
    objective_manager::objective_ended(instance, 0);
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x47b9f00c, Offset: 0x3890
// Size: 0x64
function function_d4694f6c(instance) {
    self.n_objective_id = zm_utility::function_f5a222a8(#"hash_33a2a5933ee65208", self);
    instance waittill(#"objective_ended");
    zm_utility::function_bc5a54a8(self.n_objective_id);
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x50feeeb3, Offset: 0x3900
// Size: 0x2e0
function function_24735dd6(instance) {
    instance endon(#"objective_ended");
    self endon(#"death");
    while (true) {
        s_result = self waittill(#"riser", #"bridge_riser");
        var_cec14fb9 = undefined;
        if (s_result._notify === "bridge_riser") {
            var_90a50598 = isdefined(instance.contentgroups[#"hash_49cdcfaa651f27b1"]) ? instance.contentgroups[#"hash_49cdcfaa651f27b1"] : [];
            str_soundalias = #"hash_77ae7c9f20198410";
            n_dist = 600;
            n_speed = 100;
        } else {
            var_90a50598 = isdefined(instance.contentgroups[#"hash_2cbcef3b0e436f8f"]) ? instance.contentgroups[#"hash_2cbcef3b0e436f8f"] : [];
            str_soundalias = #"hash_86b3b0126e9a252";
            var_cec14fb9 = #"";
            n_dist = 2400;
            n_speed = 150;
        }
        n_time = n_dist / n_speed;
        for (i = 0; i < var_90a50598.size; i++) {
            var_a989d2f6 = content_manager::spawn_script_model(var_90a50598[i], #"hash_a02ea23378ffdcb", 0);
            if (isdefined(var_a989d2f6)) {
                var_a989d2f6 setscale(var_90a50598[i].modelscale);
                var_a989d2f6 clientfield::set("" + #"hash_6390b0f27a5057c2", 1);
                wait(1);
                var_a989d2f6 movez(n_dist, n_time, 1, 1);
                var_a989d2f6 playsound(str_soundalias);
                if (isdefined(var_cec14fb9)) {
                    var_a989d2f6 playloopsound(#"hash_3deffccf71f6691f");
                }
                var_a989d2f6 thread function_753752c6(instance);
            }
        }
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0xccc17df5, Offset: 0x3be8
// Size: 0x1b8
function function_4e0f32cf(instance) {
    var_90a50598 = isdefined(instance.contentgroups[#"jellyfish_large"]) ? instance.contentgroups[#"jellyfish_large"] : [];
    foreach (var_b6e76b65 in var_90a50598) {
        var_dafcbf83 = content_manager::spawn_script_model(var_b6e76b65, #"hash_a02ea23378ffdcb", 0);
        util::wait_network_frame();
        if (isdefined(var_dafcbf83)) {
            var_dafcbf83 thread function_6312130f(instance);
            var_dafcbf83 thread function_753752c6(instance);
            var_dafcbf83 setscale(var_b6e76b65.modelscale);
            wait(randomfloatrange(0.05, 0.25));
            var_dafcbf83 clientfield::set("" + #"hash_6390b0f27a5057c2", 1);
        }
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0xe5312d6, Offset: 0x3da8
// Size: 0xf8
function function_6312130f(instance) {
    instance endon(#"objective_ended");
    self endon(#"death");
    level flag::wait_till("all_players_spawned");
    foreach (player in getplayers()) {
        self setinvisibletoplayer(player);
        self thread function_aa475e00(instance, player);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0xb941b1fe, Offset: 0x3ea8
// Size: 0x84
function function_753752c6(instance) {
    self endon(#"death");
    level.var_c39a4b8f endon(#"death");
    instance endon(#"objective_ended");
    level.var_c39a4b8f waittill(#"hash_654e85dc63fd03c5");
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 2, eflags: 0x2 linked
// Checksum 0xa92baa62, Offset: 0x3f38
// Size: 0x17c
function function_aa475e00(instance, player) {
    instance endon(#"objective_ended");
    self endon(#"death");
    player endon(#"death");
    var_4c979c5b = getentarray("sr_boundary_clip", "targetname");
    while (true) {
        player.var_d3316c50 = 0;
        foreach (var_b7e0b1c0 in var_4c979c5b) {
            if (player istouching(var_b7e0b1c0)) {
                player.var_d3316c50 = 1;
            }
        }
        if (isdefined(player) && is_true(player.var_d3316c50)) {
            break;
        }
        wait(0.1);
    }
    if (isdefined(player)) {
        self setvisibletoplayer(player);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x404a197f, Offset: 0x40c0
// Size: 0x1c8
function function_81f989d5(instance) {
    self endon(#"death");
    self waittill(#"hash_4d73332b0eee788d");
    var_ee024c6b = isdefined(instance.contentgroups[#"hash_2401ff8cbe2bdd13"]) ? instance.contentgroups[#"hash_2401ff8cbe2bdd13"] : [];
    instance.var_c851d175 = [];
    foreach (var_2fb4d3dd in var_ee024c6b) {
        var_b8b81de9 = util::spawn_model(#"hash_46cb6387fd2006a7", var_2fb4d3dd.origin, var_2fb4d3dd.angles);
        wait(randomfloatrange(0.1, 0.5));
        instance.var_c851d175[instance.var_c851d175.size] = var_b8b81de9;
        var_b8b81de9 clientfield::set("" + #"hash_6390b0f27a5057c2", 1);
        var_b8b81de9 thread scene::play(#"aib_t9_zm_tmpst_boss_fight", "idle", var_b8b81de9);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x2fa7b61f, Offset: 0x4290
// Size: 0xa4
function function_9072f256(instance) {
    instance endon(#"objective_ended");
    self waittill(#"hash_2401ff8cbe2bdd13");
    for (i = 0; i < instance.var_c851d175.size; i++) {
        instance.var_c851d175[i] thread function_12e2aa23();
        wait(randomfloatrange(0.5, 0.8));
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 0, eflags: 0x2 linked
// Checksum 0xf27826b4, Offset: 0x4340
// Size: 0x74
function function_12e2aa23() {
    self clientfield::set("" + #"hash_6390b0f27a5057c2", 0);
    self scene::play(#"aib_t9_zm_tmpst_boss_fight", "teleport_start", self);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 15, eflags: 0x2 linked
// Checksum 0xf8372446, Offset: 0x43c0
// Size: 0x234
function function_978eec63(einflictor, eattacker, idamage, *idflags, smeansofdeath, *weapon, *vpoint, *vdir, *shitloc, *vdamageorigin, *psoffsettime, *damagefromunderneath, *modelindex, *partname, *vsurfacenormal) {
    if (isdefined(modelindex) && isplayer(modelindex)) {
        partname = 0;
        return partname;
    } else if (isalive(modelindex)) {
        if (!self.var_aa4b496) {
            self thread function_cb660b90();
        }
        if (vsurfacenormal === "MOD_MELEE") {
            self playsound(#"hash_1ddeb8af5a217a6e");
        }
        if (modelindex.model === #"wpn_t9_sr_electric_avogadro_projectile") {
            partname = 60;
        } else if (modelindex.var_6f84b820 === #"elite") {
            partname = 100;
        } else if (modelindex.var_6f84b820 === #"special") {
            partname = 80;
        } else if (modelindex.var_6f84b820 === #"normal") {
            partname = 50;
        } else if (vsurfacenormal === "MOD_UNKNOWN") {
            partname = 0;
        }
    } else if (!isdefined(modelindex) && !isdefined(damagefromunderneath) && vsurfacenormal === "MOD_UNKNOWN") {
        partname = 80;
    } else if (vsurfacenormal === "MOD_BURNED") {
        partname = 50;
    }
    if (partname > 200) {
        partname = 200;
    }
    return partname;
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 0, eflags: 0x2 linked
// Checksum 0x128434de, Offset: 0x4600
// Size: 0x6e
function function_cb660b90() {
    self endon(#"death");
    self.var_aa4b496 = 1;
    self playloopsound(#"hash_2a034c2643fc1322");
    wait(4.75);
    self stoploopsound();
    self.var_aa4b496 = 0;
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x9a8e0f8b, Offset: 0x4678
// Size: 0x400
function function_c97fdd1d(var_6201c191) {
    if (isdefined(var_6201c191)) {
        self.var_55b8433b = [];
        var_5504b0b = var_6201c191.contentgroups[#"hash_130282cd5152e410"];
        if (!isdefined(var_5504b0b)) {
            return;
        }
        foreach (s_group in var_5504b0b) {
            var_842cdacd = s_group.contentgroups[#"hash_49340510783e32e4"];
            foreach (spawn in var_842cdacd) {
                if (math::cointoss(50)) {
                    model = #"p9_gold_surcrystal_medium_01";
                    str_scene = "p9_zm_gold_sur_crystal_medium_01_bundle";
                } else {
                    model = #"p9_gold_surcrystal_medium_02";
                    str_scene = "p9_zm_gold_sur_crystal_medium_02_bundle";
                }
                var_37180a9f = util::spawn_model(model, spawn.origin, spawn.angles, undefined, 1);
                if (isdefined(var_37180a9f)) {
                    if (!isdefined(self.var_55b8433b)) {
                        self.var_55b8433b = [];
                    } else if (!isarray(self.var_55b8433b)) {
                        self.var_55b8433b = array(self.var_55b8433b);
                    }
                    self.var_55b8433b[self.var_55b8433b.size] = var_37180a9f;
                    var_37180a9f setscale(randomfloatrange(0.85, 1.2));
                    var_37180a9f function_619a5c20();
                    var_37180a9f val::set("loot_pod", "takedamage", 1);
                    var_37180a9f.health = 5;
                    var_37180a9f thread scene::play(str_scene, var_37180a9f);
                    var_37180a9f fx::play(#"hash_6583defa5c93e609", var_37180a9f.origin, var_37180a9f.angles, #"hash_285fd9bc53c292d8", 1);
                    level thread function_8265e656(var_37180a9f);
                    util::wait_network_frame();
                }
            }
        }
    }
    self waittill(#"objective_ended");
    if (isdefined(self.var_55b8433b)) {
        foreach (pod in self.var_55b8433b) {
            pod delete();
        }
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x32f72a23, Offset: 0x4a80
// Size: 0x12c
function function_8265e656(var_37180a9f) {
    var_37180a9f endon(#"death");
    var_37180a9f callback::function_d8abfc3d(#"hash_5f0caa4b2d44fedf", &function_1cabf2e9);
    while (isdefined(var_37180a9f) && var_37180a9f.health > 0) {
        s_result = var_37180a9f waittill(#"damage", #"death");
        if (isplayer(s_result.attacker) && isalive(s_result.attacker)) {
            s_result.attacker util::show_hit_marker();
        }
    }
    var_37180a9f callback::callback(#"hash_5f0caa4b2d44fedf", s_result);
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x6 linked
// Checksum 0xb16658d4, Offset: 0x4bb8
// Size: 0x13c
function private function_1cabf2e9(s_result) {
    if (isplayer(s_result.attacker) || isai(s_result.attacker) || isvehicle(s_result.attacker)) {
        ping::function_9455917d(self);
        self namespace_58949729::function_8ef626e3();
        playsoundatposition(#"hash_54c5c342b84cf845", self.origin);
        if (isplayer(s_result.attacker) && s_result.attacker isinvehicle()) {
            var_80730518 = s_result.attacker getvehicleoccupied();
            if (isdefined(var_80730518)) {
                var_80730518 thread namespace_58949729::function_df0dbb31();
            }
        }
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x88f853b4, Offset: 0x4d00
// Size: 0xc8
function function_1eef26bc(instance) {
    instance endon(#"objective_ended");
    self endon(#"death");
    while (true) {
        if (!self.var_a123c71) {
            wait(10);
            if (!self.var_a123c71 && !is_true(self.abnormal_status.emped)) {
                self namespace_7589cf5c::function_ac709d66(instance, #"hash_165229d1cb432efa");
                wait(2);
            }
        }
        wait(1);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 1, eflags: 0x2 linked
// Checksum 0x158d5f80, Offset: 0x4dd0
// Size: 0xf0
function function_ca92ed05(instance) {
    instance endon(#"objective_ended");
    self endon(#"death");
    while (true) {
        if (is_true(self.abnormal_status.emped)) {
            self namespace_7589cf5c::function_ac709d66(instance, #"hash_42e191393187cfdb");
            while (is_true(self.abnormal_status.emped)) {
                wait(0.5);
            }
            self namespace_7589cf5c::function_ac709d66(instance, #"hash_6170663b9a995a23");
        }
        wait(0.5);
    }
}

// Namespace namespace_e69881c5/namespace_e69881c5
// Params 0, eflags: 0x2 linked
// Checksum 0x80a273e3, Offset: 0x4ec8
// Size: 0x25c
function function_6b7297f6() {
    while (!isdefined(level.var_c39a4b8f)) {
        waitframe(1);
    }
    mdl_orb = util::spawn_model(#"hash_53079af25eecf35b", level.var_c39a4b8f gettagorigin("tag_cage_attach"));
    mdl_orb ghost();
    mdl_orb setscale(0.5);
    mdl_orb playsound(#"hash_55b5e35f7d261fee");
    mdl_orb playloopsound(#"hash_5dc7884f02e73776");
    mdl_orb fx::play(#"hash_c36745220550934", mdl_orb.origin + (0, 0, 22), mdl_orb.angles, #"hash_62901a3385d3e7af", 1);
    level.var_c39a4b8f.mdl_orb = mdl_orb;
    mdl_orb endon(#"death");
    waitframe(1);
    v_offset = (0, 0, -5);
    str_tag = "tag_cage_attach";
    var_ec6068b9 = level.var_c39a4b8f gettagorigin(str_tag);
    mdl_orb moveto(var_ec6068b9 + v_offset, 0.75);
    mdl_orb waittill(#"movedone");
    level.var_c39a4b8f.mdl_orb = mdl_orb;
    mdl_orb linkto(level.var_c39a4b8f, str_tag, v_offset, (0, 0, 0));
    mdl_orb bobbing((0, 0, 1), 5, 3);
}

