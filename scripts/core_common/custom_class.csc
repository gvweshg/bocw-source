// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\player\player_stats.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using script_53cd49b939f89fd7;
#using scripts\core_common\struct.csc;
#using scripts\core_common\postfx_shared.csc;
#using script_474309807eb94f34;
#using scripts\core_common\activecamo_shared.csc;

#namespace customclass;

// Namespace customclass/custom_class
// Params 0, eflags: 0x5
// Checksum 0xa7095b06, Offset: 0x830
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"custom_class", &preinit, undefined, undefined, undefined);
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x6988c818, Offset: 0x878
// Size: 0x24
function localclientconnect(localclientnum) {
    level thread custom_class_init(localclientnum);
}

// Namespace customclass/custom_class
// Params 0, eflags: 0x2 linked
// Checksum 0xe4698e12, Offset: 0x8a8
// Size: 0x6ac
function preinit() {
    level.var_636c2236 = 0;
    level.weapon_script_model = [];
    level.preload_weapon_model = [];
    level.last_weapon_name = [];
    level.var_8ad413c = [];
    level.current_weapon = [];
    level.attachment_names = [];
    level.paintshophiddenposition = [];
    level.camo_index = [];
    level.reticle_index = [];
    level.var_dd70be5b = [];
    level.var_aa10d0b4 = [];
    level.weapon_clientscript_cac_model = [];
    level.var_6f87d12e = [];
    level.weaponnone = getweapon(#"none");
    level.weapon_position[#"primary"] = struct::get("cac_weapon_position_primary");
    level.weapon_position[#"secondary"] = struct::get("cac_weapon_position_secondary");
    level.weapon_position[#"hash_5f2a18f0e771a387"] = struct::get("cac_weapon_position_secondary_oversized");
    level.weapon_position[#"secondarygrenade"] = struct::get("cac_weapon_position_tactical_grenade");
    level.weapon_position[#"hash_777a08527f2da4e1"] = struct::get("cac_weapon_position_tactical_grenade_2");
    level.weapon_position[#"primarygrenade"] = struct::get("cac_weapon_position_lethal_grenade");
    level.weapon_position[#"hash_6148898d5ac59179"] = struct::get("cac_weapon_position_lethal_grenade_2");
    level.weapon_position[#"specialgrenade"] = struct::get("cac_weapon_position_field_upgrade");
    level.weapon_position[#"specialgrenade_zm"] = struct::get(#"zm_cac_weapon_position_wand_weapon");
    level.weapon_position[#"perks_zm"] = struct::get("zm_cac_weapon_position_perk_a_cola");
    level.weapon_position[#"ammo_zm"] = struct::get(#"zm_cac_weapon_position_ammo_mods");
    level.weapon_position[#"canister_zm"] = struct::get(#"zm_cac_weapon_position_wand_canisters");
    level.weapon_position[#"weapon_categories_zm"] = struct::get(#"zm_cac_weapon_position_weapon_categories");
    level.weapon_position[#"perk1"] = struct::get("cac_weapon_position_perk_1");
    level.weapon_position[#"hash_75a53afe5fb30f2c"] = struct::get("cac_weapon_position_perk_1_2nd");
    level.weapon_position[#"hash_1e3b6d1c50127b6d"] = struct::get("cac_weapon_position_perk_1_3rd");
    level.weapon_position[#"perk4"] = level.weapon_position[#"hash_1e3b6d1c50127b6d"];
    level.weapon_position[#"perk2"] = struct::get("cac_weapon_position_perk_2");
    level.weapon_position[#"hash_27460ccf4582b502"] = struct::get("cac_weapon_position_perk_2_2nd");
    level.weapon_position[#"hash_551e597e4fcfe0e4"] = struct::get("cac_weapon_position_perk_2_3rd");
    level.weapon_position[#"perk5"] = level.weapon_position[#"hash_27460ccf4582b502"];
    level.weapon_position[#"perk3"] = struct::get("cac_weapon_position_perk_3");
    level.weapon_position[#"hash_344ad3ebce2569"] = struct::get("cac_weapon_position_perk_3_2nd");
    level.weapon_position[#"hash_3c0f3d3aa7135e86"] = struct::get("cac_weapon_position_perk_3_3rd");
    level.weapon_position[#"perk6"] = level.weapon_position[#"hash_344ad3ebce2569"];
    level.weapon_position[#"bonuscard1"] = struct::get("cac_weapon_position_wildcard");
    level.weapon_position[#"gunsmith"] = struct::get("gunsmith_weapon_position");
    level.weapon_position[#"hash_c70e59dba98cf81"] = struct::get("cac_weapon_position_wrist_accessory");
    var_97d766d2 = getscriptbundlelist(#"hash_5225176172b7189f");
    level.var_95471a83 = var_97d766d2;
    function_875dd2fe();
    level.var_a9b637b1 = &function_1f5168a3;
    /#
        level thread function_531d4c52();
    #/
}

// Namespace customclass/custom_class
// Params 0, eflags: 0x2 linked
// Checksum 0x7a1ad0d1, Offset: 0xf60
// Size: 0x1b6
function function_875dd2fe() {
    if (!isdefined(level.var_9d0d6475)) {
        level.var_9d0d6475 = [];
    }
    foreach (var_45e629a9 in level.var_95471a83) {
        var_6f6294b = getscriptbundle(var_45e629a9);
        worldfx = var_6f6294b.var_d64cf1fa;
        viewfx = var_6f6294b.var_e35da898;
        frontendmodel = var_6f6294b.var_9fc71d24;
        if (isdefined(frontendmodel)) {
            if (isdefined(worldfx)) {
                level.var_9d0d6475[frontendmodel][#"worldfx"] = worldfx;
            }
            if (isdefined(viewfx)) {
                level.var_9d0d6475[frontendmodel][#"viewfx"] = viewfx;
            }
        }
        viewmodel = var_6f6294b.var_8d478ea4;
        if (isdefined(viewmodel)) {
            if (isdefined(worldfx)) {
                level.var_9d0d6475[viewmodel][#"worldfx"] = worldfx;
            }
            if (isdefined(viewfx)) {
                level.var_9d0d6475[viewmodel][#"viewfx"] = viewfx;
            }
        }
    }
}

/#

    // Namespace customclass/custom_class
    // Params 0, eflags: 0x4
    // Checksum 0xd6bbd120, Offset: 0x1120
    // Size: 0x382
    function private function_531d4c52() {
        var_eb8df6e7 = array(#"primary", #"secondary", #"hash_5f2a18f0e771a387", #"primarygrenade", #"hash_6148898d5ac59179", #"secondarygrenade", #"hash_777a08527f2da4e1", #"specialgrenade", #"perk1", #"hash_75a53afe5fb30f2c", #"hash_1e3b6d1c50127b6d", #"perk4", #"perk2", #"hash_27460ccf4582b502", #"hash_551e597e4fcfe0e4", #"perk5", #"perk3", #"hash_344ad3ebce2569", #"hash_3c0f3d3aa7135e86", #"perk6", #"bonuscard1", #"gunsmith");
        var_ce681ff1 = array(#"primary", #"specialgrenade_zm", #"perks_zm", #"ammo_zm", #"canister_zm", #"weapon_categories_zm");
        while (getdvarint(#"hash_690dc40b39cafbfc", 0)) {
            foreach (var_e925bc18, var_5eb04963 in level.weapon_position) {
                if (sessionmodeiszombiesgame() && isinarray(var_ce681ff1, var_e925bc18) || !sessionmodeiszombiesgame() && isinarray(var_eb8df6e7, var_e925bc18)) {
                    circle(var_5eb04963.origin, 0.5, (1, 0, 0));
                    print3d(var_5eb04963.origin, function_9e72a96(var_e925bc18) + "weapon_categories_zm" + var_5eb04963.origin, (1, 1, 1), undefined, 0.015625);
                }
            }
            waitframe(1);
        }
    }

#/

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x339d1d1f, Offset: 0x14b0
// Size: 0x7e
function function_3b43bbae(var_301f61a) {
    if (isdefined(var_301f61a)) {
        var_6f6294b = getscriptbundle(var_301f61a);
        if (isdefined(var_6f6294b)) {
            if (isdefined(var_6f6294b.var_9fc71d24)) {
                return var_6f6294b.var_9fc71d24;
            } else if (isdefined(var_6f6294b.var_8d478ea4)) {
                return var_6f6294b.var_8d478ea4;
            }
        }
    }
    return "";
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x395dc70, Offset: 0x1538
// Size: 0x84
function function_ddce43b3(var_5f654ba8) {
    if (!isdefined(var_5f654ba8)) {
        return;
    }
    worldfx = level.var_9d0d6475[var_5f654ba8][#"worldfx"];
    if (isdefined(worldfx)) {
        return worldfx;
    }
    viewfx = level.var_9d0d6475[var_5f654ba8][#"viewfx"];
    if (isdefined(viewfx)) {
        return viewfx;
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x8c1e1f6, Offset: 0x15c8
// Size: 0x5c
function function_bf9f3492(var_d4c489c0) {
    switch (var_d4c489c0) {
    case #"primarygrenade":
        return #"hash_6148898d5ac59179";
    case #"secondarygrenade":
        return #"hash_777a08527f2da4e1";
    }
    return undefined;
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0xa794bcff, Offset: 0x1630
// Size: 0x78
function function_cc770c92(weapon) {
    var_de496121 = function_34668e22(weapon);
    if (is_true(weapon.islauncher) || is_true(var_de496121.var_1967779)) {
        return true;
    }
    return false;
}

// Namespace customclass/custom_class
// Params 5, eflags: 0x2 linked
// Checksum 0xe9868c21, Offset: 0x16b0
// Size: 0x6bc
function function_1cd1374d(var_1d35315f, var_d4c489c0 = #"primary", var_e81ceea = "", localclientnum, var_85d87aca) {
    if (isdefined(var_1d35315f) && (isstring(var_1d35315f) || ishash(var_1d35315f))) {
        var_1d35315f = getweapon(var_1d35315f);
    }
    if (var_d4c489c0 == #"gunsmith") {
        s_info = function_5f70d1c8(var_1d35315f, var_e81ceea);
    } else if (var_d4c489c0 == #"hash_2fda3f64c5caa89e") {
        s_info = function_fa001ebb(var_1d35315f);
    } else if (var_d4c489c0 == #"charm") {
        s_info = function_add95f58(var_1d35315f);
    } else if (var_d4c489c0 == #"stickers") {
        s_info = function_82f74dec(var_1d35315f);
    } else {
        s_info = function_3bff05ba(var_1d35315f, var_d4c489c0, localclientnum);
    }
    var_d3c21d73 = s_info.origin;
    v_ang_offset = s_info.angles;
    switch (var_d4c489c0) {
    case #"primary":
    default:
        if (function_cc770c92(var_1d35315f)) {
            if (function_4dcbc16b(localclientnum, var_d4c489c0, var_1d35315f)) {
                s_location = level.weapon_position[#"primary"];
            } else {
                s_location = level.weapon_position[#"hash_5f2a18f0e771a387"];
            }
        } else {
            s_location = level.weapon_position[#"primary"];
        }
        break;
    case #"secondary":
        if (function_cc770c92(var_1d35315f)) {
            s_location = level.weapon_position[#"hash_5f2a18f0e771a387"];
        } else {
            s_location = level.weapon_position[#"secondary"];
        }
        break;
    case #"primarygrenade":
        s_location = level.weapon_position[#"primarygrenade"];
        break;
    case #"hash_6148898d5ac59179":
        s_location = level.weapon_position[#"hash_6148898d5ac59179"];
        break;
    case #"secondarygrenade":
        s_location = level.weapon_position[#"secondarygrenade"];
        break;
    case #"hash_777a08527f2da4e1":
        s_location = level.weapon_position[#"hash_777a08527f2da4e1"];
        break;
    case #"specialgrenade":
        if (sessionmodeiszombiesgame()) {
            s_location = level.weapon_position[#"specialgrenade_zm"];
        } else {
            s_location = level.weapon_position[#"specialgrenade"];
        }
        break;
    case #"talent":
        s_location = level.weapon_position[#"perks_zm"];
        break;
    case #"hash_6535e34e6169957e":
        s_location = level.weapon_position[#"canister_zm"];
        break;
    case #"specialty":
        s_location = level.weapon_position[#"ammo_zm"];
        break;
    case #"weaponcategories":
        s_location = level.weapon_position[#"weapon_categories_zm"];
        break;
    case #"talent3":
    case #"talent2":
    case #"talent1":
    case #"talent6":
    case #"talent5":
    case #"talent4":
    case #"talents":
    case #"perk1":
    case #"perk3":
    case #"perk2":
        s_location = function_3ca8f346(var_85d87aca, var_d4c489c0, localclientnum);
        break;
    case #"bonuscard1":
        s_location = level.weapon_position[#"bonuscard1"];
        break;
    case #"gunsmith":
    case #"charm":
    case #"hash_2fda3f64c5caa89e":
    case #"stickers":
        s_location = level.weapon_position[#"gunsmith"];
        break;
    case #"hash_c70e59dba98cf81":
        s_location = level.weapon_position[#"hash_c70e59dba98cf81"];
        break;
    }
    function_3de4843(localclientnum, var_d4c489c0, s_info.var_697bf2ff, var_1d35315f, s_info);
    var_cb7a50a5 = {#origin:s_location.origin + var_d3c21d73, #angles:s_location.angles + v_ang_offset};
    return var_cb7a50a5;
}

// Namespace customclass/custom_class
// Params 5, eflags: 0x2 linked
// Checksum 0x25117973, Offset: 0x1d78
// Size: 0x8f2
function function_3de4843(localclientnum, var_8a4ba442, b_show = 0, weapon, s_info) {
    switch (var_8a4ba442) {
    case #"primary":
        var_35be18f5 = getentarray(localclientnum, "hooks_primary_weapon", "script_noteworthy");
        foreach (var_bc94f6f in var_35be18f5) {
            if (!isdefined(var_bc94f6f.var_a4fadd7e)) {
                var_bc94f6f.var_a4fadd7e = var_bc94f6f.origin;
            }
            if (isdefined(var_bc94f6f.targetname)) {
                switch (var_bc94f6f.targetname) {
                case #"hooks_primary_weapon_hook_left":
                    var_bc94f6f.origin = var_bc94f6f.var_a4fadd7e + s_info.var_a5946026;
                    break;
                case #"hooks_primary_weapon_hook_right":
                    var_bc94f6f.origin = var_bc94f6f.var_a4fadd7e + s_info.var_36859b17;
                    break;
                case #"hooks_primary_weapon_middle":
                    var_bc94f6f.origin = var_bc94f6f.var_a4fadd7e + s_info.var_a7adf514;
                    break;
                case #"hooks_primary_weapon_plate_left":
                    var_bc94f6f.origin = var_bc94f6f.var_a4fadd7e + (0, s_info.var_a5946026[1], s_info.var_a5946026[2]);
                    break;
                case #"hooks_primary_weapon_plate_right":
                    var_bc94f6f.origin = var_bc94f6f.var_a4fadd7e + (0, s_info.var_36859b17[1], s_info.var_36859b17[2]);
                    break;
                }
            }
            if (b_show) {
                if (weapon.weapclass === "pistol") {
                    if (var_bc94f6f.targetname === "hooks_primary_weapon_middle") {
                        var_bc94f6f show();
                    } else {
                        var_bc94f6f hide();
                    }
                } else if (var_bc94f6f.targetname === "hooks_primary_weapon_middle") {
                    var_bc94f6f hide();
                } else {
                    var_bc94f6f show();
                }
                continue;
            }
            var_bc94f6f hide();
        }
        break;
    case #"secondary":
        function_3a0a9f01(localclientnum, s_info, b_show, weapon, var_8a4ba442);
        break;
    case #"primarygrenade":
        var_f33b540a = getentarray(localclientnum, "shelves_primary_grenade", "script_noteworthy");
        foreach (var_6f552f36 in var_f33b540a) {
            if (!isdefined(var_6f552f36.var_a4fadd7e)) {
                var_6f552f36.var_a4fadd7e = var_6f552f36.origin;
            }
            if (isdefined(var_6f552f36.targetname)) {
                switch (var_6f552f36.targetname) {
                case #"hooks_primary_grenade_hook_left":
                    var_6f552f36.origin = var_6f552f36.var_a4fadd7e + s_info.var_a5946026;
                    break;
                case #"hooks_primary_grenade_hook_right":
                    var_6f552f36.origin = var_6f552f36.var_a4fadd7e + s_info.var_36859b17;
                    break;
                case #"shelf_primary_grenade_middle":
                    var_6f552f36.origin = var_6f552f36.var_a4fadd7e + s_info.var_a7adf514;
                    break;
                case #"hooks_primary_grenade_plate_left":
                    var_6f552f36.origin = var_6f552f36.var_a4fadd7e + (0, s_info.var_a5946026[1], s_info.var_a5946026[2]);
                    break;
                case #"hooks_primary_grenade_plate_right":
                    var_6f552f36.origin = var_6f552f36.var_a4fadd7e + (0, s_info.var_36859b17[1], s_info.var_36859b17[2]);
                    break;
                }
            }
            if (b_show) {
                if (is_true(s_info.var_c492a06c)) {
                    if (var_6f552f36.targetname === "shelf_primary_grenade_middle") {
                        var_6f552f36 hide();
                    } else {
                        var_6f552f36 show();
                    }
                } else if (var_6f552f36.targetname === "shelf_primary_grenade_middle") {
                    var_6f552f36 show();
                } else {
                    var_6f552f36 hide();
                }
                continue;
            }
            var_6f552f36 hide();
        }
        break;
    case #"secondarygrenade":
        var_b74cf891 = getentarray(localclientnum, "shelves_secondary_grenade", "script_noteworthy");
        foreach (var_3878ec49 in var_b74cf891) {
            if (!isdefined(var_3878ec49.var_a4fadd7e)) {
                var_3878ec49.var_a4fadd7e = var_3878ec49.origin;
            }
            if (var_3878ec49.targetname === "shelf_secondary_grenade_middle") {
                var_3878ec49.origin = var_3878ec49.var_a4fadd7e + s_info.var_a7adf514;
            }
            if (b_show) {
                var_3878ec49 show();
                continue;
            }
            var_3878ec49 hide();
        }
        break;
    case #"hash_6148898d5ac59179":
        break;
    case #"hash_777a08527f2da4e1":
        break;
    case #"specialgrenade":
        if (sessionmodeiszombiesgame()) {
            function_3a0a9f01(localclientnum, s_info, b_show, weapon, var_8a4ba442);
        }
        break;
    case #"talent3":
    case #"talent2":
    case #"talent1":
    case #"talent6":
    case #"talent5":
    case #"talent4":
    case #"talents":
    case #"perk5":
    case #"perk4":
    case #"perk6":
    case #"perk1":
    case #"perk3":
    case #"perk2":
        break;
    case #"bonuscard1":
        break;
    case #"gunsmith":
    case #"hash_2fda3f64c5caa89e":
        break;
    }
}

// Namespace customclass/custom_class
// Params 5, eflags: 0x2 linked
// Checksum 0xe0958167, Offset: 0x2678
// Size: 0x338
function function_3a0a9f01(localclientnum, s_info, b_show = 0, weapon, var_8a4ba442) {
    var_d74b0620 = getentarray(localclientnum, "hooks_secondary_weapon", "script_noteworthy");
    foreach (var_72ff5fa4 in var_d74b0620) {
        if (!isdefined(var_72ff5fa4.var_a4fadd7e)) {
            var_72ff5fa4.var_a4fadd7e = var_72ff5fa4.origin;
        }
        if (isdefined(var_72ff5fa4.targetname)) {
            switch (var_72ff5fa4.targetname) {
            case #"hooks_secondary_weapon_hook_left":
                var_72ff5fa4.origin = var_72ff5fa4.var_a4fadd7e + s_info.var_a5946026;
                break;
            case #"hooks_secondary_weapon_middle":
                var_72ff5fa4.origin = var_72ff5fa4.var_a4fadd7e + s_info.var_a7adf514;
                break;
            case #"hooks_secondary_weapon_hook_right":
                var_72ff5fa4.origin = var_72ff5fa4.var_a4fadd7e + s_info.var_36859b17;
                break;
            case #"hooks_secondary_weapon_plate_left":
                var_72ff5fa4.origin = var_72ff5fa4.var_a4fadd7e + (0, s_info.var_a5946026[1], s_info.var_a5946026[2]);
                break;
            case #"hooks_secondary_weapon_plate_right":
                var_72ff5fa4.origin = var_72ff5fa4.var_a4fadd7e + (0, s_info.var_36859b17[1], s_info.var_36859b17[2]);
                break;
            }
        }
        if (b_show) {
            if (weapon.weapclass === "pistol" || sessionmodeiszombiesgame() && var_8a4ba442 === #"specialgrenade") {
                if (var_72ff5fa4.targetname === "hooks_secondary_weapon_middle") {
                    var_72ff5fa4 show();
                } else {
                    var_72ff5fa4 hide();
                }
            } else if (var_72ff5fa4.targetname === "hooks_secondary_weapon_middle") {
                var_72ff5fa4 hide();
            } else {
                var_72ff5fa4 show();
            }
            continue;
        }
        var_72ff5fa4 hide();
    }
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0xf48fbc39, Offset: 0x29b8
// Size: 0xc4
function toggle_postfx(localclientnum, on_off, postfx) {
    player = function_5c10bd79(localclientnum);
    if (on_off && !player postfx::function_556665f2(postfx)) {
        player codeplaypostfxbundle(postfx);
        return;
    }
    if (!on_off && player postfx::function_556665f2(postfx)) {
        player codestoppostfxbundle(postfx);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x53642c16, Offset: 0x2a88
// Size: 0x84
function custom_class_init(localclientnum) {
    level.last_weapon_name[localclientnum] = "";
    level.var_8ad413c[localclientnum] = "";
    level.current_weapon[localclientnum] = undefined;
    level.var_6f87d12e[localclientnum] = [];
    level thread function_f1216c02(localclientnum);
    level thread custom_class_start_threads(localclientnum);
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x9092f863, Offset: 0x2b18
// Size: 0xac
function custom_class_start_threads(localclientnum) {
    level endon(#"disconnect");
    level thread function_13c748a(localclientnum);
    while (true) {
        level thread custom_class_update(localclientnum);
        level thread custom_class_closed(localclientnum);
        s_waitresult = level waittill("CustomClass_update" + localclientnum, "CustomClass_closed" + localclientnum);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0xd26dcda6, Offset: 0x2bd0
// Size: 0xce
function function_b4e01020(weapon) {
    result = undefined;
    foreach (attachment in weapon.attachments) {
        if (isdefined(result)) {
            result += "+" + attachment;
            continue;
        }
        result = attachment;
    }
    return isdefined(result) ? result : "";
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x27bb53ea, Offset: 0x2ca8
// Size: 0x70
function function_13c748a(localclientnum) {
    level endon(#"disconnect");
    while (true) {
        wait_result = level waittill(#"hash_6e24a55f8db9dad9");
        function_bfa844a3(localclientnum, wait_result.classindex);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x14ee8868, Offset: 0x2d20
// Size: 0x14e
function function_4aa0a8f6(var_ccf52c44) {
    switch (var_ccf52c44) {
    case #"primary":
    case #"specialgrenade":
    case #"secondary":
    case #"primarygrenade":
    case #"secondarygrenade":
        var_d8ebd573 = 1;
        break;
    case #"talent3":
    case #"talent2":
    case #"talent1":
    case #"talent6":
    case #"talent5":
    case #"talent4":
    case #"talent":
        var_d8ebd573 = 5;
        break;
    case #"bonuscard1":
        var_d8ebd573 = 6;
        break;
    case #"specialty":
        var_d8ebd573 = 3;
    default:
        var_d8ebd573 = 0;
        break;
    }
    return var_d8ebd573;
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0x98aace3f, Offset: 0x2e78
// Size: 0x11c
function function_de681e67(localclientnum, var_73cd9b6e, var_1eee7d73) {
    if (getdvarint(#"hash_1695a04291fbeb8b") == 1 && currentsessionmode() == 4) {
        return false;
    }
    var_163c9914 = isdefined(var_73cd9b6e) ? var_73cd9b6e : level.var_41c1f7b9;
    if (!isdefined(var_163c9914)) {
        var_163c9914 = 0;
        level.var_41c1f7b9 = 0;
    }
    itemindex = getloadoutitem(localclientnum, var_163c9914, #"bonuscard1");
    var_82e23366 = getunlockableiteminfofromindex(itemindex, function_4aa0a8f6(#"bonuscard1"));
    return var_82e23366.namehash === var_1eee7d73;
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0xee0c3291, Offset: 0x2fa0
// Size: 0x160
function function_902cfbde(var_85d87aca, var_8a4ba442) {
    if (var_8a4ba442 !== #"talent1" && var_8a4ba442 !== #"talent2" && var_8a4ba442 !== #"talent3" && var_8a4ba442 !== #"talent4" && var_8a4ba442 !== #"talent5" && var_8a4ba442 !== #"talent6") {
        return true;
    }
    switch (var_8a4ba442) {
    case #"talent4":
        var_8a4ba442 = #"talent1";
        break;
    case #"talent5":
        var_8a4ba442 = #"talent2";
        break;
    case #"talent6":
        var_8a4ba442 = #"talent3";
        break;
    }
    var_2a06d510 = function_60663bf8(var_85d87aca);
    if (var_8a4ba442 === var_2a06d510) {
        return true;
    }
    return false;
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x1eb1a00e, Offset: 0x3108
// Size: 0x1d4
function function_60663bf8(var_85d87aca) {
    if (isinarray(array(#"hash_35c80ca3d496436b", #"hash_5223a6478b827ae2", #"hash_2b8196a115a43717", #"hash_3c1acb367fc720b9", #"hash_771ac27519b59ae1"), hash(var_85d87aca))) {
        return #"talent1";
    }
    if (isinarray(array(#"hash_1f2871685383c0ce", #"hash_7ba3d840a075bb38", #"hash_27f40b888568660e", #"hash_5b36c90fb9767fbd", #"hash_7141f961caa3e322"), hash(var_85d87aca))) {
        return #"talent2";
    }
    if (isinarray(array(#"hash_36f90c4eff587435", #"hash_3a01bee9e73c5940", #"hash_2c45c89bceef41d1", #"hash_32e6e64c0881c14b", #"hash_320186f753bdd5fa"), hash(var_85d87aca))) {
        return #"talent3";
    }
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0xc3cd9102, Offset: 0x32e8
// Size: 0x94e
function function_3ca8f346(var_85d87aca, var_c7d83c08, localclientnum) {
    if (var_c7d83c08 === #"talents" || function_902cfbde(var_85d87aca, var_c7d83c08)) {
        switch (var_c7d83c08) {
        case #"talent1":
        case #"talents":
        case #"perk1":
            s_location = level.weapon_position[#"perk1"];
            break;
        case #"talent4":
            s_location = level.weapon_position[#"perk4"];
            break;
        case #"talent2":
        case #"perk2":
            s_location = level.weapon_position[#"perk2"];
            break;
        case #"talent5":
            s_location = level.weapon_position[#"perk5"];
            break;
        case #"talent3":
        case #"perk3":
            s_location = level.weapon_position[#"perk3"];
            break;
        case #"talent6":
            s_location = level.weapon_position[#"perk6"];
            break;
        }
    } else {
        var_6ff86e8e = function_60663bf8(var_85d87aca);
        if (var_6ff86e8e === #"talent1") {
            var_eafbab22 = function_9b2f2702(localclientnum, #"talent1");
            switch (var_eafbab22) {
            case 0:
            case 1:
                s_location = level.weapon_position[#"perk1"];
                break;
            case 2:
                if (is_true(level.var_4ef05eea)) {
                    if (var_c7d83c08 === #"talent2") {
                        if (function_2d8c38e7(localclientnum, #"talent1")) {
                            s_location = level.weapon_position[#"perk1"];
                        } else {
                            s_location = level.weapon_position[#"hash_1e3b6d1c50127b6d"];
                        }
                    } else {
                        s_location = level.weapon_position[#"hash_1e3b6d1c50127b6d"];
                    }
                } else {
                    s_location = level.weapon_position[#"hash_1e3b6d1c50127b6d"];
                }
                break;
            case 3:
                if (var_c7d83c08 === #"talent2") {
                    s_location = level.weapon_position[#"hash_1e3b6d1c50127b6d"];
                } else if (var_c7d83c08 === #"talent3") {
                    s_location = level.weapon_position[#"hash_75a53afe5fb30f2c"];
                }
                break;
            }
        } else if (var_6ff86e8e === #"talent2") {
            var_d850ddbd = function_9b2f2702(localclientnum, #"talent2");
            switch (var_d850ddbd) {
            case 0:
            case 1:
                s_location = level.weapon_position[#"perk2"];
                break;
            case 2:
                if (is_true(level.var_4ef05eea)) {
                    if (var_c7d83c08 === #"talent1") {
                        if (function_2d8c38e7(localclientnum, #"talent2")) {
                            s_location = level.weapon_position[#"perk2"];
                        } else {
                            s_location = level.weapon_position[#"hash_27460ccf4582b502"];
                        }
                    } else {
                        s_location = level.weapon_position[#"hash_551e597e4fcfe0e4"];
                    }
                } else {
                    s_location = level.weapon_position[#"hash_27460ccf4582b502"];
                }
                break;
            case 3:
                if (var_c7d83c08 === #"talent1") {
                    s_location = level.weapon_position[#"hash_27460ccf4582b502"];
                } else if (var_c7d83c08 === #"talent3") {
                    s_location = level.weapon_position[#"hash_551e597e4fcfe0e4"];
                }
                break;
            }
        } else if (var_6ff86e8e === #"talent3") {
            var_ae24783c = function_9b2f2702(localclientnum, #"talent3");
            switch (var_ae24783c) {
            case 0:
            case 1:
                s_location = level.weapon_position[#"perk3"];
                break;
            case 2:
                if (is_true(level.var_4ef05eea)) {
                    if (var_c7d83c08 === #"talent1") {
                        if (function_2d8c38e7(localclientnum, #"talent3")) {
                            s_location = level.weapon_position[#"perk3"];
                        } else {
                            s_location = level.weapon_position[#"hash_344ad3ebce2569"];
                        }
                    } else {
                        s_location = level.weapon_position[#"hash_3c0f3d3aa7135e86"];
                    }
                } else {
                    s_location = level.weapon_position[#"hash_344ad3ebce2569"];
                }
                break;
            case 3:
                if (var_c7d83c08 === #"talent1") {
                    s_location = level.weapon_position[#"hash_344ad3ebce2569"];
                } else if (var_c7d83c08 === #"talent2") {
                    s_location = level.weapon_position[#"hash_3c0f3d3aa7135e86"];
                }
                break;
            }
        }
    }
    if (!isdefined(s_location)) {
        switch (var_c7d83c08) {
        case #"talent1":
        case #"talents":
        case #"perk1":
            s_location = level.weapon_position[#"perk1"];
            break;
        case #"talent4":
            s_location = level.weapon_position[#"perk4"];
            break;
        case #"talent2":
        case #"perk2":
            s_location = level.weapon_position[#"perk2"];
            break;
        case #"talent5":
            s_location = level.weapon_position[#"perk5"];
            break;
        case #"talent3":
        case #"perk3":
            s_location = level.weapon_position[#"perk3"];
            break;
        case #"talent6":
            s_location = level.weapon_position[#"perk6"];
            break;
        }
    }
    return s_location;
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0xaccd2d96, Offset: 0x3c40
// Size: 0x1b8
function function_b8990106(*localclientnum, var_8a4ba442, var_b078b50b) {
    if (var_8a4ba442 === #"primary" || var_8a4ba442 === #"secondary") {
        if (isweapon(var_b078b50b)) {
            weapon = var_b078b50b;
        } else {
            weapon = getweapon(var_b078b50b);
        }
        if ((weapon.weapclass === #"pistol" || weapon.weapclass === #"spread" || weapon.weapclass === #"melee" || function_cc770c92(weapon)) && var_8a4ba442 === #"secondary") {
            return true;
        } else if (weapon.weapclass !== #"pistol" && weapon.weapclass !== #"spread" && weapon.weapclass !== #"melee" && !function_cc770c92(weapon) && var_8a4ba442 === #"primary") {
            return true;
        }
        return false;
    }
    return true;
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0x5c907556, Offset: 0x3e00
// Size: 0x96c
function function_bfa844a3(localclientnum, var_73cd9b6e) {
    level.var_41c1f7b9 = var_73cd9b6e;
    var_9d78be26 = function_e2ae0e9(localclientnum, var_73cd9b6e);
    function_295788f(localclientnum, var_73cd9b6e);
    function_3459b4ec(localclientnum, var_73cd9b6e);
    var_674329bc = array(#"primary", #"secondary", #"primarygrenade", #"secondarygrenade", #"specialgrenade", #"talent1", #"talent2", #"talent3", #"talent4", #"talent5", #"talent6", #"bonuscard1", #"hash_c70e59dba98cf81", #"talent", #"hash_6535e34e6169957e", #"specialty", #"weaponcategories");
    foreach (var_8a4ba442 in var_674329bc) {
        if (isdefined(level.weapon_script_model[localclientnum][var_8a4ba442])) {
            level.weapon_script_model[localclientnum][var_8a4ba442] delete();
        }
        if (isdefined(level.preload_weapon_model[localclientnum][var_8a4ba442])) {
            level.preload_weapon_model[localclientnum][var_8a4ba442] delete();
        }
        if (var_8a4ba442 == #"primary" || var_8a4ba442 == #"secondary") {
            var_a268e5c4 = function_56ee17d3(localclientnum, var_73cd9b6e, var_8a4ba442);
            var_415dfdfa = function_9b2b16f3(localclientnum, var_73cd9b6e, var_8a4ba442);
            weapon = var_a268e5c4.weapon;
            function_cd5b2d74(localclientnum, var_8a4ba442, var_a268e5c4.blueprintindex);
            function_9d6867fc(localclientnum, var_8a4ba442, var_a268e5c4.var_7bdeac73);
            function_93e332c2(localclientnum, var_8a4ba442, var_a268e5c4.var_fd90b0bb);
            if (var_8a4ba442 == #"primary") {
                camo_index = getloadoutitem(localclientnum, var_73cd9b6e, #"primarycamo");
                var_571f2574 = getloadoutitem(localclientnum, var_73cd9b6e, #"primarycharm");
            } else {
                camo_index = getloadoutitem(localclientnum, var_73cd9b6e, #"secondarycamo");
                var_571f2574 = getloadoutitem(localclientnum, var_73cd9b6e, #"secondarycharm");
            }
            function_3a1dd26(localclientnum, var_8a4ba442, camo_index);
            function_162e1121(localclientnum, var_8a4ba442, var_571f2574);
            function_15cbf06e(localclientnum, var_8a4ba442, var_415dfdfa);
        } else {
            itemindex = getloadoutitem(localclientnum, var_73cd9b6e, var_8a4ba442);
            var_82e23366 = getunlockableiteminfofromindex(itemindex, function_4aa0a8f6(var_8a4ba442));
            if (isdefined(var_82e23366.namehash) && (var_8a4ba442 == #"primarygrenade" || var_8a4ba442 == #"secondarygrenade" || sessionmodeiszombiesgame() && var_8a4ba442 === #"specialgrenade")) {
                weapon = getweapon(var_82e23366.namehash);
            } else {
                var_438da649 = function_b143666d(itemindex, function_4aa0a8f6(var_8a4ba442));
                model_name = isdefined(var_438da649.previewmodelname) ? var_438da649.previewmodelname : #"";
                var_95970e62 = isdefined(var_438da649.previewmodelscale) ? var_438da649.previewmodelscale : 1;
                weapon = level.weaponnone;
                if (sessionmodeiszombiesgame() && isinarray(array(#"talent", #"hash_6535e34e6169957e", #"specialty", #"weaponcategories"), var_8a4ba442)) {
                    var_63c40edf = function_eeb5c6a3(localclientnum, var_73cd9b6e, var_8a4ba442);
                    model_name = var_63c40edf.model_name;
                    var_95970e62 = var_63c40edf.var_95970e62;
                    weapon = var_63c40edf.weapon;
                }
                if (var_8a4ba442 === #"hash_c70e59dba98cf81") {
                    var_1ddeac01 = function_c4dc1c55(localclientnum);
                    var_581f4066 = createuimodel(function_1df4c3b0(localclientnum, #"hash_bc2ca28342ad622"), "wristAccessory");
                    setuimodelvalue(var_581f4066, isdefined(level.var_95471a83[var_1ddeac01]) ? level.var_95471a83[var_1ddeac01] : #"");
                    model_name = function_3b43bbae(level.var_95471a83[var_1ddeac01]);
                    var_95970e62 = 1;
                    weapon = level.weaponnone;
                }
            }
        }
        s_position = function_1cd1374d(weapon, var_8a4ba442, undefined, localclientnum, model_name);
        level.weapon_script_model[localclientnum][var_8a4ba442] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
        level.preload_weapon_model[localclientnum][var_8a4ba442] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
        level.preload_weapon_model[localclientnum][var_8a4ba442] hide();
        toggle_locked_weapon_shader(localclientnum, 1, var_8a4ba442);
        update_weapon_script_model(localclientnum, weapon.name, function_b4e01020(weapon), undefined, 1, var_95970e62, model_name, var_8a4ba442);
        level.weapon_script_model[localclientnum][var_8a4ba442].origin = s_position.origin;
        level.weapon_script_model[localclientnum][var_8a4ba442].angles = s_position.angles;
        if (var_8a4ba442 === #"hash_c70e59dba98cf81") {
            function_bb082ae7(localclientnum);
        }
        function_89f7e68e(localclientnum, var_73cd9b6e, var_8a4ba442, weapon, var_9d78be26);
    }
    function_a4cbc5a8(localclientnum);
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0xe869b396, Offset: 0x4778
// Size: 0x3c
function function_bb082ae7(localclientnum) {
    level.weapon_script_model[localclientnum][#"hash_c70e59dba98cf81"] function_2591c25b();
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0xff7e2ad3, Offset: 0x47c0
// Size: 0x1ac
function function_370fbe8f(localclientnum, fxname) {
    level notify("update_wrist_accessory_fx" + localclientnum);
    level endon(#"disconnect", "CustomClass_closed" + localclientnum, "update_wrist_accessory_fx" + localclientnum);
    if (!isdefined(level.var_a5f6ff9b) && !isdefined(fxname)) {
        return;
    }
    if (isdefined(level.var_a5f6ff9b)) {
        killfx(localclientnum, level.var_a5f6ff9b);
        level.var_a5f6ff9b = undefined;
    }
    var_1d8d8e4 = level.weapon_script_model[localclientnum][#"hash_c70e59dba98cf81"];
    for (timeout = 0; isdefined(var_1d8d8e4) && !var_1d8d8e4 function_e56f5549() && timeout < 5; timeout += 0.016) {
        waitframe(1);
    }
    if (!isdefined(var_1d8d8e4) || timeout >= 5) {
        return;
    }
    if (isdefined(fxname) && var_1d8d8e4 haspart(localclientnum, "tag_watch_fx")) {
        level.var_a5f6ff9b = function_239993de(localclientnum, fxname, var_1d8d8e4, "tag_watch_fx");
    }
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x6 linked
// Checksum 0xa8c4ddcb, Offset: 0x4978
// Size: 0x24c
function private function_eeb5c6a3(localclientnum, var_73cd9b6e, var_8a4ba442) {
    switch (var_8a4ba442) {
    case #"talent":
        model_name = #"hash_38a866dab595a9f6";
        var_95970e62 = 0.65;
        weapon = level.weaponnone;
        break;
    case #"hash_6535e34e6169957e":
        itemindex = getloadoutitem(localclientnum, var_73cd9b6e, #"specialgrenade");
        var_82e23366 = getunlockableiteminfofromindex(itemindex, function_4aa0a8f6(#"specialgrenade"));
        if (isdefined(var_82e23366.namehash)) {
            weapon = getweapon(var_82e23366.namehash);
        } else {
            weapon = level.weaponnone;
        }
        model_name = #"";
        var_95970e62 = 0.9;
        break;
    case #"specialty":
        model_name = #"hash_15c8d8d59a771d41";
        var_95970e62 = 1.8;
        weapon = level.weaponnone;
        break;
    case #"weaponcategories":
        model_name = #"hash_3935e5f9f62638a9";
        var_95970e62 = 1;
        weapon = level.weaponnone;
        break;
    default:
        model_name = #"";
        var_95970e62 = 1;
        weapon = level.weaponnone;
        break;
    }
    return {#model_name:model_name, #var_95970e62:var_95970e62, #weapon:isdefined(weapon) ? weapon : level.weaponnone};
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x30a72183, Offset: 0x4bd0
// Size: 0x8d4
function function_a4cbc5a8(localclientnum) {
    if (sessionmodeiszombiesgame()) {
        level.var_da0b979c[#"rare"][localclientnum] = stats::get_stat(localclientnum, #"hash_65febbdf3f1ab4d7", #"rare") - stats::function_7f413ae3(localclientnum, 0, #"hash_51b649399e73640c", #"rare");
        level.var_da0b979c[#"epic"][localclientnum] = stats::get_stat(localclientnum, #"hash_65febbdf3f1ab4d7", #"epic") - stats::function_7f413ae3(localclientnum, 0, #"hash_51b649399e73640c", #"epic");
        level.var_da0b979c[#"legendary"][localclientnum] = stats::get_stat(localclientnum, #"hash_65febbdf3f1ab4d7", #"legendary") - stats::function_7f413ae3(localclientnum, 0, #"hash_51b649399e73640c", #"legendary");
        if (level.var_da0b979c[#"legendary"][localclientnum] > 0) {
            if (!isdefined(level.var_9543e4da[#"legendary"][localclientnum])) {
                var_d2ee34ea = struct::get(#"cac_zm_weapon_position_crystal_legendary");
                level.var_9543e4da[#"legendary"][localclientnum] = util::spawn_model(localclientnum, var_d2ee34ea.model, var_d2ee34ea.origin, var_d2ee34ea.angles);
                forcestreamxmodel(level.var_9543e4da[#"legendary"][localclientnum].model);
                level.var_9543e4da[#"legendary"][localclientnum] setscale(isdefined(var_d2ee34ea.modelscale) ? var_d2ee34ea.modelscale : 1);
            }
            level.var_9543e4da[#"legendary"][localclientnum] sethighdetail(level.var_636c2236, level.var_636c2236);
        } else if (isdefined(level.var_9543e4da[#"legendary"][localclientnum])) {
            stopforcestreamingxmodel(level.var_9543e4da[#"legendary"][localclientnum].model);
            if (isdefined(level.var_9543e4da[#"legendary"][localclientnum])) {
                level.var_9543e4da[#"legendary"][localclientnum] delete();
            }
        }
        if (level.var_da0b979c[#"epic"][localclientnum] > 0) {
            if (!isdefined(level.var_9543e4da[#"epic"][localclientnum])) {
                var_d2ee34ea = struct::get(#"cac_zm_weapon_position_crystal_epic");
                level.var_9543e4da[#"epic"][localclientnum] = util::spawn_model(localclientnum, var_d2ee34ea.model, var_d2ee34ea.origin, var_d2ee34ea.angles);
                forcestreamxmodel(level.var_9543e4da[#"epic"][localclientnum].model);
                level.var_9543e4da[#"epic"][localclientnum] setscale(isdefined(var_d2ee34ea.modelscale) ? var_d2ee34ea.modelscale : 1);
            }
            level.var_9543e4da[#"epic"][localclientnum] sethighdetail(level.var_636c2236, level.var_636c2236);
        } else if (isdefined(level.var_9543e4da[#"epic"][localclientnum])) {
            stopforcestreamingxmodel(level.var_9543e4da[#"epic"][localclientnum].model);
            if (isdefined(level.var_9543e4da[#"epic"][localclientnum])) {
                level.var_9543e4da[#"epic"][localclientnum] delete();
            }
        }
        if (level.var_da0b979c[#"rare"][localclientnum] > 0) {
            if (!isdefined(level.var_9543e4da[#"rare"][localclientnum])) {
                var_d2ee34ea = struct::get(#"cac_zm_weapon_position_crystal_rare");
                level.var_9543e4da[#"rare"][localclientnum] = util::spawn_model(localclientnum, var_d2ee34ea.model, var_d2ee34ea.origin, var_d2ee34ea.angles);
                forcestreamxmodel(level.var_9543e4da[#"rare"][localclientnum].model);
                level.var_9543e4da[#"rare"][localclientnum] setscale(isdefined(var_d2ee34ea.modelscale) ? var_d2ee34ea.modelscale : 1);
            }
            level.var_9543e4da[#"rare"][localclientnum] sethighdetail(level.var_636c2236, level.var_636c2236);
        } else if (isdefined(level.var_9543e4da[#"rare"][localclientnum])) {
            stopforcestreamingxmodel(level.var_9543e4da[#"rare"][localclientnum].model);
            if (isdefined(level.var_9543e4da[#"rare"][localclientnum])) {
                level.var_9543e4da[#"rare"][localclientnum] delete();
            }
        }
        return;
    }
    if (isarray(level.var_9543e4da)) {
        foreach (var_2c9c153d in level.var_9543e4da) {
            if (isdefined(var_2c9c153d[localclientnum])) {
                stopforcestreamingxmodel(var_2c9c153d[localclientnum].model);
                var_2c9c153d[localclientnum] delete();
            }
        }
        arrayremovevalue(level.var_9543e4da, undefined, 1);
    }
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0xf299e3a, Offset: 0x54b0
// Size: 0x2e4
function function_f1216c02(localclientnum, var_8a4ba442, str_rarity) {
    self notify("18582112b5a71f57");
    self endon("18582112b5a71f57");
    if (!isdefined(level.var_5caba701)) {
        level.var_5caba701 = getent(localclientnum, "weapon_inspect_background", "targetname");
    }
    if (isdefined(level.var_5caba701)) {
        if (var_8a4ba442 === #"hash_2fda3f64c5caa89e" && isdefined(str_rarity)) {
            switch (str_rarity) {
            case #"common":
                level.var_5caba701 setmodel(#"hash_51509bca11193d23");
                break;
            case #"rare":
                level.var_5caba701 setmodel(#"hash_2b0eedcc679987aa");
                break;
            case #"epic":
                level.var_5caba701 setmodel(#"hash_bf3c9901e4c8d2b");
                break;
            case #"legendary":
                level.var_5caba701 setmodel(#"hash_34c777340cfd101f");
                break;
            case #"ultra":
                level.var_5caba701 setmodel(#"hash_6e1193289746f2cc");
                break;
            default:
                level.var_5caba701 setmodel(#"hash_26cca5441781d97");
                break;
            }
            level.var_5caba701 function_2649d965(1);
            level.var_5caba701 hide();
            while (!level.var_5caba701 function_e56f5549()) {
                waitframe(1);
            }
            level.var_5caba701 show();
        } else {
            level.var_5caba701 hide();
        }
        level.var_5caba701 function_2649d965(0);
    }
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0x57befb3d, Offset: 0x57a0
// Size: 0x94
function function_e2ae0e9(localclientnum, var_73cd9b6e) {
    var_33257025 = 0;
    var_4cda8464 = function_de681e67(localclientnum, isdefined(var_73cd9b6e) ? var_73cd9b6e : level.var_41c1f7b9, #"hash_4a12859000892dda");
    if (var_4cda8464 !== level.var_256be2c9) {
        var_33257025 = 1;
    }
    level.var_256be2c9 = var_4cda8464;
    return var_33257025;
}

// Namespace customclass/custom_class
// Params 5, eflags: 0x2 linked
// Checksum 0xd39756c5, Offset: 0x5840
// Size: 0x520
function function_89f7e68e(localclientnum, var_c70fb4f3, var_8a4ba442, weapon, var_5405cbdb = 0) {
    if (var_8a4ba442 === #"primarygrenade" || var_8a4ba442 === #"secondarygrenade") {
        var_674329bc = array(var_8a4ba442);
    } else if (var_8a4ba442 === #"bonuscard1" && var_5405cbdb) {
        var_674329bc = array(#"primarygrenade", #"secondarygrenade");
    } else {
        return;
    }
    foreach (var_8a4ba442 in var_674329bc) {
        if ((ishash(weapon) || isstring(weapon)) && weapon != "") {
            weapon = getweapon(weapon);
        } else if (!isdefined(weapon) || weapon === level.weaponnone || weapon === "") {
            itemindex = getloadoutitem(localclientnum, isdefined(var_c70fb4f3) ? var_c70fb4f3 : level.var_41c1f7b9, var_8a4ba442);
            var_82e23366 = getunlockableiteminfofromindex(itemindex, function_4aa0a8f6(var_8a4ba442));
            if (isdefined(var_82e23366) && isdefined(var_82e23366.namehash) && (var_8a4ba442 == #"primarygrenade" || var_8a4ba442 == #"secondarygrenade")) {
                weapon = getweapon(var_82e23366.namehash);
            } else {
                weapon = level.weaponnone;
            }
        }
        var_4342bc54 = function_bf9f3492(var_8a4ba442);
        if (isdefined(var_4342bc54)) {
            if (isdefined(level.weapon_script_model[localclientnum][var_4342bc54])) {
                level.weapon_script_model[localclientnum][var_4342bc54] delete();
            }
            if (isdefined(level.preload_weapon_model[localclientnum][var_4342bc54])) {
                level.preload_weapon_model[localclientnum][var_4342bc54] delete();
            }
            settings = function_34668e22(weapon);
            var_d5a66a55 = level.weaponnone;
            if (!is_true(settings.var_d1e947c6) && level.var_256be2c9) {
                var_d5a66a55 = weapon;
            }
            s_position = function_1cd1374d(var_d5a66a55, var_4342bc54, undefined, localclientnum);
            level.weapon_script_model[localclientnum][var_4342bc54] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
            level.preload_weapon_model[localclientnum][var_4342bc54] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
            level.preload_weapon_model[localclientnum][var_4342bc54] hide();
            toggle_locked_weapon_shader(localclientnum, 1, var_4342bc54);
            update_weapon_script_model(localclientnum, var_d5a66a55.name, function_b4e01020(var_d5a66a55), undefined, 1, undefined, undefined, var_4342bc54);
            level.weapon_script_model[localclientnum][var_4342bc54].origin = s_position.origin;
            level.weapon_script_model[localclientnum][var_4342bc54].angles = s_position.angles;
            weapon = undefined;
        }
    }
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0xf67b3220, Offset: 0x5d68
// Size: 0xb0
function function_831397a7(localclientnum, var_bfa844a3) {
    level.var_636c2236 = 1;
    if (var_bfa844a3) {
        var_14bec5d2 = 0;
        var_c8a42ec = isdefined(level.var_41c1f7b9) ? level.var_41c1f7b9 : var_14bec5d2;
        var_c8a42ec = var_c8a42ec < 11 ? var_c8a42ec : var_14bec5d2;
        function_bfa844a3(localclientnum, var_c8a42ec);
    }
    [[ level.var_1c43dd3e ]]->function_39a68bf2();
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0xfaa6cb6e, Offset: 0x5e20
// Size: 0x1c4
function function_415febc4(localclientnum) {
    level.var_636c2236 = 0;
    level.var_64ee434 = undefined;
    level.var_908d7e4d = undefined;
    if (isdefined(level.weapon_script_model[localclientnum]) && !function_df656039(localclientnum)) {
        foreach (__, model in level.weapon_script_model[localclientnum]) {
            if (isdefined(model)) {
                model hide();
            }
        }
    }
    if (isdefined(level.preload_weapon_model[localclientnum]) && !function_df656039(localclientnum)) {
        foreach (model in level.preload_weapon_model[localclientnum]) {
            if (isdefined(model)) {
                model hide();
            }
        }
    }
    function_a4cbc5a8(localclientnum);
    level thread function_f1216c02(localclientnum);
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x8a90cf0b, Offset: 0x5ff0
// Size: 0x68
function function_df656039(localclientnum) {
    if (namespace_d5a9ff55::is_current_menu(localclientnum, "PressStart", #"scorestreaks") || namespace_d5a9ff55::is_current_menu(localclientnum, "PressStart", #"hash_7da890f2771b41af")) {
        return true;
    }
    return false;
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x6f39271, Offset: 0x6060
// Size: 0xb2c
function custom_class_update(localclientnum) {
    level endon(#"disconnect", "CustomClass_closed" + localclientnum);
    waitresult = level waittill("CustomClass_update" + localclientnum);
    base_weapon_slot = waitresult.base_weapon_slot;
    level.var_3f5552f9[localclientnum] = base_weapon_slot;
    var_f0bf9259 = waitresult.weapon;
    attachments = waitresult.attachments;
    var_77da4058 = waitresult.var_77da4058;
    weapon_options_param = waitresult.options;
    is_item_unlocked = waitresult.is_item_unlocked;
    xmodel_name = waitresult.xmodel_name;
    xmodel_scale = waitresult.xmodel_scale;
    var_cc6c0ec0 = waitresult.var_8d4568cf;
    var_f2af4049 = waitresult.var_820bb448;
    str_rarity = waitresult.rarity;
    if (base_weapon_slot === #"gunsmith") {
        var_e81ceea = waitresult.attachment_group;
    }
    level thread function_f1216c02(localclientnum, base_weapon_slot, str_rarity);
    if (!isdefined(is_item_unlocked)) {
        is_item_unlocked = 1;
    }
    if (!isdefined(xmodel_scale)) {
        xmodel_scale = 1;
    }
    if (!isdefined(xmodel_name)) {
        xmodel_name = #"";
    }
    if (!isdefined(attachments)) {
        attachments = "";
    }
    var_6870002c = "";
    if (isdefined(var_77da4058)) {
        attachmentinfo = strtok(var_77da4058, ",");
        if (attachmentinfo.size > 0) {
            attachments = attachmentinfo[0];
            var_6870002c = attachmentinfo[1];
        }
    }
    if (base_weapon_slot !== #"gunsmith" && isdefined(level.weapon_script_model[localclientnum][#"gunsmith"])) {
        level.weapon_script_model[localclientnum][#"gunsmith"] forcedelete();
        if (isdefined(level.preload_weapon_model[localclientnum][#"gunsmith"])) {
            level.preload_weapon_model[localclientnum][#"gunsmith"] delete();
        }
        arrayremovevalue(level.weapon_script_model[localclientnum], undefined, 1);
    }
    if (base_weapon_slot !== #"hash_2fda3f64c5caa89e" && isdefined(level.weapon_script_model[localclientnum][#"hash_2fda3f64c5caa89e"])) {
        function_2dab3077(localclientnum);
        level.weapon_script_model[localclientnum][#"hash_2fda3f64c5caa89e"] forcedelete();
        if (isdefined(level.preload_weapon_model[localclientnum][#"hash_2fda3f64c5caa89e"])) {
            level.preload_weapon_model[localclientnum][#"hash_2fda3f64c5caa89e"] delete();
        }
        arrayremovevalue(level.weapon_script_model[localclientnum], undefined, 1);
    }
    if (base_weapon_slot !== #"charm" && isdefined(level.weapon_script_model[localclientnum][#"charm"])) {
        level.weapon_script_model[localclientnum][#"charm"] forcedelete();
        if (isdefined(level.preload_weapon_model[localclientnum][#"charm"])) {
            level.preload_weapon_model[localclientnum][#"charm"] delete();
        }
        arrayremovevalue(level.weapon_script_model[localclientnum], undefined, 1);
    }
    if (base_weapon_slot !== #"stickers" && isdefined(level.weapon_script_model[localclientnum][#"stickers"])) {
        level.weapon_script_model[localclientnum][#"stickers"] forcedelete();
        if (isdefined(level.preload_weapon_model[localclientnum][#"stickers"])) {
            level.preload_weapon_model[localclientnum][#"stickers"] delete();
        }
        arrayremovevalue(level.weapon_script_model[localclientnum], undefined, 1);
    }
    if (isdefined(var_f0bf9259)) {
        if (isdefined(weapon_options_param) && weapon_options_param != "none") {
            function_998e2be7(localclientnum, base_weapon_slot, weapon_options_param, var_6870002c);
        }
        var_88cd6325 = getweapon(var_f0bf9259, strtok(attachments, "+"));
        s_position = function_1cd1374d(var_88cd6325, base_weapon_slot, var_e81ceea, localclientnum, xmodel_name);
        if (!isdefined(level.weapon_script_model[localclientnum][base_weapon_slot])) {
            level.weapon_script_model[localclientnum][base_weapon_slot] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
            level.preload_weapon_model[localclientnum][base_weapon_slot] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
            level.preload_weapon_model[localclientnum][base_weapon_slot] hide();
            if (base_weapon_slot === #"hash_c70e59dba98cf81") {
                function_bb082ae7(localclientnum);
            }
        }
        toggle_locked_weapon_shader(localclientnum, is_item_unlocked, base_weapon_slot);
        update_weapon_script_model(localclientnum, var_f0bf9259, attachments, undefined, is_item_unlocked, xmodel_scale, xmodel_name, base_weapon_slot, var_e81ceea);
        level.weapon_script_model[localclientnum][base_weapon_slot].origin = s_position.origin;
        level.weapon_script_model[localclientnum][base_weapon_slot].angles = s_position.angles;
        var_9d78be26 = function_e2ae0e9(localclientnum);
        function_89f7e68e(localclientnum, undefined, base_weapon_slot, var_f0bf9259, var_9d78be26);
        if (base_weapon_slot === #"gunsmith") {
            function_f87ec9a8(var_e81ceea, var_f0bf9259, var_f2af4049);
        } else if (base_weapon_slot === #"hash_2fda3f64c5caa89e") {
            function_f87ec9a8(var_e81ceea, var_f0bf9259, 0, base_weapon_slot);
            var_ef88e3c8 = function_fa001ebb(level.current_weapon[localclientnum]);
            level.weapon_script_model[localclientnum][base_weapon_slot].origin = level.weapon_script_model[localclientnum][base_weapon_slot].origin + var_ef88e3c8.origin;
            level.weapon_script_model[localclientnum][base_weapon_slot].angles = var_ef88e3c8.angles;
            function_ad3c0759(localclientnum, level.weapon_script_model[localclientnum][base_weapon_slot], var_ef88e3c8.rotationoffset, 0, 0);
            level.weapon_script_model[localclientnum][base_weapon_slot] show();
        } else if (base_weapon_slot === #"charm" || base_weapon_slot === #"stickers") {
            function_f87ec9a8(var_e81ceea, var_f0bf9259, 0, base_weapon_slot);
        } else {
            function_d39cd2b5(base_weapon_slot, var_f0bf9259, var_cc6c0ec0, var_f2af4049, localclientnum);
        }
        if (getdvarint(#"hash_1695a04291fbeb8b") == 0 || currentsessionmode() != 4) {
            function_2a14a545(localclientnum, base_weapon_slot);
        }
        if (base_weapon_slot === #"hash_2fda3f64c5caa89e") {
            toggle_postfx(localclientnum, 0, #"hash_7538956e47d44e4f");
        } else {
            toggle_postfx(localclientnum, 1, #"hash_7538956e47d44e4f");
        }
        function_36b453c7(localclientnum, base_weapon_slot, var_f0bf9259);
        function_a4cbc5a8(localclientnum);
        setallowxcamrightstickrotation(localclientnum, !namespace_d5a9ff55::is_current_menu(localclientnum, "Paintshop"));
        return;
    }
    function_d39cd2b5(undefined, undefined, var_cc6c0ec0, var_f2af4049, localclientnum);
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0x2b90ba64, Offset: 0x6b98
// Size: 0x94
function function_3459b4ec(localclientnum, var_73cd9b6e) {
    var_56538315 = 0;
    var_a268b2c7 = function_de681e67(localclientnum, isdefined(var_73cd9b6e) ? var_73cd9b6e : level.var_41c1f7b9, #"hash_639ebbcda56447e7");
    if (var_a268b2c7 !== level.var_311aa2a1) {
        var_56538315 = 1;
    }
    level.var_311aa2a1 = var_a268b2c7;
    return var_56538315;
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0x981f0bce, Offset: 0x6c38
// Size: 0x94
function function_295788f(localclientnum, var_73cd9b6e) {
    var_b8898be5 = 0;
    var_f4a53b60 = function_de681e67(localclientnum, isdefined(var_73cd9b6e) ? var_73cd9b6e : level.var_41c1f7b9, #"bonuscard_perk_1_greed");
    if (var_f4a53b60 !== level.var_24d6a6a6) {
        var_b8898be5 = 1;
    }
    level.var_24d6a6a6 = var_f4a53b60;
    return var_b8898be5;
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0x72669309, Offset: 0x6cd8
// Size: 0x1ec
function function_9b2f2702(localclientnum, var_f353d605) {
    n_count = 0;
    var_93cfce18 = array(#"talent1", #"talent2", #"talent3", #"talent4", #"talent5", #"talent6");
    foreach (var_d4c489c0 in var_93cfce18) {
        itemindex = getloadoutitem(localclientnum, isdefined(level.var_41c1f7b9) ? level.var_41c1f7b9 : 0, var_d4c489c0);
        var_82e23366 = getunlockableiteminfofromindex(itemindex, 5);
        var_438da649 = function_b143666d(itemindex, 5);
        str_model_name = isdefined(var_438da649.previewmodelname) ? var_438da649.previewmodelname : #"";
        if (var_82e23366.loadoutslotname === var_f353d605) {
            n_count++;
        }
    }
    return n_count;
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0xaf1d68d0, Offset: 0x6ed0
// Size: 0x1e4
function function_2d8c38e7(localclientnum, var_6ff86e8e) {
    var_3b263c75 = 0;
    var_93cfce18 = array(#"talent1", #"talent2", #"talent3");
    foreach (var_ccf52c44 in var_93cfce18) {
        itemindex = getloadoutitem(localclientnum, isdefined(level.var_41c1f7b9) ? level.var_41c1f7b9 : 0, var_ccf52c44);
        var_82e23366 = getunlockableiteminfofromindex(itemindex, 5);
        var_438da649 = function_b143666d(itemindex, 5);
        var_85d87aca = isdefined(var_438da649.previewmodelname) ? var_438da649.previewmodelname : #"";
        if (var_82e23366.loadoutslotname === var_6ff86e8e && var_82e23366.loadoutslotname !== var_ccf52c44) {
            var_3b263c75++;
        }
    }
    if (var_3b263c75 == 2) {
        return true;
    }
    return false;
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0xacce2539, Offset: 0x70c0
// Size: 0x114
function function_2a14a545(localclientnum, var_2463e2c7) {
    var_201d8bfd = function_295788f(localclientnum);
    var_a33543de = function_3459b4ec(localclientnum);
    var_b0f8ce54 = array(#"talents", #"bonuscard1", #"talent1", #"talent2", #"talent3");
    if (isinarray(var_b0f8ce54, hash(var_2463e2c7)) || var_201d8bfd || var_a33543de) {
        function_eac2ccd9(localclientnum, var_2463e2c7);
    }
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0x6d8c72da, Offset: 0x71e0
// Size: 0x14e
function function_eac2ccd9(localclientnum, var_2463e2c7) {
    if (var_2463e2c7 === #"talents" || var_2463e2c7 === #"bonuscard1") {
        level.var_4ef05eea = 1;
    }
    function_9aba5d9(localclientnum, level.var_41c1f7b9, #"talent1", var_2463e2c7);
    function_9aba5d9(localclientnum, level.var_41c1f7b9, #"talent2", var_2463e2c7);
    function_9aba5d9(localclientnum, level.var_41c1f7b9, #"talent3", var_2463e2c7);
    function_9aba5d9(localclientnum, level.var_41c1f7b9, #"talent4");
    function_9aba5d9(localclientnum, level.var_41c1f7b9, #"talent5");
    function_9aba5d9(localclientnum, level.var_41c1f7b9, #"talent6");
    level.var_4ef05eea = undefined;
}

// Namespace customclass/custom_class
// Params 4, eflags: 0x2 linked
// Checksum 0x74ec47d6, Offset: 0x7338
// Size: 0x8bc
function function_9aba5d9(localclientnum, var_c70fb4f3, var_297c7602, var_2463e2c7) {
    var_93cfce18 = array(#"talent1", #"talent2", #"talent3", #"talent4", #"talent5", #"talent6");
    if (!isdefined(var_297c7602) || !isinarray(var_93cfce18, hash(var_297c7602))) {
        return;
    }
    if (var_297c7602 === var_2463e2c7) {
        switch (var_2463e2c7) {
        case #"talent1":
            var_db816009 = level.weapon_script_model[localclientnum][#"talent2"];
            if (isdefined(var_db816009) && function_9b2f2702(localclientnum, #"talent1") <= 1 && function_3ca8f346(var_db816009.model, var_297c7602, localclientnum) === level.weapon_position[#"perk1"]) {
                var_db816009 hide();
            }
            var_db816009 = level.weapon_script_model[localclientnum][#"talent3"];
            if (isdefined(var_db816009) && function_9b2f2702(localclientnum, #"talent1") <= 1 && function_3ca8f346(var_db816009.model, var_297c7602, localclientnum) === level.weapon_position[#"perk1"]) {
                var_db816009 hide();
            }
            break;
        case #"talent2":
            var_db816009 = level.weapon_script_model[localclientnum][#"talent1"];
            if (isdefined(var_db816009) && function_9b2f2702(localclientnum, #"talent2") <= 1 && function_3ca8f346(var_db816009.model, var_297c7602, localclientnum) === level.weapon_position[#"perk2"]) {
                var_db816009 hide();
            }
            var_db816009 = level.weapon_script_model[localclientnum][#"talent3"];
            if (isdefined(var_db816009) && function_9b2f2702(localclientnum, #"talent2") <= 1 && function_3ca8f346(var_db816009.model, var_297c7602, localclientnum) === level.weapon_position[#"perk2"]) {
                var_db816009 hide();
            }
            break;
        case #"talent3":
            var_db816009 = level.weapon_script_model[localclientnum][#"talent1"];
            if (isdefined(var_db816009) && function_9b2f2702(localclientnum, #"talent3") <= 1 && function_3ca8f346(var_db816009.model, var_297c7602, localclientnum) === level.weapon_position[#"perk3"]) {
                var_db816009 hide();
            }
            var_db816009 = level.weapon_script_model[localclientnum][#"talent2"];
            if (isdefined(var_db816009) && function_9b2f2702(localclientnum, #"talent3") <= 1 && function_3ca8f346(var_db816009.model, var_297c7602, localclientnum) === level.weapon_position[#"perk3"]) {
                var_db816009 hide();
            }
            break;
        }
        return;
    }
    if (isdefined(level.weapon_script_model[localclientnum][var_297c7602])) {
        level.weapon_script_model[localclientnum][var_297c7602] delete();
    }
    if (isdefined(level.preload_weapon_model[localclientnum][var_297c7602])) {
        level.preload_weapon_model[localclientnum][var_297c7602] delete();
    }
    itemindex = getloadoutitem(localclientnum, var_c70fb4f3, var_297c7602);
    var_438da649 = function_b143666d(itemindex, 5);
    if (isdefined(var_438da649)) {
        var_85d87aca = isdefined(var_438da649.previewmodelname) ? var_438da649.previewmodelname : #"";
        var_95970e62 = isdefined(var_438da649.previewmodelscale) ? var_438da649.previewmodelscale : 1;
    } else {
        return;
    }
    s_position = function_1cd1374d(level.weaponnone, var_297c7602, undefined, localclientnum, var_85d87aca);
    level.weapon_script_model[localclientnum][var_297c7602] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
    level.preload_weapon_model[localclientnum][var_297c7602] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
    level.preload_weapon_model[localclientnum][var_297c7602] hide();
    toggle_locked_weapon_shader(localclientnum, 1, var_297c7602);
    update_weapon_script_model(localclientnum, level.weaponnone.name, function_b4e01020(level.weaponnone), undefined, 1, var_95970e62, var_85d87aca, var_297c7602);
    level.weapon_script_model[localclientnum][var_297c7602].origin = s_position.origin;
    level.weapon_script_model[localclientnum][var_297c7602].angles = s_position.angles;
    var_db816009 = level.weapon_script_model[localclientnum][var_297c7602];
    if (var_2463e2c7 !== #"bonuscard1" && var_2463e2c7 !== #"talents" && function_9b2f2702(localclientnum, var_2463e2c7) == 1 && !function_902cfbde(var_85d87aca, var_297c7602) && var_2463e2c7 === function_60663bf8(var_85d87aca)) {
        var_db816009 hide();
    }
    if (var_2463e2c7 === #"talents" || var_2463e2c7 === #"bonuscard1") {
        var_db816009 show();
    }
}

// Namespace customclass/custom_class
// Params 5, eflags: 0x2 linked
// Checksum 0xcf1ec884, Offset: 0x7c00
// Size: 0x86c
function function_d39cd2b5(var_8a4ba442 = "", str_weapon, var_cc6c0ec0 = 0, var_f2af4049 = 0, localclientnum) {
    if (var_cc6c0ec0) {
        var_c6abe208 = #"scene_frontend_t9_cac_select";
    } else {
        var_c6abe208 = #"scene_frontend_t9_cac_overview";
    }
    if (var_f2af4049 && scene::function_9730988a(var_c6abe208, "overview")) {
        var_23f6420e = "overview";
    } else {
        if (isdefined(str_weapon)) {
            weapon = getweapon(str_weapon);
        }
        switch (var_8a4ba442) {
        case #"primary":
            if (function_cc770c92(weapon)) {
                if (function_4dcbc16b(localclientnum, var_8a4ba442, weapon)) {
                    var_23f6420e = "primary";
                } else {
                    var_23f6420e = "secondary_alt";
                }
            } else {
                var_23f6420e = "primary";
            }
            break;
        case #"secondary":
            if (function_cc770c92(weapon)) {
                var_23f6420e = "secondary_alt";
            } else {
                var_23f6420e = "secondary";
            }
            break;
        case #"primarygrenade":
            var_23f6420e = "lethal";
            break;
        case #"secondarygrenade":
            var_23f6420e = "tactical";
            break;
        case #"tacticalgear":
            var_23f6420e = "tactical";
            break;
        case #"specialgrenade":
            if (sessionmodeiszombiesgame()) {
                var_23f6420e = "fieldupgrade_zm";
            } else {
                var_23f6420e = "fieldupgrade";
            }
            break;
        case #"talent":
            var_23f6420e = "perks_zm";
            break;
        case #"hash_6535e34e6169957e":
            var_23f6420e = "canister_zm";
            break;
        case #"specialty":
            var_23f6420e = "ammo_zm";
            break;
        case #"weaponcategories":
            var_23f6420e = "weapon_categories_zm";
            break;
        case #"talents":
            var_23f6420e = "perks";
            break;
        case #"talent1":
        case #"talent4":
            if (is_true(level.var_311aa2a1)) {
                var_e79e336c = function_9b2f2702(localclientnum, var_8a4ba442);
                switch (var_e79e336c) {
                case 0:
                case 1:
                default:
                    var_23f6420e = "perk1";
                    break;
                case 2:
                    var_23f6420e = "perk1_greed";
                    break;
                case 3:
                    var_23f6420e = "perk1_lawbreaker";
                    break;
                }
            } else if (is_true(level.var_24d6a6a6)) {
                var_23f6420e = "perk1_greed";
            } else {
                var_23f6420e = "perk1";
            }
            break;
        case #"talent2":
        case #"talent5":
            if (is_true(level.var_311aa2a1)) {
                var_e79e336c = function_9b2f2702(localclientnum, var_8a4ba442);
                switch (var_e79e336c) {
                case 0:
                case 1:
                default:
                    var_23f6420e = "perk2";
                    break;
                case 2:
                    var_23f6420e = "perk2_greed";
                    break;
                case 3:
                    var_23f6420e = "perk2_lawbreaker";
                    break;
                }
            } else if (is_true(level.var_24d6a6a6)) {
                var_23f6420e = "perk2_greed";
            } else {
                var_23f6420e = "perk2";
            }
            break;
        case #"talent3":
        case #"talent6":
            if (is_true(level.var_311aa2a1)) {
                var_e79e336c = function_9b2f2702(localclientnum, var_8a4ba442);
                switch (var_e79e336c) {
                case 0:
                case 1:
                default:
                    var_23f6420e = "perk3";
                    break;
                case 2:
                    var_23f6420e = "perk3_greed";
                    break;
                case 3:
                    var_23f6420e = "perk3_lawbreaker";
                    break;
                }
            } else if (is_true(level.var_24d6a6a6)) {
                var_23f6420e = "perk3_greed";
            } else {
                var_23f6420e = "perk3";
            }
            break;
        case #"bonuscard1":
            var_23f6420e = "wildcard";
            break;
        case #"hash_c70e59dba98cf81":
            var_23f6420e = "wrist_accessories";
            break;
        default:
            assertmsg("perk2" + function_9e72a96(var_c6abe208) + "specialty" + var_8a4ba442);
            break;
        }
    }
    var_2a1f18fc = array(#"hash_c70e59dba98cf81");
    if (var_c6abe208 !== level.var_64ee434 || var_23f6420e !== level.var_908d7e4d || isinarray(var_2a1f18fc, hash(var_8a4ba442))) {
        if (function_4983a663(localclientnum, var_8a4ba442)) {
            var_b1e821c5 = {#var_dcfaf6c7:0};
        }
        if (isdefined(level.var_64ee434)) {
            level scene::stop(level.var_64ee434);
        }
        level thread scene::play(var_c6abe208, var_23f6420e, undefined, undefined, undefined, undefined, var_b1e821c5);
    }
    level.var_64ee434 = var_c6abe208;
    level.var_908d7e4d = var_23f6420e;
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0xd9d063e7, Offset: 0x8478
// Size: 0xc8
function function_4983a663(localclientnum, var_8a4ba442) {
    if (var_8a4ba442 === #"hash_c70e59dba98cf81") {
        if (isdefined(level.var_a14cc36b[localclientnum][1].menu_name) && (!isdefined(level.var_a14cc36b[localclientnum][1].state) || level.var_a14cc36b[localclientnum][1].state != #"accessories")) {
            return true;
        } else {
            return false;
        }
    }
    if (!isdefined(level.var_64ee434)) {
        return true;
    }
    return false;
}

// Namespace customclass/custom_class
// Params 4, eflags: 0x2 linked
// Checksum 0xf53ee04, Offset: 0x8548
// Size: 0x3e4
function function_f87ec9a8(var_e81ceea = "", str_weapon, var_f2af4049 = 0, var_227ba79b = #"") {
    if (!isdefined(level.var_f0a17a7b)) {
        level.var_f0a17a7b = #"scene_frontend_t9_gunsmith";
    }
    if (isdefined(level.var_64ee434)) {
        var_b1e821c5 = {#var_dcfaf6c7:0};
        level.var_64ee434 = undefined;
    }
    level scene::stop(level.var_f0a17a7b);
    if (var_f2af4049 && scene::function_9730988a(level.var_f0a17a7b, "overview")) {
        var_7dae7df8 = "overview";
    } else if (var_227ba79b === #"hash_2fda3f64c5caa89e" && scene::function_9730988a(level.var_f0a17a7b, "inspect")) {
        var_7dae7df8 = "inspect";
    } else if (var_227ba79b === #"charm" && scene::function_9730988a(level.var_f0a17a7b, "charms")) {
        var_7dae7df8 = "charms";
    } else if (var_227ba79b === #"stickers" && scene::function_9730988a(level.var_f0a17a7b, "stickers")) {
        var_7dae7df8 = "stickers";
    } else {
        if (isdefined(str_weapon)) {
            weapon = getweapon(str_weapon);
        }
        switch (var_e81ceea) {
        case #"optic":
            var_7dae7df8 = "optic";
            break;
        case #"muzzle":
            var_7dae7df8 = "muzzle";
            break;
        case #"barrel":
            var_7dae7df8 = "barrel";
            break;
        case #"underbarrel":
            var_7dae7df8 = "underbarrel";
            break;
        case #"body":
            var_7dae7df8 = "body";
            break;
        case #"stock":
            var_7dae7df8 = "stock";
            break;
        case #"magazine":
            var_7dae7df8 = "magazine";
            break;
        case #"handle":
            var_7dae7df8 = "handle";
            break;
        default:
            var_7dae7df8 = "overview";
            break;
        }
    }
    if (!scene::is_playing(level.var_f0a17a7b, var_7dae7df8) && level.var_f0483ccf !== var_7dae7df8) {
        level thread scene::play(level.var_f0a17a7b, var_7dae7df8, undefined, undefined, undefined, undefined, var_b1e821c5);
        level thread function_53e5fd8a(var_7dae7df8);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x6 linked
// Checksum 0x64a16188, Offset: 0x8938
// Size: 0x4a
function private function_53e5fd8a(shot) {
    self notify("373bd255a82f0a47");
    self endon("373bd255a82f0a47");
    level.var_f0483ccf = shot;
    waitframe(1);
    level.var_f0483ccf = undefined;
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0xb00dd277, Offset: 0x8990
// Size: 0xa4
function toggle_locked_weapon_shader(localclientnum, is_item_unlocked = 1, var_8a4ba442 = #"primary") {
    if (!isdefined(level.weapon_script_model[localclientnum][var_8a4ba442])) {
        return;
    }
    if (is_item_unlocked != 1) {
        enablefrontendlockedweaponoverlay(localclientnum, 1);
        return;
    }
    enablefrontendlockedweaponoverlay(localclientnum, 0);
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x2df1f480, Offset: 0x8a40
// Size: 0xbc
function custom_class_closed(localclientnum) {
    level endon(#"disconnect", "CustomClass_update" + localclientnum);
    params = level waittill(#"customclass_closed");
    if (params.param1 == localclientnum) {
        enablefrontendlockedweaponoverlay(localclientnum, 0);
        enablefrontendtokenlockedweaponoverlay(localclientnum, 0);
        level.last_weapon_name[localclientnum] = "";
        level.var_8ad413c[localclientnum] = "";
    }
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0xcc7fc2bc, Offset: 0x8b08
// Size: 0x86
function spawn_weapon_model(localclientnum, origin, angles) {
    weapon_model = spawn(localclientnum, origin, "script_model");
    weapon_model sethighdetail(level.var_636c2236, level.var_636c2236);
    if (isdefined(angles)) {
        weapon_model.angles = angles;
    }
    return weapon_model;
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x5c287d61, Offset: 0x8b98
// Size: 0xcc
function function_f70cc07c(array) {
    foreach (i, item in array) {
        if (isstring(item) && !isint(item)) {
            array[i] = int(item);
        }
    }
    return array;
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x679f0f39, Offset: 0x8c70
// Size: 0x96
function function_d896247b(var_ccf52c44) {
    return var_ccf52c44 == #"primary" || var_ccf52c44 == #"secondary" || var_ccf52c44 == #"gunsmith" || var_ccf52c44 == #"hash_2fda3f64c5caa89e" || var_ccf52c44 == #"charm" || var_ccf52c44 == #"stickers";
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0x689349e, Offset: 0x8d10
// Size: 0x82
function function_3a1dd26(localclientnum, var_ccf52c44, camo_index) {
    if (!isdefined(level.camo_index[localclientnum])) {
        level.camo_index[localclientnum] = [];
    }
    if (!isdefined(level.camo_index[localclientnum][var_ccf52c44])) {
        level.camo_index[localclientnum][var_ccf52c44] = 0;
    }
    level.camo_index[localclientnum][var_ccf52c44] = camo_index;
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0xb04bd186, Offset: 0x8da0
// Size: 0x76
function get_camo_index(localclientnum, var_ccf52c44) {
    if (!isdefined(level.camo_index[localclientnum])) {
        level.camo_index[localclientnum] = [];
    }
    if (!isdefined(level.camo_index[localclientnum][var_ccf52c44])) {
        level.camo_index[localclientnum][var_ccf52c44] = 0;
    }
    return level.camo_index[localclientnum][var_ccf52c44];
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x7f5972dd, Offset: 0x8e20
// Size: 0x44
function get_reticle_index(localclientnum) {
    if (!isdefined(level.reticle_index[localclientnum])) {
        level.reticle_index[localclientnum] = 0;
    }
    return level.reticle_index[localclientnum];
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0x45c993b5, Offset: 0x8e70
// Size: 0xba
function function_cd5b2d74(localclientnum, var_ccf52c44, var_21a477b9) {
    if (!function_d896247b(var_ccf52c44)) {
        return;
    }
    if (!isdefined(level.var_21a477b9)) {
        level.var_21a477b9 = [];
    }
    if (!isdefined(level.var_21a477b9[localclientnum])) {
        level.var_21a477b9[localclientnum] = [];
    }
    if (!isdefined(level.var_21a477b9[localclientnum][var_ccf52c44])) {
        level.var_21a477b9[localclientnum][var_ccf52c44] = 0;
    }
    level.var_21a477b9[localclientnum][var_ccf52c44] = var_21a477b9;
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0xf4433c61, Offset: 0x8f38
// Size: 0xae
function function_426673ac(localclientnum, var_ccf52c44) {
    if (!function_d896247b(var_ccf52c44)) {
        return 0;
    }
    if (!isdefined(level.var_21a477b9)) {
        level.var_21a477b9 = [];
    }
    if (!isdefined(level.var_21a477b9[localclientnum])) {
        level.var_21a477b9[localclientnum] = [];
    }
    if (!isdefined(level.var_21a477b9[localclientnum][var_ccf52c44])) {
        level.var_21a477b9[localclientnum][var_ccf52c44] = 0;
    }
    return level.var_21a477b9[localclientnum][var_ccf52c44];
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0x8571ca93, Offset: 0x8ff0
// Size: 0x112
function function_9d6867fc(localclientnum, var_ccf52c44, var_6870002c) {
    if (!function_d896247b(var_ccf52c44)) {
        return;
    }
    if (!isdefined(level.var_6870002c)) {
        level.var_6870002c = [];
    }
    if (!isdefined(level.var_6870002c[localclientnum])) {
        level.var_6870002c[localclientnum] = [];
    }
    if (!isdefined(level.var_6870002c[localclientnum][var_ccf52c44])) {
        level.var_6870002c[localclientnum][var_ccf52c44] = {};
    }
    if (isarray(var_6870002c)) {
        level.var_6870002c[localclientnum][var_ccf52c44] = var_6870002c;
        return;
    }
    level.var_6870002c[localclientnum][var_ccf52c44] = function_f70cc07c(strtok(var_6870002c, "+"));
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0xc41e233c, Offset: 0x9110
// Size: 0xae
function function_da4e64d6(localclientnum, var_ccf52c44) {
    if (!function_d896247b(var_ccf52c44)) {
        return {};
    }
    if (!isdefined(level.var_6870002c)) {
        level.var_6870002c = [];
    }
    if (!isdefined(level.var_6870002c[localclientnum])) {
        level.var_6870002c[localclientnum] = [];
    }
    if (!isdefined(level.var_6870002c[localclientnum][var_ccf52c44])) {
        level.var_6870002c[localclientnum][var_ccf52c44] = {};
    }
    return level.var_6870002c[localclientnum][var_ccf52c44];
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0x125c3ad0, Offset: 0x91c8
// Size: 0xba
function function_93e332c2(localclientnum, var_ccf52c44, var_f1c6301d) {
    if (!function_d896247b(var_ccf52c44)) {
        return;
    }
    if (!isdefined(level.var_f1c6301d)) {
        level.var_f1c6301d = [];
    }
    if (!isdefined(level.var_f1c6301d[localclientnum])) {
        level.var_f1c6301d[localclientnum] = [];
    }
    if (!isdefined(level.var_f1c6301d[localclientnum][var_ccf52c44])) {
        level.var_f1c6301d[localclientnum][var_ccf52c44] = 0;
    }
    level.var_f1c6301d[localclientnum][var_ccf52c44] = var_f1c6301d;
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0x2544f781, Offset: 0x9290
// Size: 0xae
function function_1d61dcf3(localclientnum, var_ccf52c44) {
    if (!function_d896247b(var_ccf52c44)) {
        return 0;
    }
    if (!isdefined(level.var_f1c6301d)) {
        level.var_f1c6301d = [];
    }
    if (!isdefined(level.var_f1c6301d[localclientnum])) {
        level.var_f1c6301d[localclientnum] = [];
    }
    if (!isdefined(level.var_f1c6301d[localclientnum][var_ccf52c44])) {
        level.var_f1c6301d[localclientnum][var_ccf52c44] = 0;
    }
    return level.var_f1c6301d[localclientnum][var_ccf52c44];
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x27db1b88, Offset: 0x9348
// Size: 0x44
function get_show_paintshop(localclientnum) {
    if (!isdefined(level.show_paintshop[localclientnum])) {
        level.show_paintshop[localclientnum] = 0;
    }
    return level.show_paintshop[localclientnum];
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0x845246e8, Offset: 0x9398
// Size: 0xf2
function function_68d4a012(localclientnum, var_ccf52c44) {
    if (function_d896247b(var_ccf52c44)) {
        if (!isdefined(level.var_6f87d12e[localclientnum][var_ccf52c44])) {
            level.var_6f87d12e[localclientnum][var_ccf52c44] = function_8e799963([-1, -1, -1, -1]);
        }
        return level.var_6f87d12e[localclientnum][var_ccf52c44];
    }
    return function_8e799963([-1, -1, -1, -1]);
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0xf70450b8, Offset: 0x9498
// Size: 0x76
function function_15cbf06e(localclientnum, var_ccf52c44, var_415dfdfa) {
    if (!isdefined(level.var_6f87d12e)) {
        level.var_6f87d12e = [];
    }
    if (!isdefined(level.var_6f87d12e[localclientnum])) {
        level.var_6f87d12e[localclientnum] = [];
    }
    level.var_6f87d12e[localclientnum][var_ccf52c44] = var_415dfdfa;
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0xce58cee2, Offset: 0x9518
// Size: 0x116
function function_162e1121(localclientnum, var_ccf52c44, var_571f2574) {
    if (!(var_ccf52c44 == #"primary" || var_ccf52c44 == #"secondary" || var_ccf52c44 == #"gunsmith" || var_ccf52c44 == #"charm" || var_ccf52c44 == #"hash_2fda3f64c5caa89e")) {
        return;
    }
    if (!isdefined(level.var_571f2574)) {
        level.var_571f2574 = [];
    }
    if (!isdefined(level.var_571f2574[localclientnum])) {
        level.var_571f2574[localclientnum] = [];
    }
    if (!isdefined(level.var_571f2574[localclientnum][var_ccf52c44])) {
        level.var_571f2574[localclientnum][var_ccf52c44] = 0;
    }
    level.var_571f2574[localclientnum][var_ccf52c44] = var_571f2574;
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0x1fdf6f98, Offset: 0x9638
// Size: 0x10a
function function_52145a0d(localclientnum, var_ccf52c44) {
    if (!(var_ccf52c44 == #"primary" || var_ccf52c44 == #"secondary" || var_ccf52c44 == #"gunsmith" || var_ccf52c44 == #"charm" || var_ccf52c44 == #"hash_2fda3f64c5caa89e")) {
        return 0;
    }
    if (!isdefined(level.var_571f2574)) {
        level.var_571f2574 = [];
    }
    if (!isdefined(level.var_571f2574[localclientnum])) {
        level.var_571f2574[localclientnum] = [];
    }
    if (!isdefined(level.var_571f2574[localclientnum][var_ccf52c44])) {
        level.var_571f2574[localclientnum][var_ccf52c44] = 0;
    }
    return level.var_571f2574[localclientnum][var_ccf52c44];
}

// Namespace customclass/custom_class
// Params 4, eflags: 0x2 linked
// Checksum 0xa6c0791c, Offset: 0x9750
// Size: 0x2d4
function function_998e2be7(localclientnum, var_ccf52c44, weapon_options_param, var_6870002c) {
    weapon_options = strtok(weapon_options_param, ",");
    function_3a1dd26(localclientnum, var_ccf52c44, int(weapon_options[0]));
    level.reticle_index[localclientnum] = int(weapon_options[1]);
    level.show_paintshop[localclientnum] = int(weapon_options[2]);
    if (isdefined(weapon_options[3])) {
        function_cd5b2d74(localclientnum, var_ccf52c44, int(weapon_options[3]));
    }
    if (isdefined(var_6870002c)) {
        function_9d6867fc(localclientnum, var_ccf52c44, var_6870002c);
    }
    if (isdefined(weapon_options[5])) {
        level.var_dd70be5b[localclientnum] = int(weapon_options[5]);
    } else {
        level.var_dd70be5b[localclientnum] = -1;
    }
    if (isdefined(weapon_options[6])) {
        function_162e1121(localclientnum, var_ccf52c44, int(weapon_options[6]));
    } else {
        function_162e1121(localclientnum, var_ccf52c44, 0);
    }
    function_15cbf06e(localclientnum, var_ccf52c44, function_8e799963([int(isdefined(weapon_options[7]) ? weapon_options[7] : -1), int(isdefined(weapon_options[8]) ? weapon_options[8] : -1), int(isdefined(weapon_options[9]) ? weapon_options[9] : -1), int(isdefined(weapon_options[10]) ? weapon_options[10] : -1)]));
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0xcf6e6433, Offset: 0x9a30
// Size: 0x136
function get_weapon_options(localclientnum, var_ccf52c44) {
    if (var_ccf52c44 == #"primary" || var_ccf52c44 == #"secondary" || var_ccf52c44 == #"gunsmith" || var_ccf52c44 == #"charm" || var_ccf52c44 == #"stickers" || var_ccf52c44 == #"hash_2fda3f64c5caa89e") {
        camo_index = get_camo_index(localclientnum, var_ccf52c44);
        reticle_index = get_reticle_index(localclientnum);
        paintshop = get_show_paintshop(localclientnum);
        renderoptions = function_6eff28b5(localclientnum, camo_index, reticle_index, paintshop);
        return renderoptions;
    }
    return 0;
}

// Namespace customclass/custom_class
// Params 4, eflags: 0x2 linked
// Checksum 0xe5db80a8, Offset: 0x9b70
// Size: 0x154
function preload_weapon_model(localclientnum, newweaponstring, var_f020955, var_8a4ba442 = #"primary") {
    level notify("preload_weapon_changing_" + localclientnum);
    current_weapon = getweapon(newweaponstring, strtok(var_f020955, "+"));
    if (current_weapon == level.weaponnone) {
        return;
    }
    level.preload_weapon_model[localclientnum][var_8a4ba442] useweaponmodel(current_weapon, undefined, get_weapon_options(localclientnum, var_8a4ba442), function_426673ac(localclientnum, var_8a4ba442), function_68d4a012(localclientnum, var_8a4ba442));
    while (true) {
        if (level.preload_weapon_model[localclientnum][var_8a4ba442] isstreamed()) {
            return;
        }
        wait(0.1);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x7e23ba83, Offset: 0x9cd0
// Size: 0x84
function function_8bf05e82(localclientnum) {
    var_cc22b19 = createuimodel(function_1df4c3b0(localclientnum, #"hash_4979ef8c6b71470b"), "entNum");
    var_b65f6ce3 = self getentitynumber();
    setuimodelvalue(var_cc22b19, var_b65f6ce3);
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x6 linked
// Checksum 0x84d192d5, Offset: 0x9d60
// Size: 0xda
function private function_70be20f4(localclientnum, var_ccf52c44, weaponmodel) {
    if (!isdefined(level.var_dd70be5b[localclientnum]) || level.var_dd70be5b[localclientnum] <= -1) {
        return 0;
    }
    activecamoinfo = activecamo::function_13e12ab1(get_camo_index(localclientnum, var_ccf52c44));
    if (!isdefined(activecamoinfo)) {
        return 0;
    }
    var_3594168e = activecamoinfo.stages[level.var_dd70be5b[localclientnum]];
    return activecamo::function_6c9e0e1a(localclientnum, weaponmodel, var_3594168e, level.var_aa10d0b4);
}

// Namespace customclass/custom_class
// Params 5, eflags: 0x2 linked
// Checksum 0xe8f94a64, Offset: 0x9e48
// Size: 0x374
function function_1f5168a3(localclientnum, weapon, var_4d32a086, var_9d7ee952, var_ff0bbc12) {
    self notify("74387807182c1c52");
    self endon("74387807182c1c52");
    self endon(#"shutdown", #"death");
    activecamoname = activecamo::function_33ed1149(weapon, var_4d32a086);
    var_d47ad84a = getuimodel(function_1df4c3b0(localclientnum, #"hash_39f2e2d50c93db04"), "activeCamoId");
    if (isdefined(activecamoname)) {
        setuimodelvalue(var_d47ad84a, activecamoname);
        activecamoinfo = getscriptbundle(activecamoname);
        if (isdefined(activecamoinfo) && activecamoinfo.stages.size > 1) {
            if (isdefined(activecamoinfo.var_5f38b34e)) {
                weaponstage = getdvarint(activecamoinfo.var_5f38b34e, 0);
                var_3594168e = activecamoinfo.stages[weaponstage];
                self activecamo::function_7721b2d5(localclientnum, activecamoinfo, weaponstage);
                if (isdefined(var_ff0bbc12) && var_ff0bbc12 === level.var_3f5552f9[localclientnum]) {
                    var_a7ea8320 = getuimodel(function_1df4c3b0(localclientnum, #"hash_39f2e2d50c93db04"), "activeCamoStage");
                    setuimodelvalue(var_a7ea8320, weaponstage);
                }
                return;
            }
            stage = 0;
            var_f89c8d5e = 0;
            while (true) {
                var_3594168e = activecamoinfo.stages[stage];
                if (!isdefined(var_3594168e.disabled) || var_3594168e.disabled == 0) {
                    self activecamo::function_7721b2d5(localclientnum, activecamoinfo, stage);
                    var_f89c8d5e = 1;
                    if (isdefined(var_ff0bbc12) && var_ff0bbc12 === level.var_3f5552f9[localclientnum]) {
                        var_a7ea8320 = getuimodel(function_1df4c3b0(localclientnum, #"hash_39f2e2d50c93db04"), "activeCamoStage");
                        setuimodelvalue(var_a7ea8320, stage);
                    }
                    wait(var_9d7ee952);
                } else if (!var_f89c8d5e && stage + 1 == activecamoinfo.stages.size) {
                    break;
                }
                stage = (stage + 1) % activecamoinfo.stages.size;
            }
        }
    }
    setuimodelvalue(var_d47ad84a, #"");
}

// Namespace customclass/custom_class
// Params 9, eflags: 0x2 linked
// Checksum 0xd289feda, Offset: 0xa1c8
// Size: 0x8fc
function update_weapon_script_model(localclientnum, newweaponstring, var_f020955, *should_update_weapon_options, is_item_unlocked = 1, xmodel_scale = 1, xmodel_name = #"", var_8a4ba442 = #"primary", var_e81ceea) {
    /#
        assert(isdefined(var_f020955), "<unknown string>");
        assert(isdefined(should_update_weapon_options), "<unknown string>");
    #/
    level.last_weapon_name[newweaponstring] = isdefined(var_f020955) ? var_f020955 : #"ar_accurate_t9";
    level.var_8ad413c[newweaponstring] = isdefined(should_update_weapon_options) ? should_update_weapon_options : "";
    var_571f2574 = function_52145a0d(newweaponstring, var_8a4ba442);
    var_3831d409 = strtok(level.var_8ad413c[newweaponstring], "+");
    var_b2e08916 = function_426673ac(newweaponstring, var_8a4ba442);
    var_6870002c = function_da4e64d6(newweaponstring, var_8a4ba442);
    if (function_d896247b(var_8a4ba442) && var_3831d409.size === var_6870002c.size) {
        var_a268e5c4 = function_5f08e596(level.last_weapon_name[newweaponstring], var_3831d409, var_b2e08916, var_6870002c);
        function_93e332c2(newweaponstring, var_8a4ba442, var_a268e5c4.var_fd90b0bb);
        level.current_weapon[newweaponstring] = var_a268e5c4.weapon;
    } else {
        level.current_weapon[newweaponstring] = getweapon(level.last_weapon_name[newweaponstring], strtok(level.var_8ad413c[newweaponstring], "+"));
    }
    if (level.current_weapon[newweaponstring] == level.weaponnone || xmodel_name !== #"") {
        if (sessionmodeiszombiesgame() && var_8a4ba442 === "specialty") {
            level.weapon_script_model[newweaponstring][var_8a4ba442] function_f7bc8c66(newweaponstring);
        }
        level.weapon_script_model[newweaponstring][var_8a4ba442] delete();
        s_position = function_1cd1374d(level.last_weapon_name[newweaponstring], var_8a4ba442, var_e81ceea, newweaponstring, xmodel_name);
        level.weapon_script_model[newweaponstring][var_8a4ba442] = spawn_weapon_model(newweaponstring, s_position.origin, s_position.angles);
        toggle_locked_weapon_shader(newweaponstring, is_item_unlocked, var_8a4ba442);
        if (var_8a4ba442 === #"hash_c70e59dba98cf81") {
            function_bb082ae7(newweaponstring);
        }
        if (xmodel_name !== #"") {
            level.weapon_script_model[newweaponstring][var_8a4ba442] setmodel(xmodel_name);
        } else if (level.last_weapon_name[newweaponstring] === #"none" || level.last_weapon_name[newweaponstring] === #"weapon_null") {
            level.weapon_script_model[newweaponstring][var_8a4ba442] setmodel(#"tag_origin");
        } else {
            level.weapon_script_model[newweaponstring][var_8a4ba442] setmodel(level.last_weapon_name[newweaponstring]);
        }
        level.weapon_script_model[newweaponstring][var_8a4ba442] setscale(xmodel_scale);
        if (sessionmodeiszombiesgame() && var_8a4ba442 === #"specialty") {
            level.weapon_script_model[newweaponstring][var_8a4ba442] function_7164981d(newweaponstring);
        }
        if (var_8a4ba442 === #"hash_c70e59dba98cf81") {
            model = level.weapon_script_model[newweaponstring][var_8a4ba442].model;
            fx = function_ddce43b3(model);
            thread function_370fbe8f(newweaponstring, fx);
        }
        if (var_8a4ba442 === #"hash_2fda3f64c5caa89e") {
            function_975f521b(var_571f2574);
        }
        level notify(#"hash_2c891ab22c8ffee");
        return;
    }
    if (var_8a4ba442 !== #"stickers") {
        function_975f521b(var_571f2574);
    }
    s_info = function_ae73f57f(newweaponstring, var_8a4ba442, var_e81ceea);
    if (var_8a4ba442 !== #"hash_6535e34e6169957e") {
        var_4d32a086 = function_1d61dcf3(newweaponstring, var_8a4ba442);
        s_blueprint = function_69031255(level.current_weapon[newweaponstring], var_4d32a086);
        var_2482eaee = function_17a3348d(newweaponstring, var_8a4ba442, s_blueprint.weaponblueprint, s_info);
        level.weapon_script_model[newweaponstring][var_8a4ba442] useweaponmodel(level.current_weapon[newweaponstring], var_2482eaee, get_weapon_options(newweaponstring, var_8a4ba442), var_4d32a086, function_68d4a012(newweaponstring, var_8a4ba442));
        level.weapon_script_model[newweaponstring][var_8a4ba442] thread function_1f5168a3(newweaponstring, level.current_weapon[newweaponstring], var_4d32a086, getdvarint(#"hash_41ef264ae8370dc7", 6), var_8a4ba442);
    } else {
        level notify(#"hash_2c891ab22c8ffee");
    }
    weaponmodel = level.weapon_script_model[newweaponstring][var_8a4ba442];
    if (!function_70be20f4(newweaponstring, var_8a4ba442, weaponmodel)) {
        if (isdefined(level.var_aa10d0b4[newweaponstring])) {
            weaponmodel stoprenderoverridebundle(level.var_aa10d0b4[newweaponstring]);
            level.var_aa10d0b4[newweaponstring] = undefined;
        }
    }
    if (var_8a4ba442 !== #"hash_6535e34e6169957e") {
        level.weapon_script_model[newweaponstring][var_8a4ba442] setscale(s_info.scale);
    }
    level.weapon_script_model[newweaponstring][var_8a4ba442] function_8bf05e82(newweaponstring);
    if (var_8a4ba442 === #"hash_6535e34e6169957e") {
        level.weapon_script_model[newweaponstring][var_8a4ba442] thread function_75af31e2(newweaponstring, var_f020955);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x3b90cdd5, Offset: 0xaad0
// Size: 0x1c2
function function_7164981d(localclientnum) {
    self function_f7bc8c66(localclientnum);
    self.var_5f9b027b = function_7a6db01f(localclientnum, self.model);
    self playrenderoverridebundle(self.var_5f9b027b);
    switch (self.model) {
    case #"hash_5ecac889d056f331":
        self.var_635b9513 = util::playfxontag(localclientnum, #"hash_6503886d9ce9b3c3", self, "tag_fx1");
        break;
    case #"hash_5fc7ee5c69212e50":
        self.var_635b9513 = util::playfxontag(localclientnum, #"hash_2a75b9442177bdb5", self, "tag_fx1");
        break;
    case #"hash_796f6395f5856ff1":
        self.var_635b9513 = util::playfxontag(localclientnum, #"hash_67f713a84c242ff3", self, "tag_fx1");
        break;
    case #"hash_15c8d8d59a771d41":
        self.var_635b9513 = util::playfxontag(localclientnum, #"hash_4a932c53210cf7b6", self, "tag_fx1");
        break;
    case #"hash_3dabd96b7684e947":
        self.var_635b9513 = util::playfxontag(localclientnum, #"hash_5779b89695d2c70a", self, "tag_fx1");
        break;
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0xbee5e938, Offset: 0xaca0
// Size: 0x76
function function_f7bc8c66(localclientnum) {
    if (isdefined(self.var_5f9b027b)) {
        self function_f6e99a8d(self.var_5f9b027b);
        self.var_5f9b027b = undefined;
    }
    if (isdefined(self.var_635b9513)) {
        killfx(localclientnum, self.var_635b9513);
        self.var_635b9513 = undefined;
    }
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0x477dfe30, Offset: 0xad20
// Size: 0x2d2
function function_7a6db01f(localclientnum, str_ammo_mod) {
    n_tier = 0;
    switch (str_ammo_mod) {
    case #"hash_5ecac889d056f331":
        n_tier = stats::get_stat(localclientnum, #"cacloadouts", #"hash_1b24e5b336f5ae8d", #"hash_54782d04f50f4fb0");
        break;
    case #"hash_5fc7ee5c69212e50":
        n_tier = stats::get_stat(localclientnum, #"cacloadouts", #"hash_1b24e5b336f5ae8d", #"hash_63114aea3939d941");
        break;
    case #"hash_796f6395f5856ff1":
        n_tier = stats::get_stat(localclientnum, #"cacloadouts", #"hash_1b24e5b336f5ae8d", #"hash_69a99172dc42f08a");
        break;
    case #"hash_15c8d8d59a771d41":
        n_tier = stats::get_stat(localclientnum, #"cacloadouts", #"hash_1b24e5b336f5ae8d", #"hash_5769f8ea57e496b4");
        break;
    case #"hash_3dabd96b7684e947":
        n_tier = stats::get_stat(localclientnum, #"cacloadouts", #"hash_1b24e5b336f5ae8d", #"hash_38f1aae51e2d5f58");
        break;
    default:
        n_tier = 1;
        break;
    }
    switch (n_tier) {
    case 0:
    case 1:
    default:
        return #"rob_ammo_mod_level_1";
    case 2:
        return #"rob_ammo_mod_level_2";
    case 3:
        return #"rob_ammo_mod_level_3";
    case 4:
        return #"rob_ammo_mod_level_4";
    case 5:
        return #"rob_ammo_mod_level_5";
    }
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0x339aa2ab, Offset: 0xb000
// Size: 0x684
function function_75af31e2(localclientnum, var_addf3c2f) {
    self notify("133d29c039ab2b5f");
    self endon("133d29c039ab2b5f");
    self endon(#"death");
    if (isdefined(self.var_125d962d)) {
        killfx(localclientnum, self.var_125d962d);
        self.var_125d962d = undefined;
    }
    if (level.var_e287b16f[localclientnum] !== var_addf3c2f) {
        self hide();
    }
    self setscale(0.9);
    switch (var_addf3c2f) {
    case #"hash_164c43cbd0ee958":
    case #"hash_164c63cbd0eecbe":
    case #"hash_164c73cbd0eee71":
    case #"hash_164c83cbd0ef024":
    case #"hash_164c93cbd0ef1d7":
    case #"hash_2d88b4c5217c7e7c":
        self setmodel(#"hash_31c57957830a468b");
        self.var_125d962d = util::playfxontag(localclientnum, #"hash_63a413ea4517d35e", self, "tag_origin");
        break;
    case #"energy_mine":
    case #"energy_mine_4":
    case #"hash_4ac3fea4add2a2c9":
    case #"energy_mine_2":
    case #"energy_mine_3":
    case #"energy_mine_1":
        self setmodel(#"hash_4e0fa4e6d257f050");
        self.var_125d962d = util::playfxontag(localclientnum, #"hash_4c6295e27b772b3f", self, "tag_origin");
        break;
    case #"frost_blast":
    case #"frost_blast_1":
    case #"frost_blast_3":
    case #"frost_blast_2":
    case #"frost_blast_5":
    case #"frost_blast_4":
        self setmodel(#"hash_51bb92358aa2d0d7");
        self.var_125d962d = util::playfxontag(localclientnum, #"hash_367649ac4b1edb9e", self, "tag_origin");
        break;
    case #"hash_379869d5b6da974b":
    case #"hash_7b5a77a85b0ffab7":
    case #"hash_37986ad5b6da98fe":
    case #"hash_37986bd5b6da9ab1":
    case #"hash_37986cd5b6da9c64":
    case #"hash_37986dd5b6da9e17":
        self setmodel(#"hash_1635e6bb68e8f84e");
        self.var_125d962d = util::playfxontag(localclientnum, #"hash_4d31e7e4f8d118ff", self, "tag_origin");
        break;
    case #"hash_6319f23758cd411":
    case #"hash_6319e23758cd25e":
    case #"hash_631a023758cd5c4":
    case #"hash_631a123758cd777":
    case #"hash_631a223758cd92a":
    case #"hash_1d9cb9dbd298acba":
        self setmodel(#"hash_6bb0de0ba5c03da7");
        self.var_125d962d = util::playfxontag(localclientnum, #"hash_49b58dc6c3e5fea0", self, "tag_origin");
        break;
    case #"hash_43e323396554dc73":
    case #"hash_43e326396554e18c":
    case #"hash_43e328396554e4f2":
    case #"hash_43e329396554e6a5":
    case #"hash_55569355da0f0f68":
    case #"hash_43e322396554dac0":
        self setmodel(#"hash_29b775e292672631");
        self.var_125d962d = util::playfxontag(localclientnum, #"hash_ee6b19d96021cce", self, "tag_origin");
        break;
    case #"hash_7a071b09cf16c52e":
    case #"hash_7a071c09cf16c6e1":
    case #"hash_7a071d09cf16c894":
    case #"hash_7a071e09cf16ca47":
    case #"hash_7a071f09cf16cbfa":
    case #"hash_5d6f444e983b62ca":
        self setmodel(#"hash_25062c0b1bc0952b");
        self.var_125d962d = util::playfxontag(localclientnum, #"hash_25ed7ba8507500d0", self, "tag_origin");
        break;
    case #"hash_3d62b9c92bbca893":
    case #"hash_3d62bac92bbcaa46":
    case #"hash_3d62bbc92bbcabf9":
    case #"hash_3d62bcc92bbcadac":
    case #"hash_3d62bdc92bbcaf5f":
    case #"hash_148e5880a4f4d46f":
        self setmodel(#"hash_49ac5305b1f71eba");
        self.var_125d962d = util::playfxontag(localclientnum, #"hash_69585875feada15d", self, "tag_origin");
        break;
    }
    waitframe(1);
    self show();
    level.var_e287b16f[localclientnum] = var_addf3c2f;
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0x9adb3403, Offset: 0xb690
// Size: 0x1f8
function function_4dcbc16b(localclientnum, var_3f5552f9, var_53f950ea) {
    if (var_3f5552f9 === #"primary" || var_3f5552f9 === #"secondary") {
        var_4f84f11f = getloadoutweapon(localclientnum, level.var_41c1f7b9, #"primary");
        var_e6cbc2be = getloadoutweapon(localclientnum, level.var_41c1f7b9, #"secondary");
        if (function_cc770c92(var_4f84f11f) && function_cc770c92(var_e6cbc2be) || function_cc770c92(var_53f950ea) && var_3f5552f9 === #"primary" && function_cc770c92(var_e6cbc2be) || function_cc770c92(var_53f950ea) && var_3f5552f9 === #"secondary" && function_cc770c92(var_4f84f11f) || isdefined(level.var_fe51f5a8) && var_3f5552f9 === #"primary" && level.var_fe51f5a8 === var_4f84f11f || isdefined(level.var_fe51f5a8) && var_3f5552f9 === #"secondary" && level.var_fe51f5a8 === var_e6cbc2be) {
            return true;
        }
    }
    return false;
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0x703580f3, Offset: 0xb890
// Size: 0x286
function function_36b453c7(localclientnum, var_8a4ba442, weapon) {
    if (ishash(weapon) || isstring(weapon)) {
        weapon = getweapon(weapon);
    }
    if (var_8a4ba442 === #"primary" || var_8a4ba442 === #"secondary") {
        if (var_8a4ba442 === #"primary") {
            var_3ce5447 = #"secondary";
        } else {
            var_3ce5447 = #"primary";
        }
        if (function_4dcbc16b(localclientnum, var_8a4ba442, weapon)) {
            level.var_fe51f5a8 = getloadoutweapon(localclientnum, level.var_41c1f7b9, var_3ce5447);
            weapon = level.var_fe51f5a8;
        } else {
            weapon = getloadoutweapon(localclientnum, level.var_41c1f7b9, var_3ce5447);
        }
        if (function_cc770c92(weapon) && isdefined(level.weapon_script_model[localclientnum][var_3ce5447]) && isdefined(level.preload_weapon_model[localclientnum][var_3ce5447])) {
            s_position = function_1cd1374d(weapon, var_3ce5447, undefined, localclientnum);
            toggle_locked_weapon_shader(localclientnum, 1, var_3ce5447);
            update_weapon_script_model(localclientnum, weapon.name, function_b4e01020(weapon), undefined, 1, undefined, undefined, var_3ce5447);
            level.weapon_script_model[localclientnum][var_3ce5447].origin = s_position.origin;
            level.weapon_script_model[localclientnum][var_3ce5447].angles = s_position.angles;
            level.weapon_script_model[localclientnum][var_3ce5447] show();
        }
        level.var_fe51f5a8 = undefined;
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x0
// Checksum 0xef26f225, Offset: 0xbb20
// Size: 0x3e
function function_ccfcedeb(localclientnum) {
    if (isdefined(self.var_a8f1ca4e)) {
        stopfx(localclientnum, self.var_a8f1ca4e);
        self.var_a8f1ca4e = undefined;
    }
}

// Namespace customclass/custom_class
// Params 5, eflags: 0x0
// Checksum 0xec528c4e, Offset: 0xbb68
// Size: 0xbc
function change_weapon(localclientnum, var_8a4ba442, newweaponstring, var_f020955, should_update_weapon_options = 0) {
    self notify("310fda479d61d9f");
    self endon("310fda479d61d9f");
    self endon(#"death");
    level endon(#"cam_customization_closed");
    if (isdefined(newweaponstring)) {
        preload_weapon_model(localclientnum, newweaponstring, var_f020955, var_8a4ba442);
        update_weapon_script_model(localclientnum, newweaponstring, var_f020955, should_update_weapon_options, undefined, undefined, undefined, var_8a4ba442);
    }
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x0
// Checksum 0xa3db4bd6, Offset: 0xbc30
// Size: 0x10c
function get_attachments_intersection(oldweapon, var_314432b2, var_6714c3a0) {
    if (!isdefined(oldweapon)) {
        return var_6714c3a0;
    }
    var_3f8fbddf = strtok(var_314432b2, "+");
    var_95e90a5e = strtok(var_6714c3a0, "+");
    if (!isdefined(var_3f8fbddf[0]) || var_3f8fbddf[0] != var_95e90a5e[0]) {
        return var_6714c3a0;
    }
    var_a014270e = var_95e90a5e[0];
    for (i = 1; i < var_95e90a5e.size; i++) {
        if (isinarray(var_3f8fbddf, var_95e90a5e[i])) {
            var_a014270e += "+" + var_95e90a5e[i];
        }
    }
    return var_a014270e;
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0xae8cf47f, Offset: 0xbd48
// Size: 0x7c
function function_34668e22(weapon) {
    if (isweapon(weapon)) {
        var_fda44b34 = function_5f7c1515(weapon);
        if (isdefined(var_fda44b34.var_640479c3)) {
            settings = getscriptbundle(var_fda44b34.var_640479c3);
            return settings;
        }
    }
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x2 linked
// Checksum 0x725028d4, Offset: 0xbdd0
// Size: 0x10e2
function function_5f70d1c8(weapon, var_e81ceea = "") {
    settings = function_34668e22(weapon);
    var_5ac895fb = struct::spawn((isdefined(settings.var_2a929786) ? settings.var_2a929786 : 0, isdefined(settings.var_57d6720d) ? settings.var_57d6720d : 0, isdefined(settings.var_4e105e81) ? settings.var_4e105e81 : 0), (isdefined(settings.var_107b50df) ? settings.var_107b50df : 0, isdefined(settings.var_d9546292) ? settings.var_d9546292 : 0, isdefined(settings.var_eb1f0627) ? settings.var_eb1f0627 : 0));
    if (var_e81ceea == "") {
        var_f3d83915 = (0, 0, 0);
        var_dd6869e3 = (0, 0, 0);
        if (function_cd84dead(weapon, "barrel") && function_cd84dead(weapon, "muzzle")) {
            var_f3d83915 = (isdefined(settings.var_c451d2fd) ? settings.var_c451d2fd : 0, isdefined(settings.var_79913d89) ? settings.var_79913d89 : 0, isdefined(settings.var_8dd96619) ? settings.var_8dd96619 : 0);
            var_dd6869e3 = (isdefined(settings.var_7010317b) ? settings.var_7010317b : 0, isdefined(settings.var_4c5eea19) ? settings.var_4c5eea19 : 0, isdefined(settings.var_3ead4eb6) ? settings.var_3ead4eb6 : 0);
            var_d098ea88 = isdefined(settings.var_38287270) ? settings.var_38287270 : 0;
        } else if (function_cd84dead(weapon, "muzzle")) {
            var_f3d83915 = (isdefined(settings.var_4a27453e) ? settings.var_4a27453e : 0, isdefined(settings.var_5861e1b3) ? settings.var_5861e1b3 : 0, isdefined(settings.var_74941a17) ? settings.var_74941a17 : 0);
            var_dd6869e3 = (isdefined(settings.var_8f5ed804) ? settings.var_8f5ed804 : 0, isdefined(settings.var_81b53cb1) ? settings.var_81b53cb1 : 0, isdefined(settings.var_23e08109) ? settings.var_23e08109 : 0);
            var_d098ea88 = isdefined(settings.var_72dfbab8) ? settings.var_72dfbab8 : 0;
        } else if (function_cd84dead(weapon, "barrel")) {
            var_f3d83915 = (isdefined(settings.var_ba85afd3) ? settings.var_ba85afd3 : 0, isdefined(settings.var_a84b0b5e) ? settings.var_a84b0b5e : 0, isdefined(settings.var_d50064c8) ? settings.var_d50064c8 : 0);
            var_dd6869e3 = (isdefined(settings.var_a903d0e5) ? settings.var_a903d0e5 : 0, isdefined(settings.var_bb36754a) ? settings.var_bb36754a : 0, isdefined(settings.var_cd7899ce) ? settings.var_cd7899ce : 0);
            var_d098ea88 = isdefined(settings.var_12bacd52) ? settings.var_12bacd52 : 0;
        } else if (function_cd84dead(weapon, "stock")) {
            var_f3d83915 = (isdefined(settings.var_504e1d0c) ? settings.var_504e1d0c : 0, isdefined(settings.var_7a9c71a8) ? settings.var_7a9c71a8 : 0, isdefined(settings.var_6ce3d637) ? settings.var_6ce3d637 : 0);
            var_dd6869e3 = (isdefined(settings.var_ddba9446) ? settings.var_ddba9446 : 0, isdefined(settings.var_ebfd30cb) ? settings.var_ebfd30cb : 0, isdefined(settings.var_350942ea) ? settings.var_350942ea : 0);
            var_d098ea88 = isdefined(settings.var_da2aed5a) ? settings.var_da2aed5a : 0;
        }
        var_5ac895fb.origin += var_f3d83915;
        var_5ac895fb.angles += var_dd6869e3;
        var_5ac895fb.scale = isdefined(settings.var_9c241dd8) ? settings.var_9c241dd8 : 1;
        if (isdefined(var_d098ea88)) {
            var_5ac895fb.scale += var_d098ea88;
        }
    } else {
        var_639f35c4 = (0, 0, 0);
        var_31d7e562 = (0, 0, 0);
        switch (var_e81ceea) {
        case #"optic":
            var_639f35c4 = (isdefined(settings.var_679ca3b5) ? settings.var_679ca3b5 : 0, isdefined(settings.var_bc194cb1) ? settings.var_bc194cb1 : 0, isdefined(settings.var_67a5a3cb) ? settings.var_67a5a3cb : 0);
            var_31d7e562 = (isdefined(settings.var_80cb53e7) ? settings.var_80cb53e7 : 0, isdefined(settings.var_9294f77a) ? settings.var_9294f77a : 0, isdefined(settings.var_5d408cd2) ? settings.var_5d408cd2 : 0);
            var_3245d5de = isdefined(settings.var_2685ca21) ? settings.var_2685ca21 : 0;
            break;
        case #"muzzle":
            var_639f35c4 = (isdefined(settings.var_89849ace) ? settings.var_89849ace : 0, isdefined(settings.var_f73a7638) ? settings.var_f73a7638 : 0, isdefined(settings.var_77edf7a1) ? settings.var_77edf7a1 : 0);
            var_31d7e562 = (isdefined(settings.var_390d2d1) ? settings.var_390d2d1 : 0, isdefined(settings.var_19bdff2b) ? settings.var_19bdff2b : 0, isdefined(settings.var_e7ef1b8e) ? settings.var_e7ef1b8e : 0);
            var_3245d5de = isdefined(settings.var_b3516d45) ? settings.var_b3516d45 : 0;
            break;
        case #"barrel":
            var_639f35c4 = (isdefined(settings.var_7c3d339b) ? settings.var_7c3d339b : 0, isdefined(settings.var_6e029726) ? settings.var_6e029726 : 0, isdefined(settings.var_a0bffca0) ? settings.var_a0bffca0 : 0);
            var_31d7e562 = (isdefined(settings.var_8ca3e332) ? settings.var_8ca3e332 : 0, isdefined(settings.var_7ee247af) ? settings.var_7ee247af : 0, isdefined(settings.var_47f3d9d3) ? settings.var_47f3d9d3 : 0);
            var_3245d5de = isdefined(settings.var_ad8114a5) ? settings.var_ad8114a5 : 0;
            break;
        case #"underbarrel":
            var_639f35c4 = (isdefined(settings.var_98adab76) ? settings.var_98adab76 : 0, isdefined(settings.var_74056226) ? settings.var_74056226 : 0, isdefined(settings.var_66bec799) ? settings.var_66bec799 : 0);
            var_31d7e562 = (isdefined(settings.var_d03599ea) ? settings.var_d03599ea : 0, isdefined(settings.var_9258bc1) ? settings.var_9258bc1 : 0, isdefined(settings.var_2e65d641) ? settings.var_2e65d641 : 0);
            var_3245d5de = isdefined(settings.var_c8287774) ? settings.var_c8287774 : 0;
            break;
        case #"body":
            var_639f35c4 = (isdefined(settings.var_d0af4d25) ? settings.var_d0af4d25 : 0, isdefined(settings.var_e2ea719b) ? settings.var_e2ea719b : 0, isdefined(settings.var_b75b1a7d) ? settings.var_b75b1a7d : 0);
            var_31d7e562 = (isdefined(settings.var_807fd135) ? settings.var_807fd135 : 0, isdefined(settings.var_66581c7a) ? settings.var_66581c7a : 0, isdefined(settings.var_5beb080c) ? settings.var_5beb080c : 0);
            var_3245d5de = isdefined(settings.var_ca6cd5d0) ? settings.var_ca6cd5d0 : 0;
            break;
        case #"stock":
            var_639f35c4 = (isdefined(settings.var_933f2ee0) ? settings.var_933f2ee0 : 0, isdefined(settings.var_7d95038c) ? settings.var_7d95038c : 0, isdefined(settings.var_210b4a7a) ? settings.var_210b4a7a : 0);
            var_31d7e562 = (isdefined(settings.var_14141efc) ? settings.var_14141efc : 0, isdefined(settings.var_3a32eb39) ? settings.var_3a32eb39 : 0, isdefined(settings.var_2858c785) ? settings.var_2858c785 : 0);
            var_3245d5de = isdefined(settings.var_72fa56e9) ? settings.var_72fa56e9 : 0;
            break;
        case #"magazine":
            var_639f35c4 = (isdefined(settings.var_c1b38db7) ? settings.var_c1b38db7 : 0, isdefined(settings.var_f5f1f633) ? settings.var_f5f1f633 : 0, isdefined(settings.var_e42f52ae) ? settings.var_e42f52ae : 0);
            var_31d7e562 = (isdefined(settings.var_91fc7515) ? settings.var_91fc7515 : 0, isdefined(settings.var_80a5d268) ? settings.var_80a5d268 : 0, isdefined(settings.var_5ed38ec4) ? settings.var_5ed38ec4 : 0);
            var_3245d5de = isdefined(settings.var_b41f3012) ? settings.var_b41f3012 : 0;
            break;
        case #"handle":
            var_639f35c4 = (isdefined(settings.var_41ebb7d) ? settings.var_41ebb7d : 0, isdefined(settings.var_ab648ac) ? settings.var_ab648ac : 0, isdefined(settings.var_18806440) ? settings.var_18806440 : 0);
            var_31d7e562 = (isdefined(settings.var_59c4fda9) ? settings.var_59c4fda9 : 0, isdefined(settings.var_ebd421b9) ? settings.var_ebd421b9 : 0, isdefined(settings.var_5983fd1b) ? settings.var_5983fd1b : 0);
            var_3245d5de = isdefined(settings.var_52846704) ? settings.var_52846704 : 0;
            break;
        }
        var_5ac895fb.origin += var_639f35c4;
        var_5ac895fb.angles += var_31d7e562;
        var_5ac895fb.scale = isdefined(settings.var_9c241dd8) ? settings.var_9c241dd8 : 1;
        if (isdefined(var_3245d5de)) {
            var_5ac895fb.scale += var_3245d5de;
        }
    }
    var_5ac895fb.var_d9843c11 = settings.var_6b6e0c5a;
    var_5ac895fb.var_e9a585d8 = settings.var_6b26bcfc;
    return var_5ac895fb;
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0x7cff4f09, Offset: 0xcec0
// Size: 0xd5a
function function_3bff05ba(weapon, var_8a4ba442, localclientnum = 0) {
    settings = function_34668e22(weapon);
    var_f3d83915 = (0, 0, 0);
    var_dd6869e3 = (0, 0, 0);
    if (function_cd84dead(weapon, "barrel") && function_cd84dead(weapon, "muzzle")) {
        var_f3d83915 = (isdefined(settings.var_d58892) ? settings.var_d58892 : 0, isdefined(settings.var_80c00869) ? settings.var_80c00869 : 0, isdefined(settings.var_ee9ae41d) ? settings.var_ee9ae41d : 0);
        var_dd6869e3 = (isdefined(settings.var_acdc6bf0) ? settings.var_acdc6bf0 : 0, isdefined(settings.var_9e8acf4d) ? settings.var_9e8acf4d : 0, isdefined(settings.var_fa188663) ? settings.var_fa188663 : 0);
        var_d098ea88 = isdefined(settings.var_7bba1c55) ? settings.var_7bba1c55 : 0;
    } else if (function_cd84dead(weapon, "muzzle")) {
        var_f3d83915 = (isdefined(settings.var_b633cdaf) ? settings.var_b633cdaf : 0, isdefined(settings.var_dad616fb) ? settings.var_dad616fb : 0, isdefined(settings.var_e88bb266) ? settings.var_e88bb266 : 0);
        var_dd6869e3 = (isdefined(settings.var_6a09650) ? settings.var_6a09650 : 0, isdefined(settings.var_18e1bad2) ? settings.var_18e1bad2 : 0, isdefined(settings.var_50dbaae9) ? settings.var_50dbaae9 : 0);
        var_d098ea88 = isdefined(settings.var_ab56153b) ? settings.var_ab56153b : 0;
    } else if (function_cd84dead(weapon, "barrel")) {
        var_f3d83915 = (isdefined(settings.var_50e7f41f) ? settings.var_50e7f41f : 0, isdefined(settings.var_3fa15192) ? settings.var_3fa15192 : 0, isdefined(settings.var_7590bd70) ? settings.var_7590bd70 : 0);
        var_dd6869e3 = (isdefined(settings.var_892173b6) ? settings.var_892173b6 : 0, isdefined(settings.var_7adad729) ? settings.var_7adad729 : 0, isdefined(settings.var_548b8a8b) ? settings.var_548b8a8b : 0);
        var_d098ea88 = isdefined(settings.var_a8f47ab) ? settings.var_a8f47ab : 0;
    } else if (function_cd84dead(weapon, "stock")) {
        var_f3d83915 = (isdefined(settings.var_ec765089) ? settings.var_ec765089 : 0, isdefined(settings.var_3ba0eee1) ? settings.var_3ba0eee1 : 0, isdefined(settings.var_ca0b8bb4) ? settings.var_ca0b8bb4 : 0);
        var_dd6869e3 = (isdefined(settings.var_8290a87e) ? settings.var_8290a87e : 0, isdefined(settings.var_a8c7f4ec) ? settings.var_a8c7f4ec : 0, isdefined(settings.var_5fa9e2b1) ? settings.var_5fa9e2b1 : 0);
        var_d098ea88 = isdefined(settings.var_f5a9d911) ? settings.var_f5a9d911 : 0;
    }
    var_2cbf4808 = struct::spawn((isdefined(settings.var_6ee0b1d8) ? settings.var_6ee0b1d8 : 0, isdefined(settings.var_5cae8d74) ? settings.var_5cae8d74 : 0, isdefined(settings.var_8934e680) ? settings.var_8934e680 : 0), (isdefined(settings.var_cf03cb96) ? settings.var_cf03cb96 : 0, isdefined(settings.var_4f264bd9) ? settings.var_4f264bd9 : 0, isdefined(settings.var_84f7b77f) ? settings.var_84f7b77f : 0));
    var_2cbf4808.origin += var_f3d83915;
    var_2cbf4808.angles += var_dd6869e3;
    var_2cbf4808.scale = isdefined(settings.var_a31af46c) ? settings.var_a31af46c : 1;
    if (isdefined(var_d098ea88)) {
        var_2cbf4808.scale += var_d098ea88;
    }
    var_2cbf4808.var_697bf2ff = settings.var_a20b23a4;
    var_2cbf4808.var_d9843c11 = settings.var_6b6e0c5a;
    var_2cbf4808.var_e9a585d8 = settings.var_e7072e63;
    var_2cbf4808.var_c492a06c = settings.var_8119af8f;
    if (function_cc770c92(weapon) && (var_8a4ba442 === #"secondary" || var_8a4ba442 === #"primary" && !function_4dcbc16b(localclientnum, var_8a4ba442, weapon))) {
        var_2cbf4808.var_697bf2ff = undefined;
    }
    if (var_8a4ba442 === #"primary" || var_8a4ba442 == #"secondary") {
        var_7975e84f = var_2cbf4808.origin;
        if (!function_b8990106(localclientnum, var_8a4ba442, weapon)) {
            var_f617db00 = 1;
        }
    } else {
        var_7975e84f = (0, 0, 0);
    }
    if (is_true(var_f617db00)) {
        var_2cbf4808.var_a5946026 = var_7975e84f + (isdefined(settings.var_a29aa4a) ? settings.var_a29aa4a : 0, isdefined(settings.var_fc750ee1) ? settings.var_fc750ee1 : 0, isdefined(settings.var_2ec07377) ? settings.var_2ec07377 : 0);
        var_2cbf4808.var_a7adf514 = var_7975e84f + (isdefined(settings.var_9326937c) ? settings.var_9326937c : 0, isdefined(settings.var_b154cfd8) ? settings.var_b154cfd8 : 0, isdefined(settings.var_db89243c) ? settings.var_db89243c : 0);
        var_2cbf4808.var_36859b17 = var_7975e84f + (isdefined(settings.var_91d3fe8f) ? settings.var_91d3fe8f : 0, isdefined(settings.var_7f0d5902) ? settings.var_7f0d5902 : 0, isdefined(settings.var_2d4fb580) ? settings.var_2d4fb580 : 0);
        if (function_cc770c92(weapon)) {
            if (var_8a4ba442 === #"primary" && function_4dcbc16b(localclientnum, var_8a4ba442, weapon)) {
                var_2cbf4808.origin += (isdefined(settings.var_ac657f76) ? settings.var_ac657f76 : 0, isdefined(settings.var_e130690b) ? settings.var_e130690b : 0, isdefined(settings.var_87eeb689) ? settings.var_87eeb689 : 0);
                var_2cbf4808.angles += (isdefined(settings.var_6d848856) ? settings.var_6d848856 : 0, isdefined(settings.var_a13b6fc3) ? settings.var_a13b6fc3 : 0, isdefined(settings.var_8b0e4369) ? settings.var_8b0e4369 : 0);
            }
        } else {
            var_2cbf4808.origin += (isdefined(settings.var_ac657f76) ? settings.var_ac657f76 : 0, isdefined(settings.var_e130690b) ? settings.var_e130690b : 0, isdefined(settings.var_87eeb689) ? settings.var_87eeb689 : 0);
            var_2cbf4808.angles += (isdefined(settings.var_6d848856) ? settings.var_6d848856 : 0, isdefined(settings.var_a13b6fc3) ? settings.var_a13b6fc3 : 0, isdefined(settings.var_8b0e4369) ? settings.var_8b0e4369 : 0);
        }
    } else {
        var_2cbf4808.var_a5946026 = var_7975e84f + (isdefined(settings.var_b058b27b) ? settings.var_b058b27b : 0, isdefined(settings.var_13c87959) ? settings.var_13c87959 : 0, isdefined(settings.var_229096ed) ? settings.var_229096ed : 0);
        var_2cbf4808.var_a7adf514 = var_7975e84f + (isdefined(settings.var_c287975b) ? settings.var_c287975b : 0, isdefined(settings.var_f0b173ae) ? settings.var_f0b173ae : 0, isdefined(settings.var_9e06ce56) ? settings.var_9e06ce56 : 0);
        var_2cbf4808.var_36859b17 = var_7975e84f + (isdefined(settings.var_d0a96d99) ? settings.var_d0a96d99 : 0, isdefined(settings.var_bd3046a3) ? settings.var_bd3046a3 : 0, isdefined(settings.var_d0766d2f) ? settings.var_d0766d2f : 0);
    }
    return var_2cbf4808;
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x3b648c0e, Offset: 0xdc28
// Size: 0x256
function function_fa001ebb(weapon) {
    settings = function_34668e22(weapon);
    var_9913fe4a = struct::spawn((isdefined(settings.var_7fe4cc7f) ? settings.var_7fe4cc7f : 0, isdefined(settings.var_c8ffdeb4) ? settings.var_c8ffdeb4 : 0, isdefined(settings.var_d342f33a) ? settings.var_d342f33a : 0), (isdefined(settings.var_2bc74d91) ? settings.var_2bc74d91 : 0, isdefined(settings.var_d6dfa3c3) ? settings.var_d6dfa3c3 : 0, isdefined(settings.var_c82d065e) ? settings.var_c82d065e : 0));
    var_f3d83915 = (0, 0, 0);
    var_dd6869e3 = (0, 0, 0);
    var_9913fe4a.origin += var_f3d83915;
    var_9913fe4a.angles += var_dd6869e3;
    var_7a54b7d9 = (isdefined(settings.var_3ff74cc1) ? settings.var_3ff74cc1 : 0, isdefined(settings.var_9c560581) ? settings.var_9c560581 : 0, isdefined(settings.var_9f2225e6) ? settings.var_9f2225e6 : 0);
    var_9913fe4a.rotationoffset = var_7a54b7d9;
    var_9913fe4a.scale = isdefined(settings.var_6332d1f5) ? settings.var_6332d1f5 : 1;
    var_9913fe4a.var_d9843c11 = settings.var_6b6e0c5a;
    var_9913fe4a.var_e9a585d8 = settings.var_eb37013d;
    return var_9913fe4a;
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x4a4a1eb4, Offset: 0xde88
// Size: 0x1ce
function function_add95f58(weapon) {
    settings = function_34668e22(weapon);
    var_c5f370c1 = struct::spawn((isdefined(settings.var_444f1209) ? settings.var_444f1209 : 0, isdefined(settings.var_b70f778c) ? settings.var_b70f778c : 0, isdefined(settings.var_5dd9451d) ? settings.var_5dd9451d : 0), (isdefined(settings.var_21b142f4) ? settings.var_21b142f4 : 0, isdefined(settings.var_12efa571) ? settings.var_12efa571 : 0, isdefined(settings.var_46170bbf) ? settings.var_46170bbf : 0));
    var_f3d83915 = (0, 0, 0);
    var_dd6869e3 = (0, 0, 0);
    var_c5f370c1.origin += var_f3d83915;
    var_c5f370c1.angles += var_dd6869e3;
    var_c5f370c1.scale = isdefined(settings.var_db80b7d6) ? settings.var_db80b7d6 : 1;
    var_c5f370c1.var_d9843c11 = settings.var_6b6e0c5a;
    var_c5f370c1.var_e9a585d8 = settings.var_86ceec6b;
    return var_c5f370c1;
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x2 linked
// Checksum 0x978a217c, Offset: 0xe060
// Size: 0x1ce
function function_82f74dec(weapon) {
    settings = function_34668e22(weapon);
    var_924554cd = struct::spawn((isdefined(settings.var_a50c452a) ? settings.var_a50c452a : 0, isdefined(settings.var_9e2cb76b) ? settings.var_9e2cb76b : 0, isdefined(settings.var_8f829a17) ? settings.var_8f829a17 : 0), (isdefined(settings.var_80af3417) ? settings.var_80af3417 : 0, isdefined(settings.var_e3e4f37) ? settings.var_e3e4f37 : 0, isdefined(settings.var_388aa3d3) ? settings.var_388aa3d3 : 0));
    var_f3d83915 = (0, 0, 0);
    var_dd6869e3 = (0, 0, 0);
    var_924554cd.origin += var_f3d83915;
    var_924554cd.angles += var_dd6869e3;
    var_924554cd.scale = isdefined(settings.var_b37b7688) ? settings.var_b37b7688 : 1;
    var_924554cd.var_d9843c11 = settings.var_6b6e0c5a;
    var_924554cd.var_e9a585d8 = settings.var_aacab320;
    return var_924554cd;
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x2 linked
// Checksum 0x2dba7d74, Offset: 0xe238
// Size: 0x15e
function function_ae73f57f(localclientnum, var_8a4ba442, var_e81ceea) {
    if (isdefined(var_8a4ba442)) {
        switch (var_8a4ba442) {
        case #"gunsmith":
            s_info = function_5f70d1c8(level.current_weapon[localclientnum], var_e81ceea);
            break;
        case #"hash_2fda3f64c5caa89e":
            s_info = function_fa001ebb(level.current_weapon[localclientnum]);
            break;
        case #"charm":
            s_info = function_add95f58(level.current_weapon[localclientnum]);
            break;
        case #"stickers":
            s_info = function_82f74dec(level.current_weapon[localclientnum]);
            break;
        default:
            s_info = function_3bff05ba(level.current_weapon[localclientnum], var_8a4ba442, localclientnum);
            break;
        }
    }
    return s_info;
}

// Namespace customclass/custom_class
// Params 5, eflags: 0x2 linked
// Checksum 0xe8dc2408, Offset: 0xe3a0
// Size: 0x1b2
function function_17a3348d(localclientnum, var_8a4ba442, str_blueprint, s_info = function_ae73f57f(localclientnum, var_8a4ba442, var_e81ceea), var_e81ceea) {
    if (isarray(s_info.var_e9a585d8)) {
        foreach (var_9c7f3b78 in s_info.var_e9a585d8) {
            if (str_blueprint === var_9c7f3b78.var_8694d12d) {
                var_a5b5d950 = var_9c7f3b78.var_6b6e0c5a;
                break;
            }
        }
        if (!isdefined(var_a5b5d950)) {
            foreach (var_9c7f3b78 in s_info.var_e9a585d8) {
                if (!isdefined(var_9c7f3b78.var_8694d12d)) {
                    var_a5b5d950 = var_9c7f3b78.var_6b6e0c5a;
                    break;
                }
            }
        }
    }
    return isdefined(var_a5b5d950) ? var_a5b5d950 : s_info.var_d9843c11;
}

