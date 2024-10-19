// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_use_pack_a_punch;

// Namespace zm_trial_use_pack_a_punch/zm_trial_use_pack_a_punch
// Params 0, eflags: 0x5
// Checksum 0x17b5dad3, Offset: 0xb0
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"zm_trial_use_pack_a_punch", &preinit, undefined, undefined, undefined);
}

// Namespace zm_trial_use_pack_a_punch/zm_trial_use_pack_a_punch
// Params 0, eflags: 0x4
// Checksum 0x611dc90d, Offset: 0xf8
// Size: 0x5c
function private preinit() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"use_pack_a_punch", &on_begin, &on_end);
}

// Namespace zm_trial_use_pack_a_punch/zm_trial_use_pack_a_punch
// Params 1, eflags: 0x4
// Checksum 0x451cbada, Offset: 0x160
// Size: 0x108
function private on_begin(n_count) {
    callback::function_aebeafc0(&function_aebeafc0);
    level.var_195590fb = zm_trial::function_5769f26a(n_count);
    foreach (player in getplayers()) {
        player.var_92cd5237 = [];
        player zm_trial_util::function_c2cd0cba(level.var_195590fb);
        player zm_trial_util::function_2190356a(0);
    }
}

// Namespace zm_trial_use_pack_a_punch/zm_trial_use_pack_a_punch
// Params 1, eflags: 0x4
// Checksum 0xd192f2ea, Offset: 0x270
// Size: 0x1ec
function private on_end(round_reset) {
    foreach (player in getplayers()) {
        player zm_trial_util::function_f3aacffb();
    }
    if (!round_reset) {
        var_57807cdc = [];
        foreach (player in getplayers()) {
            if (player.var_92cd5237.size < level.var_195590fb) {
                array::add(var_57807cdc, player, 0);
            }
            player.var_f8c35ed5 = undefined;
        }
        if (var_57807cdc.size == 1) {
            zm_trial::fail(#"hash_6dbd3c476c903f66", var_57807cdc);
        } else if (var_57807cdc.size > 1) {
            zm_trial::fail(#"hash_59d734dda39935cf", var_57807cdc);
        }
    }
    level.var_195590fb = undefined;
    callback::function_3e2ed898(&function_aebeafc0);
}

// Namespace zm_trial_use_pack_a_punch/zm_trial_use_pack_a_punch
// Params 1, eflags: 0x4
// Checksum 0x74222169, Offset: 0x468
// Size: 0xec
function private function_aebeafc0(upgraded_weapon) {
    w_base = zm_weapons::get_base_weapon(upgraded_weapon);
    if (!isdefined(self.var_92cd5237)) {
        self.var_92cd5237 = [];
    } else if (!isarray(self.var_92cd5237)) {
        self.var_92cd5237 = array(self.var_92cd5237);
    }
    if (!isinarray(self.var_92cd5237, w_base)) {
        self.var_92cd5237[self.var_92cd5237.size] = w_base;
    }
    if (self.var_92cd5237.size <= level.var_195590fb) {
        zm_trial_util::function_2190356a(self.var_92cd5237.size);
    }
}

