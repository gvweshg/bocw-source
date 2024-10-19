// Atian COD Tools GSC CW decompiler test
#using script_72587ba89a212e22;
#using script_6741a9edbcf6c25e;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;
#using script_680dddbda86931fa;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace fireteam_satlink;

// Namespace fireteam_satlink/gametype_init
// Params 1, eflags: 0x20
// Checksum 0xccf87681, Offset: 0x278
// Size: 0x780
function event_handler[gametype_init] main(*eventstruct) {
    namespace_2938acdc::init();
    clientfield::register_clientuimodel("hudItems.uraniumCarryCount", #"hash_6f4b11a0bee9b73d", #"hash_556b3df8ae964e7c", 1, 4, "int", undefined, 0, 0);
    clientfield::register_clientuimodel("hudItems.uraniumMaxCarry", #"hash_6f4b11a0bee9b73d", #"hash_1879fbcae78c5417", 1, 4, "int", undefined, 0, 0);
    clientfield::register_clientuimodel("hudItems.uraniumFullCarry", #"hash_6f4b11a0bee9b73d", #"hash_451ab3abde68434a", 1, 1, "int", undefined, 0, 0);
    clientfield::register_clientuimodel("hudItems.carryingLargeBattery", #"hash_6f4b11a0bee9b73d", #"hash_44d3734a881956dc", 1, 1, "int", undefined, 0, 0);
    clientfield::register("scriptmover", "scriptid", 1, 5, "int", &function_e116df6c, 0, 0);
    clientfield::register("scriptmover", "objectiveCameraID", 1, 3, "int", &function_407a8464, 0, 0);
    satlinks = struct::get_array("fireteam_satlink", "variantname");
    for (i = 0; i <= satlinks.size; i++) {
        clientfield::function_5b7d846d("hud_items_fireteam.satLinkBoosters." + i + ".activeCount", #"hash_2f4d07f9eb3ddf9b", [#"hash_48fb0ae913baffee", hash(isdefined(i) ? "" + i : ""), #"activecount"], 1, 4, "int", undefined, 0, 0);
        clientfield::function_5b7d846d("hud_items_fireteam.satLinkBoosters." + i + ".expiring", #"hash_2f4d07f9eb3ddf9b", [#"hash_48fb0ae913baffee", hash(isdefined(i) ? "" + i : ""), #"hash_4445138710fcd565"], 1, 1, "int", undefined, 0, 0);
    }
    dirtybomb_usebar::register();
    level.var_b637a0c0 = &function_e99f251a;
    level.var_75f7e612 = &function_218c0417;
    level.var_977ee0c2 = &function_a2807fc5;
    callback::on_localclient_connect(&on_localclient_connect);
    fields = getmapfields();
    level.var_117b4a3a = [];
    level.var_117b4a3a[0] = isdefined(fields.var_306136ca) ? fields.var_306136ca : #"hash_280d5153e1276d";
    level.var_117b4a3a[1] = isdefined(fields.var_e1ef0bf1) ? fields.var_e1ef0bf1 : #"hash_4b1a3a0285bea14d";
    level.var_117b4a3a[2] = isdefined(fields.var_97278b57) ? fields.var_97278b57 : #"hash_36a94457406aea0e";
    level.var_117b4a3a[3] = isdefined(fields.var_29209af9) ? fields.var_29209af9 : #"hash_5a60154937b01557";
    level.var_117b4a3a[4] = isdefined(fields.var_cd9dabc7) ? fields.var_cd9dabc7 : #"hash_c102abd4eb802c2";
    level.var_117b4a3a[5] = isdefined(fields.var_66b704d1) ? fields.var_66b704d1 : #"hash_1f6942044733abd";
    level.var_117b4a3a[6] = isdefined(fields.var_43647dc0) ? fields.var_43647dc0 : #"hash_5a5907512d97c7dc";
    level.var_117b4a3a[7] = isdefined(fields.var_f605c142) ? fields.var_f605c142 : #"hash_1ebd257fc3bf9843";
    level.var_feca0aa5 = [];
    level.var_8d6d3139 = array(#"allies", #"axis", #"team3", #"team4", #"team5", #"team6", #"team7", #"team8", #"team9", #"team10");
    level.var_3ea9068a = [];
    level.var_3ea9068a[0] = #"hash_1e3ef2884672600f";
    level.var_3ea9068a[1] = #"hash_1e3ef388467261c2";
    level.var_3ea9068a[2] = #"hash_1e3ef48846726375";
    level.var_3ea9068a[3] = #"hash_1e3eed8846725790";
    level.var_3ea9068a[4] = #"hash_1e3eee8846725943";
    level.var_3ea9068a[5] = #"hash_1e3eef8846725af6";
    level.var_3ea9068a[6] = #"hash_1e3ef08846725ca9";
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0x1ef9909d, Offset: 0xa00
// Size: 0xac
function on_localclient_connect(localclientnum) {
    var_2612e01d = function_1df4c3b0(localclientnum, #"hash_950d3dccba39e08");
    var_1e885680 = getuimodel(var_2612e01d, "count");
    setuimodelvalue(var_1e885680, 4);
    level thread function_bb2f717e(localclientnum);
    level thread function_df78674f(localclientnum);
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x4
// Checksum 0xb89bdce7, Offset: 0xab8
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

// Namespace fireteam_satlink/fireteam_satlink
// Params 2, eflags: 0x4
// Checksum 0x72d1c783, Offset: 0xdb8
// Size: 0x118
function private function_e99f251a(*localclientnum, itementry) {
    if (itementry.itemtype == #"generic") {
        switch (itementry.name) {
        case #"hash_44cca2edb9c2041c":
            return (self clientfield::get_player_uimodel("hudItems.armorPlateMaxCarry") != 10);
        case #"hash_b8b2580ac5556e1":
            return (self clientfield::get_player_uimodel("hud_items.selfReviveAvailable") == 0);
        case #"hash_59b05128a1472855":
            return (self clientfield::get_player_uimodel("hudItems.carryingLargeBattery") == 0);
        }
        return false;
    } else if (itementry.itemtype == #"armor_shard") {
        return false;
    }
    return true;
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 2, eflags: 0x4
// Checksum 0xc67c1329, Offset: 0xed8
// Size: 0x88
function private function_218c0417(*localclientnum, itementry) {
    if (itementry.itemtype == #"armor_shard") {
        currentcount = self clientfield::get_player_uimodel("hudItems.armorPlateCount");
        return (currentcount < 5);
    }
    if (itementry.itemtype == #"generic") {
        return false;
    }
    return true;
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 2, eflags: 0x4
// Checksum 0x87de9450, Offset: 0xf68
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

// Namespace fireteam_satlink/fireteam_satlink
// Params 7, eflags: 0x0
// Checksum 0xcd506c7a, Offset: 0x10a0
// Size: 0x1c4
function function_e116df6c(*localclientnum, oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump != fieldname || !isdefined(self.script_index)) {
        script_index = bwastimejump;
        self.script_index = script_index;
        if (!isdefined(level.var_feca0aa5[script_index])) {
            level.var_feca0aa5[script_index] = [];
        }
        if (!isdefined(level.var_feca0aa5[script_index])) {
            level.var_feca0aa5[script_index] = [];
        } else if (!isarray(level.var_feca0aa5[script_index])) {
            level.var_feca0aa5[script_index] = array(level.var_feca0aa5[script_index]);
        }
        if (!isinarray(level.var_feca0aa5[script_index], self getentitynumber())) {
            level.var_feca0aa5[script_index][level.var_feca0aa5[script_index].size] = self getentitynumber();
        }
        if (!self function_d2503806(level.var_117b4a3a[0])) {
            self playrenderoverridebundle(level.var_117b4a3a[0]);
        }
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 1, eflags: 0x0
// Checksum 0x27adbf07, Offset: 0x1270
// Size: 0xdc
function function_df78674f(localclientnum) {
    level endon(#"game_ended");
    while (level.var_feca0aa5.size <= 0) {
        waitframe(1);
    }
    while (isdefined(localclientnum)) {
        waitframe(1);
        foreach (index, _ in level.var_feca0aa5) {
            function_dd2493cc(localclientnum, index);
        }
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 2, eflags: 0x0
// Checksum 0xbcba2175, Offset: 0x1358
// Size: 0x3e8
function function_dd2493cc(local_client_num, objid) {
    team = serverobjective_getobjectiveteam(local_client_num, objid);
    friendlyteam = function_9b3f0ed1(local_client_num);
    var_4bb78aa3 = function_8147db19(local_client_num, objid, friendlyteam);
    var_c7fc4f01 = 0;
    foreach (enemyteam in level.var_8d6d3139) {
        if (enemyteam != friendlyteam && function_8147db19(local_client_num, objid, enemyteam)) {
            var_c7fc4f01 = 1;
            break;
        }
    }
    state = 0;
    if (friendlyteam == team) {
        state = 1;
    } else if (team != #"none" && team != #"neutral") {
        state = 2;
    }
    if (var_4bb78aa3 && (team == #"neutral" || team == #"none")) {
        state = 4;
    } else if (var_4bb78aa3 && team != friendlyteam) {
        state = 7;
    }
    if (var_c7fc4f01 && (team == #"neutral" || team == #"none")) {
        state = 5;
    }
    if (var_c7fc4f01 && team == friendlyteam) {
        state = 6;
    }
    if (var_4bb78aa3 && var_c7fc4f01) {
        state = 3;
    }
    if (isdefined(level.var_feca0aa5[objid])) {
        foreach (entid in level.var_feca0aa5[objid]) {
            entity = getentbynum(local_client_num, entid);
            if (!isdefined(entity)) {
                continue;
            }
            for (si = 0; si < level.var_117b4a3a.size; si++) {
                rob = level.var_117b4a3a[si];
                if (entity function_d2503806(rob)) {
                    if (state != si) {
                        entity stoprenderoverridebundle(rob);
                    }
                    continue;
                }
                if (state == si) {
                    entity playrenderoverridebundle(rob);
                    util::function_f5b24d2d(local_client_num, entity, rob, state);
                }
            }
        }
    }
}

// Namespace fireteam_satlink/fireteam_satlink
// Params 7, eflags: 0x0
// Checksum 0xf7e99c3f, Offset: 0x1748
// Size: 0xbc
function function_407a8464(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        var_5da1be65 = string(level.var_3ea9068a[bwastimejump - 1]);
        addobjectivecameraentity(var_5da1be65, bwastimejump, #"none", self, "tag_origin", (0, 0, 0), (0, 0, 0));
        function_e795803(var_5da1be65, 1);
    }
}

