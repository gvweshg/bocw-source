// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using script_16b1b77a76492c6a;
#using script_40fc784c60f9fa7b;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\content_manager.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_e51c1e80;

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 0, eflags: 0x5
// Checksum 0x8a2eb6bf, Offset: 0x490
// Size: 0x54
function private autoexec __init__system__() {
    system::register(#"hash_4713d315c3e40cdc", &preinit, undefined, &finalize, #"content_manager");
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 0, eflags: 0x6 linked
// Checksum 0x8330e2ef, Offset: 0x4f0
// Size: 0x104
function private preinit() {
    content_manager::register_script(#"hash_42f3e9628d7a7b24", &vehicle_spawn);
    callback::on_vehicle_killed(&function_483f7f18);
    callback::on_vehicle_spawned(&on_vehicle_spawned);
    callback::on_vehicle_damage(&on_vehicle_damage);
    hidemiscmodels("static_car");
    if (!isdefined(level.var_153ff55b)) {
        level.var_153ff55b = new class_c6c0e94();
        [[ level.var_153ff55b ]]->initialize(#"hash_108b2d4f3cdc46fc", 40, 0.2);
    }
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 0, eflags: 0x6 linked
// Checksum 0x80f724d1, Offset: 0x600
// Size: 0x4
function private finalize() {
    
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 1, eflags: 0x2 linked
// Checksum 0xc4a9364, Offset: 0x610
// Size: 0xc4
function function_483f7f18(params) {
    if (isdefined(self)) {
        a_ai_zombies = function_a38db454(self.origin, 500);
        v_org = self.origin;
    }
    if (isplayer(params.eattacker)) {
        eattacker = params.eattacker;
    }
    if (!isdefined(a_ai_zombies) || !isdefined(v_org)) {
        return;
    }
    if (a_ai_zombies.size > 0) {
        self thread function_76468d55(a_ai_zombies, v_org, eattacker);
    }
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 3, eflags: 0x2 linked
// Checksum 0xb9c8bec5, Offset: 0x6e0
// Size: 0x3c2
function function_76468d55(a_ai_zombies, v_org, eattacker) {
    self endon(#"death");
    for (i = 0; i < a_ai_zombies.size; i++) {
        if (!isalive(a_ai_zombies[i]) || !isactor(a_ai_zombies[i])) {
            continue;
        }
        if (a_ai_zombies[i].var_6f84b820 === #"normal") {
            if (distance2dsquared(v_org, a_ai_zombies[i].origin) <= sqr(250)) {
                if (isdefined(a_ai_zombies[i].var_94378ef)) {
                    damage = abs(a_ai_zombies[i].health - a_ai_zombies[i].var_94378ef);
                    a_ai_zombies[i] dodamage(damage, v_org);
                    if (damage > a_ai_zombies[i].health) {
                        if (isdefined(eattacker)) {
                            function_139ba789(a_ai_zombies[i], eattacker);
                        }
                    }
                } else if (isdefined(eattacker) && isdefined(self)) {
                    self thread function_912eedf3(a_ai_zombies[i], eattacker);
                }
            } else if (isdefined(eattacker) && isdefined(self)) {
                a_ai_zombies[i] thread function_e1c4e1c2(v_org, eattacker, self);
            }
        }
        if (!(a_ai_zombies[i].var_6f84b820 === #"normal")) {
            entity = a_ai_zombies[i];
            /#
                if (!isdefined(entity.basehealth)) {
                    println("<unknown string>");
                }
            #/
            var_6348e344 = entity.maxhealth / (isdefined(entity.basehealth) ? entity.basehealth : 1);
            if (distance2dsquared(v_org, entity.origin) <= sqr(250)) {
                damage = int(750 * var_6348e344);
            } else {
                damage = int(375 * var_6348e344);
            }
            if (isdefined(entity.var_94378ef) && entity.health - damage <= entity.var_94378ef) {
                damage = abs(entity.health - entity.var_94378ef);
            }
            entity dodamage(damage, v_org);
            if (damage > entity.health && isdefined(eattacker)) {
                function_139ba789(entity, eattacker);
            }
        }
        waitframe(1);
    }
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 2, eflags: 0x2 linked
// Checksum 0x7b542ba6, Offset: 0xab0
// Size: 0x180
function function_139ba789(zombie, eattacker) {
    if (!isactor(zombie) || !isplayer(eattacker)) {
        return;
    }
    var_a0d520ae = zombie.var_6f84b820 === #"special";
    iselite = zombie.var_6f84b820 === #"elite";
    [[ level.var_153ff55b ]]->waitinqueue(zombie);
    if (isplayer(eattacker)) {
        if (var_a0d520ae) {
            scoreevents::processscoreevent("driver_kia_special_zm", eattacker, zombie);
        } else if (iselite) {
            scoreevents::processscoreevent("driver_kia_elite_zm", eattacker, zombie);
        } else {
            scoreevents::processscoreevent("driver_kia_zm", eattacker, zombie);
        }
        eattacker zm_stats::increment_challenge_stat(#"hash_1a9d6b83204c7c28");
        eattacker notify(#"hash_72ca0304c836da88", {#zombie:zombie});
    }
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 2, eflags: 0x2 linked
// Checksum 0x1761fb17, Offset: 0xc38
// Size: 0x194
function function_912eedf3(zombie, eattacker) {
    self endon(#"death");
    zombie endon(#"death");
    if (isdefined(zombie) && !is_true(zombie.var_a950813d) && zombie.var_6f84b820 === #"normal" && isdefined(self)) {
        v_dir = vectornormalize(zombie.origin - self.origin);
        v_launch = v_dir * randomintrange(10, 25) + (0, 0, randomintrange(100, 150));
        if (!zombie isragdoll()) {
            zombie zm_utility::start_ragdoll();
            waitframe(2);
            zombie launchragdoll(v_launch);
        }
        level thread function_139ba789(zombie, eattacker);
        zombie.allowdeath = 1;
        zombie kill();
    }
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 3, eflags: 0x2 linked
// Checksum 0xed829112, Offset: 0xdd8
// Size: 0xf4
function function_e1c4e1c2(v_org, eattacker, einflictor) {
    self endon(#"death");
    if (isalive(self)) {
        self dodamage(500, v_org, eattacker, einflictor, "none", "MOD_EXPLOSIVE");
        if (self.var_6f84b820 === #"normal") {
            self zombie_utility::setup_zombie_knockdown(v_org);
            return;
        }
        if (self.var_6f84b820 === #"special" || self.var_6f84b820 === #"elite") {
            self ai::stun(2);
        }
    }
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 1, eflags: 0x2 linked
// Checksum 0x4f3d67f1, Offset: 0xed8
// Size: 0x101c
function vehicle_spawn(s_instance) {
    s_instance.var_2bb61e5b = 0;
    level flag::wait_till_clear(#"hash_6559e11da1f3a7cf");
    var_f6b6b97e = isdefined(s_instance.contentgroups[#"hash_402487319cc06a4c"]) ? s_instance.contentgroups[#"hash_402487319cc06a4c"] : [];
    foreach (var_50b7449f in var_f6b6b97e) {
        if (!getdvarint(#"hash_26ddff5fa2581ab4", 0) && var_50b7449f.vehicletype === "vehicle_motorcycle_mil_us_offroad") {
            arrayremovevalue(var_f6b6b97e, var_50b7449f);
        }
        if ((!getdvarint(#"hash_5b75dfae822b95aa", 0) || level.contentmanager.var_1fcbdf50 === "transport") && (var_50b7449f.vehicletype === "vehicle_t9_mil_ru_truck_transport_player" || var_50b7449f.vehicletype === "vehicle_t9_mil_ru_truck_transport_player_obj_sr")) {
            arrayremovevalue(var_f6b6b97e, var_50b7449f);
        }
        if (!getdvarint(#"hash_1282883dae550662", 0) && var_50b7449f.vehicletype === "vehicle_t9_mil_fav_light") {
            arrayremovevalue(var_f6b6b97e, var_50b7449f);
        }
        if (!getdvarint(#"hash_34cadd3a65bb5361", 0) && var_50b7449f.vehicletype === "vehicle_t9_mil_ru_tank_t72_sr") {
            arrayremovevalue(var_f6b6b97e, var_50b7449f);
        }
        if (isdefined(var_50b7449f.var_501bc8c9)) {
            var_2685dd6d = strtok(var_50b7449f.var_501bc8c9, ", ");
            foreach (var_a2593226 in var_2685dd6d) {
                if (level.contentmanager.var_1fcbdf50 === var_a2593226) {
                    arrayremovevalue(var_f6b6b97e, var_50b7449f);
                    break;
                }
            }
        }
    }
    var_f6b6b97e = array::randomize(var_f6b6b97e);
    if (isdefined(s_instance.script_noteworthy)) {
        s_instance.var_28f56db4 = [];
        s_instance.var_b550f3c3 = [];
        foreach (var_50b7449f in var_f6b6b97e) {
            s_instance.var_b550f3c3[var_50b7449f.script_int] = var_50b7449f;
        }
        var_8ebffad3 = int(s_instance.var_b550f3c3.size * 0.7);
        var_476999d6 = [];
        for (i = 0; i < s_instance.var_b550f3c3.size; i++) {
            var_476999d6[var_476999d6.size] = i + 1;
        }
        var_476999d6 = array::randomize(var_476999d6);
        var_7a436008 = [];
        for (i = 0; i < var_476999d6.size; i++) {
            var_7a436008[var_7a436008.size] = 0;
        }
        foreach (var_50b7449f in var_f6b6b97e) {
            for (i = 0; i < var_8ebffad3; i++) {
                if (var_50b7449f.script_int === var_476999d6[i] && var_7a436008[i] < 4) {
                    vehicle = spawnvehicle(var_50b7449f.vehicletype, var_50b7449f.origin, var_50b7449f.angles, "sr_vehicle");
                    if (isdefined(vehicle)) {
                        if (isdefined(var_50b7449f.var_df2f9ba4)) {
                            vehicle.var_df2f9ba4 = var_50b7449f.var_df2f9ba4;
                            vehicle.s_start = var_50b7449f;
                        }
                        var_7a436008[i] = var_7a436008[i] + var_50b7449f.seats;
                        if (!isdefined(s_instance.location.destination.a_vehicles)) {
                            s_instance.location.destination.a_vehicles = [];
                        } else if (!isarray(s_instance.location.destination.a_vehicles)) {
                            s_instance.location.destination.a_vehicles = array(s_instance.location.destination.a_vehicles);
                        }
                        if (!isinarray(s_instance.location.destination.a_vehicles, vehicle)) {
                            s_instance.location.destination.a_vehicles[s_instance.location.destination.a_vehicles.size] = vehicle;
                        }
                        vehicle.v_org = vehicle.origin;
                        vehicle.v_ang = vehicle.angles;
                        vehicle thread function_17a3dc2f(s_instance);
                        if (vehicle.vehicletype === "vehicle_motorcycle_mil_us_offroad" || vehicle.vehicletype === "vehicle_t9_mil_fav_light") {
                            foreach (var_f8d6002f in var_f6b6b97e) {
                                if (var_f8d6002f != var_50b7449f && var_f8d6002f.script_int === var_50b7449f.script_int && (var_f8d6002f.vehicletype === var_50b7449f.vehicletype || var_f8d6002f.vehicletype === "vehicle_motorcycle_mil_us_offroad")) {
                                    vehicle = spawnvehicle(var_f8d6002f.vehicletype, var_f8d6002f.origin, var_f8d6002f.angles, "sr_vehicle");
                                    if (isdefined(vehicle)) {
                                        if (isdefined(var_50b7449f.var_df2f9ba4)) {
                                            vehicle.var_df2f9ba4 = var_50b7449f.var_df2f9ba4;
                                            vehicle.s_start = var_50b7449f;
                                        }
                                        var_7a436008[i] = var_7a436008[i] + var_50b7449f.seats;
                                        if (!isdefined(s_instance.location.destination.a_vehicles)) {
                                            s_instance.location.destination.a_vehicles = [];
                                        } else if (!isarray(s_instance.location.destination.a_vehicles)) {
                                            s_instance.location.destination.a_vehicles = array(s_instance.location.destination.a_vehicles);
                                        }
                                        if (!isinarray(s_instance.location.destination.a_vehicles, vehicle)) {
                                            s_instance.location.destination.a_vehicles[s_instance.location.destination.a_vehicles.size] = vehicle;
                                        }
                                        vehicle.v_org = vehicle.origin;
                                        vehicle.v_ang = vehicle.angles;
                                        vehicle thread function_17a3dc2f(s_instance);
                                        if (s_instance.var_2bb61e5b >= 4) {
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    foreach (var_50b7449f in var_f6b6b97e) {
        if (s_instance.var_2bb61e5b < 4) {
            if (isdefined(var_50b7449f.var_128ef0fc) && getdvarint(#"hash_5b75dfae822b95aa", 0)) {
                if (isdefined(level.contentmanager.nextspawn) && level.contentmanager.nextspawn.script_int === var_50b7449f.var_128ef0fc) {
                    vehicle = spawnvehicle(var_50b7449f.vehicletype, var_50b7449f.origin, var_50b7449f.angles, "sr_vehicle");
                }
            } else if (!isdefined(var_50b7449f.var_128ef0fc)) {
                vehicle = spawnvehicle(var_50b7449f.vehicletype, var_50b7449f.origin, var_50b7449f.angles, "sr_vehicle");
            }
            if (isdefined(vehicle)) {
                if (isdefined(var_50b7449f.var_df2f9ba4)) {
                    vehicle.var_df2f9ba4 = var_50b7449f.var_df2f9ba4;
                    vehicle.s_start = var_50b7449f;
                }
                if (!isdefined(s_instance.location.destination.a_vehicles)) {
                    s_instance.location.destination.a_vehicles = [];
                } else if (!isarray(s_instance.location.destination.a_vehicles)) {
                    s_instance.location.destination.a_vehicles = array(s_instance.location.destination.a_vehicles);
                }
                if (!isinarray(s_instance.location.destination.a_vehicles, vehicle)) {
                    s_instance.location.destination.a_vehicles[s_instance.location.destination.a_vehicles.size] = vehicle;
                }
                vehicle.v_org = vehicle.origin;
                vehicle.v_ang = vehicle.angles;
                s_instance.var_2bb61e5b += var_50b7449f.seats;
                vehicle thread function_17a3dc2f(s_instance);
                if (vehicle.vehicletype === "vehicle_motorcycle_mil_us_offroad" || vehicle.vehicletype === "vehicle_t9_mil_fav_light") {
                    foreach (var_f8d6002f in var_f6b6b97e) {
                        if (var_f8d6002f != var_50b7449f && var_f8d6002f.script_int === var_50b7449f.script_int && (var_f8d6002f.vehicletype === var_50b7449f.vehicletype || var_f8d6002f.vehicletype === "vehicle_motorcycle_mil_us_offroad")) {
                            vehicle = spawnvehicle(var_f8d6002f.vehicletype, var_f8d6002f.origin, var_f8d6002f.angles, "sr_vehicle");
                            if (isdefined(vehicle)) {
                                if (isdefined(var_50b7449f.var_df2f9ba4)) {
                                    vehicle.var_df2f9ba4 = var_50b7449f.var_df2f9ba4;
                                    vehicle.s_start = var_50b7449f;
                                }
                                if (!isdefined(s_instance.location.destination.a_vehicles)) {
                                    s_instance.location.destination.a_vehicles = [];
                                } else if (!isarray(s_instance.location.destination.a_vehicles)) {
                                    s_instance.location.destination.a_vehicles = array(s_instance.location.destination.a_vehicles);
                                }
                                if (!isinarray(s_instance.location.destination.a_vehicles, vehicle)) {
                                    s_instance.location.destination.a_vehicles[s_instance.location.destination.a_vehicles.size] = vehicle;
                                }
                                vehicle.v_org = vehicle.origin;
                                vehicle.v_ang = vehicle.angles;
                                s_instance.var_2bb61e5b += var_50b7449f.seats;
                                vehicle thread function_17a3dc2f(s_instance);
                                if (s_instance.var_2bb61e5b >= 4) {
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 1, eflags: 0x2 linked
// Checksum 0x5423bd26, Offset: 0x1f00
// Size: 0xc0
function spawn_vehicles(destination) {
    foreach (s_location in destination.locations) {
        s_instance = s_location.instances[#"hash_42f3e9628d7a7b24"];
        if (isdefined(s_instance)) {
            content_manager::spawn_instance(s_instance);
        }
    }
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 1, eflags: 0x2 linked
// Checksum 0xdee439e2, Offset: 0x1fc8
// Size: 0x10c
function function_c772bd2c(destination) {
    level flag::set(#"hash_6559e11da1f3a7cf");
    if (isdefined(destination.destination.a_vehicles)) {
        foreach (vehicle in destination.destination.a_vehicles) {
            if (isdefined(vehicle)) {
                vehicle delete();
                util::wait_network_frame();
            }
        }
    }
    level flag::clear(#"hash_6559e11da1f3a7cf");
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 1, eflags: 0x2 linked
// Checksum 0x3ca2b868, Offset: 0x20e0
// Size: 0x2dc
function function_17a3dc2f(s_instance) {
    self makevehicleusable();
    if (!isdefined(s_instance.a_vehicles)) {
        s_instance.a_vehicles = [];
    } else if (!isarray(s_instance.a_vehicles)) {
        s_instance.a_vehicles = array(s_instance.a_vehicles);
    }
    s_instance.a_vehicles[s_instance.a_vehicles.size] = self;
    if (self.vehicletype === "vehicle_t9_mil_ru_truck_light_player" && (getdvarint(#"hash_11ff4ccbba6b40f6", 0) === 1 || math::cointoss(66))) {
        self thread function_cddedd63(#"hash_1fb3bec008c18436");
        return;
    }
    if (self.vehicletype === "vehicle_t9_mil_fav_light" && (getdvarint(#"hash_11ff4ccbba6b40f6", 0) === 1 || math::cointoss(50))) {
        if (math::cointoss(50)) {
            v_rotate = (0, -90, 0);
            n_x_offset = 40;
        } else {
            v_rotate = (0, 90, 0);
            n_x_offset = -40;
        }
        self thread function_cddedd63(#"hash_43b6b22949e57424", v_rotate, n_x_offset);
        return;
    }
    if (self.vehicletype === "vehicle_t9_civ_ru_sedan_80s_player" && (getdvarint(#"hash_11ff4ccbba6b40f6", 0) === 1 || math::cointoss(50))) {
        if (math::cointoss(50)) {
            v_rotate = (0, -90, 0);
            n_x_offset = 40;
        } else {
            v_rotate = (0, 90, 0);
            n_x_offset = -40;
        }
        self thread function_cddedd63(#"hash_43b6b22949e57424", v_rotate, n_x_offset);
    }
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 1, eflags: 0x0
// Checksum 0x315c5dbc, Offset: 0x23c8
// Size: 0x468
function function_724dafb1(destination) {
    level flag::wait_till_clear(#"hash_6559e11da1f3a7cf");
    a_spawns = function_6465d1fa(destination);
    var_33ffcb09 = 0;
    foreach (spawn in a_spawns) {
        switch (spawn.targetname) {
        case #"mp_map_wide_fav_spawn":
            var_22e1dc7 = "vehicle_t9_mil_fav_light";
            break;
        case #"mp_map_wide_jetski_spawn":
            var_22e1dc7 = "veh_boct_mil_jetski";
            break;
        case #"mp_map_wide_motorcycle_spawn":
            var_22e1dc7 = "vehicle_motorcycle_mil_us_offroad";
            break;
        case #"mp_map_wide_pbr_spawn":
            var_22e1dc7 = "vehicle_boct_mil_boat_pbr";
            break;
        case #"mp_map_wide_snowmobile_spawn":
            var_22e1dc7 = "vehicle_t9_mil_snowmobile";
            break;
        case #"mp_map_wide_uaz_spawn":
            var_22e1dc7 = "vehicle_t9_mil_ru_truck_light_player";
            break;
        default:
            var_22e1dc7 = undefined;
            break;
        }
        if (isdefined(var_22e1dc7) && function_e0a22931(var_22e1dc7)) {
            vehicle = spawnvehicle(var_22e1dc7, spawn.origin, spawn.angles, "sr_vehicle");
            vehicle makevehicleusable();
            if (!isdefined(destination.a_vehicles)) {
                destination.a_vehicles = [];
            } else if (!isarray(destination.a_vehicles)) {
                destination.a_vehicles = array(destination.a_vehicles);
            }
            destination.a_vehicles[destination.a_vehicles.size] = vehicle;
            var_33ffcb09++;
            if (spawn.targetname === "mp_map_wide_uaz_spawn" && (getdvarint(#"hash_11ff4ccbba6b40f6", 0) === 1 || math::cointoss(66))) {
                vehicle thread function_cddedd63(#"hash_1fb3bec008c18436");
            } else if (spawn.targetname === "mp_map_wide_fav_spawn" && (getdvarint(#"hash_11ff4ccbba6b40f6", 0) === 1 || math::cointoss(50))) {
                if (math::cointoss(50)) {
                    v_rotate = (0, -90, 0);
                    n_x_offset = 40;
                } else {
                    v_rotate = (0, 90, 0);
                    n_x_offset = -40;
                }
                vehicle thread function_cddedd63(#"hash_43b6b22949e57424", v_rotate, n_x_offset);
            }
            if (var_33ffcb09 > a_spawns.size / 2 || getvehiclearray().size > 50) {
                return;
            }
            util::wait_network_frame();
        }
    }
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 1, eflags: 0x2 linked
// Checksum 0x866d9ea4, Offset: 0x2838
// Size: 0x26a
function function_6465d1fa(destination) {
    triggers = [];
    if (!isdefined(destination.contentgroups[#"hash_3460aae6bb799a99"])) {
        return [];
    }
    var_a91694c7 = function_de75fe06();
    foreach (struct in destination.contentgroups[#"hash_3460aae6bb799a99"]) {
        triggers[triggers.size] = getent(struct.targetname, "target");
    }
    a_spawns = [];
    if (isarray(triggers)) {
        foreach (spawn in var_a91694c7) {
            var_dcb79cb0 = 0;
            foreach (trigger in triggers) {
                if (trigger istouching(spawn.origin)) {
                    var_dcb79cb0 = 1;
                    break;
                }
            }
            if (!var_dcb79cb0) {
                continue;
            }
            a_spawns[a_spawns.size] = spawn;
        }
    }
    return array::randomize(a_spawns);
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 0, eflags: 0x6 linked
// Checksum 0x41ce5c2f, Offset: 0x2ab0
// Size: 0x116
function private function_de75fe06() {
    var_a91694c7 = [];
    var_86c74be8 = array("mp_map_wide_fav_spawn", "mp_map_wide_jetski_spawn", "mp_map_wide_motorcycle_spawn", "mp_map_wide_pbr_spawn", "mp_map_wide_snowmobile_spawn", "mp_map_wide_uaz_spawn");
    foreach (str_targetname in var_86c74be8) {
        a_points = function_91b29d2a(str_targetname);
        if (isdefined(a_points)) {
            var_a91694c7 = arraycombine(var_a91694c7, a_points, 0, 0);
        }
    }
    return var_a91694c7;
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 3, eflags: 0x2 linked
// Checksum 0x2c883805, Offset: 0x2bd0
// Size: 0x15c
function function_cddedd63(var_1028910, v_angle_offset = (0, 0, 0), n_x_offset) {
    self endon(#"death");
    wait(3);
    if (isdefined(n_x_offset)) {
        v_origin_offset = anglestoright(self.angles) * n_x_offset;
    } else {
        v_origin_offset = (0, 0, 0);
    }
    trigger = spawn("trigger_radius", self.origin, 0, 400, 128);
    struct = spawnstruct();
    struct.origin = self.origin + v_origin_offset;
    struct.angles = self.angles + v_angle_offset;
    struct.var_90d0c0ff = var_1028910;
    trigger.vehicle = self;
    trigger.vehicle_position = self.origin;
    trigger.spawn_struct = struct;
    trigger callback::on_trigger(&namespace_2c949ef8::function_39ee3b21);
}

// Namespace namespace_e51c1e80/enter_vehicle
// Params 1, eflags: 0x20
// Checksum 0xe45370c1, Offset: 0x2d38
// Size: 0xf4
function event_handler[enter_vehicle] codecallback_vehicleenter(eventstruct) {
    var_6031fb1f = eventstruct.vehicle;
    if (isvehicle(var_6031fb1f) && is_true(var_6031fb1f.var_a419f368)) {
        waitframe(1);
        if (isalive(var_6031fb1f)) {
            var_6031fb1f takeplayercontrol();
            while (isalive(var_6031fb1f) && var_6031fb1f function_7548ecb2()) {
                waitframe(1);
            }
            if (isalive(var_6031fb1f)) {
                var_6031fb1f returnplayercontrol();
            }
        }
    }
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 0, eflags: 0x2 linked
// Checksum 0x8903cd86, Offset: 0x2e38
// Size: 0x754
function on_vehicle_spawned() {
    level endon(#"game_ended");
    if (self.scriptvehicletype !== "player_jetski") {
        return;
    }
    var_6031fb1f = self;
    if (isdefined(var_6031fb1f.var_df2f9ba4)) {
        var_6031fb1f.var_a419f368 = 1;
        bundles = struct::get_script_bundle_instances("scene", ["scene_jetski_deploy_" + var_6031fb1f.var_df2f9ba4, "targetname"]);
        foreach (bundle in bundles) {
            if (bundle.var_df2f9ba4 === var_6031fb1f.var_df2f9ba4) {
                bundle.targetname = undefined;
                bundle thread scene::init(bundle.scriptbundlename);
            }
        }
    }
    wait(1);
    waitframe(1);
    if (isdefined(var_6031fb1f)) {
        if (isdefined(bundle)) {
            var_6031fb1f player_vehicle::function_971ca64b();
            if (!isdefined(bundle.script_side)) {
                bundle.script_side = "port";
            }
            var_d487d45c = bundle.scene_ents[#"prop 1"];
            while (!isdefined(var_d487d45c) && isalive(var_6031fb1f)) {
                var_d487d45c = bundle.scene_ents[#"prop 1"];
                waitframe(1);
            }
            if (isalive(var_6031fb1f)) {
                var_6031fb1f.var_369c83bd = 1;
                var_6031fb1f.var_475b9991 = 1;
                var_6031fb1f.var_c0381a15 = 1;
                var_6031fb1f linkto(var_d487d45c, "tag_jetski", (0, 0, 0), (0, 0, 0));
            }
            var_c8229258 = "enter_vehicle";
            if (getdvarint(#"hash_23e9bea0349746ee", 0)) {
                var_c8229258 = "deploy";
            }
            if (isalive(var_6031fb1f)) {
                var_71383cea = var_6031fb1f waittill(#"death", #"delete", var_c8229258);
                if (var_71383cea._notify === "death") {
                    if (isdefined(var_6031fb1f)) {
                        var_6031fb1f notsolid();
                        while (isdefined(var_6031fb1f)) {
                            waitframe(1);
                        }
                    }
                }
            }
            var_75fd5da3 = 1;
            if (isvehicle(var_6031fb1f) && function_a6b2f443(var_6031fb1f)) {
                var_75fd5da3 = 1;
            }
            if (isdefined(bundle)) {
                if (isdefined(bundle) && isdefined(bundle.scriptbundlename)) {
                    bundle thread scene::play(bundle.scriptbundlename);
                    if (isalive(var_6031fb1f)) {
                        var_2e4576cb = groundtrace(var_6031fb1f.origin, var_6031fb1f.origin + (0, 0, -1024), 1, var_6031fb1f, 0, 0);
                        offset = vectorscale(anglestoright(var_6031fb1f.angles) * -1, 8);
                        rotation = 42;
                        if (bundle.script_side == "starboard") {
                            rotation = -42;
                            offset = vectorscale(anglestoright(var_6031fb1f.angles), 8);
                        }
                        var_6b6fec6c = var_2e4576cb[#"position"] + offset;
                        fall_time = abs(distance(var_6031fb1f.origin, var_6b6fec6c) / 390);
                        if (isdefined(var_6031fb1f)) {
                            if (var_75fd5da3) {
                                recenter_time = fall_time + 1;
                                var_6b6fec6c = var_6031fb1f.origin + offset;
                                fall_time = 0.1;
                            }
                            var_c11876a8 = util::spawn_model(#"tag_origin", var_6031fb1f.origin, var_6031fb1f.angles, undefined, 1);
                            while (!isdefined(var_c11876a8) && isalive(var_6031fb1f)) {
                                waitframe(1);
                            }
                            if (isalive(var_6031fb1f)) {
                                var_6031fb1f unlink();
                                var_6031fb1f linkto(var_c11876a8);
                                var_c11876a8 rotateyaw(rotation, fall_time);
                                if (isdefined(var_c11876a8)) {
                                    var_c11876a8 moveto(var_6b6fec6c, fall_time);
                                    var_c11876a8 waittill(#"movedone");
                                }
                            }
                        }
                        player = var_6031fb1f.var_3ba86b09;
                        if (isalive(player) && isdefined(var_6031fb1f)) {
                            player setplayerangles(var_6031fb1f.angles);
                        }
                    }
                }
                if (isdefined(var_6031fb1f)) {
                    var_6031fb1f.var_369c83bd = 0;
                    var_6031fb1f.var_475b9991 = 0;
                    var_6031fb1f.var_c0381a15 = 0;
                    var_6031fb1f unlink();
                    var_6031fb1f.var_a419f368 = 0;
                }
                if (isdefined(var_c11876a8)) {
                    var_c11876a8 delete();
                }
            }
            wait(10);
            if (isalive(var_6031fb1f)) {
                var_6031fb1f player_vehicle::function_a2626745();
            }
        }
    }
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 1, eflags: 0x2 linked
// Checksum 0x1c05479e, Offset: 0x3598
// Size: 0x282
function function_a6b2f443(vehicle) {
    var_33423a7b = getentitiesinradius(vehicle.origin, 256, 12);
    foreach (var_59efbf47 in var_33423a7b) {
        if (isvehicle(vehicle) && isvehicle(var_59efbf47)) {
            var_f29b8c9e = 1;
            for (i = 0; i < 3; i++) {
                occupant = var_59efbf47 getseatoccupant(i);
                if (isplayer(occupant)) {
                    var_f29b8c9e = 1;
                }
            }
            if (vehicle == var_59efbf47 || !var_f29b8c9e) {
                continue;
            }
            var_26f1579c = 0;
            if (vehicle.vehicletype === var_59efbf47.vehicletype) {
                var_26f1579c = 128;
            } else if (var_59efbf47.vehicletype === #"hash_2c0e11a1e87bbcd5") {
                var_26f1579c = 256;
            }
            /#
                if (getdvarint(#"hash_1a2565fdb8e16ca9", 0)) {
                    sphere(vehicle.origin, 32, (1, 0, 0));
                    circle(var_59efbf47.origin, var_26f1579c, (1, 0, 0), undefined, 1);
                }
            #/
            if (distance2dsquared(vehicle.origin, var_59efbf47.origin) <= var_26f1579c * var_26f1579c) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_e51c1e80/namespace_e51c1e80
// Params 1, eflags: 0x2 linked
// Checksum 0xd08e28e8, Offset: 0x3828
// Size: 0x20c
function on_vehicle_damage(params) {
    vehicle = self;
    if (!is_true(vehicle.isplayervehicle)) {
        return;
    }
    if (isdefined(params.eattacker) && isactor(params.eattacker)) {
        if (params.eattacker.archetype === #"raz" && params.smeansofdeath === "MOD_EXPLOSIVE") {
            vehicle dodamage(500, params.eattacker.origin, params.eattacker);
            vehicle playrumbleonentity("sr_prototype_vehicle_run_over");
            occupants = vehicle getvehoccupants();
            foreach (occupant in occupants) {
                if (isalive(occupant)) {
                    occupant clientfield::increment_to_player("zombie_vehicle_shake", 1);
                }
            }
        }
        return;
    }
    if (params.weapon === getweapon("molotov_fire")) {
        vehicle dodamage(100, vehicle.origin);
    }
}

