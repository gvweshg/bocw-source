// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\struct.csc;

#namespace scene;

/#

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x5
    // Checksum 0x69cfa57c, Offset: 0xb0
    // Size: 0x3c
    function private autoexec __init__system__() {
        system::register(#"scene_debug", &function_c3c9d0e5, undefined, undefined, undefined);
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0xd0f0fe95, Offset: 0xf8
    // Size: 0x9c
    function function_c3c9d0e5() {
        if (getdvarstring(#"scene_menu_mode", "<unknown string>") == "<unknown string>") {
            setdvar(#"scene_menu_mode", "<unknown string>");
        }
        level thread run_scene_tests();
        level thread toggle_scene_menu();
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0xbf92cc88, Offset: 0x1a0
    // Size: 0x52e
    function run_scene_tests() {
        level endon(#"run_scene_tests");
        level.scene_test_struct = spawnstruct();
        level.scene_test_struct.origin = (0, 0, 0);
        level.scene_test_struct.angles = (0, 0, 0);
        while (true) {
            str_scene = getdvarstring(#"run_client_scene");
            str_mode = tolower(getdvarstring(#"scene_menu_mode", "<unknown string>"));
            a_toks = strtok(str_scene, "<unknown string>");
            str_scene = a_toks[0];
            str_shot = a_toks[1];
            if (!isdefined(str_scene)) {
                str_scene = "<unknown string>";
            }
            if (str_scene != "<unknown string>") {
                setdvar(#"run_client_scene", "<unknown string>");
                clear_old_ents(str_scene);
                b_found = 0;
                a_scenes = struct::get_array(str_scene, "<unknown string>");
                foreach (s_instance in a_scenes) {
                    if (isdefined(s_instance)) {
                        b_found = 1;
                        s_instance thread test_play(undefined, str_shot, str_mode);
                    }
                }
                if (isdefined(level.active_scenes[str_scene])) {
                    foreach (s_instance in level.active_scenes[str_scene]) {
                        if (!isinarray(a_scenes, s_instance)) {
                            b_found = 1;
                            s_instance thread test_play(str_scene, str_shot, str_mode);
                        }
                    }
                }
                if (!b_found) {
                    level.scene_test_struct thread test_play(str_scene, str_shot, str_mode);
                }
            }
            str_scene = getdvarstring(#"init_client_scene");
            if (str_scene != "<unknown string>") {
                setdvar(#"init_client_scene", "<unknown string>");
                clear_old_ents(str_scene);
                b_found = 0;
                a_scenes = struct::get_array(str_scene, "<unknown string>");
                foreach (s_instance in a_scenes) {
                    if (isdefined(s_instance)) {
                        b_found = 1;
                        s_instance thread test_init();
                    }
                }
                if (!b_found) {
                    level.scene_test_struct thread test_init(str_scene);
                }
            }
            str_scene = getdvarstring(#"stop_client_scene");
            if (str_scene != "<unknown string>") {
                setdvar(#"stop_client_scene", "<unknown string>");
                function_d2785094(level.var_a572f325);
                level stop(str_scene, 1);
            }
            waitframe(1);
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x891cab0d, Offset: 0x6d8
    // Size: 0xc8
    function clear_old_ents(str_scene) {
        foreach (ent in getentarray(0)) {
            if (ent.scene_spawned === str_scene && ent.finished_scene === str_scene) {
                ent delete();
            }
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0xcd3e2234, Offset: 0x7a8
    // Size: 0x1ec
    function toggle_scene_menu() {
        setdvar(#"client_scene_menu", 0);
        n_scene_menu_last = -1;
        while (true) {
            n_scene_menu = getdvarstring(#"client_scene_menu");
            if (n_scene_menu != "<unknown string>") {
                n_scene_menu = int(n_scene_menu);
                if (n_scene_menu != n_scene_menu_last) {
                    switch (n_scene_menu) {
                    case 1:
                        level thread display_scene_menu("<unknown string>");
                        break;
                    case 2:
                        level thread display_scene_menu("<unknown string>");
                        break;
                    default:
                        level flag::clear(#"menu_open");
                        level flag::clear(#"hash_4035a6aa4a6ba08d");
                        level flag::clear(#"hash_7b50fddf7a4b9e2e");
                        level flag::clear(#"hash_5bcd66a9c21f5b2d");
                        level notify(#"scene_menu_cleanup");
                        setdvar(#"cl_tacticalhud", 1);
                        break;
                    }
                    n_scene_menu_last = n_scene_menu;
                }
            }
            waitframe(1);
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0xe2cd79a5, Offset: 0x9a0
    // Size: 0xd4
    function function_8ee42bf(o_scene) {
        if (isdefined(o_scene) && isdefined(o_scene._s)) {
            str_type = isdefined(o_scene._s.scenetype) ? o_scene._s.scenetype : "<unknown string>";
            if (level flag::get(str_type + "<unknown string>") && level flag::get(#"hash_5bcd66a9c21f5b2d")) {
                level thread display_scene_menu(o_scene._s.scenetype);
            }
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 2, eflags: 0x0
    // Checksum 0x947fce80, Offset: 0xa80
    // Size: 0xd3e
    function display_scene_menu(str_type, str_scene) {
        if (!isdefined(str_type)) {
            str_type = "<unknown string>";
        }
        level flag::clear(#"hash_4035a6aa4a6ba08d");
        level flag::clear(#"hash_7b50fddf7a4b9e2e");
        level notify(#"scene_menu_cleanup");
        level endon(#"scene_menu_cleanup");
        waittillframeend();
        level flag::set(#"menu_open");
        setdvar(#"cl_tacticalhud", 0);
        b_shot_menu = 0;
        a_scenedefs = get_scenedefs(str_type);
        if (str_type == "<unknown string>") {
            a_scenedefs = arraycombine(a_scenedefs, get_scenedefs("<unknown string>"), 0, 1);
        }
        names = [];
        if (isstring(str_scene)) {
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            names = arraycombine(names, get_all_shot_names(str_scene), 1, 0);
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            str_title = str_scene;
            b_shot_menu = 1;
            selected = isdefined(level.scene_menu_shot_index) ? level.scene_menu_shot_index : 0;
        } else {
            level flag::set(str_type + "<unknown string>");
            names[0] = "<unknown string>";
            names[1] = "<unknown string>";
            if (level flag::get(#"hash_5bcd66a9c21f5b2d")) {
                println("<unknown string>" + toupper(str_type) + "<unknown string>");
            }
            var_72acc069 = 1;
            foreach (s_scenedef in a_scenedefs) {
                if (s_scenedef.vmtype === "<unknown string>" && s_scenedef.scenetype === str_type) {
                    if (level flag::get(#"hash_5bcd66a9c21f5b2d")) {
                        if (is_active(s_scenedef.name) && function_c0f30783(s_scenedef)) {
                            array::add_sorted(names, s_scenedef.name, 0);
                            println("<unknown string>" + toupper(str_type) + "<unknown string>" + var_72acc069 + "<unknown string>" + s_scenedef.name);
                            var_72acc069++;
                        }
                        continue;
                    }
                    if (function_c0f30783(s_scenedef)) {
                        array::add_sorted(names, s_scenedef.name, 0);
                    }
                }
            }
            if (level flag::get(#"hash_5bcd66a9c21f5b2d")) {
                println("<unknown string>" + toupper(str_type) + "<unknown string>");
            }
            names[names.size] = "<unknown string>";
            str_title = str_type + "<unknown string>";
        }
        selected = 0;
        up_pressed = 0;
        down_pressed = 0;
        held = 0;
        old_selected = selected;
        while (true) {
            if (held) {
                scene_list_settext(names, selected, str_title, 30);
                wait(0.5);
            } else {
                scene_list_settext(names, selected, str_title, 1);
            }
            if (!up_pressed) {
                if (function_5c10bd79(0) util::up_button_pressed()) {
                    up_pressed = 1;
                    selected--;
                    if (names[selected] === "<unknown string>") {
                        selected--;
                    }
                }
            } else if (function_5c10bd79(0) util::up_button_held()) {
                held = 1;
                selected -= 10;
            } else if (!function_5c10bd79(0) util::up_button_pressed()) {
                held = 0;
                up_pressed = 0;
            }
            if (!down_pressed) {
                if (function_5c10bd79(0) util::down_button_pressed()) {
                    down_pressed = 1;
                    selected++;
                    if (names[selected] === "<unknown string>") {
                        selected++;
                    }
                }
            } else if (function_5c10bd79(0) util::down_button_held()) {
                held = 1;
                selected += 10;
            } else if (!function_5c10bd79(0) util::down_button_pressed()) {
                held = 0;
                down_pressed = 0;
            }
            if (held) {
                if (selected < 0) {
                    selected = 0;
                } else if (selected >= names.size) {
                    selected = names.size - 1;
                }
            } else if (selected < 0) {
                selected = names.size - 1;
            } else if (selected >= names.size) {
                selected = 0;
            }
            if (function_5c10bd79(0) buttonpressed("<unknown string>")) {
                if (b_shot_menu) {
                    while (function_5c10bd79(0) buttonpressed("<unknown string>")) {
                        waitframe(1);
                    }
                    level.scene_menu_shot_index = selected;
                    level thread display_scene_menu(str_type);
                } else {
                    level.scene_menu_shot_index = selected;
                    setdvar(#"client_scene_menu", 0);
                }
            }
            if (function_5c10bd79(0) buttonpressed("<unknown string>") || function_5c10bd79(0) buttonpressed("<unknown string>") || function_5c10bd79(0) buttonpressed("<unknown string>")) {
                if (names[selected] == "<unknown string>") {
                    level flag::toggle("<unknown string>");
                    while (function_5c10bd79(0) buttonpressed("<unknown string>") || function_5c10bd79(0) buttonpressed("<unknown string>") || function_5c10bd79(0) buttonpressed("<unknown string>")) {
                        waitframe(1);
                    }
                    level thread display_scene_menu(str_type);
                } else if (names[selected] == "<unknown string>") {
                    setdvar(#"client_scene_menu", 0);
                } else if (b_shot_menu) {
                    if (names[selected] == "<unknown string>") {
                        level.scene_menu_shot_index = selected;
                        while (function_5c10bd79(0) buttonpressed("<unknown string>") || function_5c10bd79(0) buttonpressed("<unknown string>") || function_5c10bd79(0) buttonpressed("<unknown string>")) {
                            waitframe(1);
                        }
                        level thread display_scene_menu(str_type);
                    } else if (names[selected] == "<unknown string>") {
                        setdvar(#"stop_client_scene", str_scene);
                    } else if (names[selected] == "<unknown string>") {
                        setdvar(#"init_client_scene", str_scene);
                    } else if (names[selected] == "<unknown string>") {
                        setdvar(#"run_client_scene", str_scene);
                    } else {
                        setdvar(#"run_client_scene", str_scene + "<unknown string>" + names[selected]);
                    }
                }
                while (function_5c10bd79(0) buttonpressed("<unknown string>") || function_5c10bd79(0) buttonpressed("<unknown string>") || function_5c10bd79(0) buttonpressed("<unknown string>")) {
                    waitframe(1);
                }
                if (!b_shot_menu && isdefined(names[selected]) && names[selected] != "<unknown string>") {
                    level.scene_menu_shot_index = selected;
                    level thread display_scene_menu(str_type, names[selected]);
                }
            }
            waitframe(1);
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0xbae0a099, Offset: 0x17c8
    // Size: 0x84
    function function_c0f30783(s_scenedef) {
        if (!is_true(s_scenedef.var_241c5f3c) || is_true(s_scenedef.var_241c5f3c) && getdvarint(#"zm_debug_ee", 0)) {
            return 1;
        }
        return 0;
    }

    // Namespace scene/scene_debug_shared
    // Params 4, eflags: 0x0
    // Checksum 0x59dff16, Offset: 0x1858
    // Size: 0x4c
    function scene_list_settext(strings, n_selected, str_title, var_444abf97) {
        level thread _scene_list_settext(strings, n_selected, str_title, var_444abf97);
    }

    // Namespace scene/scene_debug_shared
    // Params 4, eflags: 0x0
    // Checksum 0x1eacb8b9, Offset: 0x18b0
    // Size: 0x374
    function _scene_list_settext(strings, n_selected, str_title, var_444abf97) {
        if (!isdefined(var_444abf97)) {
            var_444abf97 = 1;
        }
        debug2dtext((150, 325, 0), str_title, (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
        str_mode = tolower(getdvarstring(#"scene_menu_mode", "<unknown string>"));
        switch (str_mode) {
        case #"default":
            debug2dtext((150, 362.5, 0), "<unknown string>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        case #"loop":
            debug2dtext((150, 362.5, 0), "<unknown string>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        case #"capture_single":
            debug2dtext((150, 362.5, 0), "<unknown string>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        case #"capture_series":
            debug2dtext((150, 362.5, 0), "<unknown string>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        }
        for (i = 0; i < 16; i++) {
            index = i + n_selected - 5;
            if (isdefined(strings[index])) {
                text = strings[index];
            } else {
                text = "<unknown string>";
            }
            if (is_scene_playing(text)) {
                text += "<unknown string>";
                str_color = (0, 1, 0);
            } else if (is_scene_initialized(text)) {
                text += "<unknown string>";
                str_color = (0, 1, 0);
            } else {
                str_color = (1, 1, 1);
            }
            if (i == 5) {
                text = "<unknown string>" + text + "<unknown string>";
                str_color = (0.8, 0.4, 0);
            }
            debug2dtext((136, 400 + i * 25, 0), text, str_color, 1, (0, 0, 0), 1, 1, var_444abf97);
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x77132d43, Offset: 0x1c30
    // Size: 0x60
    function is_scene_playing(str_scene) {
        if (str_scene != "<unknown string>" && str_scene != "<unknown string>") {
            if (level flag::get(str_scene + "<unknown string>")) {
                return 1;
            }
        }
        return 0;
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0xe9ce064c, Offset: 0x1c98
    // Size: 0x60
    function is_scene_initialized(str_scene) {
        if (str_scene != "<unknown string>" && str_scene != "<unknown string>") {
            if (level flag::get(str_scene + "<unknown string>")) {
                return 1;
            }
        }
        return 0;
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x1a55eee8, Offset: 0x1d00
    // Size: 0x2c
    function test_init(arg1) {
        init(arg1, undefined, undefined, 1);
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x4e0ae75a, Offset: 0x1d38
    // Size: 0x19a
    function function_3bafd088(var_a572f325) {
        /#
            if (getdvarint(#"dvr_enable", 0) > 0 && getdvarint(#"scr_scene_dvr", 0) > 0) {
                if (!isdefined(var_a572f325)) {
                    var_a572f325 = spawnstruct();
                }
                var_a572f325.drawbig = getdvarint(#"hash_13d62f4d290ef671", 0);
                var_a572f325.var_2640d68e = getdvarint(#"scr_show_shot_info_for_igcs", 0);
                var_a572f325.drawfps = getdvarint(#"cg_drawfps", 1);
                level.var_a572f325 = var_a572f325;
                setdvar(#"hash_13d62f4d290ef671", 1);
                setdvar(#"scr_show_shot_info_for_igcs", 1);
                setdvar(#"cg_drawfps", 0);
                adddebugcommand(0, "<unknown string>");
                wait(1);
            }
        #/
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0xf307dfc1, Offset: 0x1ee0
    // Size: 0x174
    function function_d2785094(var_a572f325) {
        /#
            if (getdvarint(#"dvr_enable", 0) > 0 && getdvarint(#"scr_scene_dvr", 0) > 0) {
                drawbig = 0;
                var_2640d68e = 0;
                drawfps = 1;
                if (isdefined(var_a572f325)) {
                    if (isdefined(var_a572f325.drawbig)) {
                        drawbig = var_a572f325.drawbig;
                    }
                    if (isdefined(var_a572f325.var_2640d68e)) {
                        var_2640d68e = var_a572f325.var_2640d68e;
                    }
                    if (isdefined(var_a572f325.drawfps)) {
                        drawfps = var_a572f325.drawfps;
                    }
                }
                setdvar(#"hash_13d62f4d290ef671", drawbig);
                setdvar(#"scr_show_shot_info_for_igcs", var_2640d68e);
                setdvar(#"cg_drawfps", drawfps);
                adddebugcommand(0, "<unknown string>");
            }
        #/
    }

    // Namespace scene/scene_debug_shared
    // Params 3, eflags: 0x0
    // Checksum 0x7dd3d548, Offset: 0x2060
    // Size: 0xf4
    function test_play(arg1, arg2, str_mode) {
        if (!isdefined(level.var_a572f325)) {
            level.var_a572f325 = spawnstruct();
        }
        var_a572f325 = spawnstruct();
        var_a572f325.name = arg1;
        if (!isdefined(var_a572f325.name)) {
            var_a572f325.name = self.scriptbundlename;
        }
        if (!isdefined(var_a572f325.name)) {
            var_a572f325.name = "<unknown string>";
        }
        function_3bafd088(var_a572f325);
        play(arg1, arg2, undefined, 1, str_mode);
        function_d2785094(var_a572f325);
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x5a45af99, Offset: 0x2160
    // Size: 0x390
    function debug_display() {
        self endon(#"death");
        if (!is_true(self.debug_display) && self != level) {
            self.debug_display = 1;
            while (true) {
                level flag::wait_till("<unknown string>");
                debug_frames = randomintrange(5, 15);
                debug_time = debug_frames / 60;
                sphere(self.origin, 1, (0, 1, 1), 1, 1, 8, debug_frames);
                if (isdefined(self.scenes)) {
                    foreach (i, o_scene in self.scenes) {
                        n_offset = 15 * (i + 1);
                        print3d(self.origin - (0, 0, n_offset), o_scene._str_name, (0.8, 0.2, 0.8), 1, 0.3, debug_frames);
                        print3d(self.origin - (0, 0, n_offset + 5), "<unknown string>" + (isdefined([[ o_scene ]]->function_2ba44cd0()) ? "<unknown string>" + [[ o_scene ]]->function_2ba44cd0() : "<unknown string>") + "<unknown string>", (0.8, 0.2, 0.8), 1, 0.15, debug_frames);
                        print3d(self.origin - (0, 0, n_offset + 10), "<unknown string>" + (isdefined(function_12479eba(o_scene._str_name)) ? "<unknown string>" + function_12479eba(o_scene._str_name) : "<unknown string>") + "<unknown string>", (0.8, 0.2, 0.8), 1, 0.15, debug_frames);
                    }
                } else if (isdefined(self.scriptbundlename)) {
                    print3d(self.origin - (0, 0, 15), self.scriptbundlename, (0.8, 0.2, 0.8), 1, 0.3, debug_frames);
                } else {
                    self.debug_display = 0;
                    break;
                }
                wait(debug_time);
            }
        }
    }

#/
