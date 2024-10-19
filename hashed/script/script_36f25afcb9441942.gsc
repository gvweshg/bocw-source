// Atian COD Tools GSC CW decompiler test
#using script_31b23f5316d1b26d;
#using script_18bc13f07baf161a;
#using script_76abb7986de59601;
#using script_67049b48b589d81;
#using script_64e5d3ad71ce8140;
#using script_6b71c9befed901f2;
#using script_75c3996cce8959f7;
#using script_71603a58e2da0698;
#using script_30c7fb449869910;
#using script_771f5bff431d8d57;
#using script_42cbbdcd1e160063;
#using script_3314b730521b9666;
#using script_77163d5a569e2071;
#using script_38635d174016f682;
#using script_18910f59cc847b42;
#using script_4fc0ca879f81e0dc;
#using script_24879e3929b5b5e9;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_c004634e;

// Namespace namespace_c004634e/namespace_c004634e
// Params 0, eflags: 0x2 linked
// Checksum 0xd24b6a11, Offset: 0x5c0
// Size: 0xda
function init() {
    level.var_e1a08718 = &function_1210f64b;
    level.var_21910540 = &function_1648f5a1;
    level.var_8efaa0c8 = &function_a4c07e18;
    level.var_84c76431 = &function_d5a0313a;
    level.doa.var_e4d7094b = [];
    level.doa.var_4cdaff39 = [];
    level.doa.var_830f8412 = [];
    level.doa.var_fa21a3aa = 0;
    level.doa.var_f23e2931 = 0;
    level.doa.var_f5f2b4e8 = 0;
}

// Namespace namespace_c004634e/namespace_c004634e
// Params 1, eflags: 0x2 linked
// Checksum 0x665eb532, Offset: 0x6a8
// Size: 0x5a
function function_4e886036(room) {
    if (isdefined(level.doa.var_e4d7094b[room.template.rg_room])) {
        return level.doa.var_e4d7094b[room.template.rg_room];
    }
}

// Namespace namespace_c004634e/namespace_c004634e
// Params 2, eflags: 0x2 linked
// Checksum 0x9048bb4f, Offset: 0x710
// Size: 0x134
function function_4f9f7687(roomname, iconname) {
    if (!isinarray(level.doa.var_830f8412, roomname)) {
        if (!isdefined(level.doa.var_830f8412)) {
            level.doa.var_830f8412 = [];
        } else if (!isarray(level.doa.var_830f8412)) {
            level.doa.var_830f8412 = array(level.doa.var_830f8412);
        }
        level.doa.var_830f8412[level.doa.var_830f8412.size] = roomname;
        level.doa.var_4cdaff39[roomname] = 0;
        level.doa.var_e4d7094b[roomname] = iconname;
    }
    namespace_f27a9d0d::function_2ff463e2(roomname);
}

