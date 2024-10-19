// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\cp_common\objectives.gsc;
#using script_4937c6974f43bb71;
#using script_7d0013bbc05623b9;
#using script_35ae72be7b4fec10;
#using scripts\core_common\flag_shared.gsc;

#namespace hint_tutorial;

// Namespace hint_tutorial/hint_tutorial
// Params 0, eflags: 0x5
// Checksum 0xc3e2e290, Offset: 0x220
// Size: 0x34
function private autoexec __init__system__() {
    system::register("hint_tutorial", &preinit, undefined, undefined, undefined);
}

// Namespace hint_tutorial/hint_tutorial
// Params 0, eflags: 0x6 linked
// Checksum 0x3824418c, Offset: 0x260
// Size: 0x34
function private preinit() {
    clientfield::register("toplayer", "hint_pause_state", 1, 1, "int");
}

// Namespace hint_tutorial/hint_tutorial
// Params 9, eflags: 0x2 linked
// Checksum 0xbcfa7df5, Offset: 0x2a0
// Size: 0x454
function function_4c2d4fc4(message, title = #"", var_9696a2d = 0, var_db331a85 = #"", type = 0, var_c18a5a8b, var_9763e3fa, var_ad825676 = 1, var_572eedec) {
    self notify("401d877bc28daf47");
    self endon("401d877bc28daf47");
    player = self;
    if (!isplayer(player)) {
        player = getplayers()[0];
    }
    player endon(#"death");
    if (namespace_61e6d095::exists(#"hint_tutorial")) {
        player function_9f427d88(0);
        waitframe(1);
    }
    if (!namespace_61e6d095::exists(#"hint_tutorial")) {
        var_48bf6e66 = #"hash_775d3d8906586398";
        if (type == 2) {
            var_48bf6e66 = #"hash_30386b6ca189daa3";
        } else if (type > 2) {
            var_48bf6e66 = #"hash_77649627c20d31b1";
        }
        if (var_ad825676) {
            level prompts::function_86eedc();
        }
        namespace_61e6d095::create(#"hint_tutorial", var_48bf6e66);
        namespace_61e6d095::function_46df0bc7(#"hint_tutorial", 100);
    }
    if (isdefined(var_572eedec)) {
        function_142b2d59(var_572eedec);
    }
    namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "description", message);
    namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "title", title);
    namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "demoWidgeType", var_9696a2d);
    namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "callToAction", var_db331a85);
    namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "type", type);
    namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "delayAndFadeTime", -1);
    namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "pause", 0);
    if (type == 1) {
        namespace_82bfe441::fade(1, "FadeImmediate");
    }
    namespace_61e6d095::function_d3c3e5c3(#"hint_tutorial", [#"interactive_map", #"dialog_tree", #"computer"]);
    level.var_940e0c3e = type;
    level.var_5f632232 = message;
    if (isdefined(var_c18a5a8b) || isdefined(var_9763e3fa)) {
        player thread function_9f427d88(var_c18a5a8b, var_9763e3fa);
    }
}

