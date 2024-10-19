// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\struct.csc;
#using script_72587ba89a212e22;
#using script_6741a9edbcf6c25e;
#using script_6a72d858ff1942eb;
#using script_7222862da5baa189;
#using script_4a04e1760d0523d3;
#using script_680dddbda86931fa;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace fireteam_dirty_bomb;

// Namespace fireteam_dirty_bomb/gametype_init
// Params 1, eflags: 0x20
// Checksum 0x56de212b, Offset: 0x348
// Size: 0x3cc
function event_handler[gametype_init] main(*eventstruct) {
    if (!namespace_681edb36::function_23dd41e7()) {
        return;
    }
    namespace_2938acdc::init();
    dirtybomb_usebar::register(undefined, &function_866f5f2c);
    clientfield::register("toplayer", "using_bomb", 1, 2, "int", &function_18272d54, 0, 0);
    clientfield::register_clientuimodel("hudItems.uraniumCarryCount", #"hash_6f4b11a0bee9b73d", #"hash_556b3df8ae964e7c", 1, 4, "int", undefined, 0, 0);
    clientfield::register_clientuimodel("hudItems.uraniumMaxCarry", #"hash_6f4b11a0bee9b73d", #"hash_1879fbcae78c5417", 1, 4, "int", undefined, 0, 0);
    clientfield::register_clientuimodel("hudItems.uraniumFullCarry", #"hash_6f4b11a0bee9b73d", #"hash_451ab3abde68434a", 1, 1, "int", undefined, 0, 0);
    clientfield::register("allplayers", "carryingUranium", 1, 1, "int", &function_46afac0, 0, 1);
    clientfield::register("scriptmover", "bombsound", 1, 1, "int", &function_f20fb48, 0, 0);
    clientfield::function_5b7d846d("hud_items_dirty_bomb.bomb_respawn_disabled", #"hash_1115137708f64303", #"hash_611630c939ad1b67", 1, 1, "int", undefined, 0, 0);
    level.var_b637a0c0 = &function_e99f251a;
    level.var_75f7e612 = &function_218c0417;
    level.var_977ee0c2 = &function_a2807fc5;
    level.squadspawnactive = &function_f4f21a7f;
    level.var_6ed4a19b = &function_ba474e49;
    level.dirtybombs = struct::get_array("fireteam_dirty_bomb", "variantname");
    namespace_681edb36::function_dd83b835();
    namespace_b77e8eb1::init();
    level.var_696298a2 = getweapon(#"hash_46cc133cf4065ae0");
    level.var_184c9036 = [];
    level.var_5976039d = [];
    level.var_c21cfcdf = [];
    for (i = 0; i < 4; i++) {
        level.var_5976039d[i] = [];
    }
    callback::on_localclient_connect(&on_localclient_connect);
}

// Namespace fireteam_dirty_bomb/fireteam_dirty_bomb
// Params 1, eflags: 0x2 linked
// Checksum 0x516b949d, Offset: 0x720
// Size: 0x94
function on_localclient_connect(localclientnum) {
    var_2612e01d = function_1df4c3b0(localclientnum, #"hash_950d3dccba39e08");
    var_1e885680 = getuimodel(var_2612e01d, "count");
    setuimodelvalue(var_1e885680, 4);
    level thread function_bb2f717e(localclientnum);
}

// Namespace fireteam_dirty_bomb/fireteam_dirty_bomb
// Params 1, eflags: 0x6 linked
// Checksum 0x2c7589b0, Offset: 0x7c0
// Size: 0x2f6
function private function_bb2f717e(localclientnum) {
    self endon(#"shutdown");
    var_61efd7d9 = [];
    for (index = 0; index < 5; index++) {
        model = spawn(localclientnum, (0, 0, 0), "script_model");
        model setmodel(#"tag_origin");
        model hide();
        model notsolid();
        var_61efd7d9[var_61efd7d9.size] = model;
    }
    while (true) {
        if (!isdefined(level.item_spawn_stashes)) {
            wait(1);
            continue;
        }
        draworigin = getcamposbylocalclientnum(localclientnum);
        containers = arraysortclosest(level.item_spawn_stashes, draworigin, 5, 0, 1500);
        var_7dcc7dd4 = [];
        for (index = 0; index < containers.size; index++) {
            if (!function_8a8a409b(containers[index])) {
                continue;
            }
            if (function_ffdbe8c2(containers[index]) != 2) {
                var_7dcc7dd4[var_7dcc7dd4.size] = containers[index];
            }
        }
        containers = var_7dcc7dd4;
        for (index = 0; index < containers.size; index++) {
            var_61efd7d9[index].origin = containers[index].origin;
            if (isdefined(var_61efd7d9[index].var_95f008e)) {
                continue;
            }
            var_61efd7d9[index].var_95f008e = var_61efd7d9[index] playloopsound("amb_dirtybomb_container_amb", undefined, (0, 0, 25));
            var_61efd7d9[index] show();
        }
        for (index = containers.size; index < 5; index++) {
            if (!isdefined(var_61efd7d9[index].var_95f008e)) {
                continue;
            }
            var_61efd7d9[index] stoploopsound(var_61efd7d9[index].var_95f008e);
            var_61efd7d9[index].var_95f008e = undefined;
            var_61efd7d9[index] hide();
        }
        wait(1);
    }
}

// Namespace fireteam_dirty_bomb/fireteam_dirty_bomb
// Params 2, eflags: 0x6 linked
// Checksum 0x8beec1a4, Offset: 0xac0
// Size: 0x148
function private function_e99f251a(*localclientnum, itementry) {
    if (itementry.itemtype == #"generic") {
        switch (itementry.name) {
        case #"hash_44cca2edb9c2041c":
            return (self clientfield::get_player_uimodel("hudItems.armorPlateMaxCarry") != 10);
        case #"hash_b8b2580ac5556e1":
            return (self clientfield::get_player_uimodel("hud_items.selfReviveAvailable") == 0);
        case #"hash_1aec65ecd6b7a5f2":
            return (self clientfield::get_player_uimodel("hudItems.uraniumMaxCarry") != 10);
        case #"hash_583f1687cefbd3f3":
            return !namespace_234f0efc::function_d1aaf7a4();
        }
        return false;
    } else if (itementry.itemtype == #"armor_shard") {
        return false;
    }
    return true;
}

// Namespace fireteam_dirty_bomb/fireteam_dirty_bomb
// Params 2, eflags: 0x6 linked
// Checksum 0x2b90350c, Offset: 0xc10
// Size: 0xee
function private function_218c0417(*localclientnum, itementry) {
    if (itementry.itemtype == #"generic") {
        if (itementry.name == "uranium_item_t9") {
            var_e3483afe = self clientfield::get_player_uimodel("hudItems.uraniumCarryCount");
            if (var_e3483afe >= self clientfield::get_player_uimodel("hudItems.uraniumMaxCarry")) {
                return false;
            }
        }
        return false;
    } else if (itementry.itemtype == #"armor_shard") {
        currentcount = self clientfield::get_player_uimodel("hudItems.armorPlateCount");
        return (currentcount < 5);
    }
    return true;
}

// Namespace fireteam_dirty_bomb/fireteam_dirty_bomb
// Params 2, eflags: 0x6 linked
// Checksum 0x308dd0fe, Offset: 0xd08
// Size: 0x12a
function private function_a2807fc5(localclientnum, itementry) {
    if (itementry.itemtype == #"scorestreak") {
        weapons = self getweaponslist();
        foreach (weapon in weapons) {
            var_16f12c31 = item_world_util::function_3531b9ba(weapon.name);
            if (!isdefined(var_16f12c31)) {
                continue;
            }
            hasammo = self getweaponammostock(localclientnum, weapon) > 0;
            if (hasammo) {
                return true;
            }
        }
        return false;
    }
    return false;
}

// Namespace fireteam_dirty_bomb/fireteam_dirty_bomb
// Params 7, eflags: 0x6 linked
// Checksum 0xdabdd839, Offset: 0xe40
// Size: 0x16e
function private function_18272d54(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump > 0) {
        if (bwastimejump == 1) {
            self.var_a1aa992c = function_604c9983(fieldname, "fly_uranium_deposit_lp");
        } else if (bwastimejump == 2) {
            self.var_53f712e3 = function_604c9983(fieldname, "fly_uranium_priming_lp");
            self thread function_c24ee98c(fieldname);
        }
        self thread function_6e9e7ead(fieldname);
        return;
    }
    self notify(#"hash_470a1e2ae77ad9f2");
    if (isdefined(self.var_a1aa992c)) {
        function_d48752e(fieldname, self.var_a1aa992c);
        self.var_a1aa992c = undefined;
    }
    if (isdefined(self.var_53f712e3)) {
        function_d48752e(fieldname, self.var_53f712e3);
        self.var_53f712e3 = undefined;
    }
}

// Namespace fireteam_dirty_bomb/fireteam_dirty_bomb
// Params 1, eflags: 0x6 linked
// Checksum 0xdf90914, Offset: 0xfb8
// Size: 0x2c4
function private function_c24ee98c(localclientnum) {
    self endoncallback(&function_ea6da5f6, #"death", #"hash_470a1e2ae77ad9f2");
    level endon(#"game_ended");
    var_ede06f5d = gettime();
    while (true) {
        waitframe(1);
        if (getcurrentweapon(localclientnum) == level.var_696298a2) {
            level.var_c21cfcdf[localclientnum] = 1;
            var_de8c9d40 = level.var_184c9036[localclientnum];
            if (!isdefined(var_de8c9d40)) {
                continue;
            }
            for (i = 0; i < 4; i++) {
                if (var_de8c9d40 > i && !isdefined(level.var_5976039d[i][localclientnum])) {
                    fxtag = "tag_fx";
                    if (i < 3) {
                        fxtag += string(3 - i);
                    }
                    level.var_5976039d[i][localclientnum] = playviewmodelfx(localclientnum, "weapon/fx9_equip_dirtybomb_detonator_light", fxtag);
                    continue;
                }
                if (var_de8c9d40 <= i && isdefined(level.var_5976039d[i][localclientnum])) {
                    killfx(localclientnum, level.var_5976039d[i][localclientnum]);
                    level.var_5976039d[i][localclientnum] = undefined;
                }
            }
            continue;
        }
        if (is_true(level.var_c21cfcdf[localclientnum]) || gettime() > var_ede06f5d + int(1.5 * 1000)) {
            for (i = 0; i < 4; i++) {
                if (isdefined(level.var_5976039d[i][localclientnum])) {
                    killfx(localclientnum, level.var_5976039d[i][localclientnum]);
                    level.var_5976039d[i][localclientnum] = undefined;
                }
            }
            level.var_c21cfcdf[localclientnum] = undefined;
            break;
        }
    }
}

// Namespace fireteam_dirty_bomb/fireteam_dirty_bomb
// Params 0, eflags: 0x6 linked
// Checksum 0xc97307dc, Offset: 0x1288
// Size: 0x130
function private function_ea6da5f6() {
    var_236b121a = function_41bfa501();
    foreach (localclientnum in var_236b121a) {
        if (is_true(level.var_c21cfcdf[localclientnum])) {
            for (i = 0; i < 4; i++) {
                if (isdefined(level.var_5976039d[i][localclientnum])) {
                    killfx(localclientnum, level.var_5976039d[i][localclientnum]);
                    level.var_5976039d[i][localclientnum] = undefined;
                }
            }
            level.var_c21cfcdf[localclientnum] = undefined;
        }
    }
}

// Namespace fireteam_dirty_bomb/fireteam_dirty_bomb
// Params 7, eflags: 0x6 linked
// Checksum 0xc8066718, Offset: 0x13c0
// Size: 0x4c
function private function_866f5f2c(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    level.var_184c9036[fieldname] = bwastimejump;
}

// Namespace fireteam_dirty_bomb/fireteam_dirty_bomb
// Params 1, eflags: 0x6 linked
// Checksum 0x3dfec195, Offset: 0x1418
// Size: 0xc6
function private function_6e9e7ead(localclientnum) {
    if (is_true(self.var_16778c9b)) {
        return;
    }
    self.var_16778c9b = 1;
    self waittill(#"death");
    self.var_16778c9b = 0;
    if (isdefined(self.var_a1aa992c)) {
        function_d48752e(localclientnum, self.var_a1aa992c);
        self.var_a1aa992c = undefined;
    }
    if (isdefined(self.var_53f712e3)) {
        function_d48752e(localclientnum, self.var_53f712e3);
        self.var_53f712e3 = undefined;
    }
}

// Namespace fireteam_dirty_bomb/fireteam_dirty_bomb
// Params 7, eflags: 0x6 linked
// Checksum 0x8f1daeb2, Offset: 0x14e8
// Size: 0xde
function private function_46afac0(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        localplayer = getlocalplayers()[fieldname];
        if (self.team != localplayer.team) {
            self.var_1ae360e = self playloopsound("fly_uranium_carry_3p");
        }
        return;
    }
    if (isdefined(self.var_1ae360e)) {
        self stoploopsound(self.var_1ae360e);
        self.var_1ae360e = undefined;
    }
}

// Namespace fireteam_dirty_bomb/fireteam_dirty_bomb
// Params 1, eflags: 0x6 linked
// Checksum 0x3c6138fe, Offset: 0x15d0
// Size: 0x178
function private function_f4f21a7f(localclientnum) {
    if (!isdefined(level.var_53b9c763[localclientnum])) {
        return;
    }
    var_53b9c763 = [];
    foreach (fxid, entity in level.var_53b9c763[localclientnum]) {
        if (isdefined(entity) && isdefined(entity.var_67899e33[localclientnum])) {
            deletefx(localclientnum, entity.var_67899e33[localclientnum], 1);
            entity.var_67899e33[localclientnum] = playfx(localclientnum, "wz/fx9_dirtybomb_radiation_zone_spawn", entity.origin + (0, 0, 80));
            var_53b9c763[entity.var_67899e33[localclientnum]] = entity;
            continue;
        }
        deletefx(localclientnum, fxid, 1);
    }
    level.var_53b9c763[localclientnum] = var_53b9c763;
}

// Namespace fireteam_dirty_bomb/fireteam_dirty_bomb
// Params 1, eflags: 0x6 linked
// Checksum 0xacaf8912, Offset: 0x1750
// Size: 0x170
function private function_ba474e49(localclientnum) {
    if (!isdefined(level.var_53b9c763[localclientnum])) {
        return;
    }
    var_53b9c763 = [];
    foreach (fxid, entity in level.var_53b9c763[localclientnum]) {
        if (isdefined(entity) && isdefined(entity.var_67899e33)) {
            deletefx(localclientnum, entity.var_67899e33[localclientnum], 1);
            entity.var_67899e33[localclientnum] = playfx(localclientnum, "wz/fx9_dirtybomb_radiation_zone", entity.origin + (0, 0, 80));
            var_53b9c763[entity.var_67899e33[localclientnum]] = entity;
            continue;
        }
        deletefx(localclientnum, fxid, 1);
    }
    level.var_53b9c763[localclientnum] = var_53b9c763;
}

// Namespace fireteam_dirty_bomb/fireteam_dirty_bomb
// Params 7, eflags: 0x2 linked
// Checksum 0x7798c5df, Offset: 0x18c8
// Size: 0xaa
function function_f20fb48(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (isdefined(self.var_d4b5da49)) {
        self stoploopsound(self.var_d4b5da49);
        self.var_d4b5da49 = undefined;
    }
    if (bwastimejump) {
        self.var_d4b5da49 = self playloopsound(#"hash_13167d6761dcda8b", undefined, (0, 0, 50));
    }
}

