// Atian COD Tools GSC CW decompiler test
#using scripts\killstreaks\planemortar_shared.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\killstreak_hacking.gsc;
#using scripts\killstreaks\airsupport.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using script_4721de209091b1a6;
#using scripts\core_common\util_shared.gsc;
#using scripts\weapons\heatseekingmissile.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;

#namespace artillery_barrage;

// Namespace artillery_barrage/artillery_barrage_shared
// Params 0, eflags: 0x0
// Checksum 0xa0e5e8f3, Offset: 0x250
// Size: 0x4a
function init_shared() {
    if (!isdefined(level.var_1e3747c0)) {
        level.var_1e3747c0 = {};
        airsupport::init_shared();
        level.var_f90a2fa = undefined;
        level.var_dfa42e41 = undefined;
    }
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 0, eflags: 0x0
// Checksum 0x5c07f555, Offset: 0x2a8
// Size: 0xf0
function function_5fd995a8() {
    if (self killstreakrules::iskillstreakallowed("artillery_barrage", self.team) == 0) {
        return 0;
    }
    result = self function_6f7927c();
    killstreak_used = result === 1;
    if (killstreak_used && isdefined(self)) {
        bundle = level.killstreaks[#"artillery_barrage"].script_bundle;
        var_fa9aff9a = self gadgetgetslot(bundle.ksweapon);
        self gadgetpowerset(var_fa9aff9a, 0);
    }
    return killstreak_used;
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 0, eflags: 0x0
// Checksum 0xcdb7be68, Offset: 0x3a0
// Size: 0x24
function function_aa4be620() {
    self beginlocationartilleryselection("map_directional_selector");
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 0, eflags: 0x0
// Checksum 0xaee6082f, Offset: 0x3d0
// Size: 0x1ba
function function_6f7927c() {
    params = killstreaks::get_script_bundle("artillery_barrage");
    self airsupport::function_9e2054b0(&function_aa4be620);
    locations = [];
    if (is_true(params.var_7436c1c5) && !is_true(self.pers[#"hash_3b8a938c10ba768b"])) {
        self thread airsupport::singleradarsweep();
    }
    location = self airsupport::waitforlocationselection();
    if (!isdefined(self)) {
        return 0;
    }
    if (!isdefined(location.origin)) {
        self.pers[#"hash_3b8a938c10ba768b"] = 1;
        self notify(#"cancel_selection");
        return 0;
    }
    if (self killstreakrules::iskillstreakallowed("artillery_barrage", self.team) == 0) {
        self.pers[#"hash_3b8a938c10ba768b"] = 1;
        self notify(#"cancel_selection");
        return 0;
    }
    self.pers[#"hash_3b8a938c10ba768b"] = 0;
    return self airsupport::function_83904681(location, &function_d7cf7d18, "artillery_barrage");
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 3, eflags: 0x0
// Checksum 0x3a565528, Offset: 0x598
// Size: 0xc0
function function_d7cf7d18(location, killstreak_id, *killstreaktype) {
    team = self.team;
    spawn_influencer = level influencers::create_enemy_influencer("artillery", killstreak_id.origin, team);
    self thread watchforkillstreakend(team, spawn_influencer, killstreaktype);
    yaw = killstreak_id.yaw;
    self thread function_496d0824(killstreak_id.origin, killstreak_id.yaw, team, killstreaktype);
    return true;
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 3, eflags: 0x0
// Checksum 0xffeba05f, Offset: 0x660
// Size: 0x94
function watchforkillstreakend(team, *influencer, killstreak_id) {
    self waittill(#"disconnect", #"joined_team", #"joined_spectators", #"hash_6a70219902316c7e", #"emp_jammed");
    killstreakrules::killstreakstop("artillery_barrage", influencer, killstreak_id);
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 1, eflags: 0x0
// Checksum 0x92717952, Offset: 0x700
// Size: 0x6c
function getplaneflyheight(bundle) {
    return killstreaks::function_43f4782d() + (isdefined(bundle.var_d4f45bfd) ? bundle.var_d4f45bfd : 0) + randomint(isdefined(bundle.var_f7478ae6) ? bundle.var_f7478ae6 : 1);
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 4, eflags: 0x0
// Checksum 0x5b646475, Offset: 0x778
// Size: 0x548
function function_496d0824(var_3bc2d545, var_e8456387, team, killstreak_id) {
    owner = self;
    owner endon(#"emp_jammed", #"joined_team", #"joined_spectators", #"disconnect");
    bundle = level.killstreaks[#"artillery_barrage"].script_bundle;
    var_6c36c4dd = bundle.var_e077ecb;
    var_9bed4193 = bundle.var_32e69cad;
    var_66e0652a = 26000;
    height = getplaneflyheight(bundle);
    plane_start = (level.mapcenter[0], level.mapcenter[1], height);
    var_dca1c8d4 = self getteamcenter(self.team);
    var_d1769adf = vectornormalize((var_dca1c8d4[0], var_dca1c8d4[1], height) - (level.mapcenter[0], level.mapcenter[1], height));
    var_675219e7 = (level.mapcenter[0], level.mapcenter[1], height) + vectorscale(var_d1769adf, var_9bed4193);
    var_aff95821 = vectorcross((0, 0, 1), var_d1769adf);
    plane_start = var_675219e7 - vectorscale(var_aff95821, var_6c36c4dd);
    var_f348056 = var_675219e7 + vectorscale(var_aff95821, var_66e0652a);
    var_fe427c32 = vectortoangles(var_aff95821);
    if (isdefined(bundle.var_c28c2429)) {
        var_fe427c32 = (var_fe427c32[0], var_fe427c32[1], bundle.var_c28c2429 * 0.75);
    }
    plane = spawnvehicle(bundle.var_f8ca3420, plane_start, var_fe427c32);
    plane setowner(owner);
    plane notsolid();
    plane killstreaks::configure_team("artillery_barrage", killstreak_id, owner, undefined, undefined, &configurechopperteampost);
    plane killstreak_hacking::enable_hacking("artillery_barrage");
    plane endon(#"hash_1fe75f940ce5fd52");
    var_1313ba73 = bundle.var_540b2ab4;
    plane.var_61e3ab9c = var_1313ba73 * 2;
    plane.var_7d573472 = var_1313ba73 * 2;
    plane setspeedimmediate(var_1313ba73, plane.var_61e3ab9c, plane.var_7d573472);
    target_set(plane, (0, 0, 100));
    plane solid();
    plane killstreaks::function_2b6aa9e8("artillery_barrage", &function_cc147a03, &function_c0f8c056);
    plane thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile(bundle, "crashing", "death");
    plane thread function_6cd200d2();
    plane thread watchgameended();
    owner thread function_598dc586(plane, var_3bc2d545, var_e8456387, team, killstreak_id, height);
    owner childthread function_a9ef6d5d(plane, var_675219e7, var_aff95821, var_d1769adf);
    plane.var_f348056 = var_f348056;
    plane.var_493a2839 = var_aff95821;
    plane.var_66e0652a = var_66e0652a;
    plane thread function_6fb32e6d();
    owner waittill(#"hash_6a70219902316c7e");
    wait(1.5);
    if (function_1f3792ee(plane)) {
        plane notify(#"hash_1fe75f940ce5fd52", {#is_killed:0});
    }
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 0, eflags: 0x0
// Checksum 0xa42be7f3, Offset: 0xcc8
// Size: 0xac
function function_6fb32e6d() {
    plane = self;
    wait(0.5);
    if (function_1f3792ee(plane)) {
        bundle = level.killstreaks[#"artillery_barrage"].script_bundle;
        playfxontag(bundle.var_61feee4, plane, "tag_fx_engine2");
        playfxontag(bundle.var_61feee4, plane, "tag_fx_engine5");
    }
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 1, eflags: 0x0
// Checksum 0xc0992daa, Offset: 0xd80
// Size: 0x12a
function getteamcenter(team) {
    if (!isdefined(team)) {
        return self.origin;
    }
    teamplayers = getplayers(team);
    totalaliveplayers = 0;
    var_f44bf438 = (0, 0, 0);
    foreach (teammate in teamplayers) {
        if (!isdefined(teammate)) {
            continue;
        }
        if (!isalive(teammate)) {
            continue;
        }
        var_f44bf438 += teammate.origin;
        totalaliveplayers++;
    }
    if (totalaliveplayers == 0) {
        return self.origin;
    }
    return vectorscale(var_f44bf438, 1 / totalaliveplayers);
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 0, eflags: 0x0
// Checksum 0xe2e3c5e3, Offset: 0xeb8
// Size: 0x124
function function_4b1354ff() {
    plane = self;
    if (plane.isleaving === 1) {
        return;
    }
    plane.isleaving = 1;
    var_fc8999ee = 10;
    planedir = anglestoforward(plane.angles);
    var_6fe4cf51 = 30000;
    var_15f570c1 = plane.origin + vectorscale(planedir, 30000);
    plane setplanegoalpos(var_15f570c1, var_15f570c1 + vectorscale(planedir, 300));
    plane setspeed(0.0568182 * var_6fe4cf51 / var_fc8999ee, 100);
    plane setneargoalnotifydist(100);
    plane waittill(#"curve_end");
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 4, eflags: 0x0
// Checksum 0x3a6c5653, Offset: 0xfe8
// Size: 0x9a0
function function_a9ef6d5d(plane, var_675219e7, var_aff95821, var_d1769adf) {
    owner = self;
    owner endon(#"hash_6a70219902316c7e");
    plane endon(#"death");
    bundle = level.killstreaks[#"artillery_barrage"].script_bundle;
    if (isdefined(bundle.var_c28c2429)) {
        plane setplanebarrelroll(bundle.var_c28c2429 / 360, 25, 1);
    }
    var_f460c99e = [];
    var_219e510 = [];
    var_1330ab2b = bundle.var_533663fb * 2;
    var_c23fc1e3 = var_1330ab2b * bundle.var_31cddd6;
    var_e41f7c67 = var_1330ab2b * 0.5;
    var_15b62717 = var_c23fc1e3 * 0.5;
    var_368f3731 = 15 + 30 / bundle.var_31cddd6;
    var_8a172643 = var_e41f7c67 * sin(var_368f3731);
    var_a4c5b0ed = var_15b62717 * cos(var_368f3731);
    var_e3c75fef = 15 + 15 / bundle.var_31cddd6;
    var_a8afe3e3 = var_e41f7c67 * sin(var_e3c75fef);
    var_cb3c02d3 = var_15b62717 * cos(var_e3c75fef);
    var_61cc72b5 = 60;
    var_aa3875fe = var_e41f7c67 * sin(var_61cc72b5);
    var_8be5e7a8 = var_15b62717 * cos(var_61cc72b5);
    if (!isdefined(var_f460c99e)) {
        var_f460c99e = [];
    } else if (!isarray(var_f460c99e)) {
        var_f460c99e = array(var_f460c99e);
    }
    var_f460c99e[var_f460c99e.size] = var_675219e7 + vectorscale(var_aff95821, 50);
    if (!isdefined(var_f460c99e)) {
        var_f460c99e = [];
    } else if (!isarray(var_f460c99e)) {
        var_f460c99e = array(var_f460c99e);
    }
    var_f460c99e[var_f460c99e.size] = var_675219e7 + vectorscale(var_aff95821, var_8be5e7a8) + vectorscale(var_d1769adf, var_e41f7c67 * -1 + var_aa3875fe);
    if (!isdefined(var_f460c99e)) {
        var_f460c99e = [];
    } else if (!isarray(var_f460c99e)) {
        var_f460c99e = array(var_f460c99e);
    }
    var_f460c99e[var_f460c99e.size] = var_675219e7 + vectorscale(var_aff95821, var_a4c5b0ed) + vectorscale(var_d1769adf, var_e41f7c67 * -1 + var_8a172643);
    if (!isdefined(var_f460c99e)) {
        var_f460c99e = [];
    } else if (!isarray(var_f460c99e)) {
        var_f460c99e = array(var_f460c99e);
    }
    var_f460c99e[var_f460c99e.size] = var_675219e7 + vectorscale(var_aff95821, var_cb3c02d3) + vectorscale(var_d1769adf, var_e41f7c67 * -1 + var_a8afe3e3);
    if (!isdefined(var_f460c99e)) {
        var_f460c99e = [];
    } else if (!isarray(var_f460c99e)) {
        var_f460c99e = array(var_f460c99e);
    }
    var_f460c99e[var_f460c99e.size] = var_675219e7 + vectorscale(var_aff95821, var_15b62717) + vectorscale(var_d1769adf, var_e41f7c67 * -1);
    if (!isdefined(var_f460c99e)) {
        var_f460c99e = [];
    } else if (!isarray(var_f460c99e)) {
        var_f460c99e = array(var_f460c99e);
    }
    var_f460c99e[var_f460c99e.size] = var_675219e7 + vectorscale(var_aff95821, var_cb3c02d3) + vectorscale(var_d1769adf, var_e41f7c67 * -1 - var_a8afe3e3);
    if (!isdefined(var_f460c99e)) {
        var_f460c99e = [];
    } else if (!isarray(var_f460c99e)) {
        var_f460c99e = array(var_f460c99e);
    }
    var_f460c99e[var_f460c99e.size] = var_675219e7 + vectorscale(var_aff95821, var_a4c5b0ed) + vectorscale(var_d1769adf, var_e41f7c67 * -1 - var_8a172643);
    if (!isdefined(var_219e510)) {
        var_219e510 = [];
    } else if (!isarray(var_219e510)) {
        var_219e510 = array(var_219e510);
    }
    var_219e510[var_219e510.size] = var_675219e7 + vectorscale(var_d1769adf, var_1330ab2b * -1);
    if (!isdefined(var_219e510)) {
        var_219e510 = [];
    } else if (!isarray(var_219e510)) {
        var_219e510 = array(var_219e510);
    }
    var_219e510[var_219e510.size] = var_675219e7 + vectorscale(var_aff95821, var_a4c5b0ed * -1) + vectorscale(var_d1769adf, var_e41f7c67 * -1 - var_8a172643);
    if (!isdefined(var_219e510)) {
        var_219e510 = [];
    } else if (!isarray(var_219e510)) {
        var_219e510 = array(var_219e510);
    }
    var_219e510[var_219e510.size] = var_675219e7 + vectorscale(var_aff95821, var_cb3c02d3 * -1) + vectorscale(var_d1769adf, var_e41f7c67 * -1 - var_a8afe3e3);
    if (!isdefined(var_219e510)) {
        var_219e510 = [];
    } else if (!isarray(var_219e510)) {
        var_219e510 = array(var_219e510);
    }
    var_219e510[var_219e510.size] = var_675219e7 + vectorscale(var_aff95821, var_15b62717 * -1) + vectorscale(var_d1769adf, var_e41f7c67 * -1);
    if (!isdefined(var_219e510)) {
        var_219e510 = [];
    } else if (!isarray(var_219e510)) {
        var_219e510 = array(var_219e510);
    }
    var_219e510[var_219e510.size] = var_675219e7 + vectorscale(var_aff95821, var_cb3c02d3 * -1) + vectorscale(var_d1769adf, var_e41f7c67 * -1 + var_a8afe3e3);
    if (!isdefined(var_219e510)) {
        var_219e510 = [];
    } else if (!isarray(var_219e510)) {
        var_219e510 = array(var_219e510);
    }
    var_219e510[var_219e510.size] = var_675219e7 + vectorscale(var_aff95821, var_a4c5b0ed * -1) + vectorscale(var_d1769adf, var_e41f7c67 * -1 + var_8a172643);
    if (!isdefined(var_219e510)) {
        var_219e510 = [];
    } else if (!isarray(var_219e510)) {
        var_219e510 = array(var_219e510);
    }
    var_219e510[var_219e510.size] = var_675219e7 + vectorscale(var_aff95821, var_8be5e7a8 * -1) + vectorscale(var_d1769adf, var_e41f7c67 * -1 + var_aa3875fe);
    /#
        function_8c164ce0(var_f460c99e);
    #/
    /#
        function_8c164ce0(var_219e510);
    #/
    var_1313ba73 = bundle.var_540b2ab4;
    plane setspeed(var_1313ba73, plane.var_61e3ab9c, plane.var_7d573472);
    while (function_1f3792ee(plane)) {
        plane setplanegoalpos(var_f460c99e, var_1313ba73);
        plane waittill(#"curve_end");
        plane setplanegoalpos(var_219e510, var_1313ba73);
        plane waittill(#"curve_end");
    }
}

/#

    // Namespace artillery_barrage/artillery_barrage_shared
    // Params 1, eflags: 0x0
    // Checksum 0x48a25af3, Offset: 0x1990
    // Size: 0x150
    function function_8c164ce0(path) {
        draw_path = getdvarint(#"hash_619e2bb393e45754", 0);
        if (draw_path == 0) {
            return;
        }
        var_11f31e2c = 0;
        radius = 100;
        alpha = 0.9;
        var_342eb58c = 2000;
        foreach (point in path) {
            if (!var_11f31e2c) {
                var_11f31e2c = 1;
                util::debug_sphere(point, radius, (0, 1, 0), alpha, var_342eb58c);
                continue;
            }
            util::debug_sphere(point, radius, (0, 0, 1), alpha, var_342eb58c);
        }
    }

#/

// Namespace artillery_barrage/artillery_barrage_shared
// Params 6, eflags: 0x0
// Checksum 0x6420b132, Offset: 0x1ae8
// Size: 0x920
function function_598dc586(plane, position, yaw, *team, killstreak_id, fly_height) {
    owner = self;
    owner endon(#"emp_jammed", #"joined_team", #"joined_spectators", #"disconnect");
    bundle = level.killstreaks[#"artillery_barrage"].script_bundle;
    var_37bb8781 = (0, team, 0);
    var_c6aa53c = anglestoforward(var_37bb8781);
    var_dc88ed1e = (yaw[0], yaw[1], fly_height);
    tracestartpos = (yaw[0], yaw[1], fly_height);
    traceendpos = (yaw[0], yaw[1], fly_height * -1);
    trace = bullettrace(tracestartpos, traceendpos, 0, undefined);
    targetpoint = trace[#"fraction"] > 1 ? (yaw[0], yaw[1], 0) : trace[#"position"];
    /#
        if (getdvarint(#"hash_bbfcab5c3429103", 0) > 0) {
            for (i = 0; i < 10; i++) {
                sphere(targetpoint + (0, 0, 50 * i), 20, (1, 0, 0), 1, 1, 10, 800);
            }
        }
    #/
    initialoffset = (0, 0, 0);
    if (isdefined(bundle.var_d784077a)) {
        wait(bundle.var_d784077a);
    }
    for (sweep = 0; sweep < bundle.var_b88f3e5a && function_1f3792ee(position); sweep++) {
        for (var_41c99c37 = 0; var_41c99c37 < bundle.var_b32c8349 && function_1f3792ee(position); var_41c99c37++) {
            startpoint = position.origin;
            var_47b0cb83 = vectornormalize(var_dc88ed1e - startpoint);
            var_aab835e2 = anglestoright(var_37bb8781);
            rightoffset = vectorscale(var_aab835e2, bundle.var_ed4e0bcc + util::function_a1281365(bundle.var_64e90954));
            leftoffset = vectorscale(var_aab835e2, bundle.var_ed4e0bcc * -1 + util::function_a1281365(bundle.var_64e90954));
            fire_right = vectorcross((0, 0, 1), var_47b0cb83);
            var_71d1c0cb = position gettagorigin("tag_gunner_flash2");
            var_8cdd6f66 = position gettagorigin("tag_gunner_flash1");
            playfxontag(bundle.var_cf763c03, position, "tag_gunner_flash2");
            playfxontag(bundle.var_cf763c03, position, "tag_gunner_flash1");
            var_5bbbb605 = targetpoint + initialoffset + rightoffset + vectorscale(var_c6aa53c, var_41c99c37 * bundle.var_f936eadc + util::function_a1281365(bundle.var_178f3ad6));
            var_3fddb9e8 = targetpoint + initialoffset + leftoffset + vectorscale(var_c6aa53c, var_41c99c37 * bundle.var_f936eadc + util::function_a1281365(bundle.var_178f3ad6));
            var_3e44dbbe = 1;
            if (var_3e44dbbe) {
                /#
                    if (getdvarint(#"hash_2d8cc6ef214202c9", 0) > 0) {
                        sphere(var_5bbbb605, 12, (0, 0, 1), 0.8, 1, 10, 120);
                        sphere(var_3fddb9e8, 12, (0, 0, 1), 0.8, 1, 10, 120);
                    }
                #/
                if (!ispointonnavmesh(var_5bbbb605)) {
                    var_e70ce280 = getclosestpointonnavmesh(var_5bbbb605, bundle.var_7135d43f);
                    if (isdefined(var_e70ce280)) {
                        var_5bbbb605 = var_e70ce280;
                    }
                }
                if (!ispointonnavmesh(var_3fddb9e8)) {
                    var_f69911a1 = getclosestpointonnavmesh(var_3fddb9e8, bundle.var_7135d43f);
                    if (isdefined(var_f69911a1)) {
                        var_3fddb9e8 = var_f69911a1;
                    }
                }
            }
            /#
                if (getdvarint(#"hash_2d8cc6ef214202c9", 0) > 0) {
                    sphere(var_5bbbb605, 20, (0, 1, 0), 0.9, 1, 10, 120);
                    sphere(var_3fddb9e8, 20, (0, 1, 0), 0.9, 1, 10, 120);
                }
            #/
            var_9bba3fcb = vectornormalize((var_5bbbb605[0], var_5bbbb605[1], startpoint[2]) - var_71d1c0cb);
            var_126a2ae4 = vectornormalize((var_3fddb9e8[0], var_3fddb9e8[1], startpoint[2]) - var_8cdd6f66);
            var_d8497bd7 = var_5bbbb605 - vectorscale(var_9bba3fcb, bundle.var_bd3080e0);
            var_d8497bd7 = (var_d8497bd7[0], var_d8497bd7[1], var_71d1c0cb[2]);
            var_6bd2a8a7 = var_3fddb9e8 - vectorscale(var_126a2ae4, bundle.var_bd3080e0);
            var_6bd2a8a7 = (var_6bd2a8a7[0], var_6bd2a8a7[1], var_8cdd6f66[2]);
            var_a1c7fa61 = vectortoangles(var_d8497bd7 - var_71d1c0cb);
            var_7575c35 = vectortoangles(var_6bd2a8a7 - var_8cdd6f66);
            self thread function_5a0d2864(var_71d1c0cb, var_d8497bd7, var_5bbbb605, var_a1c7fa61, self.team, killstreak_id);
            self thread function_5a0d2864(var_8cdd6f66, var_6bd2a8a7, var_3fddb9e8, var_7575c35, self.team, killstreak_id);
            position playsound(#"hash_3e7e330ab5fcdcd");
            wait(bundle.var_768e166a);
        }
        if (sweep + 1 < bundle.var_b88f3e5a && bundle.var_de725346 > 0 && function_1f3792ee(position)) {
            wait(bundle.var_de725346);
        }
    }
    wait(3);
    owner notify(#"hash_6a70219902316c7e");
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 1, eflags: 0x0
// Checksum 0xdedfee35, Offset: 0x2410
// Size: 0x3c
function function_1f3792ee(plane) {
    return isdefined(plane) && !isdefined(plane.destroyed) && !(plane.isleaving === 1);
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 6, eflags: 0x0
// Checksum 0x63f112e0, Offset: 0x2458
// Size: 0x66c
function function_5a0d2864(startpoint, endpoint, targetpoint, angles, team, killstreak_id) {
    bundle = killstreaks::get_script_bundle("artillery_barrage");
    shell = spawn("script_model", startpoint);
    shell.team = team;
    shell.targetname = "guided_artillery_shell";
    shell setowner(self);
    shell.owner = self;
    shell.owner thread watchownerevents(shell);
    shell killstreaks::configure_team("artillery_barrage", killstreak_id, self);
    shell killstreak_hacking::enable_hacking("artillery_barrage");
    target_set(shell);
    shell endon(#"delete", #"death");
    shell.angles = angles;
    shell setmodel(bundle.dronemodel);
    shell setenemymodel(bundle.var_152e037f);
    shell notsolid();
    playfxontag(bundle.var_f5fcd16f, shell, "tag_bomb_fx");
    shell clientfield::set("enemyvehicle", 1);
    shell killstreaks::function_2b6aa9e8("artillery_barrage", &function_8ebde515, undefined, &function_9b3c6309);
    shell thread watchforemp(self);
    var_c786830e = max(bundle.var_98a3d82c - 0.1, 0.1);
    var_c786830e = min(var_c786830e, 1.5);
    shell moveto(endpoint, bundle.var_98a3d82c, 0, var_c786830e);
    wait(bundle.var_98a3d82c * 0.5);
    velocity = shell getvelocity();
    wait(bundle.var_98a3d82c * 0.5);
    remainingdistance = distance2d(shell.origin, targetpoint);
    halfgravity = getdvarfloat(#"bg_gravity", 0) * 0.5;
    dxy = abs(remainingdistance);
    dz = endpoint[2] - targetpoint[2];
    droptime = sqrt(dz / halfgravity);
    dvxy = dxy / droptime;
    nvel = vectornormalize(velocity);
    launchvel = nvel * dvxy;
    bomb = self magicmissile(bundle.ksweapon, shell.origin, launchvel);
    target_set(bomb);
    bomb killstreaks::configure_team("artillery_barrage", killstreak_id, self);
    bomb killstreak_hacking::enable_hacking("artillery_barrage");
    shell notify(#"hackertool_update_ent", {#entity:bomb});
    bomb clientfield::set("enemyvehicle", 1);
    bomb.targetname = "guided_artillery_shell";
    bomb setowner(self);
    bomb.owner = self;
    bomb.team = team;
    var_23aaa2dd = max(droptime - 4, 2);
    bomb thread function_ae65820c(var_23aaa2dd);
    bomb killstreaks::function_2b6aa9e8("artillery_barrage", &function_8ebde515, undefined, &function_9b3c6309);
    bomb thread watchforemp(self);
    bomb thread watchforimpact(self);
    bomb.owner thread watchownerevents(bomb);
    if (isdefined(level.var_1e30ea6a)) {
        bomb.owner thread [[ level.var_1e30ea6a ]](bundle.ksweapon, bomb);
    }
    waitframe(1);
    shell hide();
    waitframe(1);
    shell delete();
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 1, eflags: 0x0
// Checksum 0xee5ef985, Offset: 0x2ad0
// Size: 0x3c
function function_ae65820c(delay) {
    wait(delay);
    if (isdefined(self)) {
        self playloopsound(#"hash_6e9ee0f0f9ecd8d7");
    }
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 2, eflags: 0x0
// Checksum 0xc92c95f1, Offset: 0x2b18
// Size: 0x18c
function function_8ebde515(attacker, weapon) {
    self endon(#"death");
    bundle = killstreaks::get_script_bundle("artillery_barrage");
    attacker = self [[ level.figure_out_attacker ]](attacker);
    if (isdefined(attacker) && (!isdefined(self.owner) || self.owner util::isenemyplayer(attacker))) {
        challenges::destroyedaircraft(attacker, weapon, 0);
        attacker challenges::addflyswatterstat(weapon, self);
        scoreevents::processscoreevent(bundle.var_ebd92bbc, attacker, self.owner, weapon);
    }
    if (isdefined(bundle.ksexplosionfx)) {
        playfxontag(bundle.ksexplosionfx, self, "tag_origin");
    }
    self setmodel(#"tag_origin");
    self stoploopsound();
    wait(0.5);
    self delete();
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 1, eflags: 0x0
// Checksum 0xc115913, Offset: 0x2cb0
// Size: 0x9c
function watchownerevents(bomb) {
    player = self;
    bomb endon(#"death");
    player waittill(#"disconnect", #"joined_team", #"joined_spectators");
    if (isdefined(isalive(bomb))) {
        bomb delete();
    }
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 1, eflags: 0x0
// Checksum 0xf26af95e, Offset: 0x2d58
// Size: 0x6c
function watchforemp(*owner) {
    self endon(#"delete", #"death");
    waitresult = self waittill(#"emp_deployed");
    function_9b3c6309(waitresult.attacker);
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 1, eflags: 0x0
// Checksum 0x235f5df2, Offset: 0x2dd0
// Size: 0x94
function watchforimpact(*owner) {
    if (!isdefined(level.var_dfa42e41)) {
        return;
    }
    s_info = spawnstruct();
    s_info.origin = self.origin;
    while (isalive(self)) {
        s_info.origin = self.origin;
        waitframe(1);
    }
    [[ level.var_dfa42e41 ]](s_info);
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 1, eflags: 0x0
// Checksum 0x580a615, Offset: 0x2e70
// Size: 0xc4
function function_9b3c6309(attacker) {
    if (isdefined(level.var_f90a2fa)) {
        thread [[ level.var_f90a2fa ]](attacker, self);
    }
    bundle = killstreaks::get_script_bundle("artillery_barrage");
    if (isdefined(self) && isdefined(bundle.ksexplosionfx)) {
        playfx(bundle.ksexplosionfx, self.origin);
    }
    self stoploopsound();
    wait(0.1);
    self delete();
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 2, eflags: 0x0
// Checksum 0x109d3ecd, Offset: 0x2f40
// Size: 0x164
function function_cc147a03(attacker, weapon) {
    plane = self;
    plane.destroyed = 1;
    if (isdefined(attacker) && (!isdefined(plane.owner) || plane.owner util::isenemyplayer(attacker))) {
        challenges::destroyedaircraft(attacker, weapon, 0);
        attacker challenges::addflyswatterstat(weapon, self);
        luinotifyevent(#"player_callout", 2, #"hash_5d32f6a46883ef3c", attacker.entnum);
        plane notify(#"hash_1fe75f940ce5fd52", {#is_killed:1});
    }
    if (plane.isleaving !== 1) {
        plane namespace_f9b02f80::play_pilot_dialog_on_owner("destroyed", "artillery_barrage");
        plane namespace_f9b02f80::play_destroyed_dialog_on_owner("artillery_barrage", self.killstreakid);
    }
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 2, eflags: 0x0
// Checksum 0xc6c4e4d1, Offset: 0x30b0
// Size: 0x64
function function_c0f8c056(*attacker, *weapon) {
    bundle = level.killstreaks[#"artillery_barrage"].script_bundle;
    playfxontag(bundle.var_328ce6e4, self, "tag_fx_engine3");
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 0, eflags: 0x0
// Checksum 0xe45bad5, Offset: 0x3120
// Size: 0x34c
function function_6cd200d2() {
    plane = self;
    waitresult = plane waittill(#"hash_1fe75f940ce5fd52");
    killed = waitresult.is_killed;
    if (target_istarget(plane)) {
        target_remove(plane);
    }
    if (killed) {
        wait(randomfloatrange(0.1, 0.2));
        plane function_62b8d1d7();
        plane function_ab90e44c();
        plane thread function_b27d956d();
        goalx = randomfloatrange(650, 700);
        goaly = randomfloatrange(650, 700);
        if (randomintrange(0, 2) > 0) {
            goalx *= -1;
        }
        if (randomintrange(0, 2) > 0) {
            goaly *= -1;
        }
        planedir = anglestoforward(plane.angles);
        plane setplanegoalpos(plane.origin + (goalx, goaly, randomfloatrange(600, 700) * -1) + vectorscale(planedir, 3500));
        var_8518e93e = randomfloatrange(3, 4);
        plane setplanebarrelroll(randomfloatrange(0.0833333, 0.111111), randomfloatrange(4, 5));
        plane_speed = plane getspeedmph();
        wait(0.7);
        plane setspeed(plane_speed * 1.5, 20);
        wait(var_8518e93e - 0.7);
        plane function_f6f579e3();
        wait(0.1);
        plane ghost();
        wait(0.5);
    } else {
        plane function_4b1354ff();
    }
    plane delete();
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 0, eflags: 0x0
// Checksum 0xfab54b6d, Offset: 0x3478
// Size: 0x7c
function function_62b8d1d7() {
    bundle = level.killstreaks[#"artillery_barrage"].script_bundle;
    playfxontag(bundle.var_545fa8c2, self, "tag_fx_engine4");
    self playsound(level.heli_sound[#"crash"]);
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 0, eflags: 0x0
// Checksum 0xe43f8cd0, Offset: 0x3500
// Size: 0x54
function function_ab90e44c() {
    bundle = level.killstreaks[#"artillery_barrage"].script_bundle;
    playfxontag(bundle.var_328ce6e4, self, "tag_fx_engine1");
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 0, eflags: 0x0
// Checksum 0x931e9284, Offset: 0x3560
// Size: 0x10c
function function_b27d956d() {
    bundle = level.killstreaks[#"artillery_barrage"].script_bundle;
    wait(randomfloatrange(0.2, 0.4));
    playfxontag(bundle.var_328ce6e4, self, "tag_fx_engine5");
    playfxontag(bundle.var_545fa8c2, self, "tag_fx_engine4");
    self playsound(level.heli_sound[#"crash"]);
    wait(randomfloatrange(0.2, 0.4));
    playfxontag(bundle.var_328ce6e4, self, "tag_fx_engine3");
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 0, eflags: 0x0
// Checksum 0xdda802ef, Offset: 0x3678
// Size: 0x7c
function function_f6f579e3() {
    bundle = level.killstreaks[#"artillery_barrage"].script_bundle;
    playfxontag(bundle.ksexplosionfx, self, "tag_body_animate");
    self playsound(level.heli_sound[#"crash"]);
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 2, eflags: 0x0
// Checksum 0x3f8bfc5d, Offset: 0x3700
// Size: 0x3c
function configurechopperteampost(owner, *ishacked) {
    plane = self;
    plane thread watchownerdisconnect(ishacked);
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 1, eflags: 0x0
// Checksum 0xb974e31a, Offset: 0x3748
// Size: 0xb0
function watchownerdisconnect(owner) {
    self notify("6f3761b474db4d1");
    self endon("6f3761b474db4d1");
    plane = self;
    plane endon(#"hash_1fe75f940ce5fd52");
    owner waittill(#"joined_team", #"disconnect", #"joined_spectators");
    plane notify(#"hash_1fe75f940ce5fd52", {#is_killed:0});
}

// Namespace artillery_barrage/artillery_barrage_shared
// Params 0, eflags: 0x0
// Checksum 0xad4829c2, Offset: 0x3800
// Size: 0x80
function watchgameended() {
    plane = self;
    plane endon(#"hash_1fe75f940ce5fd52", #"death");
    level waittill(#"game_ended");
    plane notify(#"hash_1fe75f940ce5fd52", {#is_killed:0});
}

