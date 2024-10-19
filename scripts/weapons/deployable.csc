// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace deployable;

// Namespace deployable/deployable
// Params 0, eflags: 0x5
// Checksum 0xd5c02352, Offset: 0x110
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"deployable", &preinit, undefined, undefined, undefined);
}

// Namespace deployable/deployable
// Params 0, eflags: 0x6 linked
// Checksum 0x754d13f, Offset: 0x158
// Size: 0x6c
function private preinit() {
    if (!isdefined(level._deployable_weapons)) {
        level._deployable_weapons = [];
    }
    level.var_c442de72 = &function_c1ee2dce;
    level thread group_mega_round_end_abcd_talking();
    if (!isdefined(level.var_1765ad79)) {
        level.var_1765ad79 = 1;
    }
}

// Namespace deployable/deployable
// Params 2, eflags: 0x2 linked
// Checksum 0x57902873, Offset: 0x1d0
// Size: 0xa2
function register_deployable(weapon, var_7ec218c6) {
    if (weapon.name == #"none") {
        return;
    }
    assert(weapon.name != #"none");
    level._deployable_weapons[weapon.statindex] = spawnstruct();
    level._deployable_weapons[weapon.statindex].var_7ec218c6 = var_7ec218c6;
}

// Namespace deployable/deployable
// Params 1, eflags: 0x0
// Checksum 0x2edc6b8b, Offset: 0x280
// Size: 0x84
function function_3e8d9b27(previs_weapon) {
    previs_model = self;
    if (isdefined(previs_weapon.var_4bcd08b0)) {
        previs_model setmodel(previs_weapon.var_4bcd08b0);
    } else {
        previs_model setmodel(#"hash_7a80bed4a96537e6");
    }
    previs_model notsolid();
}

// Namespace deployable/deployable
// Params 3, eflags: 0x2 linked
// Checksum 0xf0ec3870, Offset: 0x310
// Size: 0x6c
function function_c1ee2dce(player, localclientnum, weapon) {
    var_314a434f = function_35d1c69f(localclientnum, player, weapon);
    player function_bf191832(var_314a434f.isvalid, var_314a434f.origin, var_314a434f.angles);
}

// Namespace deployable/deployable
// Params 3, eflags: 0x2 linked
// Checksum 0xee17cc15, Offset: 0x388
// Size: 0x1aa
function function_35d1c69f(localclientnum, player, weapon) {
    if (!weapon.var_dbbd4cec) {
        var_10c45189 = player function_242060b9(weapon);
        var_7ed1816f = var_10c45189.isvalid || isdefined(level._deployable_weapons[weapon.statindex]) && (isdefined(level._deployable_weapons[weapon.statindex].var_7ec218c6) ? level._deployable_weapons[weapon.statindex].var_7ec218c6 : 0);
    } else {
        var_7ed1816f = 1;
        var_10c45189 = {#isvalid:1, #origin:player.origin, #angles:player.angles};
    }
    var_c3743e82 = !level.var_1765ad79 || function_e0d90bc8(localclientnum) || is_true(weapon.var_33d50507);
    gameplay_allows_deploy = player clientfield::get_to_player("gameplay_allows_deploy");
    var_10c45189.isvalid = var_7ed1816f && gameplay_allows_deploy && var_c3743e82;
    return var_10c45189;
}

// Namespace deployable/deployable
// Params 1, eflags: 0x2 linked
// Checksum 0xa0d667e5, Offset: 0x540
// Size: 0x2d0
function group_mega_round_end_abcd_talking(localclientnum = 0) {
    level notify("previs_deployable_" + localclientnum);
    level endon("previs_deployable_" + localclientnum);
    wait(10);
    previs_model = spawn(localclientnum, (0, 0, 0), "script_model");
    previs_weapon = getweapon(#"eq_alarm");
    var_5929417d = 0;
    var_2e40ce22 = 0;
    var_d4d81eb4 = 0;
    while (true) {
        var_fdadca2a = previs_weapon;
        if (!var_5929417d) {
            if (var_2e40ce22 == 1) {
                previs_model stoprenderoverridebundle("rob_deployable_can_deploy");
            }
            if (var_d4d81eb4 == 1) {
                previs_model stoprenderoverridebundle("rob_deployable_cannot_deploy");
            }
            var_2e40ce22 = 0;
            var_d4d81eb4 = 0;
            if (isdefined(previs_model)) {
                previs_model hide();
            }
            wait(0.2);
        } else {
            waitframe(1);
        }
        var_5929417d = 0;
        if (getdvarint(#"hash_4df6a4cc1cfae912", 1) == 0) {
            continue;
        }
        player = function_5c10bd79(localclientnum);
        if (!isdefined(player)) {
            continue;
        }
        if (!isalive(player)) {
            continue;
        }
        previs_weapon = undefined;
        if (function_96d4f30e(localclientnum)) {
            previs_weapon = function_e9fe14ee(localclientnum);
        } else {
            previs_weapon = player.weapon;
        }
        if (!previs_weapon.deployable || previs_weapon.var_e0d42861) {
            continue;
        }
        if (function_c7b681af(localclientnum)) {
            var_5929417d = 1;
            continue;
        }
        var_314a434f = function_35d1c69f(localclientnum, player, previs_weapon);
        player function_bf191832(var_314a434f.isvalid, var_314a434f.origin, var_314a434f.angles);
    }
}

