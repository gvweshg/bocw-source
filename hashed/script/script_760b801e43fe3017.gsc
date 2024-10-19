// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_845b2e28;

// Namespace namespace_845b2e28/namespace_845b2e28
// Params 0, eflags: 0x5
// Checksum 0x39b38e14, Offset: 0xb8
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"hash_5ca501b5a8e0f7f9", &preinit, undefined, undefined, undefined);
}

// Namespace namespace_845b2e28/namespace_845b2e28
// Params 0, eflags: 0x4
// Checksum 0x5c50ab75, Offset: 0x100
// Size: 0x5c
function private preinit() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_2f8add191c45a722", &on_begin, &on_end);
}

// Namespace namespace_845b2e28/namespace_845b2e28
// Params 6, eflags: 0x4
// Checksum 0x61d4876, Offset: 0x168
// Size: 0x244
function private on_begin(var_faecf84e, var_142bab9f, var_2b2cdb01, var_85e291cf, var_b3c8256b, var_d42c8aaa) {
    if (isdefined(var_b3c8256b)) {
        var_b3c8256b = zm_trial::function_5769f26a(var_b3c8256b);
    }
    a_players = getplayers();
    switch (a_players.size) {
    case 1:
        n_kill_count = var_faecf84e;
        break;
    case 2:
        n_kill_count = var_142bab9f;
        break;
    case 3:
        n_kill_count = var_2b2cdb01;
        break;
    case 4:
        n_kill_count = var_85e291cf;
        break;
    default:
        n_kill_count = var_faecf84e;
        break;
    }
    self.var_b49b94ed = zm_trial::function_5769f26a(n_kill_count);
    self.var_3fd9ed88 = 0;
    zm_trial_util::function_2976fa44(self.var_b49b94ed);
    zm_trial_util::function_dace284(self.var_3fd9ed88);
    if (is_true(var_b3c8256b) && isdefined(var_d42c8aaa)) {
        level flag::set(#"infinite_round_spawning");
        level flag::set(#"pause_round_timeout");
        var_d42c8aaa = zm_trial::function_5769f26a(var_d42c8aaa);
        level.var_382a24b0 = 1;
        level thread function_a2c43fea(var_d42c8aaa);
        level thread function_69c5df45(self);
    }
    level thread function_ba517920(self);
}

// Namespace namespace_845b2e28/namespace_845b2e28
// Params 1, eflags: 0x4
// Checksum 0x5394dd60, Offset: 0x3b8
// Size: 0xac
function private on_end(round_reset) {
    zm_trial_util::function_f3dbeda7();
    level.var_894a83d8 = undefined;
    level.var_382a24b0 = undefined;
    level flag::clear(#"infinite_round_spawning");
    level flag::clear(#"pause_round_timeout");
    if (!round_reset) {
        if (self.var_3fd9ed88 < self.var_b49b94ed) {
            zm_trial::fail(#"hash_729e15cd6b31df3");
        }
    }
}

// Namespace namespace_845b2e28/namespace_845b2e28
// Params 1, eflags: 0x0
// Checksum 0xa46df95e, Offset: 0x470
// Size: 0x144
function function_a2c43fea(var_d42c8aaa = 2000) {
    level endon(#"hash_7646638df88a3656", #"end_game");
    while (true) {
        n_score_total = 0;
        foreach (player in getplayers()) {
            if (isalive(player)) {
                n_score_total += isdefined(player.score) ? player.score : 0;
            }
            if (n_score_total >= var_d42c8aaa) {
                level.var_894a83d8 = 1;
                continue;
            }
            level.var_894a83d8 = undefined;
        }
        waitframe(1);
    }
}

// Namespace namespace_845b2e28/namespace_845b2e28
// Params 1, eflags: 0x4
// Checksum 0xc2f6bbfe, Offset: 0x5c0
// Size: 0xa8
function private function_ba517920(challenge) {
    level endon(#"hash_7646638df88a3656");
    while (challenge.var_3fd9ed88 < challenge.var_b49b94ed) {
        level waittill(#"trap_kill", #"hash_528d7b7f7d6c51a1", #"hash_317f58ba0d580c27", #"hash_148b3ce521088846");
        challenge.var_3fd9ed88++;
        zm_trial_util::function_dace284(challenge.var_3fd9ed88);
    }
}

// Namespace namespace_845b2e28/namespace_845b2e28
// Params 1, eflags: 0x4
// Checksum 0x9e43a9fd, Offset: 0x670
// Size: 0xb0
function private function_69c5df45(challenge) {
    level endon(#"hash_7646638df88a3656");
    while (true) {
        if (challenge.var_3fd9ed88 >= challenge.var_b49b94ed) {
            level flag::clear(#"infinite_round_spawning");
            level flag::clear(#"pause_round_timeout");
            level.zombie_total = 0;
            zm_utility::function_9ad5aeb1(0);
            return;
        }
        waitframe(1);
    }
}

