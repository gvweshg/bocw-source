// Atian COD Tools GSC CW decompiler test
#using script_165beea08a63a243;
#using scripts\core_common\item_drop.gsc;
#using script_1caf36ff04a85ff6;
#using script_471b31bd963b388e;
#using script_340a2e805e35f7a2;
#using script_5f261a5d57de5f7c;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using script_3a704cbcf4081bfb;
#using scripts\killstreaks\killstreaks_util.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using script_1471eea5d2e60f83;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\content_manager.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_58949729;

// Namespace namespace_58949729/namespace_58949729
// Params 0, eflags: 0x5
// Checksum 0xc6370ab4, Offset: 0x4a8
// Size: 0x54
function private autoexec __init__system__() {
    system::register(#"hash_5f19cd68b4607f52", &preinit, undefined, &finalize, #"content_manager");
}

// Namespace namespace_58949729/namespace_58949729
// Params 0, eflags: 0x2 linked
// Checksum 0x3a0baf72, Offset: 0x508
// Size: 0x1b6c
function preinit() {
    level.var_8634611a = [];
    level.var_6fff281a = [];
    level.var_b048b7e = [];
    level.var_86a1e8b6 = new class_c6c0e94();
    [[ level.var_86a1e8b6 ]]->initialize(#"hash_49b01ce6d2589091", 1, float(function_60d95f53()) / 1000);
    content_manager::register_script("explore_chests", &function_50855654);
    content_manager::register_script("explore_chests_large", &function_c3e93273);
    content_manager::register_script("explore_chests_small", &function_61f1a62e);
    content_manager::register_script("loot_pods", &function_3e953077);
    clientfield::register("scriptmover", "reward_chest_fx", 1, 2, "int");
    level.var_a332ae5f = [];
    function_dabc4d71(#"armor_shard_item_sr", &function_cff40da3);
    function_dabc4d71(#"self_revive_sr_item", &function_e15f0669);
    function_6ac967bf(#"black", 1, #"black_chest_level_1");
    function_6ac967bf(#"black", 2, #"black_chest_level_2");
    function_6ac967bf(#"black", 3, #"black_chest_level_3");
    function_6ac967bf(#"black", 4, #"black_chest_level_4");
    function_6ac967bf(#"black", 5, #"black_chest_level_5");
    function_6ac967bf(#"black", 6, #"black_chest_level_6");
    function_6ac967bf(#"gold", 1, #"gold_chest_level_1");
    function_6ac967bf(#"gold", 2, #"gold_chest_level_2");
    function_6ac967bf(#"gold", 3, #"gold_chest_level_3");
    function_6ac967bf(#"gold", 4, #"gold_chest_level_4");
    function_6ac967bf(#"gold", 5, #"gold_chest_level_5");
    function_6ac967bf(#"gold", 6, #"gold_chest_level_6");
    function_6ac967bf(#"large", 1, #"large_chest_level_1");
    function_6ac967bf(#"large", 2, #"large_chest_level_2");
    function_6ac967bf(#"large", 3, #"large_chest_level_3");
    function_6ac967bf(#"large", 4, #"large_chest_level_4");
    function_6ac967bf(#"large", 5, #"large_chest_level_5");
    function_6ac967bf(#"large", 6, #"large_chest_level_6");
    function_6ac967bf(#"medium", 1, #"medium_chest_level_1");
    function_6ac967bf(#"medium", 2, #"medium_chest_level_2");
    function_6ac967bf(#"medium", 3, #"medium_chest_level_3");
    function_6ac967bf(#"medium", 4, #"medium_chest_level_4");
    function_6ac967bf(#"medium", 5, #"medium_chest_level_5");
    function_6ac967bf(#"medium", 6, #"medium_chest_level_6");
    function_6ac967bf(#"small", 1, #"small_chest_level_1");
    function_6ac967bf(#"small", 2, #"small_chest_level_2");
    function_6ac967bf(#"small", 3, #"small_chest_level_3");
    function_6ac967bf(#"small", 4, #"small_chest_level_4");
    function_6ac967bf(#"small", 5, #"small_chest_level_5");
    function_6ac967bf(#"small", 6, #"small_chest_level_6");
    function_6ac967bf(#"hash_24af9f98f7899474", 1, #"ltm_chest_level_1");
    function_6ac967bf(#"hash_24af9f98f7899474", 2, #"ltm_chest_level_2");
    function_6ac967bf(#"hash_24af9f98f7899474", 3, #"ltm_chest_level_3");
    function_6ac967bf(#"hash_24af9f98f7899474", 4, #"ltm_chest_level_4");
    function_6ac967bf(#"hash_24af9f98f7899474", 5, #"ltm_chest_level_5");
    function_6ac967bf(#"hash_24af9f98f7899474", 6, #"ltm_chest_level_6");
    if (is_true(getgametypesetting(#"hash_4751990deae37e66"))) {
        function_6ac967bf(#"hash_716f17fde963d0ae", 1, #"ltm_halloween_chest_level_1");
        function_6ac967bf(#"hash_716f17fde963d0ae", 2, #"ltm_halloween_chest_level_2");
        function_6ac967bf(#"hash_716f17fde963d0ae", 3, #"ltm_halloween_chest_level_3");
        function_6ac967bf(#"hash_716f17fde963d0ae", 4, #"ltm_halloween_chest_level_4");
        function_6ac967bf(#"hash_716f17fde963d0ae", 5, #"ltm_halloween_chest_level_5");
        function_6ac967bf(#"hash_716f17fde963d0ae", 6, #"ltm_halloween_chest_level_6");
        function_8e7c24bc(#"hash_716f17fde963d0ae", 1, #"ltm_halloween_chest_level_1");
        function_8e7c24bc(#"hash_716f17fde963d0ae", 2, #"ltm_halloween_chest_level_2");
        function_8e7c24bc(#"hash_716f17fde963d0ae", 3, #"ltm_halloween_chest_level_3");
        function_8e7c24bc(#"hash_716f17fde963d0ae", 4, #"ltm_halloween_chest_level_4");
        function_8e7c24bc(#"hash_716f17fde963d0ae", 5, #"ltm_halloween_chest_level_5");
        function_8e7c24bc(#"hash_716f17fde963d0ae", 6, #"ltm_halloween_chest_level_6");
    }
    function_6ac967bf(#"pod", 1, #"loot_pod_level_1");
    function_6ac967bf(#"pod", 2, #"loot_pod_level_2");
    function_6ac967bf(#"pod", 3, #"loot_pod_level_3");
    function_6ac967bf(#"pod", 4, #"loot_pod_level_4");
    function_6ac967bf(#"pod", 5, #"loot_pod_level_5");
    function_6ac967bf(#"pod", 6, #"loot_pod_level_6");
    if (zm_utility::function_c200446c()) {
        function_8e7c24bc(#"normal", 1, #"normal_os_zombie_level1_parent_list");
        function_8e7c24bc(#"normal", 2, #"normal_os_zombie_level2_parent_list");
        function_8e7c24bc(#"normal", 3, #"normal_os_zombie_level3_parent_list");
        function_8e7c24bc(#"normal", 4, #"normal_os_zombie_level4_parent_list");
        function_8e7c24bc(#"normal", 5, #"normal_os_zombie_level5_parent_list");
        function_8e7c24bc(#"normal", 6, #"normal_os_zombie_level6_parent_list");
        function_8e7c24bc(#"normal", 7, #"normal_os_zombie_level6_parent_list");
        function_8e7c24bc(#"normal", 8, #"normal_os_zombie_level6_parent_list");
    } else {
        function_8e7c24bc(#"normal", 1, #"normal_zombie_level1_parent_list");
        function_8e7c24bc(#"normal", 2, #"normal_zombie_level2_parent_list");
        function_8e7c24bc(#"normal", 3, #"normal_zombie_level3_parent_list");
        function_8e7c24bc(#"normal", 4, #"normal_zombie_level4_parent_list");
        function_8e7c24bc(#"normal", 5, #"normal_zombie_level5_parent_list");
        function_8e7c24bc(#"normal", 6, #"normal_zombie_level6_parent_list");
    }
    function_8e7c24bc(#"hash_622e7c9cc7c06c7", 1, #"armor_zombie_level1_parent_list");
    function_8e7c24bc(#"hash_622e7c9cc7c06c7", 2, #"armor_zombie_level2_parent_list");
    function_8e7c24bc(#"hash_622e7c9cc7c06c7", 3, #"armor_zombie_level3_parent_list");
    function_8e7c24bc(#"hash_622e7c9cc7c06c7", 4, #"armor_zombie_level4_parent_list");
    function_8e7c24bc(#"hash_622e7c9cc7c06c7", 5, #"armor_zombie_level5_parent_list");
    function_8e7c24bc(#"hash_622e7c9cc7c06c7", 6, #"armor_zombie_level6_parent_list");
    function_8e7c24bc(#"hash_7a778318514578f7", 1, #"armor_zombie_level1_parent_list");
    function_8e7c24bc(#"hash_7a778318514578f7", 2, #"armor_zombie_level2_parent_list");
    function_8e7c24bc(#"hash_7a778318514578f7", 3, #"armor_zombie_level3_parent_list");
    function_8e7c24bc(#"hash_7a778318514578f7", 4, #"armor_zombie_level4_parent_list");
    function_8e7c24bc(#"hash_7a778318514578f7", 5, #"armor_zombie_level5_parent_list");
    function_8e7c24bc(#"hash_7a778318514578f7", 6, #"armor_zombie_level6_parent_list");
    function_8e7c24bc(#"special", 1, #"special_zombie_level1_parent_list");
    function_8e7c24bc(#"special", 2, #"special_zombie_level2_parent_list");
    function_8e7c24bc(#"special", 3, #"special_zombie_level3_parent_list");
    function_8e7c24bc(#"special", 4, #"special_zombie_level4_parent_list");
    function_8e7c24bc(#"special", 5, #"special_zombie_level5_parent_list");
    function_8e7c24bc(#"special", 6, #"special_zombie_level6_parent_list");
    if (zm_utility::is_classic()) {
        function_8e7c24bc(#"hash_3adefdb432d5b064", 1, #"ltm_level1_weapon_drop_list");
        function_8e7c24bc(#"hash_3adefdb432d5b064", 2, #"ltm_level2_weapon_drop_list");
        function_8e7c24bc(#"hash_3adefdb432d5b064", 3, #"ltm_level3_weapon_drop_list");
        function_8e7c24bc(#"hash_3adefdb432d5b064", 4, #"ltm_level4_weapon_drop_list");
        function_8e7c24bc(#"hash_3adefdb432d5b064", 5, #"ltm_level5_weapon_drop_list");
        function_8e7c24bc(#"hash_3adefdb432d5b064", 6, #"ltm_level6_weapon_drop_list");
        function_8e7c24bc(#"elite", 1, #"elite_rbz_zombie_level1_parent_list");
        function_8e7c24bc(#"elite", 2, #"elite_rbz_zombie_level2_parent_list");
        function_8e7c24bc(#"elite", 3, #"elite_rbz_zombie_level3_parent_list");
        function_8e7c24bc(#"elite", 4, #"elite_rbz_zombie_level4_parent_list");
        function_8e7c24bc(#"elite", 5, #"elite_rbz_zombie_level5_parent_list");
        function_8e7c24bc(#"elite", 6, #"elite_rbz_zombie_level6_parent_list");
        return;
    }
    if (zm_utility::function_c200446c()) {
        function_8e7c24bc(#"hash_3adefdb432d5b064", 1, #"hash_5760b26e51ad9737");
        function_8e7c24bc(#"hash_3adefdb432d5b064", 2, #"hash_3f27259a0a216c6c");
        function_8e7c24bc(#"hash_3adefdb432d5b064", 3, #"hash_1e5db0734c456c81");
        function_8e7c24bc(#"hash_3adefdb432d5b064", 4, #"hash_790ef3cf334997ce");
        function_8e7c24bc(#"hash_3adefdb432d5b064", 5, #"hash_5e4ceabbcf01a5ab");
        function_8e7c24bc(#"hash_3adefdb432d5b064", 6, #"hash_4757c1d167e87940");
        function_8e7c24bc(#"hash_3adefdb432d5b064", 7, #"hash_4757c1d167e87940");
        function_8e7c24bc(#"hash_3adefdb432d5b064", 8, #"hash_4757c1d167e87940");
        function_8e7c24bc(#"special", 1, #"elite_os_zombie_level1_parent_list");
        function_8e7c24bc(#"special", 2, #"elite_os_zombie_level2_parent_list");
        function_8e7c24bc(#"special", 3, #"elite_os_zombie_level3_parent_list");
        function_8e7c24bc(#"special", 4, #"elite_os_zombie_level4_parent_list");
        function_8e7c24bc(#"special", 5, #"elite_os_zombie_level5_parent_list");
        function_8e7c24bc(#"special", 6, #"elite_os_zombie_level6_parent_list");
        function_8e7c24bc(#"special", 7, #"elite_os_zombie_level7_parent_list");
        function_8e7c24bc(#"special", 8, #"elite_os_zombie_level8_parent_list");
        function_8e7c24bc(#"elite", 1, #"elite_os_zombie_level1_parent_list");
        function_8e7c24bc(#"elite", 2, #"elite_os_zombie_level2_parent_list");
        function_8e7c24bc(#"elite", 3, #"elite_os_zombie_level3_parent_list");
        function_8e7c24bc(#"elite", 4, #"elite_os_zombie_level4_parent_list");
        function_8e7c24bc(#"elite", 5, #"elite_os_zombie_level5_parent_list");
        function_8e7c24bc(#"elite", 6, #"elite_os_zombie_level6_parent_list");
        function_8e7c24bc(#"elite", 7, #"elite_os_zombie_level7_parent_list");
        function_8e7c24bc(#"elite", 8, #"elite_os_zombie_level8_parent_list");
        return;
    }
    function_8e7c24bc(#"elite", 1, #"elite_zombie_level1_parent_list");
    function_8e7c24bc(#"elite", 2, #"elite_zombie_level2_parent_list");
    function_8e7c24bc(#"elite", 3, #"elite_zombie_level3_parent_list");
    function_8e7c24bc(#"elite", 4, #"elite_zombie_level4_parent_list");
    function_8e7c24bc(#"elite", 5, #"elite_zombie_level5_parent_list");
    function_8e7c24bc(#"elite", 6, #"elite_zombie_level6_parent_list");
    function_8e7c24bc(#"boss", 1, #"boss_zombie_level1_parent_list");
    function_8e7c24bc(#"boss", 2, #"boss_zombie_level2_parent_list");
    function_8e7c24bc(#"boss", 3, #"boss_zombie_level3_parent_list");
    function_8e7c24bc(#"boss", 4, #"boss_zombie_level4_parent_list");
    function_8e7c24bc(#"boss", 5, #"boss_zombie_level5_parent_list");
    function_8e7c24bc(#"boss", 6, #"boss_zombie_level6_parent_list");
}

// Namespace namespace_58949729/namespace_58949729
// Params 0, eflags: 0x2 linked
// Checksum 0xa49fa536, Offset: 0x2080
// Size: 0x1c
function finalize() {
    /#
        level thread init_devgui();
    #/
}

// Namespace namespace_58949729/namespace_58949729
// Params 0, eflags: 0x2 linked
// Checksum 0x115745cb, Offset: 0x20a8
// Size: 0x34
function function_5a12541e() {
    level.var_82d4d3b8 = 0;
    callback::on_ai_killed(&function_2394df30);
}

// Namespace namespace_58949729/namespace_58949729
// Params 3, eflags: 0x6 linked
// Checksum 0xea4c0d85, Offset: 0x20e8
// Size: 0x5a
function private function_6ac967bf(type, var_b48509f9, list) {
    if (!isdefined(level.var_6fff281a[type])) {
        level.var_6fff281a[type] = [];
    }
    level.var_6fff281a[type][var_b48509f9] = list;
}

// Namespace namespace_58949729/namespace_58949729
// Params 3, eflags: 0x6 linked
// Checksum 0x28e65f4a, Offset: 0x2150
// Size: 0x5a
function private function_8e7c24bc(type, var_b48509f9, list) {
    if (!isdefined(level.var_b048b7e[type])) {
        level.var_b048b7e[type] = [];
    }
    level.var_b048b7e[type][var_b48509f9] = list;
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0xf0d11c2d, Offset: 0x21b8
// Size: 0x8c
function function_b764d7c6(attachment) {
    switch (attachment) {
    case #"suppressed":
        return 8;
    case #"suppressed2":
        return 10;
    case #"mixmuzzle":
        return 8;
    case #"mixmuzzle2":
        return 10;
    }
    return 0;
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0xc9b04aa2, Offset: 0x2250
// Size: 0x8c
function function_339b84ba(attachment) {
    switch (attachment) {
    case #"light":
        return 5;
    case #"light2":
        return 8;
    case #"mixbody":
        return 3;
    case #"mixbody2":
        return 10;
    }
    return 0;
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0x2a76638b, Offset: 0x22e8
// Size: 0x122
function function_7ff60ccf(star_level = 1) {
    switch (star_level) {
    case 1:
        return #"level_1_resource_list";
    case 2:
        return #"level_2_resource_list";
    case 3:
        return #"level_3_resource_list";
    case 4:
        return #"level_4_resource_list";
    case 5:
        return #"level_5_resource_list";
    case 6:
        return #"level_6_resource_list";
    default:
        return #"level_6_resource_list";
    }
    return #"level_1_resource_list";
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0x250e3843, Offset: 0x2418
// Size: 0xc3e
function function_2394df30(s_params) {
    /#
        if (is_true(getdvarint(#"hash_5b8584aa904a13cc"))) {
            return;
        }
    #/
    if (is_true(self.var_98f1f37c)) {
        return;
    }
    if (!isdefined(self) || !isactor(self)) {
        return;
    }
    if (self function_dd070839() && self.aitype !== #"hash_729b116cf9d044") {
        return;
    }
    if (is_true(level.var_ef784546)) {
        if (is_true(self.var_a54d6082)) {
            return;
        }
    }
    if (isdefined(s_params.weapon)) {
        weapon = s_params.weapon;
    }
    var_4aeae769 = self.origin;
    var_3ecf13fe = self.angles;
    var_35d10171 = self.var_6f84b820;
    var_408fcfcb = self.var_9fde8624;
    var_2e6f77db = self.aitype;
    var_1c7494b3 = self.var_44505aa3;
    var_ed185014 = self.targetname;
    if (self.archetype === #"hulk") {
        var_4aeae769 = self gettagorigin("j_weakpoint");
        var_23759be6 = getdvarint(#"hash_50b18a791b1b5d34", 0);
        setdvar(#"hash_50b18a791b1b5d34", 24);
    }
    waitframe(1);
    var_cb46b9ea = {};
    [[ level.var_86a1e8b6 ]]->waitinqueue(var_cb46b9ea);
    var_9bbfe6c2 = 1;
    if (var_2e6f77db === #"hash_729b116cf9d044") {
        var_ec6368f9 = #"ronnie_raygun_drop_list";
    } else if (var_408fcfcb === #"hash_622e7c9cc7c06c7" || var_408fcfcb === #"hash_7a778318514578f7") {
        var_ec6368f9 = function_257d7203(var_408fcfcb);
    } else {
        var_ec6368f9 = function_257d7203(var_35d10171);
    }
    if (isdefined(level.var_fb9a8536[var_ec6368f9])) {
        var_ec6368f9 = level.var_fb9a8536[var_ec6368f9];
    }
    dropstruct = {#origin:var_4aeae769, #angles:var_3ecf13fe, #var_738dfc81:20};
    var_5bb8af3f = dropstruct namespace_65181344::function_fd87c780(var_ec6368f9, 20, 2);
    if (!isdefined(var_5bb8af3f)) {
        var_5bb8af3f = [];
    }
    if (var_5bb8af3f.size <= 0 && isdefined(weapon)) {
        var_8be3ada4 = 0;
        var_311d223d = 0;
        var_e6d210b6 = 0;
        var_515ea3b6 = 0;
        var_d6525c75 = #"none";
        var_544f5f81 = #"none";
        if (isarray(weapon.attachments)) {
            attachments = weapon.attachments;
            foreach (attachment in weapon.attachments) {
                if (attachment == #"suppressed" || attachment == #"suppressed2" || attachment == #"mixmuzzle" || attachment == #"mixmuzzle2") {
                    var_8be3ada4 = 1;
                    var_d6525c75 = attachment;
                }
                if (attachment == #"light" || attachment == #"light2" || attachment == #"mixbody" || attachment == #"mixbody2") {
                    var_311d223d = 1;
                    var_544f5f81 = attachment;
                }
            }
        }
        if (var_8be3ada4 && var_311d223d) {
            var_e6d210b6 = function_b764d7c6(var_d6525c75);
            var_515ea3b6 = function_339b84ba(var_544f5f81);
            if (math::cointoss(var_e6d210b6)) {
                dropstruct = {#origin:var_4aeae769, #angles:var_3ecf13fe, #var_738dfc81:10};
                var_5bb8af3f = dropstruct namespace_65181344::function_fd87c780(#"zm_equipment_parent_list", 1, 2);
            }
            if (var_5bb8af3f.size <= 0) {
                if (math::cointoss(var_515ea3b6)) {
                    list = function_7ff60ccf(zm_utility::function_e3025ca5());
                    dropstruct = {#origin:var_4aeae769, #angles:var_3ecf13fe, #var_738dfc81:10};
                    var_5bb8af3f = dropstruct namespace_65181344::function_fd87c780(list, 1, 2);
                }
            }
        } else if (var_8be3ada4) {
            var_e6d210b6 = function_b764d7c6(var_d6525c75);
            if (math::cointoss(var_e6d210b6)) {
                dropstruct = {#origin:var_4aeae769, #angles:var_3ecf13fe, #var_738dfc81:10};
                var_5bb8af3f = dropstruct namespace_65181344::function_fd87c780(#"zm_equipment_parent_list", 1, 2);
            }
        } else if (var_311d223d) {
            var_515ea3b6 = function_339b84ba(var_544f5f81);
            if (math::cointoss(var_515ea3b6)) {
                list = function_7ff60ccf(zm_utility::function_e3025ca5());
                dropstruct = {#origin:var_4aeae769, #angles:var_3ecf13fe, #var_738dfc81:10};
                var_5bb8af3f = dropstruct namespace_65181344::function_fd87c780(list, 1, 2);
            }
        }
    }
    if (isdefined(var_23759be6)) {
        setdvar(#"hash_50b18a791b1b5d34", var_23759be6);
    }
    wait(0.2);
    if (isdefined(var_2e6f77db) && issubstr(var_2e6f77db, "hvt")) {
        a_items = dropstruct namespace_65181344::function_fd87c780(#"hvt_bonus_drop_list", 1, 2);
        if (isarray(a_items)) {
            var_5bb8af3f = arraycombine(var_5bb8af3f, a_items, 0, 0);
        }
    }
    if (var_ed185014 === "hulk_zombie" && math::cointoss(33)) {
        a_items = dropstruct namespace_65181344::function_fd87c780(#"sr_zombie_drop_ammo", 1, 2);
        if (isarray(a_items)) {
            var_5bb8af3f = arraycombine(var_5bb8af3f, a_items, 0, 0);
        }
    }
    if (isplayer(s_params.eattacker) && s_params.eattacker namespace_e86ffa8::function_30a8ed81(2) && math::cointoss(5)) {
        a_items = dropstruct namespace_65181344::function_fd87c780(#"sr_zombie_drop_ammo", 1, 2);
        if (isarray(a_items)) {
            var_5bb8af3f = arraycombine(var_5bb8af3f, a_items, 0, 0);
        }
    }
    /#
        if (is_true(getdvarint(#"hash_4f6649cba9e849a9"))) {
            var_5ed8ed31 = getdvarstring(#"hash_74ef02ba6375e089", "<unknown string>");
            item_drop = function_4ba8fde(var_5ed8ed31);
            item = item_drop::drop_item(0, undefined, 1, 0, item_drop.id, dropstruct.origin, dropstruct.angles, 2);
        }
    #/
    if (isdefined(level.var_b20199e0)) {
        a_items = dropstruct [[ level.var_b20199e0 ]](var_2e6f77db);
        if (isarray(a_items)) {
            var_5bb8af3f = arraycombine(var_5bb8af3f, a_items, 0, 0);
        }
    }
    foreach (item in var_5bb8af3f) {
        if (isdefined(item)) {
            item.var_d688ad29 = 1;
        }
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 2, eflags: 0x2 linked
// Checksum 0x30401998, Offset: 0x3060
// Size: 0xf2
function function_257d7203(type = #"normal", var_59364773) {
    var_b48509f9 = zm_utility::function_e3025ca5();
    if (isdefined(var_59364773)) {
        var_b48509f9 += var_59364773;
    }
    if (zm_utility::function_c200446c()) {
        var_b48509f9 = math::clamp(var_b48509f9, 1, 8);
    } else {
        var_b48509f9 = math::clamp(var_b48509f9, 1, 6);
    }
    if (isdefined(level.var_b048b7e[type][var_b48509f9])) {
        return level.var_b048b7e[type][var_b48509f9];
    }
    return #"normal_zombie_level1_parent_list";
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0x8bc948af, Offset: 0x3160
// Size: 0xda
function function_fd5e77fa(type = #"small") {
    var_b48509f9 = zm_utility::function_e3025ca5();
    if (zm_utility::function_c200446c()) {
        var_b48509f9 = math::clamp(var_b48509f9, 1, 8);
    } else {
        var_b48509f9 = math::clamp(var_b48509f9, 1, 6);
    }
    if (isdefined(level.var_6fff281a[type][var_b48509f9])) {
        return level.var_6fff281a[type][var_b48509f9];
    }
    return #"small_chest_level_1";
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0x7d7880b4, Offset: 0x3248
// Size: 0x122
function function_6e72c1e2(instance) {
    destination = instance.location.destination;
    switch (destination.targetname) {
    case #"hash_5f2517807d00a883":
        return 5;
    case #"hash_1f2ae7320559ce18":
        return 5;
    case #"destination_duga":
        return 5;
    case #"destination_forest":
        return 5;
    case #"destination_golova":
        return 5;
    case #"destination_sanatorium":
        return 5;
    case #"destination_ski":
        return 5;
    case #"hash_d373079cb7e775e":
        return 5;
    case #"destination_zoo":
        return 5;
    default:
        return 5;
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0xbdfda235, Offset: 0x3378
// Size: 0x122
function function_933f4c09(instance) {
    destination = instance.location.destination;
    switch (destination.targetname) {
    case #"hash_5f2517807d00a883":
        return 10;
    case #"hash_1f2ae7320559ce18":
        return 10;
    case #"destination_duga":
        return 10;
    case #"destination_forest":
        return 10;
    case #"destination_golova":
        return 10;
    case #"destination_sanatorium":
        return 10;
    case #"destination_ski":
        return 10;
    case #"hash_d373079cb7e775e":
        return 10;
    case #"destination_zoo":
        return 10;
    default:
        return 10;
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0x4da61e7d, Offset: 0x34a8
// Size: 0x122
function function_7cd90066(instance) {
    destination = instance.location.destination;
    switch (destination.targetname) {
    case #"hash_5f2517807d00a883":
        return 10;
    case #"hash_1f2ae7320559ce18":
        return 10;
    case #"destination_duga":
        return 10;
    case #"destination_forest":
        return 10;
    case #"destination_golova":
        return 10;
    case #"destination_sanatorium":
        return 10;
    case #"destination_ski":
        return 10;
    case #"hash_d373079cb7e775e":
        return 10;
    case #"destination_zoo":
        return 10;
    default:
        return 10;
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0xccb1ae6b, Offset: 0x35d8
// Size: 0xe4
function function_c3e93273(instance) {
    var_cc1fb2d0 = function_fd5e77fa(#"large");
    var_3a053962 = #"p9_fxanim_zm_gp_chest_01_lrg_low_xmodel";
    /#
        str_dvar = "<unknown string>";
    #/
    var_c6e3f0a = function_6e72c1e2(instance);
    if (getplayers().size > 3) {
        var_c6e3f0a += 1;
    }
    function_34c59c2c(instance, var_c6e3f0a, var_cc1fb2d0, var_3a053962, #"p9_fxanim_zm_gp_chest_01_lrg_bundle", 3, str_dvar);
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0x8146e20c, Offset: 0x36c8
// Size: 0xe4
function function_50855654(instance) {
    var_cc1fb2d0 = function_fd5e77fa(#"medium");
    var_3a053962 = #"p9_fxanim_zm_gp_chest_01_med_low_xmodel";
    /#
        str_dvar = "<unknown string>";
    #/
    var_c6e3f0a = function_933f4c09(instance);
    if (getplayers().size > 2) {
        var_c6e3f0a += 1;
    }
    function_34c59c2c(instance, var_c6e3f0a, var_cc1fb2d0, var_3a053962, #"p9_fxanim_zm_gp_chest_01_med_bundle", 2, str_dvar);
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0xf8d5a56d, Offset: 0x37b8
// Size: 0xe4
function function_61f1a62e(instance) {
    var_cc1fb2d0 = function_fd5e77fa(#"small");
    var_3a053962 = #"p9_fxanim_zm_gp_chest_01_sml_low_xmodel";
    /#
        str_dvar = "<unknown string>";
    #/
    var_c6e3f0a = function_7cd90066(instance);
    if (getplayers().size > 1) {
        var_c6e3f0a += 1;
    }
    function_34c59c2c(instance, var_c6e3f0a, var_cc1fb2d0, var_3a053962, #"p9_fxanim_zm_gp_chest_01_sml_bundle", 1, str_dvar);
}

// Namespace namespace_58949729/namespace_58949729
// Params 7, eflags: 0x2 linked
// Checksum 0x12a52556, Offset: 0x38a8
// Size: 0x3cc
function function_34c59c2c(instance, var_c6e3f0a, var_cc1fb2d0, var_3a053962, str_scene, var_dae71351, str_dvar) {
    var_842cdacd = instance.contentgroups[#"hash_6b1e5d8f9e70a70e"];
    var_842cdacd = array::randomize(var_842cdacd);
    var_8634611a = [];
    for (i = 0; i < var_842cdacd.size; i++) {
        struct = var_842cdacd[i];
        if (isdefined(struct.scriptmodel)) {
            struct.scriptmodel delete();
        }
        if (isdefined(struct.trigger)) {
            struct.trigger delete();
        }
        var_df4d665a = function_ce254cce(struct);
        if (var_8634611a.size >= var_c6e3f0a || !var_df4d665a && getdvarint(#"hash_6e805904860dca0d", 0)) {
            if ((var_df4d665a || getdvarint(#"hash_6e805904860dca0d", 0)) && var_3a053962 !== "p9_fxanim_zm_gp_chest_01_sml_low_xmodel") {
                struct.var_3a053962 = var_3a053962;
                struct.var_dae71351 = var_dae71351;
                if (!isdefined(level.var_86e072a5)) {
                    level.var_86e072a5 = [];
                } else if (!isarray(level.var_86e072a5)) {
                    level.var_86e072a5 = array(level.var_86e072a5);
                }
                level.var_86e072a5[level.var_86e072a5.size] = struct;
            }
            continue;
        }
        util::wait_network_frame();
        /#
            level thread function_e4314d0e(struct);
        #/
        if (!var_df4d665a) {
            continue;
        }
        function_4ec9fc99(struct, var_cc1fb2d0, var_3a053962, str_scene, var_dae71351);
        if (!isdefined(var_8634611a)) {
            var_8634611a = [];
        } else if (!isarray(var_8634611a)) {
            var_8634611a = array(var_8634611a);
        }
        if (!isinarray(var_8634611a, struct)) {
            var_8634611a[var_8634611a.size] = struct;
        }
        if (!isdefined(level.var_8634611a)) {
            level.var_8634611a = [];
        } else if (!isarray(level.var_8634611a)) {
            level.var_8634611a = array(level.var_8634611a);
        }
        if (!isinarray(level.var_8634611a, struct)) {
            level.var_8634611a[level.var_8634611a.size] = struct;
        }
    }
    /#
        instance.var_8634611a = var_8634611a;
        level thread function_8f59f892(instance, str_dvar);
    #/
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0x6122ae47, Offset: 0x3c80
// Size: 0x5a
function function_ce254cce(struct) {
    var_4ee5a6d7 = arraysortclosest(level.var_8634611a, struct.origin, 1, 0, 2000);
    if (var_4ee5a6d7.size > 0) {
        return false;
    }
    return true;
}

// Namespace namespace_58949729/namespace_58949729
// Params 7, eflags: 0x2 linked
// Checksum 0xe0092f4c, Offset: 0x3ce8
// Size: 0x44e
function function_4ec9fc99(struct, var_cc1fb2d0, var_3a053962, str_scene, var_dae71351, var_3f3c5683 = 1, var_eed348ab = 0) {
    struct.scriptmodel = content_manager::spawn_script_model(struct, var_3a053962, 1);
    if (isdefined(struct.scriptmodel) && struct.scriptmodel clientfield::is_registered("perk_death_perception_item_marked_for_rob")) {
        struct.scriptmodel clientfield::set("perk_death_perception_item_marked_for_rob", 1);
    }
    struct.scriptmodel clientfield::set("reward_chest_fx", var_dae71351);
    struct.var_422ae63e = str_scene;
    if (var_eed348ab) {
        struct.scriptmodel endon(#"death");
        struct.scriptmodel physicslaunch();
        s_waitresult = struct.scriptmodel waittilltimeout(6, #"stationary");
        if (isdefined(struct.var_a4fadd7e)) {
            if (abs(struct.scriptmodel.origin[2] - struct.var_a4fadd7e[2]) > 80 || s_waitresult._notify === #"timeout") {
                if (isdefined(struct.scriptmodel)) {
                    struct.scriptmodel deletedelay();
                }
                return;
            }
        }
    }
    if (var_3f3c5683) {
        forward = anglestoforward(struct.scriptmodel.angles);
        forward = vectornormalize(forward);
        forward = (forward[0] * 16, forward[1] * 16, forward[2] * 16);
        forward = (forward[0], forward[1], forward[2] + 16);
    }
    trigger = content_manager::spawn_interact(struct, &function_8665f666, #"hash_4703982104472957", undefined, 60, 24, undefined, forward);
    trigger.struct = struct;
    trigger.var_cc1fb2d0 = var_cc1fb2d0;
    trigger.targetname = "explore_chest_trigger";
    struct.trigger = trigger;
    if (var_3a053962 === #"hash_401a47741ffd646f") {
        trigger sethintstring("SURVIVAL/SUPPLY_DROP_OPEN");
    } else if (var_3a053962 === #"hash_12e47c6c01f2ff59") {
        trigger sethintstring(#"hash_792d71ad95fdc718");
    } else if (var_3a053962 === "p9_fxanim_zm_gp_chest_01_lrg_low_xmodel") {
        trigger sethintstring("SCRIPT/SR_LOOT_HINT_LARGE");
    } else if (var_3a053962 === "p9_fxanim_zm_gp_chest_01_med_low_xmodel") {
        trigger sethintstring("SCRIPT/SR_LOOT_HINT_MEDIUM");
    } else if (var_3a053962 === "p9_fxanim_zm_gp_chest_01_sml_low_xmodel") {
        trigger sethintstring("SCRIPT/SR_LOOT_HINT_SMALL");
    }
    trigger.origin += (0, 0, 16);
}

// Namespace namespace_58949729/namespace_58949729
// Params 3, eflags: 0x2 linked
// Checksum 0x7151f17, Offset: 0x4140
// Size: 0x428
function function_25979f32(struct, var_93fe96a6, s_instance) {
    if (isdefined(s_instance) && s_instance flag::get("cleanup")) {
        return;
    }
    if (!isdefined(struct.var_422ae63e)) {
        struct.var_422ae63e = #"p9_fxanim_zm_gp_chest_01_lrg_bundle";
    }
    if (!isdefined(struct.var_cc1fb2d0)) {
        struct.var_cc1fb2d0 = function_fd5e77fa(#"gold");
    }
    if (!isdefined(struct.mdl_chest)) {
        struct.mdl_chest = #"hash_401a47741ffd646f";
    }
    if (!isdefined(struct.var_dae71351)) {
        struct.var_dae71351 = 3;
    }
    struct.scriptmodel = content_manager::spawn_script_model(struct, struct.mdl_chest, 1);
    struct.scriptmodel clientfield::set("reward_chest_fx", struct.var_dae71351);
    forward = anglestoforward(struct.scriptmodel.angles);
    forward = vectornormalize(forward);
    forward = (forward[0] * 16, forward[1] * 16, forward[2] * 16);
    forward = (forward[0], forward[1], forward[2] + 16);
    trigger = content_manager::spawn_interact(struct, &function_8665f666, #"hash_4703982104472957", undefined, 60, 24, undefined, forward);
    trigger.struct = struct;
    trigger.var_cc1fb2d0 = struct.var_cc1fb2d0;
    struct.scriptmodel.trigger = trigger;
    if (struct.mdl_chest === #"hash_401a47741ffd646f") {
        trigger sethintstring("SURVIVAL/SUPPLY_DROP_OPEN");
    } else if (struct.mdl_chest === "p9_fxanim_zm_gp_chest_01_lrg_low_xmodel") {
        trigger sethintstring("SCRIPT/SR_LOOT_HINT_LARGE");
    } else if (struct.mdl_chest === "p9_fxanim_zm_gp_chest_01_med_low_xmodel") {
        trigger sethintstring("SCRIPT/SR_LOOT_HINT_MEDIUM");
    } else if (struct.mdl_chest === "p9_fxanim_zm_gp_chest_01_sml_low_xmodel") {
        trigger sethintstring("SCRIPT/SR_LOOT_HINT_SMALL");
    }
    trigger.origin += (0, 0, 16);
    if (is_true(var_93fe96a6)) {
        struct.var_e234ef47 = zm_utility::function_f5a222a8(#"hash_15752913c15d86ff", struct.scriptmodel);
    }
    if (isdefined(s_instance)) {
        if (!isdefined(s_instance.var_f46ace2)) {
            s_instance.var_f46ace2 = [];
        } else if (!isarray(s_instance.var_f46ace2)) {
            s_instance.var_f46ace2 = array(s_instance.var_f46ace2);
        }
        if (!isinarray(s_instance.var_f46ace2, struct)) {
            s_instance.var_f46ace2[s_instance.var_f46ace2.size] = struct;
        }
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0xbc3ee776, Offset: 0x4570
// Size: 0xc4
function function_ccf9be41(s_instance) {
    if (isdefined(s_instance.var_f46ace2)) {
        foreach (s_chest in s_instance.var_f46ace2) {
            if (isdefined(s_chest)) {
                function_a3852ab5(s_chest);
            }
        }
        arrayremovevalue(s_instance.var_f46ace2, undefined);
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0xbe4e9340, Offset: 0x4640
// Size: 0x9c
function function_a3852ab5(struct) {
    function_a5d57202(struct);
    if (isdefined(struct.scriptmodel.trigger)) {
        struct.scriptmodel.trigger delete();
    }
    if (isdefined(struct.scriptmodel)) {
        struct.scriptmodel scene::stop();
        struct.scriptmodel delete();
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0x3a2ceb6f, Offset: 0x46e8
// Size: 0x56
function function_a5d57202(struct) {
    if (isdefined(struct.var_e234ef47)) {
        objective_delete(struct.var_e234ef47);
        gameobjects::release_obj_id(struct.var_e234ef47);
        struct.var_e234ef47 = undefined;
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 3, eflags: 0x2 linked
// Checksum 0x8c9bc94f, Offset: 0x4748
// Size: 0x124
function function_7e02195f(s_spawn_point, var_3a053962 = "p9_fxanim_zm_gp_chest_01_med_low_xmodel", var_dae71351 = 2) {
    if (var_3a053962 === "p9_fxanim_zm_gp_chest_01_lrg_low_xmodel") {
        var_68455141 = #"sr_large_chest";
    } else {
        var_68455141 = #"sr_medium_chest";
    }
    var_c590f74 = mimic_prop_spawn::function_b309db61([s_spawn_point], undefined, undefined, var_68455141);
    var_c590f74 clientfield::set("reward_chest_fx", var_dae71351);
    /#
        if (getdvarint(#"hash_6e805904860dca0d", 0)) {
            debugstar(s_spawn_point.origin, 99999, (1, 1, 1), "<unknown string>");
        }
    #/
}

// Namespace namespace_58949729/namespace_58949729
// Params 0, eflags: 0x0
// Checksum 0xf4e57ab2, Offset: 0x4878
// Size: 0x1fe
function function_2901cde1() {
    self notify("c55e88086deabce");
    self endon("c55e88086deabce");
    self endon(#"death");
    while (true) {
        foreach (player in getplayers()) {
            if (!isdefined(player.var_4ee86e15)) {
                player.var_4ee86e15 = [];
            }
            if (!isinarray(player.var_4ee86e15, self) && distancesquared(player.origin, self.origin) < 1562500) {
                player thread globallogic_audio::play_taacom_dialog("treasureChest");
                arrayremovevalue(player.var_4ee86e15, undefined);
                if (!isdefined(player.var_4ee86e15)) {
                    player.var_4ee86e15 = [];
                } else if (!isarray(player.var_4ee86e15)) {
                    player.var_4ee86e15 = array(player.var_4ee86e15);
                }
                if (!isinarray(player.var_4ee86e15, self)) {
                    player.var_4ee86e15[player.var_4ee86e15.size] = self;
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0x89cfc559, Offset: 0x4a80
// Size: 0x4ac
function function_8665f666(eventstruct) {
    if (is_true(self.b_opened)) {
        return;
    }
    if (isdefined(self.struct.scriptmodel) && self.struct.scriptmodel clientfield::is_registered("perk_death_perception_item_marked_for_rob")) {
        self.struct.scriptmodel clientfield::set("perk_death_perception_item_marked_for_rob", 0);
    }
    self.b_opened = 1;
    self notify(#"chest_opened");
    self callback::remove_on_trigger(&function_8665f666);
    self triggerenable(0);
    self.struct.scriptmodel thread scene::play(self.struct.var_422ae63e, self.struct.scriptmodel);
    if (isplayer(eventstruct.activator)) {
        eventstruct.activator playrumbleonentity("damage_heavy");
        eventstruct.activator zm_stats::function_945c7ce2(#"hash_346e6565d0a79066", 1);
        if (eventstruct.activator namespace_e86ffa8::function_cb561923(5)) {
            eventstruct.activator zm_stats::increment_challenge_stat(#"hash_4b940f1a2905c9ec");
        }
        if (self.struct.scriptmodel.model === #"hash_12e47c6c01f2ff59") {
            eventstruct.activator zm_stats::function_17ee4529(#"hash_513bca963a91d668", 1, #"hash_735ace6b22542a65");
        }
    }
    var_2fab6c8d = #"hash_3c26138474513c5c";
    if (isdefined(self.var_cc1fb2d0)) {
        if (self.var_cc1fb2d0 === #"sr_explore_chest_medium") {
            var_2fab6c8d = #"hash_2f094f31f2dbf8f4";
        } else if (self.var_cc1fb2d0 === #"sr_explore_chest_large") {
            var_2fab6c8d = #"hash_6f32121c959e02d0";
        }
    }
    if (isentity(self.struct.scriptmodel)) {
        self.struct.scriptmodel playsound(var_2fab6c8d);
    }
    wait(1);
    if (isdefined(self.struct.scriptmodel)) {
        level thread function_f82f361c(self.struct, self.var_cc1fb2d0, 3, 0, (0, 0, -8), 1);
        if (self.struct.scriptmodel.model === #"hash_401a47741ffd646f") {
            v_drop = anglestoup(self.struct.scriptmodel.angles) * 16 + anglestoforward(self.struct.scriptmodel.angles) * 12;
            level thread util::delay(1, undefined, &zm_powerups::specific_powerup_drop, "hero_weapon_power", self.struct.scriptmodel.origin + v_drop);
        }
        self.struct.scriptmodel thread function_1e2500f(eventstruct.activator);
    }
    waittillframeend();
    if (isdefined(self)) {
        function_a5d57202(self.struct);
        self delete();
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0xb2b6edba, Offset: 0x4f38
// Size: 0xcc
function function_1e2500f(player) {
    level endon(#"game_ended");
    self endon(#"death");
    self clientfield::set("reward_chest_fx", 0);
    if (isdefined(self.var_cad1f913)) {
        [[ self.var_cad1f913 ]](player);
        return;
    }
    level function_a518db14(self.origin);
    self scene::stop();
    util::wait_network_frame();
    self delete();
}

// Namespace namespace_58949729/namespace_58949729
// Params 2, eflags: 0x2 linked
// Checksum 0xfb054da2, Offset: 0x5010
// Size: 0x78
function function_a518db14(location, radius = 1500) {
    level endon(#"game_ended");
    while (true) {
        if (getplayers("all", location, radius).size == 0) {
            return;
        }
        wait(5);
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 6, eflags: 0x2 linked
// Checksum 0x2b73ff67, Offset: 0x5090
// Size: 0x3c6
function function_f82f361c(struct, var_cc1fb2d0, var_98d110e6 = 1, var_5b57dd9 = 0, v_offset = (0, 0, 0), var_e2856109 = 0) {
    scriptmodel = struct.scriptmodel;
    var_e784014f = isdefined(scriptmodel.var_11428995) ? scriptmodel.var_11428995 : (0, 0, 0);
    reward_origin = scriptmodel.origin;
    if (var_5b57dd9) {
        reward_origin = struct.origin;
    }
    if (!isdefined(reward_origin)) {
        return;
    }
    reward_origin += v_offset;
    n_count = struct.var_738dfc81;
    if (!isdefined(n_count)) {
        n_count = 99;
    }
    if (isdefined(level.var_fb9a8536[var_cc1fb2d0])) {
        var_cc1fb2d0 = level.var_fb9a8536[var_cc1fb2d0];
    }
    dropangles = isdefined(scriptmodel.angles) ? scriptmodel.angles : (0, 0, 0);
    dropstruct = {#origin:reward_origin, #angles:dropangles + var_e784014f, #var_738dfc81:n_count};
    a_items = dropstruct namespace_65181344::function_fd87c780(var_cc1fb2d0, n_count, var_98d110e6);
    if (var_cc1fb2d0 === #"loot_pod_level_1" || var_cc1fb2d0 === #"loot_pod_level_2" || var_cc1fb2d0 === #"loot_pod_level_3" || var_cc1fb2d0 === #"loot_pod_level_4" || var_cc1fb2d0 === #"loot_pod_level_5" || var_cc1fb2d0 === #"loot_pod_level_6") {
        foreach (item in a_items) {
            if (item.itementry.name === #"scrap_rare_item_sr" || item.itementry.name === #"scrap_item_sr") {
                item.var_569199b9 = 1;
            }
        }
        return;
    }
    if (is_true(var_e2856109)) {
        foreach (item in a_items) {
            if (isdefined(item)) {
                item.var_387e74f4 = 1;
            }
        }
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0x35ab5893, Offset: 0x5460
// Size: 0x4fe
function function_3e953077(instance) {
    var_168390c = 0;
    var_e472e403 = 15;
    var_5b7bb632 = 0;
    var_cb77f56c = instance.contentgroups[#"hash_5b9881428a7afa40"];
    if (isdefined(var_cb77f56c)) {
        /#
            level.var_50e94447 = var_cb77f56c;
        #/
        var_cb77f56c = array::randomize(var_cb77f56c);
        foreach (s_group in var_cb77f56c) {
            var_3471a9bf = 0;
            var_842cdacd = array::randomize(s_group.contentgroups[#"hash_49340510783e32e4"]);
            foreach (spawn in var_842cdacd) {
                if (var_168390c) {
                    continue;
                }
                if (randomint(100) > var_e472e403 || getdvarint(#"hash_731bacd49b186d10", 0)) {
                    if (math::cointoss(50)) {
                        model = #"p9_gold_surcrystal_medium_01";
                        str_scene = "p9_zm_gold_sur_crystal_medium_01_bundle";
                    } else {
                        model = #"p9_gold_surcrystal_medium_02";
                        str_scene = "p9_zm_gold_sur_crystal_medium_02_bundle";
                    }
                    var_37180a9f = util::spawn_model(model, spawn.origin, spawn.angles, undefined, 1);
                    if (isdefined(var_37180a9f) && var_37180a9f clientfield::is_registered("perk_death_perception_item_marked_for_rob")) {
                        var_37180a9f clientfield::set("perk_death_perception_item_marked_for_rob", 1);
                    }
                    if (isdefined(var_37180a9f)) {
                        var_5b7bb632++;
                        var_3471a9bf++;
                        if (!isdefined(instance.a_models)) {
                            instance.a_models = [];
                        } else if (!isarray(instance.a_models)) {
                            instance.a_models = array(instance.a_models);
                        }
                        instance.a_models[instance.a_models.size] = var_37180a9f;
                        var_37180a9f setscale(randomfloatrange(0.85, 1.2));
                        var_37180a9f function_619a5c20();
                        var_37180a9f val::set("loot_pod", "takedamage", 1);
                        var_37180a9f.health = 5;
                        if (isdefined(str_scene)) {
                            var_37180a9f thread scene::play(str_scene, var_37180a9f);
                        }
                        var_37180a9f fx::play(#"hash_6583defa5c93e609", var_37180a9f.origin, var_37180a9f.angles, #"hash_285fd9bc53c292d8", 1);
                        /#
                            var_37180a9f.targetname = "<unknown string>";
                        #/
                        level thread function_8265e656(var_37180a9f);
                        if ((var_5b7bb632 >= 33 || var_3471a9bf >= 7) && !getdvarint(#"hash_731bacd49b186d10", 0)) {
                            var_168390c = 1;
                            continue;
                        }
                        util::wait_network_frame();
                    }
                }
            }
            if (var_5b7bb632 < 33) {
                var_168390c = 0;
            }
        }
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 2, eflags: 0x2 linked
// Checksum 0xe1086dd8, Offset: 0x5968
// Size: 0x3e
function vecscale(vec, scalar) {
    return (vec[0] * scalar, vec[1] * scalar, vec[2] * scalar);
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0xbedacfd6, Offset: 0x59b0
// Size: 0x29c
function function_8265e656(var_37180a9f) {
    level endon(#"hash_4a140b223cb0019d");
    if (isdefined(var_37180a9f)) {
        var_37180a9f callback::function_d8abfc3d(#"hash_5f0caa4b2d44fedf", &function_cb742921);
    }
    while (isdefined(var_37180a9f) && var_37180a9f.health > 0) {
        s_result = var_37180a9f waittill(#"damage", #"death", #"hash_52a1c0be67192d9b");
        if (s_result._notify === #"hash_52a1c0be67192d9b") {
            return;
        }
        if (isplayer(s_result.attacker) && isalive(s_result.attacker)) {
            s_result.attacker util::show_hit_marker();
        } else if (is_true(var_37180a9f.var_9880bf81)) {
            var_37180a9f.health = 1;
            continue;
        }
        var_481d523f = 0;
        if (isdefined(s_result.weapon)) {
            if (is_true(s_result.weapon.isprimary) || killstreaks::is_killstreak_weapon(s_result.weapon) || s_result.weapon.name === #"hatchet") {
                var_481d523f = 1;
            }
        }
        if (!var_481d523f && s_result.mod === "MOD_IMPACT") {
            var_37180a9f.health = 1;
        }
    }
    if (isdefined(var_37180a9f)) {
        if (isplayer(s_result.attacker)) {
            s_result.attacker contracts::increment_zm_contract(#"hash_93e4021f232475e");
        }
        var_37180a9f callback::callback(#"hash_5f0caa4b2d44fedf", s_result);
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x6 linked
// Checksum 0xbc0568a2, Offset: 0x5c58
// Size: 0x192
function private function_cb742921(s_result) {
    if (isplayer(s_result.attacker) || isai(s_result.attacker) || isvehicle(s_result.attacker)) {
        if (isdefined(self) && self clientfield::is_registered("perk_death_perception_item_marked_for_rob")) {
            self clientfield::set("perk_death_perception_item_marked_for_rob", 0);
        }
        ping::function_9455917d(self);
        self function_8ef626e3();
        playsoundatposition(#"hash_54c5c342b84cf845", self.origin);
        if (isplayer(s_result.attacker) && s_result.attacker isinvehicle()) {
            var_80730518 = s_result.attacker getvehicleoccupied();
            if (isdefined(var_80730518)) {
                var_80730518 thread function_df0dbb31();
            }
        }
        self.b_destroyed = 1;
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 0, eflags: 0x2 linked
// Checksum 0x9160365e, Offset: 0x5df8
// Size: 0x84
function function_df0dbb31() {
    self endon(#"death");
    waitframe(1);
    self playrumbleonentity("sr_prototype_vehicle_run_over");
    self playsound(#"hash_7c72cea06ae4906c");
    playsoundatposition(#"hash_54c5c342b84cf845", self.origin);
}

// Namespace namespace_58949729/event_9e981c4
// Params 1, eflags: 0x24
// Checksum 0xc9430863, Offset: 0x5e88
// Size: 0x94
function private event_handler[event_9e981c4] function_ff8b3908(eventstruct) {
    dynent = eventstruct.ent;
    if (dynent.script_noteworthy === #"hash_5839d424446cf8ea") {
        if (level clientfield::is_registered("dark_aether_crystal_check_dynentstate")) {
            level clientfield::increment("dark_aether_crystal_check_dynentstate");
        }
        dynent function_8ef626e3();
    }
}

// Namespace namespace_58949729/namespace_58949729
// Params 1, eflags: 0x2 linked
// Checksum 0x1c289a9e, Offset: 0x5f28
// Size: 0x2cc
function function_8ef626e3(var_cc1fb2d0) {
    var_7580ce3e = spawnstruct();
    var_7580ce3e.origin = self.origin;
    var_7580ce3e.angles = self.angles;
    var_7580ce3e.var_738dfc81 = 1;
    var_7580ce3e.scriptmodel = self;
    var_dddebb5c = anglestoup(var_7580ce3e.angles);
    var_dddebb5c = vectornormalize(var_dddebb5c);
    var_dddebb5c = vecscale(var_dddebb5c, 32);
    var_7580ce3e.origin += var_dddebb5c;
    if (isentity(self) && !isdefined(self.var_493b77d4)) {
        self notify(#"hash_285fd9bc53c292d8");
        self function_23a29590();
        if (!isdefined(self.var_ef3ac4e)) {
            self.var_ef3ac4e = #"hash_65063e9505bafd58";
        }
        self fx::play(self.var_ef3ac4e, self.origin, self.angles);
        if (self.model === "p9_gold_surcrystal_medium_01") {
            self setmodel(#"hash_3c3c40375febff35");
        } else if (self.model === "p9_gold_surcrystal_medium_02") {
            self setmodel(#"hash_50aa2075dbc5e6e0");
        }
    }
    if (isdefined(self.instance.var_eb3bf4b1) && self.instance.var_eb3bf4b1.size <= 1) {
        var_cc1fb2d0 = #"survival_aether_tool_item_list";
    }
    if (!isdefined(var_cc1fb2d0)) {
        if (is_true(self.var_defc3cee)) {
            var_cc1fb2d0 = function_fd5e77fa(#"hash_24af9f98f7899474");
        } else {
            var_cc1fb2d0 = function_fd5e77fa(#"pod");
        }
    }
    level thread function_f82f361c(var_7580ce3e, var_cc1fb2d0, 2, 1);
    var_7580ce3e struct::delete();
}

// Namespace namespace_58949729/namespace_58949729
// Params 2, eflags: 0x2 linked
// Checksum 0x1774461a, Offset: 0x6200
// Size: 0x24
function function_dabc4d71(item_name, func) {
    level.var_a332ae5f[item_name] = func;
}

// Namespace namespace_58949729/namespace_58949729
// Params 0, eflags: 0x2 linked
// Checksum 0x51cdccaa, Offset: 0x6230
// Size: 0x12a
function function_cff40da3() {
    var_add423b7 = 0;
    foreach (player in getplayers()) {
        if ((isdefined(player.maxarmor) ? player.maxarmor : 0) != 0) {
            level.var_20b35e7a = 1;
            var_add423b7 = 1;
            return #"armor_shard_item_sr";
        }
    }
    if (!var_add423b7 && !is_true(level.var_20b35e7a)) {
        level.var_20b35e7a = 1;
        return #"armor_item_lv1_t9_sr";
    }
    return #"armor_shard_item_sr";
}

// Namespace namespace_58949729/namespace_58949729
// Params 0, eflags: 0x2 linked
// Checksum 0xee14567d, Offset: 0x6368
// Size: 0x16a
function function_e15f0669() {
    if (!isdefined(level.var_102e4ee5)) {
        level.var_102e4ee5 = 1;
    }
    if (!isdefined(level.var_a68449d2)) {
        level.var_a68449d2 = 0;
    }
    players = getplayers();
    level.var_102e4ee5 = players.size;
    var_eceee3fa = 0;
    foreach (player in players) {
        var_74895d6d = isdefined(player.var_72249004) ? player.var_72249004 : 0;
        if (var_74895d6d > 0) {
            var_eceee3fa++;
        }
    }
    if (var_eceee3fa == players.size || level.var_a68449d2 > level.var_102e4ee5) {
        return #"scrap_rare_item_sr";
    }
    level.var_a68449d2++;
    return #"self_revive_sr_item";
}

/#

    // Namespace namespace_58949729/namespace_58949729
    // Params 0, eflags: 0x0
    // Checksum 0x92e23cdc, Offset: 0x64e0
    // Size: 0x134
    function init_devgui() {
        util::waittill_can_add_debug_command();
        util::add_devgui("<unknown string>", "<unknown string>");
        util::add_devgui("<unknown string>", "<unknown string>");
        util::add_devgui("<unknown string>", "<unknown string>");
        util::add_devgui("<unknown string>", "<unknown string>");
        util::add_devgui("<unknown string>", "<unknown string>");
        util::add_devgui("<unknown string>", "<unknown string>");
        util::add_devgui("<unknown string>", "<unknown string>");
        util::add_devgui("<unknown string>", "<unknown string>");
        level thread function_b6b13cf8();
    }

    // Namespace namespace_58949729/namespace_58949729
    // Params 0, eflags: 0x0
    // Checksum 0x6882b19, Offset: 0x6620
    // Size: 0x3be
    function function_b6b13cf8() {
        var_50721d66 = 0;
        while (true) {
            var_8f420c16 = getdvarint(#"hash_731bacd49b186d10", 0);
            if (var_8f420c16 && isdefined(level.var_50e94447)) {
                iprintlnbold("<unknown string>");
                function_3e953077(level.var_50e94447[0].parent);
                iprintlnbold("<unknown string>");
                setdvar(#"hash_731bacd49b186d10", 0);
            }
            var_794c9d5f = getdvarint(#"hash_748d6103fdf3d390", 0);
            if (var_794c9d5f) {
                var_55b8433b = getentarray("<unknown string>", "<unknown string>");
                foreach (pod in var_55b8433b) {
                    n_radius = 64;
                    n_dist = distance(pod.origin, getplayers()[0].origin);
                    n_radius *= n_dist / 3000;
                    sphere(pod.origin, n_radius, (1, 0, 1), 0.7, 0, 7, 3);
                }
            }
            var_90f51d74 = getdvarint(#"hash_31e154b4986045db", 1);
            if (var_90f51d74 && isdefined(level.var_50e94447)) {
                setdvar(#"hash_31e154b4986045db", 0);
                if (var_50721d66 >= level.var_50e94447.size - 1) {
                    var_50721d66 = 0;
                }
                s_group = level.var_50e94447[var_50721d66];
                if (isdefined(s_group)) {
                    foreach (player in function_a1ef346b()) {
                        player setorigin(s_group.origin);
                        player setplayerangles(s_group.angles);
                    }
                }
                var_50721d66++;
            }
            waitframe(3);
        }
    }

    // Namespace namespace_58949729/namespace_58949729
    // Params 2, eflags: 0x0
    // Checksum 0x308fb41e, Offset: 0x69e8
    // Size: 0x190
    function function_8f59f892(instance, str_dvar) {
        if (!isdefined(str_dvar) || str_dvar === 0 || str_dvar === "<unknown string>") {
            return;
        }
        level notify(str_dvar);
        level endon(str_dvar);
        var_ad8b756a = 0;
        while (true) {
            var_794c9d5f = getdvarint(str_dvar, 0);
            if (var_794c9d5f) {
                setdvar(str_dvar, 0);
                s_chest = instance.var_8634611a[var_ad8b756a];
                foreach (player in function_a1ef346b()) {
                    player setorigin(s_chest.origin);
                }
                if (var_ad8b756a >= instance.var_8634611a.size - 1) {
                    var_ad8b756a = 0;
                } else {
                    var_ad8b756a++;
                }
            }
            waitframe(5);
        }
    }

    // Namespace namespace_58949729/namespace_58949729
    // Params 1, eflags: 0x0
    // Checksum 0x85ad5524, Offset: 0x6b80
    // Size: 0x1ee
    function function_e4314d0e(struct) {
        while (true) {
            var_794c9d5f = getdvarint(#"hash_29331ff5a16b8d53", 0);
            if (isdefined(struct.scriptmodel)) {
                struct.b_spawned = 1;
            } else if (var_794c9d5f == 2 && !is_true(struct.b_spawned)) {
                function_6f0024c1(struct);
            }
            if (var_794c9d5f && isdefined(struct)) {
                n_radius = 64;
                n_dist = distance(struct.origin, getplayers()[0].origin);
                n_radius *= n_dist / 3000;
                if (isdefined(struct.scriptmodel)) {
                    if (struct.parent.content_script_name === "<unknown string>") {
                        str_color = (0, 1, 1);
                    } else if (struct.parent.content_script_name === "<unknown string>") {
                        str_color = (0, 1, 0);
                    } else {
                        str_color = (1, 1, 0);
                    }
                } else {
                    str_color = (0.75, 0.75, 0.75);
                }
                sphere(struct.origin, n_radius, str_color, 1, 0, 10, 3);
            }
            waitframe(3);
        }
    }

    // Namespace namespace_58949729/namespace_58949729
    // Params 1, eflags: 0x0
    // Checksum 0x2b20e715, Offset: 0x6d78
    // Size: 0x2b0
    function function_6f0024c1(struct) {
        if (struct.parent.content_script_name === "<unknown string>") {
            var_cc1fb2d0 = #"sr_explore_chest_large";
            var_3a053962 = "<unknown string>";
            str_scene = #"p9_fxanim_zm_gp_chest_01_lrg_bundle";
            var_dae71351 = 3;
        } else if (struct.parent.content_script_name === "<unknown string>") {
            var_cc1fb2d0 = #"sr_explore_chest_medium";
            var_3a053962 = "<unknown string>";
            str_scene = #"p9_fxanim_zm_gp_chest_01_med_bundle";
            var_dae71351 = 2;
        } else {
            var_cc1fb2d0 = #"sr_explore_chest_small";
            var_3a053962 = "<unknown string>";
            str_scene = #"p9_fxanim_zm_gp_chest_01_sml_bundle";
            var_dae71351 = 1;
        }
        function_4ec9fc99(struct, var_cc1fb2d0, var_3a053962, str_scene, var_dae71351);
        if (!isdefined(struct.parent.var_8634611a)) {
            struct.parent.var_8634611a = [];
        } else if (!isarray(struct.parent.var_8634611a)) {
            struct.parent.var_8634611a = array(struct.parent.var_8634611a);
        }
        if (!isinarray(struct.parent.var_8634611a, struct)) {
            struct.parent.var_8634611a[struct.parent.var_8634611a.size] = struct;
        }
        if (!isdefined(level.var_8634611a)) {
            level.var_8634611a = [];
        } else if (!isarray(level.var_8634611a)) {
            level.var_8634611a = array(level.var_8634611a);
        }
        if (!isinarray(level.var_8634611a, struct)) {
            level.var_8634611a[level.var_8634611a.size] = struct;
        }
    }

#/
