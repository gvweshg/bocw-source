// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_99d0d95e;

// Namespace namespace_99d0d95e/namespace_99d0d95e
// Params 0, eflags: 0x2 linked
// Checksum 0xba087e4, Offset: 0x238
// Size: 0x7c
function init() {
    level thread function_91c6e82a();
    level thread function_12b1d8eb();
    level thread function_529ee86f();
    level thread function_2c6cfe43();
    level thread function_1493eabf();
}

// Namespace namespace_99d0d95e/namespace_99d0d95e
// Params 0, eflags: 0x2 linked
// Checksum 0x4e5fd12f, Offset: 0x2c0
// Size: 0x278
function function_91c6e82a() {
    level waittill(#"power_on");
    playsound(0, #"hash_1f574be04a9da670", (-1082, 13389, -133));
    waitframe(1);
    playsound(0, #"hash_73600bf9c06ee82c", (-650, 9979, 741));
    waitframe(1);
    playsound(0, #"hash_73600cf9c06ee9df", (-3803, 11341, 650));
    waitframe(1);
    playsound(0, #"hash_73600df9c06eeb92", (-2124, 8659, 136));
    var_f712f165 = struct::get_array("snd_power_fluorescent", "targetname");
    foreach (light in var_f712f165) {
        playsound(0, #"hash_44278e96b96ae9d5", light.origin);
    }
    var_da9a899e = struct::get_array("snd_power_tungsten", "targetname");
    foreach (light in var_da9a899e) {
        playsound(0, #"hash_4c833a65c5fc579d", light.origin);
    }
}

// Namespace namespace_99d0d95e/namespace_99d0d95e
// Params 7, eflags: 0x2 linked
// Checksum 0xe9256097, Offset: 0x540
// Size: 0xc4
function function_2f3017ad(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwasdemojump) {
    if (bwasdemojump) {
        if (bwasdemojump == 1) {
            function_5ea2c6e3("cmn_duck_aux_2_0", 3, 1);
        }
        function_21fee83f(bwasdemojump);
        return;
    }
    function_ed62c9c2("cmn_duck_aux_2_0", 3);
    function_21fee83f(0);
}

// Namespace namespace_99d0d95e/namespace_99d0d95e
// Params 1, eflags: 0x2 linked
// Checksum 0xba7a033a, Offset: 0x610
// Size: 0x1bc
function function_21fee83f(var_c4f44e2) {
    self notify("61a178f1ddd3d368");
    self endon("61a178f1ddd3d368");
    if (!isdefined(level.var_4157094)) {
        level.var_4157094 = 0;
    }
    if (!isdefined(level.var_c5cba082)) {
        level.var_c5cba082 = 0;
    }
    if (var_c4f44e2 === 2) {
        function_672403ca("mute_underscore_aboveground", 1, 1);
        function_672403ca("mute_underscore_belowground", 1, 1);
        level.var_c5cba082 = 1;
        return;
    }
    n_start_delay = 0;
    if (var_c4f44e2 === 3) {
        level.var_c5cba082 = 0;
        var_c4f44e2 = level.var_4157094;
        n_start_delay = 4;
    }
    level.var_4157094 = var_c4f44e2;
    if (!level.var_c5cba082) {
        if (n_start_delay > 0) {
            wait(n_start_delay);
        }
        if (var_c4f44e2 === 0) {
            function_672403ca("mute_underscore_aboveground", 5, 0);
            function_672403ca("mute_underscore_belowground", 5, 1);
            return;
        }
        function_672403ca("mute_underscore_aboveground", 5, 1);
        function_672403ca("mute_underscore_belowground", 5, 0);
    }
}

// Namespace namespace_99d0d95e/namespace_99d0d95e
// Params 0, eflags: 0x2 linked
// Checksum 0x5c47b416, Offset: 0x7d8
// Size: 0xa4
function function_12b1d8eb() {
    function_5ea2c6e3("mute_underscore_aboveground", 0);
    function_5ea2c6e3("mute_underscore_belowground", 0);
    util::waitforclient(0);
    wait(50);
    audio::playloopat("mus_underscore_aboveground_loop_0", (0, 0, 0));
    level waittill(#"end_game");
    audio::stoploopat("mus_underscore_aboveground_loop_0", (0, 0, 0));
}

// Namespace namespace_99d0d95e/namespace_99d0d95e
// Params 0, eflags: 0x2 linked
// Checksum 0x23474abc, Offset: 0x888
// Size: 0x3c
function function_1493eabf() {
    level waittill(#"sndunlockeesong");
    function_2cca7b47(0, #"musictrack_zm_platinum_ee");
}

// Namespace namespace_99d0d95e/namespace_99d0d95e
// Params 0, eflags: 0x2 linked
// Checksum 0x1eaf120a, Offset: 0x8d0
// Size: 0x44
function function_529ee86f() {
    level waittill(#"power_on");
    audio::playloopat("mus_bar_what_awaits", (-1383, 9859, 118));
}

// Namespace namespace_99d0d95e/namespace_99d0d95e
// Params 0, eflags: 0x2 linked
// Checksum 0xdea115a9, Offset: 0x920
// Size: 0x44
function function_2c6cfe43() {
    level waittill(#"power_on");
    audio::playloopat("mus_seamstress_berlin_1985", (-3989, 10171, 499));
}

// Namespace namespace_99d0d95e/namespace_99d0d95e
// Params 7, eflags: 0x2 linked
// Checksum 0xcae54e3e, Offset: 0x970
// Size: 0x7c2
function function_ec54a907(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    switch (bwastimejump) {
    case 1:
        soundloopemitter("amb_train_alarm_lp", (-60, 12065, -200));
        var_27cb9568 = array((-1558, 12083, -201), (-726, 12057, -201), (-1100, 11955, -201), (-2311, 12012, -201));
        foreach (location in var_27cb9568) {
            soundloopemitter("amb_train_alarm_bell_lp", location);
        }
        playsound(fieldname, "amb_train_incomming_rumble_start", (-884, 11864, -214));
        playsound(fieldname, "amb_train_incomming_rumble_start", (-2604, 11998, -258));
        wait(2);
        playsound(fieldname, "amb_train_incomming_rumble", (-884, 11864, -214));
        playsound(fieldname, "amb_train_incomming_rumble", (-2604, 11998, -258));
        wait(3);
        soundstoploopemitter("amb_train_alarm_lp", (-60, 12065, -200));
        break;
    case 2:
        soundloopemitter("amb_train_alarm_lp", (-2856, 11966, -200));
        var_27cb9568 = array((-1558, 12083, -201), (-726, 12057, -201), (-1100, 11955, -201), (-2311, 12012, -201));
        foreach (location in var_27cb9568) {
            soundloopemitter("amb_train_alarm_bell_lp", location);
        }
        playsound(fieldname, "amb_train_incomming_rumble_start", (-884, 11864, -214));
        playsound(fieldname, "amb_train_incomming_rumble_start", (-2604, 11998, -258));
        wait(2);
        playsound(fieldname, "amb_train_incomming_rumble", (-884, 11864, -214));
        playsound(fieldname, "amb_train_incomming_rumble", (-2604, 11998, -258));
        wait(3);
        soundstoploopemitter("amb_train_alarm_lp", (-2856, 11966, -200));
        break;
    case 3:
        soundloopemitter("amb_train_alarm_lp", (-2856, 11966, -200));
        var_27cb9568 = array((-1558, 12083, -201), (-726, 12057, -201), (-1100, 11955, -201), (-2311, 12012, -201));
        foreach (location in var_27cb9568) {
            soundloopemitter("amb_train_alarm_bell_lp", location);
        }
        playsound(fieldname, "amb_train_incomming_rumble_start", (-884, 11864, -214));
        playsound(fieldname, "amb_train_incomming_rumble_start", (-2604, 11998, -258));
        wait(2);
        playsound(fieldname, "amb_train_incomming_rumble", (-884, 11864, -214));
        playsound(fieldname, "amb_train_incomming_rumble", (-2604, 11998, -258));
        wait(3);
        soundstoploopemitter("amb_train_alarm_lp", (-2856, 11966, -200));
        break;
    case 4:
        var_27cb9568 = array((-1558, 12083, -201), (-726, 12057, -201), (-1100, 11955, -201), (-2311, 12012, -201));
        foreach (location in var_27cb9568) {
            soundstoploopemitter("amb_train_alarm_bell_lp", location);
            playsound(fieldname, #"hash_7d743a5e64a0e1d", location);
            wait(randomfloatrange(0.25, 0.75));
        }
        break;
    case 5:
        function_5ea2c6e3("zmb_platinum_bossfight", 5, 1);
        break;
    case 6:
        function_ed62c9c2("zmb_platinum_bossfight", 5);
        break;
    case 7:
        function_5ea2c6e3("zmb_step_8", 1, 1);
        break;
    }
}

