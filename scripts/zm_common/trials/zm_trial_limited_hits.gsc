// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_limited_hits;

// Namespace zm_trial_limited_hits/zm_trial_limited_hits
// Params 0, eflags: 0x5
// Checksum 0xfde6ee3f, Offset: 0xb0
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"zm_trial_limited_hits", &preinit, undefined, undefined, undefined);
}

// Namespace zm_trial_limited_hits/zm_trial_limited_hits
// Params 0, eflags: 0x4
// Checksum 0xbba7bffc, Offset: 0xf8
// Size: 0x5c
function private preinit() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"limited_hits", &on_begin, &on_end);
}

// Namespace zm_trial_limited_hits/zm_trial_limited_hits
// Params 2, eflags: 0x4
// Checksum 0x278f8b26, Offset: 0x160
// Size: 0xd4
function private on_begin(var_85af3be4, var_752d90ad) {
    if (getplayers().size == 1) {
        level.var_b529249b = zm_trial::function_5769f26a(var_752d90ad);
    } else {
        level.var_b529249b = zm_trial::function_5769f26a(var_85af3be4);
    }
    level.var_4b9163d5 = 0;
    zm_trial_util::function_2976fa44(level.var_b529249b);
    zm_trial_util::function_dace284(level.var_b529249b, 1);
    callback::on_player_damage(&on_player_damage);
}

// Namespace zm_trial_limited_hits/zm_trial_limited_hits
// Params 1, eflags: 0x4
// Checksum 0x92e02818, Offset: 0x240
// Size: 0x54
function private on_end(*round_reset) {
    zm_trial_util::function_f3dbeda7();
    level.var_b529249b = undefined;
    level.var_4b9163d5 = undefined;
    callback::remove_on_player_damage(&on_player_damage);
}

// Namespace zm_trial_limited_hits/zm_trial_limited_hits
// Params 0, eflags: 0x0
// Checksum 0xe5f4b1e4, Offset: 0x2a0
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"limited_hits");
    return isdefined(challenge);
}

// Namespace zm_trial_limited_hits/zm_trial_limited_hits
// Params 1, eflags: 0x4
// Checksum 0xb6495415, Offset: 0x2e0
// Size: 0x9c
function private on_player_damage(params) {
    if (params.idamage >= 0) {
        level.var_4b9163d5++;
        zm_trial_util::function_dace284(level.var_b529249b - level.var_4b9163d5);
        if (level.var_4b9163d5 >= level.var_b529249b) {
            zm_trial::fail(#"hash_404865fbf8dd5cc2", array(self));
        }
    }
}

