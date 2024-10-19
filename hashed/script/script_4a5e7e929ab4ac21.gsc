// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\cp_common\util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace orbit;

// Namespace orbit/namespace_8518c3a5
// Params 0, eflags: 0x5
// Checksum 0xa51cc7d3, Offset: 0x330
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"orbit", &preinit, undefined, undefined, undefined);
}

// Namespace orbit/namespace_8518c3a5
// Params 0, eflags: 0x2 linked
// Checksum 0x1eb3e9dd, Offset: 0x378
// Size: 0x64
function preinit() {
    level flag::init("flag_orbit_chopper_complete");
    level flag::init(" flag_orbit_chopper_landing_requested");
    level flag::init("flag_orbit_chopper_shifting");
}

// Namespace orbit/namespace_8518c3a5
// Params 6, eflags: 0x0
// Checksum 0x7a69c9b3, Offset: 0x3e8
// Size: 0x3ec
function function_1ffa9231(start_node, var_23b6164f = 0, var_aac80b66 = 1, var_e883a73e, var_794dcc13 = 0, var_c38c0668 = 0) {
    level flag::clear("flag_orbit_chopper_shifting");
    level flag::clear(" flag_orbit_chopper_landing_requested");
    level flag::clear("flag_orbit_chopper_complete");
    chopper = undefined;
    waittillframeend();
    if (isdefined(level.var_7466d419)) {
        chopper = level.var_7466d419;
        chopper setcandamage(0);
        chopper.ignoreme = 1;
        level.player.ignoreme = 0;
    } else {
        rootmapname = getrootmapname();
        if (rootmapname === "cp_nam_armada") {
            assertmsg("<unknown string>");
            return;
        } else {
            function_44e72b9e(1, start_node);
            chopper = level.var_6fb3a1e6;
        }
    }
    level.var_a5a07145 = [];
    level.var_cd6991fa = 0;
    level.var_e3b1e2dc = 0;
    level.var_34599e02 = 0;
    level.var_d6cb97e = 0;
    level.var_96cea297 = start_node;
    level.var_2b03dd4 = 1;
    level.var_288d6225 = undefined;
    level.var_14b58530 = var_aac80b66;
    level.var_b105235c = 1;
    level.var_e3e3a045 = 0;
    level.var_bce2f77 = 1000;
    level.var_7228ded = 0;
    level.var_883c5961 = 0;
    if (!isdefined(level.var_82b867fa)) {
        level.var_82b867fa = 1;
    }
    level function_76a96530(start_node);
    chopper cleargoalyaw();
    chopper cleartargetyaw();
    chopper setvehvelocity((0, 0, 0));
    chopper setphysacceleration((0, 0, 0));
    chopper setangularvelocity((0, 0, 0));
    chopper sethoverparams(0);
    chopper function_a57c34b7(start_node.origin, 1);
    level thread function_d9bd5da4();
    if (var_aac80b66) {
        chopper thread function_7eb6aae3(var_e883a73e);
        level thread function_5f7a4f66(var_23b6164f, var_e883a73e, var_794dcc13, var_c38c0668);
        if (!var_c38c0668) {
            level.var_e3e3a045 = 1;
            level thread function_60933945(var_23b6164f, var_e883a73e);
        }
    }
}

