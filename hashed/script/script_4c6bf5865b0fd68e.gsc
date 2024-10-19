// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using script_4dc6a9b234b838e1;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_5a359049;

// Namespace namespace_5a359049/namespace_5a359049
// Params 0, eflags: 0x5
// Checksum 0x3beb0b08, Offset: 0x110
// Size: 0x54
function private autoexec __init__system__() {
    system::register(#"hash_695bd4a240716800", &preinit, &postinit, undefined, #"zm_weapons");
}

// Namespace namespace_5a359049/namespace_5a359049
// Params 0, eflags: 0x6 linked
// Checksum 0x7a722be, Offset: 0x170
// Size: 0xe4
function private preinit() {
    level.var_1b5a1f0d = &zm_utility::is_point_inside_enabled_zone;
    level.var_3da1a113 = #"hash_733eecf99198ecb9";
    level.weaponzmcymbalmonkey = getweapon(#"cymbal_monkey");
    zm_loadout::register_lethal_grenade_for_level(#"cymbal_monkey");
    zm_weapons::function_404c3ad5(level.weaponzmcymbalmonkey, &function_c1c47eb6);
    callback::add_callback(#"on_ai_killed", &function_c58f9108);
    namespace_cc411409::preinit();
}

// Namespace namespace_5a359049/namespace_5a359049
// Params 0, eflags: 0x6 linked
// Checksum 0xfcf15095, Offset: 0x260
// Size: 0x5c
function private postinit() {
    if (!cymbal_monkey_exists()) {
        return;
    }
    if (is_true(level.legacy_cymbal_monkey)) {
        level.cymbal_monkey_model = "weapon_zombie_monkey_bomb";
        return;
    }
    level.cymbal_monkey_model = "wpn_t7_zmb_monkey_bomb_world";
}

// Namespace namespace_5a359049/namespace_5a359049
// Params 0, eflags: 0x2 linked
// Checksum 0xdb095530, Offset: 0x2c8
// Size: 0x18
function cymbal_monkey_exists() {
    return level.weaponzmcymbalmonkey != level.weaponnone;
}

// Namespace namespace_5a359049/namespace_5a359049
// Params 15, eflags: 0x2 linked
// Checksum 0x683cee73, Offset: 0x2e8
// Size: 0xda
function function_c1c47eb6(inflictor, attacker, *damage, *flags, *meansofdeath, *weapon, *vpoint, *vdir, *shitloc, *vdamageorigin, *psoffsettime, *boneindex, *modelindex, *surfacetype, *vsurfacenormal) {
    if (isentity(surfacetype) && isplayer(vsurfacenormal) && self.var_6f84b820 === #"normal") {
        self.var_9a4dd099 = surfacetype.origin;
    }
}

// Namespace namespace_5a359049/namespace_5a359049
// Params 1, eflags: 0x2 linked
// Checksum 0x912261a, Offset: 0x3d0
// Size: 0xc4
function function_c58f9108(params) {
    if (params.weapon.name === #"cymbal_monkey" && isplayer(params.eattacker) && self.var_6f84b820 === #"normal" && isvec(self.var_9a4dd099)) {
        self namespace_cc411409::ragdoll_launch(self.var_9a4dd099, 2);
        self thread function_3fb4ce3b();
    }
}

// Namespace namespace_5a359049/namespace_5a359049
// Params 0, eflags: 0x2 linked
// Checksum 0xc1bc57ae, Offset: 0x4a0
// Size: 0x34
function function_3fb4ce3b() {
    util::wait_network_frame();
    if (isdefined(self)) {
        self zombie_utility::gib_random_parts();
    }
}

