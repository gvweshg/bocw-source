// Atian COD Tools GSC CW decompiler test
#using script_215d7818c548cb51;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\item_world.gsc;
#using scripts\core_common\content_manager.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_957938f0;

// Namespace namespace_957938f0/namespace_957938f0
// Params 0, eflags: 0x5
// Checksum 0x921beccb, Offset: 0x288
// Size: 0x44
function private autoexec __init__system__() {
    system::register(#"hash_3256c1e06451aec4", &preinit, undefined, undefined, #"content_manager");
}

// Namespace namespace_957938f0/namespace_957938f0
// Params 0, eflags: 0x2 linked
// Checksum 0x5200fc09, Offset: 0x2d8
// Size: 0x19c
function preinit() {
    if (!zm_utility::is_survival()) {
        return;
    }
    if (!is_true(getgametypesetting(#"hash_318abd2654cf527a")) && !getdvarint(#"hash_1afcd13f069fa385", 0)) {
        return;
    }
    content_manager::register_script(#"hash_77bdab265fe2ca2c", &function_e7e5c90d);
    clientfield::register("scriptmover", "jump_pad_active", 1, 1, "int");
    clientfield::register("scriptmover", "jump_pad_essence_fx", 1, 1, "int");
    clientfield::register("scriptmover", "jump_pad_amb_sound_lp", 1, 1, "int");
    clientfield::register("toplayer", "jump_pad_wind_sound", 1, 1, "int");
    visionset_mgr::register_info("overlay", "sr_jump_pad_visionset", 1, 81, 1, 1);
}

// Namespace namespace_957938f0/namespace_957938f0
// Params 1, eflags: 0x2 linked
// Checksum 0xc74ac5c0, Offset: 0x480
// Size: 0x12c
function function_4317fa79(destination) {
    if (!is_true(getgametypesetting(#"hash_318abd2654cf527a")) && !getdvarint(#"hash_1afcd13f069fa385", 0)) {
        return;
    }
    foreach (s_location in destination.locations) {
        if (isdefined(s_location.instances[#"hash_77bdab265fe2ca2c"])) {
            content_manager::spawn_instance(s_location.instances[#"hash_77bdab265fe2ca2c"]);
            break;
        }
    }
}

// Namespace namespace_957938f0/namespace_957938f0
// Params 1, eflags: 0x6 linked
// Checksum 0x2b787fc7, Offset: 0x5b8
// Size: 0x126
function private function_bf25e268(var_193b9763) {
    foreach (var_5207017 in var_193b9763) {
        if (issubstr(var_5207017.targetname, "auto12")) {
            var_5207017.v_launch = (0, 450, 1300) - (0, 0, 50);
            continue;
        }
        if (issubstr(var_5207017.targetname, "auto14")) {
            var_5207017.origin += anglestoright(var_5207017.angles) * 32 + (0, 0, -5);
        }
    }
}

// Namespace namespace_957938f0/namespace_957938f0
// Params 1, eflags: 0x6 linked
// Checksum 0xc3a76a5c, Offset: 0x6e8
// Size: 0x654
function private function_e7e5c90d(s_instance) {
    s_instance endon(#"cleanup");
    s_instance flag::clear("cleanup");
    s_instance callback::function_d8abfc3d(#"hash_345e9169ebba28fb", &function_1b543d55);
    var_193b9763 = array::randomize(isdefined(s_instance.contentgroups[#"hash_217548aa85422a7e"]) ? s_instance.contentgroups[#"hash_217548aa85422a7e"] : []);
    var_cc2b6592 = randomintrangeinclusive(3, 5);
    var_3cdf505d = 0;
    /#
        if (getdvarint(#"hash_1afcd13f069fa385", 0)) {
            var_cc2b6592 = var_193b9763.size;
        }
    #/
    if (util::get_map_name() === "mp_dune") {
        function_bf25e268(var_193b9763);
    }
    foreach (var_5207017 in var_193b9763) {
        if (isdefined(var_5207017.var_501bc8c9)) {
            var_2685dd6d = strtok(var_5207017.var_501bc8c9, ", ");
            foreach (var_a2593226 in var_2685dd6d) {
                if (level.contentmanager.var_1fcbdf50 === var_a2593226) {
                    var_e7f5b3e0 = 0;
                    break;
                }
            }
            if (is_false(var_e7f5b3e0)) {
                continue;
            }
        }
        if (!isdefined(s_instance.var_193b9763)) {
            s_instance.var_193b9763 = [];
        } else if (!isarray(s_instance.var_193b9763)) {
            s_instance.var_193b9763 = array(s_instance.var_193b9763);
        }
        s_instance.var_193b9763[s_instance.var_193b9763.size] = var_5207017;
        var_5207017.var_30b30aea = content_manager::spawn_script_model(var_5207017, #"hash_2ce231d4d16efcac", 1);
        var_5207017.var_30b30aea hide();
        var_5207017.var_126a8ffb = content_manager::spawn_script_model(var_5207017, #"hash_31994e81355d0644");
        var_5207017.var_126a8ffb setforcenocull();
        var_5207017.var_126a8ffb clientfield::set("jump_pad_amb_sound_lp", 1);
        v_offset = anglestoright(var_5207017.angles) * -20 + (0, 0, 64);
        var_5207017.trigger = content_manager::spawn_interact(var_5207017, &function_2558caae, #"hash_6ba513ca9aca2762", 500, 48, 64, undefined, v_offset);
        var_5207017.trigger.var_5207017 = var_5207017;
        var_5207017.trigger thread zm_utility::function_2256923f(500);
        var_5207017.var_e2d1273 = [];
        var_50ebf8f1 = struct::get_array(var_5207017.targetname, "target");
        foreach (s_struct in var_50ebf8f1) {
            if (s_struct.content_key === #"hash_245e465fa05ffffe") {
                var_5207017.s_target = s_struct;
                continue;
            }
            if (!isdefined(var_5207017.var_e2d1273)) {
                var_5207017.var_e2d1273 = [];
            } else if (!isarray(var_5207017.var_e2d1273)) {
                var_5207017.var_e2d1273 = array(var_5207017.var_e2d1273);
            }
            var_5207017.var_e2d1273[var_5207017.var_e2d1273.size] = s_struct;
        }
        var_5207017 thread function_e6d9e6cd();
        var_5207017.n_obj_id = zm_utility::function_f5a222a8(#"hash_2be74d977110324a", var_5207017.origin);
        var_3cdf505d++;
        if (var_3cdf505d >= var_cc2b6592) {
            break;
        }
    }
    s_instance flag::set(#"hash_7c736fa0780da5c1");
}

// Namespace namespace_957938f0/namespace_957938f0
// Params 1, eflags: 0x2 linked
// Checksum 0x94053f4b, Offset: 0xd48
// Size: 0x2e4
function function_2558caae(eventstruct) {
    self endon(#"death");
    var_5207017 = self.var_5207017;
    if (var_5207017 flag::get(#"hash_7f36ba06f49e9217")) {
        return;
    }
    player = eventstruct.activator;
    n_cost = 500;
    /#
        if (getdvarint(#"hash_1afcd13f069fa385", 0)) {
            n_cost = 0;
        }
    #/
    if (isalive(player) && !player laststand::player_is_in_laststand() && !player util::isusingremote()) {
        if (!player zm_score::can_player_purchase(n_cost)) {
            player playsoundtoplayer(#"zmb_no_cha_ching", player);
            return;
        }
        eventstruct.var_7d121541 = 0;
        self triggerenable(0);
        var_5207017 thread flag::set_for_time(15, #"hash_7f36ba06f49e9217");
        player zm_score::minus_to_player_score(n_cost);
        if (isdefined(var_5207017.var_126a8ffb)) {
            var_5207017.var_126a8ffb clientfield::set("jump_pad_active", 1);
            var_5207017.var_126a8ffb setmodel(#"hash_295fff49de9ef72c");
        }
        function_59d43f02(var_5207017, player);
        level thread function_789d2df5(var_5207017);
        var_5207017 flag::wait_till_clear(#"hash_7f36ba06f49e9217");
        var_5207017 notify(#"hash_1ec9d66681c6312e");
        if (isdefined(var_5207017.var_126a8ffb)) {
            var_5207017.var_126a8ffb setmodel(#"hash_31994e81355d0644");
            var_5207017.var_126a8ffb clientfield::set("jump_pad_active", 0);
        }
        if (!isdefined(self)) {
            return;
        }
        self triggerenable(1);
    }
}

// Namespace namespace_957938f0/namespace_957938f0
// Params 1, eflags: 0x6 linked
// Checksum 0x67a1122f, Offset: 0x1038
// Size: 0x210
function private function_789d2df5(var_5207017) {
    var_5207017 endoncallback(&function_66851234, #"hash_1ec9d66681c6312e");
    var_5207017.var_eb4df9cc = spawn("trigger_radius", var_5207017.origin, 0, 16, 64);
    var_5207017.var_eb4df9cc trigger::add_flags(16);
    while (isdefined(var_5207017.var_eb4df9cc) && var_5207017 flag::get(#"hash_7f36ba06f49e9217")) {
        s_result = var_5207017.var_eb4df9cc waittill(#"trigger");
        if (!var_5207017 flag::get(#"hash_7f36ba06f49e9217")) {
            break;
        }
        if (isvehicle(s_result.activator)) {
            player = s_result.activator getvehicleowner();
        } else {
            player = s_result.activator;
        }
        if (isplayer(player) && isalive(player) && !player laststand::player_is_in_laststand() && !player util::isusingremote()) {
            level thread function_59d43f02(var_5207017, player);
            player waittill(#"death", #"hash_378ec9e1af4e700c");
        }
    }
}

// Namespace namespace_957938f0/namespace_957938f0
// Params 3, eflags: 0x2 linked
// Checksum 0xfe53348f, Offset: 0x1250
// Size: 0x578
function function_59d43f02(var_5207017, player, var_545e45) {
    player endon(#"death");
    player val::set(#"fling_player", "allow_crouch", 0);
    player val::set(#"fling_player", "allow_prone", 0);
    player val::set(#"fling_player", "allow_stand", 1);
    player val::set(#"fling_player", "freezecontrols_allowlook", 1);
    player playrumbleonentity("damage_heavy");
    if (player isinvehicle()) {
        vehicle = player getvehicleoccupied();
    } else {
        if (player getstance() != "stand") {
            player setstance("stand");
        }
        player setorigin(player.origin + (0, 0, 1));
    }
    visionset_mgr::activate("overlay", "sr_jump_pad_visionset", player);
    var_91418561 = getdvarint(#"bg_gravity", 800);
    if (isdefined(var_5207017.s_target)) {
        v_launch = vectornormalize(var_5207017.s_target.origin - player.origin) * var_91418561;
        v_dest = var_5207017.s_target.origin;
        /#
            debugstar(var_5207017.s_target.origin, 500, (0, 1, 0));
        #/
    } else if (isvec(var_5207017.v_launch)) {
        v_launch = var_5207017.v_launch;
    } else {
        v_launch = (0, 450, 1300);
    }
    v_launch = namespace_77bd50da::function_81cad6d6(v_launch, var_5207017.angles[1]);
    if (!isdefined(v_dest)) {
        v_dest = v_launch + player.origin;
    }
    n_dist = distance(player.origin, v_dest);
    var_fd6264f6 = n_dist / var_91418561;
    playsoundatposition(#"hash_7ff8d8dbf89e6f0d", player.origin);
    player clientfield::set_to_player("jump_pad_wind_sound", 1);
    player thread flag::set_for_time(2, #"hash_4e5451766f737d14");
    if (isdefined(vehicle)) {
        v_launch = function_340128cf(v_launch, vehicle);
        var_8bd853ff = vehicle.origin + (randomintrange(100 * -1, 100), randomintrange(100 * -1, 100), randomintrange(100 * -1, 100));
        vehicle launchvehicle(v_launch, var_8bd853ff);
        wait(var_fd6264f6);
        if (isdefined(vehicle)) {
            vehicle thread zm_utility::function_78e620d();
        }
    } else {
        start_time = gettime();
        while (gettime() - start_time < int(var_fd6264f6 * 1000)) {
            player setvelocity(v_launch);
            waitframe(1);
            /#
                debugstar(player.origin, 500, (1, 0, 0));
            #/
        }
    }
    player thread function_4267539(var_545e45);
    if (isdefined(level.var_24a17c08)) {
        player thread [[ level.var_24a17c08 ]]();
    }
    player notify(#"hash_378ec9e1af4e700c");
}

// Namespace namespace_957938f0/namespace_957938f0
// Params 2, eflags: 0x6 linked
// Checksum 0x263b940f, Offset: 0x17d0
// Size: 0xba
function private function_340128cf(v_launch, vehicle) {
    if (!isdefined(vehicle.scriptvehicletype)) {
        return v_launch;
    }
    switch (vehicle.scriptvehicletype) {
    case #"player_motorcycle_2wd":
        return (v_launch * 0.25);
    case #"player_fav_light":
        return (v_launch * 0.9);
    case #"player_truck_transport":
        return (v_launch * 1.8);
    default:
        return v_launch;
    }
}

// Namespace namespace_957938f0/namespace_957938f0
// Params 1, eflags: 0x6 linked
// Checksum 0x5d751fe, Offset: 0x1898
// Size: 0xdc
function private function_4267539(var_545e45) {
    self endon(#"death");
    if (isdefined(var_545e45)) {
        wait(var_545e45);
    } else {
        while (true) {
            v_velocity = self getvelocity();
            if (v_velocity[2] < 420) {
                break;
            }
            waitframe(1);
        }
    }
    self clientfield::set_to_player("jump_pad_wind_sound", 0);
    visionset_mgr::deactivate("overlay", "sr_jump_pad_visionset", self);
    self val::reset_all(#"fling_player");
}

// Namespace namespace_957938f0/namespace_957938f0
// Params 1, eflags: 0x2 linked
// Checksum 0x7e5d50e0, Offset: 0x1980
// Size: 0x34
function function_66851234(*eventstruct) {
    if (isdefined(self.var_eb4df9cc)) {
        self.var_eb4df9cc deletedelay();
    }
}

// Namespace namespace_957938f0/namespace_957938f0
// Params 0, eflags: 0x2 linked
// Checksum 0x1000ff6b, Offset: 0x19c0
// Size: 0x290
function function_e6d9e6cd() {
    if (isdefined(self.var_b7e783e3)) {
        return;
    }
    v_trigger_offset = (0, 0, -32);
    a_s_spawns = struct::get_array(self.targetname, "target");
    foreach (s_spawn in self.var_e2d1273) {
        var_88f24b00 = content_manager::spawn_script_model(s_spawn, #"hash_8b8c98dda08574e");
        if (var_88f24b00 clientfield::is_registered("perk_death_perception_item_marked_for_rob")) {
            var_88f24b00 clientfield::set("perk_death_perception_item_marked_for_rob", 1);
        }
        var_88f24b00 clientfield::set("jump_pad_essence_fx", 1);
        var_88f24b00.angles = (randomint(360), randomint(360), randomint(360));
        var_88f24b00 bobbing((0, 0, 1), 3, 1);
        var_88f24b00 rotate((6, 0, 6));
        s_spawn.trigger = spawn("trigger_radius", s_spawn.origin + v_trigger_offset, 0, 32, 48);
        s_spawn.trigger callback::on_trigger(&function_90c8355);
        s_spawn.trigger.var_88f24b00 = var_88f24b00;
        waitframe(randomintrange(1, 5));
    }
}

// Namespace namespace_957938f0/namespace_957938f0
// Params 1, eflags: 0x2 linked
// Checksum 0x79d07778, Offset: 0x1c58
// Size: 0x164
function function_90c8355(eventstruct) {
    if (isplayer(eventstruct.activator)) {
        eventstruct.activator zm_stats::increment_challenge_stat(#"hash_52d449d3aae2c5fa");
        if (!isdefined(eventstruct.activator.var_664db4ed)) {
            eventstruct.activator.var_664db4ed = 0;
        }
        eventstruct.activator.var_664db4ed++;
        var_2af6e229 = function_4ba8fde(#"resource_item_harvesting_sr");
        if (isdefined(var_2af6e229)) {
            level thread item_world::function_de2018e3(var_2af6e229, eventstruct.activator);
        }
        if (isdefined(self.var_88f24b00)) {
            self.var_88f24b00 clientfield::set("jump_pad_essence_fx", 0);
            waitframe(1);
            if (isdefined(self.var_88f24b00)) {
                self.var_88f24b00 delete();
            }
        }
        if (isdefined(self)) {
            self delete();
        }
    }
}

// Namespace namespace_957938f0/namespace_957938f0
// Params 0, eflags: 0x6 linked
// Checksum 0x2cfd1095, Offset: 0x1dc8
// Size: 0xfa
function private function_1b543d55() {
    self flag::set("cleanup");
    foreach (var_5207017 in isdefined(self.contentgroups[#"hash_217548aa85422a7e"]) ? self.contentgroups[#"hash_217548aa85422a7e"] : []) {
        if (isdefined(var_5207017.n_obj_id)) {
            zm_utility::function_bc5a54a8(var_5207017.n_obj_id);
            var_5207017.n_obj_id = undefined;
        }
    }
}