// Namespace namespace_c004634e/namespace_c004634e
// Params 1, eflags: 0x2 linked
// Checksum 0x139acc18, Offset: 0x850
// Size: 0x47c
function function_1648f5a1(name = "") {
    switch (name) {
    case #"jungle_1_dungeon4":
        function_4f9f7687("hall_dirt_2iflogger_exit_1024x1024", "doa_hud_icon_dungeon_hall_straight");
        function_4f9f7687("room_2b_exit_1024x1024", "doa_hud_icon_dungeon_room_octagon");
        function_4f9f7687("room_5_exit_1024x1024", "doa_hud_icon_dungeon_room_octagon");
    case #"cellar":
        function_4f9f7687("room_1_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
        function_4f9f7687("room_2i_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
        function_4f9f7687("room_3_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
        function_4f9f7687("room_4_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
        function_4f9f7687("hall_dirt_2_exit_ver1_1024x1024", "doa_hud_icon_dungeon_hall_straight");
        function_4f9f7687("hall_dirt_2_exit_ver2_1024x1024", "doa_hud_icon_dungeon_hall_straight");
        function_4f9f7687("hall_dirt_2l_exit_ver1_1024x1024", "doa_hud_icon_dungeon_hall_right_angle");
        function_4f9f7687("hall_dirt_2l_exit_ver2_1024x1024", "doa_hud_icon_dungeon_hall_right_angle");
        function_4f9f7687("hall_dirt_3_exit_ver1_1024x1024", "doa_hud_icon_dungeon_hall_inverse_t");
        function_4f9f7687("hall_dirt_4_exit_ver1_1024x1024", "doa_hud_icon_dungeon_hall_plus");
        break;
    default:
        function_4f9f7687("room_1_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
        function_4f9f7687("room_1b_exit_1024x1024", "doa_hud_icon_dungeon_room_1b");
        function_4f9f7687("room_2b_exit_1024x1024", "doa_hud_icon_dungeon_room_octagon");
        function_4f9f7687("room_2i_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
        function_4f9f7687("room_2l_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
        function_4f9f7687("room_3_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
        function_4f9f7687("room_3b_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
        function_4f9f7687("room_4_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
        function_4f9f7687("room_5_exit_1024x1024", "doa_hud_icon_dungeon_room_octagon");
        function_4f9f7687("hall_2i_exit_1024x1024", "doa_hud_icon_dungeon_hall_straight");
        function_4f9f7687("hall_2ii_exit_1024x1024", "doa_hud_icon_dungeon_hall_2ii");
        function_4f9f7687("hall_2ilava_exit_1024x1024", "doa_hud_icon_dungeon_hall_straight");
        function_4f9f7687("hall_2iflogger_exit_1024x1024", "doa_hud_icon_dungeon_hall_straight");
        function_4f9f7687("hall_2l_exit_1024x1024", "doa_hud_icon_dungeon_hall_right_angle");
        function_4f9f7687("hall_3_exit_1024x1024", "doa_hud_icon_dungeon_hall_inverse_t");
        function_4f9f7687("hall_3b_exit_1024x1024", "doa_hud_icon_dungeon_room_square");
        function_4f9f7687("hall_4_exit_1024x1024", "doa_hud_icon_dungeon_hall_plus");
        function_4f9f7687("hall_4l_exit_1024x1024", "doa_hud_icon_dungeon_hall_diamond");
        break;
    }
    function_ed9ae881(name);
    function_18276de3(name);
}

// Namespace namespace_c004634e/namespace_c004634e
// Params 1, eflags: 0x2 linked
// Checksum 0x9fa43435, Offset: 0xcd8
// Size: 0xcd0
function function_1a3f9fe1(expanded) {
    level.var_e1daf6fe[0] = [];
    level.var_e1daf6fe[1] = array({#var_fef51edb:"room_1_exit_1024x1024", #orientation:3});
    level.var_e1daf6fe[2] = array({#var_fef51edb:"room_1_exit_1024x1024", #orientation:2});
    level.var_e1daf6fe[4] = array({#var_fef51edb:"room_1_exit_1024x1024", #orientation:1});
    level.var_e1daf6fe[8] = array({#var_fef51edb:"room_1_exit_1024x1024", #orientation:0});
    if (is_true(expanded)) {
        level.var_e1daf6fe[10] = array({#var_fef51edb:"room_2i_exit_1024x1024", #orientation:0}, {#var_fef51edb:"room_2b_exit_1024x1024", #orientation:0});
        level.var_e1daf6fe[5] = array({#var_fef51edb:"room_2i_exit_1024x1024", #orientation:1}, {#var_fef51edb:"room_2b_exit_1024x1024", #orientation:1});
    } else {
        level.var_e1daf6fe[10] = array({#var_fef51edb:"room_2i_exit_1024x1024", #orientation:0});
        level.var_e1daf6fe[5] = array({#var_fef51edb:"room_2i_exit_1024x1024", #orientation:1});
    }
    level.var_e1daf6fe[9] = array({#var_fef51edb:"hall_dirt_2l_exit_ver1_1024x1024", #orientation:3});
    level.var_e1daf6fe[3] = array({#var_fef51edb:"hall_dirt_2l_exit_ver1_1024x1024", #orientation:2});
    level.var_e1daf6fe[6] = array({#var_fef51edb:"hall_dirt_2l_exit_ver2_1024x1024", #orientation:1});
    level.var_e1daf6fe[12] = array({#var_fef51edb:"hall_dirt_2l_exit_ver2_1024x1024", #orientation:0});
    level.var_e1daf6fe[11] = array({#var_fef51edb:"room_3_exit_1024x1024", #orientation:3});
    level.var_e1daf6fe[7] = array({#var_fef51edb:"room_3_exit_1024x1024", #orientation:2});
    level.var_e1daf6fe[14] = array({#var_fef51edb:"room_3_exit_1024x1024", #orientation:1});
    level.var_e1daf6fe[13] = array({#var_fef51edb:"room_3_exit_1024x1024", #orientation:0});
    if (is_true(expanded)) {
        level.var_e1daf6fe[15] = array({#var_fef51edb:"room_4_exit_1024x1024", #orientation:0}, {#var_fef51edb:"room_5_exit_1024x1024", #orientation:0}, {#var_fef51edb:"room_5_exit_1024x1024", #orientation:0});
    } else {
        level.var_e1daf6fe[15] = array({#var_fef51edb:"room_4_exit_1024x1024", #orientation:0});
    }
    level.var_86fb599e[0] = [];
    level.var_86fb599e[1] = array({#var_fef51edb:"hall_1_exit_1024x1024", #orientation:3});
    level.var_86fb599e[2] = array({#var_fef51edb:"hall_1_exit_1024x1024", #orientation:2});
    level.var_86fb599e[4] = array({#var_fef51edb:"hall_1_exit_1024x1024", #orientation:1});
    level.var_86fb599e[8] = array({#var_fef51edb:"hall_1_exit_1024x1024", #orientation:0});
    if (is_true(expanded)) {
        level.var_86fb599e[10] = array({#var_fef51edb:"hall_dirt_2_exit_ver1_1024x1024", #orientation:0}, {#var_fef51edb:"hall_dirt_2_exit_ver2_1024x1024", #orientation:0}, {#var_fef51edb:"hall_dirt_2iflogger_exit_1024x1024", #orientation:0});
        level.var_86fb599e[5] = array({#var_fef51edb:"hall_dirt_2_exit_ver1_1024x1024", #orientation:1}, {#var_fef51edb:"hall_dirt_2_exit_ver2_1024x1024", #orientation:1}, {#var_fef51edb:"hall_dirt_2iflogger_exit_1024x1024", #orientation:1});
    } else {
        level.var_86fb599e[10] = array({#var_fef51edb:"hall_dirt_2_exit_ver1_1024x1024", #orientation:0}, {#var_fef51edb:"hall_dirt_2_exit_ver2_1024x1024", #orientation:0});
        level.var_86fb599e[5] = array({#var_fef51edb:"hall_dirt_2_exit_ver1_1024x1024", #orientation:1}, {#var_fef51edb:"hall_dirt_2_exit_ver2_1024x1024", #orientation:1});
    }
    level.var_86fb599e[9] = array({#var_fef51edb:"hall_dirt_2l_exit_ver1_1024x1024", #orientation:3}, {#var_fef51edb:"hall_dirt_2l_exit_ver2_1024x1024", #orientation:3});
    level.var_86fb599e[3] = array({#var_fef51edb:"hall_dirt_2l_exit_ver1_1024x1024", #orientation:2}, {#var_fef51edb:"hall_dirt_2l_exit_ver2_1024x1024", #orientation:2});
    level.var_86fb599e[6] = array({#var_fef51edb:"hall_dirt_2l_exit_ver1_1024x1024", #orientation:1}, {#var_fef51edb:"hall_dirt_2l_exit_ver2_1024x1024", #orientation:1});
    level.var_86fb599e[12] = array({#var_fef51edb:"hall_dirt_2l_exit_ver1_1024x1024", #orientation:0}, {#var_fef51edb:"hall_dirt_2l_exit_ver2_1024x1024", #orientation:0});
    level.var_86fb599e[11] = array({#var_fef51edb:"hall_dirt_3_exit_ver1_1024x1024", #orientation:3});
    level.var_86fb599e[7] = array({#var_fef51edb:"hall_dirt_3_exit_ver1_1024x1024", #orientation:2});
    level.var_86fb599e[14] = array({#var_fef51edb:"hall_dirt_3_exit_ver1_1024x1024", #orientation:1});
    level.var_86fb599e[13] = array({#var_fef51edb:"hall_dirt_3_exit_ver1_1024x1024", #orientation:0});
    level.var_86fb599e[15] = array({#var_fef51edb:"hall_dirt_4_exit_ver1_1024x1024", #orientation:0});
}

// Namespace namespace_c004634e/namespace_c004634e
// Params 0, eflags: 0x2 linked
// Checksum 0xe68f30c3, Offset: 0x19b0
// Size: 0xd10
function function_9df20e11() {
    level.var_e1daf6fe[0] = [];
    level.var_e1daf6fe[1] = array({#var_fef51edb:"room_1_exit_1024x1024", #orientation:3}, {#var_fef51edb:"room_1b_exit_1024x1024", #orientation:3});
    level.var_e1daf6fe[2] = array({#var_fef51edb:"room_1_exit_1024x1024", #orientation:2}, {#var_fef51edb:"room_1b_exit_1024x1024", #orientation:2});
    level.var_e1daf6fe[4] = array({#var_fef51edb:"room_1_exit_1024x1024", #orientation:1}, {#var_fef51edb:"room_1b_exit_1024x1024", #orientation:1});
    level.var_e1daf6fe[8] = array({#var_fef51edb:"room_1_exit_1024x1024", #orientation:0}, {#var_fef51edb:"room_1b_exit_1024x1024", #orientation:0});
    level.var_e1daf6fe[10] = array({#var_fef51edb:"room_2i_exit_1024x1024", #orientation:0}, {#var_fef51edb:"room_2b_exit_1024x1024", #orientation:0});
    level.var_e1daf6fe[5] = array({#var_fef51edb:"room_2i_exit_1024x1024", #orientation:1}, {#var_fef51edb:"room_2b_exit_1024x1024", #orientation:1});
    level.var_e1daf6fe[9] = array({#var_fef51edb:"room_2l_exit_1024x1024", #orientation:3});
    level.var_e1daf6fe[3] = array({#var_fef51edb:"room_2l_exit_1024x1024", #orientation:2});
    level.var_e1daf6fe[6] = array({#var_fef51edb:"room_2l_exit_1024x1024", #orientation:1});
    level.var_e1daf6fe[12] = array({#var_fef51edb:"room_2l_exit_1024x1024", #orientation:0});
    level.var_e1daf6fe[11] = array({#var_fef51edb:"room_3_exit_1024x1024", #orientation:3}, {#var_fef51edb:"room_3b_exit_1024x1024", #orientation:3});
    level.var_e1daf6fe[7] = array({#var_fef51edb:"room_3_exit_1024x1024", #orientation:2}, {#var_fef51edb:"room_3b_exit_1024x1024", #orientation:2});
    level.var_e1daf6fe[14] = array({#var_fef51edb:"room_3_exit_1024x1024", #orientation:1});
    level.var_e1daf6fe[13] = array({#var_fef51edb:"room_3_exit_1024x1024", #orientation:0});
    level.var_e1daf6fe[15] = array({#var_fef51edb:"room_4_exit_1024x1024", #orientation:0}, {#var_fef51edb:"room_5_exit_1024x1024", #orientation:0}, {#var_fef51edb:"room_5_exit_1024x1024", #orientation:0});
    level.var_86fb599e[0] = [];
    level.var_86fb599e[1] = array({#var_fef51edb:"hall_1_exit_1024x1024", #orientation:3});
    level.var_86fb599e[2] = array({#var_fef51edb:"hall_1_exit_1024x1024", #orientation:2});
    level.var_86fb599e[4] = array({#var_fef51edb:"hall_1_exit_1024x1024", #orientation:1});
    level.var_86fb599e[8] = array({#var_fef51edb:"hall_1_exit_1024x1024", #orientation:0});
    level.var_86fb599e[10] = array({#var_fef51edb:"hall_2i_exit_1024x1024", #orientation:0}, {#var_fef51edb:"hall_2ii_exit_1024x1024", #orientation:0}, {#var_fef51edb:"hall_2ilava_exit_1024x1024", #orientation:0}, {#var_fef51edb:"hall_2iflogger_exit_1024x1024", #orientation:0});
    level.var_86fb599e[5] = array({#var_fef51edb:"hall_2i_exit_1024x1024", #orientation:1}, {#var_fef51edb:"hall_2ii_exit_1024x1024", #orientation:1}, {#var_fef51edb:"hall_2ilava_exit_1024x1024", #orientation:1}, {#var_fef51edb:"hall_2iflogger_exit_1024x1024", #orientation:1});
    level.var_86fb599e[9] = array({#var_fef51edb:"hall_2l_exit_1024x1024", #orientation:3});
    level.var_86fb599e[3] = array({#var_fef51edb:"hall_2l_exit_1024x1024", #orientation:2});
    level.var_86fb599e[6] = array({#var_fef51edb:"hall_2l_exit_1024x1024", #orientation:1});
    level.var_86fb599e[12] = array({#var_fef51edb:"hall_2l_exit_1024x1024", #orientation:0});
    level.var_86fb599e[11] = array({#var_fef51edb:"hall_3_exit_1024x1024", #orientation:3});
    level.var_86fb599e[7] = array({#var_fef51edb:"hall_3_exit_1024x1024", #orientation:2}, {#var_fef51edb:"hall_3b_exit_1024x1024", #orientation:2});
    level.var_86fb599e[14] = array({#var_fef51edb:"hall_3_exit_1024x1024", #orientation:1});
    level.var_86fb599e[13] = array({#var_fef51edb:"hall_3_exit_1024x1024", #orientation:0}, {#var_fef51edb:"hall_3b_exit_1024x1024", #orientation:0});
    level.var_86fb599e[15] = array({#var_fef51edb:"hall_4_exit_1024x1024", #orientation:0}, {#var_fef51edb:"hall_4l_exit_1024x1024", #orientation:0});
    /#
        if (getdvarint(#"hash_2bd21c5b8722178d", 0)) {
            level.var_e1daf6fe[15] = array({#var_fef51edb:"<unknown string>", #orientation:0}, {#var_fef51edb:"<unknown string>", #orientation:0}, {#var_fef51edb:"<unknown string>", #orientation:0});
            level.var_86fb599e[15] = array({#var_fef51edb:"<unknown string>", #orientation:0}, {#var_fef51edb:"<unknown string>", #orientation:0});
        }
    #/
}

// Namespace namespace_c004634e/namespace_c004634e
// Params 1, eflags: 0x2 linked
// Checksum 0xf36acda0, Offset: 0x26c8
// Size: 0x1e2
function function_a4c07e18(name) {
    playercount = getplayers(0).size;
    gridsize = math::clamp(3 + playercount, 4, 6);
    var_5d3143fb = math::clamp(7 + playercount, 8, 12);
    switch (name) {
    case #"jungle_1_dungeon4":
        setdvar(#"hash_4c2ff1f11662c879", var_5d3143fb);
        setdvar(#"hash_788fb3bfb03132f", gridsize);
        function_1a3f9fe1(1);
        break;
    case #"cellar":
        setdvar(#"hash_4c2ff1f11662c879", var_5d3143fb);
        setdvar(#"hash_788fb3bfb03132f", gridsize);
        function_1a3f9fe1();
        break;
    default:
        setdvar(#"hash_4c2ff1f11662c879", var_5d3143fb);
        setdvar(#"hash_788fb3bfb03132f", gridsize);
        function_9df20e11();
        break;
    }
}

// Namespace namespace_c004634e/namespace_c004634e
// Params 3, eflags: 0x2 linked
// Checksum 0xac874b5b, Offset: 0x28b8
// Size: 0x1e
function function_1210f64b(*unused1, *var_5ddf2027, *var_26f1324c) {
    return undefined;
}

// Namespace namespace_c004634e/namespace_c004634e
// Params 1, eflags: 0x2 linked
// Checksum 0x39d84b64, Offset: 0x28e0
// Size: 0xa2a
function function_18276de3(name = "") {
    level.doa.var_3d1f118d = [];
    level.doa.var_3d1f118d[#"wall"] = [];
    level.doa.var_3d1f118d[#"floor"] = [];
    switch (name) {
    default:
        level.doa.var_3d1f118d[#"wall"][#"torch"][0] = {#model:#"hash_4806b879eea49e81", #yaw_offset:0, #scale:1, #weight:1, #fx:"fx_fire_torch_wall_lit_castle"};
        level.doa.var_3d1f118d[#"wall"][#"hash_2ec1ad0b894eb316"][0] = {#model:#"hash_291984c5c2b4716d", #yaw_offset:-90, #scale:1, #weight:1};
        level.doa.var_3d1f118d[#"wall"][#"hash_2ec1ad0b894eb316"][1] = {#model:#"hash_291981c5c2b46c54", #yaw_offset:180, #scale:1, #weight:1};
        level.doa.var_3d1f118d[#"wall"][#"hash_2ec1ad0b894eb316"][2] = {#model:#"hash_291982c5c2b46e07", #yaw_offset:0, #scale:1, #weight:1};
        level.doa.var_3d1f118d[#"wall"][#"hash_2ec1ad0b894eb316"][3] = {#model:#"hash_29197fc5c2b468ee", #yaw_offset:180, #scale:1, #weight:1};
        level.doa.var_3d1f118d[#"wall"][#"hash_2ec1ad0b894eb316"][4] = {#model:#"hash_7e0ee4cd301b70f8", #yaw_offset:0, #scale:3, #weight:1};
        level.doa.var_3d1f118d[#"floor"][#"statue"][0] = {#model:#"hash_106e3aed469dc9f5", #yaw_offset:0, #scale:1, #weight:1};
        level.doa.var_3d1f118d[#"floor"][#"statue"][1] = {#model:#"hash_67f8ff9ec7481763", #yaw_offset:0, #scale:1, #weight:1};
        level.doa.var_3d1f118d[#"floor"][#"statue"][2] = {#model:#"hash_67f9009ec7481916", #yaw_offset:0, #scale:1, #weight:1};
        level.doa.var_3d1f118d[#"floor"][#"statue"][3] = {#model:#"hash_67f9019ec7481ac9", #yaw_offset:0, #scale:1, #weight:1};
        level.doa.var_3d1f118d[#"floor"][#"statue"][4] = {#model:#"hash_67f9029ec7481c7c", #yaw_offset:0, #scale:1, #weight:1};
        level.doa.var_3d1f118d[#"floor"][#"statue"][5] = {#model:#"hash_3ad7387f79b2429", #yaw_offset:0, #scale:1, #weight:1};
        level.doa.var_3d1f118d[#"floor"][#"statue"][6] = {#model:#"hash_7bf1c070b436e893", #yaw_offset:0, #scale:1, #weight:1};
        level.doa.var_3d1f118d[#"floor"][#"statue"][7] = {#model:#"hash_7bc2d470b40f99cd", #yaw_offset:0, #scale:1, #weight:1};
        level.doa.var_3d1f118d[#"floor"][#"statue"][8] = {#model:#"hash_3c37b2ed858227aa", #yaw_offset:0, #scale:1, #weight:1};
        level.doa.var_3d1f118d[#"floor"][#"statue"][9] = {#model:#"hash_22d4a79eb4682aaf", #yaw_offset:90, #scale:0.6, #weight:1};
        break;
    }
}

// Namespace namespace_c004634e/namespace_c004634e
// Params 1, eflags: 0x2 linked
// Checksum 0x4bfe624f, Offset: 0x3318
// Size: 0x82
function function_ed9ae881(name) {
    switch (name) {
    case #"jungle_1_dungeon4":
    case #"cellar":
        level.var_84c76431 = &function_9a834e27;
        break;
    default:
        level.var_84c76431 = &function_d5a0313a;
        break;
    }
}

// Namespace namespace_c004634e/namespace_c004634e
// Params 0, eflags: 0x2 linked
// Checksum 0x40ceb817, Offset: 0x33a8
// Size: 0x22
function function_9a834e27() {
    var_1b8ba6f5 = function_d5a0313a();
    return var_1b8ba6f5;
}

// Namespace namespace_c004634e/namespace_c004634e
// Params 0, eflags: 0x2 linked
// Checksum 0xd00e7a7, Offset: 0x33d8
// Size: 0x10e
function function_d5a0313a() {
    var_1b8ba6f5 = [];
    var_1b8ba6f5[0] = 1e-05;
    var_1b8ba6f5[1] = 0.001;
    var_1b8ba6f5[2] = 0.001;
    var_1b8ba6f5[3] = 1;
    var_1b8ba6f5[4] = 0.001;
    var_1b8ba6f5[5] = 1;
    var_1b8ba6f5[6] = 1;
    var_1b8ba6f5[7] = 0.5;
    var_1b8ba6f5[8] = 0.001;
    var_1b8ba6f5[9] = 1;
    var_1b8ba6f5[10] = 1;
    var_1b8ba6f5[11] = 0.5;
    var_1b8ba6f5[12] = 1;
    var_1b8ba6f5[13] = 0.5;
    var_1b8ba6f5[14] = 0.5;
    var_1b8ba6f5[15] = 1;
    return var_1b8ba6f5;
}

// Namespace namespace_c004634e/namespace_c004634e
// Params 2, eflags: 0x2 linked
// Checksum 0xe3a4e3ca, Offset: 0x34f0
// Size: 0xf6
function function_1f81f464(type, subtype) {
    if (isdefined(level.doa.var_3d1f118d[type])) {
        if (!isdefined(subtype)) {
            subtype = function_d59c2d03(level.doa.var_3d1f118d[type].size);
        } else {
            subtype = hash(subtype);
        }
        if (isdefined(level.doa.var_3d1f118d[type][subtype])) {
            var_71b4f6c7 = function_d59c2d03(level.doa.var_3d1f118d[type][subtype].size);
            return level.doa.var_3d1f118d[type][subtype][var_71b4f6c7];
        }
    }
}

// Namespace namespace_c004634e/namespace_c004634e
// Params 2, eflags: 0x2 linked
// Checksum 0x6f4d6b2a, Offset: 0x35f0
// Size: 0x1d0
function function_6a09928b(location, type) {
    if (isdefined(location.script_parameters)) {
        modelname = location.script_parameters;
    } else {
        modelinfo = function_1f81f464(type, location.script_noteworthy);
        modelname = modelinfo.model;
    }
    model = undefined;
    if (isdefined(modelname)) {
        /#
            namespace_1e25ad94::debugmsg("<unknown string>" + function_9e72a96(type) + "<unknown string>" + modelname + "<unknown string>" + location.origin);
        #/
        model = namespace_ec06fe4a::spawnmodel(0, location.origin, modelname, location.angles, "dungeon floor decor " + modelname);
        if (isdefined(model)) {
            if (isdefined(modelinfo)) {
                model setscale(modelinfo.scale);
                model.angles += (0, modelinfo.yaw_offset, 0);
                if (isdefined(modelinfo.fx)) {
                    model.fx = util::playfxontag(0, level._effect[modelinfo.fx], model, "tag_fx");
                }
                model solid();
            }
        }
    }
    return model;
}

