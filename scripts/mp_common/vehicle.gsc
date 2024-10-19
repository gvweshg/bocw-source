// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace vehicle;

// Namespace vehicle/vehicle
// Params 0, eflags: 0x5
// Checksum 0x604db5a5, Offset: 0xe0
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"vehicle", &preinit, undefined, undefined, undefined);
}

// Namespace vehicle/vehicle
// Params 0, eflags: 0x6 linked
// Checksum 0x80f724d1, Offset: 0x128
// Size: 0x4
function private preinit() {
    
}

// Namespace vehicle/vehicle
// Params 2, eflags: 0x2 linked
// Checksum 0x4704396e, Offset: 0x138
// Size: 0xec
function player_is_occupant_invulnerable(attacker, *smeansofdeath) {
    if (self isremotecontrolling()) {
        return 0;
    }
    if (self.var_ca876b0f === 1 && self player_is_driver()) {
        if (self.var_e7e2e3e5 === 1 && isplayer(smeansofdeath) && smeansofdeath == self) {
            return 1;
        }
        return 0;
    }
    if (!isdefined(level.vehicle_drivers_are_invulnerable)) {
        level.vehicle_drivers_are_invulnerable = 0;
    }
    invulnerable = level.vehicle_drivers_are_invulnerable && self player_is_driver();
    return invulnerable;
}

// Namespace vehicle/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0xd9241490, Offset: 0x230
// Size: 0x84
function player_is_driver() {
    if (!isalive(self)) {
        return false;
    }
    vehicle = self getvehicleoccupied();
    if (isdefined(vehicle)) {
        seat = vehicle getoccupantseat(self);
        if (isdefined(seat) && seat == 0) {
            return true;
        }
    }
    return false;
}

// Namespace vehicle/vehicle
// Params 0, eflags: 0x0
// Checksum 0xbc8036f0, Offset: 0x2c0
// Size: 0x8c
function initvehiclemap() {
    /#
        root = "<unknown string>";
        adddebugcommand(root + "<unknown string>");
        adddebugcommand(root + "<unknown string>");
        adddebugcommand(root + "<unknown string>");
    #/
    thread vehiclemainthread();
}

// Namespace vehicle/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0xf530a450, Offset: 0x358
// Size: 0xda
function vehiclemainthread() {
    spawn_nodes = struct::get_array("veh_spawn_point", "targetname");
    for (i = 0; i < spawn_nodes.size; i++) {
        spawn_node = spawn_nodes[i];
        veh_name = spawn_node.script_noteworthy;
        time_interval = int(spawn_node.script_parameters);
        if (!isdefined(veh_name)) {
            continue;
        }
        thread vehiclespawnthread(veh_name, spawn_node.origin, spawn_node.angles, time_interval);
        waitframe(1);
    }
}

// Namespace vehicle/vehicle
// Params 4, eflags: 0x2 linked
// Checksum 0x1a84ba5e, Offset: 0x440
// Size: 0x1ee
function vehiclespawnthread(veh_name, origin, angles, time_interval) {
    level endon(#"game_ended");
    veh_spawner = getent(veh_name + "_spawner", "targetname");
    while (true) {
        vehicle = veh_spawner spawnfromspawner(veh_name, 1, 1, 1);
        if (!isdefined(vehicle)) {
            wait(randomfloatrange(1, 2));
            continue;
        }
        vehicle asmrequestsubstate(#"locomotion@movement");
        waitframe(1);
        vehicle makevehicleusable();
        if (target_istarget(vehicle)) {
            target_remove(vehicle);
        }
        vehicle.origin = origin;
        vehicle.angles = angles;
        vehicle.nojumping = 1;
        vehicle.forcedamagefeedback = 1;
        vehicle.vehkilloccupantsondeath = 1;
        vehicle disableaimassist();
        vehicle thread vehicleteamthread();
        vehicle waittill(#"death");
        vehicle vehicle_death::deletewhensafe(0.25);
        if (isdefined(time_interval)) {
            wait(time_interval);
        }
    }
}

// Namespace vehicle/vehicle
// Params 0, eflags: 0x2 linked
// Checksum 0x53b3b699, Offset: 0x638
// Size: 0x1b8
function vehicleteamthread() {
    vehicle = self;
    vehicle endon(#"death");
    while (true) {
        waitresult = vehicle waittill(#"enter_vehicle");
        player = waitresult.player;
        vehicle setteam(player.team);
        vehicle clientfield::set("toggle_lights", 1);
        if (!target_istarget(vehicle)) {
            if (isdefined(vehicle.targetoffset)) {
                target_set(vehicle, vehicle.targetoffset);
            } else {
                target_set(vehicle, (0, 0, 0));
            }
        }
        vehicle thread watchplayerexitrequestthread(player);
        vehicle waittill(#"exit_vehicle");
        vehicle setteam(#"neutral");
        vehicle clientfield::set("toggle_lights", 0);
        if (target_istarget(vehicle)) {
            target_remove(vehicle);
        }
    }
}

// Namespace vehicle/vehicle
// Params 1, eflags: 0x2 linked
// Checksum 0xb30e3f43, Offset: 0x7f8
// Size: 0xea
function watchplayerexitrequestthread(player) {
    level endon(#"game_ended");
    player endon(#"death", #"disconnect");
    vehicle = self;
    vehicle endon(#"death");
    wait(1.5);
    while (true) {
        timeused = 0;
        while (player usebuttonpressed()) {
            timeused += 0.05;
            if (timeused > 0.25) {
                player unlink();
                return;
            }
            waitframe(1);
        }
        waitframe(1);
    }
}

