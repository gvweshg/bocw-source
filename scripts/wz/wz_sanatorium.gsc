// Atian COD Tools GSC CW decompiler test
#using script_72d96920f15049b8;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace wz_sanatorium;

// Namespace wz_sanatorium/wz_sanatorium
// Params 0, eflags: 0x5
// Checksum 0x5a33bd21, Offset: 0x3b0
// Size: 0x84
function private autoexec function_6a8a6c0e() {
    gametype = getdvarstring(#"g_gametype");
    if (gametype != "zsurvival") {
        setgametypesetting(#"hash_21ac269b4a3e7e37", 0);
        setgametypesetting(#"hash_7fc70ca67b167d76", 0);
    }
}

// Namespace wz_sanatorium/level_init
// Params 1, eflags: 0x20
// Checksum 0xbb148d67, Offset: 0x440
// Size: 0x194
function event_handler[level_init] main(*eventstruct) {
    /#
        callback::on_vehicle_spawned(&debug_vehicle_spawn);
    #/
    load::main();
    level.var_e1206a08 = 1;
    scene::function_497689f6(#"cin_hpc_intro_allies", "hpc_intro_air_transport", "tag_probe_attach", "probe_hpc_intro_hero_plane");
    scene::function_497689f6(#"hash_7208b225680fb2ff", "helicopter", "tag_probe_cabin", "prb_tn_us_heli_lg_cabin");
    scene::function_497689f6(#"hash_7208b225680fb2ff", "helicopter", "tag_probe_cockpit", "prb_tn_us_heli_lg_cockpit");
    function_a387f4f5();
    compass::setupminimap("");
    level.var_29cfe9dd = 1;
    if (util::get_game_type() === #"zsurvival") {
        level util::set_lighting_state(1);
    }
    function_564698fd();
    function_e8fa58f2();
}

// Namespace wz_sanatorium/wz_sanatorium
// Params 0, eflags: 0x2 linked
// Checksum 0xca9f5b33, Offset: 0x5e0
// Size: 0x1fc
function function_e8fa58f2() {
    hidemiscmodels("sv_holdout_aetherfungus");
    hidemiscmodels("defend_corpses_1");
    hidemiscmodels("defend_corpses_2");
    hidemiscmodels("defend_corpses_3");
    hidemiscmodels("hvt_mechz_corpses");
    hidemiscmodels("hvt_mimic_corpses");
    hidemiscmodels("hvt_raz_corpses");
    hidemiscmodels("hvt_steiner_corpses");
    hidemiscmodels("payload_teleport_corpses");
    hidemiscmodels("payload_noteleport_corpses");
    hidemiscmodels("retrieval_corpses");
    hidemiscmodels("secure_corpses");
    hidemiscmodels("hordehunt_corpses_1");
    hidemiscmodels("hordehunt_corpses_2");
    hidemiscmodels("hordehunt_corpses_3");
    hidemiscmodels("fishing_setup");
    hidemiscmodels("end_of_level_corpses");
    hidemiscmodels("end_of_level_exfil_outro_igc_props");
    hidemiscmodels("mq4_choppercrash");
    hidemiscmodels("sv_phase_aetherfungus");
    hidemiscmodels("transport_corpses");
}

// Namespace wz_sanatorium/wz_sanatorium
// Params 0, eflags: 0x2 linked
// Checksum 0x32e5f6fe, Offset: 0x7e8
// Size: 0xac
function function_564698fd() {
    gametype = function_be90acca(util::get_game_type());
    if (gametype === "zsurvival") {
        level.var_29cfe9dd = 0;
        level.mapcenter = (-4614.75, -20113.8, -884.397);
        namespace_e8c18978::function_d887d24d("chopper_gunner_vol_sanatorium_1");
        namespace_e8c18978::function_d887d24d("chopper_gunner_vol_sanatorium_2");
    }
}

// Namespace wz_sanatorium/wz_sanatorium
// Params 0, eflags: 0x2 linked
// Checksum 0x1b76a60, Offset: 0x8a0
// Size: 0x214
function function_a387f4f5() {
    if (level.basegametype == #"fireteam_dirty_bomb" || level.basegametype == #"fireteam_elimination" || level.basegametype == #"fireteam_koth" || level.basegametype == #"fireteam_satlink") {
        /#
            level thread function_f9492b33();
        #/
        if (isdefined(level.var_574cc797)) {
            level thread [[ level.var_574cc797 ]](#"hash_67492346597ba3f2", level.var_b9f31e66);
            level thread [[ level.var_574cc797 ]](#"hash_49fe7c02fa7110b2", level.var_b9f31e66);
            level thread [[ level.var_574cc797 ]](#"hash_611c237e8680eddb", level.var_b9f31e66);
            level thread [[ level.var_574cc797 ]](#"hash_64c2073e77d0bb83", level.var_b9f31e66);
            level thread [[ level.var_574cc797 ]](#"hash_59e1a2689fd7c290", level.var_b9f31e66);
            level thread [[ level.var_574cc797 ]](#"hash_4b757b29cc4c3712", level.var_b9f31e66);
            level thread [[ level.var_574cc797 ]](#"hash_5ceed4cd33f4824a", level.var_b9f31e66);
            level thread [[ level.var_574cc797 ]](#"hash_1cec1fe807ac83f5", level.var_b9f31e66);
            level thread [[ level.var_574cc797 ]](#"hash_7bf3ae47cb2f9cd6", level.var_b9f31e66);
        }
    }
}

/#

    // Namespace wz_sanatorium/wz_sanatorium
    // Params 0, eflags: 0x0
    // Checksum 0x5086a5ac, Offset: 0xac0
    // Size: 0x1c
    function debug_vehicle_spawn() {
        self thread function_f42944c7();
    }

    // Namespace wz_sanatorium/wz_sanatorium
    // Params 0, eflags: 0x0
    // Checksum 0x98f7ad5f, Offset: 0xae8
    // Size: 0x41e
    function function_f42944c7() {
        if (!getdvarint(#"hash_57a9b32c8a8503f1", 0) || !self function_1221d304()) {
            return;
        }
        self endon(#"death");
        if (!isdefined(level.var_6eef6733)) {
            level.var_6eef6733 = [];
        }
        if (!isdefined(level.var_6eef6733[function_9e72a96(self.vehicletype)])) {
            level.var_6eef6733[function_9e72a96(self.vehicletype)] = [];
        }
        if (!isdefined(level.var_6eef6733[function_9e72a96(self.vehicletype)])) {
            level.var_6eef6733[function_9e72a96(self.vehicletype)] = [];
        } else if (!isarray(level.var_6eef6733[function_9e72a96(self.vehicletype)])) {
            level.var_6eef6733[function_9e72a96(self.vehicletype)] = array(level.var_6eef6733[function_9e72a96(self.vehicletype)]);
        }
        level.var_6eef6733[function_9e72a96(self.vehicletype)][level.var_6eef6733[function_9e72a96(self.vehicletype)].size] = self;
        v_spawn_pos = self.origin;
        level thread function_f567f0cd();
        level flag::wait_till("<unknown string>");
        str_type = function_9e72a96(self.vehicletype);
        v_color = self function_b2775b52();
        while (getdvarint(#"hash_57a9b32c8a8503f1", 0)) {
            var_91d1913b = distance2d(level.players[0].origin, self.origin);
            n_radius = 0.015 * var_91d1913b;
            if (n_radius > 768) {
                n_radius = 768;
            }
            if (var_91d1913b > 768) {
                sphere(self.origin, n_radius, v_color);
                if (var_91d1913b < 2048) {
                    print3d(self.origin + (0, 0, 32), str_type, v_color);
                }
            }
            if (getdvarint(#"hash_491fd7f96bbc8909", 0) && distance2d(v_spawn_pos, self.origin) > 768) {
                line(v_spawn_pos, self.origin, v_color);
                circle(v_spawn_pos, 64, v_color, 0, 1);
            }
            waitframe(1);
        }
    }

    // Namespace wz_sanatorium/wz_sanatorium
    // Params 0, eflags: 0x0
    // Checksum 0xf4048cd7, Offset: 0xf10
    // Size: 0x276
    function function_f567f0cd() {
        level notify(#"hash_79845fe0e187bb22");
        level endon(#"hash_79845fe0e187bb22");
        while (getdvarint(#"hash_57a9b32c8a8503f1", 0)) {
            n_total = 0;
            var_bd9acc19 = 176;
            foreach (var_f0ffe8b2 in level.var_6eef6733) {
                var_bd9acc19 += 24;
                n_total += var_f0ffe8b2.size;
                foreach (var_3ed342fe in var_f0ffe8b2) {
                    if (isvehicle(var_3ed342fe) && isdefined(var_f0ffe8b2) && isdefined(var_f0ffe8b2[0]) && isdefined(var_f0ffe8b2[0].vehicletype)) {
                        debug2dtext((810, var_bd9acc19, 0), function_9e72a96(var_f0ffe8b2[0].vehicletype) + "<unknown string>" + var_f0ffe8b2.size, var_3ed342fe function_b2775b52());
                        break;
                    }
                }
            }
            debug2dtext((810, 176, 0), "<unknown string>" + n_total, (1, 1, 1));
            waitframe(1);
        }
    }

    // Namespace wz_sanatorium/wz_sanatorium
    // Params 0, eflags: 0x0
    // Checksum 0xf408e5af, Offset: 0x1190
    // Size: 0x1de
    function function_1221d304() {
        a_str_types = array(#"veh_quad_player_wz_blk", #"hash_232abda4e81275f4", #"veh_quad_player_wz_grn", #"hash_2f8d60a5381870ee", #"veh_quad_player_wz_tan", #"hash_7675529f7a785935", #"vehicle_t9_mil_fav_light", #"hash_42b91f3544c1a9e1", #"hash_6595f5efe62a4ec", #"hash_17e868e0ebf3c1d6", #"vehicle_motorcycle_mil_us_offroad", #"hash_2c0e11a1e87bbcd5", #"vehicle_t9_mil_snowmobile", #"hash_28d512b739c9d9c1", #"hash_2d32c08b862baa46", #"vehicle_t9_mil_ru_truck_light_player", #"hash_2a245bf3738fed8b", #"hash_985b7e40ee02aa2", #"hash_dd63f34c77a725e");
        foreach (str_type in a_str_types) {
            if (self.vehicletype == str_type) {
                return 1;
            }
        }
        return 0;
    }

    // Namespace wz_sanatorium/wz_sanatorium
    // Params 0, eflags: 0x0
    // Checksum 0xe36eb6c0, Offset: 0x1378
    // Size: 0x1ca
    function function_b2775b52() {
        switch (self.vehicletype) {
        case #"hash_6595f5efe62a4ec":
            return (1, 0, 0);
        case #"hash_17e868e0ebf3c1d6":
            return (1, 0, 0);
        case #"hash_2c0e11a1e87bbcd5":
            return (1, 0, 0);
        case #"hash_dd63f34c77a725e":
        case #"hash_2a245bf3738fed8b":
            return (1, 1, 1);
        case #"hash_7675529f7a785935":
            return (1, 0.5, 0);
        case #"hash_28d512b739c9d9c1":
            return (1, 1, 0);
        case #"vehicle_t9_mil_fav_light":
            return (0, 1, 0);
        case #"hash_42b91f3544c1a9e1":
            return (0, 1, 1);
        case #"hash_985b7e40ee02aa2":
        case #"hash_2d32c08b862baa46":
        case #"vehicle_t9_mil_ru_truck_light_player":
            return (0, 1, 1);
        case #"vehicle_t9_mil_snowmobile":
            return (0, 0, 1);
        case #"vehicle_motorcycle_mil_us_offroad":
            return (1, 0, 1);
        case #"veh_quad_player_wz_tan":
        case #"veh_quad_player_wz_blk":
        case #"hash_232abda4e81275f4":
        case #"hash_2f8d60a5381870ee":
        case #"veh_quad_player_wz_grn":
            return (1, 0, 1);
        default:
            return (0, 0, 0);
        }
    }

    // Namespace wz_sanatorium/wz_sanatorium
    // Params 0, eflags: 0x0
    // Checksum 0x79b90b73, Offset: 0x1550
    // Size: 0x1dc
    function function_f9492b33() {
        if (!getdvarint(#"hash_31ae3e289b7b921d", 0)) {
            return;
        }
        level flag::wait_till("<unknown string>");
        if (!isdefined(level.dirtybombs)) {
            return;
        }
        while (getdvarint(#"hash_31ae3e289b7b921d", 0)) {
            dirtybombs = arraysortclosest(level.dirtybombs, level.players[0].origin, 32, 0, 100000);
            foreach (dirtybomb in dirtybombs) {
                waitframe(1);
                if (!level.players[0] util::is_player_looking_at(dirtybomb.origin, 0.6, 0)) {
                    continue;
                }
                sphere(dirtybomb.origin, 32, (1, 1, 0), 1, 0, 8, 2);
                circle(dirtybomb.origin, 96, (1, 1, 0), 0, 1, 2);
            }
        }
    }

    // Namespace wz_sanatorium/wz_sanatorium
    // Params 2, eflags: 0x0
    // Checksum 0x914d138, Offset: 0x1738
    // Size: 0xbe
    function function_d72aa67e(str_list, str_name) {
        a_str_tok = strtok(str_list, "<unknown string>");
        foreach (tok in a_str_tok) {
            if (tok == str_name) {
                return 1;
            }
        }
        return 0;
    }

    // Namespace wz_sanatorium/wz_sanatorium
    // Params 4, eflags: 0x0
    // Checksum 0x439f0217, Offset: 0x1800
    // Size: 0x314
    function function_47351fa3(org, ang, opcolor, frames) {
        if (!isdefined(frames)) {
            frames = 1;
        }
        forward = anglestoforward(ang);
        forwardfar = vectorscale(forward, 50);
        forwardclose = vectorscale(forward, 50 * 0.8);
        right = anglestoright(ang);
        left = anglestoright(ang) * -1;
        leftdraw = vectorscale(right, 50 * -0.2);
        rightdraw = vectorscale(right, 50 * 0.2);
        up = anglestoup(ang);
        right = vectorscale(right, 50);
        left = vectorscale(left, 50);
        up = vectorscale(up, 50);
        red = (0.9, 0.2, 0.2);
        green = (0.2, 0.9, 0.2);
        blue = (0.2, 0.2, 0.9);
        if (isdefined(opcolor)) {
            red = opcolor;
            green = opcolor;
            blue = opcolor;
        }
        line(org, org + forwardfar, red, 0.9, 0, frames);
        line(org + forwardfar, org + forwardclose + rightdraw, red, 0.9, 0, frames);
        line(org + forwardfar, org + forwardclose + leftdraw, red, 0.9, 0, frames);
        line(org, org + right, blue, 0.9, 0, frames);
        line(org, org + left, blue, 0.9, 0, frames);
        line(org, org + up, green, 0.9, 0, frames);
    }

#/
