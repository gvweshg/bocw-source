// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_turn_on_power;

// Namespace zm_trial_turn_on_power/zm_trial_turn_on_power
// Params 0, eflags: 0x5
// Checksum 0x771ece15, Offset: 0xa8
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"zm_trial_turn_on_power", &preinit, undefined, undefined, undefined);
}

// Namespace zm_trial_turn_on_power/zm_trial_turn_on_power
// Params 0, eflags: 0x4
// Checksum 0x1c1a97b5, Offset: 0xf0
// Size: 0x5c
function private preinit() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"turn_on_power", &on_begin, &on_end);
}

// Namespace zm_trial_turn_on_power/zm_trial_turn_on_power
// Params 1, eflags: 0x4
// Checksum 0x8cb112f5, Offset: 0x158
// Size: 0x3c
function private on_begin(*weapon_name) {
    zm_trial_util::function_7d32b7d0(0);
    level thread function_83b71e7c();
}

// Namespace zm_trial_turn_on_power/zm_trial_turn_on_power
// Params 1, eflags: 0x4
// Checksum 0x6583e502, Offset: 0x1a0
// Size: 0xac
function private on_end(round_reset) {
    zm_trial_util::function_f3dbeda7();
    if (!round_reset) {
        if (!level flag::get(level.var_5bfd847e)) {
            if (zm_utility::get_story() == 1) {
                zm_trial::fail(#"hash_ad3c47f53414b85");
                return;
            }
            zm_trial::fail(#"hash_765b6a6e9523c15a");
        }
    }
}

// Namespace zm_trial_turn_on_power/zm_trial_turn_on_power
// Params 0, eflags: 0x4
// Checksum 0xf10fd80, Offset: 0x258
// Size: 0xa8
function private function_83b71e7c() {
    level endon(#"hash_7646638df88a3656");
    self endon(#"death");
    while (true) {
        level flag::wait_till(level.var_5bfd847e);
        zm_trial_util::function_7d32b7d0(1);
        level flag::wait_till_clear(level.var_5bfd847e);
        zm_trial_util::function_7d32b7d0(0);
    }
}

