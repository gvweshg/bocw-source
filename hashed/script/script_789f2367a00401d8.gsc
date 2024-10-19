// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\zm_stats.gsc;
#using script_62caa307a394c18c;
#using scripts\core_common\hud_shared.gsc;
#using scripts\zm_common\scoreevents.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\weapons\weapons.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using script_396f7d71538c9677;
#using scripts\core_common\battlechatter.gsc;

#namespace namespace_68a80213;

// Namespace namespace_68a80213/namespace_68a80213
// Params 0, eflags: 0x5
// Checksum 0xcc749d06, Offset: 0x280
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"hash_512409f8a5de10e4", &init_shared, undefined, undefined, undefined);
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 0, eflags: 0x2 linked
// Checksum 0xf11b7289, Offset: 0x2c8
// Size: 0xcc
function init_shared() {
    clientfield::register("actor", "" + #"hash_c5d06ae18fde4c0", 1, 1, "int");
    params = getstatuseffect("dot_molotov_dog");
    level.var_e6a4f161 = params.var_18d16a6b;
    level.var_5d450296 = params.setype;
    level.var_e8a6b3ee = [];
    spawner::add_archetype_spawn_function(#"zombie_dog", &function_4f3cd1f0);
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 0, eflags: 0x2 linked
// Checksum 0xabdea4a7, Offset: 0x3a0
// Size: 0x5c
function function_4f3cd1f0() {
    if (self.var_9fde8624 === #"hash_28e36e7b7d5421f") {
        self.var_90d0c0ff = "anim_spawn_hellhound";
        self callback::function_d8abfc3d(#"on_dog_killed", &function_84a3128e);
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 0, eflags: 0x2 linked
// Checksum 0x8caba4e6, Offset: 0x408
// Size: 0x1ec
function function_84a3128e() {
    if (!isdefined(self.exploded) && !is_true(self.var_270befd2)) {
        self.exploded = 1;
        self clientfield::set("" + #"hash_c5d06ae18fde4c0", 1);
        var_3e7a440 = getscriptbundle("molotov_custom_settings");
        blast_radius = 65;
        attacker = undefined;
        if (isdefined(self.attacker)) {
            attacker = self.attacker;
        }
        level thread function_59d981cc(self.origin + (0, 0, 18), blast_radius, attacker, self);
        function_ccb2e201(self.origin + (0, 0, 18), blast_radius);
        if (!isdefined(self.var_338d4a29) || self.var_338d4a29 == 0) {
            function_e8ad1d81(self.origin, (0, 0, 1), (0, 0, 1), self.team, var_3e7a440, attacker, self);
        }
        self.var_7a68cd0c = 1;
        self ghost();
        self notsolid();
        if (isalive(self)) {
            self.allowdeath = 1;
            self kill(undefined, undefined, undefined, undefined, undefined, 1);
        }
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 1, eflags: 0x2 linked
// Checksum 0x9386049e, Offset: 0x600
// Size: 0x42
function is_under_water(position) {
    water_depth = getwaterheight(position) - position[2];
    return water_depth >= 24;
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 1, eflags: 0x2 linked
// Checksum 0x5b84afb6, Offset: 0x650
// Size: 0x24
function function_a66ba8cc(water_depth) {
    return 0 < water_depth && water_depth < 24;
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 1, eflags: 0x2 linked
// Checksum 0x60308935, Offset: 0x680
// Size: 0x2c
function get_water_depth(position) {
    return getwaterheight(position) - position[2];
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 1, eflags: 0x2 linked
// Checksum 0x1e550e5a, Offset: 0x6b8
// Size: 0x84
function function_7cbeb2f0(normal) {
    if (normal[2] < 0.5) {
        stepoutdistance = normal * getdvarint(#"hash_72463d6fcf7cb178", 50);
    } else {
        stepoutdistance = normal * getdvarint(#"hash_1423ebf820f9483f", 12);
    }
    return stepoutdistance;
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 7, eflags: 0x2 linked
// Checksum 0xe5f10561, Offset: 0x748
// Size: 0x8cc
function function_e8ad1d81(position, normal, velocity, team, customsettings, attacker, exploder) {
    originalposition = position;
    var_493d36f9 = normal;
    var_77261b6 = vectornormalize(velocity);
    var_1f254a06 = vectorscale(var_77261b6, -1);
    var_d6d43109 = 1;
    var_e76400c0 = undefined;
    wallnormal = undefined;
    var_693f108f = undefined;
    molotovfireweapon = getweapon(#"molotov_fire");
    molotovfirewallweapon = getweapon("molotov_fire_wall");
    molotovsteamweapon = getweapon("molotov_steam");
    if (normal[2] < -0.5) {
        var_36c22d1d = position + vectorscale(normal, 2);
        var_8ae62b02 = var_36c22d1d - (0, 0, 240);
        var_69d15ad0 = physicstrace(var_36c22d1d, var_8ae62b02, (-0.5, -0.5, -0.5), (0.5, 0.5, 0.5), self, 1);
        if (var_69d15ad0[#"fraction"] < 1) {
            position = var_69d15ad0[#"position"];
            if (var_69d15ad0[#"fraction"] > 0) {
                normal = var_69d15ad0[#"normal"];
            } else {
                normal = (0, 0, 1);
            }
            var_1b1117c6 = 1.2 * var_69d15ad0[#"fraction"];
            var_1f254a06 = normal;
            if (var_1b1117c6 > 0) {
                wait(var_1b1117c6);
            }
        } else {
            return;
        }
    } else if (normal[2] < 0.5) {
        var_36c22d1d = position + vectorscale(var_493d36f9, 2);
        var_8ae62b02 = var_36c22d1d - (0, 0, 20);
        var_69d15ad0 = physicstrace(var_36c22d1d, var_8ae62b02, (-0.5, -0.5, -0.5), (0.5, 0.5, 0.5), self, 1);
        if (var_69d15ad0[#"fraction"] < 1) {
            position = var_36c22d1d;
            if (var_69d15ad0[#"fraction"] > 0) {
                normal = var_69d15ad0[#"normal"];
            } else {
                normal = (0, 0, 1);
            }
        }
    }
    if (normal[2] < 0.5) {
        wall_normal = normal;
        var_36c22d1d = originalposition + vectorscale(var_493d36f9, 8);
        var_8ae62b02 = var_36c22d1d - (0, 0, 300);
        var_69d15ad0 = physicstrace(var_36c22d1d, var_8ae62b02, (-3, -3, -3), (3, 3, 3), self, 1);
        var_693f108f = var_69d15ad0[#"fraction"] * 300;
        var_959a2a8b = 0;
        if (var_693f108f > 10) {
            var_e76400c0 = originalposition;
            wallnormal = var_493d36f9;
            var_d6d43109 = sqrt(1 - var_69d15ad0[#"fraction"]);
            var_959a2a8b = 1;
        }
        if (var_69d15ad0[#"fraction"] < 1) {
            position = var_69d15ad0[#"position"];
            if (var_69d15ad0[#"fraction"] > 0) {
                normal = var_69d15ad0[#"normal"];
            } else {
                normal = (0, 0, 1);
            }
        }
        if (var_959a2a8b) {
            x = originalposition[0];
            y = originalposition[1];
            lowestz = var_69d15ad0[#"position"][2];
            for (z = originalposition[2]; z > lowestz; z -= randomintrange(20, 30)) {
                newpos = (x, y, z);
                water_depth = get_water_depth(newpos);
                if (function_a66ba8cc(water_depth) || is_under_water(newpos)) {
                    newpos -= (0, 0, water_depth);
                    level thread function_42b9fdbe(molotovsteamweapon, newpos, (0, 0, 1), int(5), team);
                    break;
                }
                level thread function_42b9fdbe(molotovfirewallweapon, newpos, wall_normal, int(5), team);
            }
            var_bc9ec158 = 0.6 * var_69d15ad0[#"fraction"];
            if (var_bc9ec158 > 0) {
                wait(var_bc9ec158);
            }
        }
    }
    startpos = position + function_7cbeb2f0(normal);
    desiredendpos = startpos + (0, 0, 60);
    function_1493c734(startpos, 20, (0, 1, 0), 0.6, 200);
    phystrace = physicstrace(startpos, desiredendpos, (-4, -4, -4), (4, 4, 4), self, 1);
    goalpos = phystrace[#"fraction"] > 1 ? desiredendpos : phystrace[#"position"];
    rotation = randomint(360);
    if (normal[2] < 0.1 && !isdefined(var_e76400c0)) {
        black = (0.1, 0.1, 0.1);
        trace = hitpos(startpos, startpos + normal * -1 * 70 + (0, 0, -1) * 70, black);
        traceposition = trace[#"position"];
        if (trace[#"fraction"] < 0.9) {
            var_252a0dc7 = trace[#"normal"];
            spawntimedfx(molotovfirewallweapon, traceposition, var_252a0dc7, int(5), team);
        }
    }
    var_1f254a06 = normal;
    level function_8a03d3f3(position, startpos, var_1f254a06, var_d6d43109, rotation, team, var_e76400c0, wallnormal, var_693f108f, customsettings, attacker, exploder);
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 7, eflags: 0x2 linked
// Checksum 0x792e9229, Offset: 0x1020
// Size: 0x8c
function function_523961e2(startpos, normal, var_4997e17c, fxindex, fxcount, defaultdistance, rotation) {
    currentangle = 360 / fxcount * fxindex;
    var_7ee25402 = rotatepointaroundaxis(var_4997e17c * defaultdistance, normal, currentangle + rotation);
    return startpos + var_7ee25402;
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 0, eflags: 0x2 linked
// Checksum 0x8e19e50c, Offset: 0x10b8
// Size: 0xe4
function function_31cc6bd9() {
    if (!isdefined(level.var_a88ac760)) {
        return;
    }
    keys = getarraykeys(level.var_a88ac760);
    time = gettime();
    foreach (key in keys) {
        if (level.var_a88ac760[key].var_46ee5246 < time) {
            level.var_a88ac760[key] = undefined;
        }
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 2, eflags: 0x2 linked
// Checksum 0xb5afe993, Offset: 0x11a8
// Size: 0xfe
function function_31f342a2(origin, var_9c7e3678) {
    if (!isdefined(level.var_a88ac760)) {
        return false;
    }
    foreach (molotov in level.var_a88ac760) {
        if (abs(molotov.origin[2] - origin[2] > 20)) {
            continue;
        }
        if (distance2dsquared(molotov.origin, origin) < var_9c7e3678) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 12, eflags: 0x2 linked
// Checksum 0x12476f50, Offset: 0x12b0
// Size: 0xe68
function function_8a03d3f3(impactpos, startpos, normal, multiplier, rotation, team, var_e76400c0, wallnormal, var_693f108f, customsettings, attacker, exploder) {
    defaultdistance = 65 * multiplier;
    defaultdropdistance = getdvarint(#"hash_4a8fc6d7cacea9d5", 90);
    colorarray = [];
    colorarray[colorarray.size] = (0.9, 0.2, 0.2);
    colorarray[colorarray.size] = (0.2, 0.9, 0.2);
    colorarray[colorarray.size] = (0.2, 0.2, 0.9);
    colorarray[colorarray.size] = (0.9, 0.9, 0.9);
    locations = [];
    locations[#"color"] = [];
    locations[#"loc"] = [];
    locations[#"tracepos"] = [];
    locations[#"distsqrd"] = [];
    locations[#"fxtoplay"] = [];
    locations[#"radius"] = [];
    locations[#"tallfire"] = [];
    locations[#"smallfire"] = [];
    locations[#"steam"] = [];
    fxcount = 7;
    var_33ad9452 = isdefined(1) ? 1 : 0;
    fxcount = int(math::clamp(fxcount * multiplier + 6, 6, 7));
    if (multiplier < 0.04) {
        fxcount = 0;
    }
    function_31cc6bd9();
    if (function_31f342a2(startpos, sqr(97.5)) && fxcount > 10) {
        fxcount = 7;
    }
    var_4997e17c = perpendicularvector(normal);
    for (fxindex = 0; fxindex < fxcount; fxindex++) {
        locations[#"point"][fxindex] = function_523961e2(startpos, normal, var_4997e17c, fxindex, fxcount, defaultdistance, rotation);
        function_1493c734(locations[#"point"][fxindex], 10, (0, fxindex * 20, 0), 0.6, 200);
        locations[#"color"][fxindex] = colorarray[fxindex % colorarray.size];
    }
    var_1cac1ca8 = normal[2] > 0.5;
    for (count = 0; count < fxcount; count++) {
        trace = hitpos(startpos, locations[#"point"][count], locations[#"color"][count]);
        traceposition = trace[#"position"];
        locations[#"tracepos"][count] = traceposition;
        hitsomething = 0;
        if (trace[#"fraction"] < 0.7) {
            function_1493c734(traceposition, 10, (1, 0, 0), 0.6, 200);
            locations[#"loc"][count] = traceposition;
            locations[#"normal"][count] = trace[#"normal"];
            if (var_1cac1ca8) {
                locations[#"tallfire"][count] = 1;
            }
            hitsomething = 1;
        }
        if (!hitsomething) {
            tracedown = hitpos(traceposition, traceposition - normal * defaultdropdistance, locations[#"color"][count]);
            if (tracedown[#"fraction"] != 1) {
                function_1493c734(tracedown[#"position"], 10, (0, 0, 1), 0.6, 200);
                locations[#"loc"][count] = tracedown[#"position"];
                water_depth = get_water_depth(tracedown[#"position"]);
                if (function_a66ba8cc(water_depth)) {
                    locations[#"normal"][count] = (0, 0, 1);
                    locations[#"steam"][count] = 1;
                    locations[#"loc"][count] = locations[#"loc"][count] - (0, 0, water_depth);
                } else {
                    locations[#"normal"][count] = tracedown[#"normal"];
                    locations[#"smallfire"][count] = 1;
                }
            }
        }
        randangle = randomint(360);
        var_c4b09917 = randomfloatrange(-25, 25);
        var_7ee25402 = rotatepointaroundaxis(var_4997e17c, normal, randangle);
        var_995eb37a = int(min(var_33ad9452 * multiplier * trace[#"fraction"] + 1, var_33ad9452));
        for (var_ecef2fde = 0; var_ecef2fde < var_995eb37a && count % 2 == 0; var_ecef2fde++) {
            fraction = (var_ecef2fde + 1) / (var_995eb37a + 1);
            offsetpoint = startpos + (traceposition - startpos) * fraction + var_7ee25402 * var_c4b09917;
            var_9417df90 = hitpos(offsetpoint, offsetpoint - normal * defaultdropdistance, locations[#"color"][count]);
            if (var_9417df90[#"fraction"] != 1) {
                function_1493c734(var_9417df90[#"position"], 10, (0, 0, 1), 0.6, 200);
                locindex = count + fxcount * (var_ecef2fde + 1);
                locations[#"loc"][locindex] = var_9417df90[#"position"];
                water_depth = get_water_depth(var_9417df90[#"position"]);
                if (function_a66ba8cc(water_depth)) {
                    locations[#"normal"][locindex] = (0, 0, 1);
                    locations[#"steam"][locindex] = 1;
                    locations[#"loc"][locindex] = locations[#"loc"][locindex] - (0, 0, water_depth);
                    continue;
                }
                locations[#"normal"][locindex] = var_9417df90[#"normal"];
            }
        }
    }
    molotovfireweapon = getweapon(#"molotov_fire");
    molotovfiretallweapon = getweapon("molotov_fire_tall");
    molotovfiresmallweapon = getweapon("molotov_fire_small");
    molotovsteamweapon = getweapon("molotov_steam");
    var_6b23e1c9 = impactpos + normal * 1.5;
    forward = (1, 0, 0);
    if (abs(vectordot(forward, normal)) > 0.999) {
        forward = (0, 0, 1);
    }
    if (!is_under_water(var_6b23e1c9)) {
        playfx(#"hash_789d7811f6a28f9a", var_6b23e1c9, forward, normal, 0, team);
        if (!isdefined(var_e76400c0)) {
            spawntimedfx(molotovfireweapon, var_6b23e1c9, normal, int(5), team);
        }
    }
    if (level.gameended) {
        return;
    }
    if (!isdefined(level.var_801fd65e)) {
        level.var_801fd65e = 0;
    }
    if (!isdefined(level.var_a88ac760)) {
        level.var_a88ac760 = [];
    }
    var_bf264593 = level.var_a88ac760.size;
    level.var_a88ac760[var_bf264593] = {};
    var_4b424bc1 = level.var_a88ac760[var_bf264593];
    var_4b424bc1.var_46ee5246 = int(gettime() + 5000);
    var_4b424bc1.origin = startpos;
    thread damageeffectarea(startpos, normal, molotovfireweapon, multiplier, var_e76400c0, wallnormal, var_693f108f, var_4b424bc1.var_46ee5246, customsettings, attacker, exploder);
    thread function_9464e4ad(startpos, normal, molotovfireweapon, multiplier, var_e76400c0, wallnormal, var_693f108f, var_4b424bc1.var_46ee5246, customsettings, attacker, exploder);
    var_b1dd2ca0 = getarraykeys(locations[#"loc"]);
    foreach (lockey in var_b1dd2ca0) {
        if (!isdefined(lockey)) {
            continue;
        }
        if (is_under_water(locations[#"loc"][lockey])) {
            continue;
        }
        if (isdefined(locations[#"smallfire"][lockey])) {
            fireweapon = molotovfiresmallweapon;
        } else if (isdefined(locations[#"steam"][lockey])) {
            fireweapon = molotovsteamweapon;
        } else {
            fireweapon = isdefined(locations[#"tallfire"][lockey]) ? molotovfiretallweapon : molotovfireweapon;
        }
        level thread function_42b9fdbe(fireweapon, locations[#"loc"][lockey], locations[#"normal"][lockey], int(5), team);
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 5, eflags: 0x2 linked
// Checksum 0x88d91e9b, Offset: 0x2120
// Size: 0x84
function function_42b9fdbe(weapon, loc, normal, duration, *team) {
    fxnormal = duration;
    wait(randomfloatrange(0, 0.5));
    spawntimedfx(loc, normal, fxnormal, team, #"axis");
}

/#

    // Namespace namespace_68a80213/namespace_68a80213
    // Params 5, eflags: 0x0
    // Checksum 0x869e01d, Offset: 0x21b0
    // Size: 0xb4
    function incendiary_debug_line(from, to, color, depthtest, time) {
        debug_rcbomb = getdvarint(#"scr_molotov_debug", 0);
        if (debug_rcbomb == 1) {
            if (!isdefined(time)) {
                time = 100;
            }
            if (!isdefined(depthtest)) {
                depthtest = 1;
            }
            line(from, to, color, 1, depthtest, time);
        }
    }

#/

// Namespace namespace_68a80213/namespace_68a80213
// Params 11, eflags: 0x2 linked
// Checksum 0x2fd69ced, Offset: 0x2270
// Size: 0x508
function damageeffectarea(position, *normal, weapon, radius_multiplier, var_e76400c0, wallnormal, var_cbaaea69, damageendtime, customsettings, attacker, exploder) {
    level endon(#"game_ended");
    radius = 65 * radius_multiplier;
    height = 48;
    trigger_radius_position = normal - (0, 0, height);
    trigger_radius_height = height * 2;
    if (isdefined(var_e76400c0) && isdefined(wallnormal)) {
        var_21f4217c = var_e76400c0 + vectorscale(wallnormal, 12) - (0, 0, var_cbaaea69);
        var_289a74bc = spawn("trigger_radius", var_21f4217c, 0, 12, var_cbaaea69);
        /#
            if (getdvarint(#"scr_draw_triggers", 0)) {
                level thread util::drawcylinder(var_21f4217c, 12, var_cbaaea69, undefined, "<unknown string>", (1, 0, 0), 0.9);
            }
        #/
    }
    if (radius >= 0.04) {
        fireeffectarea = spawn("trigger_radius", trigger_radius_position, 0, radius, trigger_radius_height);
        firesound = spawn("script_origin", fireeffectarea.origin + (0, 0, 75));
        if (isdefined(firesound)) {
            firesound playloopsound(#"hash_6993f289f9415bd1");
        }
    }
    /#
        if (getdvarint(#"scr_draw_triggers", 0)) {
            level thread util::drawcylinder(trigger_radius_position, radius, trigger_radius_height, undefined, "<unknown string>");
        }
    #/
    self.var_ebf0b1c9 = [];
    burntime = 0;
    var_d0603aba = 1;
    self thread function_1f077104(normal, fireeffectarea, var_289a74bc, weapon, damageendtime);
    while (gettime() < damageendtime) {
        damageapplied = 0;
        potential_targets = self getpotentialtargets(normal);
        foreach (target in potential_targets) {
            waitframe(1);
            if (isdefined(target) && isdefined(self)) {
                self trytoapplyfiredamage(target, normal, fireeffectarea, var_289a74bc, weapon, customsettings, attacker, exploder);
            }
        }
        wait(0.2);
    }
    arrayremovevalue(self.var_ebf0b1c9, undefined);
    foreach (target in self.var_ebf0b1c9) {
        target.var_84e41b20 = undefined;
        target status_effect::function_408158ef(level.var_5d450296, level.var_e6a4f161);
    }
    if (isdefined(fireeffectarea)) {
        fireeffectarea delete();
        if (isdefined(firesound)) {
            firesound thread stopfiresound();
        }
    }
    if (isdefined(var_289a74bc)) {
        var_289a74bc delete();
    }
    /#
        if (getdvarint(#"scr_draw_triggers", 0)) {
            level notify(#"hash_33d328e380ab0acc");
        }
    #/
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 5, eflags: 0x2 linked
// Checksum 0xf389931f, Offset: 0x2780
// Size: 0x11c
function function_1f077104(position, fireeffectarea, var_289a74bc, weapon, damageendtime) {
    level endon(#"game_ended");
    self endon(#"death");
    while (gettime() < damageendtime) {
        var_9a43d78f = self function_ae0a22c4(position);
        foreach (target in var_9a43d78f) {
            self function_851843a5(target, position, fireeffectarea, var_289a74bc, weapon);
        }
        wait(0.25);
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 0, eflags: 0x2 linked
// Checksum 0x36c765f6, Offset: 0x28a8
// Size: 0x54
function stopfiresound() {
    firesound = self;
    firesound stoploopsound(2);
    wait(0.5);
    if (isdefined(firesound)) {
        firesound delete();
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 11, eflags: 0x2 linked
// Checksum 0xba83fa5, Offset: 0x2908
// Size: 0x384
function function_9464e4ad(position, *normal, weapon, radius_multiplier, var_e76400c0, wallnormal, var_cbaaea69, damageendtime, customsettings, attacker, exploder) {
    level endon(#"game_ended");
    radius = 65 * radius_multiplier;
    height = 48;
    trigger_radius_position = normal - (0, 0, height);
    trigger_radius_height = height * 2;
    if (isdefined(var_e76400c0) && isdefined(wallnormal)) {
        var_21f4217c = var_e76400c0 + vectorscale(wallnormal, 12) - (0, 0, var_cbaaea69);
        var_289a74bc = spawn("trigger_radius", var_21f4217c, 0, 12, var_cbaaea69);
        var_289a74bc.targetname = "fire_area";
    }
    if (radius >= 0.04) {
        fireeffectarea = spawn("trigger_radius", trigger_radius_position, 0, radius, trigger_radius_height);
        fireeffectarea.targetname = "fire_area";
    }
    self.var_ebf0b1c9 = [];
    while (gettime() < damageendtime) {
        damageapplied = 0;
        potential_targets = exploder weapons::function_356292be(undefined, normal, radius);
        foreach (target in potential_targets) {
            waitframe(1);
            if (isdefined(target) && isdefined(self)) {
                self trytoapplyfiredamage(target, normal, fireeffectarea, var_289a74bc, weapon, customsettings, attacker);
            }
        }
        wait(customsettings.var_8fbd03cb);
    }
    arrayremovevalue(self.var_ebf0b1c9, undefined);
    foreach (target in self.var_ebf0b1c9) {
        target.var_84e41b20 = undefined;
        target status_effect::function_408158ef(level.var_5d450296, level.var_e6a4f161);
    }
    if (isdefined(fireeffectarea)) {
        fireeffectarea delete();
    }
    if (isdefined(var_289a74bc)) {
        var_289a74bc delete();
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 1, eflags: 0x2 linked
// Checksum 0xa0267050, Offset: 0x2c98
// Size: 0x42
function function_ae0a22c4(position) {
    potential_targets = [];
    potential_targets = getentitiesinradius(position, 65, 15);
    return potential_targets;
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 1, eflags: 0x2 linked
// Checksum 0x2b6fd3d4, Offset: 0x2ce8
// Size: 0x23e
function getpotentialtargets(origin) {
    if (level.teambased && level.friendlyfire == 0) {
        potential_targets = [];
        foreach (team, _ in level.teams) {
            potential_targets = arraycombine(potential_targets, getplayers(team, origin, 65), 0, 0);
        }
    }
    var_739bcc52 = [];
    foreach (vehicle in getvehiclearray()) {
        if (is_true(vehicle.isplayervehicle)) {
            var_739bcc52[var_739bcc52.size] = vehicle;
        }
    }
    all_targets = [];
    var_739bcc52 = function_72d3bca6(var_739bcc52, origin, undefined, undefined, 120);
    all_targets = arraycombine(potential_targets, getaiarray(), 0, 0);
    all_targets = function_72d3bca6(all_targets, origin, undefined, undefined, 65);
    all_targets = arraycombine(all_targets, var_739bcc52, 0, 0);
    if (level.friendlyfire > 0) {
        return all_targets;
    }
    return all_targets;
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 1, eflags: 0x0
// Checksum 0x2a22c5d7, Offset: 0x2f30
// Size: 0x162
function function_5a49ebd3(team) {
    scriptmodels = getentarray("script_model", "classname");
    var_e26b971c = [];
    foreach (scriptmodel in scriptmodels) {
        if (!isdefined(scriptmodel)) {
            continue;
        }
        if (!isdefined(scriptmodel.team)) {
            continue;
        }
        if (scriptmodel.health <= 0) {
            continue;
        }
        if (scriptmodel.team == team) {
            if (!isdefined(var_e26b971c)) {
                var_e26b971c = [];
            } else if (!isarray(var_e26b971c)) {
                var_e26b971c = array(var_e26b971c);
            }
            if (!isinarray(var_e26b971c, scriptmodel)) {
                var_e26b971c[var_e26b971c.size] = scriptmodel;
            }
        }
    }
    return var_e26b971c;
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 5, eflags: 0x2 linked
// Checksum 0x377ed631, Offset: 0x30a0
// Size: 0x1c8
function function_851843a5(target, position, fireeffectarea, var_289a74bc, *weapon) {
    if (!(isdefined(var_289a74bc) || isdefined(weapon))) {
        return;
    }
    var_4c3c1b32 = 0;
    var_75046efd = 0;
    sourcepos = fireeffectarea;
    if (isdefined(var_289a74bc)) {
        var_4c3c1b32 = position istouching(var_289a74bc);
        sourcepos = var_289a74bc.origin;
    }
    if (isdefined(weapon)) {
        var_75046efd = position istouching(weapon);
        sourcepos = weapon.origin;
    }
    var_be45d685 = !(var_4c3c1b32 || var_75046efd);
    targetentnum = position getentitynumber();
    if (!var_be45d685 && (!isdefined(position.sessionstate) || position.sessionstate == "playing")) {
        trace = bullettrace(fireeffectarea, position getshootatpos(), 0, position);
        if (trace[#"fraction"] == 1) {
            if (position.var_9fde8624 === #"hash_28e36e7b7d5421f") {
                position thread function_c049196a();
            }
            return;
        }
        var_be45d685 = 1;
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 8, eflags: 0x2 linked
// Checksum 0x1a9185cf, Offset: 0x3270
// Size: 0x2dc
function trytoapplyfiredamage(target, position, fireeffectarea, var_289a74bc, weapon, customsettings, attacker, exploder) {
    if (!(isdefined(fireeffectarea) || isdefined(var_289a74bc))) {
        return;
    }
    var_4c3c1b32 = 0;
    var_75046efd = 0;
    sourcepos = position;
    if (isdefined(fireeffectarea)) {
        var_4c3c1b32 = target istouching(fireeffectarea);
        sourcepos = fireeffectarea.origin;
    }
    if (isdefined(var_289a74bc)) {
        var_75046efd = target istouching(var_289a74bc);
        sourcepos = var_289a74bc.origin;
    }
    var_be45d685 = !(var_4c3c1b32 || var_75046efd);
    targetentnum = target getentitynumber();
    if (!var_be45d685 && (!isdefined(target.sessionstate) || target.sessionstate == "playing")) {
        trace = bullettrace(position, target getshootatpos(), 0, target);
        if (trace[#"fraction"] == 1) {
            if (isplayer(target)) {
                target thread damageinfirearea(sourcepos, trace, position, weapon, fireeffectarea, var_289a74bc, customsettings);
            } else if (isai(target)) {
                target function_8422dabd(sourcepos, trace, position, customsettings, attacker, exploder);
            } else {
                target thread function_37ddab3(sourcepos, trace, position, weapon, customsettings);
            }
            self.var_ebf0b1c9[targetentnum] = target;
        } else {
            var_be45d685 = 1;
        }
    }
    if (var_be45d685 && isdefined(target.var_84e41b20) && isplayer(target)) {
        if (target.var_84e41b20.size == 0) {
            target.var_84e41b20 = undefined;
            target status_effect::function_408158ef(level.var_5d450296, level.var_e6a4f161);
            self.var_ebf0b1c9[targetentnum] = undefined;
        }
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 0, eflags: 0x2 linked
// Checksum 0xd5fe44ce, Offset: 0x3558
// Size: 0x62
function function_c049196a() {
    self endon(#"death");
    t = gettime();
    wait_time = gettime() + 1000;
    if (isdefined(self)) {
        self.var_338d4a29 = 1;
        wait(0.25);
        self.var_338d4a29 = 0;
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 7, eflags: 0x2 linked
// Checksum 0x76ecb3b0, Offset: 0x35c8
// Size: 0x1dc
function damageinfirearea(origin, *trace, *position, weapon, fireeffectarea, var_289a74bc, *customsettings) {
    self endon(#"death");
    timer = 0;
    if (candofiredamage(self, 0.2)) {
        /#
            level.molotov_debug = getdvarint(#"scr_molotov_debug", 0);
            if (level.molotov_debug) {
                if (!isdefined(level.incendiarydamagetime)) {
                    level.incendiarydamagetime = gettime();
                }
                iprintlnbold(level.incendiarydamagetime - gettime());
                level.incendiarydamagetime = gettime();
            }
        #/
        if (!isdefined(self.var_84e41b20)) {
            self.var_84e41b20 = [];
        }
        params = getstatuseffect("dot_molotov_dog");
        if (undefined !== self) {
            if (isdefined(var_289a74bc)) {
                self status_effect::status_effect_apply(params, fireeffectarea, var_289a74bc, 0, undefined, undefined, weapon);
                self.var_ae639436 = var_289a74bc;
                self thread sndfiredamage();
                return;
            }
            if (isdefined(customsettings)) {
                self status_effect::status_effect_apply(params, fireeffectarea, customsettings, 0, undefined, undefined, weapon);
                self.var_ae639436 = customsettings;
                self thread sndfiredamage();
            }
        }
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 6, eflags: 0x2 linked
// Checksum 0xbc61f3e7, Offset: 0x37b0
// Size: 0x2fc
function function_8422dabd(*origin, *trace, *position, customsettings, attacker, exploder) {
    self endon(#"death");
    timer = 0;
    if (candofiredamage(self, customsettings.var_90bd7d92)) {
        if (!isdefined(self.var_84e41b20)) {
            self.var_84e41b20 = [];
        }
        damage = 14;
        round = zm_utility::get_round_number();
        if (round >= 2) {
            if (round > 35) {
                round = 35;
            }
            adjustment_rounds = round - 2 + 1;
            adjustment_percentage = 1.2;
            var_e2d3357 = pow(adjustment_percentage, adjustment_rounds);
            damage = int(damage * var_e2d3357);
        }
        if (self !== exploder && isalive(self)) {
            damage = int(damage);
            if (damage >= self.health && !is_true(self.var_865b1595)) {
                scoreevents::function_a1f450c2("hellhound_flame_killingblow", attacker, self);
                if (isplayer(attacker)) {
                    attacker zm_stats::increment_challenge_stat(#"hash_6e761859bc1ffd3d");
                }
                self.var_865b1595 = 1;
            }
            self.var_a5cccd85 = gettime();
            self dodamage(damage, self.origin, undefined, undefined, "none", "MOD_BURNED", 0, undefined);
            scoreevents::function_82234b38(self, attacker, undefined, undefined, undefined, undefined);
            if (isplayer(attacker)) {
                point = aiutility::function_cb552839(self);
                hud::function_c9800094(attacker, point, damage, 1, self namespace_42457a0::function_1b3815a7(#"fire"));
            }
        }
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 5, eflags: 0x2 linked
// Checksum 0xa92feac0, Offset: 0x3ab8
// Size: 0x10a
function function_37ddab3(*origin, *trace, *position, weapon, customsettings) {
    self endon(#"death");
    timer = 0;
    if (candofiredamage(self, customsettings.var_8fbd03cb)) {
        var_4dd4e6ee = undefined;
        if (!isdefined(self.var_84e41b20)) {
            self.var_84e41b20 = [];
        }
        var_341dfe48 = int(customsettings.var_4931651e * customsettings.var_8fbd03cb);
        self dodamage(var_341dfe48, self.origin, undefined, weapon, "none", "MOD_BURNED", 0, weapon);
        self.var_ae639436 = var_4dd4e6ee;
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 4, eflags: 0x2 linked
// Checksum 0x863df4a9, Offset: 0x3bd0
// Size: 0x53c
function function_59d981cc(origin, blast_radius, attacker, exploder) {
    level endon(#"game_ended");
    potential_targets = [];
    potential_targets = arraycombine(getpotentialtargets(origin), exploder weapons::function_356292be(undefined, origin, blast_radius), 0);
    foreach (target in potential_targets) {
        waitframe(1);
        if (isdefined(target)) {
            var_9dea1e72 = mapfloat(0, blast_radius, 10, 25, distance(target.origin, origin));
            if (isactor(target)) {
                round = zm_utility::get_round_number();
                if (round >= 2) {
                    if (round > 35) {
                        round = 35;
                    }
                    adjustment_rounds = round - 2 + 1;
                    adjustment_percentage = 1.2;
                    var_e2d3357 = pow(adjustment_percentage, adjustment_rounds);
                    var_9dea1e72 = int(var_9dea1e72 * var_e2d3357);
                }
            }
            if (target !== exploder && isalive(target) && isai(target)) {
                var_9dea1e72 = int(var_9dea1e72);
                if (var_9dea1e72 >= target.health && !is_true(target.var_865b1595)) {
                    target.var_865b1595 = 1;
                    scoreevents::function_a1f450c2("hellhound_flame_killingblow", attacker, target);
                }
                scoreevents::function_82234b38(self, attacker, undefined, undefined, undefined, undefined);
                target dodamage(var_9dea1e72, origin, undefined, attacker, "none", "MOD_EXPLOSIVE", 0, undefined);
                if (isplayer(attacker)) {
                    point = aiutility::function_cb552839(target);
                    hud::function_c9800094(attacker, point, var_9dea1e72, 1, self namespace_42457a0::function_1b3815a7(#"fire"));
                }
            }
            if (target !== exploder && isvehicle(target)) {
                var_9dea1e72 = int(var_9dea1e72);
                target dodamage(var_9dea1e72, origin, undefined, attacker, "none", "MOD_EXPLOSIVE", 0, undefined);
                if (isdefined(exploder.var_ab1b3515) && exploder.var_ab1b3515.var_6f84b820 === #"boss") {
                    occupants = target getvehoccupants();
                    foreach (occupant in occupants) {
                        seatindex = target getoccupantseat(occupant);
                        if (seatindex >= 1 && seatindex <= 4) {
                            occupant dodamage(25, origin, undefined, attacker, "none", "MOD_EXPLOSIVE", 0, undefined);
                        }
                    }
                }
            }
        }
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 0, eflags: 0x2 linked
// Checksum 0x363a0b25, Offset: 0x4118
// Size: 0x146
function sndfiredamage() {
    self notify(#"sndfire");
    self endon(#"sndfire", #"death", #"disconnect");
    if (!isdefined(self.sndfireent)) {
        self.sndfireent = spawn("script_origin", self.origin);
        self.sndfireent linkto(self);
        self.sndfireent playsound(#"hash_42d7a7b01bd2b414");
        self thread sndfiredamage_deleteent(self.sndfireent);
    }
    self.sndfireent playloopsound(#"hash_aa65888a78201f4", 0.5);
    wait(3);
    if (isdefined(self.sndfireent)) {
        self.sndfireent delete();
        self.sndfireent = undefined;
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 1, eflags: 0x2 linked
// Checksum 0x626172c4, Offset: 0x4268
// Size: 0x4c
function sndfiredamage_deleteent(ent) {
    self waittill(#"death", #"disconnect");
    if (isdefined(ent)) {
        ent delete();
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 3, eflags: 0x2 linked
// Checksum 0xbd0066ee, Offset: 0x42c0
// Size: 0xe0
function hitpos(start, end, color) {
    trace = bullettrace(start, end, 0, undefined);
    /#
        level.molotov_debug = getdvarint(#"scr_molotov_debug", 0);
        if (level.molotov_debug) {
            debugstar(trace[#"position"], 2000, color);
        }
        thread incendiary_debug_line(start, trace[#"position"], color, 1, 80);
    #/
    return trace;
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 2, eflags: 0x2 linked
// Checksum 0x2da8a4cb, Offset: 0x43a8
// Size: 0xf4
function candofiredamage(victim, resetfiretime) {
    if (isplayer(victim) && victim depthofplayerinwater() >= 1) {
        return false;
    }
    if (isactor(victim) && victim.var_9fde8624 === #"hash_28e36e7b7d5421f") {
        return false;
    }
    entnum = victim getentitynumber();
    if (!isdefined(level.var_e8a6b3ee[entnum])) {
        level.var_e8a6b3ee[entnum] = 1;
        level thread resetfiredamage(entnum, resetfiretime);
        return true;
    }
    return false;
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 2, eflags: 0x2 linked
// Checksum 0xf22eecb9, Offset: 0x44a8
// Size: 0x40
function resetfiredamage(entnum, time) {
    if (time > 0.05) {
        wait(time - 0.05);
    }
    level.var_e8a6b3ee[entnum] = undefined;
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 5, eflags: 0x2 linked
// Checksum 0x96d35cc4, Offset: 0x44f0
// Size: 0xac
function function_1493c734(origin, radius, color, alpha, time) {
    /#
        debug_fire = getdvarint(#"hash_58042b6209e0c2a6", 0);
        if (debug_fire > 0) {
            if (debug_fire > 1) {
                radius = int(radius / debug_fire);
            }
            util::debug_sphere(origin, radius, color, alpha, time);
        }
    #/
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 2, eflags: 0x2 linked
// Checksum 0x894f5d2b, Offset: 0x45a8
// Size: 0xf8
function function_ccb2e201(position, radius) {
    a_zombies = getentitiesinradius(position, radius, 15);
    var_eb2cabb5 = array::filter(a_zombies, 0, &function_53811067);
    if (var_eb2cabb5.size > 0) {
        foreach (zombie in var_eb2cabb5) {
            zombie zombie_utility::setup_zombie_knockdown(position);
        }
    }
}

// Namespace namespace_68a80213/namespace_68a80213
// Params 1, eflags: 0x6 linked
// Checksum 0xffeee1c2, Offset: 0x46a8
// Size: 0x70
function private function_53811067(zombie) {
    if (!isdefined(zombie)) {
        return false;
    }
    if (zombie.knockdown === 1) {
        return false;
    }
    if (zombie.archetype !== #"zombie") {
        return false;
    }
    if (zombie.var_33fb0350 === 1) {
        return false;
    }
    return true;
}

