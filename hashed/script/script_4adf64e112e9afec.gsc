// Atian COD Tools GSC CW decompiler test
#using script_3b893ec1252cdffd;
#using script_6ac5ce345bf4213b;
#using script_5d76b3609d3af702;
#using script_15672f35157ae7ca;
#using script_76abb7986de59601;
#using script_67049b48b589d81;
#using script_64e5d3ad71ce8140;
#using script_60a2f38d6d37fd6a;
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
#using scripts\core_common\hud_message_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\spawning_shared.csc;
#using scripts\core_common\spawner_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_6e90e490;

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 0, eflags: 0x2 linked
// Checksum 0xa5e95cad, Offset: 0x6e0
// Size: 0xfcc
function init() {
    function_381c8192();
    function_9d1ddcae();
    for (i = 1; i <= 4; i++) {
        toks = strtok("doaGlobal.player$.hudVisible", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"hudvisible"], 1, 1, "int", undefined, 0, 0);
        toks = strtok("doaGlobal.player$.bombs", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"bombs"], 1, 4, "int", undefined, 0, 0);
        toks = strtok("doaGlobal.player$.boosts", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"boosts"], 1, 4, "int", undefined, 0, 0);
        toks = strtok("doaGlobal.player$.keys", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"keys"], 1, 4, "int", undefined, 0, 0);
        toks = strtok("doaGlobal.player$.lives", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"lives"], 1, 4, "int", undefined, 0, 0);
        toks = strtok("doaGlobal.player$.score", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"score"], 1, 30, "int", undefined, 0, 0);
        toks = strtok("doaGlobal.player$.health", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"health"], 1, 8, "float", undefined, 0, 0);
        toks = strtok("doaGlobal.player$.scoreMultiplier", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"scoremultiplier"], 1, 4, "int", undefined, 0, 0);
        toks = strtok("doaGlobal.player$.scoreMultiProgressBar", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"hash_595f464eb4cdcb42"], 1, 8, "float", undefined, 0, 0);
        toks = strtok("doaGlobal.player$.weaponType", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"weapontype"], 1, 3, "int", undefined, 0, 0);
        toks = strtok("doaGlobal.player$.weaponLevel", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"weaponlevel"], 1, 2, "int", undefined, 0, 0);
        toks = strtok("doaGlobal.player$.weaponDecayBar", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"hash_c41033658f37cae"], 1, 8, "float", undefined, 0, 0);
        toks = strtok("doaGlobal.player$.leader", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"leader"], 1, 1, "int", undefined, 0, 0);
        toks = strtok("doaGlobal.player$.respawnTimer", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"respawntimer"], 1, 8, "float", undefined, 0, 0);
        toks = strtok("doaGlobal.player$.respawnSeconds", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"hash_33b3ceb63cdb8d3c"], 1, 16, "int", undefined, 0, 0);
        toks = strtok("doaGlobal.player$.respawnHelpers", "$");
        clientfieldname = toks[0] + i + toks[1];
        clientfield::function_5b7d846d(clientfieldname, #"doa_world", [#"player" + (isdefined(i) ? "" + i : ""), #"hash_2c48244ed6df47d8"], 1, 2, "int", undefined, 0, 0);
    }
    clientfield::register("scriptmover", "set_health_bar", 1, 8, "int", &function_36e44202, 0, 0);
    clientfield::register("scriptmover", "show_health_bar", 1, 1, "int", &function_f5b1f2e0, 0, 0);
    clientfield::register("actor", "set_health_bar", 1, 8, "int", &function_36e44202, 0, 0);
    clientfield::register("actor", "show_health_bar", 1, 1, "int", &function_f5b1f2e0, 0, 0);
    clientfield::register("scriptmover", "set_text_bubble", 1, 6, "int", &function_fd71fef3, 0, 0);
    clientfield::register("actor", "set_text_bubble", 1, 6, "int", &function_fd71fef3, 0, 0);
    clientfield::register("allplayers", "set_text_bubble", 1, 6, "int", &function_fd71fef3, 0, 0);
    clientfield::register("scriptmover", "setPlayerOwner", 1, 3, "int", &setplayerowner, 0, 0);
    clientfield::register("scriptmover", "set_name_bubble", 1, 1, "int", &function_f01e3809, 0, 0);
    clientfield::register("toplayer", "showPlayerHint", 1, 4, "int", &showplayerhint, 0, 0);
    clientfield::register("scriptmover", "setTutorialEnt", 1, 1, "int", &function_94c1298b, 0, 0);
    clientfield::register("toplayer", "setCompassVis", 1, 1, "counter", &function_b5afa57f, 0, 0);
    function_32d5e898();
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 1, eflags: 0x2 linked
// Checksum 0xdf79473b, Offset: 0x16b8
// Size: 0x3c
function function_32d5e898(*localclientnum) {
    function_295b0822();
    function_2c7423ff();
    function_820380e1();
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 0, eflags: 0x2 linked
// Checksum 0x64d4bf22, Offset: 0x1700
// Size: 0xa0
function function_381c8192() {
    level.doa.healthbars = [];
    for (i = 0; i < 8; i++) {
        obj = spawnstruct();
        obj.var_e429ef89 = luielem_entity_bar::register_clientside();
        obj.localclientnum = -1;
        obj.entitynum = -1;
        level.doa.healthbars[i] = obj;
    }
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 0, eflags: 0x2 linked
// Checksum 0xef0284e1, Offset: 0x17a8
// Size: 0x10c
function function_295b0822() {
    foreach (obj in level.doa.healthbars) {
        if (obj.localclientnum != -1 && obj.var_e429ef89 luielem_entity_bar::is_open(obj.localclientnum)) {
            obj.var_e429ef89 luielem_entity_bar::close(obj.localclientnum);
        }
        obj.localclientnum = -1;
        obj.entitynum = -1;
    }
    namespace_1e25ad94::debugmsg("Reset all healthBars");
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 2, eflags: 0x2 linked
// Checksum 0x9834647e, Offset: 0x18c0
// Size: 0xc8
function function_84f188ed(localclientnum, entitynum) {
    foreach (obj in level.doa.healthbars) {
        if (!isdefined(obj)) {
            continue;
        }
        if (obj.localclientnum === localclientnum && obj.entitynum === entitynum) {
            return obj;
        }
    }
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 2, eflags: 0x2 linked
// Checksum 0x2c04c459, Offset: 0x1990
// Size: 0x1a0
function function_deb84496(localclientnum, entitynum) {
    var_6c978e26 = function_84f188ed(localclientnum, entitynum);
    if (!isdefined(var_6c978e26)) {
        foreach (obj in level.doa.healthbars) {
            if (obj.localclientnum == -1 && obj.entitynum == -1) {
                var_6c978e26 = obj;
                break;
            }
        }
    }
    if (isdefined(var_6c978e26)) {
        var_6c978e26.localclientnum = localclientnum;
        var_6c978e26.entitynum = entitynum;
        if (!var_6c978e26.var_e429ef89 luielem_entity_bar::is_open(localclientnum)) {
            var_6c978e26.var_e429ef89 luielem_entity_bar::open(localclientnum);
        }
        var_6c978e26.var_e429ef89 luielem_entity_bar::set_entnum(localclientnum, entitynum);
        namespace_1e25ad94::debugmsg("Allocated a healthBar to localClientNum:" + localclientnum + " Entity:" + entitynum);
        return var_6c978e26.var_e429ef89;
    }
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 2, eflags: 0x2 linked
// Checksum 0xb7554ffd, Offset: 0x1b38
// Size: 0xc6
function function_60e526c9(localclientnum, entitynum) {
    profilestart();
    obj = function_84f188ed(localclientnum, entitynum);
    if (isdefined(obj)) {
        if (obj.var_e429ef89 luielem_entity_bar::is_open(localclientnum)) {
            obj.var_e429ef89 luielem_entity_bar::close(localclientnum);
        }
        obj.localclientnum = -1;
        obj.entitynum = -1;
        namespace_1e25ad94::debugmsg("Released a healthBar to localClientNum:" + localclientnum + " Entity:" + entitynum);
    }
    profilestop();
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 2, eflags: 0x2 linked
// Checksum 0x1b0b1a61, Offset: 0x1c08
// Size: 0xb6
function function_b935ba2b(localclientnum, entitynum) {
    self notify("167e71a2e2cf95fa");
    self endon("167e71a2e2cf95fa");
    self waittill(#"death", #"disconnect", #"infps");
    function_60e526c9(localclientnum, entitynum);
    function_5f71ab96(localclientnum, entitynum);
    function_651f262d(localclientnum, entitynum);
    self.var_de98eb73 = undefined;
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 7, eflags: 0x2 linked
// Checksum 0x831b790c, Offset: 0x1cc8
// Size: 0x1a6
function function_f5b1f2e0(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        if (!isdefined(self.var_e4f0114d)) {
            namespace_1e25ad94::debugmsg("Entity requesting a healthBar");
            self.var_e4f0114d = function_deb84496(fieldname, self getentitynumber());
            if (!isdefined(self.var_e4f0114d)) {
                namespace_1e25ad94::debugmsg("---> Request FAILED!!!");
                return;
            }
            self thread function_b935ba2b(fieldname, self getentitynumber());
            if (self.var_e4f0114d luielem_entity_bar::is_open(fieldname)) {
                self.var_e4f0114d luielem_entity_bar::set_offset(fieldname, 0, 0, 90);
                self.var_e4f0114d luielem_entity_bar::function_a9793a65(fieldname, 0.5);
                self function_c53f825c(fieldname);
            }
        }
        return;
    }
    function_60e526c9(fieldname, self getentitynumber());
    self.var_e4f0114d = undefined;
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 1, eflags: 0x2 linked
// Checksum 0x88ff45c, Offset: 0x1e78
// Size: 0x11c
function function_c53f825c(localclientnum) {
    if (!self.var_e4f0114d luielem_entity_bar::is_open(localclientnum)) {
        return;
    }
    if (!isdefined(self.health_percent)) {
        self.health_percent = 1;
    }
    state = "Green";
    if (self.health_percent < 0.65) {
        state = "Yellow";
    }
    if (self.health_percent < 0.25) {
        state = "Red";
    }
    namespace_1e25ad94::debugmsg("Setting healthBar to progress: " + self.health_percent + " State is: " + state);
    self.var_e4f0114d luielem_entity_bar::function_ecacbaa5(localclientnum, self.health_percent);
    self.var_e4f0114d luielem_entity_bar::set_state(localclientnum, hash(state));
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 7, eflags: 0x2 linked
// Checksum 0x6c3e41fe, Offset: 0x1fa0
// Size: 0xcc
function function_36e44202(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    self.health_percent = bwastimejump / ((1 << 8) - 1);
    if (!isdefined(self.var_e4f0114d)) {
        return;
    }
    if (self.health_percent == 0) {
        function_60e526c9(fieldname, self getentitynumber());
        self.var_e4f0114d = undefined;
        return;
    }
    self function_c53f825c(fieldname);
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 0, eflags: 0x2 linked
// Checksum 0x17ced8c0, Offset: 0x2078
// Size: 0x13c
function function_9d1ddcae() {
    level.doa.var_b1d82287 = [];
    for (i = 0; i < 8; i++) {
        obj = spawnstruct();
        obj.var_e429ef89 = doa_textbubble::register_clientside();
        obj.localclientnum = -1;
        obj.entitynum = -1;
        level.doa.var_b1d82287[i] = obj;
    }
    level.doa.var_96dc6b3b = [];
    for (i = 0; i < 4; i++) {
        obj = spawnstruct();
        obj.var_e429ef89 = doa_textbubble_playername::register_clientside();
        obj.localclientnum = -1;
        obj.entitynum = -1;
        level.doa.var_96dc6b3b[i] = obj;
    }
    function_9c007987();
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 0, eflags: 0x2 linked
// Checksum 0x12d58d89, Offset: 0x21c0
// Size: 0x1ea2
function function_9c007987() {
    level.doa.var_d0bdbf5a = array({#msg:#"hash_3761709e45ee7413", #audio:#"hash_b66182b7f4ee8aa"}, {#msg:#"hash_4ecbcdaa4f28745", #audio:#"hash_34db577b2720cb9e"}, {#msg:#"hash_25eef8d329ff6fd7", #audio:#"hash_6649a4c8ed23ba9a"}, {#msg:#"hash_10451626ccad1124", #audio:#"hash_12e78a32ea420eeb"}, {#msg:#"hash_218a8d7fa7f5e39c", #audio:#"hash_6ad099fda49eee77"}, {#msg:#"hash_2e511dda73e51a4b", #audio:#"hash_5e8abe7af6535450"}, {#msg:#"hash_1ddfbb6e0754abed", #audio:#"hash_2425e4770a6b94"}, {#msg:#"hash_2f2a6f14813f8f08", #audio:#"hash_5c88e30612571c9b"}, {#msg:#"hash_36685757a129358d", #audio:#"hash_3f23a8fe0490f53a"}, {#msg:#"hash_4f5b737a2a2cffaa", #audio:#"hash_c49e8df639c4571"}, {#msg:#"hash_796174f50e8666a4", #audio:#"hash_6f026b669926e19d"}, {#msg:#"hash_6997adb579bc7105", #audio:#"hash_514d8021dcc34170"}, {#msg:#"hash_244b5ba978c0718d", #audio:#"hash_6c7395dd95739008"}, {#msg:#"hash_3645f57848983a1", #audio:#"hash_c0480fde7da2a06"}, {#msg:#"hash_62ceb179fb3b5373", #audio:#"hash_bbc28cba3a8b024"}, {#msg:#"hash_77b0706e32838c3f", #audio:#"hash_1fcc6f6b09fa86a4"}, {#msg:#"hash_29ef8da8bf525634", #audio:#"hash_62809f3dcbc7dfe5"}, {#msg:#"hash_2288ddd0835ecfae", #audio:#"hash_1c4736524d26b3c3"});
    level.doa.var_5127d579 = array({#msg:#"hash_5ee26388ce7eaaf", #audio:#"hash_13ab64f55760eef8"}, {#msg:#"hash_5ee27388ce7ec62", #audio:#"hash_13ab67f55760f411"}, {#msg:#"hash_5ee28388ce7ee15", #audio:#"hash_13ab66f55760f25e"}, {#msg:#"hash_5ee21388ce7e230", #audio:#"hash_13ab69f55760f777"}, {#msg:#"hash_5ee22388ce7e3e3", #audio:#"hash_13ab68f55760f5c4"});
    level.doa.var_49bb35e6 = array({#msg:#"hash_6f6d7c35437f4086", #audio:#"hash_56be8789e638763d"});
    level.doa.var_1d7871ce = array({#msg:#"hash_6f6d7c35437f4086", #audio:#"hash_56be8789e638763d"}, {#msg:#"hash_271049f29ea6ade2", #audio:#"hash_56be8789e638763d"}, {#msg:#"hash_140b25d079b4c26f", #audio:#"hash_56be8789e638763d"}, {#msg:#"hash_48357e670e5aad39", #audio:#"hash_56be8789e638763d"}, {#msg:#"hash_4d97f0bcf392ed56", #audio:#"hash_56be8789e638763d"}, {#msg:#"hash_25e6dfbe3727c43d", #audio:#"hash_56be8789e638763d"}, {#msg:#"hash_5e4040ce198ca3c5", #audio:#"hash_56be8789e638763d"});
    level.doa.var_e4e89788 = array({#msg:#"hash_5d480559ac63e5de", #audio:#"hash_607b2f00c28e3d09"}, {#msg:#"hash_5d480459ac63e42b", #audio:#"hash_607b2f00c28e3d09"}, {#msg:#"hash_5d480359ac63e278", #audio:#"hash_607b2f00c28e3d09"}, {#msg:#"hash_5d480a59ac63ee5d", #audio:#"hash_607b2f00c28e3d09"});
    level.doa.var_df795bcd = array({#msg:#"hash_329650149792bb13", #audio:#"hash_7d2d226b6deade0"}, {#msg:#"hash_329651149792bcc6", #audio:#"hash_7d2d226b6deade0"}, {#msg:#"hash_329652149792be79", #audio:#"hash_7d2d226b6deade0"}, {#msg:#"hash_329653149792c02c", #audio:#"hash_7d2d226b6deade0"});
    level.doa.var_a95ba945 = array({#msg:#"hash_48dac65666a5a325", #audio:#"hash_c8b6e45529ecc06"}, {#msg:#"hash_48dac35666a59e0c", #audio:#"hash_c8b6e45529ecc06"}, {#msg:#"hash_48dac45666a59fbf", #audio:#"hash_c8b6e45529ecc06"}, {#msg:#"hash_48dac15666a59aa6", #audio:#"hash_c8b6e45529ecc06"}, {#msg:#"hash_48dac25666a59c59", #audio:#"hash_c8b6e45529ecc06"}, {#msg:#"hash_48dabf5666a59740", #audio:#"hash_c8b6e45529ecc06"});
    level.doa.var_2804d50f = array({#msg:#"hash_1ca4f107ad82b007", #audio:#"hash_77696e3c6755b83c"}, {#msg:#"hash_1ca4f207ad82b1ba", #audio:#"hash_77696e3c6755b83c"}, {#msg:#"hash_1ca4f307ad82b36d", #audio:#"hash_77696e3c6755b83c"}, {#msg:#"hash_1ca4ec07ad82a788", #audio:#"hash_77696e3c6755b83c"}, {#msg:#"hash_1ca4ed07ad82a93b", #audio:#"hash_77696e3c6755b83c"}, {#msg:#"hash_1ca4ee07ad82aaee", #audio:#"hash_77696e3c6755b83c"}, {#msg:#"hash_1ca4ef07ad82aca1", #audio:#"hash_77696e3c6755b83c"});
    level.doa.var_a3e9257b = array({#msg:#"hash_28ab03458686738b", #audio:#"hash_aae0b544c967937"}, {#msg:#"hash_28ab04458686753e", #audio:#"hash_aae0b544c967937"}, {#msg:#"hash_28ab0545868676f1", #audio:#"hash_7d2d226b6deade0"}, {#msg:#"hash_28ab0645868678a4", #audio:#"hash_7d2d226b6deade0"});
    level.doa.var_aa304f76 = array({#msg:#"hash_3504bde956ec54ac", #audio:#"hash_22113791bada1a9d"}, {#msg:#"hash_3504c0e956ec59c5", #audio:#"hash_22113791bada1a9d"}, {#msg:#"hash_3504bfe956ec5812", #audio:#"hash_22113791bada1a9d"}, {#msg:#"hash_3504bae956ec4f93", #audio:#"hash_22113791bada1a9d"});
    level.doa.var_6a49d224 = array({#msg:#"hash_2c31d0c4dfaaded9", #audio:#"hash_7d2d226b6deade0"}, {#msg:#"hash_2c31cdc4dfaad9c0", #audio:#"hash_7d2d226b6deade0"}, {#msg:#"hash_2c31cec4dfaadb73", #audio:#"hash_7d2d226b6deade0"}, {#msg:#"hash_2c31d3c4dfaae3f2", #audio:#"hash_7d2d226b6deade0"});
    level.doa.var_4adfb3a5 = array({#msg:#"hash_137127b92c93e171", #audio:#"hash_c8b6e45529ecc06"}, {#msg:#"hash_137124b92c93dc58", #audio:#"hash_c8b6e45529ecc06"}, {#msg:#"hash_137125b92c93de0b", #audio:#"hash_c8b6e45529ecc06"}, {#msg:#"hash_13712ab92c93e68a", #audio:#"hash_c8b6e45529ecc06"});
    level.doa.var_888445c3 = array({#msg:#"hash_514a7ecafa0b774", #audio:#"hash_77c20123c6693e3c"}, {#msg:#"hash_514aaecafa0bc8d", #audio:#"hash_77c20123c6693e3c"}, {#msg:#"hash_514a9ecafa0bada", #audio:#"hash_77c20123c6693e3c"}, {#msg:#"hash_514a4ecafa0b25b", #audio:#"hash_77c20123c6693e3c"}, {#msg:#"hash_514a3ecafa0b0a8", #audio:#"hash_77c20123c6693e3c"}, {#msg:#"hash_514a6ecafa0b5c1", #audio:#"hash_77c20123c6693e3c"}, {#msg:#"hash_514a5ecafa0b40e", #audio:#"hash_77c20123c6693e3c"}, {#msg:#"hash_514a0ecafa0ab8f", #audio:#"hash_77c20123c6693e3c"});
    level.doa.var_aeba1185 = array({#msg:#"hash_58397227dab633c1", #audio:#"hash_77696e3c6755b83c"}, {#msg:#"hash_58396f27dab62ea8", #audio:#"hash_77696e3c6755b83c"}, {#msg:#"hash_58397027dab6305b", #audio:#"hash_77696e3c6755b83c"}, {#msg:#"hash_58397527dab638da", #audio:#"hash_77696e3c6755b83c"});
    level.doa.var_2ccc7019 = array({#msg:#"hash_3ca5b94fff4b4e02", #audio:#"hash_607b2f00c28e3d09"}, {#msg:#"hash_3ca5b84fff4b4c4f", #audio:#"hash_56be8789e638763d"}, {#msg:#"hash_3ca5b74fff4b4a9c", #audio:#"hash_d5bce1134823fca"}, {#msg:#"hash_3ca5b64fff4b48e9", #audio:#"hash_77c20123c6693e3c"}, {#msg:#"hash_3ca5b54fff4b4736", #audio:#"hash_22113791bada1a9d"});
    level.doa.var_71a8d91b = array({#msg:#"hash_4d32ffbead665ebf", #audio:#"hash_1af6f1a195265272"}, {#msg:#"hash_4d3300bead666072", #audio:#"hash_1af6f1a195265272"}, {#msg:#"hash_4d32fcbead6659a6", #audio:#"hash_1af6f1a195265272"}, {#msg:#"hash_4d32fdbead665b59", #audio:#"hash_1af6f1a195265272"}, {#msg:#"hash_4d3306bead666aa4", #audio:#"hash_1af6f1a195265272"});
    level.doa.var_b07d7943 = array({#msg:#"hash_5f9bea3b3617e5bf", #audio:undefined}, {#msg:#"hash_5f9beb3b3617e772", #audio:#"hash_7d2d226b6deade0"}, {#msg:#"hash_5f9be53b3617dd40", #audio:#"hash_7d2d226b6deade0"}, {#msg:#"hash_5f9be63b3617def3", #audio:#"hash_7d2d226b6deade0"}, {#msg:#"hash_5f9be73b3617e0a6", #audio:#"hash_77c20123c6693e3c"}, {#msg:#"hash_5f9be83b3617e259", #audio:#"hash_56be8789e638763d"});
    level.doa.var_1ad422d4 = array({#msg:#"hash_19bfbdce8ae8e874", #audio:undefined}, {#msg:#"hash_19bfbfce8ae8ebda", #audio:#"hash_d5bce1134823fca"}, {#msg:#"hash_19bfbcce8ae8e6c1", #audio:#"hash_77c20123c6693e3c"}, {#msg:#"hash_19bfbbce8ae8e50e", #audio:#"hash_d5bce1134823fca"}, {#msg:#"hash_19bfb6ce8ae8dc8f", #audio:#"hash_56be8789e638763d"});
    level.doa.var_f754a08d = array({#msg:#"hash_2c42c6f704aaf047", #audio:#"hash_d5bce1134823fca"}, {#msg:#"hash_2c42c7f704aaf1fa", #audio:#"hash_d5bce1134823fca"}, {#msg:#"hash_2c42c8f704aaf3ad", #audio:#"hash_d5bce1134823fca"}, {#msg:#"hash_2c42c2f704aae97b", #audio:#"hash_d5bce1134823fca"}, {#msg:#"hash_2c42c3f704aaeb2e", #audio:#"hash_d5bce1134823fca"});
    level.doa.var_d8541610 = array({#msg:#"hash_1ca4ed07ad82a93b", #audio:#"hash_77696e3c6755b83c"}, {#msg:#"hash_1ca4f107ad82b007", #audio:#"hash_77696e3c6755b83c"}, {#msg:#"hash_1ca4f207ad82b1ba", #audio:#"hash_77696e3c6755b83c"}, {#msg:#"hash_1ca4f307ad82b36d", #audio:#"hash_77696e3c6755b83c"}, {#msg:#"hash_1ca4ec07ad82a788", #audio:#"hash_77696e3c6755b83c"}, {#msg:#"hash_1ca4ee07ad82aaee", #audio:#"hash_77696e3c6755b83c"});
    level.doa.skits = array(11, 10, 43, 44, 45, 46, 47);
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 0, eflags: 0x2 linked
// Checksum 0xbc6f7119, Offset: 0x4070
// Size: 0x1f4
function function_2c7423ff() {
    foreach (obj in level.doa.var_b1d82287) {
        if (obj.localclientnum != -1 && obj.var_e429ef89 doa_textbubble::is_open(obj.localclientnum)) {
            obj.var_e429ef89 doa_textbubble::close(obj.localclientnum);
        }
        obj.localclientnum = -1;
        obj.entitynum = -1;
    }
    foreach (obj in level.doa.var_96dc6b3b) {
        if (obj.localclientnum != -1 && obj.var_e429ef89 doa_textbubble_playername::is_open(obj.localclientnum)) {
            obj.var_e429ef89 doa_textbubble_playername::close(obj.localclientnum);
        }
        obj.localclientnum = -1;
        obj.entitynum = -1;
    }
    namespace_1e25ad94::debugmsg("Reset all text bubbles");
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 2, eflags: 0x2 linked
// Checksum 0x43f76a26, Offset: 0x4270
// Size: 0xc8
function function_9e67af(localclientnum, entitynum) {
    foreach (obj in level.doa.var_b1d82287) {
        if (!isdefined(obj)) {
            continue;
        }
        if (obj.localclientnum === localclientnum && obj.entitynum === entitynum) {
            return obj;
        }
    }
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 2, eflags: 0x2 linked
// Checksum 0xb164e8fa, Offset: 0x4340
// Size: 0x140
function function_530c3685(localclientnum, entitynum) {
    var_6c978e26 = function_9e67af(localclientnum, entitynum);
    if (!isdefined(var_6c978e26)) {
        foreach (obj in level.doa.var_b1d82287) {
            if (obj.localclientnum == -1 && obj.entitynum == -1) {
                var_6c978e26 = obj;
                break;
            }
        }
    }
    if (isdefined(var_6c978e26)) {
        var_6c978e26.entitynum = entitynum;
        var_6c978e26.localclientnum = localclientnum;
        namespace_1e25ad94::debugmsg("Allocated a textBubble to localClientNum:" + localclientnum + " Entity:" + entitynum);
        return var_6c978e26.var_e429ef89;
    }
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 2, eflags: 0x2 linked
// Checksum 0xa6717c5b, Offset: 0x4488
// Size: 0xc6
function function_5f71ab96(localclientnum, entitynum) {
    profilestart();
    obj = function_9e67af(localclientnum, entitynum);
    if (isdefined(obj)) {
        if (obj.var_e429ef89 doa_textbubble::is_open(localclientnum)) {
            obj.var_e429ef89 doa_textbubble::close(localclientnum);
        }
        obj.localclientnum = -1;
        obj.entitynum = -1;
        namespace_1e25ad94::debugmsg("Released a textBubble to localClientNum:" + localclientnum + " Entity:" + entitynum);
    }
    profilestop();
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 0, eflags: 0x2 linked
// Checksum 0x2a342ed6, Offset: 0x4558
// Size: 0x36
function function_a789b576() {
    if (isdefined(self gettagorigin("tag_eye"))) {
        return "tag_eye";
    }
    return "tag_origin";
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 0, eflags: 0x2 linked
// Checksum 0x91cd1ac8, Offset: 0x4598
// Size: 0x3c
function function_80317cee() {
    if (isdefined(self gettagorigin("tag_eye"))) {
        return (0, 0, 0);
    }
    return (0, 0, 24);
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 1, eflags: 0x2 linked
// Checksum 0x684f5dd1, Offset: 0x45e0
// Size: 0x1c8
function function_15158f84(localclientnum) {
    assert(!isdefined(self.var_de98eb73));
    namespace_1e25ad94::debugmsg("Entity requesting a textBubble");
    if (!isdefined(self.entnum)) {
        self.entnum = self getentitynumber();
    }
    self.var_de98eb73 = function_530c3685(localclientnum, self.entnum);
    if (!isdefined(self.var_de98eb73)) {
        namespace_1e25ad94::debugmsg("---> Request FAILED!!!");
        return false;
    }
    if (self.var_de98eb73 doa_textbubble::is_open(localclientnum) == 0) {
        self.var_de98eb73 doa_textbubble::open(localclientnum);
    }
    offset = self function_80317cee();
    self.var_de98eb73 doa_textbubble::function_919052d(localclientnum, self.entnum, self function_a789b576());
    self.var_de98eb73 doa_textbubble::set_text(localclientnum, #"hash_7ee185f0146bd791");
    self.var_de98eb73 doa_textbubble::set_offset(localclientnum, offset[0], offset[1], offset[2]);
    self thread function_b935ba2b(localclientnum, self.entnum);
    return true;
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 7, eflags: 0x2 linked
// Checksum 0x6edde635, Offset: 0x47b0
// Size: 0x4ac
function function_fd71fef3(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump == 0) {
        function_5f71ab96(fieldname, self.entnum);
        self.var_de98eb73 = undefined;
        return;
    }
    if (function_75bbb0b9(fieldname) == 0 && level.doa.world_state != 3) {
        return;
    }
    if (level.var_46a66896 doa_overworld::is_open(fieldname)) {
        return;
    }
    if (self isplayer()) {
        if (is_true(self.doa.infps) || is_true(level.doa.var_318aa67a)) {
            if (isdefined(self.var_de98eb73)) {
                function_5f71ab96(fieldname, self.entnum);
                self.var_de98eb73 = undefined;
            }
            return;
        }
    } else if (is_true(self.var_fb30ba57) && !function_f682116f(fieldname)) {
        return;
    }
    if (!isdefined(self.var_de98eb73)) {
        if (self function_15158f84(fieldname) == 0) {
            return;
        }
    }
    var_a793c1e1 = function_aae7840a(bwastimejump);
    if (is_true(var_a793c1e1)) {
        max = function_38e2f5a0(bwastimejump);
        if (!isdefined(self.skits)) {
            self.skits = [];
        }
        if (!isdefined(self.skits[bwastimejump])) {
            self.skits[bwastimejump] = 0;
        }
        var_a6e8b35b = self.skits[bwastimejump];
        self.skits[bwastimejump]++;
        if (self.skits[bwastimejump] >= max) {
            self.skits[bwastimejump] = max - 1;
        }
    }
    val = self function_d47b1ac(bwastimejump, var_a793c1e1, var_a6e8b35b);
    if (isdefined(val.msg)) {
        self.var_de98eb73 doa_textbubble::set_text(fieldname, val.msg);
    } else {
        function_5f71ab96(fieldname, self.entnum);
        self.var_de98eb73 = undefined;
    }
    if (isdefined(val.audio)) {
        if (isdefined(val.cooldown)) {
            time = gettime();
            if (!isdefined(self.var_17e527d8)) {
                self.var_17e527d8 = [];
            }
            if (isdefined(self.var_17e527d8[bwastimejump]) && time < self.var_17e527d8[bwastimejump]) {
                skip = 1;
            } else {
                self.var_17e527d8[bwastimejump] = time + val.cooldown;
            }
        }
        if (!is_true(skip)) {
            if (isarray(val.audio)) {
                alias = val.audio[randomint(val.audio.size)];
            } else {
                alias = val.audio;
            }
            if (is_true(val.q)) {
                namespace_9fc66ac::function_9a237f2f(fieldname, alias, self);
                return;
            }
            self playsound(fieldname, alias);
        }
    }
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 0, eflags: 0x2 linked
// Checksum 0x31e772d8, Offset: 0x4c68
// Size: 0x10c
function function_820380e1() {
    foreach (obj in level.doa.var_96dc6b3b) {
        if (obj.localclientnum != -1 && obj.var_e429ef89 doa_textbubble_playername::is_open(obj.localclientnum)) {
            obj.var_e429ef89 doa_textbubble_playername::close(obj.localclientnum);
        }
        obj.localclientnum = -1;
        obj.entitynum = -1;
    }
    namespace_1e25ad94::debugmsg("Reset all name bubbles");
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 2, eflags: 0x2 linked
// Checksum 0x2faaa37d, Offset: 0x4d80
// Size: 0xc8
function function_53edd73d(localclientnum, entitynum) {
    foreach (obj in level.doa.var_96dc6b3b) {
        if (!isdefined(obj)) {
            continue;
        }
        if (obj.localclientnum === localclientnum && obj.entitynum === entitynum) {
            return obj;
        }
    }
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 2, eflags: 0x2 linked
// Checksum 0x5775f973, Offset: 0x4e50
// Size: 0x140
function function_9d28bdf3(localclientnum, entitynum) {
    var_6c978e26 = function_53edd73d(localclientnum, entitynum);
    if (!isdefined(var_6c978e26)) {
        foreach (obj in level.doa.var_96dc6b3b) {
            if (obj.localclientnum == -1 && obj.entitynum == -1) {
                var_6c978e26 = obj;
                break;
            }
        }
    }
    if (isdefined(var_6c978e26)) {
        var_6c978e26.entitynum = entitynum;
        var_6c978e26.localclientnum = localclientnum;
        namespace_1e25ad94::debugmsg("Allocated a nameBubble to localClientNum:" + localclientnum + " Entity:" + entitynum);
        return var_6c978e26.var_e429ef89;
    }
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 2, eflags: 0x2 linked
// Checksum 0x92abb6, Offset: 0x4f98
// Size: 0xc6
function function_651f262d(localclientnum, entitynum) {
    profilestart();
    obj = function_53edd73d(localclientnum, entitynum);
    if (isdefined(obj)) {
        if (obj.var_e429ef89 doa_textbubble_playername::is_open(localclientnum)) {
            obj.var_e429ef89 doa_textbubble_playername::close(localclientnum);
        }
        obj.localclientnum = -1;
        obj.entitynum = -1;
        namespace_1e25ad94::debugmsg("Released a nameBubble to localClientNum:" + localclientnum + " Entity:" + entitynum);
    }
    profilestop();
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 1, eflags: 0x2 linked
// Checksum 0xd570950e, Offset: 0x5068
// Size: 0x228
function function_8394bc71(localclientnum) {
    assert(!isdefined(self.var_7488bfe4));
    namespace_1e25ad94::debugmsg("Entity requesting a nameBubble");
    if (!isdefined(self.entnum)) {
        self.entnum = self getentitynumber();
    }
    if (!isdefined(self.player)) {
        namespace_1e25ad94::debugmsg("---> Request FAILED [Player Disconnect]");
        return false;
    }
    clientnum = self.player getentitynumber();
    self.var_7488bfe4 = function_9d28bdf3(localclientnum, self.entnum);
    if (!isdefined(self.var_7488bfe4)) {
        namespace_1e25ad94::debugmsg("---> Request FAILED!!!");
        return false;
    }
    if (self.var_7488bfe4 doa_textbubble_playername::is_open(localclientnum) == 0) {
        self.var_7488bfe4 doa_textbubble_playername::open(localclientnum);
        self playsound(localclientnum, #"hash_1af6f1a195265272");
    }
    offset = (-16, 0, 58);
    self.var_7488bfe4 doa_textbubble_playername::set_entnum(localclientnum, self.entnum);
    self.var_7488bfe4 doa_textbubble_playername::set_clientnum(localclientnum, clientnum);
    self.var_7488bfe4 doa_textbubble_playername::set_offset(localclientnum, offset[0], offset[1], offset[2]);
    self thread function_b935ba2b(localclientnum, self.entnum);
    return true;
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 7, eflags: 0x2 linked
// Checksum 0xc2ddcacd, Offset: 0x5298
// Size: 0xbc
function function_f01e3809(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump == 0) {
        function_651f262d(fieldname, self.entnum);
        self.var_7488bfe4 = undefined;
        return;
    }
    if (level.var_46a66896 doa_overworld::is_open(fieldname)) {
        return;
    }
    if (!isdefined(self.var_7488bfe4)) {
        if (self function_8394bc71(fieldname) == 0) {
            return;
        }
    }
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 1, eflags: 0x2 linked
// Checksum 0x61e27751, Offset: 0x5360
// Size: 0x32
function function_aae7840a(id) {
    return isinarray(level.doa.skits, id);
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 1, eflags: 0x2 linked
// Checksum 0x8865db0c, Offset: 0x53a0
// Size: 0x108
function function_38e2f5a0(id) {
    if (id === 11) {
        return level.doa.var_aeba1185.size;
    }
    if (id === 10) {
        return level.doa.var_2ccc7019.size;
    }
    if (id === 43) {
        return level.doa.var_71a8d91b.size;
    }
    if (id === 44) {
        return level.doa.var_b07d7943.size;
    }
    if (id === 45) {
        return level.doa.var_1ad422d4.size;
    }
    if (id === 46) {
        return level.doa.var_f754a08d.size;
    }
    if (id === 47) {
        return level.doa.var_d8541610.size;
    }
    return 0;
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 3, eflags: 0x2 linked
// Checksum 0x7984e86c, Offset: 0x54b0
// Size: 0xcde
function function_d47b1ac(id, var_a793c1e1 = 0, var_a6e8b35b) {
    val = {};
    if (var_a793c1e1) {
        switch (id) {
        case 11:
            if (var_a6e8b35b < level.doa.var_aeba1185.size) {
                val = level.doa.var_aeba1185[var_a6e8b35b];
            }
            break;
        case 10:
            if (var_a6e8b35b < level.doa.var_2ccc7019.size) {
                val = level.doa.var_2ccc7019[var_a6e8b35b];
            }
            break;
        case 43:
            if (var_a6e8b35b < level.doa.var_71a8d91b.size) {
                val = level.doa.var_71a8d91b[var_a6e8b35b];
            }
            break;
        case 44:
            if (var_a6e8b35b < level.doa.var_b07d7943.size) {
                val = level.doa.var_b07d7943[var_a6e8b35b];
            }
            break;
        case 45:
            if (var_a6e8b35b < level.doa.var_1ad422d4.size) {
                val = level.doa.var_1ad422d4[var_a6e8b35b];
            }
            break;
        case 46:
            if (var_a6e8b35b < level.doa.var_f754a08d.size) {
                val = level.doa.var_f754a08d[var_a6e8b35b];
            }
            break;
        case 47:
            if (var_a6e8b35b < level.doa.var_d8541610.size) {
                val = level.doa.var_d8541610[var_a6e8b35b];
            }
            break;
        }
    } else {
        val.msg = #"hash_4bec7ac65a15bb06";
        switch (id) {
        case 1:
            val = level.doa.var_49bb35e6[randomint(level.doa.var_49bb35e6.size)];
            break;
        case 2:
            val = level.doa.var_1d7871ce[randomint(level.doa.var_1d7871ce.size)];
            break;
        case 3:
            val = level.doa.var_e4e89788[randomint(level.doa.var_e4e89788.size)];
            break;
        case 4:
            val = level.doa.var_df795bcd[randomint(level.doa.var_df795bcd.size)];
            break;
        case 5:
            val = level.doa.var_a95ba945[randomint(level.doa.var_a95ba945.size)];
            break;
        case 6:
            val = level.doa.var_2804d50f[randomint(level.doa.var_2804d50f.size)];
            break;
        case 16:
            val = level.doa.var_a3e9257b[randomint(level.doa.var_a3e9257b.size)];
            break;
        case 17:
            val = level.doa.var_aa304f76[randomint(level.doa.var_aa304f76.size)];
            break;
        case 18:
            val = level.doa.var_6a49d224[randomint(level.doa.var_6a49d224.size)];
            break;
        case 19:
            val = level.doa.var_4adfb3a5[randomint(level.doa.var_4adfb3a5.size)];
            break;
        case 20:
            val = level.doa.var_888445c3[randomint(level.doa.var_888445c3.size)];
            break;
        case 7:
            val = level.doa.var_d0bdbf5a[randomint(level.doa.var_d0bdbf5a.size)];
            val.q = 1;
            break;
        case 8:
            val = level.doa.var_5127d579[randomint(level.doa.var_5127d579.size)];
            val.q = 1;
            break;
        case 21:
            val.msg = #"hash_9d56a2e5a17db7d";
            val.audio = #"hash_1896db69557c5e11";
            val.q = 1;
            break;
        case 22:
            val.msg = #"hash_284ba6bcad0fa011";
            val.audio = #"hash_3e81803ccb560d6a";
            val.q = 1;
            break;
        case 23:
            val.msg = #"hash_7f4cffc1031f00b5";
            val.audio = #"hash_960c838d32b0e8c";
            val.cooldown = 60000;
            val.q = 1;
            break;
        case 24:
            val.msg = #"hash_3b4bad43aa759f1f";
            val.audio = #"hash_77239a5e66ecb44e";
            val.q = 1;
            break;
        case 25:
            val.msg = #"hash_7645e95bcead3896";
            val.audio = #"hash_4755fe2ee3054075";
            val.q = 1;
            break;
        case 26:
            val.msg = #"hash_609187824bab8f8c";
            val.audio = #"hash_1ff8f63b3359b055";
            val.q = 1;
            break;
        case 27:
            val.msg = #"hash_55f7d13453910be6";
            val.audio = #"hash_5f5539a0f0a1cec9";
            val.q = 1;
            break;
        case 28:
            val.msg = #"hash_54810c69b1e10296";
            val.audio = #"hash_1c7d3da2f3f4766b";
            val.q = 1;
            break;
        case 29:
            val.msg = #"hash_4785a63a664e7e55";
            val.audio = #"hash_7fe1ef05f43ee976";
            val.q = 1;
            break;
        case 30:
            val.msg = #"hash_61eedbd5833223cd";
            val.audio = #"hash_6b032800e231f06c";
            val.q = 1;
            break;
        case 31:
            val.msg = #"hash_6cfbe5e38a154902";
            val.audio = #"hash_1a3ed45b1f0c08e1";
            val.q = 1;
            break;
        case 32:
            val.msg = #"hash_7069bbfd2df0b9d5";
            val.audio = #"hash_378c7a0d252fe332";
            val.q = 1;
            break;
        case 33:
            val.msg = #"hash_19083756004a8d81";
            val.audio = #"hash_6e94595ca610130";
            val.q = 1;
            break;
        case 34:
            val.msg = #"hash_35dabf0d1049ba8d";
            val.audio = #"hash_22426692f607a5e";
            val.q = 1;
            break;
        case 40:
            val.msg = randomint(100) < 50 ? #"hash_61b1168e92e80ba5" : #"hash_67f52b43a04c1e55";
            val.audio = #"hash_6298fe3f8c45ac9f";
            break;
        case 41:
            val.msg = #"hash_146f885685f54d05";
            val.audio = #"hash_8c6429df541c34c";
            break;
        case 42:
            val.msg = #"hash_17532668544a90bb";
            val.audio = #"hash_8c6429df541c34c";
            break;
        case 48:
            rnd = randomint(3);
            if (rnd == 0) {
                val.msg = #"hash_3d7f0f4a1c902cc";
            } else if (rnd == 1) {
                val.msg = #"hash_50f16daee890159a";
            } else if (rnd == 2) {
                val.msg = #"hash_50f16eaee890174d";
            }
            val.audio = #"hash_3551d2b408fff8cb";
            break;
        }
    }
    return val;
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 7, eflags: 0x2 linked
// Checksum 0x47ad7d88, Offset: 0x6198
// Size: 0x118
function setplayerowner(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump == 0) {
        return;
    }
    entnum = bwastimejump - 1;
    players = getplayers(fieldname);
    foreach (player in players) {
        if (player getentitynumber() == entnum) {
            self.player = player;
            return;
        }
    }
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 1, eflags: 0x2 linked
// Checksum 0x835f7a01, Offset: 0x62b8
// Size: 0x22e
function function_3d3e551(var_9ba84610) {
    switch (var_9ba84610) {
    case 2:
        msg = #"hash_4fac620ccd173768";
        break;
    case 3:
        msg = #"hash_3226d445d31f0b78";
        break;
    case 4:
        msg = #"hash_69a3dcbe573f702d";
        break;
    case 5:
        msg = #"hash_25cb04bb12d240c2";
        break;
    case 6:
        msg = #"hash_1a782e95144c944a";
        break;
    case 7:
        msg = #"hash_5308cbbdab4e1267";
        break;
    case 8:
        msg = #"hash_10cdd3fcab044ece";
        break;
    case 9:
        msg = #"hash_70ff900f36417489";
        break;
    case 10:
        msg = #"hash_3495d70dcc1dfce0";
        break;
    case 11:
        msg = #"hash_70abbd3574b572f5";
        break;
    case 12:
        msg = #"hash_50a737d9aecb6d57";
        break;
    case 13:
        msg = #"hash_605483745ef5b07e";
        break;
    case 14:
        msg = #"hash_528a7ccb64d23b67";
        break;
    }
    return msg;
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 3, eflags: 0x6 linked
// Checksum 0x233161c2, Offset: 0x64f0
// Size: 0x86
function private function_5abfd945(localclientnum, text, var_d9d263a1) {
    self.doa.var_5f165a77 = 1;
    self hud_message::setlowermessage(localclientnum, text);
    wait(var_d9d263a1);
    if (isdefined(self)) {
        self hud_message::clearlowermessage(localclientnum);
        self.doa.var_5f165a77 = 0;
    }
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 3, eflags: 0x2 linked
// Checksum 0x45b422e1, Offset: 0x6580
// Size: 0xa4
function message(localclientnum, text, var_d9d263a1 = 8) {
    var_e0e4a2bb = 0;
    while (is_true(self.doa.var_5f165a77)) {
        var_e0e4a2bb = 1;
        wait(1);
    }
    if (var_e0e4a2bb) {
        wait(1);
    }
    if (isdefined(self)) {
        self thread function_5abfd945(localclientnum, text, var_d9d263a1);
    }
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 1, eflags: 0x0
// Checksum 0x4ddaade3, Offset: 0x6630
// Size: 0x36
function function_1bcb9b42(var_9ba84610) {
    if (!isdefined(self.doa)) {
        return 0;
    }
    return self.doa.var_25f4de97 & 1 << var_9ba84610;
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 7, eflags: 0x2 linked
// Checksum 0x51524765, Offset: 0x6670
// Size: 0x124
function showplayerhint(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (function_f457ec42(fieldname) == 0) {
        return;
    }
    if (bwastimejump == 0) {
        return;
    }
    if (bwastimejump == 1) {
        self hud_message::clearlowermessage(fieldname);
        return;
    }
    if (!isdefined(self.doa)) {
        return;
    }
    if (!function_f457ec42(fieldname)) {
        return;
    }
    self.doa.var_25f4de97 |= 1 << bwastimejump;
    msg = function_3d3e551(bwastimejump);
    if (isdefined(msg)) {
        self thread message(fieldname, msg);
    }
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 7, eflags: 0x2 linked
// Checksum 0xda01005b, Offset: 0x67a0
// Size: 0x4a
function function_94c1298b(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    self.var_fb30ba57 = bwastimejump;
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 3, eflags: 0x0
// Checksum 0x6297405f, Offset: 0x67f8
// Size: 0xd4
function function_9ed77fee(entnum, *localclientnum, on = 0) {
    rootmodel = function_5f72e972(#"doa_world");
    playermodel = getuimodel(rootmodel, hash("player" + localclientnum + 1));
    uimodel = getuimodel(playermodel, #"hudvisible");
    setuimodelvalue(uimodel, on);
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 3, eflags: 0x2 linked
// Checksum 0x72ec6d35, Offset: 0x68d8
// Size: 0xd4
function function_9c238883(entnum, *localclientnum, on = 0) {
    rootmodel = function_5f72e972(#"doa_world");
    playermodel = getuimodel(rootmodel, hash("player" + localclientnum + 1));
    uimodel = getuimodel(playermodel, #"compassvisible");
    setuimodelvalue(uimodel, on);
}

// Namespace namespace_6e90e490/namespace_6e90e490
// Params 7, eflags: 0x2 linked
// Checksum 0x44d4973d, Offset: 0x69b8
// Size: 0x124
function function_b5afa57f(localclientnum, *oldval, *newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (!namespace_7f5aeb59::islocalplayer(self)) {
        value = 0;
    } else {
        value = is_true(self.doa.infps) || level.doa.world_state >= 4 || isdefined(level.doa.var_182fb75a);
        if (level.doa.var_938e4f08 != 0) {
            value &= level.doa.var_938e4f08 == 8;
        }
    }
    function_9c238883(self getentitynumber(), bwastimejump, value);
}

