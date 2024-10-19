// Atian COD Tools GSC CW decompiler test
#using script_49d63131b6de89a1;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_8dac58da;

// Namespace namespace_8dac58da/namespace_8dac58da
// Params 0, eflags: 0x0
// Checksum 0x2728db58, Offset: 0x2e8
// Size: 0x42c
function init() {
    var_a91808c6 = array("lgt_env_village_off", "lgt_env_omega_defence_01_off", "lgt_env_omega_defence_02_off", "lgt_env_omega_defence_03_off");
    namespace_cf4aa5f0::function_6dbaba52("default", var_a91808c6, undefined, undefined, undefined);
    namespace_cf4aa5f0::function_6dbaba52("gold_power_on", "lgt_env_village_on", undefined, undefined, "lgt_env_village_off", &gold_power_on);
    namespace_cf4aa5f0::function_6dbaba52("gold_power_off", "lgt_env_village_off", undefined, undefined, "lgt_env_village_on", &gold_power_off);
    namespace_cf4aa5f0::function_6dbaba52("power_on_immediate", undefined, "lgt_env_village_on", undefined, "lgt_env_village_off");
    namespace_cf4aa5f0::function_6dbaba52("cp_defence_1_light_on", "lgt_env_omega_defence_01_on", undefined, undefined, "lgt_env_omega_defence_01_off");
    namespace_cf4aa5f0::function_6dbaba52("cp_defence_1_light_off", "lgt_env_omega_defence_01_off", undefined, undefined, "lgt_env_omega_defence_01_on");
    namespace_cf4aa5f0::function_6dbaba52("cp_defence_2_light_on", "lgt_env_omega_defence_02_on", undefined, undefined, "lgt_env_omega_defence_02_off");
    namespace_cf4aa5f0::function_6dbaba52("cp_defence_2_light_off", "lgt_env_omega_defence_02_off", undefined, undefined, "lgt_env_omega_defence_02_on");
    namespace_cf4aa5f0::function_6dbaba52("cp_defence_3_light_on", "lgt_env_omega_defence_03_on", undefined, undefined, "lgt_env_omega_defence_03_off");
    namespace_cf4aa5f0::function_6dbaba52("cp_defence_3_light_off", "lgt_env_omega_defence_03_off", undefined, undefined, "lgt_env_omega_defence_03_on");
    namespace_cf4aa5f0::function_6dbaba52("peck_room_fire_on", "fxexp_turn_on_fire", undefined, undefined, undefined);
    namespace_cf4aa5f0::function_6dbaba52("peck_room_fire_off", "fxexp_turn_off_fire", undefined, undefined, "fxexp_turn_on_fire");
    clientfield::register("world", "" + #"hash_5a41b1632428880c", 1, 1, "int", &function_36d3a2ae, 1, 0);
    clientfield::register("world", "" + #"hash_22f0944e4bd4dea9", 1, 1, "int", &function_7cc2cca5, 1, 0);
    clientfield::register("world", "" + #"hash_c9774e0d25f882a", 1, 1, "int", &function_72aa9b9b, 1, 0);
    clientfield::register("world", "" + #"hash_21e00c65edc6594c", 1, 1, "int", &function_a7e6c47e, 1, 0);
    clientfield::register("world", "" + #"hash_249ac6ef9989bee4", 1, 1, "int", &function_a20b24ac, 1, 0);
}

// Namespace namespace_8dac58da/namespace_8dac58da
// Params 7, eflags: 0x0
// Checksum 0xe790fe06, Offset: 0x720
// Size: 0x7c
function function_a7e6c47e(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        namespace_cf4aa5f0::function_470d684a("peck_room_fire_on");
        return;
    }
    namespace_cf4aa5f0::function_470d684a("peck_room_fire_off");
}

// Namespace namespace_8dac58da/namespace_8dac58da
// Params 7, eflags: 0x0
// Checksum 0xa7332917, Offset: 0x7a8
// Size: 0x7c
function function_36d3a2ae(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        namespace_cf4aa5f0::function_470d684a("cp_defence_1_light_on");
        return;
    }
    namespace_cf4aa5f0::function_470d684a("cp_defence_1_light_off");
}

// Namespace namespace_8dac58da/namespace_8dac58da
// Params 7, eflags: 0x0
// Checksum 0x8be37ae7, Offset: 0x830
// Size: 0x7c
function function_7cc2cca5(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        namespace_cf4aa5f0::function_470d684a("cp_defence_2_light_on");
        return;
    }
    namespace_cf4aa5f0::function_470d684a("cp_defence_2_light_off");
}

// Namespace namespace_8dac58da/namespace_8dac58da
// Params 7, eflags: 0x0
// Checksum 0x7debf519, Offset: 0x8b8
// Size: 0x7c
function function_72aa9b9b(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        namespace_cf4aa5f0::function_470d684a("cp_defence_3_light_on");
        return;
    }
    namespace_cf4aa5f0::function_470d684a("cp_defence_3_light_off");
}

// Namespace namespace_8dac58da/namespace_8dac58da
// Params 0, eflags: 0x0
// Checksum 0x8293cd1f, Offset: 0x940
// Size: 0x84
function function_dcf22669() {
    namespace_cf4aa5f0::function_470d684a("default");
    if (level clientfield::get("zombie_power_on")) {
        namespace_cf4aa5f0::function_470d684a("power_on_immediate");
    }
    namespace_cf4aa5f0::function_25002e3("gold_power_on");
    namespace_cf4aa5f0::function_25002e3("gold_power_off");
}

// Namespace namespace_8dac58da/namespace_8dac58da
// Params 7, eflags: 0x0
// Checksum 0x4e204bfb, Offset: 0x9d0
// Size: 0x84
function function_a20b24ac(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        level flag::set("gold_power_on");
        return;
    }
    level flag::clear("gold_power_on");
}

// Namespace namespace_8dac58da/namespace_8dac58da
// Params 0, eflags: 0x4
// Checksum 0x9bc77b9, Offset: 0xa60
// Size: 0x6c
function private gold_power_on() {
    if (is_true(level.var_659ca193)) {
        level flag::wait_till_clear("gold_power_on");
    }
    level flag::wait_till("gold_power_on");
    level.var_659ca193 = 1;
}

// Namespace namespace_8dac58da/namespace_8dac58da
// Params 0, eflags: 0x4
// Checksum 0xc810d183, Offset: 0xad8
// Size: 0x44
function private gold_power_off() {
    level flag::wait_till("gold_power_on");
    level flag::wait_till_clear("gold_power_on");
}

