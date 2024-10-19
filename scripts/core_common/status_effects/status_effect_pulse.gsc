// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace status_effect_pulse;

// Namespace status_effect_pulse/status_effect_pulse
// Params 0, eflags: 0x5
// Checksum 0x532523f6, Offset: 0xf0
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"status_effect_pulse", &preinit, undefined, undefined, undefined);
}

// Namespace status_effect_pulse/status_effect_pulse
// Params 0, eflags: 0x6 linked
// Checksum 0xa091b61c, Offset: 0x138
// Size: 0xbc
function private preinit() {
    status_effect::register_status_effect_callback_apply(9, &pulse_apply);
    status_effect::function_5bae5120(9, &pulse_end);
    status_effect::function_6f4eaf88(getstatuseffect("pulse"));
    clientfield::register("toplayer", "pulsed", 1, 1, "int");
    callback::on_spawned(&on_player_spawned);
}

// Namespace status_effect_pulse/status_effect_pulse
// Params 0, eflags: 0x2 linked
// Checksum 0x80f724d1, Offset: 0x200
// Size: 0x4
function on_player_spawned() {
    
}

// Namespace status_effect_pulse/status_effect_pulse
// Params 3, eflags: 0x2 linked
// Checksum 0x595de3ee, Offset: 0x210
// Size: 0x154
function pulse_apply(*var_756fda07, *weapon, *applicant) {
    self.owner clientfield::set_to_player("pulsed", 1);
    shutdownpulserebootindicatormenu();
    pulserebootmenu = self.owner openluimenu("EmpRebootIndicator");
    self.owner setluimenudata(pulserebootmenu, #"endtime", int(self.endtime));
    self.owner setluimenudata(pulserebootmenu, #"starttime", int(self.endtime - self.duration));
    self thread pulse_rumble_loop(0.75);
    self.owner setempjammed(1);
}

// Namespace status_effect_pulse/status_effect_pulse
// Params 1, eflags: 0x6 linked
// Checksum 0xb73139d6, Offset: 0x370
// Size: 0xae
function private pulse_rumble_loop(duration) {
    self endon(#"pulse_rumble_loop");
    self notify(#"pulse_rumble_loop");
    self endon(#"endstatuseffect");
    goaltime = gettime() + int(duration * 1000);
    while (gettime() < goaltime) {
        self.owner playrumbleonentity("damage_heavy");
        waitframe(1);
    }
}

// Namespace status_effect_pulse/status_effect_pulse
// Params 0, eflags: 0x2 linked
// Checksum 0xd1be262b, Offset: 0x428
// Size: 0x8c
function pulse_end() {
    if (isdefined(self)) {
        shutdownpulserebootindicatormenu();
        if (isdefined(level.emp_shared.enemyempactivefunc)) {
            if (self [[ level.emp_shared.enemyempactivefunc ]]()) {
                return;
            }
        }
        self.owner setempjammed(0);
        self.owner clientfield::set_to_player("pulsed", 0);
    }
}

// Namespace status_effect_pulse/status_effect_pulse
// Params 0, eflags: 0x2 linked
// Checksum 0xf69908b8, Offset: 0x4c0
// Size: 0x54
function shutdownpulserebootindicatormenu() {
    emprebootmenu = self.owner getluimenu("EmpRebootIndicator");
    if (isdefined(emprebootmenu)) {
        self.owner closeluimenu(emprebootmenu);
    }
}

