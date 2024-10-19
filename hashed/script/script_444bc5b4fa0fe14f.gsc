// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\trials\zm_trial_add_special.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_c56530a8;

// Namespace namespace_c56530a8/namespace_c56530a8
// Params 0, eflags: 0x5
// Checksum 0xf224f2c0, Offset: 0xa8
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"hash_4229d59c5b830185", &preinit, undefined, undefined, undefined);
}

// Namespace namespace_c56530a8/namespace_c56530a8
// Params 0, eflags: 0x4
// Checksum 0x7387cf8c, Offset: 0xf0
// Size: 0x5c
function private preinit() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_3746f3c279f7a5ea", &on_begin, &on_end);
}

// Namespace namespace_c56530a8/namespace_c56530a8
// Params 4, eflags: 0x4
// Checksum 0x1acc899, Offset: 0x158
// Size: 0x2fc
function private on_begin(var_49d0b42a, var_d2d5c522, var_17d04dfe, var_6a68f1d6) {
    n_variant = getgametypesetting(#"zmtrialsvariant");
    switch (getplayers().size) {
    case 1:
        level.var_88bac0b7 = zm_trial::function_5769f26a(var_49d0b42a);
        level.var_e34a018e = level.var_88bac0b7 + (n_variant ? 15 : 15);
        break;
    case 2:
        level.var_88bac0b7 = zm_trial::function_5769f26a(var_d2d5c522);
        level.var_e34a018e = level.var_88bac0b7 + (n_variant ? 15 : 15);
        break;
    case 3:
        level.var_88bac0b7 = zm_trial::function_5769f26a(var_17d04dfe);
        level.var_e34a018e = level.var_88bac0b7 + (n_variant ? 10 : 10);
        break;
    case 4:
    default:
        level.var_88bac0b7 = zm_trial::function_5769f26a(var_6a68f1d6);
        level.var_e34a018e = level.var_88bac0b7 + (n_variant ? 10 : 10);
        break;
    }
    level.var_fb0b57a7 = 0;
    zm_trial_util::function_2976fa44(level.var_88bac0b7);
    zm_trial_util::function_dace284(level.var_fb0b57a7);
    level.var_1c7412f9 = #"catalyst";
    zm_round_spawning::function_c1571721(&zm_trial_add_special::function_51ec9e09);
    zm_round_spawning::function_54fee373(&zm_trial_add_special::function_1b1d71e7);
    zm_round_spawning::function_2876740e(level.var_1c7412f9, &zm_trial_add_special::function_a7c00976);
    level.var_ed006fe8 = array(1, 2, 3, 4);
    level thread function_cb35d440();
}

// Namespace namespace_c56530a8/namespace_c56530a8
// Params 1, eflags: 0x4
// Checksum 0x302b2d26, Offset: 0x460
// Size: 0xfe
function private on_end(round_reset) {
    zm_trial_util::function_f3dbeda7();
    zm_round_spawning::function_510039c1(&zm_trial_add_special::function_51ec9e09);
    zm_round_spawning::function_375519eb(&zm_trial_add_special::function_1b1d71e7);
    zm_round_spawning::function_9bf14a10(level.var_1c7412f9, &zm_trial_add_special::function_a7c00976);
    if (!round_reset) {
        if (level.var_fb0b57a7 < level.var_88bac0b7) {
            zm_trial::fail(#"hash_3f700791572b0dcf");
        }
    }
    level.var_88bac0b7 = undefined;
    level.var_fb0b57a7 = undefined;
    level.var_1c7412f9 = undefined;
    level.var_e34a018e = undefined;
    level.var_ed006fe8 = undefined;
}

// Namespace namespace_c56530a8/namespace_c56530a8
// Params 0, eflags: 0x4
// Checksum 0xe5209c7d, Offset: 0x568
// Size: 0x80
function private function_cb35d440() {
    level endon(#"hash_7646638df88a3656");
    while (true) {
        level waittill(#"hash_166cac102910cdb3");
        level.var_fb0b57a7++;
        if (level.var_fb0b57a7 <= level.var_88bac0b7) {
            zm_trial_util::function_dace284(level.var_fb0b57a7);
        }
    }
}

// Namespace namespace_c56530a8/namespace_c56530a8
// Params 0, eflags: 0x0
// Checksum 0x9294fd7c, Offset: 0x5f0
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"hash_3746f3c279f7a5ea");
    return isdefined(challenge);
}

