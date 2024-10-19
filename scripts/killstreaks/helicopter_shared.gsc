// Atian COD Tools GSC CW decompiler test
#using scripts\weapons\heatseekingmissile.gsc;
#using scripts\core_common\turret_shared.gsc;
#using scripts\core_common\targetting_delay.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\killstreak_hacking.gsc;
#using scripts\killstreaks\killstreak_bundles.gsc;
#using scripts\killstreaks\flak_drone.gsc;
#using scripts\killstreaks\airsupport.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using script_4721de209091b1a6;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\damage.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace helicopter;

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x16cbc862, Offset: 0x740
// Size: 0x3dc
function init_shared() {
    if (!isdefined(level.helicopter_shared)) {
        level.helicopter_shared = {};
        airsupport::init_shared();
        flak_drone::init_shared();
        path_start = getentarray("heli_start", "targetname");
        loop_start = getentarray("heli_loop_start", "targetname");
        var_3f5397f = struct::get_array("heli_start", "targetname");
        var_78f0de1a = struct::get_array("heli_loop_start", "targetname");
        path_start = arraycombine(path_start, var_3f5397f);
        loop_start = arraycombine(loop_start, var_78f0de1a);
        /#
            debug_refresh = 1;
        #/
        thread heli_update_global_dvars(debug_refresh);
        level.choppercomlinkfriendly = #"veh_t7_drone_hunter";
        level.choppercomlinkenemy = #"hash_7948c5263c738621";
        level.chopperregular = #"hash_7948c5263c738621";
        precachehelicopter(level.chopperregular);
        clientfield::register("vehicle", "heli_comlink_bootup_anim", 1, 1, "int");
        clientfield::register("vehicle", "heli_warn_targeted", 1, 1, "int");
        clientfield::register("vehicle", "heli_warn_locked", 1, 1, "int");
        clientfield::register("vehicle", "heli_warn_fired", 1, 1, "int");
        clientfield::register("vehicle", "active_camo", 1, 3, "int");
        level.heli_paths = [];
        level.heli_startnodes = [];
        level.last_start_node_index = 0;
        level.chopper_fx[#"smoke"][#"trail"] = "destruct/fx8_atk_chppr_exp_trail";
        level.chopper_fx[#"fire"][#"trail"][#"large"] = "killstreaks/fx_heli_smk_trail_engine";
        level._effect[#"heli_comlink_light"][#"friendly"] = #"hash_33eb8912b6c63ecd";
        level._effect[#"heli_comlink_light"][#"enemy"] = #"hash_33eb8912b6c63ecd";
        if (!path_start.size && !loop_start.size) {
            return;
        }
        heli_path_graph();
    }
    callback::on_finalize_initialization(&function_1c601b99);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0xf811b119, Offset: 0xb28
// Size: 0x50
function function_1c601b99() {
    if (isdefined(level.var_1b900c1d)) {
        [[ level.var_1b900c1d ]](getweapon(#"cobra_20mm_comlink"), &function_bff5c062);
    }
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0x56e1a7f7, Offset: 0xb80
// Size: 0x184
function function_bff5c062(helicopter, attackingplayer) {
    helicopter killstreaks::configure_team_internal(attackingplayer, 1);
    helicopter.team = attackingplayer.team;
    helicopter setteam(attackingplayer.team);
    helicopter setowner(attackingplayer);
    helicopter.owner = attackingplayer;
    hackedcallbackpost(attackingplayer);
    helicopter.loopcount = 0;
    if (isdefined(level.var_f1edf93f)) {
        helicopter notify(#"cancel_timeout");
        var_eb79e7c3 = [[ level.var_f1edf93f ]]();
        starttime = gettime();
        duration = int(var_eb79e7c3 * 1000);
        helicopter.halftime = starttime + duration * 0.5;
        helicopter.killstreakendtime = starttime + duration;
        helicopter.endtime = starttime + duration;
        helicopter.var_478039e8 = 0;
        helicopter notify(#"abort_goal");
    }
    attackingplayer thread watchforearlyleave(helicopter);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0xa37eb5e8, Offset: 0xd10
// Size: 0x134
function precachehelicopter(model) {
    level.vehicle_deathmodel[model] = model;
    level.heli_sound[#"hit"] = #"evt_helicopter_hit";
    level.heli_sound[#"hitsecondary"] = #"evt_helicopter_hit";
    level.heli_sound[#"damaged"] = #"null";
    level.heli_sound[#"spinloop"] = #"evt_helicopter_spin_loop";
    level.heli_sound[#"spinstart"] = #"evt_helicopter_spin_start";
    level.heli_sound[#"crash"] = #"evt_helicopter_midair_exp";
    level.heli_sound[#"missilefire"] = #"wpn_hellfire_fire_npc";
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0xc692d63e, Offset: 0xe50
// Size: 0x24
function function_7da89497() {
    self beginlocationcomlinkselection("map_mortar_selector");
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0xaa43e587, Offset: 0xe80
// Size: 0x200
function usekillstreakhelicopter(hardpointtype) {
    if (self killstreakrules::iskillstreakallowed(hardpointtype, self.team) == 0) {
        return false;
    }
    if (!isdefined(level.heli_startnodes) || !level.heli_startnodes.size) {
        /#
            iprintlnbold("inventory_helicopter_comlink");
        #/
        return false;
    }
    level.helilocation = self.origin;
    destination = 0;
    var_cedefdcb = randomint(level.heli_startnodes.size);
    startnode = level.heli_startnodes[var_cedefdcb];
    protectlocation = undefined;
    armored = 0;
    protectlocation = (level.helilocation[0], level.helilocation[1], int(killstreaks::function_43f4782d()));
    killstreak_id = self killstreakrules::killstreakstart(hardpointtype, self.team);
    if (killstreak_id == -1) {
        return false;
    }
    if (isdefined(level.var_34f03cda)) {
        self [[ level.var_34f03cda ]](hardpointtype);
    }
    self namespace_f9b02f80::play_killstreak_start_dialog(hardpointtype, self.team, killstreak_id);
    self thread announcehelicopterinbound(hardpointtype);
    thread heli_think(self, startnode, self.team, protectlocation, hardpointtype, armored, killstreak_id);
    return true;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0xf169f1db, Offset: 0x1088
// Size: 0x54
function announcehelicopterinbound(hardpointtype) {
    team = self.team;
    self stats::function_e24eec31(killstreaks::get_killstreak_weapon(hardpointtype), #"used", 1);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x9545f4c, Offset: 0x10e8
// Size: 0x12c
function heli_path_graph() {
    path_start = getentarray("heli_start", "targetname");
    assert(isdefined(path_start), "<unknown string>");
    var_dc186d06 = struct::get_array("heli_start", "targetname");
    path_start = arraycombine(path_start, var_dc186d06);
    for (i = 0; i < path_start.size; i++) {
        if (isdefined(path_start[i].script_noteworthy) && path_start[i].script_noteworthy == "primary") {
            continue;
        }
        level.heli_startnodes[level.heli_startnodes.size] = path_start[i];
    }
    assert(isdefined(level.heli_startnodes[0]), "<unknown string>");
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0xb338f398, Offset: 0x1220
// Size: 0x682
function heli_update_global_dvars(debug_refresh) {
    do {
        level.heli_loopmax = getdvar(#"scr_heli_loopmax", 2);
        level.heli_missile_rof = getdvar(#"scr_heli_missile_rof", 8);
        level.heli_armor = getdvar(#"scr_heli_armor", 500);
        level.heli_maxhealth = getdvar(#"scr_heli_maxhealth", 2000);
        level.heli_amored_maxhealth = getdvar(#"scr_heli_armored_maxhealth", 1500);
        level.heli_missile_max = getdvar(#"scr_heli_missile_max", 20);
        level.heli_dest_wait = getdvar(#"scr_heli_dest_wait", 8);
        level.heli_debug = getdvar(#"scr_heli_debug", 0);
        level.heli_debug_crash = getdvar(#"scr_heli_debug_crash", 0);
        level.heli_targeting_delay = getdvar(#"scr_heli_targeting_delay", 0.1);
        level.heli_turretreloadtime = getdvar(#"scr_heli_turretreloadtime", 0.5);
        level.heli_turretclipsize = getdvar(#"scr_heli_turretclipsize", 60);
        level.var_c10c27dd = getdvar(#"scr_heli_turretclipsize", 20);
        level.heli_visual_range = isdefined(level.heli_visual_range_override) ? level.heli_visual_range_override : getdvar(#"scr_heli_visual_range", 3500);
        level.heli_missile_range = getdvar(#"scr_heli_missile_range", 100000);
        level.heli_turret_target_cone = getdvar(#"scr_heli_turret_target_cone", 0.6);
        level.heli_target_spawnprotection = getdvar(#"scr_heli_target_spawnprotection", 5);
        level.heli_missile_regen_time = getdvar(#"scr_heli_missile_regen_time", 10);
        level.heli_turret_spinup_delay = getdvar(#"scr_heli_turret_spinup_delay", 0.5);
        level.heli_target_recognition = getdvar(#"scr_heli_target_recognition", 0.2);
        level.heli_missile_friendlycare = getdvar(#"scr_heli_missile_friendlycare", 512);
        level.heli_missile_target_cone = getdvar(#"scr_heli_missile_target_cone", 0.6);
        level.var_a34e186c = getdvar(#"scr_heli_missile_target_cone", 0.9);
        level.heli_valid_target_cone = getdvar(#"scr_heli_missile_valid_target_cone", 0.9);
        level.heli_armor_bulletdamage = getdvar(#"scr_heli_armor_bulletdamage", 0.5);
        level.heli_attract_strength = getdvar(#"scr_heli_attract_strength", 1000);
        level.heli_attract_range = getdvar(#"scr_heli_attract_range", 20000);
        level.helicopterturretmaxangle = getdvar(#"scr_helicopterturretmaxangle", 50);
        level.var_e071ed64 = is_true(getgametypesetting(#"hash_5f76e2d55ad861ed")) && getdvar(#"hash_3910a4196fe6b62e", 1);
        level.heli_protect_radius = getdvarint(#"scr_heli_protect_radius", 3000);
        level.heli_missile_reload_time = getdvar(#"scr_heli_missile_reload_time", 5);
        level.heli_warning_distance = getdvar(#"scr_heli_warning_distance", 500);
        level.var_410ccc21 = getdvar(#"hash_54ea95509bbe1db6", 6000);
        wait(1);
    } while (isdefined(debug_refresh));
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0xe2bfcc40, Offset: 0x18b0
// Size: 0xf4
function set_goal_pos(goalpos, stop) {
    if (!isdefined(self)) {
        return;
    }
    self.heligoalpos = goalpos;
    if (is_true(level.var_e071ed64)) {
        if (issentient(self) && ispathfinder(self)) {
            self setgoal(goalpos, stop);
            self function_a57c34b7(goalpos, stop, 1);
        } else {
            self function_a57c34b7(goalpos, stop, 0);
        }
        return;
    }
    self setgoal(goalpos, stop);
}

// Namespace helicopter/helicopter_shared
// Params 5, eflags: 0x2 linked
// Checksum 0xdae939b4, Offset: 0x19b0
// Size: 0x15c
function function_5145edd2(helicopter, pilot, tag, anim, positionoffset) {
    pilot endon(#"death");
    helicopter endon(#"death", #"crashing");
    pilot useanimtree("all_player");
    pilot linkto(helicopter, tag);
    if (isdefined(positionoffset)) {
        origin = helicopter gettagorigin(tag);
        angles = helicopter gettagangles(tag);
        pilot animation::play(anim, origin + positionoffset, angles, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
        return;
    }
    pilot animation::play(anim, helicopter, tag, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
}

// Namespace helicopter/helicopter_shared
// Params 5, eflags: 0x2 linked
// Checksum 0xad592d70, Offset: 0x1b18
// Size: 0x124
function function_eca18f00(helicopter, var_84c9052b, var_1286d1f7, var_299b0ed5, var_2ab382c7) {
    if (isdefined(var_84c9052b)) {
        pilot = util::spawn_anim_model(#"hash_1918a027c5c6ec0c", helicopter.origin);
        helicopter.var_89cf7991 = [];
        if (isdefined(pilot)) {
            helicopter.var_89cf7991[0] = pilot;
            pilot thread function_5145edd2(helicopter, pilot, "tag_driver", var_84c9052b, var_299b0ed5);
        }
    }
    if (isdefined(var_1286d1f7)) {
        pilot = util::spawn_anim_model(#"hash_71aea3bbaef3e00c", helicopter.origin);
        if (isdefined(pilot)) {
            helicopter.var_89cf7991[1] = pilot;
            pilot thread function_5145edd2(helicopter, pilot, "tag_driver1", var_1286d1f7, var_2ab382c7);
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x857528dc, Offset: 0x1c48
// Size: 0x74
function function_711c140b() {
    if (isdefined(self.var_89cf7991)) {
        if (isdefined(self.var_89cf7991[0])) {
            self.var_89cf7991[0] delete();
        }
        if (isdefined(self.var_89cf7991[1])) {
            self.var_89cf7991[1] delete();
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 7, eflags: 0x2 linked
// Checksum 0x2dff742a, Offset: 0x1cc8
// Size: 0x260
function spawn_helicopter(owner, origin, angles, vehicledef, target_offset, killstreakbundle, killstreak_id) {
    chopper = spawnvehicle(vehicledef, origin, angles);
    chopper setowner(owner);
    chopper.owner = owner;
    chopper clientfield::set("enemyvehicle", 1);
    chopper.attackers = [];
    chopper.attackerdata = [];
    chopper.attackerdamage = [];
    chopper.flareattackerdamage = [];
    chopper.var_ae052a1c = &function_69a7aed9;
    chopper.destroyfunc = &destroyhelicopter;
    chopper.hardpointtype = killstreakbundle.name;
    chopper.killstreak_id = killstreak_id;
    chopper.pilotistalking = 0;
    chopper setdrawinfrared(1);
    chopper.allowcontinuedlockonafterinvis = 1;
    chopper.soundmod = "heli";
    chopper.targetname = "chopper";
    chopper.team = owner.team;
    chopper setteam(owner.team);
    chopper.var_c31213a5 = 1;
    if (!isdefined(target_offset)) {
        target_offset = (0, 0, 0);
    }
    chopper.target_offset = target_offset;
    target_set(chopper, target_offset);
    chopper.var_54b19f55 = 1;
    chopper killstreaks::function_2b6aa9e8(killstreakbundle.var_d3413870);
    chopper.overridevehicledamage = &function_11038a4a;
    chopper.overridevehiclekilled = &function_a459fae8;
    chopper setrotorspeed(1);
    return chopper;
}

// Namespace helicopter/helicopter_shared
// Params 15, eflags: 0x2 linked
// Checksum 0x2b84581a, Offset: 0x1f30
// Size: 0xf2
function function_11038a4a(*einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, *vpoint, *vdir, *shitloc, *vdamageorigin, *psoffsettime, *damagefromunderneath, *modelindex, *partname, *vsurfacenormal) {
    helicopter = self;
    if (partname == "MOD_TRIGGER_HURT") {
        return 0;
    }
    damagefromunderneath = self killstreaks::ondamageperweapon(self.hardpointtype, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal, self.maxhealth, undefined, self.lowhealth, undefined, 0, undefined, 1, 1);
    return damagefromunderneath;
}

// Namespace helicopter/helicopter_shared
// Params 8, eflags: 0x2 linked
// Checksum 0x51eac2d0, Offset: 0x2030
// Size: 0xbc
function function_a459fae8(*einflictor, *eattacker, *idamage, *smeansofdeath, weapon, *vdir, *shitloc, *psoffsettime) {
    if (isdefined(self.owner)) {
        if (isdefined(psoffsettime)) {
            self.owner killstreaks::function_4aad9803(self.killstreaktype, self.killstreak_id, psoffsettime);
        }
        self.owner killstreaks::function_e9873ef7(self.killstreaktype, self.killstreak_id, #"hash_47e685e10dcee57");
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x9f1fb70b, Offset: 0x20f8
// Size: 0x50
function explodeoncontact(*hardpointtype) {
    self endon(#"death");
    wait(10);
    for (;;) {
        self waittill(#"touch");
        self thread heli_explode();
    }
}

// Namespace helicopter/helicopter_shared
// Params 4, eflags: 0x0
// Checksum 0x77bb5df5, Offset: 0x2150
// Size: 0x186
function getvalidprotectlocationstart(random_path, protectlocation, destination, var_aea79ccc = 0) {
    startnode = level.heli_paths[destination][random_path];
    path_index = (random_path + 1) % level.heli_paths[destination].size;
    if (var_aea79ccc) {
        innofly = airsupport::crossesnoflyzone(protectlocation + (0, 0, 1), protectlocation);
        if (isdefined(innofly)) {
            protectlocation = (protectlocation[0], protectlocation[1], level.noflyzones[innofly].origin[2] + level.noflyzones[innofly].height);
        }
        noflyzone = airsupport::crossesnoflyzone(startnode.origin, protectlocation);
        while (isdefined(noflyzone) && path_index != random_path) {
            startnode = level.heli_paths[destination][path_index];
            if (isdefined(noflyzone)) {
                path_index = (path_index + 1) % level.heli_paths[destination].size;
            }
        }
    }
    return level.heli_paths[destination][path_index];
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0xd742f2ec, Offset: 0x22e0
// Size: 0x204
function getvalidrandomleavenode(start, var_aea79ccc = 1) {
    heli_leavenodes = level.heli_startnodes;
    if (self === level.vtol) {
        foreach (node in heli_leavenodes) {
            if (isdefined(node.script_noteworthy) && node.script_noteworthy == "primary") {
                return node;
            }
        }
    }
    random_leave_node = randomint(heli_leavenodes.size);
    leavenode = heli_leavenodes[random_leave_node];
    path_index = (random_leave_node + 1) % heli_leavenodes.size;
    if (var_aea79ccc) {
        noflyzone = airsupport::crossesnoflyzone(leavenode.origin, start);
        isprimary = leavenode.script_noteworthy === "primary";
        while ((isdefined(noflyzone) || isprimary) && path_index != random_leave_node) {
            leavenode = heli_leavenodes[path_index];
            noflyzone = airsupport::crossesnoflyzone(leavenode.origin, start);
            isprimary = leavenode.script_noteworthy === "primary";
            path_index = (path_index + 1) % heli_leavenodes.size;
        }
    }
    return heli_leavenodes[path_index];
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0xc7ef7148, Offset: 0x24f0
// Size: 0x164
function getvalidrandomstartnode(dest, var_aea79ccc = 1) {
    if (!isdefined(level.heli_startnodes) || !level.heli_startnodes.size) {
        return undefined;
    }
    path_index = randomint(level.heli_startnodes.size);
    best_index = path_index;
    if (var_aea79ccc) {
        count = 0;
        for (i = 0; i < level.heli_startnodes.size; i++) {
            startnode = level.heli_startnodes[path_index];
            noflyzone = airsupport::crossesnoflyzone(startnode.origin, dest);
            if (!isdefined(noflyzone)) {
                best_index = path_index;
                if (path_index != level.last_start_node_index) {
                    break;
                }
            }
            path_index = (path_index + 1) % level.heli_startnodes.size;
        }
    }
    level.last_start_node_index = best_index;
    return level.heli_startnodes[best_index];
}

// Namespace helicopter/helicopter_shared
// Params 3, eflags: 0x2 linked
// Checksum 0x3cb1e4eb, Offset: 0x2660
// Size: 0x264
function function_9d99f54c(dest, var_3f25aa93, var_aea79ccc = 1) {
    if (!isdefined(level.heli_startnodes) || !level.heli_startnodes.size) {
        return undefined;
    }
    if (var_aea79ccc) {
        best_dot = -1;
        best_node = undefined;
        foreach (node in level.heli_startnodes) {
            if (!isdefined(airsupport::crossesnoflyzone(node.origin, dest))) {
                var_d9273cbc = vectornormalize(node.origin - dest);
                dot = var_d9273cbc[0] * var_3f25aa93[0] + var_d9273cbc[1] * var_3f25aa93[1];
                if (dot > best_dot) {
                    best_dot = dot;
                    best_node = node;
                }
            }
        }
    } else {
        best_dot = -1;
        best_node = undefined;
        foreach (node in level.heli_startnodes) {
            var_d9273cbc = vectornormalize(node.origin - dest);
            dot = var_d9273cbc[0] * var_3f25aa93[0] + var_d9273cbc[1] * var_3f25aa93[1];
            if (dot > best_dot) {
                best_dot = dot;
                best_node = node;
            }
        }
    }
    return best_node;
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0xaf477114, Offset: 0x28d0
// Size: 0x3c
function configureteampost(owner, *ishacked) {
    chopper = self;
    ishacked thread watchforearlyleave(chopper);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x728918f0, Offset: 0x2918
// Size: 0x4c
function hackedcallbackpost(*hacker) {
    heli = self;
    if (isdefined(heli.flak_drone)) {
        heli.flak_drone flak_drone::configureteam(heli, 1);
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x1b2af028, Offset: 0x2970
// Size: 0x5e
function function_76f530c7(killstreakbundle) {
    self.var_5efaff3e = killstreakbundle.var_24b7aa85;
    self.var_ba5009c3 = killstreakbundle.var_8334e8e;
    self.explosionfx = killstreakbundle.ksexplosionfx;
    self.var_bdbe8391 = killstreakbundle.var_2a77dc37;
    self.var_78d69212 = killstreakbundle.var_822879a1;
}

// Namespace helicopter/helicopter_shared
// Params 7, eflags: 0x2 linked
// Checksum 0xca91999f, Offset: 0x29d8
// Size: 0x624
function heli_think(owner, startnode, heli_team, protectlocation, killstreakbundlename, armored, killstreak_id) {
    killstreakbundle = killstreaks::get_script_bundle(killstreakbundlename);
    assert(isdefined(killstreakbundle));
    assert(isdefined(killstreakbundle.var_9b315b3f));
    chopper = spawn_helicopter(owner, startnode.origin, startnode.angles, killstreakbundle.var_9b315b3f, (0, 0, 100), killstreakbundle, killstreak_id);
    chopper killstreak_bundles::spawned(killstreakbundle);
    chopper.killstreakbundle = killstreakbundle;
    chopper.hardpointtype = killstreakbundlename;
    chopper clientfield::set("scorestreakActive", 1);
    chopper function_76f530c7(killstreakbundle);
    chopper thread function_eca18f00(chopper, killstreakbundle.var_f90029e2, killstreakbundle.var_71fa8cb2);
    chopper killstreaks::configure_team(killstreakbundlename, killstreak_id, owner, "helicopter", undefined, &configureteampost);
    chopper killstreakrules::function_2e6ff61a(chopper.hardpointtype, killstreak_id, chopper);
    level.vehicle_death_thread[chopper.vehicletype] = level.var_6af968ce;
    if (isdefined(chopper.flak_drone)) {
        chopper.flak_drone flak_drone::configureteam(chopper, 0);
    }
    chopper killstreak_hacking::enable_hacking("helicopter_comlink", undefined, &hackedcallbackpost);
    chopper thread watchforemp();
    chopper thread killstreaks::player_killstreak_threat_tracking(chopper.hardpointtype, 0.866025);
    chopper.requireddeathcount = owner.deathcount;
    minigun_snd_ent = spawn("script_origin", chopper gettagorigin("tag_flash"));
    minigun_snd_ent linkto(chopper, "tag_flash", (0, 0, 0), (0, 0, 0));
    chopper.minigun_snd_ent = minigun_snd_ent;
    minigun_snd_ent thread autostopsound();
    chopper thread heli_existance();
    chopper.reached_dest = 0;
    if (armored) {
        chopper.maxhealth = level.heli_amored_maxhealth;
    } else {
        chopper.maxhealth = level.heli_maxhealth;
    }
    chopper.numflares = 1;
    chopper.flareoffset = (0, 0, -256);
    chopper.waittime = level.heli_dest_wait;
    chopper.loopcount = 0;
    chopper.evasive = 0;
    chopper.health_bulletdamageble = level.heli_armor;
    chopper.health_evasive = level.heli_armor;
    chopper.targeting_delay = level.heli_targeting_delay;
    chopper.primarytarget = undefined;
    chopper.var_9ddb1534 = undefined;
    chopper.secondarytarget = undefined;
    chopper.attacker = undefined;
    chopper.missile_ammo = level.heli_missile_max;
    chopper.currentstate = "ok";
    chopper.lastrocketfiretime = -1;
    chopper.var_aa1e3902 = 1;
    chopper thread heli_protect(startnode, protectlocation, killstreakbundlename, heli_team);
    chopper clientfield::set("heli_comlink_bootup_anim", 1);
    chopper namespace_f9b02f80::play_pilot_dialog_on_owner("arrive", killstreakbundlename, killstreak_id);
    chopper thread wait_for_killed();
    chopper thread heli_health(killstreakbundlename);
    missilesenabled = isdefined(chopper.killstreakbundle.var_eda20f66) ? chopper.killstreakbundle.var_eda20f66 : 0;
    chopper thread attack_targets(missilesenabled, killstreakbundlename, 1);
    chopper thread heli_targeting(missilesenabled, killstreakbundlename);
    chopper thread heli_missile_regen();
    chopper thread targetting_delay::function_7e1a12ce(killstreakbundle.var_2aeadfa0);
    chopper thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile(killstreakbundle, "crashing", "death");
    chopper thread create_flare_ent((0, 0, -150));
    chopper thread function_d4896942();
    chopper thread function_9440face();
    chopper killstreaks::function_b182645e(owner, killstreakbundlename);
    chopper thread function_b3d1e178();
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0xa3e394ed, Offset: 0x3008
// Size: 0x44
function function_b3d1e178() {
    self endon(#"death");
    level waittill(#"game_ended");
    self destroyhelicopter(0);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x4aba9578, Offset: 0x3058
// Size: 0x44
function autostopsound() {
    self endon(#"death");
    level waittill(#"game_ended");
    self stoploopsound();
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0xf9de43b5, Offset: 0x30a8
// Size: 0x3c
function heli_existance() {
    self endon(#"death");
    self waittill(#"leaving");
    self influencers::remove_influencers();
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0xaa008dc3, Offset: 0x30f0
// Size: 0x94
function create_flare_ent(offset) {
    self.flare_ent = spawn("script_model", self gettagorigin("tag_origin"));
    self.flare_ent setmodel(#"tag_origin");
    self.flare_ent linkto(self, "tag_origin", offset);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x58926720, Offset: 0x3190
// Size: 0x160
function heli_missile_regen() {
    self endon(#"death", #"crashing", #"leaving");
    for (;;) {
        /#
            airsupport::debug_print3d("<unknown string>" + self.missile_ammo, (0.5, 0.5, 1), self, (0, 0, -100), 0);
        #/
        if (self.missile_ammo >= level.heli_missile_max) {
            self waittill(#"missile fired");
        } else if (self.currentstate == "heavy smoke") {
            wait(level.heli_missile_regen_time / 4);
        } else if (self.currentstate == "light smoke") {
            wait(level.heli_missile_regen_time / 2);
        } else {
            wait(level.heli_missile_regen_time);
        }
        if (self.missile_ammo < level.heli_missile_max) {
            self.missile_ammo++;
        }
        if (is_true(level.var_e80a117f)) {
            level waittill(#"hash_22962c7c3ae16f30");
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0x67d958bd, Offset: 0x32f8
// Size: 0x6f0
function heli_targeting(missilesenabled, hardpointtype) {
    self endon(#"death", #"crashing", #"leaving");
    for (;;) {
        targets = [];
        targetsmissile = [];
        var_997d5bf1 = [];
        players = level.players;
        for (i = 0; i < players.size; i++) {
            player = players[i];
            if (self cantargetplayer_turret(player, hardpointtype)) {
                if (isdefined(player)) {
                    targets[targets.size] = player;
                }
            }
            if (missilesenabled && self cantargetplayer_missile(player, hardpointtype)) {
                if (isdefined(player)) {
                    targetsmissile[targetsmissile.size] = player;
                }
            }
        }
        if (missilesenabled) {
            vehicles = getentarray("chopper", "targetname");
            for (i = 0; i < vehicles.size; i++) {
                if (function_6c2ca54f(vehicles[i], hardpointtype)) {
                    targetsmissile[targetsmissile.size] = vehicles[i];
                }
            }
        }
        tanks = getentarray("talon", "targetname");
        foreach (tank in tanks) {
            if (self cantargettank_turret(tank)) {
                targets[targets.size] = tank;
            }
        }
        actors = getactorarray();
        foreach (actor in actors) {
            if (isdefined(actor) && isactor(actor) && isalive(actor)) {
                if (self cantargetactor_turret(actor, hardpointtype)) {
                    targets[targets.size] = actor;
                }
            }
        }
        if (!missilesenabled) {
            vehicles = getentarray("chopper", "targetname");
            for (i = 0; i < vehicles.size; i++) {
                if (function_7ebe7b18(vehicles[i], hardpointtype)) {
                    var_997d5bf1[var_997d5bf1.size] = vehicles[i];
                }
            }
        }
        if (targets.size == 0 && targetsmissile.size == 0 && var_997d5bf1.size == 0) {
            self.primarytarget = undefined;
            self.secondarytarget = undefined;
            /#
                debug_print_target();
            #/
            wait(self.targeting_delay);
            continue;
        }
        if (targets.size == 1) {
            if (isdefined(targets[0].type) && (targets[0].type == "dog" || targets[0].type == "tank_drone")) {
                killstreaks::update_dog_threat(targets[0]);
            } else if (isactor(targets[0])) {
                killstreaks::update_actor_threat(targets[0]);
            } else {
                killstreaks::update_player_threat(targets[0]);
            }
            self.primarytarget = targets[0];
            self notify(#"primary acquired");
            self.secondarytarget = undefined;
            /#
                debug_print_target();
            #/
        } else if (targets.size > 1) {
            assignprimarytargets(targets);
        }
        if (targetsmissile.size == 1) {
            if (!isdefined(targetsmissile[0].type) || targetsmissile[0].type != "dog" || targets[0].type == "tank_drone") {
                self killstreaks::update_missile_player_threat(targetsmissile[0]);
            } else if (targetsmissile[0].type == "dog") {
                self killstreaks::update_missile_dog_threat(targetsmissile[0]);
            }
            self.secondarytarget = targetsmissile[0];
            self notify(#"secondary acquired");
            /#
                debug_print_target();
            #/
        } else if (targetsmissile.size > 1) {
            assignsecondarytargets(targetsmissile);
        }
        if (var_997d5bf1.size) {
            if (function_7078bd6e(self)) {
                self.var_9ddb1534 = arraygetclosest(self.origin, var_997d5bf1, level.var_410ccc21);
                self notify(#"hash_27ba79e760b6494f");
            }
        }
        wait(self.targeting_delay);
        /#
            debug_print_target();
        #/
    }
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0x9ddd249f, Offset: 0x39f0
// Size: 0x2bc
function cantargetplayer_turret(player, hardpointtype) {
    if (!isalive(player) || player.sessionstate != "playing") {
        return false;
    }
    if (player.ignoreme === 1) {
        return false;
    }
    if (player == self.owner) {
        self check_owner(hardpointtype);
        return false;
    }
    if (player isnotarget()) {
        return false;
    }
    if (player airsupport::cantargetplayerwithspecialty() == 0) {
        return false;
    }
    if (distance(player.origin, self.origin) > self.killstreakbundle.var_ddd44b49) {
        return false;
    }
    if (!isdefined(player.team)) {
        return false;
    }
    if (!util::function_fbce7263(player.team, self.team)) {
        return false;
    }
    if (player.team == #"spectator") {
        return false;
    }
    if (isdefined(player.spawntime) && float(gettime() - player.spawntime) / 1000 <= level.heli_target_spawnprotection) {
        return false;
    }
    heli_centroid = self.origin + (0, 0, -160);
    heli_forward_norm = anglestoforward(self.angles);
    heli_turret_point = heli_centroid + 144 * heli_forward_norm;
    visible_amount = player sightconetrace(heli_turret_point, self);
    if (visible_amount < level.heli_target_recognition) {
        return false;
    }
    var_2910def0 = self targetting_delay::function_1c169b3a(player);
    targetting_delay::function_a4d6d6d8(player, int((isdefined(self.targeting_delay) ? self.targeting_delay : 0.25) * 1000));
    if (!var_2910def0) {
        return false;
    }
    return true;
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0x2014c571, Offset: 0x3cb8
// Size: 0x15e
function cantargetactor_turret(actor, *hardpointtype) {
    helicopter = self;
    cantarget = 1;
    if (!isalive(hardpointtype)) {
        return 0;
    }
    if (!isdefined(hardpointtype.team)) {
        return 0;
    }
    if (!util::function_fbce7263(hardpointtype.team, helicopter.team)) {
        return 0;
    }
    if (distancesquared(hardpointtype.origin, helicopter.origin) > level.heli_visual_range * level.heli_visual_range) {
        return 0;
    }
    heli_centroid = helicopter.origin + (0, 0, -160);
    heli_forward_norm = anglestoforward(helicopter.angles);
    heli_turret_point = heli_centroid + 144 * heli_forward_norm;
    visible_amount = hardpointtype sightconetrace(heli_turret_point, helicopter);
    if (visible_amount < level.heli_target_recognition) {
        return 0;
    }
    return cantarget;
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0x2cdda06d, Offset: 0x3e20
// Size: 0x14e
function function_7ebe7b18(heli, *hardpointtype) {
    helicopter = self;
    if (!isalive(hardpointtype)) {
        return false;
    }
    if (!isdefined(hardpointtype.team)) {
        return false;
    }
    if (!util::function_fbce7263(hardpointtype.team, helicopter.team)) {
        return false;
    }
    if (distancesquared(hardpointtype.origin, helicopter.origin) > level.heli_visual_range * level.heli_visual_range) {
        return false;
    }
    heli_centroid = helicopter.origin + (0, 0, -160);
    heli_forward_norm = anglestoforward(helicopter.angles);
    heli_turret_point = heli_centroid + 144 * heli_forward_norm;
    visible_amount = hardpointtype sightconetrace(heli_turret_point, helicopter);
    if (visible_amount < level.heli_target_recognition) {
        return false;
    }
    return true;
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0x2306faca, Offset: 0x3f78
// Size: 0x146
function function_6c2ca54f(vehicle, *hardpointtype) {
    if (!isalive(hardpointtype)) {
        return false;
    }
    if (hardpointtype.ignoreme === 1) {
        return false;
    }
    if (distance(hardpointtype.origin, self.origin) > self.killstreakbundle.var_f6f22acf) {
        return false;
    }
    if (!isdefined(hardpointtype.team)) {
        return false;
    }
    if (!isdefined(hardpointtype.owner)) {
        return false;
    }
    if (level.teambased && !util::function_fbce7263(hardpointtype.team, self.team)) {
        return false;
    }
    heli_centroid = self.origin + (0, 0, -160);
    heli_forward_norm = anglestoforward(self.angles);
    heli_turret_point = heli_centroid + 144 * heli_forward_norm;
    return true;
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0x294a8ad0, Offset: 0x40c8
// Size: 0x2a2
function cantargetplayer_missile(player, hardpointtype) {
    if (!isalive(player) || player.sessionstate != "playing") {
        return false;
    }
    if (player.ignoreme === 1) {
        return false;
    }
    if (player == self.owner) {
        self check_owner(hardpointtype);
        return false;
    }
    if (player airsupport::cantargetplayerwithspecialty() == 0) {
        return false;
    }
    if (distance(player.origin, self.origin) > self.killstreakbundle.var_f6f22acf) {
        return false;
    }
    if (!isdefined(player.team)) {
        return false;
    }
    if (level.teambased && !util::function_fbce7263(player.team, self.team)) {
        return false;
    }
    if (player.team == #"spectator") {
        return false;
    }
    if (isdefined(player.spawntime) && float(gettime() - player.spawntime) / 1000 <= level.heli_target_spawnprotection) {
        return false;
    }
    if (self target_cone_check(player, level.heli_missile_target_cone) == 0) {
        return false;
    }
    if (self targetting_delay::function_1c169b3a(player) == 0) {
        return false;
    }
    heli_centroid = self.origin + (0, 0, -160);
    heli_forward_norm = anglestoforward(self.angles);
    heli_turret_point = heli_centroid + 144 * heli_forward_norm;
    if (!isdefined(player.lasthit)) {
        player.lasthit = 0;
    }
    player.lasthit = self heliturretsighttrace(heli_turret_point, player, player.lasthit);
    if (player.lasthit != 0) {
        return false;
    }
    return true;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x650787af, Offset: 0x4378
// Size: 0x18a
function cantargetdog_turret(dog) {
    cantarget = 1;
    if (!isdefined(dog)) {
        return 0;
    }
    if (distance(dog.origin, self.origin) > level.heli_visual_range) {
        return 0;
    }
    if (!isdefined(dog.team)) {
        return 0;
    }
    if (level.teambased && !util::function_fbce7263(dog.team, self.team)) {
        return 0;
    }
    if (isdefined(dog.script_owner) && self.owner == dog.script_owner) {
        return 0;
    }
    heli_centroid = self.origin + (0, 0, -160);
    heli_forward_norm = anglestoforward(self.angles);
    heli_turret_point = heli_centroid + 144 * heli_forward_norm;
    if (!isdefined(dog.lasthit)) {
        dog.lasthit = 0;
    }
    dog.lasthit = self heliturretdogtrace(heli_turret_point, dog, dog.lasthit);
    if (dog.lasthit != 0) {
        return 0;
    }
    return cantarget;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x1f2d7d0, Offset: 0x4510
// Size: 0x18a
function cantargetdog_missile(dog) {
    cantarget = 1;
    if (!isdefined(dog)) {
        return 0;
    }
    if (distance(dog.origin, self.origin) > level.heli_missile_range) {
        return 0;
    }
    if (!isdefined(dog.team)) {
        return 0;
    }
    if (level.teambased && !util::function_fbce7263(dog.team, self.team)) {
        return 0;
    }
    if (isdefined(dog.script_owner) && self.owner == dog.script_owner) {
        return 0;
    }
    heli_centroid = self.origin + (0, 0, -160);
    heli_forward_norm = anglestoforward(self.angles);
    heli_turret_point = heli_centroid + 144 * heli_forward_norm;
    if (!isdefined(dog.lasthit)) {
        dog.lasthit = 0;
    }
    dog.lasthit = self heliturretdogtrace(heli_turret_point, dog, dog.lasthit);
    if (dog.lasthit != 0) {
        return 0;
    }
    return cantarget;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x39185382, Offset: 0x46a8
// Size: 0xd2
function cantargettank_turret(tank) {
    cantarget = 1;
    if (!isdefined(tank)) {
        return 0;
    }
    if (distance(tank.origin, self.origin) > level.heli_visual_range) {
        return 0;
    }
    if (!isdefined(tank.team)) {
        return 0;
    }
    if (level.teambased && !util::function_fbce7263(tank.team, self.team)) {
        return 0;
    }
    if (isdefined(tank.owner) && self.owner == tank.owner) {
        return 0;
    }
    return cantarget;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x9fd844be, Offset: 0x4788
// Size: 0x216
function assignprimarytargets(targets) {
    for (idx = 0; idx < targets.size; idx++) {
        if (isdefined(targets[idx].type) && targets[idx].type == "dog") {
            killstreaks::update_dog_threat(targets[idx]);
            continue;
        }
        if (isactor(targets[idx])) {
            killstreaks::update_actor_threat(targets[idx]);
            continue;
        }
        if (isplayer(targets[idx])) {
            killstreaks::update_player_threat(targets[idx]);
            continue;
        }
        killstreaks::update_non_player_threat(targets[idx]);
    }
    assert(targets.size >= 2, "<unknown string>");
    highest = 0;
    second_highest = 0;
    primarytarget = undefined;
    for (idx = 0; idx < targets.size; idx++) {
        assert(isdefined(targets[idx].threatlevel), "<unknown string>");
        if (targets[idx].threatlevel >= highest) {
            highest = targets[idx].threatlevel;
            primarytarget = targets[idx];
        }
    }
    assert(isdefined(primarytarget), "<unknown string>");
    self.primarytarget = primarytarget;
    self notify(#"primary acquired");
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x887b5c1a, Offset: 0x49a8
// Size: 0x206
function assignsecondarytargets(targets) {
    for (idx = 0; idx < targets.size; idx++) {
        if (isvehicle(targets[idx])) {
            killstreaks::function_6d23c51c(targets[idx]);
            continue;
        }
        if (!isdefined(targets[idx].type)) {
            self killstreaks::update_missile_player_threat(targets[idx]);
            continue;
        }
        if (targets[idx].type == "dog" || targets[0].type == "tank_drone") {
            killstreaks::update_missile_dog_threat(targets[idx]);
        }
    }
    assert(targets.size >= 2, "<unknown string>");
    highest = 0;
    second_highest = 0;
    primarytarget = undefined;
    secondarytarget = undefined;
    for (idx = 0; idx < targets.size; idx++) {
        assert(isdefined(targets[idx].missilethreatlevel), "<unknown string>");
        if (targets[idx].missilethreatlevel >= highest) {
            highest = targets[idx].missilethreatlevel;
            secondarytarget = targets[idx];
        }
    }
    assert(isdefined(secondarytarget), "<unknown string>");
    self.secondarytarget = secondarytarget;
    self notify(#"secondary acquired");
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0xfe3c3697, Offset: 0x4bb8
// Size: 0x8c
function heli_reset() {
    self cleartargetyaw();
    self cleargoalyaw();
    self setyawspeed(75, 45, 45);
    self setmaxpitchroll(10, 30);
    self setneargoalnotifydist(256);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x68e3b111, Offset: 0x4c50
// Size: 0x7e
function heli_wait(waittime) {
    self endon(#"death", #"crashing", #"evasive");
    self thread heli_hover();
    wait(waittime);
    heli_reset();
    self notify(#"stop hover");
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x482134e8, Offset: 0x4cd8
// Size: 0x9c
function heli_hover() {
    self endon(#"death", #"stop hover", #"evasive", #"leaving", #"crashing");
    randint = randomint(360);
    self setgoalyaw(self.angles[1] + randint);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0xa2d248d0, Offset: 0x4d80
// Size: 0x170
function wait_for_killed() {
    self endon(#"death", #"crashing", #"leaving");
    self.bda = 0;
    while (true) {
        waitresult = self waittill(#"killed", #"destroyedaircraft");
        if (waitresult._notify == "destroyedAircraft") {
            self namespace_f9b02f80::play_pilot_dialog_on_owner("killAircraft", self.killstreaktype, self.killstreak_id);
            continue;
        }
        victim = waitresult.victim;
        if (!isdefined(self.owner) || !isdefined(victim)) {
            continue;
        }
        if (self.owner == victim) {
            continue;
        }
        if (level.teambased && !util::function_fbce7263(self.owner.team, victim.team)) {
            continue;
        }
        self thread wait_for_bda_timeout();
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x609084ae, Offset: 0x4ef8
// Size: 0x3c
function wait_for_bda_timeout() {
    self endon(#"killed");
    wait(2.5);
    if (!isdefined(self)) {
        return;
    }
    self play_bda_dialog();
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x495cd2c8, Offset: 0x4f40
// Size: 0xe2
function play_bda_dialog() {
    if (self.bda == 1) {
        bdadialog = "kill1";
    } else if (self.bda == 2) {
        bdadialog = "kill2";
    } else if (self.bda == 3) {
        bdadialog = "kill3";
    } else if (self.bda > 3) {
        bdadialog = "killMultiple";
    }
    self namespace_f9b02f80::play_pilot_dialog_on_owner(bdadialog, self.killstreaktype, self.killstreak_id);
    self notify(#"bda_dialog", {#dialog_key:bdadialog});
    self.bda = 0;
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x27c25cc4, Offset: 0x5030
// Size: 0x84
function function_d4896942() {
    chopper = self;
    chopper endon(#"death", #"attack_chopper_shutdown");
    chopper waittill(#"flare_deployed");
    self namespace_f9b02f80::play_pilot_dialog_on_owner("damageEvaded", chopper.killstreaktype, chopper.killstreak_id);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x65009c53, Offset: 0x50c0
// Size: 0x84
function function_9440face() {
    chopper = self;
    chopper endon(#"death", #"attack_chopper_shutdown");
    chopper waittill(#"evasive");
    self namespace_f9b02f80::play_pilot_dialog_on_owner("evasiveAction", chopper.killstreaktype, chopper.killstreak_id);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0xe6835e0e, Offset: 0x5150
// Size: 0x6e
function heli_hacked_health_update(*hacker) {
    helicopter = self;
    hackeddamagetaken = helicopter.maxhealth - helicopter.hackedhealth;
    assert(hackeddamagetaken > 0);
    if (hackeddamagetaken > helicopter.damagetaken) {
        helicopter.damagetaken = hackeddamagetaken;
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0xd4879dbe, Offset: 0x51c8
// Size: 0x96a
function heli_damage_monitor(hardpointtype) {
    helicopter = self;
    self endon(#"death", #"crashing");
    self.damagetaken = 0;
    last_hit_vo = 0;
    hit_vo_spacing = 6000;
    helicopter.hackedhealthupdatecallback = &heli_hacked_health_update;
    helicopter.hackedhealth = killstreak_bundles::get_hacked_health(hardpointtype);
    if (!isdefined(self.attackerdata)) {
        self.attackers = [];
        self.attackerdata = [];
        self.attackerdamage = [];
        self.flareattackerdamage = [];
    }
    for (;;) {
        waitresult = self waittill(#"damage");
        attacker = waitresult.attacker;
        weapon = waitresult.weapon;
        damage = waitresult.amount;
        type = waitresult.mod;
        flags = waitresult.flags;
        chargelevel = waitresult.chargelevel;
        if (!isdefined(attacker) || !isplayer(attacker)) {
            continue;
        }
        heli_friendlyfire = damage::friendlyfirecheck(self.owner, attacker);
        if (!heli_friendlyfire) {
            continue;
        }
        if (!level.hardcoremode) {
            if (isdefined(self.owner) && attacker == self.owner) {
                continue;
            }
            if (level.teambased) {
                isvalidattacker = isdefined(attacker.team) && util::function_fbce7263(attacker.team, self.team);
            } else {
                isvalidattacker = 1;
            }
            if (!isvalidattacker) {
                continue;
            }
        }
        weapon_damage = killstreak_bundles::get_weapon_damage(hardpointtype, self.maxhealth, attacker, weapon, type, damage, flags, chargelevel);
        if (!isdefined(weapon_damage)) {
            weapon_damage = killstreaks::get_old_damage(attacker, weapon, type, damage, 1, level.var_926d9f1);
        }
        self.damagetaken += weapon_damage;
        playercontrolled = 0;
        if (self.damagetaken > self.maxhealth && !isdefined(self.xpgiven)) {
            self.xpgiven = 1;
            switch (hardpointtype) {
            case #"helicopter_comlink":
            case #"inventory_helicopter_comlink":
                event = "attack_chopper_shutdown";
                if (self.leaving !== 1) {
                    self namespace_f9b02f80::play_destroyed_dialog_on_owner(self.killstreaktype, self.killstreak_id);
                    attacker notify(#"destroyedaircraft");
                }
                break;
            case #"supply_drop":
            case #"supply_drop_combat_robot":
                if (isdefined(helicopter.killstreakweaponname)) {
                    switch (helicopter.killstreakweaponname) {
                    case #"tank_robot":
                    case #"ai_tank_drop_marker":
                    case #"inventory_ai_tank_marker":
                    case #"inventory_tank_robot":
                    case #"ai_tank_marker":
                        event = "destroyed_helicopter_agr_drop";
                        break;
                    case #"combat_robot_marker":
                    case #"inventory_combat_robot_marker":
                    case #"combat_robot_drop":
                    case #"inventory_combat_robot_drop":
                        event = "destroyed_helicopter_giunit_drop";
                        break;
                    default:
                        event = "care_package_shutdown";
                        self namespace_f9b02f80::play_destroyed_dialog_on_owner(self.killstreaktype, self.killstreak_id);
                        attacker notify(#"destroyedaircraft");
                        break;
                    }
                } else {
                    event = "care_package_shutdown";
                }
                break;
            }
            if (isdefined(level.var_4d5e1035)) {
                self [[ level.var_4d5e1035 ]](attacker, weapon, type, weapon_damage, event, playercontrolled, hardpointtype);
            }
            weaponstatname = #"destroyed";
            switch (weapon.name) {
            case #"tow_turret":
            case #"tow_turret_drop":
            case #"auto_tow":
                weaponstatname = #"kills";
                break;
            }
            attacker stats::function_e24eec31(weapon, weaponstatname, 1);
            notifystring = undefined;
            killstreakreference = undefined;
            switch (hardpointtype) {
            case #"helicopter_player_firstperson":
                killstreakreference = "killstreak_helicopter_player_firstperson";
                break;
            case #"helicopter_x2":
            case #"helicopter_comlink":
            case #"helicopter":
            case #"inventory_helicopter_comlink":
                notifystring = #"hash_286f843fea185e5";
                killstreakreference = "killstreak_helicopter_comlink";
                break;
            case #"supply_drop":
                notifystring = #"hash_3267fdfd0c2b7fdc";
                killstreakreference = "killstreak_supply_drop";
                break;
            case #"helicopter_guard":
                killstreakreference = "killstreak_helicopter_guard";
                break;
            }
            if (isdefined(killstreakreference)) {
                level.globalkillstreaksdestroyed++;
                attacker stats::function_e24eec31(getweapon(hardpointtype), #"destroyed", 1);
            }
            if (hardpointtype == "helicopter_player_gunner") {
                self.owner sendkillstreakdamageevent(600);
            }
            if (isdefined(notifystring)) {
                luinotifyevent(#"player_callout", 2, notifystring, attacker.entnum);
            }
            if (isdefined(self.attackers)) {
                for (j = 0; j < self.attackers.size; j++) {
                    player = self.attackers[j];
                    if (!isdefined(player)) {
                        continue;
                    }
                    if (player == attacker) {
                        continue;
                    }
                    flare_done = self.flareattackerdamage[player.clientid];
                    if (isdefined(flare_done) && flare_done == 1) {
                        scoreevents::processscoreevent(#"aircraft_flare_assist", player, undefined, undefined);
                        continue;
                    }
                    damage_done = self.attackerdamage[player.clientid];
                    player thread processcopterassist(self, damage_done);
                }
                self.attackers = [];
            }
            attacker notify(#"destroyed_helicopter");
            if (target_istarget(self)) {
                target_remove(self);
            }
        } else if (isdefined(self.owner) && isplayer(self.owner)) {
            if (last_hit_vo + hit_vo_spacing < gettime()) {
                if (type == "MOD_PROJECTILE" || randomintrange(0, 3) == 0) {
                    last_hit_vo = gettime();
                }
            }
        }
        if (hardpointtype == "helicopter_comlink" || hardpointtype == "inventory_helicopter_comlink") {
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x90dac855, Offset: 0x5b40
// Size: 0x7c
function init_active_camo() {
    heli = self;
    heli.active_camo_damage = 0;
    heli.active_camo_disabled = 0;
    heli.camo_state = 0;
    heli_set_active_camo_state(1);
    if (isdefined(heli.flak_drone)) {
        heli.flak_drone flak_drone::setcamostate(1);
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x9bdd5d36, Offset: 0x5bc8
// Size: 0x23c
function heli_set_active_camo_state(state) {
    heli = self;
    if (!isdefined(heli.active_camo_supported)) {
        return;
    }
    if (state == 0) {
        heli clientfield::set("toggle_lights", 1);
        if (heli.camo_state == 1) {
            heli playsound(#"veh_hind_cloak_off");
        }
        heli.camo_state = 0;
        heli.camo_state_switch_time = gettime();
    } else if (state == 1) {
        if (heli.active_camo_disabled) {
            return;
        }
        heli clientfield::set("toggle_lights", 0);
        if (heli.camo_state == 0) {
            heli playsound(#"veh_hind_cloak_on");
        }
        heli.camo_state = 1;
        heli.camo_state_switch_time = gettime();
        if (isdefined(heli.owner)) {
            if (isdefined(heli.play_camo_dialog) && heli.play_camo_dialog) {
                heli namespace_f9b02f80::play_pilot_dialog_on_owner("activateCounter", "helicopter_comlink", self.killstreak_id);
                heli.play_camo_dialog = 0;
            } else if (!isdefined(heli.play_camo_dialog)) {
                heli.play_camo_dialog = 1;
            }
        }
    } else if (state == 2) {
        heli clientfield::set("toggle_lights", 1);
    }
    if (isdefined(heli.flak_drone)) {
        heli.flak_drone flak_drone::setcamostate(state);
    }
    heli clientfield::set("active_camo", state);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xf917b37e, Offset: 0x5e10
// Size: 0xc4
function heli_active_camo_damage_update(damage) {
    self endon(#"death", #"crashing");
    heli = self;
    heli.active_camo_damage += damage;
    if (heli.active_camo_damage > 100) {
        heli.active_camo_disabled = 1;
        heli thread heli_active_camo_damage_disable();
        return;
    }
    heli heli_set_active_camo_state(2);
    wait(1);
    heli heli_set_active_camo_state(1);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0xc8eef2cf, Offset: 0x5ee0
// Size: 0xac
function heli_active_camo_damage_disable() {
    self endon(#"death", #"crashing");
    heli = self;
    heli notify(#"heli_active_camo_damage_disable");
    heli endon(#"heli_active_camo_damage_disable");
    heli heli_set_active_camo_state(0);
    wait(10);
    heli.active_camo_damage = 0;
    heli.active_camo_disabled = 0;
    heli heli_set_active_camo_state(1);
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0xfee8dc64, Offset: 0x5f98
// Size: 0x282
function heli_health(hardpointtype, playernotify) {
    self endon(#"death", #"crashing");
    self.currentstate = "ok";
    self.laststate = "ok";
    damagestate = 3;
    for (;;) {
        self waittill(#"damage");
        waitframe(1);
        if (!isdefined(self.damagetaken)) {
            waitframe(1);
            continue;
        }
        if (!is_true(self.var_5b3f091f) && self.damagetaken >= self.maxhealth * 0.5) {
            self namespace_f9b02f80::play_pilot_dialog_on_owner("damaged", "helicopter_comlink", self.killstreak_id);
            self.var_5b3f091f = 1;
        }
        if (self.damagetaken > self.maxhealth) {
            damagestate = 0;
            self heli_set_active_camo_state(0);
            self thread function_ae4b9a81(hardpointtype, self.owner, playernotify);
            continue;
        }
        if (self.damagetaken >= self.maxhealth * 0.66 && damagestate >= 2) {
            if (isdefined(self.var_ba5009c3)) {
                playfxontag(self.var_ba5009c3, self, "tag_body");
            }
            damagestate = 1;
            self.currentstate = "heavy smoke";
            self.evasive = 1;
            self notify(#"damage state");
            continue;
        }
        if (self.damagetaken >= self.maxhealth * 0.33 && damagestate == 3) {
            if (isdefined(self.var_5efaff3e)) {
                playfxontag(self.var_5efaff3e, self, "tag_body");
            }
            damagestate = 2;
            self.currentstate = "light smoke";
            self notify(#"damage state");
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 3, eflags: 0x2 linked
// Checksum 0x6108bb8d, Offset: 0x6228
// Size: 0x5a
function notify_player(player, playernotify, delay) {
    if (!isdefined(player)) {
        return;
    }
    if (!isdefined(playernotify)) {
        return;
    }
    player endon(#"disconnect", playernotify);
    wait(delay);
    player notify(playernotify);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x8cf637c8, Offset: 0x6290
// Size: 0x3e
function play_going_down_vo(delay) {
    self.owner endon(#"disconnect");
    self endon(#"death");
    wait(delay);
}

// Namespace helicopter/helicopter_shared
// Params 3, eflags: 0x2 linked
// Checksum 0xb9ef76, Offset: 0x62d8
// Size: 0x144
function function_ae4b9a81(hardpointtype, player, playernotify) {
    self endon(#"death");
    self notify(#"crashing");
    self influencers::remove_influencers();
    self stoploopsound(0);
    if (isdefined(self.minigun_snd_ent)) {
        self.minigun_snd_ent stoploopsound();
    }
    if (isdefined(self.alarm_snd_ent)) {
        self.alarm_snd_ent stoploopsound();
    }
    thread notify_player(player, playernotify, 0);
    self thread heli_explode();
    self thread explodeoncontact(hardpointtype);
    time = randomintrange(4, 6);
    self thread waitthenexplode(time);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x16367ac7, Offset: 0x6428
// Size: 0x34
function damagedrotorfx() {
    self endon(#"death");
    self setrotorspeed(0.6);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x1032c66, Offset: 0x6468
// Size: 0x3c
function waitthenexplode(time) {
    self endon(#"death");
    wait(time);
    self thread heli_explode();
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x52f1c9f2, Offset: 0x64b0
// Size: 0x9e
function checkhelicoptertag(tagname) {
    if (isdefined(self.model)) {
        if (self.model == "veh_t8_drone_hunter_mp_light") {
            switch (tagname) {
            case #"tag_engine_left":
                return "tag_fx_exhaust2";
            case #"tag_engine_right":
                return "tag_fx_exhaust1";
            case #"tail_rotor_jnt":
                return "tag_fx_tail";
            default:
                break;
            }
        }
    }
    return tagname;
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0xcd77e08, Offset: 0x6558
// Size: 0x144
function heli_secondary_explosions() {
    self endon(#"death");
    if (isdefined(self.var_78d69212)) {
        playfxontag(self.var_78d69212, self, self checkhelicoptertag("tag_engine_left"));
    }
    self playsound(level.heli_sound[#"hit"]);
    self thread trail_fx(self.var_ba5009c3, self checkhelicoptertag("tail_rotor_jnt"), "stop tail smoke");
    wait(3);
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.var_78d69212)) {
        playfxontag(self.var_78d69212, self, self checkhelicoptertag("tag_engine_left"));
    }
    self playsound(level.heli_sound[#"hitsecondary"]);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x4ff62edf, Offset: 0x66a8
// Size: 0x9e
function heli_spin(speed) {
    self endon(#"death");
    self thread spinsoundshortly();
    self setyawspeed(speed, speed / 3, speed / 3);
    while (isdefined(self)) {
        self settargetyaw(self.angles[1] + speed * 0.9);
        wait(1);
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x6e67f5c4, Offset: 0x6750
// Size: 0x94
function spinsoundshortly() {
    self endon(#"death");
    wait(0.25);
    self stoploopsound();
    waitframe(1);
    self playloopsound(level.heli_sound[#"spinloop"]);
    waitframe(1);
    self playsound(level.heli_sound[#"spinstart"]);
}

// Namespace helicopter/helicopter_shared
// Params 3, eflags: 0x2 linked
// Checksum 0xf2b71257, Offset: 0x67f0
// Size: 0x1c
function trail_fx(*trail_fx, *trail_tag, *stop_notify) {
    
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0xeeb5c640, Offset: 0x6818
// Size: 0x8c
function function_69a7aed9() {
    if (self.var_7454fab === 1) {
        return;
    }
    self.var_7454fab = 1;
    if (isdefined(self.var_bdbe8391)) {
        var_2e15ba7a = isdefined(self gettagorigin("tag_deathfx"));
        playfxontag(self.var_bdbe8391, self, var_2e15ba7a ? "tag_deathfx" : "tag_origin");
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x52fba46, Offset: 0x68b0
// Size: 0x22c
function destroyhelicopter(var_fec7078b) {
    if (self.var_6c027ee0 === 1) {
        return;
    }
    self.var_6c027ee0 = 1;
    team = self.originalteam;
    if (target_istarget(self)) {
        target_remove(self);
    }
    self influencers::remove_influencers();
    if (isdefined(self.interior_model)) {
        self.interior_model delete();
        self.interior_model = undefined;
    }
    if (isdefined(self.minigun_snd_ent)) {
        self.minigun_snd_ent stoploopsound();
        self.minigun_snd_ent delete();
        self.minigun_snd_ent = undefined;
    }
    if (isdefined(self.alarm_snd_ent)) {
        self.alarm_snd_ent delete();
        self.alarm_snd_ent = undefined;
    }
    if (isdefined(self.flare_ent)) {
        self.flare_ent delete();
        self.flare_ent = undefined;
    }
    if (isdefined(self.owner) && killstreaks::function_6bde02cc(self.hardpointtype)) {
        self.owner killstreakrules::function_d9f8f32b(self.hardpointtype);
    }
    killstreakrules::killstreakstop(self.hardpointtype, team, self.killstreak_id);
    if (is_true(var_fec7078b)) {
        self function_e1058a3e();
    }
    function_711c140b();
    self deletedelay();
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x201efb31, Offset: 0x6ae8
// Size: 0xc4
function function_e1058a3e() {
    if (!isdefined(self)) {
        return;
    }
    if (self.var_3bfa7cf8 === 1) {
        return;
    }
    self.var_3bfa7cf8 = 1;
    if (isdefined(self.explosionfx)) {
        var_2e15ba7a = isdefined(self gettagorigin("tag_deathfx"));
        playfxontag(self.explosionfx, self, var_2e15ba7a ? "tag_deathfx" : "tag_origin");
    }
    self playsound(level.heli_sound[#"crash"]);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x43b5dad3, Offset: 0x6bb8
// Size: 0x64
function heli_explode() {
    self endon(#"death");
    self function_e1058a3e();
    wait(0.1);
    assert(isdefined(self.destroyfunc));
    self [[ self.destroyfunc ]]();
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x14c45f95, Offset: 0x6c28
// Size: 0x64
function clear_client_flags() {
    self clientfield::set("heli_warn_fired", 0);
    self clientfield::set("heli_warn_targeted", 0);
    self clientfield::set("heli_warn_locked", 0);
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0xb209c427, Offset: 0x6c98
// Size: 0xdc
function function_86012f82(goalpos, stop) {
    if (!isdefined(self)) {
        return;
    }
    self.heligoalpos = goalpos;
    if (issentient(self) && ispathfinder(self) && ispointinnavvolume(self.origin, "navvolume_big")) {
        self setgoal(goalpos, stop);
        self function_a57c34b7(goalpos, stop, 1);
        return;
    }
    self function_a57c34b7(goalpos, stop, 0);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x6 linked
// Checksum 0x4b6bc75d, Offset: 0x6d80
// Size: 0x186
function private function_8de67419(var_b4c35bb7) {
    self endon(#"death");
    radius = distance(self.origin, var_b4c35bb7);
    var_a9a839e2 = getclosestpointonnavvolume(var_b4c35bb7, "navvolume_big", radius);
    if (isdefined(var_a9a839e2)) {
        self function_86012f82(var_a9a839e2, 0);
        while (true) {
            /#
                recordsphere(var_a9a839e2, 8, (0, 0, 1), "<unknown string>");
            #/
            var_baa92af9 = ispointinnavvolume(self.origin, "navvolume_big");
            if (!var_baa92af9) {
                if (issentient(self)) {
                    self function_60d50ea4();
                }
                self notify(#"hash_2bf34763927dd61b");
                break;
            }
            waitframe(1);
        }
        return;
    }
    if (issentient(self)) {
        self function_60d50ea4();
    }
    self notify(#"hash_2bf34763927dd61b");
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x3ec5b8f6, Offset: 0x6f10
// Size: 0x2c4
function function_62eb6272(var_70031e7b) {
    self notify(#"destintation reached");
    self notify(#"leaving");
    hardpointtype = self.hardpointtype;
    self.leaving = 1;
    if (isdefined(level.var_14151f16)) {
        [[ level.var_14151f16 ]](self, 0);
    }
    if (!(self.destroyscoreeventgiven === 1)) {
        self namespace_f9b02f80::function_d2219b7d(hardpointtype);
    }
    leavenode = getvalidrandomstartnode(self.origin);
    var_b4c35bb7 = leavenode.origin;
    if (isdefined(var_70031e7b)) {
        var_b4c35bb7 = var_70031e7b;
    }
    heli_reset();
    self vehclearlookat();
    exitangles = vectortoangles(var_b4c35bb7 - self.origin);
    self setgoalyaw(exitangles[1]);
    wait(1.5);
    if (!isdefined(self)) {
        return;
    }
    self set_goal_pos(self.origin + (var_b4c35bb7 - self.origin) / 2 + (0, 0, 1000), 0);
    self waittill(#"near_goal", #"death");
    if (isdefined(self)) {
        self set_goal_pos(var_b4c35bb7, 1);
        self waittill(#"goal", #"death");
        if (isdefined(self)) {
            self stoploopsound(1);
            self util::death_notify_wrapper();
            if (isdefined(self.alarm_snd_ent)) {
                self.alarm_snd_ent stoploopsound();
                self.alarm_snd_ent delete();
                self.alarm_snd_ent = undefined;
            }
            assert(isdefined(self.destroyfunc));
            self [[ self.destroyfunc ]]();
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0xa0ea8ee5, Offset: 0x71e0
// Size: 0x94
function function_fabf8bc5(var_b4c35bb7) {
    self endon(#"death", #"near_goal");
    while (true) {
        distsq = distancesquared(self.origin, var_b4c35bb7);
        if (distsq <= 10000) {
            self notify(#"fallback_goal");
            break;
        }
        waitframe(1);
    }
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0x65393c1e, Offset: 0x7280
// Size: 0x414
function heli_leave(var_70031e7b = undefined, var_1caffd41 = 0) {
    if (!is_true(level.var_e071ed64) || var_1caffd41) {
        self thread function_62eb6272(var_70031e7b);
        return;
    }
    self notify(#"destintation reached");
    self notify(#"leaving");
    hardpointtype = self.hardpointtype;
    self.leaving = 1;
    if (isdefined(level.var_14151f16)) {
        [[ level.var_14151f16 ]](self, 0);
    }
    if (!is_true(self.destroyscoreeventgiven)) {
        self namespace_f9b02f80::function_d2219b7d(hardpointtype);
    }
    leavenode = getvalidrandomstartnode(self.origin);
    var_b4c35bb7 = leavenode.origin;
    if (isdefined(var_70031e7b)) {
        var_b4c35bb7 = var_70031e7b;
    }
    heli_reset();
    self function_3cca3796();
    self thread function_fabf8bc5(var_b4c35bb7);
    self vehclearlookat();
    exitangles = vectortoangles(var_b4c35bb7 - self.origin);
    self setgoalyaw(exitangles[1]);
    self function_86012f82(var_b4c35bb7, 1);
    if (ispointinnavvolume(var_b4c35bb7, "navvolume_big")) {
        if (isdefined(level.var_65f7e97e)) {
            self waittilltimeout(level.var_65f7e97e, #"fallback_goal", #"near_goal", #"death");
        } else {
            self waittill(#"fallback_goal", #"near_goal", #"death");
        }
    } else {
        self thread function_8de67419(var_b4c35bb7);
        if (isdefined(level.var_65f7e97e)) {
            self waittilltimeout(level.var_65f7e97e, #"fallback_goal", #"hash_2bf34763927dd61b", #"death");
        } else {
            self waittill(#"fallback_goal", #"hash_2bf34763927dd61b", #"death");
        }
    }
    if (isdefined(self)) {
        self.nodeathfx = 1;
        self stoploopsound(1);
        self util::death_notify_wrapper();
        if (isdefined(self.alarm_snd_ent)) {
            self.alarm_snd_ent stoploopsound();
            self.alarm_snd_ent delete();
            self.alarm_snd_ent = undefined;
        }
        assert(isdefined(self.destroyfunc));
        self [[ self.destroyfunc ]]();
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x60098e0, Offset: 0x76a0
// Size: 0x8c
function function_3cca3796() {
    self setmaxpitchroll(10, 30);
    self setspeed(self.killstreakbundle.var_654ebf9a, self.killstreakbundle.var_93eb6217, self.killstreakbundle.var_9eb6e1d7);
    self setyawspeed(55, 25, 25);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0xf29997c2, Offset: 0x7738
// Size: 0x9e
function set_heli_speed_evasive() {
    self setmaxpitchroll(50, 60);
    self setspeed(self.killstreakbundle.var_9b7da715, self.killstreakbundle.var_b1e2863a, self.killstreakbundle.var_53a561c5);
    self setyawspeed(80, 60, 60);
    self notify(#"evasive");
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0xe1389d14, Offset: 0x77e0
// Size: 0x8c
function function_c82c2872() {
    self setmaxpitchroll(50, 60);
    self setspeed(self.killstreakbundle.var_86311447, self.killstreakbundle.var_9c978691, self.killstreakbundle.var_9a9acbb1);
    self setyawspeed(55, 25, 25);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0xf62b93db, Offset: 0x7878
// Size: 0x8c
function set_heli_speed_hover() {
    self setmaxpitchroll(30, 30);
    self setspeed(self.killstreakbundle.var_9586f929, self.killstreakbundle.var_8c0d492f, self.killstreakbundle.var_4bbde8bf);
    self setyawspeed(55, 25, 25);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x1c9831bd, Offset: 0x7910
// Size: 0x64
function is_targeted() {
    if (isdefined(self.locking_on) && self.locking_on) {
        return true;
    }
    if (isdefined(self.locked_on) && self.locked_on) {
        return true;
    }
    if (isdefined(self.locking_on_hacking) && self.locking_on_hacking) {
        return true;
    }
    return false;
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x47792894, Offset: 0x7980
// Size: 0x114
function function_656691ab() {
    self endon(#"death", #"abandoned");
    while (true) {
        var_baa92af9 = ispointinnavvolume(self.origin, "navvolume_big");
        if (var_baa92af9) {
            heli_reset();
            if (!ispathfinder(self)) {
                self makepathfinder();
            }
            self util::make_sentient();
            if (isdefined(self.heligoalpos)) {
                self set_goal_pos(self.heligoalpos, 1);
            }
            self notify(#"hash_340ab3c2b94ff86a");
            break;
        }
        wait(2);
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0xbd2a6d9d, Offset: 0x7aa0
// Size: 0x22e
function function_81cba63() {
    self endon(#"death", #"abandoned");
    while (true) {
        if (isdefined(self.protectdest)) {
            /#
                recordsphere(self.protectdest, 8, (0, 0, 1), "<unknown string>");
            #/
        }
        if (isdefined(self.var_6c63b409)) {
            /#
                recordline(self.protectdest, self.var_6c63b409, (0, 1, 0), "<unknown string>");
                recordsphere(self.var_6c63b409, 8, (0, 1, 0), "<unknown string>");
            #/
        }
        if (isdefined(self.goalpos)) {
            /#
                recordsphere(self.goalpos, 8, (0, 1, 1), "<unknown string>");
                recordline(self.origin, self.goalpos, (0, 1, 1), "<unknown string>");
            #/
        }
        if (isdefined(self.var_2c1a38eb) && isdefined(self.var_f9d38924)) {
            /#
                recordsphere(self.var_f9d38924, 8, (0, 1, 0), "<unknown string>");
                recordline(self.var_2c1a38eb, self.var_f9d38924, (0, 1, 0), "<unknown string>");
                record3dtext("<unknown string>" + distance(self.var_2c1a38eb, self.var_f9d38924), self.var_f9d38924 + (0, 0, 20), (0, 1, 0), "<unknown string>");
            #/
        }
        waitframe(1);
    }
}

// Namespace helicopter/helicopter_shared
// Params 6, eflags: 0x2 linked
// Checksum 0x9f7a2810, Offset: 0x7cd8
// Size: 0x46e
function heli_get_protect_spot(*heli, protectdest, var_551cf1b9, heli_team = self.killstreakbundle.var_b9e5735e, *hardpointtype, var_c18556e5 = 0) {
    if (var_c18556e5) {
        heli_team = self.killstreakbundle.var_2c883372;
    }
    min_radius = int(heli_team * 0.3);
    max_radius = heli_team;
    groundpos = getclosestpointonnavmesh(var_551cf1b9, 10000);
    heightmin = self.killstreakbundle.var_2e4c8245;
    heightmax = self.killstreakbundle.var_8c1406f;
    if (hardpointtype == #"axis") {
        heightmin += self.killstreakbundle.var_d2c774e8;
        heightmax += self.killstreakbundle.var_d2c774e8;
    }
    hoverheight = heightmin + (heightmax - heightmin) / 2;
    radius = 10000;
    if (isdefined(groundpos)) {
        var_9ff2f344 = undefined;
        if (isdefined(self.var_8475558b)) {
            var_9ff2f344 = getclosestpointonnavmesh(self.var_8475558b.origin, 10000);
        }
        if (!isdefined(var_9ff2f344) && isdefined(self.primarytarget)) {
            var_9ff2f344 = getclosestpointonnavmesh(self.primarytarget.origin, 10000);
        }
        if (isdefined(var_9ff2f344)) {
            groundpos = var_9ff2f344;
        }
        var_551cf1b9 = (groundpos[0], groundpos[1], groundpos[2] + hoverheight);
        var_551cf1b9 = getclosestpointonnavvolume(var_551cf1b9, "navvolume_big", radius);
        if (isdefined(var_551cf1b9)) {
            self.var_2c1a38eb = groundpos;
            self.var_f9d38924 = var_551cf1b9;
            halfheight = (heightmax - heightmin) / 2;
            queryresult = positionquery_source_navigation(var_551cf1b9, min_radius, max_radius, halfheight, 50, self);
            if (isdefined(queryresult.data) && queryresult.data.size) {
                validpoints = [];
                if (var_c18556e5) {
                    var_7f378b0 = int(max_radius * 0.5);
                } else {
                    var_7f378b0 = randomintrange(int(max_radius * 0.4), int(max_radius * 0.9));
                }
                foreach (point in queryresult.data) {
                    distsq = distancesquared(self.origin, point.origin);
                    if (distsq >= sqr(var_7f378b0)) {
                        array::add(validpoints, point);
                    }
                }
                if (validpoints.size) {
                    return array::random(validpoints);
                }
            }
        }
    }
    return undefined;
}

// Namespace helicopter/helicopter_shared
// Params 4, eflags: 0x2 linked
// Checksum 0x7f5e047e, Offset: 0x8150
// Size: 0x55c
function function_438e7b44(startnode, protectdest, hardpointtype, heli_team) {
    self endon(#"death");
    self notify(#"flying");
    self endon(#"flying", #"abandoned");
    self.reached_dest = 0;
    heli_reset();
    wait(2);
    currentdest = protectdest;
    nodeheight = protectdest[2];
    nextnode = startnode;
    heightoffset = 0;
    if (heli_team == #"axis") {
        heightoffset = 400;
    }
    protectdest = (protectdest[0], protectdest[1], nodeheight);
    noflyzoneheight = airsupport::getnoflyzoneheight(protectdest);
    protectdest = (protectdest[0], protectdest[1], noflyzoneheight + heightoffset);
    currentdest = protectdest;
    starttime = gettime();
    self.endtime = starttime + int(self.killstreakbundle.var_11953731 * 1000);
    self.halftime = starttime + int(self.killstreakbundle.var_11953731 * 0.5 * 1000);
    self.killstreakendtime = int(self.endtime);
    self set_goal_pos(self.origin + (currentdest - self.origin) / 3 + (0, 0, 1000), 0);
    self waittill(#"near_goal");
    self namespace_f9b02f80::play_pilot_dialog_on_owner("arrive", hardpointtype, self.killstreak_id);
    self thread updatetargetyaw();
    mapenter = 1;
    var_2ca2e589 = 1;
    while (gettime() < self.endtime) {
        if (!is_true(self.var_478039e8) && gettime() >= self.halftime) {
            self namespace_f9b02f80::play_pilot_dialog_on_owner("timecheck", hardpointtype);
            self.var_478039e8 = 1;
        }
        self set_goal_pos(currentdest, 1);
        self thread updatespeed();
        self waittill(#"near_goal");
        hostmigration::waittillhostmigrationdone();
        self notify(#"path start");
        if (self is_targeted()) {
            if (is_true(var_2ca2e589)) {
                var_2ca2e589 = 0;
            } else {
                wait(5);
            }
        } else {
            waittillframeend();
            time = self.killstreakbundle.var_1aeb607e;
            if (self.evasive == 1) {
                time = 2;
            }
            if (is_true(var_2ca2e589)) {
                waitresult = self waittilltimeout(time, #"locking on", #"locking on hacking", #"damage state");
                if (waitresult._notify != "timeout") {
                    var_2ca2e589 = 0;
                }
            } else {
                wait(time);
            }
        }
        prevdest = currentdest;
        currentdest = function_d5de7cb1(self, protectdest, nodeheight);
        noflyzoneheight = airsupport::getnoflyzoneheight(currentdest);
        currentdest = (currentdest[0], currentdest[1], noflyzoneheight + heightoffset);
        noflyzones = airsupport::crossesnoflyzones(prevdest, currentdest);
        if (isdefined(noflyzones) && noflyzones.size > 0) {
            currentdest = prevdest;
        }
    }
    self heli_set_active_camo_state(1);
    self thread heli_leave();
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0xc691beca, Offset: 0x86b8
// Size: 0x102
function heli_random_point_in_radius(protectdest, nodeheight) {
    min_distance = int(level.heli_protect_radius * 0.2);
    direction = randomintrange(0, 360);
    distance = randomintrange(min_distance, level.heli_protect_radius);
    x = cos(direction);
    y = sin(direction);
    x *= distance;
    y *= distance;
    return (protectdest[0] + x, protectdest[1] + y, nodeheight);
}

// Namespace helicopter/helicopter_shared
// Params 3, eflags: 0x2 linked
// Checksum 0x54e41aea, Offset: 0x87c8
// Size: 0xfa
function function_d5de7cb1(*heli, protectdest, nodeheight) {
    protect_spot = heli_random_point_in_radius(protectdest, nodeheight);
    tries = 10;
    for (noflyzone = airsupport::crossesnoflyzone(protectdest, protect_spot); tries != 0 && isdefined(noflyzone); noflyzone = airsupport::crossesnoflyzone(protectdest, protect_spot)) {
        protect_spot = heli_random_point_in_radius(protectdest, nodeheight);
        tries--;
    }
    noflyzoneheight = airsupport::getnoflyzoneheightcrossed(protectdest, protect_spot, nodeheight);
    return (protect_spot[0], protect_spot[1], noflyzoneheight);
}

// Namespace helicopter/helicopter_shared
// Params 4, eflags: 0x2 linked
// Checksum 0xd82fba8, Offset: 0x88d0
// Size: 0x88c
function heli_protect(startnode, protectdest, hardpointtype, heli_team) {
    if (!is_true(level.var_e071ed64)) {
        self thread function_438e7b44(startnode, protectdest, hardpointtype, heli_team);
        return;
    }
    self endon(#"death", #"abandoned");
    self notify(#"flying");
    self endon(#"flying");
    heli_reset();
    self setneargoalnotifydist(400);
    self.reached_dest = 0;
    self.goalradius = 30;
    starttime = gettime();
    self.halftime = starttime + int(self.killstreakbundle.var_11953731 * 0.5 * 1000);
    self.killstreakendtime = starttime + int(self.killstreakbundle.var_11953731 * 1000);
    self.endtime = starttime + int(self.killstreakbundle.var_11953731 * 1000);
    self thread function_656691ab();
    self thread function_81cba63();
    self.protectdest = protectdest;
    self.var_6c63b409 = protectdest;
    radius = 10000;
    if (isdefined(self.owner)) {
        radius = distance(protectdest, self.origin);
    }
    var_a9a839e2 = getclosestpointonnavvolume(protectdest, "navvolume_big", radius);
    if (isdefined(var_a9a839e2)) {
        protectdest = var_a9a839e2;
        self.var_6c63b409 = protectdest;
        var_b140bc48 = heli_get_protect_spot(self, protectdest, 300, heli_team, hardpointtype);
        if (isdefined(var_b140bc48)) {
            self function_86012f82(var_b140bc48.origin, 1);
            protectdest = var_b140bc48.origin;
            self.var_6c63b409 = var_b140bc48.origin;
        } else {
            self function_86012f82(protectdest, 1);
        }
    }
    self thread updatetargetyaw();
    self function_3cca3796();
    self function_86012f82(protectdest, 1);
    self waittilltimeout(30, #"near_goal", #"primary acquired");
    self setneargoalnotifydist(256);
    var_520e3459 = self.killstreakbundle.var_1aeb607e;
    var_2ca2e589 = 1;
    self thread updatespeed();
    evasive = 0;
    waitresult = undefined;
    while (gettime() < self.killstreakendtime) {
        if (is_true(level.var_e80a117f)) {
            var_569a1ad5 = gettime();
            level waittill(#"hash_22962c7c3ae16f30");
            self.killstreakendtime += gettime() - var_569a1ad5;
        }
        if (!is_true(self.var_478039e8) && gettime() >= self.halftime) {
            self namespace_f9b02f80::play_pilot_dialog_on_owner("timecheck", hardpointtype);
            self.var_478039e8 = 1;
        }
        var_520e3459 = randomintrange(self.killstreakbundle.var_c2d3a27e, self.killstreakbundle.var_37667062);
        if (int(var_520e3459 * 1000) + gettime() > self.killstreakendtime) {
            var_520e3459 = float(self.killstreakendtime - gettime()) / 1000;
        }
        if (!isdefined(self)) {
            return;
        }
        if (isdefined(self.var_8475558b) && isalive(self.var_8475558b) && waitresult._notify === "acquired_heli_target") {
            var_38cab71f = isdefined(self.killstreakbundle.var_a6190387) ? self.killstreakbundle.var_a6190387 : 300;
            newdest = heli_get_protect_spot(self, self.origin, var_38cab71f, heli_team, hardpointtype, evasive);
        } else {
            newdest = heli_get_protect_spot(self, protectdest, undefined, heli_team, hardpointtype, evasive);
        }
        waitresult = undefined;
        if (isdefined(newdest)) {
            self function_86012f82(newdest.origin, 1);
            waitresult = self waittilltimeout(var_520e3459, #"abort_goal", #"locking on", #"locking on hacking", #"acquired_heli_target");
        } else {
            waitresult = self waittilltimeout(var_520e3459, #"abort_goal", #"locking on", #"locking on hacking", #"acquired_heli_target");
        }
        if (waitresult._notify === "locking on" || waitresult._notify === "locking on" || self is_targeted()) {
            self setneargoalnotifydist(60);
            evasive = 1;
        } else {
            self setneargoalnotifydist(256);
            evasive = 0;
        }
        if (!ispointinnavvolume(self.origin, "navvolume_big")) {
            var_a9a839e2 = getclosestpointonnavvolume(self.origin, "navvolume_big", 3000);
            if (isdefined(var_a9a839e2)) {
                self.origin = var_a9a839e2;
            }
        }
        self notify(#"path start");
    }
    self heli_set_active_camo_state(1);
    if (isdefined(self.owner) && killstreaks::function_6bde02cc(hardpointtype)) {
        self.owner killstreakrules::function_d9f8f32b(hardpointtype);
    }
    self thread heli_leave();
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x9705c6e5, Offset: 0x9168
// Size: 0xc6
function updatespeed() {
    self endon(#"death", #"crashing", #"leaving");
    while (true) {
        if (self is_targeted() || isdefined(self.evasive) && self.evasive) {
            set_heli_speed_evasive();
        } else if (isdefined(self.var_a6642d42)) {
            function_c82c2872();
        } else {
            set_heli_speed_hover();
        }
        wait(1);
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x9a042575, Offset: 0x9238
// Size: 0xfe
function updatetargetyaw() {
    self notify(#"endtargetyawupdate");
    self endon(#"death", #"crashing", #"leaving", #"endtargetyawupdate");
    for (;;) {
        if (isdefined(self.primarytarget)) {
            yaw = math::get_2d_yaw(self.origin, self.primarytarget.origin);
            self settargetyaw(yaw);
        } else if (isdefined(self.var_6c63b409)) {
            yaw = math::get_2d_yaw(self.origin, self.var_6c63b409);
            self settargetyaw(yaw);
        }
        wait(1);
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x6 linked
// Checksum 0xdd41070a, Offset: 0x9340
// Size: 0x6c
function private function_644ef4bf(target) {
    self endon(#"death");
    target waittill(#"death", #"crashing", #"explode");
    self detonate();
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0x4ba1af07, Offset: 0x93b8
// Size: 0x266
function fire_missile(ishots = 1, etarget) {
    assert(self.health > 0);
    weaponshoottime = undefined;
    tags = [];
    tags[0] = "tag_flash";
    tags[1] = "tag_flash1";
    tags[2] = "tag_flash2";
    tags[3] = "tag_flash3";
    weapon = getweapon(self.killstreakbundle.var_51be948f);
    assert(isdefined(weapon));
    assert(tags.size > 0);
    weaponshoottime = weapon.firetime;
    assert(isdefined(weaponshoottime));
    nextmissiletag = -1;
    for (i = 0; i < ishots; i++) {
        nextmissiletag++;
        if (nextmissiletag >= tags.size) {
            nextmissiletag = 0;
        }
        emissile = magicbullet(weapon, self gettagorigin(tags[nextmissiletag]), etarget.origin, etarget);
        emissile thread function_644ef4bf(etarget);
        emissile missile_settarget(etarget);
        emissile.team = self.team;
        emissile.var_30dc969d = 1;
        heatseekingmissile::initlockfield(etarget);
        etarget heatseekingmissile::function_a439ae56(emissile, weapon, self.owner);
        emissile.killcament = self;
        self.lastrocketfiretime = gettime();
        if (i < ishots - 1) {
            wait(weaponshoottime);
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x749c947b, Offset: 0x9628
// Size: 0x7c
function check_owner(*hardpointtype) {
    if (!isdefined(self.owner) || !isdefined(self.owner.team) || self.owner.team != self.team) {
        self notify(#"abandoned");
        self thread heli_leave();
    }
}

// Namespace helicopter/helicopter_shared
// Params 3, eflags: 0x2 linked
// Checksum 0x4c195890, Offset: 0x96b0
// Size: 0x84
function attack_targets(missilesenabled, hardpointtype, var_22f224d7 = 1) {
    self thread attack_primary(hardpointtype);
    if (missilesenabled) {
        self thread attack_secondary(hardpointtype);
        return;
    }
    if (var_22f224d7) {
        self thread function_83430362(hardpointtype);
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x80c03ed0, Offset: 0x9740
// Size: 0x74
function function_7078bd6e(*helicopter) {
    var_5052ae94 = [];
    var_5052ae94[0] = self.killstreakbundle.var_86e2b32a;
    var_5052ae94[1] = self.killstreakbundle.var_793017c5;
    if (!isdefined(var_5052ae94[0]) && !isdefined(var_5052ae94[1])) {
        return false;
    }
    return true;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0xda314f49, Offset: 0x97c0
// Size: 0x6e8
function function_83430362(*hardpointtype) {
    self endon(#"death", #"crashing", #"leaving");
    level endon(#"game_ended");
    var_5052ae94 = [];
    var_5052ae94[0] = self.killstreakbundle.var_86e2b32a;
    var_5052ae94[1] = self.killstreakbundle.var_793017c5;
    if (!isdefined(var_5052ae94[0]) && !isdefined(var_5052ae94[1])) {
        return;
    }
    for (i = 0; i < var_5052ae94.size; i++) {
        if (isdefined(var_5052ae94[i])) {
            self turretsetontargettolerance(var_5052ae94[i], 5);
        }
    }
    var_f3b08e50 = isdefined(self.killstreakbundle.var_7bba276c) ? self.killstreakbundle.var_7bba276c : 10;
    var_9b40542d = isdefined(self.killstreakbundle.var_cce6aee8) ? self.killstreakbundle.var_cce6aee8 : 20;
    var_f2c81dc3 = isdefined(self.killstreakbundle.var_3286050) ? self.killstreakbundle.var_3286050 : 2;
    var_dca0680c = isdefined(self.killstreakbundle.var_fdfa0253) ? self.killstreakbundle.var_fdfa0253 : 5;
    targetcosine = cos((isdefined(self.killstreakbundle.var_96879013) ? self.killstreakbundle.var_96879013 : 30) / 2);
    for (;;) {
        if (isdefined(self.var_9ddb1534)) {
            self.var_8475558b = self.var_9ddb1534;
            self.var_a6642d42 = 0;
            while (isdefined(self.var_8475558b) && isalive(self.var_8475558b)) {
                self vehlookat(self.var_8475558b);
                if (isdefined(var_5052ae94[0])) {
                    self turret::set_target(self.var_8475558b, undefined, var_5052ae94[0]);
                }
                if (isdefined(var_5052ae94[1])) {
                    self turret::set_target(self.var_8475558b, undefined, var_5052ae94[1]);
                }
                while (isdefined(self.var_8475558b) && isalive(self.var_8475558b) && !self util::within_fov(self.origin, self.angles, self.var_8475558b.origin, targetcosine)) {
                    if (sighttracepassed(self.origin, self.var_8475558b.origin, 0, self, self.var_8475558b)) {
                        break;
                    }
                    waitframe(1);
                }
                if (!isdefined(self.var_8475558b) || !isalive(self.var_8475558b)) {
                    break;
                }
                self.var_a6642d42 = 1;
                self notify(#"acquired_heli_target");
                if (isdefined(var_5052ae94[0])) {
                    turret::function_38841344(self.var_8475558b, var_5052ae94[0]);
                } else if (isdefined(var_5052ae94[1])) {
                    turret::function_38841344(self.var_8475558b, var_5052ae94[1]);
                }
                self notify(#"turret_on_target");
                if (isdefined(self.var_8475558b)) {
                    self playsound("wpn_attack_helicopter_spin_start_npc");
                    wait(0.3);
                    self playloopsound("wpn_attack_helicopter_spin_loop_npc");
                    wait(level.heli_turret_spinup_delay);
                    burstsize = randomintrangeinclusive(var_f3b08e50, var_9b40542d);
                    for (i = 0; i < burstsize; i++) {
                        for (j = 0; j < var_5052ae94.size; j++) {
                            if (isdefined(var_5052ae94[j])) {
                                if (isdefined(self.var_8475558b)) {
                                    self.var_d9971601 = self.var_8475558b.origin;
                                    self turretsettarget(var_5052ae94[j], self.var_8475558b);
                                    self fireweapon(var_5052ae94[j], self.var_8475558b);
                                    continue;
                                }
                                if (isdefined(self.var_d9971601)) {
                                    self turretsettarget(var_5052ae94[j], self.var_d9971601);
                                }
                                self fireweapon(var_5052ae94[j]);
                            }
                        }
                        waitframe(1);
                    }
                }
                self notify(#"turret reloading");
                self stoploopsound(1);
                self playsound("wpn_attack_helicopter_spin_stop_npc");
                burstdelay = randomintrangeinclusive(var_f2c81dc3, var_dca0680c);
                wait(burstdelay);
                if (!isdefined(self.var_8475558b) || isdefined(self.var_9ddb1534) && isdefined(self.var_8475558b) && self.var_8475558b != self.var_9ddb1534) {
                    break;
                }
            }
        }
        self waittill(#"hash_27ba79e760b6494f");
        if (is_true(level.var_e80a117f)) {
            level waittill(#"hash_22962c7c3ae16f30");
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x40d53aa, Offset: 0x9eb0
// Size: 0x1e8
function attack_secondary(hardpointtype) {
    self endon(#"death", #"crashing", #"leaving");
    level endon(#"game_ended");
    for (;;) {
        if (isdefined(self.secondarytarget)) {
            self.secondarytarget.antithreat = undefined;
            self.missiletarget = self.secondarytarget;
            antithreat = 0;
            while (isdefined(self.missiletarget) && isalive(self.missiletarget)) {
                self vehlookat(self.missiletarget);
                self thread missile_support(self.missiletarget, level.heli_missile_rof, 1, undefined);
                antithreat += 100;
                self.missiletarget.antithreat = antithreat;
                wait(level.heli_missile_rof);
                if (!isdefined(self.secondarytarget) || isdefined(self.secondarytarget) && self.missiletarget != self.secondarytarget) {
                    break;
                }
            }
            if (isdefined(self.missiletarget)) {
                self.missiletarget.antithreat = undefined;
            }
        }
        self waittill(#"secondary acquired");
        if (is_true(level.var_e80a117f)) {
            level waittill(#"hash_22962c7c3ae16f30");
        }
        self check_owner(hardpointtype);
    }
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0x7997644a, Offset: 0xa0a0
// Size: 0xf2
function turret_target_check(turrettarget, attackangle) {
    targetyaw = math::get_2d_yaw(self.origin, turrettarget.origin);
    chopperyaw = self.angles[1];
    if (targetyaw < 0) {
        targetyaw *= -1;
    }
    targetyaw = int(targetyaw) % 360;
    if (chopperyaw < 0) {
        chopperyaw *= -1;
    }
    chopperyaw = int(chopperyaw) % 360;
    if (chopperyaw > targetyaw) {
        difference = chopperyaw - targetyaw;
    } else {
        difference = targetyaw - chopperyaw;
    }
    return difference <= attackangle;
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0xff2713d, Offset: 0xa1a0
// Size: 0xf4
function target_cone_check(target, conecosine) {
    heli2target_normal = vectornormalize(target.origin - self.origin);
    heli2forward = anglestoforward(self.angles);
    heli2forward_normal = vectornormalize(heli2forward);
    heli_dot_target = vectordot(heli2target_normal, heli2forward_normal);
    if (heli_dot_target >= conecosine) {
        /#
            airsupport::debug_print3d_simple("<unknown string>" + heli_dot_target, self, (0, 0, -40), 40);
        #/
        return true;
    }
    return false;
}

// Namespace helicopter/helicopter_shared
// Params 4, eflags: 0x2 linked
// Checksum 0x12dcaecd, Offset: 0xa2a0
// Size: 0x2ee
function missile_support(target_player, rof, instantfire, endon_notify) {
    self endon(#"death", #"crashing", #"leaving");
    if (isdefined(endon_notify)) {
        self endon(endon_notify);
    }
    self.turret_giveup = 0;
    if (!instantfire) {
        wait(rof);
        self.turret_giveup = 1;
        self notify(#"give up");
    }
    if (isdefined(target_player)) {
        if (level.teambased) {
            for (i = 0; i < level.players.size; i++) {
                player = level.players[i];
                if (isdefined(player.team) && !util::function_fbce7263(player.team, self.team) && distance(player.origin, target_player.origin) <= level.heli_missile_friendlycare) {
                    /#
                        airsupport::debug_print3d_simple("<unknown string>", self, (0, 0, -80), 40);
                    #/
                    self notify(#"missile ready");
                    return;
                }
            }
        } else {
            player = self.owner;
            if (isdefined(player) && isdefined(player.team) && !util::function_fbce7263(player.team, self.team) && distance(player.origin, target_player.origin) <= level.heli_missile_friendlycare) {
                /#
                    airsupport::debug_print3d_simple("<unknown string>", self, (0, 0, -80), 40);
                #/
                self notify(#"missile ready");
                return;
            }
        }
    }
    if (self.missile_ammo > 0 && isdefined(target_player)) {
        self fire_missile(1, target_player);
        self.missile_ammo--;
        self notify(#"missile fired");
    } else {
        return;
    }
    if (instantfire) {
        wait(rof);
        self notify(#"missile ready");
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0xce6821b8, Offset: 0xa598
// Size: 0x580
function attack_primary(hardpointtype) {
    self endon(#"death", #"crashing", #"leaving");
    level endon(#"game_ended");
    gunnerindex = isdefined(self.killstreakbundle.var_240a171) ? self.killstreakbundle.var_240a171 : 0;
    self turretsetontargettolerance(gunnerindex, 5);
    var_f3b08e50 = isdefined(self.killstreakbundle.var_cdd02f26) ? self.killstreakbundle.var_cdd02f26 : 10;
    var_9b40542d = isdefined(self.killstreakbundle.var_def96cd0) ? self.killstreakbundle.var_def96cd0 : 20;
    var_f2c81dc3 = isdefined(self.killstreakbundle.var_43e0fae) ? self.killstreakbundle.var_43e0fae : 2;
    var_dca0680c = isdefined(self.killstreakbundle.var_9770d1a6) ? self.killstreakbundle.var_9770d1a6 : 5;
    for (;;) {
        if (isdefined(self.primarytarget) && !isdefined(self.var_9ddb1534)) {
            self.primarytarget.antithreat = undefined;
            self.turrettarget = self.primarytarget;
            antithreat = 0;
            while (isdefined(self.turrettarget) && isalive(self.turrettarget)) {
                if (!isdefined(self.turrettarget) || !isalive(self.turrettarget)) {
                    break;
                }
                self vehlookat(self.turrettarget);
                self turretsettarget(gunnerindex, self.primarytarget);
                turret::function_38841344(self.turrettarget, gunnerindex);
                self notify(#"turret_on_target");
                if (isdefined(self.primarytarget)) {
                    self playsound("wpn_attack_helicopter_spin_start_npc");
                    wait(0.4);
                    self playloopsound("wpn_attack_helicopter_spin_loop_npc");
                    wait(level.heli_turret_spinup_delay);
                    burstsize = randomintrangeinclusive(var_f3b08e50, var_9b40542d);
                    for (i = 0; i < burstsize; i++) {
                        if (isdefined(self.primarytarget)) {
                            self.var_2c6d8331 = self.primarytarget.origin;
                            self turretsettarget(gunnerindex, self.primarytarget);
                            minigun = self fireweapon(gunnerindex, self.primarytarget);
                        } else {
                            if (isdefined(self.var_2c6d8331)) {
                                self turretsettarget(gunnerindex, self.var_2c6d8331);
                            }
                            self fireweapon(gunnerindex);
                        }
                        waitframe(1);
                    }
                }
                self notify(#"turret reloading");
                self stoploopsound(1);
                self playsound("wpn_attack_helicopter_spin_stop_npc");
                burstdelay = randomintrangeinclusive(var_f2c81dc3, var_dca0680c);
                wait(burstdelay);
                if (isdefined(self.turrettarget) && isalive(self.turrettarget)) {
                    antithreat += 100;
                    self.turrettarget.antithreat = antithreat;
                }
                if (!isdefined(self.primarytarget) || isdefined(self.turrettarget) && isdefined(self.primarytarget) && self.primarytarget != self.turrettarget) {
                    break;
                }
            }
            if (isdefined(self.turrettarget)) {
                self.turrettarget.antithreat = undefined;
            }
        }
        self waittill(#"primary acquired");
        if (is_true(level.var_e80a117f)) {
            level waittill(#"hash_22962c7c3ae16f30");
        }
        self check_owner(hardpointtype);
    }
}

/#

    // Namespace helicopter/helicopter_shared
    // Params 0, eflags: 0x0
    // Checksum 0x2099bc88, Offset: 0xab20
    // Size: 0x25c
    function debug_print_target() {
        if (isdefined(level.heli_debug) && level.heli_debug == 1) {
            if (isdefined(self.primarytarget) && isdefined(self.primarytarget.threatlevel)) {
                if (isdefined(self.primarytarget.type) && self.primarytarget.type == "<unknown string>") {
                    name = "<unknown string>";
                } else {
                    name = self.primarytarget.name;
                }
                primary_msg = "<unknown string>" + name + "<unknown string>" + self.primarytarget.threatlevel;
            } else {
                primary_msg = "<unknown string>";
            }
            if (isdefined(self.secondarytarget) && isdefined(self.secondarytarget.threatlevel)) {
                if (isdefined(self.secondarytarget.type) && self.secondarytarget.type == "<unknown string>") {
                    name = "<unknown string>";
                } else {
                    name = self.secondarytarget.name;
                }
                secondary_msg = "<unknown string>" + name + "<unknown string>" + self.secondarytarget.threatlevel;
            } else {
                secondary_msg = "<unknown string>";
            }
            frames = int(self.targeting_delay * 20) + 1;
            thread airsupport::draw_text(primary_msg, (1, 0.6, 0.6), self, (0, 0, 40), frames);
            thread airsupport::draw_text(secondary_msg, (1, 0.6, 0.6), self, (0, 0, 0), frames);
        }
    }

#/

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x412e9b7b, Offset: 0xad88
// Size: 0x56
function waittill_confirm_location() {
    self endon(#"emp_jammed", #"emp_grenaded");
    waitresult = self waittill(#"confirm_location");
    return waitresult.position;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x71b9301b, Offset: 0xade8
// Size: 0xb2
function selecthelicopterlocation(hardpointtype) {
    self airsupport::function_9e2054b0(&function_7da89497);
    location = self airsupport::waitforlocationselection();
    if (!isdefined(location)) {
        return 0;
    }
    if (self killstreakrules::iskillstreakallowed(hardpointtype, self.team) == 0) {
        return 0;
    }
    level.helilocation = location.origin;
    return airsupport::function_83904681(location.origin);
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0xc8e604e7, Offset: 0xaea8
// Size: 0x134
function processcopterassist(destroyedcopter, damagedone) {
    self endon(#"disconnect");
    destroyedcopter endon(#"disconnect");
    waitframe(1);
    if (!isdefined(level.teams[self.team])) {
        return;
    }
    if (!isdefined(destroyedcopter)) {
        return;
    }
    if (!util::function_fbce7263(self.team, destroyedcopter.team)) {
        return;
    }
    assist_level = "aircraft_destruction_assist";
    assist_level_value = int(ceil(damagedone.damage / destroyedcopter.maxhealth * 4));
    if (assist_level_value > 0) {
        if (assist_level_value > 3) {
            assist_level_value = 3;
        }
        assist_level = assist_level + "_" + assist_level_value * 25;
    }
    scoreevents::processscoreevent(assist_level, self, undefined, undefined);
}

// Namespace helicopter/helicopter_shared
// Params 4, eflags: 0x0
// Checksum 0x242c2a6c, Offset: 0xafe8
// Size: 0xf4
function playpilotdialog(dialog, time, voice, shouldwait) {
    self endon(#"death");
    level endon(#"remote_end");
    if (isdefined(time)) {
        wait(time);
    }
    if (!isdefined(self.pilotvoicenumber)) {
        self.pilotvoicenumber = 0;
    }
    if (isdefined(voice)) {
        voicenumber = voice;
    } else {
        voicenumber = self.pilotvoicenumber;
    }
    soundalias = level.teamprefix[self.team] + voicenumber + "_" + dialog;
    if (isdefined(self.owner)) {
        self.owner playpilottalking(shouldwait, soundalias);
    }
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x2 linked
// Checksum 0x7f0e1a19, Offset: 0xb0e8
// Size: 0xde
function playpilottalking(shouldwait, soundalias) {
    self endon(#"disconnect", #"joined_team", #"joined_spectators");
    for (trycounter = 0; isdefined(self.pilottalking) && self.pilottalking && trycounter < 10; trycounter++) {
        if (isdefined(shouldwait) && !shouldwait) {
            return;
        }
        wait(1);
    }
    self.pilottalking = 1;
    self playlocalsound(soundalias);
    wait(3);
    self.pilottalking = 0;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x2 linked
// Checksum 0xa7ed7dcf, Offset: 0xb1d0
// Size: 0xbe
function watchforearlyleave(chopper) {
    chopper notify(#"watchforearlyleave_helicopter");
    chopper endon(#"watchforearlyleave_helicopter", #"death");
    self endon(#"heli_timeup");
    self waittill(#"disconnect", #"joined_team", #"joined_spectator");
    if (isdefined(chopper)) {
        chopper thread heli_leave();
    }
    if (isdefined(self)) {
        self notify(#"heli_timeup");
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x2 linked
// Checksum 0x6831acd9, Offset: 0xb298
// Size: 0xb4
function watchforemp() {
    heli = self;
    heli endon(#"death", #"heli_timeup");
    heli.owner endon(#"disconnect", #"joined_team", #"joined_spectator", #"changed_specialist");
    heli.owner waittill(#"emp_jammed");
    heli thread heli_explode();
}

