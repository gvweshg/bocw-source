// Atian COD Tools GSC CW decompiler test
#using script_1940fc077a028a81;
#using script_3411bb48d41bd3b;
#using scripts\core_common\ai\archetype_mimic.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_quick_spawning.gsc;
#using scripts\zm_common\zm_destination_manager.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm.gsc;
#using script_2c5daa95f8fec03c;
#using script_3a704cbcf4081bfb;
#using script_3819e7a1427df6d2;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\content_manager.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_ai_mimic;

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 0, eflags: 0x5
// Checksum 0x286b65f, Offset: 0x2f8
// Size: 0x4c
function private autoexec __init__system__() {
    system::register(#"zm_ai_mimic", &preinit, &postinit, undefined, "zm_destination_manager");
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0x69c9b46d, Offset: 0x350
// Size: 0x1c4
function preinit() {
    spawner::add_archetype_spawn_function(#"mimic", &function_76433e31);
    spawner::function_89a2cd87(#"mimic", &function_820e5ac3);
    zm_cleanup::function_cdf5a512(#"mimic", &function_5394f283);
    clientfield::register("actor", "mimic_show_on_minimap", 16000, 1, "int");
    clientfield::register("actor", "mimic_cleanup_teleport", 16000, 1, "counter");
    clientfield::register("toplayer", "mimic_range_hit", 16000, 1, "counter");
    if (!isdefined(level.var_cdfc836d)) {
        level.var_cdfc836d = &function_f826fb47;
    }
    if (!isdefined(level.var_e1712840)) {
        level.var_e1712840 = &function_42e3209f;
    }
    if (!isdefined(level.var_64aa9d51)) {
        level.var_64aa9d51 = &function_64aa9d51;
    }
    if (!isdefined(level.var_f29dd47)) {
        level.var_f29dd47 = &function_f29dd47;
    }
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0x7c564d9a, Offset: 0x520
// Size: 0xac
function postinit() {
    if (zm_utility::is_classic()) {
        callback::add_callback(#"hash_3065435e3005a796", &function_ff1fe53a);
        callback::add_callback(#"hash_2745091e63972f13", &function_59042f87);
        level flag::wait_till("start_zombie_round_logic");
        waittillframeend();
        function_218c4ce8();
    }
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x2ff344ce, Offset: 0x5d8
// Size: 0xcc
function function_ff1fe53a(params) {
    if (!isdefined(params.player)) {
        return;
    }
    params.player.var_4ded0009 = isdefined(params.player.last_valid_position) ? params.player.last_valid_position : getclosestpointonnavmesh(params.player.origin, 32);
    /#
        if (isdefined(params.player.var_4ded0009)) {
            recordstar(params.player.var_4ded0009, (1, 0, 1), "<unknown string>");
        }
    #/
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x16267639, Offset: 0x6b0
// Size: 0x106
function function_59042f87(params) {
    if (!isdefined(params.player)) {
        return;
    }
    if (isdefined(params.player.var_4ded0009) && !zm_zonemgr::function_66bf6a43(params.player.origin, 0)) {
        /#
            recordstar(params.player.var_4ded0009, (1, 0, 1), "<unknown string>");
            record3dtext("<unknown string>", params.player.var_4ded0009, (1, 0, 1), "<unknown string>");
        #/
        params.player setorigin(params.player.var_4ded0009);
    }
    params.player.var_4ded0009 = undefined;
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0x27886bc5, Offset: 0x7c0
// Size: 0xd4
function function_76433e31() {
    self.b_ignore_cleanup = 1;
    self.var_22492afd = "mimic_range_hit";
    self.var_f6fd2062 = &function_c8444dac;
    self.closest_player_override = &zm_utility::function_3d70ba7a;
    self.melee_distance_check = &namespace_e292b080::function_e8983bf3;
    self callback::function_d8abfc3d(#"hash_484127e0cbd8f8cb", &function_7c591227);
    aiutility::addaioverridedamagecallback(self, &function_fe78c504);
    level thread zm_spawner::zombie_death_event(self);
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0xc8c3b31f, Offset: 0x8a0
// Size: 0x174
function function_820e5ac3() {
    self.completed_emerging_into_playable_area = 1;
    self.canbetargetedbyturnedzombies = 1;
    self.var_58c4c69b = 1;
    self.var_318a0ac8 = &function_c41a996d;
    self.var_154478e3 = 8192;
    self callback::function_d8abfc3d(#"hash_29cb63a7ebb5d699", &function_5c2b66f6);
    if (!is_true(self.var_2ca2d270) && is_true(self.var_7a5e475)) {
        self function_8b6bfa1();
    } else if (!is_true(self.var_2ca2d270)) {
        self function_c0b09ab0();
    }
    self setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
    namespace_81245006::initweakpoints(self);
    self thread zm_audio::zmbaivox_notifyconvert();
    self thread zm_audio::play_ambient_zombie_vocals();
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0xf65c4a1e, Offset: 0xa20
// Size: 0x9c
function function_c0b09ab0() {
    self clientfield::set("mimic_emerge_fx", 1);
    self.var_a516906f = {#origin:self.origin, #angles:self.angles};
    self.var_a516906f.anim = #"hash_66ffb0e987e7ed06";
    self animcustom(&archetype_mimic::function_f3b371f1);
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x95ff6566, Offset: 0xac8
// Size: 0x2a
function function_c8444dac(player) {
    return zm_utility::is_player_valid(player, 1, 0, 0, 0);
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x71df014b, Offset: 0xb00
// Size: 0x82
function function_7c591227(params) {
    self.b_ignore_cleanup = undefined;
    self val::reset_all(#"hash_195d34d606e6ced8");
    self clientfield::set("mimic_show_on_minimap", 0);
    var_1be227f1 = array::random(params.activators);
    self.favoriteenemy = var_1be227f1;
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0xe630cb75, Offset: 0xb90
// Size: 0x8c
function function_5c2b66f6(*prop) {
    self.b_ignore_cleanup = 1;
    self val::set(#"hash_195d34d606e6ced8", "takedamage", 0);
    self val::set(#"hash_195d34d606e6ced8", "allowdeath", 0);
    self clientfield::set("mimic_show_on_minimap", 1);
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 2, eflags: 0x2 linked
// Checksum 0xb47643b4, Offset: 0xc28
// Size: 0x130
function function_9832759c(origin, num_points) {
    points = namespace_85745671::function_e4791424(origin, int(max(10, num_points)), 50, 1000, 0, undefined, 0);
    spawn_points = [];
    foreach (point in points) {
        if (!isdefined(arraygetclosest(point.origin, level.var_5fafe5ac, 32))) {
            spawn_points[spawn_points.size] = point;
            if (spawn_points.size >= num_points) {
                break;
            }
        }
    }
    return spawn_points;
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 2, eflags: 0x2 linked
// Checksum 0x715851d0, Offset: 0xd60
// Size: 0x26a
function function_7a3d3a78(zone_name, spawn_points) {
    if (!isdefined(zone_name) || !isstring(zone_name) && !ishash(zone_name)) {
        return spawn_points;
    }
    var_417b1b19 = struct::get_array(zone_name + "_no_mimic_prop_node", "targetname");
    if (var_417b1b19.size == 0) {
        return spawn_points;
    }
    var_c0477d03 = [];
    foreach (point in spawn_points) {
        var_b3602c14 = 1;
        foreach (var_da3caad0 in var_417b1b19) {
            if (abs(point.origin[2] - var_da3caad0.origin[2]) < var_da3caad0.halfheight && distance2d(var_da3caad0.origin, point.origin) < var_da3caad0.radius) {
                var_b3602c14 = 0;
                break;
            }
        }
        if (var_b3602c14) {
            if (!isdefined(var_c0477d03)) {
                var_c0477d03 = [];
            } else if (!isarray(var_c0477d03)) {
                var_c0477d03 = array(var_c0477d03);
            }
            var_c0477d03[var_c0477d03.size] = point;
        }
    }
    return var_c0477d03;
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 3, eflags: 0x2 linked
// Checksum 0x45042a08, Offset: 0xfd8
// Size: 0x350
function function_64aa9d51(origin, num_points = 1, zone = undefined) {
    players = function_a1ef346b();
    foreach (index, player in players) {
        if (!zm_utility::is_player_valid(player) || is_true(player.var_16735873)) {
            players[index] = undefined;
        }
    }
    arrayremovevalue(players, undefined);
    if (players.size) {
        player = players[randomint(player.size)];
    } else {
        players = function_a1ef346b();
        player = players[randomint(players.size)];
    }
    if (!isdefined(player)) {
        return [];
    }
    var_535c0e37 = player geteye();
    zone = isdefined(zone) ? zone : player zm_utility::get_current_zone(1, 1);
    if (!isdefined(zone) && isdefined(origin)) {
        zone_name = zm_zonemgr::get_zone_from_position(origin);
        if (isdefined(zone_name)) {
            zone = level.zones[zone_name];
        }
    } else if (!isdefined(zone)) {
        active_zone_names = zm_zonemgr::get_active_zone_names();
        zone = level.zones[active_zone_names[randomint(active_zone_names.size)]];
    }
    if (isdefined(zone) && isdefined(var_535c0e37)) {
        spawn_points = self function_2da86e43(zone, var_535c0e37);
    }
    if (!isdefined(spawn_points) || !spawn_points.size) {
        if (isdefined(zone) && !isdefined(origin)) {
            origin = zone.nodes[randomint(zone.nodes.size)].origin;
        }
        if (isdefined(origin)) {
            spawn_points = function_9832759c(origin, num_points);
        }
    }
    spawn_points = function_7a3d3a78(zone.name, spawn_points);
    return isdefined(spawn_points) ? spawn_points : [];
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0xaa55c24e, Offset: 0x1330
// Size: 0x8a
function function_5394f283() {
    if (is_true(self.never_hide)) {
        b_result = self mimic_cleanup_teleport();
    } else {
        b_result = self function_ce42b67b();
    }
    if (is_true(b_result)) {
        self.completed_emerging_into_playable_area = 1;
    }
    return is_true(b_result);
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0x86b81460, Offset: 0x13c8
// Size: 0xb8
function mimic_cleanup_teleport() {
    self endon(#"death");
    if (level.zm_loc_types[#"mimic_location"].size > 0) {
        s_spawn_loc = array::random(level.zm_loc_types[#"mimic_location"]);
        self zm_ai_utility::function_a8dc3363(s_spawn_loc);
        self function_c0b09ab0();
    } else {
        println("<unknown string>");
    }
    return true;
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0x9dab07b9, Offset: 0x1488
// Size: 0x186
function function_ce42b67b() {
    level endon(#"end_game");
    self endon(#"death");
    spawn_points = function_64aa9d51();
    if (!isarray(spawn_points) || !spawn_points.size) {
        self.b_ignore_cleanup = 1;
        return true;
    }
    var_b2aa54a9 = spawn_points[randomint(spawn_points.size)];
    self zm_ai_utility::function_a8dc3363(var_b2aa54a9);
    if (isdefined(self.var_a6fe91fd)) {
        foreach (prop in self.var_a6fe91fd) {
            level thread mimic_prop_spawn::clean_up_prop(prop);
        }
        arrayremovevalue(self.var_a6fe91fd, undefined);
    }
    self.should_hide = 1;
    return true;
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0xba17f2df, Offset: 0x1618
// Size: 0x31c
function function_8b6bfa1() {
    self endon(#"death");
    var_f6e30076 = randomintrangeinclusive(3, 5);
    if (mimic_prop_spawn::function_1541ff3a(var_f6e30076, self)) {
        mimic_prop_spawn::function_861757a2(self);
        self val::set(#"mimic_spawn", "hide", 1);
        self notsolid();
        self setgoal(self.origin);
        self pathmode("dont move", 1);
        self.takedamage = 0;
        zone = self zm_utility::get_current_zone(1);
        if (!isdefined(zone)) {
            target_player = self function_62b67aab();
            if (!isdefined(target_player)) {
                target_player = array::random(function_a1ef346b());
            }
            zone = self function_a7a45f60(target_player);
        }
        spawn_points = function_7b8e26b3(level.var_6e175eb, zone.name, "script_noteworthy");
        if (isdefined(zone) && (!isdefined(spawn_points) || !spawn_points.size)) {
            spawn_points = function_64aa9d51(self.origin, var_f6e30076, zone);
        }
        if (!isdefined(spawn_points)) {
            spawn_points = [];
        }
        props = mimic_prop_spawn::spawn_props(spawn_points, var_f6e30076, self);
        self val::reset(#"mimic_spawn", "hide");
        self solid();
        self pathmode("move allowed");
        self.takedamage = 1;
        if (props.size) {
            mimic_prop_spawn::function_913ecbbc(props, self);
        } else {
            /#
                if (is_true(level.var_bce8fb65)) {
                    println("<unknown string>" + "<unknown string>");
                }
            #/
        }
        mimic_prop_spawn::function_8c7b02b0(self);
    }
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 1, eflags: 0x0
// Checksum 0xa0bfa58, Offset: 0x1940
// Size: 0x1b0
function spawn_single(var_eb3a8721) {
    if (isdefined(var_eb3a8721)) {
        s_spawn_loc = var_eb3a8721;
    } else if (isdefined(level.var_7ad32862)) {
        s_spawn_loc = [[ level.var_7ad32862 ]]();
    } else if (level.zm_loc_types[#"mimic_location"].size > 0) {
        s_spawn_loc = array::random(level.zm_loc_types[#"mimic_location"]);
    }
    if (!isdefined(s_spawn_loc)) {
        /#
            if (getdvarint(#"hash_1f8efa579fee787c", 0)) {
                iprintlnbold("<unknown string>");
            }
        #/
        return undefined;
    }
    ai = spawnactor(#"spawner_bo5_mimic", s_spawn_loc.origin, s_spawn_loc.angles);
    if (isdefined(ai)) {
        ai.var_7a5e475 = 0;
        ai.never_hide = 1;
        ai.b_ignore_cleanup = undefined;
        ai.script_string = s_spawn_loc.script_string;
        ai.find_flesh_struct_string = s_spawn_loc.find_flesh_struct_string;
        ai.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
        ai forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
    }
    return ai;
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0x72678dfd, Offset: 0x1af8
// Size: 0x11a
function function_62b67aab() {
    if (zm_utility::is_player_valid(self.favoriteenemy, 0, 0, 0, 0)) {
        return self.favoriteenemy;
    } else {
        found_player = 0;
        players = array::randomize(function_a1ef346b());
        foreach (player in players) {
            if (player === self.favoriteenemy) {
                continue;
            }
            if (zm_utility::is_player_valid(player, 0, 0, 0, 0)) {
                return player;
            }
        }
    }
    return undefined;
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x4abc020b, Offset: 0x1c20
// Size: 0x18a
function function_a7a45f60(target_player) {
    var_7bc72d27 = zm_quick_spawning::function_f1ec5df(target_player, target_player getvelocity(), 1);
    if (var_7bc72d27.size) {
        player_zone = var_7bc72d27[randomint(var_7bc72d27.size)];
        var_90c5ed0c = player_zone.name;
    } else {
        if (!isdefined(player_zone)) {
            player_zone = target_player zm_utility::get_current_zone(1);
        }
        if (!isdefined(player_zone)) {
            return undefined;
        }
        var_90c5ed0c = undefined;
        foreach (name, struct in player_zone.adjacent_zones) {
            if (!struct.is_connected) {
                continue;
            }
            var_90c5ed0c = name;
            break;
        }
        if (!isdefined(var_90c5ed0c)) {
            var_90c5ed0c = player_zone.name;
        }
    }
    var_3be6f4b6 = level.zones[var_90c5ed0c];
    if (var_3be6f4b6.nodes.size) {
        return var_3be6f4b6;
    }
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 2, eflags: 0x2 linked
// Checksum 0xca93d3a9, Offset: 0x1db8
// Size: 0x1a6
function function_2da86e43(zone_struct, var_535c0e37) {
    if (!isdefined(var_535c0e37)) {
        target_player = arraygetclosest(self.origin, function_a1ef346b());
        var_535c0e37 = target_player geteye();
    }
    node = array::random(zone_struct.nodes);
    var_2be42166 = tacticalquery(#"hash_744e744b6f78bb27", node, var_535c0e37);
    points = [];
    foreach (point in var_2be42166) {
        if (!isdefined(arraygetclosest(point.origin, level.var_5fafe5ac, 32))) {
            points[points.size] = point;
        }
    }
    if (!points.size) {
        points = array::randomize(var_2be42166);
    }
    if (points.size) {
        return var_2be42166;
    }
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0xe44900bb, Offset: 0x1f68
// Size: 0x1a8
function function_f826fb47(spawn_loc) {
    if (isdefined(spawn_loc.scriptbundlename)) {
        bundle = getscriptbundle(spawn_loc.scriptbundlename);
        if (!isdefined(bundle)) {
            return undefined;
        }
        model_entry = bundle.var_e451a3f7[randomint(bundle.var_e451a3f7.size)];
        if (!isdefined(model_entry)) {
            return undefined;
        }
        pos_offset = (isdefined(model_entry.offset_x) ? model_entry.offset_x : 0, isdefined(model_entry.offset_y) ? model_entry.offset_y : 0, isdefined(model_entry.offset_z) ? model_entry.offset_z : 0);
        angle_offset = (isdefined(model_entry.pitch) ? model_entry.pitch : 0, isdefined(model_entry.yaw) ? model_entry.yaw : 0, isdefined(model_entry.roll) ? model_entry.roll : 0);
        return {#prop_name:model_entry.model, #pos_offset:pos_offset, #angle_offset:angle_offset};
    }
    return undefined;
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0xb780ab18, Offset: 0x2118
// Size: 0x854
function function_218c4ce8() {
    if (!isdefined(level.var_6e175eb)) {
        level.var_6e175eb = [];
    }
    var_8e76d54d = [{#name:#"ammo_cache", #type:0}, {#name:#"hash_629e563c2ebf707a", #type:0}, {#name:#"crafting_table", #type:0}, {#name:#"hash_6217ef2a3d7d895b", #type:0}, {#name:#"hash_448adaf187bbb953", #type:0}, {#name:#"explore_chests", #type:0}, {#name:#"explore_chests_large", #type:0}, {#name:#"explore_chests_small", #type:0}];
    mapdestinations = struct::get_array(#"hash_313be7fccc870cdd", "variantname");
    if (isdefined(mapdestinations) && mapdestinations.size > 0) {
        foreach (location in mapdestinations[0].locations) {
            foreach (info in var_8e76d54d) {
                if (!isdefined(location.instances[info.name])) {
                    continue;
                }
                instance = location.instances[info.name];
                var_283bf51b = content_manager::get_children(instance);
                foreach (struct in var_283bf51b) {
                    if (!is_true(struct.b_spawned)) {
                        continue;
                    }
                    struct.lure_prop_type = info.type;
                    level.var_6e175eb[level.var_6e175eb.size] = struct;
                }
            }
        }
        mimic_prop_spawn::function_da3be96b(0, &mimic_prop_spawn::function_6fe38c03, &function_9542c864);
    }
    if (isdefined(level.var_976841f)) {
        foreach (trigger_stub in level.var_976841f) {
            trigger_stub.lure_prop_type = 1;
            level.var_6e175eb[level.var_6e175eb.size] = trigger_stub;
        }
        mimic_prop_spawn::function_da3be96b(1, &function_c4a57e80, &function_9542c864);
    }
    if (isdefined(mapdestinations) && mapdestinations.size > 0) {
        location = mapdestinations[0].locations[#"loot_pods"];
        if (isdefined(location.instances[#"loot_pods"])) {
            instance = location.instances[#"loot_pods"];
            if (isdefined(instance.a_models) && isarray(instance.a_models)) {
                foreach (var_37180a9f in instance.a_models) {
                    var_926eb7ac = {#lure_prop_type:2, #prop:var_37180a9f, #angles:var_37180a9f.angles, #origin:var_37180a9f.origin};
                    level.var_6e175eb[level.var_6e175eb.size] = var_926eb7ac;
                }
            }
        }
        mimic_prop_spawn::function_da3be96b(2, &mimic_prop_spawn::function_644d4bf6, &function_9542c864);
    }
    vehicles = getvehiclearray();
    if (isdefined(vehicles)) {
        foreach (vehicle in vehicles) {
            spawn_struct = {#lure_prop_type:3, #prop:vehicle, #angles:vehicle.angles, #origin:vehicle.origin};
            level.var_6e175eb[level.var_6e175eb.size] = spawn_struct;
        }
    }
    level.var_7f1cce33 = &function_8fa4773e;
    mimic_prop_spawn::function_da3be96b(3, &mimic_prop_spawn::function_6f514803, &function_9542c864);
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 2, eflags: 0x6 linked
// Checksum 0x83adc22b, Offset: 0x2978
// Size: 0x48
function private function_8fa4773e(vehicle, player) {
    if (is_true(vehicle.var_2e8a136f)) {
        mimic_prop_spawn::function_95f8029e(player);
        return 0;
    }
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0x307626c2, Offset: 0x29c8
// Size: 0x4a
function function_42e3209f() {
    var_39ab7f8c = getaiarchetypearray(#"zombie", level.zombie_team);
    return function_d59a3443(var_39ab7f8c);
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0xd94f5cb4, Offset: 0x2a20
// Size: 0xc6
function function_9542c864(var_e663e7c5) {
    if (!isdefined(var_e663e7c5.zone_name)) {
        navmesh_point = getclosestpointonnavmesh(var_e663e7c5.origin + anglestoforward(var_e663e7c5.angles) * 32, 128);
        if (!isdefined(navmesh_point)) {
            return false;
        }
        var_e663e7c5.zone_name = zm_zonemgr::get_zone_from_position(navmesh_point + (0, 0, 15), 1);
    }
    if (!zm_zonemgr::zone_is_enabled(var_e663e7c5.zone_name)) {
        return false;
    }
    return true;
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x8922a04a, Offset: 0x2af0
// Size: 0x98
function function_c4a57e80(prop_struct) {
    if (prop_struct.targetname === "zombie_vending") {
        return {#prop:function_b703696e(prop_struct, &function_b2b03bc, &function_f7e48831, &function_8afb304d), #activation_func:&mimic_prop_spawn::function_204a610e};
    }
    return undefined;
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 4, eflags: 0x2 linked
// Checksum 0xc188e321, Offset: 0x2b90
// Size: 0xa0
function function_b703696e(prop_struct, var_374304ac, var_e06892e6, trigger_func) {
    trap_prop = prop_struct.machine;
    trap_prop.stub = prop_struct;
    trap_prop.spawn_loc = prop_struct;
    trap_prop.var_3c964886 = var_374304ac;
    trap_prop.var_5faf570 = prop_struct.trigger_func;
    trap_prop.var_9e9b72eb = var_e06892e6;
    prop_struct.trigger_func = trigger_func;
    zm_unitrigger::reregister_unitrigger(prop_struct);
    return trap_prop;
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 1, eflags: 0x6 linked
// Checksum 0x351c3eb8, Offset: 0x2c38
// Size: 0x14c
function private function_fe5c51d(trap_prop) {
    level endon(#"game_ended");
    trap_prop.stub.var_14e12a20 = trap_prop.stub.prompt_and_visibility_func;
    trap_prop.stub.prompt_and_visibility_func = trap_prop.var_9e9b72eb;
    trap_prop.var_9e9b72eb = undefined;
    trap_prop.stub.trigger_func = trap_prop.var_5faf570;
    trap_prop.var_5faf570 = undefined;
    zm_unitrigger::reregister_unitrigger(trap_prop.stub);
    trap_prop val::set(#"hash_48bf02d0d1665e1a", "hide", 2);
    wait(5);
    trap_prop.stub.prompt_and_visibility_func = trap_prop.stub.var_14e12a20;
    trap_prop.stub.var_14e12a20 = undefined;
    trap_prop val::reset(#"hash_48bf02d0d1665e1a", "hide");
    zm_unitrigger::reregister_unitrigger(trap_prop.stub);
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x96238d73, Offset: 0x2d90
// Size: 0x24
function function_b2b03bc(trap_prop) {
    trap_prop thread function_fe5c51d(trap_prop);
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x8fccccb9, Offset: 0x2dc0
// Size: 0xe
function function_f7e48831(*player) {
    return false;
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0x813bff99, Offset: 0x2dd8
// Size: 0x8c
function function_8afb304d() {
    self endon(#"death");
    waitresult = self waittill(#"trigger");
    player = waitresult.activator;
    self.stub.machine notify(#"hash_1e8aabc2641542e", {#activator:player});
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 13, eflags: 0x2 linked
// Checksum 0x7d220c5f, Offset: 0x2e70
// Size: 0x70
function function_fe78c504(*inflictor, *attacker, damage, *dflags, *meansofdeath, *weapon, *var_fd90b0bb, *vpoint, *dir, *shitloc, *offsettime, *boneindex, *modelindex) {
    return modelindex;
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 13, eflags: 0x6 linked
// Checksum 0xf9eb011d, Offset: 0x2ee8
// Size: 0x184
function private function_c41a996d(*einflictor, *eattacker, idamage, *idflags, *smeansofdeath, weapon, *var_fd90b0bb, vpoint, *vdir, shitloc, *psoffsettime, *boneindex, *surfacetype) {
    var_ebcff177 = 1;
    if (self flag::get("kill_hvt_teleporting")) {
        weakpoint = namespace_81245006::function_3131f5dd(self, surfacetype, 1);
        self.var_6936b30b = {#weakpoint:weakpoint, #var_ebcff177:4};
        return {#damage:0, #var_ebcff177:4};
    }
    if (!killstreaks::is_killstreak_weapon(psoffsettime) && self zm_utility::function_4562a3ef(surfacetype, boneindex)) {
        var_ebcff177 = 2;
    }
    return {#damage:shitloc, #var_ebcff177:var_ebcff177};
}

// Namespace zm_ai_mimic/zm_ai_mimic
// Params 2, eflags: 0x2 linked
// Checksum 0x679e1fd3, Offset: 0x3078
// Size: 0x104
function function_f29dd47(var_d0f07bcd, var_3b5d9ccd) {
    zone_name = zm_zonemgr::function_49d8d29f(var_d0f07bcd, 1);
    if (!isdefined(zone_name)) {
        return undefined;
    }
    locations = array::randomize(var_3b5d9ccd);
    foreach (loc in locations) {
        var_1fd701b3 = zm_zonemgr::function_49d8d29f(loc.origin, 1);
        if (var_1fd701b3 === zone_name) {
            return loc;
        }
    }
    return undefined;
}

