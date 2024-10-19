// Atian COD Tools GSC CW decompiler test
#using script_221cb3c0b91a347a;
#using scripts\zm_common\zm_intel.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_tungsten_vo;

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 0, eflags: 0x2 linked
// Checksum 0x26f6c03f, Offset: 0xc20
// Size: 0xb4
function init() {
    level.var_f9d84559 = #"hash_30060ec2da14e93d";
    level thread function_9469a0c4();
    level thread function_a2a8d090();
    level thread function_b65c4342();
    level thread function_5df7275b();
    callback::on_ai_killed(&function_ed634081);
    /#
        level thread function_cd7a3de4();
    #/
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 0, eflags: 0x2 linked
// Checksum 0x94c4ef02, Offset: 0xce0
// Size: 0x184
function function_9469a0c4() {
    level flag::wait_till("initial_blackscreen_passed");
    level.var_114b6e35 = array::random(["strauss", "carver", "grey"]);
    wait(3.5);
    level function_d137d6a0(#"hash_1b7c7a29a85242f0", #"hash_1b7c6a29a85227c0", #"hash_1b7c6e29a8522e8c");
    level flag::wait_till(#"intro_scene_done");
    wait(1);
    level zm_vo::function_7622cb70(array::random([#"hash_6de372c3b844dd1", #"hash_6de342c3b8448b8", #"hash_6de352c3b844a6b", #"hash_6de3a2c3b8452ea"]));
    level flag::set(#"match_start_vo_done");
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 0, eflags: 0x2 linked
// Checksum 0x387383bb, Offset: 0xe70
// Size: 0x88
function function_b922d5d7() {
    level endon(#"end_game", #"hash_3b763d6426336ce0");
    while (true) {
        level waittill(#"start_of_round");
        if (level.round_number > 1) {
            function_752b5c36(#"hash_4a14d6908e12483c", 0);
        }
    }
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 0, eflags: 0x2 linked
// Checksum 0xba0c8f9d, Offset: 0xf00
// Size: 0x5c
function function_b65c4342() {
    level endon(#"end_game");
    level flag::wait_till(#"intro_scene_done");
    level thread zm_intel::function_d0e6ff7a("zmintel_tungsten_maxis_audiolog_2", undefined, 250);
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 0, eflags: 0x2 linked
// Checksum 0x3734affd, Offset: 0xf68
// Size: 0x934
function function_a2a8d090() {
    function_6a56c294(1, ["vox_zamr_env_gj1_jagr_0", "vox_zamr_env_gj1_gorv_1", "vox_zamr_env_gj1_jagr_2", "vox_zamr_env_gj1_gorv_3"]);
    function_6a56c294(1, ["vox_zamr_env_gj2_gorv_0", "vox_zamr_env_gj2_jagr_1", "vox_zamr_env_gj2_gorv_2", "vox_zamr_env_gj2_jagr_3"]);
    function_6a56c294(1, ["vox_zamr_env_gj3_gorv_0", "vox_zamr_env_gj3_jagr_1", "vox_zamr_env_gj3_gorv_2", "vox_zamr_env_gj3_jagr_3"]);
    function_6a56c294(1, ["vox_zamr_env_gj4_jagr_0", "vox_zamr_env_gj4_gorv_1", "vox_zamr_env_gj4_jagr_2", "vox_zamr_env_gj4_gorv_3"]);
    function_6a56c294(1, ["vox_zamr_env_gj5_jagr_0", "vox_zamr_env_gj5_gorv_1", "vox_zamr_env_gj5_krav_2", "vox_zamr_env_gj5_jagr_3"]);
    function_6a56c294(1, ["vox_zamr_env_gj6_gorv_0", "vox_zamr_env_gj6_jagr_1", "vox_zamr_env_gj6_krav_2", "vox_zamr_env_gj6_jagr_3", "vox_zamr_env_gj6_gorv_4", "vox_zamr_env_gj6_jagr_5", "vox_zamr_env_gj6_jagr_6"]);
    function_6a56c294(2, ["vox_zamr_env_kp1_krav_0", "vox_zamr_env_kp1_peck_1", "vox_zamr_env_kp1_krav_2", "vox_zamr_env_kp1_peck_3", "vox_zamr_env_kp1_krav_4"]);
    function_6a56c294(2, ["vox_zamr_env_kp2_krav_0", "vox_zamr_env_kp2_peck_1", "vox_zamr_env_kp2_krav_2", "vox_zamr_env_kp2_krav_3", "vox_zamr_env_kp2_krav_4", "vox_zamr_env_kp2_peck_5"]);
    function_6a56c294(2, ["vox_zamr_env_kp3_krav_0", "vox_zamr_env_kp3_peck_1", "vox_zamr_env_kp3_krav_2", "vox_zamr_env_kp3_peck_3", "vox_zamr_env_kp3_krav_4"]);
    function_6a56c294(2, ["vox_zamr_env_kp4_krav_0", "vox_zamr_env_kp4_peck_1", "vox_zamr_env_kp4_peck_2", "vox_zamr_env_kp4_krav_3"]);
    function_6a56c294(2, ["vox_zamr_env_kp5_krav_0", "vox_zamr_env_kp5_krav_1", "vox_zamr_env_kp5_peck_2", "vox_zamr_env_kp5_krav_3", "vox_zamr_env_kp5_peck_4", "vox_zamr_env_kp5_krav_5"]);
    function_6a56c294(2, ["vox_zamr_env_kp6_krav_0", "vox_zamr_env_kp6_peck_1", "vox_zamr_env_kp6_krav_2", "vox_zamr_env_kp6_peck_3", "vox_zamr_env_kp6_peck_4", "vox_zamr_env_kp6_krav_5", "vox_zamr_env_kp6_peck_6"]);
    function_6a56c294(3, ["vox_zamr_env_f1_fskn_0", "vox_zamr_env_f1_fskn_1", "vox_zamr_env_f1_fskn_2"]);
    function_6a56c294(3, ["vox_zamr_env_f2_fskn_0", "vox_zamr_env_f2_fskn_1"]);
    function_6a56c294(3, ["vox_zamr_env_f3_fskn_0", "vox_zamr_env_f3_fskn_1", "vox_zamr_env_f3_fskn_2"]);
    function_6a56c294(3, ["vox_zamr_env_f4_fskn_0", "vox_zamr_env_f4_fskn_1"]);
    function_6a56c294(3, ["vox_zamr_env_f5_fskn_0", "vox_zamr_env_f5_fskn_1", "vox_zamr_env_f5_fskn_2"]);
    function_6a56c294(3, ["vox_zamr_env_f6_fskn_0", "vox_zamr_env_f6_fskn_1", "vox_zamr_env_f6_fskn_2"]);
    function_6a56c294(3, ["vox_zamr_env_f7_fskn_0", "vox_zamr_env_f7_fskn_1", "vox_zamr_env_f7_fskn_2", "vox_zamr_env_f7_fskn_3", "vox_zamr_env_f7_fskn_4", "vox_zamr_env_f7_fskn_5", "vox_zamr_env_f7_fskn_6"]);
    function_6a56c294(0, ["vox_zamr_env_r1_rvnv_0", "vox_zamr_env_r1_rvnv_1"]);
    function_6a56c294(0, ["vox_zamr_env_r2_rvnv_0", "vox_zamr_env_r2_rvnv_1"]);
    function_6a56c294(0, ["vox_zamr_env_r3_rvnv_0", "vox_zamr_env_r3_rvnv_1"]);
    function_6a56c294(0, ["vox_zamr_env_r4_rvnv_0", "vox_zamr_env_r4_rvnv_1"]);
    function_6a56c294(0, ["vox_zamr_env_r5_rvnv_0", "vox_zamr_env_r5_rvnv_1", "vox_zamr_env_r5_rvnv_2"]);
    function_6a56c294(0, ["vox_zamr_env_r6_rvnv_0", "vox_zamr_env_r6_rvnv_1", "vox_zamr_env_r6_rvnv_2"]);
    function_325524a5(0, undefined, #"hash_264e763f3fa44810", 3, 5, 0);
    function_325524a5(1, undefined, #"hash_264e763f3fa44810", 3, 5, 1);
    function_325524a5(2, undefined, #"hash_264e763f3fa44810", 3, 5, 2);
    function_325524a5(3, #"hash_264e763f3fa44810", undefined, undefined, 6, 3);
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 2, eflags: 0x2 linked
// Checksum 0xb2a08f5f, Offset: 0x18a8
// Size: 0x122
function function_6a56c294(var_68325b4b, var_c2d1b468) {
    var_ee4b588 = function_70e3ac08(var_68325b4b);
    if (!isarray(level.var_f1ac6029[var_ee4b588])) {
        if (!isdefined(level.var_f1ac6029[var_ee4b588])) {
            level.var_f1ac6029[var_ee4b588] = [];
        }
    }
    if (isdefined(var_c2d1b468)) {
        if (!isdefined(level.var_f1ac6029[var_ee4b588])) {
            level.var_f1ac6029[var_ee4b588] = [];
        } else if (!isarray(level.var_f1ac6029[var_ee4b588])) {
            level.var_f1ac6029[var_ee4b588] = array(level.var_f1ac6029[var_ee4b588]);
        }
        level.var_f1ac6029[var_ee4b588][level.var_f1ac6029[var_ee4b588].size] = var_c2d1b468;
    }
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 6, eflags: 0x2 linked
// Checksum 0x84d0fc1c, Offset: 0x19d8
// Size: 0x1e2
function function_325524a5(n_index, var_3e2f8a8e, var_d1c178a, var_2b65c496, var_4c2e6c3e, var_68325b4b) {
    level endon(#"end_game");
    if (isdefined(n_index)) {
        var_88b09f83 = getentarray("environmental_vo_radio", "targetname");
        var_b57b8b27 = namespace_dbaeabbd::function_80fdd2aa(var_88b09f83, n_index);
        if (n_index == 3) {
            var_b57b8b27 hide();
        }
    } else {
        var_88b09f83 = getentarray("environmental_vo_radio", "targetname");
        var_b57b8b27 = var_88b09f83[0];
    }
    var_b57b8b27.var_3e2f8a8e = var_3e2f8a8e;
    var_b57b8b27.var_d1c178a = var_d1c178a;
    var_b57b8b27.var_2b65c496 = var_2b65c496;
    var_b57b8b27.var_4c2e6c3e = var_4c2e6c3e;
    var_b57b8b27.var_df272b25 = 0;
    var_b57b8b27.var_c2d1b468 = function_70e3ac08(var_68325b4b);
    var_b57b8b27.var_ed73ac32 = 0;
    if (isdefined(var_3e2f8a8e)) {
        level flag::wait_till(var_3e2f8a8e);
    }
    if (n_index === 3) {
        var_b57b8b27 show();
    }
    var_c826e70 = var_b57b8b27 zm_unitrigger::create(&function_81e4abd, 64, &function_d8cb1a45);
    var_c826e70.var_b57b8b27 = var_b57b8b27;
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 1, eflags: 0x2 linked
// Checksum 0x21f15716, Offset: 0x1bc8
// Size: 0xa2
function function_70e3ac08(index) {
    switch (index) {
    case 0:
        return "zamr_env_nar_r";
    case 1:
        return "zamr_env_nar_j_g";
    case 2:
        return "zamr_env_nar_k_p";
    case 3:
        return "zamr_env_nar_f";
    default:
        break;
    }
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 1, eflags: 0x2 linked
// Checksum 0x5dc52c40, Offset: 0x1c78
// Size: 0x1b4
function function_81e4abd(player) {
    if (isplayer(player)) {
        if (is_true(self.stub.var_b57b8b27.var_ed73ac32)) {
            return false;
        }
        if (isdefined(self.stub.var_b57b8b27.var_d1c178a)) {
            if (level flag::get(self.stub.var_b57b8b27.var_d1c178a)) {
                self sethintstring(#"hash_7438d0d92b1eb60");
                return true;
            } else if (isdefined(self.stub.var_b57b8b27.var_2b65c496) && self.stub.var_b57b8b27.var_df272b25 < self.stub.var_b57b8b27.var_2b65c496) {
                self sethintstring(#"hash_7438d0d92b1eb60");
                return true;
            } else {
                return false;
            }
        } else if (self.stub.var_b57b8b27.var_df272b25 <= self.stub.var_b57b8b27.var_4c2e6c3e) {
            self sethintstring(#"hash_7438d0d92b1eb60");
            return true;
        } else {
            return false;
        }
    }
    return false;
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 0, eflags: 0x2 linked
// Checksum 0xea068ece, Offset: 0x1e38
// Size: 0x2f0
function function_d8cb1a45() {
    level endon(#"end_game");
    while (true) {
        waitresult = self waittill(#"trigger");
        if (isplayer(waitresult.activator)) {
            if (!is_true(self.stub.var_b57b8b27.var_ed73ac32)) {
                if (isdefined(self.stub.var_b57b8b27.var_d1c178a)) {
                    if (level flag::get(self.stub.var_b57b8b27.var_d1c178a)) {
                        if (isdefined(self.stub.var_b57b8b27.var_2b65c496) && self.stub.var_b57b8b27.var_df272b25 < self.stub.var_b57b8b27.var_2b65c496) {
                            self.stub.var_b57b8b27.var_df272b25 = self.stub.var_b57b8b27.var_2b65c496;
                        }
                        level thread function_17b8d833(self.stub.var_b57b8b27, self.stub.var_b57b8b27.var_df272b25);
                    } else if (isdefined(self.stub.var_b57b8b27.var_2b65c496) && self.stub.var_b57b8b27.var_df272b25 < self.stub.var_b57b8b27.var_2b65c496) {
                        level thread function_17b8d833(self.stub.var_b57b8b27, self.stub.var_b57b8b27.var_df272b25);
                    }
                } else if (self.stub.var_b57b8b27.var_df272b25 <= self.stub.var_b57b8b27.var_4c2e6c3e) {
                    level thread function_17b8d833(self.stub.var_b57b8b27, self.stub.var_b57b8b27.var_df272b25);
                }
                if (self.stub.var_b57b8b27.var_df272b25 >= self.stub.var_b57b8b27.var_4c2e6c3e) {
                    waitframe(5);
                    zm_unitrigger::unregister_unitrigger(self.stub);
                }
            }
        }
    }
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 2, eflags: 0x2 linked
// Checksum 0xd9ce1eaf, Offset: 0x2130
// Size: 0x130
function function_17b8d833(entity, index) {
    level endon(#"end_game");
    entity.var_ed73ac32 = 1;
    if (isdefined(level.var_f1ac6029[entity.var_c2d1b468][index])) {
        for (i = 0; i < level.var_f1ac6029[entity.var_c2d1b468][index].size; i++) {
            str_vo = level.var_f1ac6029[entity.var_c2d1b468][index][i];
            if (isdefined(entity)) {
                entity zm_vo::function_d6f8bbd9(level.var_f1ac6029[entity.var_c2d1b468][index][i]);
                wait(0.5);
                if (!isdefined(entity)) {
                    break;
                }
            }
        }
    }
    level waittill(#"end_of_round");
    if (isdefined(entity)) {
        entity.var_ed73ac32 = 0;
        entity.var_df272b25++;
    }
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 0, eflags: 0x2 linked
// Checksum 0x6207b6c6, Offset: 0x2268
// Size: 0x1bc
function function_1402bc5a() {
    level endon(#"end_game");
    function_752b5c36(#"hash_303746a439521b44", undefined);
    var_e0c6386f = array::random([#"hash_2703b45b8783e4ef", #"hash_2703b55b8783e6a2", #"hash_2703b65b8783e855"]);
    var_40feefce = array::random([#"hash_33bb445bd7d1ff9f", #"hash_33bb455bd7d20152", #"hash_33bb465bd7d20305"]);
    var_c4ad7aa9 = array::random([#"hash_545c605be9baad33", #"hash_545c615be9baaee6", #"hash_545c625be9bab099"]);
    function_d137d6a0(var_e0c6386f, var_40feefce, var_c4ad7aa9);
    level waittill(#"hash_18e0d0074c789872");
    level thread function_752b5c36(#"hash_55b6f2f810169225", undefined);
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 0, eflags: 0x2 linked
// Checksum 0xcbaae7a6, Offset: 0x2430
// Size: 0xf4
function function_dc17412a() {
    level endon(#"end_game");
    self endon(#"death", #"disconnect");
    self function_b5b0518b(#"hash_6f657fca3d525107", undefined);
    str_vo = array::random([#"hash_17e5c43193f49382", #"hash_17e5c33193f491cf", #"hash_17e5c23193f4901c", #"hash_17e5c13193f48e69"]);
    self zm_vo::function_7622cb70(str_vo);
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 0, eflags: 0x2 linked
// Checksum 0xfba9e89d, Offset: 0x2530
// Size: 0x16c
function function_23e9435d() {
    level endon(#"end_game");
    self endon(#"death", #"disconnect");
    var_88e4eea = array::random([#"hash_690f542043db0704", #"hash_690f572043db0c1d", #"hash_690f562043db0a6a", #"hash_690f512043db01eb"]);
    self zm_vo::function_7622cb70(var_88e4eea);
    wait(1);
    var_426a22ac = array::random([#"hash_7a39a2204d8894ce", #"hash_7a39a1204d88931b", #"hash_7a39a0204d889168", #"hash_7a39a7204d889d4d"]);
    self zm_vo::function_7622cb70(var_426a22ac);
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 1, eflags: 0x2 linked
// Checksum 0x965895e6, Offset: 0x26a8
// Size: 0x9c
function function_e3e7a6eb(var_bb037e88) {
    if (var_bb037e88) {
        level thread function_d137d6a0(#"hash_2346ba48c20accb", #"hash_2347ba48c20c7fb", #"hash_2347fa48c20cec7");
        return;
    }
    level thread function_d137d6a0(#"hash_4a9bc8ffbcca71d1", #"hash_4a9bd8ffbcca8d01", #"hash_4a9bdcffbcca93cd");
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 1, eflags: 0x2 linked
// Checksum 0xb328005c, Offset: 0x2750
// Size: 0xfa
function function_e1798a8e(n_count) {
    switch (n_count) {
    case 1:
        level zm_vo::function_7622cb70(#"hash_398078d3d385a2ca");
        break;
    case 2:
        level zm_vo::function_7622cb70(#"hash_398077d3d385a117");
        break;
    case 3:
        level zm_vo::function_7622cb70(#"hash_398076d3d3859f64");
        break;
    default:
        level zm_vo::function_7622cb70(#"hash_398075d3d3859db1");
        break;
    }
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 0, eflags: 0x2 linked
// Checksum 0xdca5df4e, Offset: 0x2858
// Size: 0x7c
function function_160a5a82() {
    level endon(#"end_game");
    level zm_vo::function_7622cb70(#"hash_10ff92b09d05a770");
    level flag::wait_till(#"hash_820c83920af16b7");
    function_752b5c36(#"hash_3c58f67cfae1113e", undefined);
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 0, eflags: 0x2 linked
// Checksum 0x8259dd51, Offset: 0x28e0
// Size: 0x44
function function_65ed4fb1() {
    level endon(#"end_game");
    wait(1.5);
    level thread zm_vo::function_7622cb70(#"hash_18238483d15c8f09");
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 0, eflags: 0x2 linked
// Checksum 0x11647048, Offset: 0x2930
// Size: 0xd4
function function_28594421() {
    level endon(#"end_game");
    self endon(#"death", #"disconnect");
    self thread function_b5b0518b(#"hash_45539d72acb45b7a", undefined);
    if (isdefined(level.var_d58a6548) && isdefined(level.var_73f7a821)) {
        wait(level.var_d58a6548);
        if (self istouching(level.var_73f7a821)) {
            self thread function_b5b0518b(#"hash_45539d72acb45b7a", undefined);
        }
    }
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 1, eflags: 0x2 linked
// Checksum 0x1a30a1f6, Offset: 0x2a10
// Size: 0xc4
function function_ed634081(params) {
    if (isplayer(params.eattacker) && self.archetype === #"abom") {
        if (isdefined(level.ai_abomination) && self == level.ai_abomination) {
            return;
        }
        level thread function_d137d6a0(#"hash_6ea068bbb63a3b64", #"hash_6ea078bbb63a5694", #"hash_6ea074bbb63a4fc8");
        callback::remove_on_ai_killed(&function_ed634081);
    }
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 3, eflags: 0x2 linked
// Checksum 0xd404f287, Offset: 0x2ae0
// Size: 0xca
function function_d137d6a0(var_e0c6386f, var_40feefce, var_c4ad7aa9) {
    level endon(#"end_game");
    switch (level.var_114b6e35) {
    case #"strauss":
        self zm_vo::function_7622cb70(var_e0c6386f);
        break;
    case #"carver":
        self zm_vo::function_7622cb70(var_40feefce);
        break;
    case #"grey":
        self zm_vo::function_7622cb70(var_c4ad7aa9);
        break;
    }
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 2, eflags: 0x2 linked
// Checksum 0x38d7fb25, Offset: 0x2bb8
// Size: 0x10a
function function_752b5c36(str_vo, b_wait_if_busy) {
    level endon(#"end_game");
    foreach (player in function_a1ef346b()) {
        if (is_true(player.var_16735873)) {
            continue;
        }
        player thread zm_vo::function_c4303dda(str_vo, 0, b_wait_if_busy);
    }
    var_88546af8 = zm_vo::function_f577c17d(str_vo);
    wait(var_88546af8 + 1);
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 2, eflags: 0x2 linked
// Checksum 0x587ce653, Offset: 0x2cd0
// Size: 0xba
function function_b5b0518b(str_vo, b_wait_if_busy) {
    level endon(#"end_game");
    self endon(#"death", #"disconnect");
    if (is_true(self.var_16735873)) {
        return;
    }
    self thread zm_vo::function_c4303dda(str_vo, 0, b_wait_if_busy);
    var_88546af8 = zm_vo::function_f577c17d(str_vo);
    wait(var_88546af8 + 1);
}

// Namespace zm_tungsten_vo/zm_tungsten_vo
// Params 0, eflags: 0x2 linked
// Checksum 0xea632fac, Offset: 0x2d98
// Size: 0x174
function function_5df7275b() {
    level endon(#"end_game");
    s_audiolog = struct::get("s_maxis_audiolog_3");
    var_a4318688 = struct::get(s_audiolog.target);
    var_9e87f151 = util::spawn_model(s_audiolog.model, s_audiolog.origin, s_audiolog.angles);
    level flag::wait_till(#"hash_65cb00631d191193");
    wait(1.5);
    var_9e87f151 notsolid();
    n_power = length(s_audiolog.origin - var_a4318688.origin);
    n_wait = var_9e87f151 zm_utility::fake_physicslaunch(var_a4318688.origin, n_power);
    wait(n_wait);
    zm_intel::function_23255935("ww_quest_audiolog");
    if (isdefined(var_9e87f151)) {
        var_9e87f151 delete();
    }
}

/#

    // Namespace zm_tungsten_vo/zm_tungsten_vo
    // Params 0, eflags: 0x0
    // Checksum 0x949dcab6, Offset: 0x2f18
    // Size: 0x44
    function function_cd7a3de4() {
        util::add_debug_command("vox_zamr_env_kp5_krav_1");
        zm_devgui::add_custom_devgui_callback(&cmd);
    }

    // Namespace zm_tungsten_vo/zm_tungsten_vo
    // Params 1, eflags: 0x0
    // Checksum 0xdd5cda17, Offset: 0x2f68
    // Size: 0x62
    function cmd(cmd) {
        switch (cmd) {
        case #"test_vo":
            level thread zm_vo::function_7622cb70("<unknown string>");
            break;
        default:
            break;
        }
    }

#/
