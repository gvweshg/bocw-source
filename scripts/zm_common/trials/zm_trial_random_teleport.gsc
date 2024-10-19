// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_random_teleport;

// Namespace zm_trial_random_teleport/zm_trial_random_teleport
// Params 0, eflags: 0x5
// Checksum 0x2264e251, Offset: 0xd8
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"zm_trial_random_teleport", &preinit, undefined, undefined, undefined);
}

// Namespace zm_trial_random_teleport/zm_trial_random_teleport
// Params 0, eflags: 0x4
// Checksum 0xc9903967, Offset: 0x120
// Size: 0x5c
function private preinit() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"random_teleport", &on_begin, &on_end);
}

// Namespace zm_trial_random_teleport/zm_trial_random_teleport
// Params 2, eflags: 0x4
// Checksum 0xadf8f532, Offset: 0x188
// Size: 0xe0
function private on_begin(n_min_time, n_max_time) {
    level.var_935c100a = zm_trial::function_5769f26a(n_min_time);
    level.var_33146b2e = zm_trial::function_5769f26a(n_max_time);
    foreach (player in getplayers()) {
        player thread function_6a04c6e6();
    }
}

// Namespace zm_trial_random_teleport/zm_trial_random_teleport
// Params 1, eflags: 0x4
// Checksum 0x1b05f119, Offset: 0x270
// Size: 0xe8
function private on_end(*round_reset) {
    level notify(#"hash_34f9cf7500b33c6b");
    foreach (player in getplayers()) {
        player val::reset(#"hash_7d2b25df35ca5b3", "freezecontrols");
        player val::reset(#"hash_7d2b25df35ca5b3", "ignoreme");
    }
}

// Namespace zm_trial_random_teleport/zm_trial_random_teleport
// Params 0, eflags: 0x0
// Checksum 0xd71964b4, Offset: 0x360
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"random_teleport");
    return isdefined(challenge);
}

// Namespace zm_trial_random_teleport/zm_trial_random_teleport
// Params 0, eflags: 0x4
// Checksum 0xc5bba150, Offset: 0x3a0
// Size: 0xc8
function private function_6a04c6e6() {
    self endon(#"disconnect");
    level endon(#"hash_34f9cf7500b33c6b", #"end_game");
    while (true) {
        wait(randomfloatrange(level.var_935c100a, level.var_33146b2e));
        if (isalive(self)) {
            if (self isusingoffhand()) {
                self forceoffhandend();
            }
            self zm_bgb_anywhere_but_here::activation(0);
        }
    }
}