// Namespace orbit/namespace_8518c3a5
// Params 2, eflags: 0x2 linked
// Checksum 0x6b585ac, Offset: 0x7e0
// Size: 0x252
function function_60933945(*var_23b6164f, var_e883a73e) {
    self notify("1c5cba6ab532038f");
    self endon("1c5cba6ab532038f");
    level.players[0] endon(#"death");
    if (isdefined(var_e883a73e)) {
        level flag::wait_till(var_e883a73e);
    }
    if (!level.var_e3e3a045) {
        level.players[0] util::show_hint_text(#"hash_3a6e13fcecf344c9", 0, undefined, -1);
        level.players[0] waittill(#"hash_7a8828759fd65505", #"hash_7110d2bbe7758535");
        level.players[0] util::hide_hint_text();
        return;
    }
    while (!level.var_7228ded) {
        var_b3463e05 = struct::get_array("orbit_lz", "script_noteworthy");
        var_af6511a5 = arraygetclosest(level.var_7466d419.origin, var_b3463e05);
        if (isdefined(var_af6511a5) && distance2dsquared(level.var_7466d419.origin, var_af6511a5.origin) <= level.var_bce2f77 * level.var_bce2f77) {
            if (!level.var_883c5961) {
                level.players[0] util::show_hint_text(#"hash_3a6e13fcecf344c9", 0, undefined, -1);
                level.var_883c5961 = 1;
            }
        } else {
            level.players[0] util::hide_hint_text(0);
            level.var_883c5961 = 0;
        }
        waitframe(1);
    }
}

// Namespace orbit/namespace_8518c3a5
// Params 4, eflags: 0x0
// Checksum 0x62fe06b9, Offset: 0xa40
// Size: 0x236
function function_695367db(node, var_7812746a = 1, var_571baf02 = 128, var_a6334546 = 0) {
    self endon(#"death");
    self cleargoalyaw();
    self cleartargetyaw();
    self.var_cb55c804 = var_571baf02;
    self setneargoalnotifydist(self.var_cb55c804);
    self function_a57c34b7(node.origin, var_7812746a);
    self sethoverparams(0);
    self settargetyaw((0, node.angles[1], 0)[1]);
    self setgoalyaw((0, node.angles[1], 0)[1]);
    /#
        goalinfo = self function_4794d6a3();
    #/
    self waittill(#"goal", #"near_goal");
    if (var_7812746a && var_a6334546) {
        self function_a57c34b7(self.origin, 1, 1);
        self setvehvelocity((0, 0, 0));
        self setphysacceleration((0, 0, 0));
        self setangularvelocity((0, 0, 0));
        self.angles = node.angles;
    }
}

// Namespace orbit/namespace_8518c3a5
// Params 2, eflags: 0x2 linked
// Checksum 0x32d8aae9, Offset: 0xc80
// Size: 0x32c
function function_44e72b9e(var_e25c39ec = 0, start_node) {
    if (isdefined(level.var_6fb3a1e6)) {
        level.var_6fb3a1e6.origin = start_node.origin;
        level.var_6fb3a1e6.angles = start_node.angles;
        return;
    } else {
        level.var_6fb3a1e6 = spawnvehicle("vehicle_t9_mil_us_helicopter_large_cp_armada_player", start_node.origin, start_node.angles);
        level.var_6fb3a1e6.ignoreme = 1;
        level.var_6fb3a1e6 setcandamage(0);
        level.var_6fb3a1e6 setowner(level.players[0]);
        level.var_6fb3a1e6.owner = level.players[0];
        level.var_6fb3a1e6.soundmod = "heli";
        level.var_6fb3a1e6.targetname = "chopper";
        level.var_6fb3a1e6.team = #"allies";
        level.var_6fb3a1e6 setteam(#"allies");
        level.var_6fb3a1e6.target_offset = (0, 0, 0);
        target_set(level.var_6fb3a1e6, level.var_6fb3a1e6.target_offset);
        level.var_6fb3a1e6.var_54b19f55 = 1;
        level.var_6fb3a1e6 vehicle::toggle_tread_fx(1);
        level.var_6fb3a1e6 vehicle::toggle_exhaust_fx(1);
        level.var_6fb3a1e6 vehicle::toggle_sounds(1);
        level.var_6fb3a1e6 setrotorspeed(1);
        level.var_6fb3a1e6 vehicle::lights_on();
    }
    if (var_e25c39ec === 1) {
        waitframe(1);
        level.var_6fb3a1e6 makevehicleusable();
        level.var_6fb3a1e6 usevehicle(level.players[0], 1);
        /#
            thread util::function_eeb6bf9c("<unknown string>", "<unknown string>", "<unknown string>", undefined, 5);
        #/
    }
    waitframe(1);
    level.var_6fb3a1e6 makevehicleunusable();
}

// Namespace orbit/namespace_8518c3a5
// Params 1, eflags: 0x2 linked
// Checksum 0x37c35a72, Offset: 0xfb8
// Size: 0x334
function function_76a96530(start_node) {
    var_59291c74 = [];
    index = 0;
    var_747be2ea = 0;
    var_3540205d = 0;
    current_node = start_node;
    while (true) {
        var_59291c74[index] = current_node;
        check_node = current_node;
        if (isarray(check_node)) {
            check_node = current_node[0];
        }
        if (isdefined(check_node.target)) {
            target = getvehiclenode(check_node.target, "targetname");
            if (!isdefined(target)) {
                break;
            }
            if (target == start_node) {
                var_3540205d = 1;
                break;
            }
            current_node = target;
            index++;
            continue;
        }
        break;
    }
    if (!var_3540205d) {
        var_970a11fa = undefined;
        var_95f3bae6 = getvehiclenodearray(start_node.targetname, "target");
        foreach (node in var_95f3bae6) {
            if (node.targetname === "heli_idle_path") {
                continue;
            }
            var_970a11fa = node;
        }
        if (isdefined(var_970a11fa)) {
            next_node = var_970a11fa;
            while (true) {
                current_node = next_node;
                arrayinsert(var_59291c74, current_node, 0);
                var_747be2ea++;
                if (isdefined(current_node.targetname)) {
                    if (current_node.targetname == "orbit_end_node") {
                        break;
                    }
                    next_node = getvehiclenode(current_node.targetname, "target");
                    if (!isdefined(next_node)) {
                        break;
                    }
                    continue;
                }
                break;
            }
        }
    }
    /#
        if (var_3540205d) {
            iprintln("<unknown string>" + var_59291c74.size);
        } else {
            iprintln("<unknown string>" + var_59291c74.size);
        }
    #/
    level.var_a5a07145 = var_59291c74;
    level.var_cd6991fa = 0 + var_747be2ea;
    level.var_e3b1e2dc = 0;
    level.var_34599e02 = var_59291c74.size - 1;
    level.var_d6cb97e = var_3540205d;
}

// Namespace orbit/namespace_8518c3a5
// Params 0, eflags: 0x0
// Checksum 0x17162539, Offset: 0x12f8
// Size: 0xd0
function function_8b5ce49a() {
    level.players[0] endon(#"death", #"hash_7a8828759fd65505", #"hash_7110d2bbe7758535");
    self notify("5c179faf816d1187");
    self endon("5c179faf816d1187");
    while (true) {
        self waittill(#"hash_7f36e5b3acf5108e");
        self sethoverparams(75, 100, 50);
        self waittill(#"hash_13aff812c3414fc4");
        self sethoverparams(0);
    }
}

// Namespace orbit/namespace_8518c3a5
// Params 0, eflags: 0x2 linked
// Checksum 0x7a24a652, Offset: 0x13d0
// Size: 0x9c8
function function_d9bd5da4() {
    player = level.players[0];
    chopper = level.var_7466d419;
    chopper endon(#"death");
    player endon(#"death", #"hash_7110d2bbe7758535");
    level endon(#"hash_531abcac11f4c6b7");
    chopper.var_cfc7d95a = 1;
    chopper.var_7bd4891b = 400;
    chopper.var_66016ac4 = level.var_cd6991fa;
    chopper.var_e998ed14 = chopper.var_66016ac4 + 1;
    chopper.var_13670677 = 1;
    chopper.var_70f7f4d4 = 0;
    chopper.var_d12cde3c = 20;
    chopper.var_82051958 = 1;
    chopper.var_bc484af = (0, 0, 0);
    chopper.var_7929f913 = (0, 0, 0);
    var_3f21ab87 = -50;
    var_34c7b2f3 = 50;
    level.var_288d6225 = 1;
    chopper setspeed(40, 1000, 33);
    chopper setyawspeed(75, 45, 45);
    chopper vehicle::set_goal_pos(level.var_a5a07145[0].origin + (level.var_a5a07145[1].origin - level.var_a5a07145[0].origin) / 2.5, 1);
    while (level.var_288d6225) {
        var_babdf1a9 = function_b7ead280();
        cameraaxis = anglestoaxis(player getplayerangles());
        var_7617eec7 = vectornormalize(cameraaxis.forward * var_babdf1a9[0] - cameraaxis.right * var_babdf1a9[1]);
        var_7c12791f = 0;
        var_bcb27448 = 0;
        if (chopper.var_66016ac4 > chopper.var_e998ed14) {
            var_7c12791f = chopper.var_e998ed14;
            var_bcb27448 = chopper.var_66016ac4;
        } else {
            var_7c12791f = chopper.var_66016ac4;
            var_bcb27448 = chopper.var_e998ed14;
        }
        if (var_bcb27448 == level.var_a5a07145.size - 1 && var_7c12791f == 0) {
            var_bcb27448 = 0;
            var_7c12791f = level.var_a5a07145.size - 1;
        }
        var_7f0b913e = vectornormalize(level.var_a5a07145[var_7c12791f].origin - level.var_a5a07145[var_bcb27448].origin);
        var_2e35e6c1 = (0, vectordot(var_7f0b913e, var_7617eec7), 0);
        if (abs(var_2e35e6c1[1]) > abs(chopper.var_bc484af[1])) {
            var_2e35e6c1 = lerpvector(chopper.var_bc484af, var_2e35e6c1, 0.1);
            chopper.var_bc484af = var_2e35e6c1;
            chopper.var_7929f913 = var_babdf1a9;
        } else if (lengthsquared(var_babdf1a9 - chopper.var_7929f913) >= 0.01) {
            chopper.var_bc484af = var_2e35e6c1;
            chopper.var_7929f913 = var_babdf1a9;
        } else {
            var_2e35e6c1 = chopper.var_bc484af;
        }
        chopper setyawspeed(75, 45, 45);
        chopper cleargoalyaw();
        chopper cleartargetyaw();
        var_e51c4560 = var_2e35e6c1[1];
        if (var_e51c4560 < 0) {
            chopper.var_cfc7d95a = 1;
        } else if (var_e51c4560 > 0) {
            chopper.var_cfc7d95a = -1;
        }
        if (var_e51c4560 != 0) {
            if (chopper.var_cfc7d95a != chopper.var_13670677) {
                chopper.var_66016ac4 = chopper.var_e998ed14;
            }
            chopper.var_13670677 = chopper.var_cfc7d95a;
        }
        var_2a900db9 = level.var_a5a07145[chopper.var_66016ac4];
        var_93b51755 = level.var_a5a07145[chopper.var_e998ed14];
        var_23ebc694 = var_2a900db9.origin - var_93b51755.origin;
        var_1403f864 = vectornormalize(var_23ebc694);
        var_328f28c8 = chopper.origin - var_93b51755.origin;
        var_434b5786 = vectordot(var_328f28c8, var_1403f864);
        var_a3cbce30 = var_434b5786 - abs(var_2e35e6c1[1]) * chopper.var_7bd4891b;
        if (var_a3cbce30 < 0 && chopper.var_cfc7d95a != 0) {
            chopper.var_66016ac4 = chopper.var_e998ed14;
            chopper function_c87f2d48();
            waitframe(1);
            continue;
        }
        var_46be5232 = vectordot(var_23ebc694, var_1403f864);
        var_e0d335ff = 1;
        if (var_46be5232 > 0) {
            var_e0d335ff = var_434b5786 / var_46be5232;
        }
        if (var_e0d335ff < 0) {
            var_e0d335ff = 0;
        }
        if (var_e0d335ff > 1) {
            var_e0d335ff = 1;
        }
        target_point = var_93b51755.origin + vectorscale(var_1403f864, var_a3cbce30) + (0, 0, chopper.var_70f7f4d4);
        var_1042ef32 = function_1197e96e(var_2a900db9.angles, var_93b51755.angles, var_e0d335ff);
        if (var_2e35e6c1[0] != 0 || var_2e35e6c1[1] != 0) {
            if (chopper.var_82051958 != 1) {
                chopper.var_82051958 = 1;
                chopper notify(#"hash_13aff812c3414fc4");
            }
            chopper setmaxpitchroll(30, 40);
            if (chopper.var_cfc7d95a == 1) {
                chopper setspeed(50, 40, 100);
            } else {
                chopper setspeed(50, 30, 100);
            }
            chopper setyawspeed(75, 45, 45);
            chopper vehicle::set_goal_pos(target_point, 1);
        } else if (chopper.var_82051958 != 0) {
            chopper.var_82051958 = 0;
            chopper notify(#"hash_7f36e5b3acf5108e");
            chopper thread function_3028905b();
        }
        if (var_2e35e6c1[1] > 0) {
            var_132b303 = 10;
            chopper settargetyaw((0, var_1042ef32[1], 0)[1] - var_132b303);
            chopper setgoalyaw((0, var_1042ef32[1], 0)[1] - var_132b303);
        } else {
            chopper settargetyaw((0, var_1042ef32[1], 0)[1]);
            chopper setgoalyaw((0, var_1042ef32[1], 0)[1]);
        }
        wait(0.05);
    }
}

// Namespace orbit/namespace_8518c3a5
// Params 0, eflags: 0x2 linked
// Checksum 0xda55839b, Offset: 0x1da0
// Size: 0x348
function function_3028905b() {
    player = level.players[0];
    chopper = level.var_7466d419;
    chopper endon(#"death", #"hash_13aff812c3414fc4");
    player endon(#"death", #"hash_7110d2bbe7758535");
    level endon(#"hash_531abcac11f4c6b7");
    chopper waittill(#"goal");
    var_b6e34907 = chopper.origin[2];
    var_ff21af1 = 1;
    var_c9250ee0 = (0, 0, 0);
    while (true) {
        if (player adsbuttonpressed()) {
            var_ff21af1 = 0.5;
        } else {
            var_ff21af1 = 1;
        }
        var_2a900db9 = level.var_a5a07145[chopper.var_66016ac4];
        var_93b51755 = level.var_a5a07145[chopper.var_e998ed14];
        var_23ebc694 = var_2a900db9.origin - var_93b51755.origin;
        var_1403f864 = vectornormalize(var_23ebc694);
        target_point = chopper.origin - var_c9250ee0;
        target_point += vectorscale(var_1403f864, randomfloatrange(-150, 150) * var_ff21af1);
        var_b1b75f05 = vectorscale(perpendicularvector(var_1403f864), randomfloatrange(-40, 40) * var_ff21af1);
        var_c9250ee0 = var_b1b75f05;
        target_point += var_b1b75f05;
        target_point = (target_point[0], target_point[1], var_b6e34907);
        target_point += (0, 0, randomfloatrange(-40, 40) * var_ff21af1);
        chopper setyawspeed(75, 45, 45);
        chopper setspeed(randomfloatrange(5, 15) * var_ff21af1, 5, 5);
        chopper setmaxpitchroll(5, 5);
        chopper vehicle::set_goal_pos(target_point, 1);
        wait(randomfloatrange(1, 2));
    }
}

// Namespace orbit/namespace_8518c3a5
// Params 4, eflags: 0x2 linked
// Checksum 0xd6daaabb, Offset: 0x20f0
// Size: 0x7ac
function function_5f7a4f66(var_23b6164f, var_e883a73e, var_794dcc13 = 0, var_c38c0668 = 0) {
    player = level.players[0];
    chopper = level.var_7466d419;
    chopper endon(#"death");
    player endon(#"death", #"hash_7110d2bbe7758535");
    if (isdefined(var_e883a73e)) {
        level flag::wait_till(var_e883a73e);
    }
    if (!var_c38c0668) {
        if (!level.var_e3e3a045) {
            player waittill(#"hash_7a8828759fd65505");
        } else {
            while (true) {
                player waittill(#"hash_7a8828759fd65505");
                var_b3463e05 = struct::get_array("orbit_lz", "script_noteworthy");
                var_af6511a5 = arraygetclosest(chopper.origin, var_b3463e05);
                if (distance2dsquared(chopper.origin, var_af6511a5.origin) <= level.var_bce2f77 * level.var_bce2f77) {
                    chopper.var_d14539c5 = var_af6511a5;
                    level.var_7228ded = 1;
                    break;
                }
            }
        }
    }
    if (!level.var_e3e3a045) {
        closest_node = arraygetclosest(chopper.origin, level.var_a5a07145);
        if (isdefined(closest_node) && isdefined(closest_node.linkto)) {
            chopper.var_d14539c5 = struct::get(closest_node.linkto, "linkname");
        } else {
            var_b3463e05 = struct::get_array("orbit_lz", "script_noteworthy");
            if (isdefined(var_b3463e05) && var_b3463e05.size > 0) {
                var_af6511a5 = arraygetclosest(chopper.origin, var_b3463e05);
                chopper.var_d14539c5 = var_af6511a5;
            }
        }
    }
    if (isdefined(chopper.var_d14539c5.targetname)) {
        if (issubstr(chopper.var_d14539c5.targetname, "mortar")) {
            level.var_86e3ed67 = chopper.var_d14539c5;
        } else if (issubstr(chopper.var_d14539c5.targetname, "bamboo")) {
            level.var_b3464ee0 = chopper.var_d14539c5;
        }
    }
    level notify(#"hash_741ad48d20200e90");
    level flag::set("flag_orbit_chopper_landing_requested");
    var_da00db64 = undefined;
    if (isdefined(chopper.var_d14539c5) && !var_794dcc13) {
        var_5c10784b = (chopper.var_d14539c5.origin[0], chopper.var_d14539c5.origin[1], chopper.var_d14539c5.origin[2] + 600);
        var_da00db64 = var_5c10784b;
        chopper setspeed(100, 50, 75);
        chopper function_a57c34b7(var_5c10784b, 1);
        chopper sethoverparams(0);
        chopper settargetyaw((0, chopper.var_d14539c5.angles[1], 0)[1]);
        chopper setgoalyaw((0, chopper.var_d14539c5.angles[1], 0)[1]);
        chopper.var_cb55c804 = 512;
        chopper setneargoalnotifydist(chopper.var_cb55c804);
        chopper waittill(#"near_goal");
        chopper notify(#"hash_1013f39d69698b32");
        chopper waittill(#"goal");
    }
    waitframe(1);
    chopper notify(#"hash_24a931ae3e04f89f");
    level flag::set("flag_mortar_orbit_rappel_start");
    if (is_true(var_23b6164f)) {
        chopper function_adf2ea57();
    } else {
        chopper function_4db7a747();
    }
    chopper notify(#"hash_453fb835819dfcc2");
    if (isdefined(chopper.var_d14539c5.targetname)) {
        if (issubstr(chopper.var_d14539c5.targetname, "mortar")) {
            level flag::set("flag_orbit_mortar_player_on_ground");
        } else if (issubstr(chopper.var_d14539c5.targetname, "bamboo")) {
            level flag::set("flag_orbit_bamboo_player_on_ground");
        }
    }
    if (!is_true(var_23b6164f) && isdefined(var_da00db64)) {
        chopper cleargoalyaw();
        chopper function_d4c687c9();
        chopper.var_cb55c804 = 128;
        chopper setneargoalnotifydist(chopper.var_cb55c804);
        chopper function_a57c34b7(var_da00db64, 1);
        chopper flag::set("flag_orbit_chopper_ascending");
        waitresult = chopper waittill(#"goal", #"near_goal");
        chopper flag::clear("flag_orbit_chopper_ascending");
    }
    level flag::set("flag_orbit_chopper_complete");
}

// Namespace orbit/namespace_8518c3a5
// Params 0, eflags: 0x2 linked
// Checksum 0x3de9a45f, Offset: 0x28a8
// Size: 0x244
function function_adf2ea57() {
    self makevehicleusable();
    var_d2c4ed4b = self getoccupantseat(level.players[0]);
    self usevehicle(level.players[0], var_d2c4ed4b);
    if (level flag::get("flag_player_chopper_screenshake_active")) {
        level flag::clear("flag_player_chopper_screenshake_active");
    }
    self makevehicleunusable();
    var_ee107610 = "tag_fastrope_ri";
    start_origin = self gettagorigin("tag_fastrope_ri");
    start_angles = self gettagangles("tag_fastrope_ri");
    var_f7317c23 = start_origin;
    var_c0ec2d07 = groundtrace(var_f7317c23, start_origin + (0, 0, -10000), 0, self);
    var_7eee2432 = var_c0ec2d07[#"position"];
    var_6402a3dd = util::spawn_model("tag_origin", var_f7317c23, start_angles);
    level.players[0] playerlinktodelta(var_6402a3dd, "tag_origin", 1, 45, 45, 45, 45);
    time = 3;
    var_6402a3dd moveto(var_7eee2432, time);
    wait(time);
    level.players[0] unlink();
}

// Namespace orbit/namespace_8518c3a5
// Params 0, eflags: 0x2 linked
// Checksum 0x91b15c12, Offset: 0x2af8
// Size: 0x2bc
function function_4db7a747() {
    var_da00db64 = self.origin;
    var_22043f8e = groundtrace(self.origin + (0, 0, -8), self.origin + (0, 0, -100000), 0, self);
    goal_pos = var_22043f8e[#"position"] + (0, 0, 90);
    self cleargoalyaw();
    self function_d4c687c9();
    self.var_cb55c804 = 10;
    self setneargoalnotifydist(self.var_cb55c804);
    self sethoverparams(0);
    self setgoalyaw((0, self.angles[1], 0)[1]);
    self settargetyaw((0, self.angles[1], 0)[1]);
    self function_a57c34b7(goal_pos, 1);
    waitresult = self waittill(#"goal", #"near_goal");
    level.players[0] enableweapons();
    self makevehicleusable();
    var_d2c4ed4b = self getoccupantseat(level.players[0]);
    self usevehicle(level.players[0], var_d2c4ed4b);
    if (level flag::get("flag_player_chopper_screenshake_active")) {
        level flag::clear("flag_player_chopper_screenshake_active");
    }
    self makevehicleunusable();
    self setseatoccupied(var_d2c4ed4b, 1);
}

// Namespace orbit/namespace_8518c3a5
// Params 1, eflags: 0x2 linked
// Checksum 0x6c29577f, Offset: 0x2dc0
// Size: 0x126
function function_7eb6aae3(var_e883a73e) {
    self endon(#"death");
    level.players[0] endon(#"death", #"hash_7110d2bbe7758535");
    level endon(#"hash_2176690674070a2a");
    self notify("7104423a6d22affd");
    self endon("7104423a6d22affd");
    if (isdefined(var_e883a73e)) {
        level flag::wait_till(var_e883a73e);
    }
    while (true) {
        timeused = 0;
        while (level.players[0] actionslottwobuttonpressed()) {
            timeused += 0.05;
            if (timeused > 0.5) {
                level.players[0] notify(#"hash_7a8828759fd65505");
            }
            waitframe(1);
        }
        waitframe(1);
    }
}

// Namespace orbit/namespace_8518c3a5
// Params 3, eflags: 0x2 linked
// Checksum 0x4dd1cd94, Offset: 0x2ef0
// Size: 0x6a
function function_1197e96e(to, from, scale) {
    delta = function_529c71d2(to - from);
    angles = function_529c71d2(from + delta * scale);
    return angles;
}

// Namespace orbit/namespace_8518c3a5
// Params 1, eflags: 0x2 linked
// Checksum 0xcbe03a42, Offset: 0x2f68
// Size: 0xc6
function function_529c71d2(angles) {
    ang = [];
    for (i = 0; i < 3; i++) {
        ang[i] = angles[i];
        while (ang[i] > 180) {
            ang[i] = ang[i] - 360;
        }
        while (ang[i] <= -180) {
            ang[i] = ang[i] + 360;
        }
    }
    var_de7b219f = (ang[0], ang[1], ang[2]);
    return var_de7b219f;
}

// Namespace orbit/namespace_8518c3a5
// Params 0, eflags: 0x2 linked
// Checksum 0x74182158, Offset: 0x3038
// Size: 0xd4
function function_c87f2d48() {
    chopper = self;
    next_index = chopper.var_66016ac4 + chopper.var_cfc7d95a;
    if (next_index < 0) {
        if (level.var_d6cb97e) {
            next_index = level.var_a5a07145.size - 1;
        } else {
            next_index = 0;
        }
    }
    if (next_index > level.var_34599e02) {
        if (level.var_d6cb97e) {
            next_index = level.var_e3b1e2dc;
        } else {
            next_index = level.var_34599e02;
        }
    }
    chopper.var_e998ed14 = next_index;
    /#
        iprintln("<unknown string>" + chopper.var_e998ed14);
    #/
}

// Namespace orbit/namespace_8518c3a5
// Params 0, eflags: 0x2 linked
// Checksum 0x63f2ce58, Offset: 0x3118
// Size: 0xc0
function function_b7ead280() {
    var_e51c4560 = level.players[0] getnormalizedmovement();
    var_7ec086d8 = var_e51c4560[0];
    if (abs(var_7ec086d8) < 0.1) {
        var_7ec086d8 = 0;
    }
    var_8c882267 = var_e51c4560[1];
    if (abs(var_8c882267) < 0.1) {
        var_8c882267 = 0;
    }
    var_e51c4560 = (var_7ec086d8, var_8c882267, var_e51c4560[2]);
    return var_e51c4560;
}

// Namespace orbit/namespace_8518c3a5
// Params 0, eflags: 0x2 linked
// Checksum 0xb2ea1b87, Offset: 0x31e0
// Size: 0xc0
function function_5cf12924() {
    var_1b8c8f22 = level.players[0] getnormalizedcameramovement();
    var_7ec086d8 = var_1b8c8f22[0];
    if (abs(var_7ec086d8) < 0.1) {
        var_7ec086d8 = 0;
    }
    var_8c882267 = var_1b8c8f22[1];
    if (abs(var_8c882267) < 0.1) {
        var_8c882267 = 0;
    }
    var_1b8c8f22 = (var_7ec086d8, var_8c882267, var_1b8c8f22[2]);
    return var_1b8c8f22;
}

// Namespace orbit/namespace_8518c3a5
// Params 2, eflags: 0x0
// Checksum 0x252d8862, Offset: 0x32a8
// Size: 0x5a
function spawn_tag_origin(origin = self.origin, angles = self.angles) {
    return util::spawn_model("tag_origin", origin, angles);
}

