// Atian COD Tools GSC CW decompiler test
#using script_35ae72be7b4fec10;
#using script_13114d8a31c6152a;
#using script_4ae261b2785dda9f;
#using script_32399001bdb550da;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\dialogue.gsc;
#using scripts\cp_common\collectibles.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_46c3c08e;

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 0, eflags: 0x5
// Checksum 0x5cfd100d, Offset: 0x300
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"hash_14bc2f7d024f30c0", &preload, undefined, undefined, undefined);
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 0, eflags: 0x6 linked
// Checksum 0x88e0b923, Offset: 0x348
// Size: 0xf4
function private preload() {
    callback::on_spawned(&on_player_spawned);
    collectibles::add_callback("red_circus_kraus_ledger", &function_8806cc63);
    collectibles::add_callback("red_circus_audio_tape", &function_be9f0a9e);
    collectibles::add_callback("red_circus_dead_drop_list", &function_a084acb9);
    /#
        util::init_dvar("<unknown string>", -1, &function_31af0249);
        util::init_dvar("<unknown string>", 0, &function_6b507fee);
    #/
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 0, eflags: 0x6 linked
// Checksum 0x9c229a2, Offset: 0x448
// Size: 0x3c
function private on_player_spawned() {
    level flag::wait_till(#"gameplay_started");
    generate_solution(0);
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 1, eflags: 0x6 linked
// Checksum 0xd6ea2572, Offset: 0x490
// Size: 0x814
function private generate_solution(reset) {
    if (isdefined(level.var_60eee92e)) {
        return;
    }
    seed = savegame::function_2ee66e93(#"hash_6a83b769c50b79d2", undefined);
    if (!isdefined(seed) || is_true(reset)) {
        seed = int((function_b6db3f71() + randomint(2147483647)) % 2147483647);
        savegame::set_player_data(#"hash_6a83b769c50b79d2", seed);
    }
    function_68b722e5();
    var_48686aa8 = level.var_60eee92e.locations;
    var_8c5afe89 = level.var_60eee92e.var_c363cb12;
    var_687f51a8 = [];
    var_df0623ff = [];
    for (i = 0; i < var_48686aa8.size; i++) {
        if (is_true(var_48686aa8[i].var_59a4d624)) {
            if (!isdefined(var_687f51a8)) {
                var_687f51a8 = [];
            } else if (!isarray(var_687f51a8)) {
                var_687f51a8 = array(var_687f51a8);
            }
            var_687f51a8[var_687f51a8.size] = i;
            continue;
        }
        if (!isdefined(var_df0623ff)) {
            var_df0623ff = [];
        } else if (!isarray(var_df0623ff)) {
            var_df0623ff = array(var_df0623ff);
        }
        var_df0623ff[var_df0623ff.size] = i;
    }
    var_4abd20f4 = [];
    for (i = 0; i < var_687f51a8.size; i++) {
        for (j = i + 1; j < var_687f51a8.size; j++) {
            var_7df2d0a6 = function_67e3f98e(var_687f51a8[i], var_687f51a8[j]);
            if (!isdefined(var_4abd20f4)) {
                var_4abd20f4 = [];
            } else if (!isarray(var_4abd20f4)) {
                var_4abd20f4 = array(var_4abd20f4);
            }
            var_4abd20f4[var_4abd20f4.size] = var_7df2d0a6;
        }
    }
    assert(var_4abd20f4.size > var_8c5afe89.size);
    randresult = function_cd12badd(seed, getarraykeys(var_8c5afe89));
    seed = randresult.seed;
    var_74a258da = randresult.scrambled;
    randresult = function_cd12badd(seed, var_687f51a8);
    seed = randresult.seed;
    var_9b5a7338 = randresult.scrambled;
    assert(var_9b5a7338.size >= 9);
    for (i = 0; i < 3; i++) {
        var_c7696383 = var_74a258da[i];
        agent = var_8c5afe89[var_c7696383];
        agent.var_11faa37b = i;
        assert(agent.var_11faa37b < level.var_60eee92e.agents.size);
        var_e380d76b = var_9b5a7338[i * 2];
        function_3029b4d5(agent, var_e380d76b);
        var_1edddb3d = var_9b5a7338[i * 2 + 1];
        function_3029b4d5(agent, var_1edddb3d);
        var_7df2d0a6 = function_67e3f98e(var_e380d76b, var_1edddb3d);
        arrayremovevalue(var_4abd20f4, var_7df2d0a6);
        var_b83c8859 = var_74a258da[3 + i];
        var_37526c30 = var_8c5afe89[var_b83c8859];
        var_37526c30.var_5e0151b9 = var_c7696383;
        if (var_37526c30.gender == agent.gender) {
            function_3029b4d5(var_37526c30, var_e380d76b);
            var_3bc2777f = var_9b5a7338[6 + i];
            function_3029b4d5(var_37526c30, var_3bc2777f);
            var_7df2d0a6 = function_67e3f98e(var_e380d76b, var_3bc2777f);
            arrayremovevalue(var_4abd20f4, var_7df2d0a6);
            continue;
        }
        function_3029b4d5(var_37526c30, var_e380d76b);
        function_3029b4d5(var_37526c30, var_1edddb3d);
    }
    var_e7868f06 = 6;
    for (i = var_e7868f06; i < var_74a258da.size; i++) {
        var_9af06a57 = var_8c5afe89[var_74a258da[i]];
        rand = function_c9e9e505(seed, var_4abd20f4.size);
        seed = rand.seed;
        var_6eb170c5 = rand.rand;
        var_7df2d0a6 = var_4abd20f4[var_6eb170c5];
        arrayremoveindex(var_4abd20f4, var_6eb170c5, 0);
        var_fe37e068 = function_5bae38de(var_7df2d0a6);
        function_3029b4d5(var_9af06a57, var_fe37e068[0]);
        function_3029b4d5(var_9af06a57, var_fe37e068[1]);
    }
    randresult = function_cd12badd(seed, var_df0623ff);
    seed = randresult.seed;
    var_4c3294fc = randresult.scrambled;
    var_c39fbc24 = 0;
    for (i = 0; i < var_8c5afe89.size; i++) {
        var_9af06a57 = var_8c5afe89[i];
        function_3029b4d5(var_9af06a57, var_4c3294fc[var_c39fbc24]);
        var_c39fbc24 = (var_c39fbc24 + 1) % var_4c3294fc.size;
        rand = function_c9e9e505(seed, 100);
        seed = rand.seed;
        var_8654a011 = rand.rand < 50;
        if (var_8654a011) {
            function_3029b4d5(var_9af06a57, var_4c3294fc[var_c39fbc24]);
            var_c39fbc24 = (var_c39fbc24 + 1) % var_4c3294fc.size;
        }
    }
    /#
        function_5909fc47();
        function_ce468ae0();
    #/
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 0, eflags: 0x6 linked
// Checksum 0xba99f64e, Offset: 0xcb0
// Size: 0xec
function private function_68b722e5() {
    level.var_60eee92e = getscriptbundle(#"hash_2751bd581e249cb1");
    foreach (var_9af06a57 in level.var_60eee92e.var_c363cb12) {
        if (!isdefined(var_9af06a57.gender)) {
            var_9af06a57.gender = 0;
        }
    }
    assert(32 >= level.var_60eee92e.locations.size);
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 2, eflags: 0x6 linked
// Checksum 0xcc142d80, Offset: 0xda8
// Size: 0xd4
function private function_cd12badd(seed, array) {
    arraysize = array.size;
    for (i = 0; i < arraysize; i++) {
        rand = function_c9e9e505(seed, array.size);
        seed = rand.seed;
        temp = array[i];
        array[i] = array[rand.rand];
        array[rand.rand] = temp;
    }
    return {#scrambled:array, #seed:seed};
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 2, eflags: 0x6 linked
// Checksum 0x343ff9b6, Offset: 0xe88
// Size: 0x13c
function private function_3029b4d5(var_9af06a57, locationindex) {
    if (!isdefined(var_9af06a57.var_19c811ef)) {
        var_9af06a57.var_19c811ef = [locationindex];
        return;
    }
    inserted = 0;
    for (i = 0; i < var_9af06a57.var_19c811ef.size; i++) {
        if (locationindex < var_9af06a57.var_19c811ef[i]) {
            arrayinsert(var_9af06a57.var_19c811ef, locationindex, i);
            inserted = 1;
            break;
        }
    }
    if (!inserted) {
        if (!isdefined(var_9af06a57.var_19c811ef)) {
            var_9af06a57.var_19c811ef = [];
        } else if (!isarray(var_9af06a57.var_19c811ef)) {
            var_9af06a57.var_19c811ef = array(var_9af06a57.var_19c811ef);
        }
        var_9af06a57.var_19c811ef[var_9af06a57.var_19c811ef.size] = locationindex;
    }
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 2, eflags: 0x6 linked
// Checksum 0x7d39ac07, Offset: 0xfd0
// Size: 0x44
function private function_67e3f98e(var_bf78d6e8, var_7a1b4c82) {
    if (var_bf78d6e8 < var_7a1b4c82) {
        return ((var_bf78d6e8 << 5) + var_7a1b4c82);
    }
    return (var_7a1b4c82 << 5) + var_bf78d6e8;
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 1, eflags: 0x6 linked
// Checksum 0xd5c81230, Offset: 0x1020
// Size: 0x58
function private function_5bae38de(var_3f1daf6b) {
    var_bf78d6e8 = var_3f1daf6b >> 5;
    var_7a1b4c82 = var_3f1daf6b & 32 - 1;
    return [var_bf78d6e8, var_7a1b4c82];
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 1, eflags: 0x2 linked
// Checksum 0x1d6960ce, Offset: 0x1080
// Size: 0x71c
function function_eadf5d0b(var_fc34020f) {
    if (namespace_61e6d095::exists(#"hash_34f10865afcf9af7")) {
        function_2340e15a();
    }
    namespace_61e6d095::create(#"hash_34f10865afcf9af7", #"hash_71e7e2f7f0dd39e");
    namespace_61e6d095::function_d3c3e5c3(#"hash_34f10865afcf9af7", #"interactive_map");
    assert(isdefined(level.var_60eee92e));
    var_2b322539 = level.var_60eee92e.var_c363cb12;
    var_8c78fd5a = level.var_60eee92e.locations;
    namespace_61e6d095::function_9ade1d9b(#"hash_34f10865afcf9af7", "SuspectName", #"");
    namespace_61e6d095::function_9ade1d9b(#"hash_34f10865afcf9af7", "Alias", #"");
    namespace_61e6d095::function_9ade1d9b(#"hash_34f10865afcf9af7", "Gender", #"");
    namespace_61e6d095::function_9ade1d9b(#"hash_34f10865afcf9af7", "DateOfBirth", #"");
    namespace_61e6d095::function_9ade1d9b(#"hash_34f10865afcf9af7", "IsMarked", 0);
    namespace_61e6d095::function_9ade1d9b(#"hash_34f10865afcf9af7", "IsCompleted", var_fc34020f);
    globallogic_ui::function_9ed5232e("evidenceboard_review_suspect.numSuspectsMarked", 0);
    var_8f36ce4a = 0;
    var_ee4c6fdf = 0;
    var_a24e9150 = savegame::function_2ee66e93(#"hash_470832ca3fa7ae83");
    if (!isdefined(var_a24e9150)) {
        var_a24e9150 = [];
    } else if (!isarray(var_a24e9150)) {
        var_a24e9150 = array(var_a24e9150);
    }
    level.var_c2aff569 = [];
    foreach (index, var_7253f96e in var_2b322539) {
        if (!isdefined(var_a24e9150[index])) {
            var_a24e9150[index] = spawnstruct();
            var_a24e9150[index].ismarked = 0;
        }
        var_aa967222 = is_true(var_a24e9150[index].ismarked);
        if (var_aa967222) {
            var_8f36ce4a++;
            if (isdefined(var_7253f96e.var_11faa37b)) {
                var_ee4c6fdf++;
            }
        }
        level.var_c2aff569[index] = var_aa967222;
        namespace_61e6d095::function_f2a9266(#"hash_34f10865afcf9af7", index, "IsMarked", var_aa967222);
        namespace_61e6d095::function_f2a9266(#"hash_34f10865afcf9af7", index, "IsCompleted", 0);
        namespace_61e6d095::function_f2a9266(#"hash_34f10865afcf9af7", index, "SuspectName", var_7253f96e.name);
        namespace_61e6d095::function_f2a9266(#"hash_34f10865afcf9af7", index, "Alias", var_7253f96e.alias);
        var_835e07cd = #"hash_382e77cb4d185802";
        if (var_7253f96e.gender == 0) {
            var_835e07cd = #"hash_690977d15de371cb";
        }
        namespace_61e6d095::function_f2a9266(#"hash_34f10865afcf9af7", index, "Gender", var_835e07cd);
        namespace_61e6d095::function_f2a9266(#"hash_34f10865afcf9af7", index, "DateOfBirth", var_7253f96e.dateofbirth);
        namespace_61e6d095::function_f2a9266(#"hash_34f10865afcf9af7", index, "Thumbnail", var_7253f96e.thumbnail);
        namespace_61e6d095::function_f2a9266(#"hash_34f10865afcf9af7", index, "Ref", var_7253f96e.collectible);
        foreach (list_index, var_4f9f94d8 in var_7253f96e.var_19c811ef) {
            var_f80ba8cb = var_8c78fd5a[var_4f9f94d8];
            namespace_61e6d095::function_f2a9266(#"hash_34f10865afcf9af7", index, "Location" + list_index, var_f80ba8cb.var_2f94fe81);
        }
    }
    self globallogic_ui::function_9ed5232e("evidenceboard_review_suspect.numSuspectsMarked", var_8f36ce4a);
    self globallogic_ui::function_9ed5232e("evidenceboard_review_suspect.maxSuspectsMarked", var_8f36ce4a >= 3);
    savegame::set_player_data(#"hash_470832ca3fa7ae83", var_a24e9150);
    player_decision::function_e0bd7f7a(var_ee4c6fdf);
    namespace_61e6d095::function_73c9a490(#"hash_34f10865afcf9af7", 1);
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 0, eflags: 0x2 linked
// Checksum 0x19594d26, Offset: 0x17a8
// Size: 0x154
function function_2340e15a() {
    if (namespace_61e6d095::exists(#"hash_34f10865afcf9af7")) {
        namespace_61e6d095::function_73c9a490(#"hash_34f10865afcf9af7", 0);
        namespace_61e6d095::remove(#"hash_34f10865afcf9af7");
        var_ad588514 = 0;
        var_a24e9150 = savegame::function_2ee66e93(#"hash_470832ca3fa7ae83");
        for (index = 0; index < var_a24e9150.size; index++) {
            var_d01fbb39 = isdefined(var_a24e9150[index].ismarked) ? var_a24e9150[index].ismarked : 0;
            if (var_d01fbb39 != level.var_c2aff569[index]) {
                var_ad588514 = 1;
                break;
            }
        }
        /#
            if (level.var_8b183c3 >= 0) {
                var_ad588514 = 1;
            }
        #/
        if (var_ad588514) {
            savegame::save();
        }
    }
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 0, eflags: 0x2 linked
// Checksum 0x2fba2319, Offset: 0x1908
// Size: 0x34
function function_f9edf6c2() {
    if (isdefined(level.var_60eee92e.var_c363cb12)) {
        return level.var_60eee92e.var_c363cb12.size;
    }
    return 0;
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 1, eflags: 0x2 linked
// Checksum 0x2b4e7ede, Offset: 0x1948
// Size: 0x264
function function_407ee527(var_5a95d718) {
    var_8f36ce4a = globallogic_ui::function_f053dcd4("evidenceboard_review_suspect.numSuspectsMarked");
    var_8f86ece5 = var_8f36ce4a >= 3;
    var_aa967222 = namespace_61e6d095::function_82e355ff(#"hash_34f10865afcf9af7", "list." + var_5a95d718 + ".IsMarked");
    if (isdefined(var_8f86ece5) && isdefined(var_aa967222)) {
        if (!var_8f86ece5 || var_aa967222) {
            if (!var_aa967222) {
                var_8f36ce4a++;
            } else {
                var_8f36ce4a--;
            }
            var_aa967222 = !var_aa967222;
        }
    }
    namespace_61e6d095::function_f2a9266(#"hash_34f10865afcf9af7", var_5a95d718, "IsMarked", var_aa967222);
    var_a24e9150 = savegame::function_2ee66e93(#"hash_470832ca3fa7ae83");
    var_a24e9150[var_5a95d718].ismarked = var_aa967222;
    self globallogic_ui::function_9ed5232e("evidenceboard_review_suspect.numSuspectsMarked", var_8f36ce4a);
    self globallogic_ui::function_9ed5232e("evidenceboard_review_suspect.maxSuspectsMarked", var_8f36ce4a >= 3);
    var_ee4c6fdf = 0;
    var_2b322539 = level.var_60eee92e.var_c363cb12;
    foreach (index, var_7253f96e in var_2b322539) {
        var_aa967222 = is_true(var_a24e9150[index].ismarked);
        if (var_aa967222 && isdefined(var_7253f96e.var_11faa37b)) {
            var_ee4c6fdf++;
        }
    }
    player_decision::function_e0bd7f7a(var_ee4c6fdf);
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 3, eflags: 0x6 linked
// Checksum 0x491467c6, Offset: 0x1bb8
// Size: 0xc4
function private function_8b02e139(vox, var_577c1b53, var_243718d6) {
    player = self;
    if (is_true(savegame::function_2ee66e93(var_577c1b53))) {
        return;
    }
    if (var_243718d6) {
        player endoncallback(&function_b9938441, #"death", #"hash_56811b455b9b0e25");
    }
    player dialogue::radio(vox);
    savegame::set_player_data(var_577c1b53, 1);
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 1, eflags: 0x6 linked
// Checksum 0x1621fee0, Offset: 0x1c88
// Size: 0x2c
function private function_b9938441(*str_notify) {
    player = self;
    player dialogue::function_9e580f95();
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 1, eflags: 0x2 linked
// Checksum 0xdc534a9f, Offset: 0x1cc0
// Size: 0xe4
function function_8806cc63(params) {
    player = getplayers()[0];
    player endon(#"death");
    var_bd597cf5 = function_c83dffcf();
    player thread function_8b02e139("vox_cp_sh0_02200_sims_thatledgerfromk_a1", #"hash_395b10dd29b892b1", 1);
    player function_67355ff9(#"hash_4a0d3b928a98bd6c", params.title, var_bd597cf5[0].var_45f26a8c, var_bd597cf5[1].var_45f26a8c, var_bd597cf5[2].var_45f26a8c);
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 1, eflags: 0x2 linked
// Checksum 0xcbd04ec7, Offset: 0x1db0
// Size: 0xcc
function function_be9f0a9e(params) {
    player = getplayers()[0];
    player endon(#"death");
    var_bd597cf5 = function_c83dffcf();
    player thread function_78c0b36a(var_bd597cf5);
    player function_67355ff9(#"hash_c2786a93a546ce9", params.title, var_bd597cf5[0].var_8ef24e96, var_bd597cf5[1].var_8ef24e96, var_bd597cf5[2].var_8ef24e96);
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 1, eflags: 0x6 linked
// Checksum 0xf94b6841, Offset: 0x1e88
// Size: 0x330
function private function_78c0b36a(var_bd597cf5) {
    player = self;
    player endoncallback(&function_b9938441, #"death", #"hash_56811b455b9b0e25");
    player waittill(#"hash_3599a97a925d8c4e");
    player function_8b02e139("vox_cp_sh0_02300_sims_itlookslikeapar_d7", #"hash_1b070b02b2fd153c", 0);
    wait(1.5);
    while (true) {
        namespace_61e6d095::function_9ade1d9b(#"hash_5fbe0a5a2e82c156", "audioWave", randomintrange(1, 4));
        player dialogue::radio(var_bd597cf5[0].var_dcdae085, undefined, undefined, 1);
        namespace_61e6d095::function_9ade1d9b(#"hash_5fbe0a5a2e82c156", "audioWave", 0);
        wait(1.8);
        namespace_61e6d095::function_9ade1d9b(#"hash_5fbe0a5a2e82c156", "audioWave", randomintrange(1, 4));
        player dialogue::radio(var_bd597cf5[1].var_dcdae085, undefined, undefined, 1);
        namespace_61e6d095::function_9ade1d9b(#"hash_5fbe0a5a2e82c156", "audioWave", 0);
        wait(1.3);
        namespace_61e6d095::function_9ade1d9b(#"hash_5fbe0a5a2e82c156", "audioWave", randomintrange(1, 4));
        player dialogue::radio(var_bd597cf5[2].var_dcdae085, undefined, undefined, 1);
        namespace_61e6d095::function_9ade1d9b(#"hash_5fbe0a5a2e82c156", "audioWave", 0);
        wait(1);
        namespace_c8e236da::removelist();
        namespace_c8e236da::function_ebf737f8(#"hash_3893375dc8d4a2a2");
        namespace_c8e236da::function_ebf737f8(#"hash_70ea6473ebf66053");
        player waittill(#"hash_278b9a3955f6e5a");
        namespace_c8e236da::removelist();
        namespace_c8e236da::function_ebf737f8(#"hash_70ea6473ebf66053");
    }
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 1, eflags: 0x2 linked
// Checksum 0x2c85fdd, Offset: 0x21c0
// Size: 0xe4
function function_a084acb9(params) {
    player = getplayers()[0];
    player endon(#"death");
    var_bd597cf5 = function_c83dffcf();
    player thread function_8b02e139("vox_cp_sh0_02400_sims_theleadagentsha_e9", #"hash_26a660868b8c9f2a", 1);
    player function_67355ff9(#"deaddrop", params.title, var_bd597cf5[0].var_ae185984, var_bd597cf5[1].var_ae185984, var_bd597cf5[2].var_ae185984);
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 0, eflags: 0x6 linked
// Checksum 0x178d4810, Offset: 0x22b0
// Size: 0x218
function private function_c83dffcf() {
    var_9bd695ca = [];
    for (var_9e5e6a99 = 0; var_9e5e6a99 < level.var_60eee92e.var_c363cb12.size; var_9e5e6a99++) {
        var_9af06a57 = level.var_60eee92e.var_c363cb12[var_9e5e6a99];
        if (!isdefined(var_9af06a57.var_11faa37b)) {
            continue;
        }
        var_38f902ab = level.var_60eee92e.agents[var_9af06a57.var_11faa37b];
        keyinfo = {};
        if (var_9af06a57.gender == 0) {
            keyinfo.var_8ef24e96 = var_38f902ab.var_12e0f108;
            keyinfo.var_dcdae085 = var_38f902ab.var_be82420e;
        } else {
            keyinfo.var_8ef24e96 = var_38f902ab.var_389ce4eb;
            keyinfo.var_dcdae085 = var_38f902ab.var_aa6ddc85;
        }
        for (var_3bca6920 = 0; var_3bca6920 < var_9af06a57.var_19c811ef.size; var_3bca6920++) {
            var_6cbd0d9c = var_9af06a57.var_19c811ef[var_3bca6920];
            var_b7a77c7e = level.var_60eee92e.locations[var_6cbd0d9c];
            if (is_true(var_b7a77c7e.var_59a4d624)) {
                if (!isdefined(keyinfo.var_45f26a8c)) {
                    keyinfo.var_45f26a8c = var_b7a77c7e.var_2f94fe81;
                    continue;
                }
                assert(!isdefined(keyinfo.var_ae185984));
                keyinfo.var_ae185984 = var_b7a77c7e.var_2f94fe81;
            }
        }
        assert(!isdefined(var_9bd695ca[var_9af06a57.var_11faa37b]));
        var_9bd695ca[var_9af06a57.var_11faa37b] = keyinfo;
    }
    return var_9bd695ca;
}

// Namespace namespace_46c3c08e/namespace_46c3c08e
// Params 5, eflags: 0x6 linked
// Checksum 0xcd2648a, Offset: 0x24d0
// Size: 0x1dc
function private function_67355ff9(var_923bcf70, var_244fe14c, var_93587998, var_f2e550e5, var_d0cf87ff) {
    player = self;
    namespace_61e6d095::create(#"hash_5fbe0a5a2e82c156", #"hash_780065c4d8d28b79");
    namespace_61e6d095::function_d3c3e5c3(#"hash_5fbe0a5a2e82c156", #"interactive_map");
    namespace_61e6d095::function_9ade1d9b(#"hash_5fbe0a5a2e82c156", "evidenceType", var_923bcf70);
    namespace_61e6d095::function_9ade1d9b(#"hash_5fbe0a5a2e82c156", "title", var_244fe14c);
    if (isdefined(var_93587998)) {
        namespace_61e6d095::function_9ade1d9b(#"hash_5fbe0a5a2e82c156", "beardedLadyLocString", var_93587998);
    }
    if (isdefined(var_f2e550e5)) {
        namespace_61e6d095::function_9ade1d9b(#"hash_5fbe0a5a2e82c156", "strongManLocString", var_f2e550e5);
    }
    if (isdefined(var_d0cf87ff)) {
        namespace_61e6d095::function_9ade1d9b(#"hash_5fbe0a5a2e82c156", "jugglerLocString", var_d0cf87ff);
    }
    player notify(#"hash_3599a97a925d8c4e");
    player namespace_61e6d095::function_b0bad5ff();
    player notify(#"hash_56811b455b9b0e25");
    namespace_61e6d095::remove(#"hash_5fbe0a5a2e82c156");
}

/#

    // Namespace namespace_46c3c08e/namespace_46c3c08e
    // Params 1, eflags: 0x4
    // Checksum 0x5f8d0272, Offset: 0x26b8
    // Size: 0x7c
    function private function_31af0249(params) {
        if (params.name == "<unknown string>") {
            level.var_8b183c3 = int(params.value);
            if (level.var_8b183c3 >= 0) {
                function_5b5c671(level.var_8b183c3);
            }
        }
    }

    // Namespace namespace_46c3c08e/namespace_46c3c08e
    // Params 1, eflags: 0x4
    // Checksum 0x3a3400c8, Offset: 0x2740
    // Size: 0x294
    function private function_5b5c671(var_2daa4744) {
        if (var_2daa4744 < 0) {
            var_2daa4744 = 0;
        } else if (var_2daa4744 > 3) {
            var_2daa4744 = 3;
        }
        var_196b4e47 = 0;
        player_decision::function_e0bd7f7a(var_2daa4744);
        var_a24e9150 = savegame::function_2ee66e93(#"hash_470832ca3fa7ae83");
        if (!isdefined(var_a24e9150)) {
            if (!isdefined(var_a24e9150)) {
                var_a24e9150 = [];
            } else if (!isarray(var_a24e9150)) {
                var_a24e9150 = array(var_a24e9150);
            }
        }
        var_7dab1ac3 = namespace_61e6d095::exists(#"hash_34f10865afcf9af7");
        var_2b322539 = level.var_60eee92e.var_c363cb12;
        foreach (index, var_7253f96e in var_2b322539) {
            if (!isdefined(var_a24e9150[index])) {
                var_a24e9150[index] = spawnstruct();
            }
            var_a24e9150[index].ismarked = 0;
            if (isdefined(var_7253f96e.var_11faa37b) && var_196b4e47 < var_2daa4744) {
                var_a24e9150[index].ismarked = 1;
                var_196b4e47++;
            }
            if (var_7dab1ac3) {
                namespace_61e6d095::function_f2a9266(#"hash_34f10865afcf9af7", index, "<unknown string>", var_a24e9150[index].ismarked);
            }
        }
        savegame::set_player_data(#"hash_470832ca3fa7ae83", var_a24e9150);
        if (var_7dab1ac3) {
            globallogic_ui::function_9ed5232e("<unknown string>", var_2daa4744);
            globallogic_ui::function_9ed5232e("<unknown string>", var_2daa4744 >= 3);
        }
    }

    // Namespace namespace_46c3c08e/namespace_46c3c08e
    // Params 1, eflags: 0x4
    // Checksum 0x9c2a147a, Offset: 0x29e0
    // Size: 0x12c
    function private function_6b507fee(params) {
        if (params.value > 0) {
            setdvar(#"hash_35aadcf302a6bd3a", 0);
            if (isdefined(level.var_60eee92e)) {
                foreach (var_9af06a57 in level.var_60eee92e.var_c363cb12) {
                    var_9af06a57.var_19c811ef = undefined;
                    var_9af06a57.var_11faa37b = undefined;
                    var_9af06a57.var_5e0151b9 = undefined;
                }
                level.var_60eee92e = undefined;
            }
            var_56ce02e1 = params.value > 1;
            generate_solution(var_56ce02e1);
        }
    }

    // Namespace namespace_46c3c08e/namespace_46c3c08e
    // Params 0, eflags: 0x4
    // Checksum 0x1bc717b4, Offset: 0x2b18
    // Size: 0x3d4
    function private function_5909fc47() {
        println("<unknown string>");
        println("<unknown string>");
        println("<unknown string>" + savegame::function_2ee66e93(#"hash_6a83b769c50b79d2", "<unknown string>") + "<unknown string>");
        println("<unknown string>");
        for (var_9e5e6a99 = 0; var_9e5e6a99 < level.var_60eee92e.var_c363cb12.size; var_9e5e6a99++) {
            var_9af06a57 = level.var_60eee92e.var_c363cb12[var_9e5e6a99];
            println("<unknown string>" + var_9e5e6a99 + "<unknown string>");
            if (isdefined(var_9af06a57.var_11faa37b)) {
                alias = level.var_60eee92e.agents[var_9af06a57.var_11faa37b].alias;
                println("<unknown string>" + makelocalizedstring(alias) + "<unknown string>");
            }
            if (isdefined(var_9af06a57.var_5e0151b9)) {
                var_401f3c2b = level.var_60eee92e.var_c363cb12[var_9af06a57.var_5e0151b9];
                assert(isdefined(var_401f3c2b.var_11faa37b));
                alias = level.var_60eee92e.agents[var_401f3c2b.var_11faa37b].alias;
                println("<unknown string>" + makelocalizedstring(alias) + "<unknown string>");
            }
            println("<unknown string>" + makelocalizedstring(var_9af06a57.name));
            if (var_9af06a57.gender == 0) {
                println("<unknown string>");
            } else {
                println("<unknown string>");
            }
            println("<unknown string>");
            for (var_3bca6920 = 0; var_3bca6920 < var_9af06a57.var_19c811ef.size; var_3bca6920++) {
                var_6cbd0d9c = var_9af06a57.var_19c811ef[var_3bca6920];
                var_b7a77c7e = level.var_60eee92e.locations[var_6cbd0d9c];
                var_5eda5d43 = "<unknown string>";
                if (is_true(var_b7a77c7e.var_59a4d624)) {
                    var_5eda5d43 = "<unknown string>";
                }
                println("<unknown string>" + var_6cbd0d9c + "<unknown string>" + makelocalizedstring(var_b7a77c7e.var_2f94fe81) + var_5eda5d43);
            }
            println("<unknown string>");
        }
    }

    // Namespace namespace_46c3c08e/namespace_46c3c08e
    // Params 0, eflags: 0x4
    // Checksum 0xa31ffdc1, Offset: 0x2ef8
    // Size: 0x2f4
    function private function_ce468ae0() {
        println("<unknown string>");
        println("<unknown string>");
        println("<unknown string>");
        var_3dc3d90a = level.var_60eee92e.var_c363cb12;
        for (var_49d3a37d = 0; var_49d3a37d < var_3dc3d90a.size; var_49d3a37d++) {
            for (var_d977e4b9 = var_49d3a37d + 1; var_d977e4b9 < var_3dc3d90a.size; var_d977e4b9++) {
                var_960966f2 = var_3dc3d90a[var_49d3a37d];
                var_ed14221d = var_3dc3d90a[var_d977e4b9];
                if (var_960966f2.gender == var_ed14221d.gender) {
                    var_b960cd6c = [];
                    for (i = 0; i < var_960966f2.var_19c811ef.size; i++) {
                        locindex = var_960966f2.var_19c811ef[i];
                        if (is_true(level.var_60eee92e.locations[locindex].var_59a4d624)) {
                            if (!isdefined(var_b960cd6c)) {
                                var_b960cd6c = [];
                            } else if (!isarray(var_b960cd6c)) {
                                var_b960cd6c = array(var_b960cd6c);
                            }
                            var_b960cd6c[var_b960cd6c.size] = locindex;
                        }
                    }
                    var_bf580ad5 = [];
                    for (i = 0; i < var_ed14221d.var_19c811ef.size; i++) {
                        locindex = var_ed14221d.var_19c811ef[i];
                        if (is_true(level.var_60eee92e.locations[locindex].var_59a4d624)) {
                            if (!isdefined(var_bf580ad5)) {
                                var_bf580ad5 = [];
                            } else if (!isarray(var_bf580ad5)) {
                                var_bf580ad5 = array(var_bf580ad5);
                            }
                            var_bf580ad5[var_bf580ad5.size] = locindex;
                        }
                    }
                    if (var_b960cd6c[0] == var_bf580ad5[0] && var_b960cd6c[1] == var_bf580ad5[1]) {
                        assertmsg("<unknown string>" + var_49d3a37d + "<unknown string>" + var_d977e4b9 + "<unknown string>");
                    }
                }
            }
        }
        println("<unknown string>");
    }

#/