// Namespace hint_tutorial/hint_tutorial
// Params 4, eflags: 0x2 linked
// Checksum 0x325a2633, Offset: 0x700
// Size: 0x144
function function_f0104b5(var_572eedec, var_86f04d40 = #"", var_71902fbb, var_cb93cf14) {
    if (!isdefined(var_572eedec)) {
        var_572eedec = [];
    } else if (!isarray(var_572eedec)) {
        var_572eedec = array(var_572eedec);
    }
    if (!isdefined(var_71902fbb)) {
        var_71902fbb = [];
    } else if (!isarray(var_71902fbb)) {
        var_71902fbb = array(var_71902fbb);
    }
    var_fab78b18 = {#title:var_86f04d40, #options:arraycopy(var_572eedec), #var_88c2ece:arraycopy(var_71902fbb), #var_cb93cf14:var_cb93cf14};
    return var_fab78b18;
}

// Namespace hint_tutorial/hint_tutorial
// Params 1, eflags: 0x6 linked
// Checksum 0x5fc3f6fc, Offset: 0x850
// Size: 0x204
function private function_142b2d59(var_572eedec) {
    if (!isdefined(var_572eedec)) {
        var_572eedec = [];
    } else if (!isarray(var_572eedec)) {
        var_572eedec = array(var_572eedec);
    }
    player = getplayers()[0];
    for (line_num = 0; line_num < var_572eedec.size; line_num++) {
        data = var_572eedec[line_num];
        title = data.title;
        options = data.options;
        var_88c2ece = data.var_88c2ece;
        var_cb93cf14 = data.var_cb93cf14;
        assert(isarray(options), "<unknown string>");
        namespace_61e6d095::function_f2a9266(#"hint_tutorial", line_num, "text", title);
        if (!player flag::get(var_cb93cf14) || !isdefined(var_88c2ece)) {
            namespace_61e6d095::function_f2a9266(#"hint_tutorial", line_num, "button_text", options);
        } else {
            namespace_61e6d095::function_f2a9266(#"hint_tutorial", line_num, "button_text", var_88c2ece);
        }
        if (isdefined(var_cb93cf14) && isdefined(var_88c2ece)) {
            player thread function_feebc7c2(data, line_num);
        }
    }
}

// Namespace hint_tutorial/hint_tutorial
// Params 2, eflags: 0x6 linked
// Checksum 0xb07a2bb9, Offset: 0xa60
// Size: 0x160
function private function_feebc7c2(data, line_num) {
    self endon(#"death", #"hash_79da7f3e8e35f82d");
    var_6d381b22 = self flag::get(data.var_cb93cf14);
    while (namespace_61e6d095::exists(#"hint_tutorial")) {
        if (var_6d381b22) {
            self flag::wait_till_clear(data.var_cb93cf14);
        } else {
            self flag::wait_till(data.var_cb93cf14);
        }
        var_6d381b22 = self flag::get(data.var_cb93cf14);
        if (var_6d381b22) {
            namespace_61e6d095::function_f2a9266(#"hint_tutorial", line_num, "button_text", data.var_88c2ece);
            continue;
        }
        namespace_61e6d095::function_f2a9266(#"hint_tutorial", line_num, "button_text", data.options);
    }
}

// Namespace hint_tutorial/hint_tutorial
// Params 1, eflags: 0x2 linked
// Checksum 0xf6df2d1d, Offset: 0xbc8
// Size: 0x6c
function function_df08d48(var_72b185dd = 0) {
    if (namespace_61e6d095::exists(#"hint_tutorial")) {
        namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "worldBlurAmount", var_72b185dd, 1);
    }
}

// Namespace hint_tutorial/hint_tutorial
// Params 6, eflags: 0x2 linked
// Checksum 0x1808f4d4, Offset: 0xc40
// Size: 0x49c
function pause(var_1d470cc4 = #"hash_3c27402259e4c18e", var_63d0d48f = #"hash_3f87d00d07eb799e", var_29fa9286 = 2, var_f191bdbc, var_37e3f2b0, var_415dea5d = 1) {
    level prompts::function_86eedc();
    if (is_true(level.gameended) || is_true(level.missionfailed) || level flag::get("restart_checkpoint") || level flag::get("restart_mission")) {
        return;
    }
    player = getplayers()[0];
    player endon(#"death");
    level endoncallback(&function_18c01825, #"game_ended", #"mission_failed", #"hash_2bb74762daab3cd", #"restart_checkpoint", #"restart_mission");
    if (namespace_61e6d095::exists(#"hint_tutorial")) {
        is_gamepad = player gamepadusedlast();
        setdvar(#"ui_busyblockingamemenu", !is_gamepad);
        namespace_82bfe441::fade(1, "FadeImmediate");
        objectives::function_9dfb43fc();
        namespace_61e6d095::function_73c9a490(#"hint_tutorial", 1);
        namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "pausePromptCancelMessage", var_63d0d48f);
        namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "input", var_1d470cc4);
        namespace_61e6d095::function_24e5fa63(#"hint_tutorial", var_1d470cc4, 1);
        player thread clientfield::set_to_player("hint_pause_state", 1);
        waitframe(2);
        namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "pause", var_29fa9286);
        player function_df08d48(5);
        selected = level waittill(#"lui_unpause_game");
        player thread flag::set_for_time(float(function_60d95f53()) / 1000 * 2, "was_paused");
        if (isdefined(var_37e3f2b0)) {
            level notify(var_37e3f2b0);
        }
        if (var_415dea5d) {
            player function_df08d48();
        }
        namespace_82bfe441::fade(0, "FadeMedium");
        objectives::function_4279fd02();
        level prompts::function_d675f5a4();
        player function_9f427d88(0, var_f191bdbc);
        player thread clientfield::set_to_player("hint_pause_state", 0);
        setdvar(#"ui_busyblockingamemenu", 0);
    }
}

// Namespace hint_tutorial/hint_tutorial
// Params 1, eflags: 0x6 linked
// Checksum 0xcc5b830d, Offset: 0x10e8
// Size: 0xa8
function private function_18c01825(*parms) {
    foreach (player in getplayers()) {
        if (isdefined(player)) {
            player thread clientfield::set_to_player("hint_pause_state", 0);
        }
    }
}

// Namespace hint_tutorial/hint_tutorial
// Params 2, eflags: 0x2 linked
// Checksum 0x4288827f, Offset: 0x1198
// Size: 0x29e
function function_9f427d88(var_67df10fb = 1, var_f191bdbc) {
    self notify("dcbd84128869fe1");
    self endon("dcbd84128869fe1");
    self endon(#"death");
    if (!isdefined(var_f191bdbc)) {
        var_f191bdbc = [];
    } else if (!isarray(var_f191bdbc)) {
        var_f191bdbc = array(var_f191bdbc);
    }
    reason = undefined;
    if (var_67df10fb >= float(function_60d95f53()) / 1000) {
        if (var_f191bdbc.size > 0) {
            reason = self waittilltimeout(var_67df10fb, var_f191bdbc);
        } else {
            wait(var_67df10fb);
        }
    } else if (var_f191bdbc.size > 0) {
        self waittill(var_f191bdbc);
        var_67df10fb = 0;
    }
    if (namespace_61e6d095::exists(#"hint_tutorial")) {
        namespace_61e6d095::function_9ade1d9b(#"hint_tutorial", "delayAndFadeTime", var_67df10fb);
    }
    if (var_67df10fb > 0 && reason._notify === #"timeout") {
        wait(2);
    }
    if (namespace_61e6d095::exists(#"hint_tutorial")) {
        namespace_61e6d095::function_73c9a490(#"hint_tutorial", 0);
        namespace_61e6d095::remove(#"hint_tutorial");
    }
    if (level.var_940e0c3e === 1) {
        namespace_82bfe441::fade(0, "FadeMedium");
    }
    level prompts::function_d675f5a4();
    self notify(#"hash_79da7f3e8e35f82d", {#message:level.var_5f632232});
    level.var_940e0c3e = undefined;
    level.var_5f632232 = undefined;
}

// Namespace hint_tutorial/hint_tutorial
// Params 1, eflags: 0x2 linked
// Checksum 0x85642967, Offset: 0x1440
// Size: 0x9c
function function_57a24ab5(visible) {
    if (namespace_61e6d095::exists(#"hint_tutorial")) {
        if (is_true(visible)) {
            namespace_61e6d095::function_f96376c5(#"hash_4672994c342b7571");
            return;
        }
        namespace_61e6d095::function_df0d7a85(#"hash_4672994c342b7571", #"hint_tutorial");
    }
}

