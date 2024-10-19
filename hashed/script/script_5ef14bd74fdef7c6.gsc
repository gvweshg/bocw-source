// Atian COD Tools GSC CW decompiler test
#using script_49d63131b6de89a1;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_297ae820;

// Namespace namespace_297ae820/namespace_297ae820
// Params 0, eflags: 0x2 linked
// Checksum 0x85972316, Offset: 0x210
// Size: 0x30c
function init() {
    var_a91808c6 = array("lgt_zipline_door_on");
    var_18e68ce9 = array("lgt_zipline_door_on");
    namespace_cf4aa5f0::function_6dbaba52("default", undefined, undefined, var_a91808c6, undefined);
    namespace_cf4aa5f0::function_6dbaba52("power_on", var_18e68ce9, undefined, undefined, undefined, &power_on);
    namespace_cf4aa5f0::function_6dbaba52("power_on_immediate", undefined, var_18e68ce9, undefined, undefined);
    namespace_cf4aa5f0::function_6dbaba52("end_boss_fight_light_on", "lgt_env_end_boss_fight", undefined, undefined, undefined);
    namespace_cf4aa5f0::function_6dbaba52("sq_rcxd_challenge_light_on", "lgt_bonus_race", undefined, undefined, undefined);
    namespace_cf4aa5f0::function_6dbaba52("sq_rcxd_challenge_light_off", undefined, undefined, "lgt_bonus_race", undefined);
    namespace_cf4aa5f0::function_6dbaba52("pistol_light_on", "lgt_env_shooting_gallery_pistol", undefined, undefined, undefined);
    namespace_cf4aa5f0::function_6dbaba52("pistol_light_off", undefined, undefined, "lgt_env_shooting_gallery_pistol", undefined);
    namespace_cf4aa5f0::function_6dbaba52("dark_aether_light_on", "zm_tungsten_dark_aether", undefined, undefined, undefined);
    clientfield::register("world", "" + #"hash_658f225a02b95617", 28000, 1, "int", &function_c5a7e457, 1, 0);
    clientfield::register("world", "" + #"hash_5e34e1c50fd13b32", 28000, 1, "int", &function_bdf1c128, 1, 0);
    clientfield::register("world", "" + #"pistol_light_on", 28000, 1, "int", &pistol_light_on, 1, 0);
    clientfield::register("world", "" + #"dark_aether_light_on", 28000, 1, "int", &dark_aether_light_on, 1, 0);
}

// Namespace namespace_297ae820/namespace_297ae820
// Params 0, eflags: 0x2 linked
// Checksum 0x2c040e6b, Offset: 0x528
// Size: 0x74
function function_dcf22669() {
    namespace_cf4aa5f0::function_470d684a("default");
    if (level clientfield::get("zombie_power_on")) {
        namespace_cf4aa5f0::function_470d684a("power_on_immediate");
        return;
    }
    namespace_cf4aa5f0::function_470d684a("power_on");
}

// Namespace namespace_297ae820/namespace_297ae820
// Params 0, eflags: 0x6 linked
// Checksum 0xb5243618, Offset: 0x5a8
// Size: 0x3c
function private power_on() {
    level waittill(#"power_on");
    /#
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_297ae820/namespace_297ae820
// Params 7, eflags: 0x2 linked
// Checksum 0xc9c9c6e8, Offset: 0x5f0
// Size: 0x5c
function function_c5a7e457(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        namespace_cf4aa5f0::function_470d684a("end_boss_fight_light_on");
    }
}

// Namespace namespace_297ae820/namespace_297ae820
// Params 7, eflags: 0x2 linked
// Checksum 0xacfc382b, Offset: 0x658
// Size: 0x7c
function function_bdf1c128(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        namespace_cf4aa5f0::function_470d684a("sq_rcxd_challenge_light_on");
        return;
    }
    namespace_cf4aa5f0::function_470d684a("sq_rcxd_challenge_light_off");
}

// Namespace namespace_297ae820/namespace_297ae820
// Params 7, eflags: 0x2 linked
// Checksum 0x4ce5fc78, Offset: 0x6e0
// Size: 0x7c
function pistol_light_on(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        namespace_cf4aa5f0::function_470d684a("pistol_light_on");
        return;
    }
    namespace_cf4aa5f0::function_470d684a("pistol_light_off");
}

// Namespace namespace_297ae820/namespace_297ae820
// Params 7, eflags: 0x2 linked
// Checksum 0x513f04d8, Offset: 0x768
// Size: 0x5c
function dark_aether_light_on(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        namespace_cf4aa5f0::function_470d684a("dark_aether_light_on");
    }
}

