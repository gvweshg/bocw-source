// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_disable_hud;

// Namespace zm_trial_disable_hud/zm_trial_disable_hud
// Params 0, eflags: 0x5
// Checksum 0x8934c2b3, Offset: 0xd8
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"zm_trial_disable_hud", &preinit, undefined, undefined, undefined);
}

// Namespace zm_trial_disable_hud/zm_trial_disable_hud
// Params 0, eflags: 0x4
// Checksum 0xadf82cdb, Offset: 0x120
// Size: 0x5c
function private preinit() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"disable_hud", &on_begin, &on_end);
}

// Namespace zm_trial_disable_hud/zm_trial_disable_hud
// Params 0, eflags: 0x4
// Checksum 0xa39e73e6, Offset: 0x188
// Size: 0x1c
function private on_begin() {
    level thread function_afe4a356();
}

// Namespace zm_trial_disable_hud/zm_trial_disable_hud
// Params 0, eflags: 0x0
// Checksum 0x48c5cbc3, Offset: 0x1b0
// Size: 0x110
function function_afe4a356() {
    level endon(#"hash_7646638df88a3656", #"end_game");
    wait(12);
    level.var_dc60105c = 1;
    level clientfield::set_world_uimodel("ZMHudGlobal.trials.hudDeactivated", 1);
    foreach (player in getplayers()) {
        player function_e0c7d69(0);
        player playsoundtoplayer(#"hash_79fced3c02a68283", player);
    }
}

// Namespace zm_trial_disable_hud/zm_trial_disable_hud
// Params 1, eflags: 0x4
// Checksum 0xef944908, Offset: 0x2c8
// Size: 0x130
function private on_end(*round_reset) {
    level clientfield::set_world_uimodel("ZMHudGlobal.trials.hudDeactivated", 0);
    level.var_dc60105c = undefined;
    if (level flag::get("round_reset") || level flag::get(#"trial_failed")) {
        return;
    }
    foreach (player in getplayers()) {
        player function_e0c7d69(1);
        player playsoundtoplayer(#"hash_18aab7ffde259877", player);
    }
}

