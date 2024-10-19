// Atian COD Tools GSC CW decompiler test
#using script_dc59353021baee1;
#using script_42e02216167edefc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_95fdc800;

// Namespace namespace_95fdc800/namespace_95fdc800
// Params 1, eflags: 0x2 linked
// Checksum 0x9d28e1a9, Offset: 0x3c8
// Size: 0x9e8
function init(name) {
    if (!flag::exists("rg_generating")) {
        level flag::init("rg_generating", 0);
    } else {
        level flag::clear("rg_generating");
    }
    if (!flag::exists("rg_mapbuilding")) {
        level flag::init("rg_mapbuilding", 0);
    } else {
        level flag::clear("rg_mapbuilding");
    }
    level.var_e1daf6fe = [];
    level.var_86fb599e = [];
    level.var_55d5afa8 = [];
    level.var_55d5afa8[0] = "north";
    level.var_55d5afa8[1] = "east";
    level.var_55d5afa8[2] = "south";
    level.var_55d5afa8[3] = "west";
    if (isdefined(level.var_8efaa0c8)) {
        [[ level.var_8efaa0c8 ]](name);
        return;
    }
    level.var_e1daf6fe[0] = [];
    level.var_e1daf6fe[1] = array({#var_fef51edb:"room_1_exit_1024x1024", #orientation:3});
    level.var_e1daf6fe[2] = array({#var_fef51edb:"room_1_exit_1024x1024", #orientation:2});
    level.var_e1daf6fe[4] = array({#var_fef51edb:"room_1_exit_1024x1024", #orientation:1});
    level.var_e1daf6fe[8] = array({#var_fef51edb:"room_1_exit_1024x1024", #orientation:0});
    level.var_e1daf6fe[10] = array({#var_fef51edb:"room_2i_exit_1024x1024", #orientation:0});
    level.var_e1daf6fe[5] = array({#var_fef51edb:"room_2i_exit_1024x1024", #orientation:1});
    level.var_e1daf6fe[9] = array({#var_fef51edb:"room_2l_exit_1024x1024", #orientation:3});
    level.var_e1daf6fe[3] = array({#var_fef51edb:"room_2l_exit_1024x1024", #orientation:2});
    level.var_e1daf6fe[6] = array({#var_fef51edb:"room_2l_exit_1024x1024", #orientation:1});
    level.var_e1daf6fe[12] = array({#var_fef51edb:"room_2l_exit_1024x1024", #orientation:0});
    level.var_e1daf6fe[11] = array({#var_fef51edb:"room_3_exit_1024x1024", #orientation:3});
    level.var_e1daf6fe[7] = array({#var_fef51edb:"room_3_exit_1024x1024", #orientation:2});
    level.var_e1daf6fe[14] = array({#var_fef51edb:"room_3_exit_1024x1024", #orientation:1});
    level.var_e1daf6fe[13] = array({#var_fef51edb:"room_3_exit_1024x1024", #orientation:0});
    level.var_e1daf6fe[15] = array({#var_fef51edb:"room_4_exit_1024x1024", #orientation:0});
    level.var_86fb599e[0] = [];
    level.var_86fb599e[1] = array({#var_fef51edb:"hall_1_exit_1024x1024", #orientation:3});
    level.var_86fb599e[2] = array({#var_fef51edb:"hall_1_exit_1024x1024", #orientation:2});
    level.var_86fb599e[4] = array({#var_fef51edb:"hall_1_exit_1024x1024", #orientation:1});
    level.var_86fb599e[8] = array({#var_fef51edb:"hall_1_exit_1024x1024", #orientation:0});
    level.var_86fb599e[10] = array({#var_fef51edb:"hall_2i_exit_1024x1024", #orientation:0});
    level.var_86fb599e[5] = array({#var_fef51edb:"hall_2i_exit_1024x1024", #orientation:1});
    level.var_86fb599e[9] = array({#var_fef51edb:"hall_2l_exit_1024x1024", #orientation:3});
    level.var_86fb599e[3] = array({#var_fef51edb:"hall_2l_exit_1024x1024", #orientation:2});
    level.var_86fb599e[6] = array({#var_fef51edb:"hall_2l_exit_1024x1024", #orientation:1});
    level.var_86fb599e[12] = array({#var_fef51edb:"hall_2l_exit_1024x1024", #orientation:0});
    level.var_86fb599e[11] = array({#var_fef51edb:"hall_3_exit_1024x1024", #orientation:3});
    level.var_86fb599e[7] = array({#var_fef51edb:"hall_3_exit_1024x1024", #orientation:2});
    level.var_86fb599e[14] = array({#var_fef51edb:"hall_3_exit_1024x1024", #orientation:1});
    level.var_86fb599e[13] = array({#var_fef51edb:"hall_3_exit_1024x1024", #orientation:0});
    level.var_86fb599e[15] = array({#var_fef51edb:"hall_4_exit_1024x1024", #orientation:0});
}

// Namespace namespace_95fdc800/namespace_95fdc800
// Params 3, eflags: 0x6 linked
// Checksum 0x7343842b, Offset: 0xdb8
// Size: 0xa4
function private function_3be17ddc(exits, var_4e8e65e4, north) {
    north = isdefined(north) ? north : 0;
    var_4e8e65e4 = isdefined(var_4e8e65e4) ? var_4e8e65e4 : 2;
    if (var_4e8e65e4 == 2) {
        return namespace_21dd166c::function_b5f93b3b(level.var_86fb599e[exits]);
    }
    return namespace_21dd166c::function_b5f93b3b(level.var_e1daf6fe[exits]);
}

// Namespace namespace_95fdc800/namespace_95fdc800
// Params 0, eflags: 0x2 linked
// Checksum 0xa35d848f, Offset: 0xe68
// Size: 0x264
function function_9ab6c6c6() {
    self notify("4254f56e0f4d90df");
    self endon("4254f56e0f4d90df");
    level notify(#"hash_186e943c1cd0db52");
    level flag::set("rg_mapbuilding");
    function_f4b7f348("level_generation issuing REROLL NOTIFICATION");
    namespace_f27a9d0d::cleanup();
    function_f4b7f348("level_generation cleanup called and finished.");
    namespace_21dd166c::function_c083433f();
    function_f4b7f348("level_generation generate_level called and finished.");
    if (!getdvarint(#"hash_55c78475b1ebf3de", 1)) {
        while (flag::get("rg_generating")) {
            waitframe(1);
        }
        level thread function_fd269801(level.var_1c96bbc);
    } else {
        function_fd269801(level.var_1c96bbc);
    }
    if (!getdvarint(#"hash_55c78475b1ebf3de", 1)) {
        level waittill(#"hash_766491787f94a437");
        level thread namespace_f27a9d0d::function_b3f5992c();
        function_f4b7f348("level_generation connect_all_rooms called and finished.");
        level waittill(#"hash_2afb084294b9f124");
    } else {
        namespace_f27a9d0d::function_b3f5992c();
    }
    namespace_f27a9d0d::function_612d8b4e();
    function_f4b7f348("level_generation calculate_door_depths called and finished.");
    if (isdefined(level.var_3dd67d2d)) {
        [[ level.var_3dd67d2d ]]();
        function_f4b7f348("level_generation rg_postLevelGen_CB called and finished.");
    }
    level flag::clear("rg_mapbuilding");
}

// Namespace namespace_95fdc800/namespace_95fdc800
// Params 3, eflags: 0x6 linked
// Checksum 0xa83a80fe, Offset: 0x10d8
// Size: 0xe8
function private function_968ec9e9(parent, child, var_cbb28d5) {
    var_ea4696e7 = 0;
    if (child.col > parent.col) {
        var_ea4696e7 = 1;
    } else if (child.col < parent.col) {
        var_ea4696e7 = 3;
    } else if (child.row < parent.row) {
        var_ea4696e7 = 0;
    } else if (child.row > parent.row) {
        var_ea4696e7 = 2;
    }
    direction = var_ea4696e7 - var_cbb28d5.orientation;
    if (direction < 0) {
        direction += 4;
    }
    return level.var_55d5afa8[direction];
}

// Namespace namespace_95fdc800/namespace_95fdc800
// Params 3, eflags: 0x6 linked
// Checksum 0x45313bdb, Offset: 0x11c8
// Size: 0xe4
function private function_5a8d487e(parent, child, var_ea1e2708) {
    var_89d5b354 = 0;
    if (child.col > parent.col) {
        var_89d5b354 = 3;
    } else if (child.col < parent.col) {
        var_89d5b354 = 1;
    } else if (child.row < parent.row) {
        var_89d5b354 = 2;
    } else if (child.row > parent.row) {
        var_89d5b354 = 0;
    }
    direction = var_89d5b354 - var_ea1e2708.orientation;
    if (direction < 0) {
        direction += 4;
    }
    return level.var_55d5afa8[direction];
}

// Namespace namespace_95fdc800/namespace_95fdc800
// Params 3, eflags: 0x6 linked
// Checksum 0x75247cca, Offset: 0x12b8
// Size: 0x44
function private create_door(var_565c3878, var_7d4204c7, cost) {
    if (isdefined(level.var_e1a08718)) {
        return [[ level.var_e1a08718 ]](var_565c3878, var_7d4204c7, cost);
    }
}

// Namespace namespace_95fdc800/namespace_95fdc800
// Params 1, eflags: 0x6 linked
// Checksum 0xe7e5a975, Offset: 0x1308
// Size: 0x660
function private function_fd269801(var_ac850bbc) {
    self notify("526c8abbf88d0ad2");
    self endon("526c8abbf88d0ad2");
    level endon(#"hash_186e943c1cd0db52", #"hash_521118da55424987");
    center = var_ac850bbc.center;
    var_65e05a9d = [];
    array::push_front(var_65e05a9d, center);
    while (var_65e05a9d.size > 0) {
        cur = array::pop(var_65e05a9d);
        var_cbb28d5 = function_3be17ddc(cur.exits, cur.var_4e8e65e4, 0);
        foreach (child in cur.children) {
            var_c3031858 = function_3be17ddc(child.exits, child.var_4e8e65e4, 0);
            if (child.height == 1) {
                var_c3031858 = function_3be17ddc(child.exits, 2, 0);
                child.room = namespace_f27a9d0d::function_eaad15e2(level.var_49329074, var_c3031858.var_fef51edb, function_5a8d487e(cur, child, var_c3031858));
                child.room.var_dbb4ff9a = level.var_49329074;
                level.var_ee250665 = child.room;
            } else {
                attach_tag = cur.room namespace_f27a9d0d::function_5165998("id", function_968ec9e9(cur, child, var_cbb28d5));
                child.room = namespace_f27a9d0d::function_eaad15e2(attach_tag, var_c3031858.var_fef51edb, function_5a8d487e(cur, child, var_c3031858));
                child.room.var_dbb4ff9a = attach_tag;
            }
            child.room.depth = child.height;
            child.room.var_6ee556b5 = cur.room;
            array::push_front(var_65e05a9d, child);
            if (!getdvarint(#"hash_55c78475b1ebf3de", 1)) {
                waitframe(1);
            }
        }
    }
    if (isdefined(var_ac850bbc.var_4ca9cc3e)) {
        foreach (edge in var_ac850bbc.var_4ca9cc3e) {
            if (edge.row == center.row - 1 && edge.col == center.row && (edge.dir == 2 || edge.dir == 8)) {
                continue;
            }
            start = var_ac850bbc.grid[edge.row][edge.col];
            if (edge.dir == 8 || edge.dir == 2) {
                end = var_ac850bbc.grid[edge.row + 1][edge.col];
            } else {
                end = var_ac850bbc.grid[edge.row][edge.col + 1];
            }
            var_cbb28d5 = function_3be17ddc(start.exits, start.var_4e8e65e4, 0);
            var_ea1e2708 = function_3be17ddc(end.exits, end.var_4e8e65e4, 0);
            var_724a93b6 = function_968ec9e9(start, end, var_cbb28d5);
            if (isdefined(var_724a93b6) && isdefined(start.room)) {
                var_565c3878 = start.room namespace_f27a9d0d::function_5165998("id", var_724a93b6);
            }
            var_1ac37224 = function_5a8d487e(start, end, var_ea1e2708);
            if (isdefined(var_1ac37224) && isdefined(end.room)) {
                var_7d4204c7 = end.room namespace_f27a9d0d::function_5165998("id", var_1ac37224);
            }
            if (isdefined(var_565c3878) && isdefined(var_7d4204c7)) {
                create_door(var_565c3878, var_7d4204c7, 250);
            }
            if (!getdvarint(#"hash_55c78475b1ebf3de", 1)) {
                waitframe(1);
            }
        }
    }
    waitframe(1);
    level notify(#"hash_766491787f94a437");
}

// Namespace namespace_95fdc800/namespace_95fdc800
// Params 0, eflags: 0x2 linked
// Checksum 0xcc653678, Offset: 0x1970
// Size: 0x24
function function_d6e32b1b() {
    setdvar(#"hash_55c78475b1ebf3de", 0);
}

// Namespace namespace_95fdc800/namespace_95fdc800
// Params 1, eflags: 0x2 linked
// Checksum 0x3b54a465, Offset: 0x19a0
// Size: 0xa0
function function_1bce4bde(name) {
    assert(isdefined(name), "<unknown string>");
    function_f4b7f348("Generating Map:" + name);
    startloc = namespace_f27a9d0d::init(name);
    init(name);
    level thread function_9ab6c6c6();
    return startloc;
}

// Namespace namespace_95fdc800/namespace_95fdc800
// Params 0, eflags: 0x2 linked
// Checksum 0xb027c619, Offset: 0x1a48
// Size: 0xf8
function function_b1989480() {
    function_f4b7f348("Destroying Map");
    while (level flag::get("rg_mapbuilding")) {
        function_f4b7f348("Destroying Map -- stalled");
        waitframe(1);
    }
    if (!getdvarint(#"hash_55c78475b1ebf3de", 1)) {
        level thread namespace_f27a9d0d::cleanup();
        level waittill(#"hash_83fa90e9e007988");
    } else {
        namespace_f27a9d0d::cleanup();
    }
    function_f4b7f348("Destroying Map - DONE!");
    level notify(#"hash_29a1cf6b91759f63");
}

// Namespace namespace_95fdc800/namespace_95fdc800
// Params 1, eflags: 0x2 linked
// Checksum 0x592c4e28, Offset: 0x1b48
// Size: 0x34
function function_f4b7f348(text) {
    println("<unknown string>" + text);
}

