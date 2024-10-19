// Atian COD Tools GSC CW decompiler test
#using script_28e27ee9b45fd02d;
#using scripts\cp_common\snd_utility.csc;
#using script_1cd690a97dfca36e;
#using scripts\cp_common\snd.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\music_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_72b0499b;

// Namespace namespace_72b0499b/namespace_268b0a5e
// Params 0, eflags: 0x2 linked
// Checksum 0xea5cba02, Offset: 0x208
// Size: 0xdc
function init_audio() {
    function_b6407dd4(0);
    snd::function_d4ec748e(&function_f2a2832d);
    function_5ea2c6e3("cp_nam_armada_intro", 0, 1);
    level thread function_35995965();
    level thread function_2c8b8f30();
    level thread function_89f1a26b();
    level thread function_a05af5bd();
    setsoundcontext("vehicle", "exterior");
}

// Namespace namespace_72b0499b/namespace_268b0a5e
// Params 0, eflags: 0x2 linked
// Checksum 0x35f39dcc, Offset: 0x2f0
// Size: 0x3c
function function_35995965() {
    wait(10);
    audio::playloopat(#"hash_31753ddf2b6f4132", (-10592, -71744, 1060));
}

// Namespace namespace_72b0499b/namespace_268b0a5e
// Params 0, eflags: 0x2 linked
// Checksum 0xbe0f9394, Offset: 0x338
// Size: 0x3c
function function_2c8b8f30() {
    wait(9);
    audio::playloopat(#"hash_6deb3ead8c6443d8", (-10645, -71188, 1129));
}

// Namespace namespace_72b0499b/namespace_268b0a5e
// Params 0, eflags: 0x2 linked
// Checksum 0x4428c878, Offset: 0x380
// Size: 0x3c
function function_89f1a26b() {
    wait(9);
    audio::playloopat(#"hash_98b0f543b0899aa", (-9706, -72793, 1158));
}

// Namespace namespace_72b0499b/namespace_268b0a5e
// Params 0, eflags: 0x2 linked
// Checksum 0xd0c63922, Offset: 0x3c8
// Size: 0x3c
function function_a05af5bd() {
    wait(9);
    audio::playloopat(#"hash_116cd59e89c47ab5", (-10137, -71777, 1084));
}

// Namespace namespace_72b0499b/namespace_268b0a5e
// Params 2, eflags: 0x6 linked
// Checksum 0x661a7dd1, Offset: 0x410
// Size: 0x6f2
function private function_f2a2832d(*player, msg) {
    switch (msg) {
    case #"hash_2402a22c6c4e796e":
        audio::snd_set_snapshot("cp_nam_armada_intro");
        break;
    case #"hash_55704324b6ae9012":
        function_ed62c9c2("cp_nam_armada_intro", 0.5);
        function_ed62c9c2("cp_nam_armada_flyin_fade", 0.5);
        break;
    case #"hash_394162110e28e4d1":
        function_ed62c9c2("cp_nam_armada_flyin_fade", 0.5);
        wait(9);
        function_ed62c9c2("cp_nam_armada_intro", 3);
        break;
    case #"hash_391dd8e0fb7ccb35":
        audio::stoploopat(#"hash_31753ddf2b6f4132", (-10592, -71744, 1060));
        level.var_d7e7f155 = playsound(0, #"hash_6177d466d072fad0");
        break;
    case #"hash_443b18ddc7cacdc4":
        function_5ea2c6e3("cp_nam_armada_flyin_fade", 2, 1);
        level.var_7c98fad5 = snd::play("evt_teleport_long", (0, 0, 0));
        playsound(0, #"hash_4883efec84a656ed", (0, 0, 0));
        wait(2);
        function_ed62c9c2("cp_nam_armada_headset", 5);
        break;
    case #"hash_3d8cbffebe7b249f":
        function_ed62c9c2("cp_nam_armada_flyin_fade", 3);
        snd::stop(level.var_7c98fad5, 2.5);
        break;
    case #"hash_4a41082a1d97f925":
        setsoundcontext("vehicle", "interior");
        break;
    case #"hash_2086d5e690a6ff1b":
        setsoundcontext("vehicle", "exterior");
        break;
    case #"hash_551e8554285c2305":
        setsoundcontext("plr_impact", "vehicle");
        break;
    case #"hash_66209bfcf3bd11ca":
        setsoundcontext("plr_impact", "flesh");
        break;
    case #"hash_5afc55d02e0ee09e":
        function_5ea2c6e3("cp_nam_armada_headset", 0, 1);
        function_ed62c9c2("cp_nam_armada_heli_board", 5);
        break;
    case #"hash_72dd94fb3a8887e5":
        function_5ea2c6e3("cp_nam_armada_flyable_chopper", 0, 1);
        break;
    case #"hash_763d59f6976503eb":
        function_ed62c9c2("cp_nam_armada_flyable_chopper");
        break;
    case #"hash_27d6715548390283":
        function_5ea2c6e3("cp_nam_armada_heli_board", 5, 1);
        break;
    case #"hash_2b94ea847ae2b667":
        function_b6407dd4(0);
        break;
    case #"hash_664776555d3b2bdc":
        function_b6407dd4(1);
        break;
    case #"hash_51446351b2ec1bdc":
        function_5ea2c6e3("cp_nam_armada_flyin_fade", 4, 1);
        level.var_7c98fad5 = snd::play("evt_teleport_long", (0, 0, 0));
        break;
    case #"hash_fe51ca48b75d08c":
        function_ed62c9c2("cp_nam_armada_flyin_fade", 2.5);
        snd::stop(level.var_7c98fad5, 2.5);
        break;
    case #"hash_1b69ee637e8a6a94":
        function_5ea2c6e3("cp_nam_armada_napalm_event", 0.25, 1);
        playsound(0, "evt_armada_final_napalm_strike", (0, 0, 0));
        break;
    case #"hash_5589c3a538ff9235":
        function_ed62c9c2("cp_nam_armada_napalm_event", 1);
        audio::playloopat(#"hash_7830918d7b135b78", (10132, -13164, 3199));
        break;
    case #"hash_3dfb68a565cdf08":
        function_5ea2c6e3("cp_nam_armada_outro_fade", 4, 1);
        break;
    case #"musictrack_cp_armada_5":
    case #"musictrack_cp_armada_4":
    case #"musictrack_cp_armada_3":
    case #"musictrack_cp_armada_2":
    case #"musictrack_cp_armada_1":
        function_2cca7b47(0, msg);
        break;
    default:
        /#
            snd::function_81fac19d(snd::function_d78e3644(), "<unknown string>" + snd::function_783b69(msg, "<unknown string>"));
        #/
        break;
    }
}

