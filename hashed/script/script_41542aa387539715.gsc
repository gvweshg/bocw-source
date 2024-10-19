// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\util_shared.gsc;
#using script_54f593f5beb1464a;
#using script_2a30ac7aa0ee8988;

#namespace namespace_654e3553;

// Namespace namespace_654e3553/namespace_654e3553
// Params 0, eflags: 0x1
// Checksum 0xbb247664, Offset: 0x140
// Size: 0x17c
function autoexec __init__() {
    gametype = function_be90acca(util::get_game_type());
    switch (gametype) {
    case #"fireteam_dirty_bomb":
        function_cbbf16a4();
        break;
    case #"hash_6463dea5fa2dbea5":
        function_e5d1b704();
        break;
    case #"fireteam_elimination":
        function_574dc51f();
        break;
    case #"fireteam_satlink":
        function_11109d50();
        break;
    case #"fireteam_koth":
        function_1ed4cf79();
        break;
    case #"zsurvival":
        function_bcd11f83();
        break;
    default:
        function_174f7610();
        break;
    }
    function_d6c364ca();
    function_f05c9e0a();
}

// Namespace namespace_654e3553/namespace_654e3553
// Params 0, eflags: 0x2 linked
// Checksum 0x5429758b, Offset: 0x2c8
// Size: 0x7c
function function_cbbf16a4() {
    var_87d0eef8 = &item_world_fixup::remove_item;
    var_74257310 = &item_world_fixup::add_item_replacement;
    var_f8a4c541 = &item_world_fixup::function_6991057;
    var_edfbccd0 = &item_world_fixup::function_e70fa91c;
    function_c379f040();
}

// Namespace namespace_654e3553/namespace_654e3553
// Params 0, eflags: 0x2 linked
// Checksum 0x5a1cf4c5, Offset: 0x350
// Size: 0xa4
function function_e5d1b704() {
    var_87d0eef8 = &item_world_fixup::remove_item;
    var_74257310 = &item_world_fixup::add_item_replacement;
    var_f8a4c541 = &item_world_fixup::function_6991057;
    var_edfbccd0 = &item_world_fixup::function_e70fa91c;
    namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_203198a6940492f9", #"hash_358b850466bc7d5e");
    function_c379f040();
}

// Namespace namespace_654e3553/namespace_654e3553
// Params 0, eflags: 0x2 linked
// Checksum 0xa9c8d741, Offset: 0x400
// Size: 0xa4
function function_574dc51f() {
    var_87d0eef8 = &item_world_fixup::remove_item;
    var_74257310 = &item_world_fixup::add_item_replacement;
    var_f8a4c541 = &item_world_fixup::function_6991057;
    var_edfbccd0 = &item_world_fixup::function_e70fa91c;
    namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_203198a6940492f9", #"hash_20fe5ea7eec81707");
    function_c379f040();
}

// Namespace namespace_654e3553/namespace_654e3553
// Params 0, eflags: 0x2 linked
// Checksum 0x367ec77, Offset: 0x4b0
// Size: 0xa4
function function_11109d50() {
    var_87d0eef8 = &item_world_fixup::remove_item;
    var_74257310 = &item_world_fixup::add_item_replacement;
    var_f8a4c541 = &item_world_fixup::function_6991057;
    var_edfbccd0 = &item_world_fixup::function_e70fa91c;
    namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_203198a6940492f9", #"hash_539207ef429bfa40");
    function_c379f040();
}

// Namespace namespace_654e3553/namespace_654e3553
// Params 0, eflags: 0x2 linked
// Checksum 0x19dd9b7f, Offset: 0x560
// Size: 0xa4
function function_1ed4cf79() {
    var_87d0eef8 = &item_world_fixup::remove_item;
    var_74257310 = &item_world_fixup::add_item_replacement;
    var_f8a4c541 = &item_world_fixup::function_6991057;
    var_edfbccd0 = &item_world_fixup::function_e70fa91c;
    namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_203198a6940492f9", #"hash_59ceff804ad2c7b8");
    function_c379f040();
}

// Namespace namespace_654e3553/namespace_654e3553
// Params 0, eflags: 0x2 linked
// Checksum 0x5ae83662, Offset: 0x610
// Size: 0x104
function function_bcd11f83() {
    namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_203198a6940492f9", #"t9_empty_global");
    namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_7ac411919d38a834", #"t9_empty_global");
    namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_556d30705792adb8", #"t9_empty_global");
    namespace_1c7b37c6::item_replacer(&item_world_fixup::function_6991057, #"hash_4f70a292fbe3d543", #"t9_empty_global");
}

// Namespace namespace_654e3553/namespace_654e3553
// Params 0, eflags: 0x2 linked
// Checksum 0xf6405953, Offset: 0x720
// Size: 0x94
function function_174f7610() {
    var_87d0eef8 = &item_world_fixup::remove_item;
    var_74257310 = &item_world_fixup::add_item_replacement;
    var_f8a4c541 = &item_world_fixup::function_6991057;
    var_edfbccd0 = &item_world_fixup::function_e70fa91c;
    namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_203198a6940492f9", #"t9_empty_global");
}

// Namespace namespace_654e3553/namespace_654e3553
// Params 0, eflags: 0x2 linked
// Checksum 0x779d4f4, Offset: 0x7c0
// Size: 0xc4
function function_d6c364ca() {
    var_87d0eef8 = &item_world_fixup::remove_item;
    var_74257310 = &item_world_fixup::add_item_replacement;
    var_f8a4c541 = &item_world_fixup::function_6991057;
    var_edfbccd0 = &item_world_fixup::function_e70fa91c;
    namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_236440cd20c8be44", #"t9_empty_global");
    namespace_1c7b37c6::item_replacer(var_f8a4c541, #"hash_694cfad6e9e3f2e1", #"t9_empty_global");
}

// Namespace namespace_654e3553/namespace_654e3553
// Params 0, eflags: 0x2 linked
// Checksum 0xca5f2ca2, Offset: 0x890
// Size: 0x11c
function function_f05c9e0a() {
    function_8341771e(function_91b29d2a("location_items_icbm"), 2000, #"hash_678b3e958d4ef0fe");
    function_8341771e(function_91b29d2a("location_items_bootcamp"), 5200, #"hash_373e96ac9835f0ca");
    function_8341771e(function_91b29d2a("location_items_silos"), 7000, #"hash_6a68e2523eee18af");
    function_8341771e(function_91b29d2a("location_items_farm"), 5000, #"hash_1c4eccf00713d9c7");
    function_8341771e(function_91b29d2a("location_items_cargo"), 5200, #"hash_1b7faa17a5a204d1");
}

// Namespace namespace_654e3553/namespace_654e3553
// Params 3, eflags: 0x2 linked
// Checksum 0x3e610265, Offset: 0x9b8
// Size: 0x194
function function_8341771e(locations, radius, name) {
    var_32948f8f = function_91b29d2a("dirty_bomb_stash");
    foreach (location in locations) {
        foreach (var_64b8ecb8 in var_32948f8f) {
            if (distance2dsquared(location.origin, var_64b8ecb8.origin) <= radius * radius) {
                var_d196e508 = var_64b8ecb8.origin;
                item_world_fixup::function_a997e342(var_d196e508, 16);
                item_world_fixup::add_spawn_point(var_d196e508, name, var_64b8ecb8.angles);
            }
        }
    }
}

// Namespace namespace_654e3553/namespace_654e3553
// Params 0, eflags: 0x2 linked
// Checksum 0xbfe0180f, Offset: 0xb58
// Size: 0x1c
function function_c379f040() {
    hidemiscmodels("magicbox_zbarrier");
}

