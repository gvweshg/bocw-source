// Atian COD Tools GSC CW decompiler test
#using script_76a8f964e4309959;
#using scripts\zm\ai\zm_ai_soa.gsc;
#using scripts\zm\ai\zm_ai_mimic.gsc;
#using scripts\zm\ai\zm_ai_avogadro.gsc;
#using scripts\zm\zm_ai_raz.gsc;
#using scripts\zm\zm_tungsten_vo.gsc;
#using script_1bb327fbdb3a211b;
#using script_2ddf7d76494fb52;
#using script_4acbbbcdc7ef16a0;
#using script_1a26712868b71ff6;
#using scripts\zm\zm_tungsten.gsc;
#using script_ab862743b3070a;
#using script_6fc2be37feeb317b;
#using script_25be5471a9c31833;
#using script_4ccfb58a9443a60b;
#using script_7a5293d92c61c788;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using script_58860a35d0555f74;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_vote.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_items.gsc;
#using scripts\zm_common\zm_inventory.gsc;
#using scripts\zm_common\zm_intel.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_crafting.gsc;
#using script_5a525a75a8f1f7e4;
#using scripts\zm_common\callbacks.gsc;
#using scripts\killstreaks\zm\chopper_gunner.gsc;
#using scripts\killstreaks\zm\recon_car.gsc;
#using scripts\killstreaks\remote_weapons.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreak_vehicle.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using script_33d1cd7cfb7477c4;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\item_drop.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\content_manager.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_tungsten_main_quest;

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x2ba7f1c, Offset: 0x1738
// Size: 0xa74
function init() {
    level thread function_d7f67c90();
    clientfield::register("actor", "" + #"abom_swallow", 1, 1, "counter");
    clientfield::register("actor", "" + #"hash_11839f68b17da97a", 1, 1, "counter");
    clientfield::register("actor", "" + #"hash_3b24d38fe21de8fd", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_6f2c45f149dc1e5d", 1, 1, "counter");
    clientfield::register("missile", "" + #"crystal_grenade", 1, 1, "int");
    clientfield::register("toplayer", "fogofwareffects", 1, 1, "int");
    clientfield::register("toplayer", "" + #"hash_1509a2aa5d40a44c", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_55456562f670860", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"player_barrier", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_5b48c7bf93fc3a4b", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_54a76d632c7c51", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_4b03e692ae3dfa64", 1, 1, "counter");
    clientfield::register("scriptmover", "" + #"hash_6ba3e6fd544c34a5", 1, 2, "int");
    clientfield::register("scriptmover", "" + #"hash_2ad0f9c6cbc5eed", 1, 1, "counter");
    clientfield::register("scriptmover", "" + #"hash_77d7a6f3a8842303", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_36fbe21deb0433d8", 1, 1, "counter");
    clientfield::register("scriptmover", "" + #"hash_4d2911e91cdb1e91", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_1b9d966608efb40e", 1, 1, "counter");
    clientfield::register("scriptmover", "" + #"crystal_shard", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_5e0a6fc6597e6e03", 1, 1, "counter");
    clientfield::register("scriptmover", "" + #"hash_41e8bfe605fbbfe6", 1, 1, "counter");
    clientfield::register("vehicle", "" + #"gp_spawn", 1, 1, "counter");
    clientfield::register("vehicle", "" + #"hash_485fe8f642043f78", 1, 1, "counter");
    clientfield::register("world", "" + #"hash_2509c24cd62ed5bc", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_419ce223196785ef", 1, 1, "counter");
    clientfield::register("world", "" + #"hash_5940bc2717a75c96", 1, 1, "int");
    clientfield::register("world", "" + #"hash_7b50097ac4242bc9", 1, getminbitcountfornum(3), "int");
    level.var_9b6e1cc9 = zm_tungsten_title_cards::register();
    if (!zm_utility::is_ee_enabled()) {
        return;
    }
    function_e983f15a();
    level.var_3034d7b8 = &function_d5d67561;
    zm_utility::function_da0eb3e4(#"item_zmquest_tungsten_mq_quest_part_catalyzed", &function_90996ced);
    zm_tungsten::function_994637d8(#"hash_4dd90ae5d15fe15c");
    zm_tungsten::function_994637d8(#"hash_6868b1aab2d20ef4");
    scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_a45c2bfd, "play");
    scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_b15240c9, "done");
    scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_644d04d5, "Shot 3");
    scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_4b60049c, "Shot 10");
    scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_49f3ccf, "Shot 13");
    scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_1f2a6275, "Shot 14");
    scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_938275a4, "Shot 15");
    scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_b91176b1, "Shot 19");
    scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_7a47935c, "Shot 23");
    scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_c8622ee6, "Shot 31");
    scene::add_scene_func(#"hash_ef3c5bb86ea83fd", &function_9946b234, "skip_started");
    callback::on_spawned(&on_player_spawn);
    callback::add_callback(#"on_host_migration_end", &on_host_migration_end);
    /#
        level thread function_cd7a3de4();
    #/
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x6b7254ee, Offset: 0x21b8
// Size: 0x364
function function_e983f15a() {
    level zm_sq::register(#"hash_6deef93cdc13faf2", #"hash_2cec5bd1113224f4", #"hash_342e10211feb6e85", &function_5a2421aa, &function_8a15118a);
    level zm_sq::register(#"hash_6deef93cdc13faf2", #"hash_31e51b6600a81c68", #"hash_342e0d211feb696c", &function_8b524e54, &function_601878a7);
    level zm_sq::register(#"hash_6deef93cdc13faf2", #"hash_434b5ee7bea53369", #"hash_342e0e211feb6b1f", &function_b4e3ff4a, &function_28be9289);
    level zm_sq::register(#"hash_6deef93cdc13faf2", #"hash_31740aafc81f583a", #"hash_342e0b211feb6606", &function_dd0ca999, &function_73076ac9);
    level zm_sq::register(#"hash_6deef93cdc13faf2", #"escort", #"hash_342e0c211feb67b9", &escort_setup, &function_e0567b44);
    level zm_sq::register(#"hash_6deef93cdc13faf2", #"hash_38514b90d319494f", #"hash_342e09211feb62a0", &namespace_95c839d1::function_79868b3b, &namespace_95c839d1::function_ec198408);
    level zm_sq::register(#"hash_6deef93cdc13faf2", #"outro", #"hash_342e0a211feb6453", &function_197d500b, &outro_cleanup);
    level zm_sq::register(#"hash_6deef93cdc13faf2", #"epilogue", #"hash_342e17211feb7a6a", &function_756178a, &function_3cccb124, 1);
    callback::on_item_pickup(&on_item_pickup);
    callback::on_disconnect(&on_player_disconnect);
    level thread function_e9c07a3d();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x4bc061a1, Offset: 0x2528
// Size: 0x38
function function_d5d67561() {
    level notify(#"end_game", {#reason:#"main_quest_completed"});
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xbd1454a7, Offset: 0x2568
// Size: 0x24
function on_player_spawn() {
    self callback::on_grenade_fired(&on_grenade_fired);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x6bf8a5db, Offset: 0x2598
// Size: 0xbc
function function_e9c07a3d() {
    level zm_sq::start(#"hash_6deef93cdc13faf2");
    level flag::wait_till(#"hash_264e763f3fa44810");
    level thread function_be48e187();
    level thread function_34f41b72();
    level thread function_72dc9adc();
    level thread function_a048c235();
    showmiscmodels("ts_dark_aether_grass");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x3951f421, Offset: 0x2660
// Size: 0x56c
function function_d7f67c90() {
    level.var_2961befd = 0;
    level.var_e9eb81d7 = 0;
    level.var_8c011b28 = 0;
    level.var_6d18ddab = 0;
    level.var_daabc5cb = 0;
    level.var_864319a5 = 0;
    level.var_c59392fa = 0;
    level.var_1f7f9ebe = 0;
    level.var_d0c221e2 = array(#"hash_12ac9ac03d59aa62", #"hash_12ac9bc03d59ac15", #"hash_12ac98c03d59a6fc", #"hash_12ac99c03d59a8af", #"hash_12ac96c03d59a396");
    level.var_793ade71 = array(0, 1, 2);
    hidemiscmodels("rcxd_shelf_after");
    hidemiscmodels("rcxd_cabinet_on");
    namespace_1fd59e39::function_1376ec37(undefined, undefined, "vol_aether_shroud_exclusion");
    var_936c52b5 = getent("clip_player_barrier", "targetname");
    var_936c52b5 setinvisibletoall();
    var_c89beff = getent("clip_tunnel_end", "targetname");
    var_c89beff setinvisibletoall();
    var_cc61b071 = struct::get("door_town_square");
    level.var_c79d163e = util::spawn_model(#"hash_33df2ba078538a8c", var_cc61b071.origin, var_cc61b071.angles);
    var_57b44c1c = struct::get(#"hash_1c10f2ed01e2d5a");
    level.var_5850fb1d = util::spawn_model(var_57b44c1c.model, var_57b44c1c.origin, var_57b44c1c.angles);
    var_7dd14c74 = getent("clip_device_table", "targetname");
    var_7dd14c74 disconnectpaths();
    level.abom_spawner = getent("zombie_abom_spawner", "script_noteworthy");
    var_45bf69aa = struct::get("vent_arc_xd");
    level.var_2133d509 = util::spawn_model(var_45bf69aa.model, var_45bf69aa.origin, var_45bf69aa.angles);
    level.var_1e477e6c = getweapon("eq_crystal_grenade");
    var_aaa9a919 = getent("main_street_clip", "targetname");
    var_aaa9a919 disconnectpaths();
    var_77da32e1 = getent("main_street_debris_clip", "targetname");
    var_77da32e1 disconnectpaths();
    level thread function_9547f28c();
    level thread function_71926382();
    level thread function_799fb043();
    level thread function_cf0bd6b9();
    level thread function_c8cd422c();
    level thread function_4907b660();
    level flag::wait_till("all_players_spawned");
    foreach (t_crafting in level.var_4fe2f84d) {
        if (t_crafting[0].craftfoundry.name === "ztable_tungsten_neutralizer_device") {
            t_crafting[0].usetime = 5000;
        }
    }
    level.var_c79d163e disconnectpaths();
    exploder::exploder("fxexp_sky_portal");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x0
// Checksum 0xcfc995bc, Offset: 0x2bd8
// Size: 0x120
function function_209aa0e3() {
    self endon(#"death");
    while (true) {
        var_d250eb9f = 0;
        foreach (player in function_a1ef346b(undefined, self.origin, 80)) {
            if (player util::is_player_looking_at(self.origin, 0.8)) {
                var_d250eb9f = 1;
            }
        }
        if (is_true(var_d250eb9f)) {
            self.locked = 0;
        } else {
            self.locked = 1;
        }
        wait(0.1);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x6 linked
// Checksum 0x16e7f21e, Offset: 0x2d00
// Size: 0x64
function private on_host_migration_end(*params) {
    if (!level flag::get(#"hash_264e763f3fa44810")) {
        level clientfield::set("" + #"hash_5940bc2717a75c96", 1);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x73bb9eed, Offset: 0x2d70
// Size: 0x39c
function function_799fb043() {
    level endon(#"end_game");
    level.var_60a2b62c = function_f3e164a9(#"hash_5839d424446cf8ea");
    level.var_3f41835d = [];
    level.var_55f82e4e = [];
    level clientfield::set("" + #"hash_5940bc2717a75c96", 1);
    foreach (var_aa3984f0 in level.var_60a2b62c) {
        function_e2a06860(var_aa3984f0, 2);
        if (var_aa3984f0.targetname === #"hash_44bc86e237774e32") {
            if (!isdefined(level.var_3f41835d)) {
                level.var_3f41835d = [];
            } else if (!isarray(level.var_3f41835d)) {
                level.var_3f41835d = array(level.var_3f41835d);
            }
            level.var_3f41835d[level.var_3f41835d.size] = var_aa3984f0;
            continue;
        }
        if (!isdefined(level.var_55f82e4e)) {
            level.var_55f82e4e = [];
        } else if (!isarray(level.var_55f82e4e)) {
            level.var_55f82e4e = array(level.var_55f82e4e);
        }
        level.var_55f82e4e[level.var_55f82e4e.size] = var_aa3984f0;
    }
    level flag::wait_till(#"hash_264e763f3fa44810");
    level clientfield::set("" + #"hash_5940bc2717a75c96", 0);
    foreach (var_98871874 in level.var_3f41835d) {
        function_e2a06860(var_98871874, 0);
        var_98871874.ondamaged = &namespace_8a08914c::function_b49b76d4;
    }
    callback::on_round_end(&function_85a47e02);
    level flag::wait_till("main_street_tunnel_open");
    callback::remove_callback(#"on_round_end", &function_85a47e02);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xb5296dbb, Offset: 0x3118
// Size: 0x20c
function function_85a47e02() {
    level endon(#"end_game");
    var_fa8f4fcc = [];
    foreach (var_aa3984f0 in level.var_60a2b62c) {
        if (function_ffdbe8c2(var_aa3984f0) !== 0) {
            if (!isdefined(var_fa8f4fcc)) {
                var_fa8f4fcc = [];
            } else if (!isarray(var_fa8f4fcc)) {
                var_fa8f4fcc = array(var_fa8f4fcc);
            }
            var_fa8f4fcc[var_fa8f4fcc.size] = var_aa3984f0;
        }
    }
    if (level.var_60a2b62c.size - var_fa8f4fcc.size < 10) {
        var_72e812fd = min(4, 10 - level.var_60a2b62c.size - var_fa8f4fcc.size);
    } else {
        return;
    }
    var_4945de3b = 0;
    while (var_4945de3b < var_72e812fd) {
        var_1950bf84 = array::random(var_fa8f4fcc);
        if (var_1950bf84 function_85e19b28()) {
            function_e2a06860(var_1950bf84, 0);
            var_1950bf84.ondamaged = &namespace_8a08914c::function_b49b76d4;
            var_1950bf84.health = 5;
            arrayremovevalue(var_fa8f4fcc, var_1950bf84);
            var_4945de3b += 1;
        }
        wait(1);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xbf1da2ed, Offset: 0x3330
// Size: 0xa2
function function_85e19b28() {
    foreach (player in getplayers()) {
        if (player util::is_player_looking_at(self.origin)) {
            return false;
        }
    }
    return true;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xf934bfdc, Offset: 0x33e0
// Size: 0x69a
function on_item_pickup(params) {
    if (isdefined(params.item) && isdefined(params.item.itementry)) {
        name = params.item.itementry.name;
    }
    if (is_true(self.var_c8f9547a) && is_true(params.item.var_627c698b.istacticalgrenade)) {
        self.var_c8f9547a = undefined;
    }
    if (!isdefined(name) || !isplayer(self)) {
        return;
    }
    switch (name) {
    case #"item_zmquest_tungsten_mq_quest_part_fuel":
        level flag::set(#"hash_77e125d6f8b2733e");
        level zm_ui_inventory::function_7df6bb60(#"hash_4273532945cef4b0", 1);
        self thread zm_tungsten_vo::function_d137d6a0(#"hash_612bd80e051ec8b2", #"hash_3795ddc1396dd6c", #"hash_270a520d4067d784");
        array::thread_all(function_a1ef346b(), &zm_intel::collect_intel, #"zmintel_tungsten_requiem_artifact_4");
        break;
    case #"item_zmquest_tungsten_mq_quest_part_housing":
        level flag::set(#"hash_52d565520308890c");
        level zm_ui_inventory::function_7df6bb60(#"hash_4273562945cef9c9", 1);
        self thread zm_tungsten_vo::function_d137d6a0(#"hash_405d8e05784a9b7d", #"hash_2a781c57e3f9e24d", #"hash_27914478638171d1");
        array::thread_all(function_a1ef346b(), &zm_intel::collect_intel, #"zmintel_tungsten_requiem_artifact_2");
        break;
    case #"item_zmquest_tungsten_mq_quest_part_monitor":
        level flag::set(#"hash_407e12c104cfde25");
        level zm_ui_inventory::function_7df6bb60(#"hash_4273552945cef816", 1);
        self thread zm_tungsten_vo::function_d137d6a0(#"hash_7a7170008c98841e", #"hash_69ad92374dc5d980", #"hash_426838694427e178");
        array::thread_all(function_a1ef346b(), &zm_intel::collect_intel, #"zmintel_tungsten_requiem_artifact_3");
        break;
    case #"item_zmquest_tungsten_mq_quest_part_catalyzed":
        level flag::set(#"hash_22a51e8b22086fc6" + params.item.n_id);
        if (!isdefined(level.var_566d0d14)) {
            level.var_566d0d14 = 1;
        }
        level.var_566d0d14++;
        level zm_ui_inventory::function_7df6bb60(#"hash_4273532945cef4b0", level.var_566d0d14);
        level thread function_b6f5ae25();
        level thread function_e408d81(params.item.n_id);
        foreach (player in getplayers()) {
            player zm_weapons::weapon_take(level.var_1e477e6c);
            player.var_c8f9547a = undefined;
        }
        break;
    case #"item_zmquest_tungsten_mq_quest_part_shard":
        self.n_id = params.item.n_id;
        self.var_c8f9547a = 1;
        self thread namespace_1cc7b406::give_equipment(#"hash_7c7d437280e992b", 1);
        self playsound(#"hash_3a2f974f67a11864");
        if (!level.var_daabc5cb) {
            level.var_daabc5cb = 1;
            level thread zm_tungsten_vo::function_d137d6a0(#"hash_6cf88156e2cece4a", #"hash_2179d2c05c59fcd4", #"hash_5ee09ee0c21e867c");
        }
        break;
    case #"item_zmquest_tungsten_mq_quest_part_refuel":
        self.var_a74ce90c = 1;
        self clientfield::set_to_player("" + #"hash_1509a2aa5d40a44c", 1);
        self thread function_e655e275();
        playsoundatposition(#"hash_16e8cfb644f6ca0e", self.origin);
        self function_bc82f900("damage_heavy");
        break;
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x34dd1c3e, Offset: 0x3a88
// Size: 0xbc
function function_5a2421aa(b_skipped) {
    if (b_skipped) {
        return;
    }
    s_interact = struct::get("start_mq_button");
    level flag::wait_till(#"hash_3814c5c6793e2b2d");
    level thread function_ab0ea13b();
    s_interact zm_unitrigger::create(&function_bb065751, 64, &function_79936423);
    level flag::wait_till(#"hash_57b9473a38039ff0");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x31421377, Offset: 0x3b50
// Size: 0xf4
function function_9547f28c() {
    s_button = struct::get("start_mq_button");
    s_button.var_c9b734f5 = util::spawn_model(#"hash_7c81868a02c10968", s_button.origin, s_button.angles);
    s_button.var_c36e3eb9 = util::spawn_model(#"hash_51b155104fbf49b4", s_button.origin, s_button.angles);
    s_button.var_c9b734f5 setscale(s_button.modelscale);
    s_button.var_c36e3eb9 setscale(s_button.modelscale);
    s_button.var_c9b734f5 hide();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x5cf85613, Offset: 0x3c50
// Size: 0x266
function function_ab0ea13b() {
    level endon(#"hash_57b9473a38039ff0");
    b_on = undefined;
    s_button = struct::get("start_mq_button");
    if (!isdefined(s_button.var_c36e3eb9) || !isdefined(s_button.var_c9b734f5)) {
        if (isdefined(s_button.var_c36e3eb9)) {
            s_button.var_c36e3eb9 delete();
        }
        if (isdefined(s_button.var_c9b734f5)) {
            s_button.var_c9b734f5 delete();
        }
        function_9547f28c();
    }
    while (true) {
        if (!is_true(zm_tungsten::function_835bb4a7()) && !level flag::get("rbz_exfil_started") && !is_true(b_on)) {
            b_on = 1;
            s_button.var_c9b734f5 show();
            s_button.var_c36e3eb9 util::delay(0.5, "death", &hide);
        } else if ((is_true(zm_tungsten::function_835bb4a7()) || level flag::get("rbz_exfil_started")) && is_true(b_on)) {
            b_on = 0;
            s_button.var_c36e3eb9 show();
            s_button.var_c9b734f5 util::delay(0.5, "death", &hide);
        }
        wait(1);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xd50cc5d7, Offset: 0x3ec0
// Size: 0x160
function function_bb065751(player) {
    if (isplayer(player)) {
        if (!level flag::get(#"hash_1a68e69eb576f35b") && !is_true(zm_tungsten::function_835bb4a7()) && !level flag::get("rbz_exfil_started") && !player isfiring() && !player isreloading() && player getstance() === "stand") {
            n_dot = player math::get_dot_forward(self.origin);
            if (n_dot > 0.5) {
                self sethintstringforplayer(player, "");
                return 1;
            }
        }
        self sethintstringforplayer(player, "");
        return 0;
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xc2e6612f, Offset: 0x4028
// Size: 0x210
function function_79936423() {
    level endon(#"end_game", #"death");
    s_interact = struct::get("start_mq_button");
    while (true) {
        waitresult = self waittill(#"trigger");
        activator = waitresult.activator;
        if (isplayer(activator)) {
            level flag::set(#"hash_1a68e69eb576f35b");
            level flag::set(#"hash_4dd90ae5d15fe15c");
            if (activator gestures::function_8cc27b6d(#"hash_606686a1b66827ac")) {
                activator zm_tungsten::function_2a73b31d();
                activator setorigin((6762, 4366, 567));
                activator setplayerangles((13, -97, 0));
                activator playgestureviewmodel(#"hash_606686a1b66827ac");
                wait(0.5);
                activator zm_tungsten::function_202a6698();
            }
            activator playrumbleonentity("damage_light");
            playsoundatposition(#"hash_707c10126e3ac999", s_interact.origin);
            level flag::set(#"hash_57b9473a38039ff0");
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x26a07f4e, Offset: 0x4240
// Size: 0x17c
function function_8a15118a(*b_skipped, var_19e802fa) {
    s_interact = struct::get("start_mq_button");
    if (var_19e802fa) {
        level flag::set(#"hash_57b9473a38039ff0");
    }
    s_interact thread zm_unitrigger::unregister_unitrigger(s_interact.s_unitrigger);
    if (isdefined(s_interact.var_c36e3eb9)) {
        s_interact.var_c36e3eb9 show();
    }
    s_interact.var_c9b734f5 thread util::delayed_delete(0.5);
    if (!var_19e802fa && !level flag::get(#"hash_264e763f3fa44810")) {
        function_2f0a2ce2();
    }
    level thread function_5841db33();
    level flag::set(#"hash_264e763f3fa44810");
    level flag::set(#"hash_331ca6d639f4883d");
    level flag::clear(#"hash_4dd90ae5d15fe15c");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xd6ad474d, Offset: 0x43c8
// Size: 0xdc
function function_5841db33() {
    level endon(#"end_game");
    wait(1);
    exploder::exploder("fxexp_dark_aether_interior_01");
    exploder::exploder("fxexp_dark_aether_interior_02");
    exploder::exploder("fxexp_dark_aether_interior_03");
    level clientfield::set("" + #"dark_aether_light_on", 1);
    level clientfield::set("" + #"hash_7fd166b952515da7", 1);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x138bd11a, Offset: 0x44b0
// Size: 0x87c
function function_2f0a2ce2() {
    level thread function_a56cbda8();
    wait(1);
    level clientfield::set("" + #"hash_2509c24cd62ed5bc", 1);
    playsoundatposition(#"hash_7b74007ca246bbef", (0, 0, 0));
    level zm_utility::function_9ad5aeb1(1, 1, 0, 0);
    level.no_powerups = 1;
    level flag::clear("spawn_zombies");
    level flag::clear("zombie_drop_powerups");
    level flag::clear(#"hash_21921ed511559aa3");
    level flag::set(#"pause_round_timeout");
    level flag::set("hold_round_end");
    level thread zm_tungsten::function_aa863ff1();
    foreach (player in getplayers()) {
        player function_9409ac93();
    }
    exploder::exploder("fxexp_cin_mid_portal");
    foreach (player in getplayers()) {
        player thread function_5414ee31();
    }
    level function_abb25db(1, (0, 0, 0));
    var_aeb8a47d = util::spawn_model(#"hash_b7cea188cbd2e02", (0, 0, -2048));
    var_aeb8a47d clientfield::set("" + #"hash_2fc89133ccd7b0df", 1);
    var_a8605c24 = var_aeb8a47d gettagorigin("j_head");
    var_9ee772b4 = var_aeb8a47d gettagangles("j_head");
    level.var_5092bb0e = util::spawn_model(#"tag_origin", var_a8605c24, var_9ee772b4);
    level.var_5092bb0e linkto(var_aeb8a47d, "j_head");
    var_aeb8a47d thread util::delete_on_death(level.var_5092bb0e);
    level.var_cc996567 = util::spawn_model(#"hash_49275da2ee5d6c3f", var_a8605c24, var_9ee772b4);
    level.var_cc996567 clientfield::set("" + #"hash_2fc89133ccd7b0df", 1);
    level.var_cc996567 linkto(level.var_5092bb0e);
    level.var_5092bb0e thread util::delete_on_death(level.var_cc996567);
    foreach (str_tag in ["j_tentacle_root_le", "j_tentacle_root_ri", "j_spineupper_tentacle_root", "j_spinelower_tentacle_root"]) {
        var_aeb8a47d hidepart(str_tag, "", 1);
    }
    n_start_time = gettime();
    level thread scene::init(#"hash_ef3c5bb86ea83fd");
    level scene::init_streamer(#"hash_ef3c5bb86ea83fd", getplayers());
    foreach (player in getplayers()) {
        player.var_f4e33249 = 1;
    }
    n_time_left = 1.5 - float(gettime() - n_start_time) / 1000;
    if (n_time_left > 0) {
        wait(n_time_left);
    }
    level flag::set(#"hash_2f702f46336d6832");
    a_ents[#"hash_5e15688e554ce28e"] = var_aeb8a47d;
    level scene::play(#"hash_ef3c5bb86ea83fd", a_ents);
    level flag::clear(#"hash_2f702f46336d6832");
    level clientfield::set("" + #"hash_2509c24cd62ed5bc", 0);
    foreach (player in getplayers()) {
        player.var_f4e33249 = undefined;
    }
    level.no_powerups = undefined;
    level flag::set("spawn_zombies");
    level flag::set("zombie_drop_powerups");
    level flag::set(#"hash_21921ed511559aa3");
    level flag::clear(#"pause_round_timeout");
    level flag::clear("hold_round_end");
    level flag::set(#"hash_264e763f3fa44810");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xa41a0a5c, Offset: 0x4d38
// Size: 0x254
function function_a56cbda8() {
    level endon(#"hash_331ca6d639f4883d", #"game_ended");
    level flag::set("in_dark_side");
    level flag::clear("rbz_exfil_allowed");
    if (level flag::get("rbz_exfil_beacon_active")) {
        if (isdefined(level.var_c5beea37) && isdefined(level.var_c5beea37.var_2d1ee75a)) {
            level.var_c5beea37.var_2d1ee75a zm_vote::function_3728d19b();
        }
        level flag::clear("rbz_exfil_beacon_active");
    }
    foreach (player in getplayers()) {
        if (isalive(player)) {
            player chopper_gunner::function_24fbd61e();
        }
    }
    level flag::set(#"hash_23d445a634bedeae");
    level notify(#"hash_1ca30bf3bc01d214");
    level flag::wait_till(#"hash_264e763f3fa44810");
    level flag::set("rbz_exfil_allowed");
    level flag::clear("in_dark_side");
    level flag::clear(#"hash_23d445a634bedeae");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xeaa20f8a, Offset: 0x4f98
// Size: 0xaa
function function_9409ac93() {
    level endon(#"end_game");
    if (!isalive(self)) {
        return;
    }
    self endon(#"death", #"disconnect");
    while (self isziplining() || self function_b4813488() || is_true(self.var_16735873)) {
        waitframe(1);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x238e7fd8, Offset: 0x5050
// Size: 0x184
function function_a45c2bfd(*a_ents) {
    level endon(#"hash_264e763f3fa44810");
    hidemiscmodels("hide_mid_igc_models");
    level clientfield::set("" + #"hash_763dd8035e80f7c", 1);
    level clientfield::set("" + #"hash_1fb207d10fbe27ce", 1);
    level thread namespace_c097de49::function_8f85d169();
    music::setmusicstate("mid_igc");
    level thread zm_tungsten::function_aa863ff1();
    level function_542224cc(1, (0, 0, 0), undefined, undefined, 0.2);
    level thread scene::play(#"hash_6252caedac411934", "Shot 1");
    level thread function_4980ef91();
    level function_abb25db(0.5, (0, 0, 0), "mid_scene_fade_out");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x289d1047, Offset: 0x51e0
// Size: 0x5c
function function_4980ef91() {
    level endon(#"hash_264e763f3fa44810");
    level waittill(#"hash_2b2d0000f48f2997");
    level thread scene::play(#"hash_6252caedac411934", "Shot 2");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x82f1aef4, Offset: 0x5248
// Size: 0xbc
function function_644d04d5(a_ents) {
    level endon(#"hash_264e763f3fa44810", #"game_ended");
    var_8edd2e3a = a_ents[#"zykov"];
    if (!isdefined(var_8edd2e3a)) {
        return;
    }
    var_8edd2e3a endon(#"death");
    var_8edd2e3a waittill(#"hash_72b5962447d193c3");
    var_8edd2e3a clientfield::increment("" + #"hash_419ce223196785ef");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x2846b15c, Offset: 0x5310
// Size: 0x24
function function_4b60049c(*a_ents) {
    level thread function_dfedba73();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x4df9e465, Offset: 0x5340
// Size: 0x84
function function_49f3ccf(a_ents) {
    if (isdefined(level.var_5092bb0e) && isdefined(level.var_cc996567)) {
        a_ents = [];
        a_ents[#"head"] = level.var_cc996567;
        level.var_5092bb0e thread scene::play(#"hash_569e51cff0700fb6", "Shot 13", a_ents);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xf5ad503f, Offset: 0x53d0
// Size: 0x84
function function_1f2a6275(a_ents) {
    if (isdefined(level.var_5092bb0e) && isdefined(level.var_cc996567)) {
        a_ents = [];
        a_ents[#"head"] = level.var_cc996567;
        level.var_5092bb0e thread scene::play(#"hash_569e51cff0700fb6", "Shot 14", a_ents);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x8130adf0, Offset: 0x5460
// Size: 0x84
function function_938275a4(a_ents) {
    if (isdefined(level.var_5092bb0e) && isdefined(level.var_cc996567)) {
        a_ents = [];
        a_ents[#"head"] = level.var_cc996567;
        level.var_5092bb0e thread scene::play(#"hash_569e51cff0700fb6", "Shot 15", a_ents);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xbf21e99f, Offset: 0x54f0
// Size: 0x84
function function_b91176b1(a_ents) {
    if (isdefined(level.var_5092bb0e) && isdefined(level.var_cc996567)) {
        a_ents = [];
        a_ents[#"head"] = level.var_cc996567;
        level.var_5092bb0e thread scene::play(#"hash_569e51cff0700fb6", "Shot 19", a_ents);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xeff8611e, Offset: 0x5580
// Size: 0x84
function function_7a47935c(a_ents) {
    if (isdefined(level.var_5092bb0e) && isdefined(level.var_cc996567)) {
        a_ents = [];
        a_ents[#"head"] = level.var_cc996567;
        level.var_5092bb0e thread scene::play(#"hash_569e51cff0700fb6", "Shot 23", a_ents);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x3b16c770, Offset: 0x5610
// Size: 0x194
function function_c8622ee6(a_ents) {
    var_2644aca3 = a_ents[#"maxis"];
    if (!isdefined(var_2644aca3)) {
        return;
    }
    var_2644aca3 endon(#"death");
    s_waitresult = level waittill(#"hash_77507bf59c02d349", #"hash_264e763f3fa44810");
    if (s_waitresult._notify === #"hash_77507bf59c02d349") {
        var_2644aca3 clientfield::increment("" + #"hash_419ce223196785ef");
        s_waitresult = level waittill(#"hash_1c8e98ba1adc7b0c", #"hash_264e763f3fa44810");
        if (s_waitresult._notify === #"hash_1c8e98ba1adc7b0c") {
            var_2644aca3 clientfield::set("" + #"hash_9ef13a567692f32", 1);
            level waittill(#"hash_264e763f3fa44810");
            var_2644aca3 clientfield::set("" + #"hash_9ef13a567692f32", 0);
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xda86ce67, Offset: 0x57b0
// Size: 0x104
function function_b15240c9(*a_ents) {
    level clientfield::set("" + #"hash_763dd8035e80f7c", 0);
    level clientfield::set("" + #"hash_1fb207d10fbe27ce", 0);
    level thread namespace_c097de49::function_8f85d169(0);
    showmiscmodels("hide_mid_igc_models");
    teleport_players(struct::get_array("mq_observation_end_mid_igc"));
    wait(1);
    level function_542224cc(1, (0, 0, 0), undefined, 1);
    level thread zm_tungsten::function_15a94953();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xc87ec36e, Offset: 0x58c0
// Size: 0x1b8
function function_9946b234(a_ents) {
    level flag::set(#"hash_49bef484db99f3ac");
    music::setmusicstate("");
    playsoundatposition(#"hash_69157f74228c372a", (0, 0, 0));
    level thread scene::play(#"hash_6252caedac411934", "Shot 3");
    level thread function_dfedba73();
    level thread function_256bee49();
    level clientfield::set("" + #"hash_2f4e23884d9865e1", 1);
    foreach (ent in a_ents) {
        if (isactor(ent) && ent.archetype === #"zombie") {
            if (isdefined(ent)) {
                ent delete();
            }
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x2ad37612, Offset: 0x5a80
// Size: 0x39c
function function_256bee49() {
    level endon(#"game_ended");
    wait(3);
    exploder::stop_exploder("fxexp_cin_exp_start");
    exploder::stop_exploder("fxexp_cin_mid_portal");
    exploder::stop_exploder("fxexp_cin_mid_portal_tear");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_ENV");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_ENV_spot");
    exploder::stop_exploder("fxexp_cin_mid_wave");
    exploder::stop_exploder("fxexp_cin_mid_wave_suck");
    exploder::stop_exploder("fxexp_cin_mid_exp_aftermath");
    exploder::stop_exploder("fxexp_cin_mid_exp_win");
    exploder::stop_exploder("fxexp_cin_mid_portal_win_blast_linger");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh010");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh020");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh030");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh040");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh050");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh060");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh080");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh090");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh100");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh110");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh120");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh130");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh140");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh150");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh160");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh170");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh180");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh190");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh200");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh230");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh250");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh270");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh280");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh310");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh320");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh330");
    exploder::stop_exploder("lgtexp_cin_zm_amerika_mid_sh340");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x1614a346, Offset: 0x5e28
// Size: 0xb8
function function_dfedba73() {
    var_b419812e = getentarray("observation_tower_window", "targetname");
    foreach (window in var_b419812e) {
        if (isdefined(window)) {
            window delete();
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xdfd9b67f, Offset: 0x5ee8
// Size: 0x94
function teleport_players(var_a347ab1) {
    a_players = getplayers();
    for (i = 0; i < a_players.size; i++) {
        a_players[i] setorigin(var_a347ab1[i].origin);
        a_players[i] setplayerangles(var_a347ab1[i].angles);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 3, eflags: 0x2 linked
// Checksum 0x35a40b4c, Offset: 0x5f88
// Size: 0x178
function function_abb25db(n_time, n_color = (0, 0, 0), str_waittill) {
    if (isdefined(str_waittill)) {
        level waittill(str_waittill);
    }
    foreach (player in getplayers()) {
        player thread lui::screen_fade_out(n_time, n_color);
        player val::set(#"hash_6378ea83b88b4f36", "takedamage", 0);
        player val::set(#"hash_6378ea83b88b4f36", "freezecontrols", 1);
        player val::set(#"hash_6378ea83b88b4f36", "show_crosshair", 0);
        player val::set(#"hash_6378ea83b88b4f36", "show_weapon_hud", 0);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 5, eflags: 0x2 linked
// Checksum 0xcfd74237, Offset: 0x6108
// Size: 0x1d8
function function_542224cc(n_time, n_color = (0, 0, 0), str_waittill, var_e9a0b654, var_1b7b87d8) {
    if (isdefined(str_waittill)) {
        level waittill(str_waittill);
    }
    foreach (player in getplayers()) {
        if (isdefined(var_1b7b87d8)) {
            player thread util::delay(var_1b7b87d8, "disconnect", &lui::screen_fade_in, n_time, n_color);
        } else {
            player thread lui::screen_fade_in(n_time, n_color);
        }
        if (is_true(var_e9a0b654)) {
            player val::reset(#"hash_6378ea83b88b4f36", "takedamage");
            player val::reset(#"hash_6378ea83b88b4f36", "freezecontrols");
            player val::reset(#"hash_6378ea83b88b4f36", "show_crosshair");
            player val::reset(#"hash_6378ea83b88b4f36", "show_weapon_hud");
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x91e8ebf8, Offset: 0x62e8
// Size: 0x84
function function_5414ee31() {
    self endon(#"disconnect");
    self clientfield::set("" + #"hash_3198b85c253e79d4", 1);
    level waittill(#"hash_a256b33f8bbf053");
    self clientfield::set("" + #"hash_3198b85c253e79d4", 0);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xad1e8a4d, Offset: 0x6378
// Size: 0x94
function function_4907b660() {
    level endon(#"end_game");
    level flag::wait_till("all_players_spawned");
    level thread scene::play(#"hash_33cdf7de77335178");
    level flag::wait_till(#"hash_57b9473a38039ff0");
    level thread scene::stop(#"hash_33cdf7de77335178");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x54b4db91, Offset: 0x6418
// Size: 0x124
function function_8b524e54(b_skipped) {
    callback::on_ai_spawned(&function_72989645);
    if (b_skipped) {
        return;
    }
    level flag::wait_till(#"start_zombie_round_logic");
    level thread vo_start();
    level thread function_a5015671();
    level thread function_8687b0f2();
    level thread function_96558bd7();
    level thread function_551048b9();
    level thread function_3eb5183();
    level flag::wait_till(#"hash_21844688fcfdffe4");
    /#
        iprintlnbold("j_tentacle_root_ri");
    #/
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x44a8d960, Offset: 0x6548
// Size: 0xbc
function function_601878a7(b_skipped, var_19e802fa) {
    if (b_skipped || var_19e802fa) {
        level zm_ui_inventory::function_7df6bb60(#"hash_4273532945cef4b0", 1);
        level zm_ui_inventory::function_7df6bb60(#"hash_4273562945cef9c9", 1);
        level zm_ui_inventory::function_7df6bb60(#"hash_4273552945cef816", 1);
    }
    level flag::set(#"hash_21844688fcfdffe4");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x86bb8817, Offset: 0x6610
// Size: 0xfc
function vo_start() {
    level endon(#"end_game");
    wait(1);
    foreach (player in function_a1ef346b()) {
        player thread zm_vo::function_c4303dda(#"hash_3155be8a4cf39bcc");
    }
    wait(4.5);
    zm_vo::function_7622cb70(#"hash_4ed5804954cf3aa3");
    level thread function_5bc0739d();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x57c18bd3, Offset: 0x6718
// Size: 0x408
function function_5bc0739d() {
    level endon(#"end_game");
    str_zone = zm_zonemgr::get_zone_from_position(getplayers()[0].origin, 1, 1);
    wait(zm_vo::function_f577c17d(#"hash_4ed5804954cf3aa3"));
    while (true) {
        n_players = 0;
        n_players = zm_zonemgr::get_players_in_zone(str_zone);
        if (n_players < function_a1ef346b().size) {
            break;
        }
        wait(1);
    }
    wait(2);
    zm_vo::function_7622cb70(#"hash_7749600442916b95");
    wait(0.5);
    zm_tungsten_vo::function_d137d6a0(#"hash_2d431dbfce4812f8", #"hash_61d4d43a45c0fd3e", #"hash_4979ef4dc775218e");
    level waittill(#"end_of_round");
    wait(1.5);
    if (!level.var_e9eb81d7) {
        zm_vo::function_7622cb70(#"hash_36681ff44e6a689f");
    }
    level waittill(#"end_of_round");
    wait(1.5);
    zm_tungsten_vo::function_d137d6a0(#"hash_1cca6aa02c5e495", #"hash_7adc4fe20aa33695", #"hash_25d1cc1f5d0097c9");
    level waittill(#"end_of_round");
    wait(1.5);
    foreach (player in function_a1ef346b()) {
        player thread zm_vo::function_c4303dda(#"hash_51f1e565da361355");
    }
    wait(zm_vo::function_f577c17d(#"hash_51f1e565da361355"));
    foreach (player in function_a1ef346b()) {
        player thread zm_vo::function_c4303dda(#"hash_51f1e465da3611a2");
    }
    wait(zm_vo::function_f577c17d(#"hash_51f1e465da3611a2"));
    foreach (player in function_a1ef346b()) {
        player thread zm_vo::function_c4303dda(#"hash_51f1e365da360fef");
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x194f9a62, Offset: 0x6b28
// Size: 0x6c
function function_c8cd422c() {
    while (!zm_zonemgr::any_player_in_zone("zone_bunker_entrance_02")) {
        wait(0.5);
    }
    zm_tungsten_vo::function_d137d6a0(#"hash_da30bfca721ac8a", #"hash_2defe32056b22414", #"hash_3825c78d0f1fadbc");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xa813f6f6, Offset: 0x6ba0
// Size: 0x4c
function function_cf0bd6b9() {
    level flag::wait_till(#"hash_3814c5c6793e2b2d");
    wait(0.5);
    zm_tungsten_vo::function_752b5c36(#"hash_44621d435320a2a0", undefined);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x9267b394, Offset: 0x6bf8
// Size: 0x1c
function function_be48e187() {
    level thread function_d1ac9156();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x552f06cc, Offset: 0x6c20
// Size: 0x144
function function_d1ac9156() {
    var_84405100 = getent("trigger_boardroom_abom", "targetname");
    var_507cd99f = struct::get("abom_boardroom");
    s_target = struct::get(var_507cd99f.target);
    while (true) {
        s_result = var_84405100 waittill(#"trigger");
        if (zm_utility::is_player_valid(s_result.activator)) {
            break;
        }
    }
    ai_abom = zombie_utility::spawn_zombie(level.abom_spawner, "abom", var_507cd99f, level.round_number);
    wait(0.1);
    if (isdefined(ai_abom)) {
        ai_abom.script_noteworthy = undefined;
        ai_abom.ignore_enemy_count = 1;
    }
    level thread function_f309f0fc();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xe58432d1, Offset: 0x6d70
// Size: 0x1bc
function function_f309f0fc() {
    var_8fac91c0 = getent("trigger_abom_smash", "targetname");
    var_ceed8935 = struct::get(#"hash_35ee4beaafb5eed");
    var_5f9f614d = util::spawn_model("tag_origin", var_ceed8935.origin, var_ceed8935.angles);
    while (true) {
        s_result = var_8fac91c0 waittill(#"trigger");
        if (s_result.activator.aitype === "spawner_bo5_abom" && s_result.activator.var_2bd7ca9d === 1) {
            level.var_4414302d show();
            var_5f9f614d clientfield::increment("" + #"hash_41e8bfe605fbbfe6");
            playrumbleonposition("sr_prototype_generator_explosion", var_8fac91c0.origin);
            playsoundatposition(#"hash_8e873c6bea5355a", var_5f9f614d.origin + (0, 0, 25));
            level thread function_8fc5e1ba();
            break;
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x5cf4924f, Offset: 0x6f38
// Size: 0xde
function function_8fc5e1ba() {
    var_b7a28022 = struct::get(#"housing");
    var_b5a64394 = getent("satellite_mounted", "targetname");
    var_b5a64394 thread scene::play(#"hash_7e9240eaa405e0c4", var_b5a64394);
    var_b5a64394 hidepart("tag_satellite");
    var_eb23961b = function_3d102402(#"item_zmquest_tungsten_mq_quest_part_housing", var_b7a28022.origin, var_b7a28022.angles, 1);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xe0938a87, Offset: 0x7020
// Size: 0x84
function function_a5015671() {
    var_2e34590c = struct::get(#"hash_f1ef3c7a863696b");
    level.var_4414302d = util::spawn_model(var_2e34590c.model, var_2e34590c.origin, var_2e34590c.angles);
    wait(0.1);
    level.var_4414302d hide();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xcc9ac03d, Offset: 0x70b0
// Size: 0x204
function function_34f41b72() {
    level.a_s_interacts = [];
    level.var_a13ca883 = [];
    level.a_str_flags = [];
    level.var_e2c2d62f = 0;
    for (i = 1; i < 5; i++) {
        level.a_s_interacts[level.a_s_interacts.size] = struct::get("interact_tank_" + i);
    }
    var_936c52b5 = getent("clip_player_barrier", "targetname");
    var_936c52b5 setinvisibletoall();
    var_4fd98c9e = getentarray("fuel_tank_liquid", "targetname");
    level flag::wait_till(#"start_zombie_round_logic");
    for (i = 0; i < 4; i++) {
        level.var_a13ca883[i] = level.a_s_interacts[i] zm_unitrigger::create(&tank_interact, 64, &function_7468ef6);
        level.var_a13ca883[i].str_flag = #"hash_7ee10096a289d2c5" + i;
        level.a_str_flags[i] = level.var_a13ca883[i].str_flag;
        level.var_a13ca883[i] thread function_431c0845();
    }
    level thread function_ffc8553d();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x39a45b8b, Offset: 0x72c0
// Size: 0x1c
function function_ffc8553d() {
    level thread function_5ef63d9e();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x3dc114c2, Offset: 0x72e8
// Size: 0x16a
function tank_interact(*player) {
    if (!level flag::get(#"hash_65c0f8b6c42b8159") && level flag::get(#"hash_3683ce7803b13dea") && !level flag::get(self.stub.str_flag)) {
        self sethintstring(#"hash_2c7e24d5963081d1");
        return 1;
    }
    if (level flag::get(#"hash_65c0f8b6c42b8159")) {
        self sethintstring(#"hash_7079aaada5942259");
        return 1;
    }
    if (level flag::get(self.stub.str_flag)) {
        self sethintstring(#"hash_39ad0237628f67ef");
        return 1;
    }
    self sethintstring(#"hash_3fabd443621990f3");
    return 1;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x86ac8789, Offset: 0x7460
// Size: 0x16c
function function_7468ef6() {
    level endon(#"hash_1a8b97bb9490c50c");
    while (true) {
        s_waitresult = self waittill(#"trigger");
        if (zm_utility::is_player_valid(s_waitresult.activator) && !level flag::get(#"hash_65c0f8b6c42b8159") && level flag::get(#"hash_3683ce7803b13dea") && !level flag::get(self.stub.str_flag) && !is_true(s_waitresult.activator.b_activated)) {
            s_waitresult.activator.b_activated = 1;
            playsoundatposition(#"hash_60c84d2631929f68", self.origin);
            level flag::set(self.stub.str_flag);
            level.var_e2c2d62f++;
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xc1636b11, Offset: 0x75d8
// Size: 0x44
function function_431c0845() {
    level flag::wait_till(#"hash_1a8b97bb9490c50c");
    if (isdefined(self)) {
        zm_unitrigger::unregister_unitrigger(self);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xa9211735, Offset: 0x7628
// Size: 0x2c8
function function_5ef63d9e() {
    level endon(#"hash_1a8b97bb9490c50c");
    level flag::set(#"hash_3683ce7803b13dea");
    while (true) {
        level flag::wait_till_any(level.a_str_flags);
        foreach (player in getplayers()) {
            player.var_45ef153 = 1;
            player.var_1a4a768c = 1;
        }
        wait(1);
        if (level.var_e2c2d62f === getplayers().size) {
            level thread function_dbec41cd();
            exploder::exploder("lgt_tank_turn_on");
        }
        foreach (var_bb0e29b7 in level.var_a13ca883) {
            level flag::clear(var_bb0e29b7.str_flag);
        }
        level.var_e2c2d62f = 0;
        level flag::clear(#"hash_3683ce7803b13dea");
        foreach (player in getplayers()) {
            player.b_activated = undefined;
        }
        level waittill(#"end_of_round");
        level flag::set(#"hash_3683ce7803b13dea");
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xf927e614, Offset: 0x78f8
// Size: 0x62c
function function_dbec41cd() {
    s_barrier = struct::get("player_barrier");
    var_532c4db3 = util::spawn_model("tag_origin", s_barrier.origin, s_barrier.angles);
    var_936c52b5 = getent("clip_player_barrier", "targetname");
    var_d34c45e0 = struct::get("fuel_tank");
    n_zombies = level.zombie_ai_limit;
    str_zone = zm_zonemgr::get_zone_from_position(var_d34c45e0.origin, 1, 1);
    level thread function_7239291b(var_d34c45e0.origin, 0);
    level flag::clear("spawn_zombies");
    level flag::set(#"hash_65c0f8b6c42b8159");
    level flag::clear(#"hash_3683ce7803b13dea");
    level thread function_f57eb037(var_d34c45e0, n_zombies);
    level thread function_bc6ebe8b(90);
    level thread trigger_backlot();
    level thread function_7825a3cb();
    level thread function_c4a3ac62();
    exploder::exploder("lgt_env_boiler");
    playrumbleonposition("sr_prototype_generator_explosion", var_d34c45e0.origin);
    level.var_b54157cf = 1;
    foreach (player in getplayers()) {
        player thread function_9589412a();
    }
    if (isdefined(var_532c4db3)) {
        var_532c4db3 clientfield::set("" + #"player_barrier", 1);
    }
    level clientfield::set("" + #"hash_5a36f05cbdf2580", 3);
    var_936c52b5 setvisibletoall();
    level flag::wait_till_any(array(#"hash_1a8b97bb9490c50c", #"hash_1b6edf77ac1694c2"));
    exploder::stop_exploder("lgt_env_boiler");
    level.var_b54157cf = 0;
    foreach (player in getplayers()) {
        player.var_45ef153 = 0;
        player.var_1a4a768c = 0;
        player.b_activated = undefined;
    }
    if (level flag::get(#"hash_1b6edf77ac1694c2")) {
        var_4fd98c9e = getentarray("fuel_tank_liquid", "targetname");
        foreach (var_fc3c3d4a in var_4fd98c9e) {
            var_fc3c3d4a moveto(var_fc3c3d4a.var_df0610bd, 5);
        }
    }
    level flag::clear(#"hash_65c0f8b6c42b8159");
    level flag::clear(#"hash_1b6edf77ac1694c2");
    var_936c52b5 setinvisibletoall();
    if (isdefined(var_532c4db3)) {
        var_532c4db3 clientfield::set("" + #"player_barrier", 0);
    }
    waitframe(1);
    if (isdefined(var_532c4db3)) {
        var_532c4db3 delete();
    }
    level clientfield::set("" + #"hash_5a36f05cbdf2580", 4);
    wait(5);
    level flag::set("spawn_zombies");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xd2c6791, Offset: 0x7f30
// Size: 0x2c
function function_c4a3ac62() {
    wait(0.5);
    level thread zm_tungsten_vo::function_752b5c36(#"hash_46d0da754e5732d7", undefined);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x3ab738ca, Offset: 0x7f68
// Size: 0x74
function function_7825a3cb() {
    level endon(#"hash_61adf2a70e28f4cf", #"hash_1a8b97bb9490c50c", #"hash_1b6edf77ac1694c2");
    level flag::wait_till(#"hash_7b312d4275e203a6");
    level thread function_79cc990a();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xf2406339, Offset: 0x7fe8
// Size: 0x4c
function function_79cc990a() {
    wait(0.5);
    zm_tungsten_vo::function_752b5c36(#"hash_411a6cf2558ce491", undefined);
    level flag::clear(#"hash_7b312d4275e203a6");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x6c8cf87a, Offset: 0x8040
// Size: 0x4c
function function_2fa25e79() {
    self endon(#"disconnect");
    self waittill(#"fasttravel_over");
    self thread zm_tungsten_vo::function_b5b0518b(#"hash_411a6cf2558ce491", 1);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xb97aed87, Offset: 0x8098
// Size: 0xf2
function trigger_backlot() {
    level endon(#"hash_61adf2a70e28f4cf", #"hash_1a8b97bb9490c50c", #"hash_1b6edf77ac1694c2");
    var_6660230c = getent("trigger_backlot", "targetname");
    while (true) {
        s_result = var_6660230c waittill(#"trigger");
        if (isdefined(s_result.activator) && !is_true(s_result.activator.b_entered)) {
            s_result.activator.b_entered = 1;
            s_result.activator.var_98f1f37c = undefined;
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xc57b53bc, Offset: 0x8198
// Size: 0x128
function function_99adcd48() {
    self endon(#"death");
    level endon(#"hash_1a8b97bb9490c50c", #"hash_1b6edf77ac1694c2");
    wait(10);
    while (true) {
        wait(randomintrange(5, 8));
        for (i = 0; i < 6; i++) {
            if (zm_utility::is_player_valid(self)) {
                ai_zombie = array::random(getaiarchetypearray(#"zombie"));
                if (isdefined(ai_zombie) && !self util::is_player_looking_at(ai_zombie.origin, 0.8)) {
                    ai_zombie deletedelay();
                }
            }
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x62207e0, Offset: 0x82c8
// Size: 0x3e8
function function_f57eb037(var_d34c45e0, n_zombies) {
    level endon(#"hash_1a8b97bb9490c50c", #"hash_1b6edf77ac1694c2");
    str_zone = zm_zonemgr::get_zone_from_position(var_d34c45e0.origin, 1, 1);
    a_s_spawns = [];
    var_72809a6 = struct::get_array("zone_anytown_usa_backlot_spawns");
    var_d0882897 = struct::get_array("tank_process_zombie");
    var_32174208 = arraycombine(var_72809a6, var_d0882897);
    foreach (s_spawn in var_32174208) {
        if ((s_spawn.script_noteworthy === "spawn_location" || s_spawn.script_noteworthy === "custom_spawner_entry crawl") && distance2dsquared(var_d34c45e0.origin, s_spawn.origin) <= 4000000) {
            a_s_spawns[a_s_spawns.size] = s_spawn;
        }
    }
    i = 0;
    level thread function_5ceb4a8a(n_zombies, level.round_number);
    if (getplayers().size === 1) {
        getplayers()[0] thread function_99adcd48();
    }
    while (true) {
        if (function_e1403814() < n_zombies && !level flag::get(#"hash_54c8d63e66e2f949")) {
            ai_zombie = zombie_utility::spawn_zombie(function_7002478(), undefined, a_s_spawns[i], level.round_number);
            if (isdefined(ai_zombie) && a_s_spawns[i].script_noteworthy === "custom_spawner_entry crawl") {
                ai_zombie.var_ed454e33 = 1;
            }
            if (isdefined(ai_zombie) && isdefined(a_s_spawns[i].zone_name)) {
                ai_zombie.b_inside = 1;
            }
            i++;
            if (i == a_s_spawns.size) {
                i = 0;
                a_s_spawns = array::randomize(a_s_spawns);
            }
            waitframe(1);
            if (isdefined(ai_zombie)) {
                ai_zombie thread function_69503077();
                ai_zombie thread function_b3bf446e(str_zone);
                ai_zombie thread zm_score::function_acaab828();
                ai_zombie.ignore_enemy_count = 1;
                ai_zombie.no_powerups = 1;
                if (ai_zombie.zombie_move_speed !== "super_sprint") {
                    ai_zombie zombie_utility::set_zombie_run_cycle("sprint");
                }
            }
        }
        wait(0.2);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xa3eee225, Offset: 0x86b8
// Size: 0xc8
function function_e1403814() {
    var_9c4334ef = getaiarray();
    foreach (entity in var_9c4334ef) {
        if (isvehicle(entity)) {
            arrayremovevalue(var_9c4334ef, entity);
        }
    }
    if (isdefined(var_9c4334ef)) {
        return var_9c4334ef.size;
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x9783789c, Offset: 0x8788
// Size: 0x13c
function function_7002478() {
    var_87e4f82c = randomintrange(0, 100);
    var_b62ee10a = [0, 1];
    if (level.round_number >= 13 || level flag::get(#"hash_5fff608f0c23a53f")) {
        if (var_87e4f82c <= 5) {
            if (level.round_number < 30 && !level flag::get(#"hash_14ac8b5a5e403984")) {
                return level.zombie_spawners[2];
            } else if (math::cointoss()) {
                return level.zombie_spawners[3];
            } else {
                return level.zombie_spawners[2];
            }
        }
    }
    return level.zombie_spawners[array::random(var_b62ee10a)];
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xa76932fb, Offset: 0x88d0
// Size: 0x84
function function_69503077() {
    self endon(#"death");
    if (is_true(self.var_ed454e33)) {
        self waittill(#"completed_emerging_into_playable_area");
    }
    if (isalive(self)) {
        self clientfield::increment("" + #"hash_11839f68b17da97a");
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 2, eflags: 0x2 linked
// Checksum 0xe6f8e52b, Offset: 0x8960
// Size: 0x328
function function_5ceb4a8a(n_zombies, *n_round) {
    level endon(#"hash_1a8b97bb9490c50c", #"hash_1b6edf77ac1694c2");
    var_707cc758 = struct::get("tank_process_soa");
    var_cbd80ad6 = struct::get_array("tank_process_dog");
    level.var_248424c1 = 1;
    level.var_4d6a62ae = 1;
    level.var_a7f8d97b = 5;
    level.var_8e259073 = 0;
    level.var_d5fdc9c = 0;
    level.var_e00b0988 = 0;
    while (true) {
        level flag::set(#"hash_54c8d63e66e2f949");
        switch (randomintrangeinclusive(0, 2)) {
        case 0:
            if (level.var_8e259073 < level.var_248424c1 && function_e1403814() < n_round) {
                var_397a719 = zm_ai_avogadro::spawn_single(1, var_707cc758);
                waitframe(1);
                if (isdefined(var_397a719)) {
                    level.var_8e259073++;
                    var_397a719 thread function_cc66178();
                }
            }
            break;
        case 1:
            if (level.var_d5fdc9c < level.var_4d6a62ae && function_e1403814() < n_round) {
                ai_soa = zm_ai_soa::function_e803632f(1, var_707cc758);
                waitframe(1);
                if (isdefined(ai_soa)) {
                    level.var_d5fdc9c++;
                    ai_soa thread function_95c43d9e();
                }
            }
            break;
        case 2:
            if (level.var_e00b0988 < level.var_a7f8d97b && function_e1403814() < n_round) {
                ai_dog = zombie_dog_util::function_62db7b1c(1, array::random(var_cbd80ad6));
                waitframe(1);
                if (isdefined(ai_dog)) {
                    level.var_e00b0988++;
                    ai_dog thread function_bb7fe568();
                }
            }
            break;
        }
        level flag::clear(#"hash_54c8d63e66e2f949");
        wait(1);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x90f6648d, Offset: 0x8c90
// Size: 0x24
function function_bb7fe568() {
    self waittill(#"death");
    level.var_e00b0988--;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xe18b711a, Offset: 0x8cc0
// Size: 0x24
function function_95c43d9e() {
    self waittill(#"death");
    level.var_d5fdc9c--;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xab29a5b2, Offset: 0x8cf0
// Size: 0x24
function function_cc66178() {
    self waittill(#"death");
    level.var_8e259073--;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xdcb24c54, Offset: 0x8d20
// Size: 0x18a
function function_b3bf446e(str_zone) {
    self endon(#"death");
    self.var_98f1f37c = 1;
    self.no_powerups = 1;
    b_entered = 0;
    if (is_true(self.b_inside)) {
        self waittill(#"completed_emerging_into_playable_area");
    } else {
        while (!b_entered) {
            if (isarray(str_zone)) {
                foreach (zone in str_zone) {
                    if (isalive(self) && self.zone_name === zone) {
                        b_entered = 1;
                    }
                }
            } else if (isalive(self) && self.zone_name === str_zone) {
                b_entered = 1;
            }
            wait(1);
        }
    }
    self.var_98f1f37c = 0;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xc441388c, Offset: 0x8eb8
// Size: 0xbc
function function_bc6ebe8b(n_timer) {
    level thread function_9c2ad358(n_timer);
    level flag::wait_till_any(array(#"hash_1a8b97bb9490c50c", #"hash_1b6edf77ac1694c2"));
    exploder::stop_exploder("lgt_tank_turn_on");
    level thread zm_utility::function_9ad5aeb1(0, 1, 0, 0);
    wait(1);
    level thread function_5939f21c();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x74820008, Offset: 0x8f80
// Size: 0x19c
function function_9c2ad358(n_timer) {
    level endon(#"hash_1b6edf77ac1694c2", #"hash_1a8b97bb9490c50c");
    var_4fd98c9e = getentarray("fuel_tank_liquid", "targetname");
    foreach (var_fc3c3d4a in var_4fd98c9e) {
        var_fc3c3d4a.var_df0610bd = var_fc3c3d4a.origin;
    }
    foreach (var_fc3c3d4a in var_4fd98c9e) {
        var_fc3c3d4a thread function_6790ba9f(n_timer);
    }
    wait(n_timer);
    level notify(#"hash_61adf2a70e28f4cf");
    wait(1);
    level flag::set(#"hash_1a8b97bb9490c50c");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xf8f39ad4, Offset: 0x9128
// Size: 0x24
function function_6790ba9f(n_timer) {
    self movez(130, n_timer);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xcdaa6e61, Offset: 0x9158
// Size: 0xc0
function function_9589412a() {
    self endon(#"death");
    level endon(#"hash_61adf2a70e28f4cf", #"hash_1a8b97bb9490c50c");
    self waittill(#"hash_1c35eb15aa210d6");
    self thread function_2fa25e79();
    level flag::set(#"hash_7b312d4275e203a6");
    waitframe(1);
    level flag::set(#"hash_1b6edf77ac1694c2");
    level notify(#"hash_61adf2a70e28f4cf");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x40da0188, Offset: 0x9220
// Size: 0x126
function function_8687b0f2() {
    var_d34c45e0 = struct::get("fuel_tank");
    level flag::wait_till(#"hash_1a8b97bb9490c50c");
    level thread zm_tungsten_vo::function_752b5c36(#"hash_7a068d507bf881b4", undefined);
    playrumbleonposition("sr_prototype_generator_explosion", var_d34c45e0.origin);
    wait(0.25);
    var_62b058e7 = getent("fuel_tank_cover", "targetname");
    var_62b058e7 thread scene::play(#"hash_49cd61dfddbf567e", var_62b058e7);
    waitframe(1);
    var_68cb0703 = function_3d102402(#"item_zmquest_tungsten_mq_quest_part_fuel", var_d34c45e0.origin, var_d34c45e0.angles, 1);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 2, eflags: 0x2 linked
// Checksum 0xaa4c32, Offset: 0x9350
// Size: 0x28e
function function_7239291b(v_org, b_in_zone) {
    var_4b9821e4 = 0;
    a_zombies = getaiteamarray(level.zombie_team);
    str_zone = zm_zonemgr::get_zone_from_position(v_org);
    foreach (zombie in a_zombies) {
        if (b_in_zone) {
            if (isalive(zombie) && isdefined(zombie.zone_name) && zombie.zone_name == str_zone) {
                zombie.b_clear = 1;
            }
        } else if (isalive(zombie) && isdefined(zombie.zone_name) && zombie.zone_name != str_zone) {
            zombie.b_clear = 1;
        }
        if (isalive(zombie) && is_true(zombie.b_clear)) {
            if (zm_utility::is_magic_bullet_shield_enabled(zombie)) {
                zombie util::stop_magic_bullet_shield();
            }
            zombie.allowdeath = 1;
            zombie.no_powerups = 1;
            zombie.deathpoints_already_given = 1;
            zombie.marked_for_death = 1;
            zombie thread zombie_death::flame_death_fx();
            if (!is_true(zombie.no_gib)) {
                zombie zombie_utility::zombie_head_gib();
            }
            zombie dodamage(zombie.health + 666, zombie.origin);
        }
        waitframe(1);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xf1455b22, Offset: 0x95e8
// Size: 0x1ee
function function_e17174c2() {
    var_4b9821e4 = 0;
    a_zombies = getaiteamarray(level.zombie_team);
    foreach (zombie in a_zombies) {
        if (zombie.n_id === self.n_id) {
            if (isalive(zombie)) {
                zombie.b_clear = 1;
                if (zm_utility::is_magic_bullet_shield_enabled(zombie)) {
                    zombie util::stop_magic_bullet_shield();
                }
                if (isalive(zombie)) {
                    zombie.allowdeath = 1;
                    zombie.no_powerups = 1;
                    zombie.deathpoints_already_given = 1;
                    zombie.marked_for_death = 1;
                    zombie thread zombie_death::flame_death_fx();
                    if (!is_true(zombie.no_gib)) {
                        zombie zombie_utility::zombie_head_gib();
                    }
                    if (isalive(zombie)) {
                        zombie dodamage(zombie.health + 666, zombie.origin);
                    }
                }
            }
        }
        waitframe(1);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x7568d818, Offset: 0x97e0
// Size: 0xa8
function function_5939f21c() {
    a_corpses = getcorpsearray();
    foreach (corpse in a_corpses) {
        if (isdefined(corpse)) {
            corpse delete();
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xb77efe84, Offset: 0x9890
// Size: 0xb6
function function_72dc9adc() {
    vehicle::add_main_callback("vehicle_t9_rcxd_racing_mq", &recon_car::function_d1661ada);
    callback::add_callback(#"hash_1eda827ff5e6895b", &function_6e6149a6);
    callback::add_callback(#"hash_210adcf09e99fba1", &function_4b58e5ab);
    level.var_9b69599b = struct::get("gp_machine");
    level.var_ef566585 = undefined;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xec623ced, Offset: 0x9950
// Size: 0x134
function function_6e6149a6() {
    if (!is_true(level.var_f2d324b1) && distance2dsquared(self.origin, level.var_9b69599b.origin) <= 32400) {
        level.var_f2d324b1 = 1;
        self.is_powered = 1;
        self clientfield::set("" + #"hash_3b24d38fe21de8fd", 1);
        self thread function_420c57c4();
        level thread function_b2048324();
        wait(2);
        if (isalive(self.attacker) && isplayer(self.attacker)) {
            self.attacker zm_vo::function_7622cb70(#"hash_3de820817318544b");
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x194b91ca, Offset: 0x9a90
// Size: 0x54
function function_420c57c4() {
    self waittill(#"death");
    if (isdefined(self)) {
        self.is_powered = undefined;
        self clientfield::set("" + #"hash_3b24d38fe21de8fd", 0);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x699eb33, Offset: 0x9af0
// Size: 0x74
function function_b2048324() {
    level flag::set(#"hash_7eb10b962195f30c");
    level clientfield::set("" + #"hash_5a36f05cbdf2580", 1);
    level thread function_5f60162d();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xa2268cb4, Offset: 0x9b70
// Size: 0xac
function function_4b58e5ab() {
    if (isdefined(self) && is_true(self.is_powered) && is_true(level.var_f2d324b1) && !level flag::get(#"hash_7eb10b962195f30c")) {
        self.is_powered = undefined;
    }
    if (isdefined(self)) {
        self clientfield::set("" + #"hash_3b24d38fe21de8fd", 0);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x37c2fd6c, Offset: 0x9c28
// Size: 0x7e
function function_5f60162d() {
    wait(2);
    showmiscmodels("rcxd_cabinet_on");
    hidemiscmodels("rcxd_cabinet_off");
    var_c809fcdc = level.var_9b69599b zm_unitrigger::create(&function_70b7fcd8, 64, &function_c3297243);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xc0d60fbd, Offset: 0x9cb0
// Size: 0xba
function function_70b7fcd8(player) {
    if (!isdefined(level.var_ef566585)) {
        self sethintstringforplayer(player, #"hash_5e1312f118a41e92", 2000);
        if (!player zm_score::can_player_purchase(2000)) {
            player globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
        }
        return 1;
    }
    self sethintstringforplayer(player, #"hash_1d51bfe52c244e49");
    return 1;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xbd31513e, Offset: 0x9d78
// Size: 0x1f8
function function_c3297243() {
    while (true) {
        s_waitresult = self waittill(#"trigger");
        if (zm_utility::is_player_valid(s_waitresult.activator) && s_waitresult.activator zm_score::can_player_purchase(2000) && !isdefined(level.var_ef566585) && !killstreaks::is_killstreak_weapon(s_waitresult.activator getcurrentweapon())) {
            s_waitresult.activator.var_7aa0d894 = 1;
            wait(0.25);
            if (!isdefined(s_waitresult.activator.var_1bee6f4b) && !killstreaks::is_killstreak_weapon(s_waitresult.activator getcurrentweapon())) {
                level flag::set(#"hash_6868b1aab2d20ef4");
                s_waitresult.activator zm_score::minus_to_player_score(2000);
                spawn_gp(s_waitresult.activator);
                level flag::wait_till(#"hash_7f37f6722d373c94");
                level flag::clear(#"hash_7f37f6722d373c94");
                if (level flag::get(#"hash_1d60e20334999c12")) {
                    zm_unitrigger::unregister_unitrigger(self.stub);
                }
            }
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xc534a463, Offset: 0x9f78
// Size: 0x9c
function on_player_disconnect() {
    if (isdefined(level.var_ef566585) && level.var_ef566585.owner === self) {
        level flag::set(#"hash_7f37f6722d373c94");
        level flag::clear(#"hash_6868b1aab2d20ef4");
        if (isdefined(level.var_ef566585)) {
            level.var_ef566585 delete();
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x51b47446, Offset: 0xa020
// Size: 0x354
function spawn_gp(player) {
    player endon(#"disconnect");
    if (!isdefined(level.var_ef566585)) {
        var_c48a5d = getent("gp_spawn", "targetname");
        level.var_ef566585 = spawnvehicle(#"vehicle_t9_rcxd_racing_mq", var_c48a5d.origin, var_c48a5d.angles);
        wait(0.1);
        if (isdefined(level.var_ef566585)) {
            level.var_ef566585.var_38ae4622 = 1;
            level.var_ef566585.owner = player;
            level.var_ef566585 clientfield::increment("" + #"gp_spawn");
            level.var_ef566585.targetname = "gp_car";
            level.var_ef566585 thread on_vehicle_enter();
            level.var_ef566585 thread function_cee1d1a0();
            level.var_ef566585 thread function_c3a363f9();
            waitframe(1);
            if (zm_utility::is_player_valid(player)) {
                player thread function_e78fa4e5(level.var_ef566585);
                level.var_ef566585 thread killstreaks::waitfortimeoutbeep(10, 4, 30000);
                level.var_ef566585 thread function_21ec730a(30);
                level.var_ef566585 thread function_b41a783a();
                level.var_ef566585 thread function_2808ad2c();
                level flag::set(#"hash_d9787e6e05bf6");
                return;
            }
            if (isdefined(level.var_ef566585)) {
                level.var_ef566585 clientfield::increment("" + #"hash_485fe8f642043f78");
                level.var_ef566585 playrumbleonentity("sr_prototype_generator_explosion");
                level.var_ef566585 radiusdamage(level.var_ef566585.origin + (0, 0, 10), 500, level.zombie_health, int(level.zombie_health * 0.5), level.var_ef566585, "MOD_EXPLOSIVE");
                level.var_ef566585 dodamage(level.var_ef566585.health, level.var_ef566585.origin);
            }
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xad6c5081, Offset: 0xa380
// Size: 0x4e
function function_2808ad2c() {
    self endon(#"death");
    level waittill(#"end_game", #"game_ended");
    self notify(#"shutdown");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xc5dc42f4, Offset: 0xa3d8
// Size: 0x104
function function_c3a363f9() {
    self waittill(#"death");
    self thread function_31bea2f5();
    if (isdefined(self.owner)) {
        self.owner val::reset("arc_xd", "ignoreme");
        self.owner notify(#"hash_7a83cf7aa1bd3738");
        self.owner.var_7aa0d894 = 0;
    }
    if (isdefined(self)) {
        wait(0.5);
        level flag::set(#"hash_7f37f6722d373c94");
        level flag::clear(#"hash_6868b1aab2d20ef4");
        if (isdefined(self)) {
            self delete();
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xfaf1273d, Offset: 0xa4e8
// Size: 0x4c
function function_b41a783a() {
    self endon(#"death");
    self waittill(#"shutdown");
    self dodamage(self.health, self.origin);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xe47a9127, Offset: 0xa540
// Size: 0x94
function function_21ec730a(n_timer) {
    self endon(#"death");
    wait(n_timer);
    if (isdefined(self.owner)) {
        self.owner val::reset("arc_xd", "ignoreme");
        self.owner.var_7aa0d894 = 0;
    }
    self dodamage(self.health, self.origin);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x896a01db, Offset: 0xa5e0
// Size: 0x20c
function function_cee1d1a0() {
    self endon(#"death", #"shutdown");
    var_45bf69aa = struct::get("vent_arc_xd");
    level.var_2133d509.s_target = struct::get(var_45bf69aa.target);
    var_8aaeebfe = struct::get("backroom_exp_loc");
    level.var_d47934e1 = util::spawn_model("tag_origin", var_8aaeebfe.origin, var_8aaeebfe.angles);
    while (true) {
        if (distance2dsquared(level.var_2133d509.origin, self.origin) <= 10000) {
            break;
        }
        wait(0.1);
    }
    self waittill(#"hash_2eef2b24309bc112");
    level.var_2133d509 playsound(#"hash_5039749da6b34ee8");
    level.var_2133d509 moveto(level.var_2133d509.s_target.origin, 0.1);
    level.var_2133d509 rotateto(level.var_2133d509.s_target.angles, 0.1);
    var_ab9c9dd4 = getent("clip_backroom_vent", "targetname");
    var_ab9c9dd4 setinvisibletoall();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x4ef1df2e, Offset: 0xa7f8
// Size: 0xf0
function on_vehicle_enter() {
    self endon(#"death");
    while (true) {
        s_result = self waittill(#"enter_vehicle");
        if (zm_utility::is_player_valid(s_result.player)) {
            s_result.player val::set("arc_xd", "ignoreme", 1);
            s_result.player thread function_9030e55c();
            s_result.player thread function_d5ea10b();
            s_result.player thread function_41ff3cd8();
            s_result.player thread function_c3567733();
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xcb6b6994, Offset: 0xa8f0
// Size: 0xb4
function function_41ff3cd8() {
    self endon(#"disconnect");
    level.var_ef566585 endon(#"death");
    while (true) {
        s_result = trigger::wait_till("trigger_tv_backroom");
        if (s_result.who === level.var_ef566585) {
            if (isalive(self)) {
                self zm_vo::function_7622cb70(#"hash_589145ca18409daa");
                break;
            }
        }
        wait(0.5);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xb392263d, Offset: 0xa9b0
// Size: 0x176
function function_c3567733() {
    self endon(#"disconnect");
    level.var_ef566585 endon(#"death");
    wait(33);
    if (isdefined(level.var_ef566585) && isdefined(self)) {
        level.var_ef566585 clientfield::increment("" + #"hash_485fe8f642043f78");
        level.var_ef566585 playrumbleonentity("sr_prototype_generator_explosion");
        level.var_ef566585 radiusdamage(level.var_ef566585.origin + (0, 0, 10), 500, level.zombie_health, int(level.zombie_health * 0.5), self, "MOD_EXPLOSIVE");
        level.var_ef566585 dodamage(level.var_ef566585.health, level.var_ef566585.origin);
        self val::reset("arc_xd", "ignoreme");
        self.var_7aa0d894 = 0;
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xd3f23c09, Offset: 0xab30
// Size: 0xc2
function function_d5ea10b() {
    self endon(#"disconnect");
    level.var_ef566585 endon(#"death");
    while (true) {
        s_result = self waittill(#"exit_vehicle");
        if (zm_utility::is_player_valid(self) && s_result.vehicle === level.var_ef566585) {
            self val::reset("arc_xd", "ignoreme");
            self.var_7aa0d894 = 0;
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xd9e3bbd2, Offset: 0xac00
// Size: 0x1cc
function function_9030e55c() {
    self notify("5ba137900084250");
    self endon("5ba137900084250");
    self endon(#"death", #"exit_vehicle");
    while (true) {
        if (self vehicleattackbuttonpressed()) {
            self val::reset("arc_xd", "ignoreme");
            self.var_7aa0d894 = 0;
            level flag::clear(#"hash_6868b1aab2d20ef4");
            break;
        }
        waitframe(1);
    }
    if (isdefined(level.var_ef566585) && isdefined(self)) {
        level.var_ef566585 clientfield::increment("" + #"hash_485fe8f642043f78");
        level.var_ef566585 playrumbleonentity("sr_prototype_generator_explosion");
        level.var_ef566585 radiusdamage(level.var_ef566585.origin + (0, 0, 10), 500, level.zombie_health, int(level.zombie_health * 0.5), self, "MOD_EXPLOSIVE");
        level.var_ef566585 dodamage(level.var_ef566585.health, level.var_ef566585.origin);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xb3aa9c3a, Offset: 0xadd8
// Size: 0x23e
function function_e78fa4e5(vehicle) {
    self endon(#"disconnect");
    if (self isswitchingweapons()) {
        self waittilltimeout(3, #"weapon_change_complete");
    }
    w_current = self getcurrentweapon();
    var_7dcc4eed = getweapon(#"recon_car_zm");
    if (self hasweapon(var_7dcc4eed) || self killstreaks::has_killstreak("recon_car")) {
        var_ddd0e708 = 1;
    } else {
        self giveweapon(var_7dcc4eed);
    }
    self switchtoweapon(var_7dcc4eed);
    self waittilltimeout(3, #"weapon_change_complete");
    if (isdefined(vehicle)) {
        vehicle usevehicle(self, 0);
        vehicle makevehicleunusable();
        self vehicle::set_vehicle_drivable_time_starting_now(30000);
    }
    self waittill(#"death", #"exit_vehicle", #"hash_7a83cf7aa1bd3738");
    util::wait_network_frame(5);
    if (!is_true(var_ddd0e708) && self hasweapon(var_7dcc4eed)) {
        self takeweapon(var_7dcc4eed);
    }
    self switchtoweapon(w_current);
    self.var_7aa0d894 = 0;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xb91285c4, Offset: 0xb020
// Size: 0x84
function function_31bea2f5() {
    var_c1e7550c = getent("vol_tv_backroom", "targetname");
    b_success = 0;
    if (self istouching(var_c1e7550c) && !b_success) {
        b_success = 1;
        level thread function_5429a020();
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x9df7a51f, Offset: 0xb0b0
// Size: 0x1b4
function function_5429a020() {
    var_c3136e6e = struct::get("part_monitor");
    level.var_d47934e1 clientfield::increment("" + #"hash_5e0a6fc6597e6e03");
    level thread function_52ad48fd();
    hidemiscmodels("backroom_hole");
    level clientfield::set("" + #"hash_5a36f05cbdf2580", 2);
    level flag::set(#"hash_1d60e20334999c12");
    mdl_monitor = function_3d102402(#"item_zmquest_tungsten_mq_quest_part_monitor", var_c3136e6e.origin, var_c3136e6e.angles, 0);
    wait(0.1);
    mdl_monitor thread function_bc4f36d7();
    var_ab9c9dd4 = getent("clip_backroom_vent", "targetname");
    var_ab9c9dd4 setvisibletoall();
    wait(0.5);
    hidemiscmodels("rcxd_shelf_before");
    showmiscmodels("rcxd_shelf_after");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xa441d861, Offset: 0xb270
// Size: 0x104
function function_bc4f36d7() {
    if (self haspart("tag_screen_25")) {
        self hidepart("tag_screen_25");
    }
    if (self haspart("tag_screen_50")) {
        self hidepart("tag_screen_50");
    }
    if (self haspart("tag_screen_full")) {
        self hidepart("tag_screen_full");
    }
    if (self haspart("tag_screen_less")) {
        self hidepart("tag_screen_less");
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xa6903cc4, Offset: 0xb380
// Size: 0xd4
function function_1ddf7c10(var_5fa67dc9) {
    if (isdefined(self.var_401b92e8)) {
        foreach (var_3f8f830a in self.var_401b92e8) {
            if (var_3f8f830a !== var_5fa67dc9) {
                self hidepart(var_3f8f830a);
            }
        }
    }
    if (self haspart(var_5fa67dc9)) {
        self showpart(var_5fa67dc9);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xfe5cd82, Offset: 0xb460
// Size: 0xf8
function function_52ad48fd() {
    zm_intel::function_23255935("omega_audiolog_3");
    s_loc = struct::get("audiolog_loc");
    foreach (var_99bf2e73 in level.var_238bd723) {
        if (var_99bf2e73.targetname === "omega_audiolog_3" && isdefined(var_99bf2e73.var_bdb97676)) {
            var_99bf2e73.var_bdb97676 zm_intel::function_c1974629(s_loc.origin);
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x424cbe4a, Offset: 0xb560
// Size: 0x74
function function_96558bd7() {
    level flag::wait_till_all(array(#"hash_52d565520308890c", #"hash_77e125d6f8b2733e", #"hash_407e12c104cfde25"));
    level flag::set(#"hash_21844688fcfdffe4");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xa57a926, Offset: 0xb5e0
// Size: 0x74
function function_551048b9() {
    level flag::wait_till_all(array(#"hash_6702dc6ad4563f02", #"hash_6702dd6ad45640b5", #"hash_6702da6ad4563b9c"));
    level flag::set(#"hash_45d1ea5a016b7916");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xa80604ed, Offset: 0xb660
// Size: 0x54
function function_b4e3ff4a(b_skipped) {
    if (b_skipped) {
        return;
    }
    level flag::wait_till(#"hash_717f6f193982a127");
    /#
        iprintlnbold("fxexp_cin_mid_portal_win_blast_linger");
    #/
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x678a631c, Offset: 0xb6c0
// Size: 0x44
function function_28be9289(b_skipped, var_19e802fa) {
    if (b_skipped || var_19e802fa) {
    }
    level flag::set(#"hash_717f6f193982a127");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xc7f7a8bb, Offset: 0xb710
// Size: 0x1b0
function function_a048c235() {
    level.var_999868f3 = [];
    level.var_eb04c103 = array(0, 1, 2);
    foreach (var_d2ee34ea in struct::get_array("crystal_pos")) {
        level.var_999868f3[level.var_999868f3.size] = util::spawn_model(var_d2ee34ea.model, var_d2ee34ea.origin, var_d2ee34ea.angles);
        wait(0.1);
        level.var_999868f3[level.var_999868f3.size - 1].var_9e7631bd = struct::get_array(var_d2ee34ea.target);
        level.var_999868f3[level.var_999868f3.size - 1].n_id = var_d2ee34ea.var_df2f9ba4;
        level.var_999868f3[level.var_999868f3.size - 1] thread function_43b1545e();
    }
    level.var_90acdb64 = level.var_999868f3.size;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x5e2bdf40, Offset: 0xb8c8
// Size: 0x166
function function_7ff1dd86(var_7ecdee63) {
    n_players = getplayers().size;
    switch (var_7ecdee63) {
    case #"dog":
        if (n_players > 2) {
            n_limit = 5;
        } else {
            n_limit = 3;
        }
        break;
    case #"raz":
        n_limit = 2;
        break;
    case #"soa":
        if (n_players > 2) {
            n_limit = 2;
        } else {
            n_limit = 1;
        }
        break;
    case #"mimic":
        if (n_players > 2) {
            n_limit = 3;
        } else {
            n_limit = 2;
        }
        break;
    case #"tempest":
        if (n_players > 2) {
            n_limit = 2;
        } else {
            n_limit = 1;
        }
        break;
    case #"tormentor":
        if (n_players > 2) {
            n_limit = 3;
        } else {
            n_limit = 2;
        }
        break;
    }
    return n_limit;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xeab461ac, Offset: 0xba38
// Size: 0x2c2
function function_8d0f8a44() {
    switch (self.n_id) {
    case 0:
        self.a_str_zones[self.a_str_zones.size] = "zone_helipads";
        self.a_str_zones[self.a_str_zones.size] = "zone_helipads_2";
        self.a_str_zones[self.a_str_zones.size] = "zone_helipads_3";
        self.a_str_zones[self.a_str_zones.size] = "zone_helipads_4";
        break;
    case 1:
        self.a_str_zones[self.a_str_zones.size] = "zone_xxx_club_roof";
        self.a_str_zones[self.a_str_zones.size] = "zone_xxx_club";
        self.a_str_zones[self.a_str_zones.size] = "zone_diner";
        self.a_str_zones[self.a_str_zones.size] = "zone_main_street_02";
        self.a_str_zones[self.a_str_zones.size] = "zone_main_street_bridge";
        self.a_str_zones[self.a_str_zones.size] = "zone_main_street_01";
        self.a_str_zones[self.a_str_zones.size] = "zone_deck_bar";
        self.a_str_zones[self.a_str_zones.size] = "zone_high_tide_bar_roof";
        self.a_str_zones[self.a_str_zones.size] = "zone_high_tide_bar";
        self.a_str_zones[self.a_str_zones.size] = "zone_pizza_parlor";
        self.a_str_zones[self.a_str_zones.size] = "zone_donuts";
        self.a_str_zones[self.a_str_zones.size] = "zone_main_street_backlot";
        break;
    case 2:
        self.a_str_zones[self.a_str_zones.size] = "zone_service_tunnels_01";
        self.a_str_zones[self.a_str_zones.size] = "zone_service_tunnels_02";
        self.a_str_zones[self.a_str_zones.size] = "zone_service_tunnels_03";
        self.a_str_zones[self.a_str_zones.size] = "zone_pa_room_01";
        self.a_str_zones[self.a_str_zones.size] = "zone_pa_room_02";
        self.a_str_zones[self.a_str_zones.size] = "zone_bunker_entrance_03";
        break;
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xa5066365, Offset: 0xbd08
// Size: 0xcd0
function function_43b1545e() {
    self.var_92038de6 = [];
    self.var_c84e1007 = [];
    self.a_mdl_orbs = [];
    self.a_str_zones = [];
    self.health = 999999;
    self.var_9bfb3ba = 3;
    self.n_rate = 1;
    self val::set("crystal", "takedamage", 0);
    self val::set("crystal", "allowdeath", 0);
    self disconnectpaths();
    self.var_7e977a12 = array::random(level.var_eb04c103);
    arrayremovevalue(level.var_eb04c103, self.var_7e977a12);
    self.str_zone = zm_zonemgr::get_zone_from_position(self.origin, 1, 1);
    self thread function_8d0f8a44();
    target_zone = level.zones[self.str_zone];
    self.a_str_adj_zones = getarraykeys(target_zone.adjacent_zones);
    if (!isdefined(self.a_str_adj_zones)) {
        self.a_str_adj_zones = [];
    } else if (!isarray(self.a_str_adj_zones)) {
        self.a_str_adj_zones = array(self.a_str_adj_zones);
    }
    self.a_str_adj_zones[self.a_str_adj_zones.size] = self.str_zone;
    self.a_zones = [];
    self.a_s_spawns = [];
    self.var_b77578d8 = [];
    self.a_s_zombie = [];
    self.a_s_dog = [];
    self.var_2e4e85c5 = [];
    self.var_29db796e = [];
    self.var_581a505b = [];
    self.var_4c4255a3 = [];
    self.var_ace3e8e6 = [];
    self.var_1fdd1dc7 = function_7ff1dd86("dog");
    self.var_33199d58 = function_7ff1dd86("raz");
    self.var_6fc405f2 = function_7ff1dd86("soa");
    self.var_5e267965 = function_7ff1dd86("mimic");
    self.var_171665a9 = function_7ff1dd86("tempest");
    self.var_ee4b6df0 = function_7ff1dd86("tormentor");
    self.var_d3ab1e84 = 0;
    self.var_1bf25a28 = 0;
    self.var_d5fdc9c = 0;
    self.var_c1e479f3 = 0;
    self.var_8e259073 = 0;
    self.var_ee5dbb09 = 0;
    self.var_80164102 = 0;
    foreach (str_zone in self.a_str_adj_zones) {
        self.a_zones[self.a_zones.size] = level.zones[str_zone];
    }
    foreach (zone in self.a_zones) {
        foreach (node in zone.nodes) {
            a_s_spawns = struct::get_array(node.target);
            foreach (s_spawn in a_s_spawns) {
                if (s_spawn.script_noteworthy === #"spawn_location" || s_spawn.script_noteworthy === "custom_spawner_entry crawl") {
                    self.a_s_zombie[self.a_s_zombie.size] = s_spawn;
                    continue;
                }
                if (s_spawn.script_noteworthy === #"dog_location") {
                    self.a_s_dog[self.a_s_dog.size] = s_spawn;
                    continue;
                }
                if (s_spawn.script_noteworthy === #"raz_location") {
                    self.var_2e4e85c5[self.var_2e4e85c5.size] = s_spawn;
                    continue;
                }
                if (s_spawn.script_noteworthy === #"hash_2fe3f22c14b70850") {
                    self.var_29db796e[self.var_29db796e.size] = s_spawn;
                }
            }
        }
    }
    var_75d7aa63 = struct::get_array(#"hash_48c93ac86435a399");
    foreach (var_734c3691 in var_75d7aa63) {
        if (var_734c3691.var_df2f9ba4 === self.n_id) {
            if (var_734c3691.script_noteworthy === #"mimic") {
                self.var_581a505b[self.var_581a505b.size] = var_734c3691;
                continue;
            }
            if (var_734c3691.script_noteworthy === #"tempest") {
                self.var_4c4255a3[self.var_4c4255a3.size] = var_734c3691;
                continue;
            }
            if (var_734c3691.script_noteworthy === #"tormentor") {
                self.var_ace3e8e6[self.var_ace3e8e6.size] = var_734c3691;
            }
        }
    }
    self.var_b77578d8 = self function_9550923e();
    self clientfield::set("" + #"hash_4d2911e91cdb1e91", 1);
    self thread function_ebb95a0d();
    self thread function_e9df185f();
    self thread function_8e1ce89a();
    self thread function_3b0cf79();
    foreach (var_b00775de in struct::get_array("sphere_pos")) {
        if (var_b00775de.var_df2f9ba4 === self.n_id) {
            self.var_92038de6[self.var_92038de6.size] = var_b00775de;
            self.var_92038de6[self.var_92038de6.size - 1].n_delay = var_b00775de.n_delay;
        }
    }
    foreach (s_center in self.var_92038de6) {
        self.var_c84e1007[self.var_c84e1007.size] = util::spawn_model("tag_origin", s_center.origin, s_center.angles);
        self.var_c84e1007[self.var_c84e1007.size - 1].radius = s_center.radius;
        self.var_c84e1007[self.var_c84e1007.size - 1].n_delay = s_center.n_delay;
    }
    foreach (var_181a390b in self.var_c84e1007) {
        self.a_mdl_orbs[self.a_mdl_orbs.size] = util::spawn_model(#"hash_53079af25eecf35b", var_181a390b.origin + (var_181a390b.radius, 0, 0), var_181a390b.angles);
        wait(0.1);
        self.a_mdl_orbs[self.a_mdl_orbs.size - 1] setscale(0.5);
        self.a_mdl_orbs[self.a_mdl_orbs.size - 1] ghost();
        self.a_mdl_orbs[self.a_mdl_orbs.size - 1].e_fx = util::spawn_model("tag_origin", self.a_mdl_orbs[self.a_mdl_orbs.size - 1].origin);
        wait(0.1);
        self.a_mdl_orbs[self.a_mdl_orbs.size - 1] linkto(var_181a390b);
        wait(0.1);
        self thread function_cd8e8b80(var_181a390b, self.a_mdl_orbs[self.a_mdl_orbs.size - 1]);
    }
    foreach (mdl_orb in self.a_mdl_orbs) {
        mdl_orb.e_owner = self;
        mdl_orb thread function_2a5d8845(self);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xe60b205, Offset: 0xc9e0
// Size: 0xce
function function_9550923e() {
    switch (self.var_7e977a12) {
    case 0:
        var_b77578d8 = array(self.a_s_dog, self.var_2e4e85c5);
        break;
    case 1:
        var_b77578d8 = array(self.var_581a505b, self.var_29db796e);
        break;
    case 2:
        var_b77578d8 = array(self.var_ace3e8e6, self.var_4c4255a3);
        break;
    }
    return var_b77578d8;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xd96e088, Offset: 0xcab8
// Size: 0x17a
function function_e9df185f() {
    level endon(#"hash_3e765c26047c9f54");
    self endon(#"death", #"destroyed");
    while (true) {
        self waittill(#"hash_4da63fe4689abc76");
        playsoundatposition(#"hash_2148316d1fd4d8d4", self.origin + (0, 0, 25));
        if (!level.var_e9eb81d7) {
            level.var_e9eb81d7 = 1;
            level.var_74e399d7 = self;
            level thread zm_vo::function_7622cb70(#"hash_318af4ddcfa6d2d7");
        } else if (!level.var_8c011b28 && self != level.var_74e399d7) {
            level.var_8c011b28 = 1;
            level thread zm_vo::function_7622cb70(#"hash_5928b946f83c46b");
        }
        if (self.var_9bfb3ba) {
            self.n_rate -= 0.25;
            self.var_9bfb3ba--;
            if (self.var_9bfb3ba < 1) {
                break;
            }
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x4917b26e, Offset: 0xcc40
// Size: 0xcc
function function_ebb95a0d() {
    self endon(#"death", #"destroyed");
    self flag::wait_till(#"hash_28e0be8a85b0be77");
    if (!level.var_6d18ddab) {
        level.var_6d18ddab = 1;
        level thread zm_vo::function_7622cb70(#"hash_59e13c81d0a51e58");
    }
    self val::set("crystal", "takedamage", 1);
    self thread function_e255e996();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x6b8f274b, Offset: 0xcd18
// Size: 0x348
function function_8e1ce89a() {
    level endon(#"hash_3e765c26047c9f54");
    self endon(#"death", #"destroyed");
    self flag::wait_till(#"hash_60b2f597116f5ae");
    self flag::clear(#"hash_454130aa51c71a1a");
    self thread function_975ee8a1();
    self thread function_d341296a();
    self.a_s_spawners = array::randomize(self.var_b77578d8);
    self.a_s_spawns = arraycombine(self.a_s_spawners[0], self.a_s_spawners[1]);
    self.a_s_spawns = arraycombine(self.a_s_spawns, self.a_s_zombie);
    self.e_spawner = getentarray("zombie_spawner", "script_noteworthy")[0];
    i = 0;
    while (true) {
        if (self.var_80164102 < 12 && self flag::get(#"hash_60b2f597116f5ae") && self flag::get(#"hash_148b5949f208f189")) {
            s_spot = self.a_s_spawns[i];
            ai_zombie = self function_1e31497f(s_spot);
            wait(0.1);
            if (isdefined(ai_zombie)) {
                i++;
                if (i >= self.a_s_spawns.size) {
                    i = 0;
                    self.a_s_spawns = array::randomize(self.a_s_spawns);
                }
                self.var_80164102++;
                ai_zombie.mdl_crystal = self;
                ai_zombie zm_score::function_acaab828();
                ai_zombie callback::function_d8abfc3d(#"on_ai_killed", &function_b3791df9);
                ai_zombie thread function_b3bf446e(self.a_str_adj_zones);
                ai_zombie thread function_69503077();
                ai_zombie zombie_utility::set_zombie_run_cycle("sprint");
                ai_zombie.ignore_enemy_count = 1;
                ai_zombie.b_ignore_cleanup = 1;
                ai_zombie.n_id = self.n_id;
            }
        }
        wait(randomfloatrange(1, 1.5));
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xe4c8b51f, Offset: 0xd068
// Size: 0x54
function function_b3791df9(*params) {
    if (isdefined(self.archetype) && isdefined(self.mdl_crystal)) {
        self.mdl_crystal thread function_ba3369d5(self.archetype);
    }
    self.mdl_crystal.var_80164102--;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xe2974179, Offset: 0xd0c8
// Size: 0xda
function function_ba3369d5(str_archetype) {
    switch (str_archetype) {
    case #"raz":
        self.var_1bf25a28--;
        break;
    case #"zombie_dog":
        self.var_d3ab1e84--;
        break;
    case #"mimic":
        self.var_c1e479f3--;
        break;
    case #"soa":
        self.var_d5fdc9c--;
        break;
    case #"avogadro":
        self.var_8e259073--;
        break;
    case #"tormentor":
        self.var_ee5dbb09--;
        break;
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x348b781, Offset: 0xd1b0
// Size: 0x23e
function function_1e31497f(s_spot) {
    switch (s_spot.script_noteworthy) {
    case #"dog_location":
        if (self.var_d3ab1e84 < self.var_1fdd1dc7) {
            ai_zombie = zombie_dog_util::function_62db7b1c(1, s_spot);
            self.var_d3ab1e84++;
        }
        break;
    case #"raz_location":
        if (self.var_1bf25a28 < self.var_33199d58) {
            ai_zombie = namespace_ac4eb28f::spawn_single(1, s_spot);
            self.var_1bf25a28++;
        }
        break;
    case #"hash_2fe3f22c14b70850":
        if (self.var_d5fdc9c < self.var_6fc405f2) {
            ai_zombie = zm_ai_soa::function_e803632f(1, s_spot);
            self.var_d5fdc9c++;
        }
        break;
    case #"mimic":
        if (self.var_c1e479f3 < self.var_5e267965) {
            ai_zombie = zm_ai_mimic::spawn_single(s_spot);
            self.var_c1e479f3++;
        }
        break;
    case #"tempest":
        if (self.var_8e259073 < self.var_171665a9) {
            ai_zombie = zm_ai_avogadro::spawn_single(1, s_spot);
            self.var_8e259073++;
        }
        break;
    case #"tormentor":
        if (self.var_ee5dbb09 < self.var_ee4b6df0) {
            ai_zombie = namespace_abfee9ba::spawn_single(1, s_spot);
            self.var_ee5dbb09++;
        }
        break;
    }
    wait(0.1);
    if (!isdefined(ai_zombie)) {
        ai_zombie = zombie_utility::spawn_zombie(self.e_spawner, undefined, array::random(self.a_s_zombie), level.round_number);
        return ai_zombie;
    }
    return ai_zombie;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xd9beb163, Offset: 0xd3f8
// Size: 0x16c
function function_3b0cf79() {
    self endon(#"death", #"destroyed");
    level waittill(#"hash_3e765c26047c9f54");
    self flag::clear(#"hash_60b2f597116f5ae");
    self flag::set(#"hash_454130aa51c71a1a");
    foreach (orb in self.a_mdl_orbs) {
        if (isdefined(orb)) {
            orb dodamage(orb.health, orb.origin);
        }
    }
    wait(0.5);
    self thread function_e17174c2();
    if (!self flag::get(#"destroyed")) {
        self function_c821a64a();
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xd863a851, Offset: 0xd570
// Size: 0x168
function function_975ee8a1() {
    self endon(#"death", #"destroyed");
    while (true) {
        n_players = 0;
        foreach (str_zone in self.a_str_zones) {
            n_players += zm_zonemgr::get_players_in_zone(str_zone);
        }
        if (!n_players && self flag::get(#"hash_60b2f597116f5ae")) {
            self flag::clear(#"hash_60b2f597116f5ae");
            self flag::set(#"hash_454130aa51c71a1a");
            if (self.var_9bfb3ba) {
                self thread function_e17174c2();
            }
        }
        wait(1);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xdfd4b7e1, Offset: 0xd6e0
// Size: 0xae
function function_d341296a() {
    level endon(#"hash_3e765c26047c9f54");
    self endon(#"death", #"destroyed", #"hash_454130aa51c71a1a");
    while (true) {
        self flag::set(#"hash_148b5949f208f189");
        wait(45);
        self flag::clear(#"hash_148b5949f208f189");
        wait(20);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xa2cce23d, Offset: 0xd798
// Size: 0x302
function function_e255e996() {
    self endon(#"death");
    while (true) {
        s_result = self waittill(#"damage");
        if (isplayer(s_result.attacker) && isalive(s_result.attacker) && (is_true(s_result.weapon.name === #"ww_axe_gun_melee_t9") || is_true(s_result.weapon.name === #"ww_axe_gun_melee_t9_upgraded"))) {
            if (level.var_90acdb64) {
                level.var_90acdb64--;
                if (level.var_90acdb64 < 1) {
                    level flag::set(#"hash_717f6f193982a127");
                }
            }
            s_result.attacker util::show_hit_marker();
            self thread function_c821a64a();
            v_start = self.origin + (0, 0, 50);
            v_end = self.origin - (0, 0, 1000);
            a_trace = groundtrace(v_start, v_end, 0, self, 0);
            v_ground = isdefined(a_trace[#"position"]) ? a_trace[#"position"] : self.origin;
            self.origin = v_ground;
            util::wait_network_frame();
            self connectpaths();
            self thread function_e578b3ec();
            self function_379f0d71();
            self flag::set(#"destroyed");
            level thread function_d4808171(self);
            level thread function_a67ae8c3();
            break;
        }
        if (isdefined(s_result.amount)) {
            self.health += s_result.amount;
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xa5a1c24d, Offset: 0xdaa8
// Size: 0xd0
function function_a67ae8c3() {
    str_vo = array::random(level.var_d0c221e2);
    arrayremovevalue(level.var_d0c221e2, str_vo);
    foreach (player in function_a1ef346b()) {
        player thread zm_vo::function_c4303dda(str_vo);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xf435fae2, Offset: 0xdb80
// Size: 0x15a
function function_c821a64a() {
    if (self flag::get(#"destroyed")) {
        return;
    }
    self clientfield::set("" + #"hash_4d2911e91cdb1e91", 0);
    switch (self.n_id) {
    case 0:
        self setmodel("p9_fxanim_zm_tungsten_dark_aether_crystal_mod");
        self thread scene::play(#"hash_4b3d6ea055c23e20", self);
        break;
    case 1:
        self setmodel("p9_fxanim_zm_tungsten_dark_aether_crystal_street");
        self thread scene::play(#"hash_618e4ae852470b70", self);
        break;
    case 2:
        self setmodel("p9_fxanim_zm_tungsten_dark_aether_crystal_tunnel");
        self thread scene::play(#"hash_6e977fe653263d9f", self);
        break;
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x876eef2, Offset: 0xdce8
// Size: 0x100
function function_e578b3ec() {
    level endon(#"hash_22a51e8b22086fc6" + self.n_id);
    wait(0.5);
    while (true) {
        var_b8e3924c = function_3d102402(#"item_zmquest_tungsten_mq_quest_part_shard", self.origin + (0, 0, 40), (90, 0, 0), 0);
        waitframe(1);
        if (isdefined(var_b8e3924c)) {
            var_b8e3924c.n_id = self.n_id;
            var_b8e3924c.script_noteworthy = "crystal_shard";
            var_b8e3924c clientfield::set("" + #"crystal_shard", 1);
            var_b8e3924c waittill(#"death");
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x94bba78b, Offset: 0xddf0
// Size: 0x24
function function_379f0d71() {
    level thread zm_utility::function_9ad5aeb1(0, 1, 0, 0);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x0
// Checksum 0x5ae2b431, Offset: 0xde20
// Size: 0x234
function function_8c6858aa() {
    if (isdefined(self.stub.related_parent.n_id)) {
        level endon(#"hash_1739a8d2d0ccbeb1" + self.stub.related_parent.n_id);
    }
    while (true) {
        s_waitresult = self waittill(#"trigger");
        if (zm_utility::is_player_valid(s_waitresult.activator) && !is_true(s_waitresult.activator.var_c8f9547a)) {
            s_waitresult.activator namespace_1cc7b406::give_equipment(#"hash_7c7d437280e992b", 1);
            s_waitresult.activator.n_id = self.stub.related_parent.n_id;
            s_waitresult.activator.var_c8f9547a = 1;
            self playsound(#"hash_3a2f974f67a11864");
            mdl_crystal = self.stub.related_parent.mdl_crystal;
            if (isdefined(self.stub.related_parent)) {
                self.stub.related_parent delete();
            }
            mdl_crystal thread function_e578b3ec();
            if (!level.var_daabc5cb) {
                level.var_daabc5cb = 1;
                level thread zm_tungsten_vo::function_d137d6a0(#"hash_6cf88156e2cece4a", #"hash_2179d2c05c59fcd4", #"hash_5ee09ee0c21e867c");
            }
            zm_unitrigger::unregister_unitrigger(self.stub);
            break;
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xf575e93d, Offset: 0xe060
// Size: 0x12c
function on_grenade_fired(s_params) {
    if (isdefined(s_params.projectile) && s_params.weapon.name === #"eq_crystal_grenade") {
        s_params.projectile endon(#"death");
        s_params.projectile clientfield::set("" + #"crystal_grenade", 1);
        self.var_c8f9547a = undefined;
        s_result = s_params.projectile waittill(#"grenade_bounce");
        s_params.projectile clientfield::set("" + #"crystal_grenade", 0);
        waitframe(1);
        if (isdefined(s_params.projectile)) {
            s_params.projectile delete();
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x19942cc4, Offset: 0xe198
// Size: 0xc4
function function_7fbe7e0f() {
    self endon(#"death");
    while (true) {
        s_result = self waittill(#"damage");
        if (s_result.weapon.name === #"eq_crystal_grenade" && isdefined(s_result.position)) {
            if (self function_248b9cef(s_result.position)) {
                self thread function_d321a931(s_result.attacker);
                break;
            }
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xc2716b62, Offset: 0xe268
// Size: 0xb8
function function_248b9cef(v_loc) {
    foreach (var_6dd77fd0 in self.var_eb56e6b6) {
        if (distancesquared(self gettagorigin(var_6dd77fd0), v_loc) <= 900) {
            return true;
        }
    }
    return false;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x8d4c6340, Offset: 0xe328
// Size: 0xac
function function_72989645() {
    if (self haspart("tag_fx_jaw_center") || self haspart("tag_fx_jaw_center") || self haspart("tag_fx_jaw_center")) {
        self.var_eb56e6b6 = array("tag_fx_jaw_center", "tag_fx_jaw_le", "tag_fx_jaw_ri");
        self thread function_7fbe7e0f();
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x6d95d0b0, Offset: 0xe3e0
// Size: 0x11c
function function_d4808171(mdl_crystal) {
    v_pos = getclosestpointonnavmesh(array::random(mdl_crystal.var_9e7631bd).origin, 100, 80);
    if (isdefined(v_pos)) {
        v_spawnpt = v_pos;
    } else {
        v_spawnpt = mdl_crystal.origin;
    }
    s_spot = spawnstruct();
    s_spot.origin = v_spawnpt;
    ai_abomination = zombie_utility::spawn_zombie(level.abom_spawner, "abom", s_spot, level.round_number);
    wait(0.1);
    if (isdefined(ai_abomination)) {
        ai_abomination.ignore_enemy_count = 1;
    }
    s_spot struct::delete();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xd93e6112, Offset: 0xe508
// Size: 0x196
function function_d321a931(attacker) {
    self endon(#"death", #"hash_711423415ecfe2a9");
    if (is_true(self.var_ab398b8b)) {
        return;
    }
    if (isdefined(attacker.n_id) && level flag::get(#"hash_1739a8d2d0ccbeb1" + attacker.n_id)) {
        return;
    }
    if (isdefined(attacker.n_id)) {
        self.ignore_nuke = 1;
        self.var_126d7bef = 1;
        self.b_ignore_cleanup = 1;
        attacker.var_c8f9547a = undefined;
        self.n_id = attacker.n_id;
        self.var_ab398b8b = 1;
        self clientfield::increment("" + #"hash_6f2c45f149dc1e5d");
        self thread function_47104ac4();
        self thread animation::play("aib_t9_zm_abom_swallow_crystal_01");
        if (!level.var_864319a5) {
            level.var_864319a5 = 1;
            level thread function_c7695f6f();
        }
        self notify(#"hash_711423415ecfe2a9");
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x7b1fbfcb, Offset: 0xe6a8
// Size: 0x4c
function function_c7695f6f() {
    wait(0.5);
    level thread zm_tungsten_vo::function_d137d6a0(#"hash_41846be30e8383e", #"hash_9e8d134b3da220", #"hash_5963cef798b3fd18");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x636b29cd, Offset: 0xe700
// Size: 0x1dc
function function_47104ac4() {
    n_id = self.n_id;
    self waittill(#"death");
    v_org = self.origin;
    if (level flag::get(#"hash_1739a8d2d0ccbeb1" + n_id)) {
        return;
    }
    v_pos = getclosestpointonnavmesh(self.origin, 500, 80);
    wait(0.5);
    if (isdefined(v_pos)) {
        var_e1622660 = function_3d102402(#"item_zmquest_tungsten_mq_quest_part_catalyzed", v_pos + (0, 0, 32), (90, 0, 0), 0);
    } else {
        var_e1622660 = function_3d102402(#"item_zmquest_tungsten_mq_quest_part_catalyzed", v_org + (0, 0, 32), (90, 0, 0), 0);
    }
    util::wait_network_frame();
    if (isdefined(var_e1622660)) {
        var_e1622660.n_id = n_id;
        var_e1622660 clientfield::increment("" + #"hash_1b9d966608efb40e");
        var_e1622660 thread function_7e49a9ae();
        level flag::set(#"hash_1739a8d2d0ccbeb1" + n_id);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x7e1a7a4, Offset: 0xe8e8
// Size: 0x204
function function_7e49a9ae() {
    n_id = self.n_id;
    self waittill(#"death");
    level thread function_8b429de9(n_id);
    wait(randomintrangeinclusive(15, 30));
    var_9e4bdaed = 0;
    a_zombies = getaiarray();
    foreach (zombie in a_zombies) {
        if (zombie.aitype === #"spawner_bo5_abom") {
            var_9e4bdaed++;
        }
    }
    if (!level flag::get(#"hash_22a51e8b22086fc6" + n_id) && var_9e4bdaed < 2) {
        foreach (var_d1d168de in level.var_999868f3) {
            if (var_d1d168de.n_id === n_id) {
                mdl_crystal = var_d1d168de;
            }
        }
        if (isdefined(mdl_crystal)) {
            function_d4808171(mdl_crystal);
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xe82f7c4b, Offset: 0xeaf8
// Size: 0x1b4
function function_8b429de9(n_id) {
    if (level flag::get(#"hash_1739a8d2d0ccbeb1" + n_id)) {
        level flag::clear(#"hash_1739a8d2d0ccbeb1" + n_id);
    }
    wait(0.1);
    if (level flag::get(#"hash_22a51e8b22086fc6" + n_id)) {
        return;
    }
    if (!isdefined(level.var_ff8c3051)) {
        level.var_ff8c3051 = 1;
        level thread zm_tungsten_vo::function_d137d6a0(#"hash_6e60f8d4d0024e8", #"hash_3d4fbc481be0d8ee", #"hash_3bfd98fa2a76515e");
        return;
    }
    if (isdefined(level.var_793ade71) && level.var_793ade71.size > 0) {
        n_index = array::random(level.var_793ade71);
        if (isdefined(n_index)) {
            arrayremovevalue(level.var_793ade71, n_index);
            level thread zm_tungsten_vo::function_d137d6a0(#"hash_2f678fab7f6b0fd2" + n_index, #"hash_68f92184143798ea" + n_index, #"hash_13f2461be9ad9ee" + n_index);
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x3b3b5491, Offset: 0xecb8
// Size: 0x9a
function function_90996ced(*player) {
    if (level flag::get(#"hash_77e125d6f8b2733e")) {
        return true;
    } else {
        if (!level.var_c59392fa) {
            level.var_c59392fa = 1;
            level thread zm_tungsten_vo::function_d137d6a0(#"hash_2b81b9c79a3e14fa", #"hash_169bb9dc4c056704", #"hash_17786d8ce3c106cc");
        }
        return false;
    }
    return false;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x0
// Checksum 0x31d186b, Offset: 0xed60
// Size: 0x248
function function_43c88b79() {
    while (true) {
        s_waitresult = self waittill(#"trigger");
        if (zm_utility::is_player_valid(s_waitresult.activator) && level flag::get(#"hash_77e125d6f8b2733e")) {
            n_id = self.stub.related_parent.n_id;
            level flag::set(#"hash_22a51e8b22086fc6" + n_id);
            level thread function_b6f5ae25();
            foreach (player in getplayers()) {
                player zm_weapons::weapon_take(level.var_1e477e6c);
                player.var_c8f9547a = undefined;
            }
            if (isdefined(self.stub.related_parent)) {
                self.stub.related_parent delete();
            }
            level thread function_e408d81(n_id);
            zm_unitrigger::unregister_unitrigger(self.stub);
            break;
        }
        if (!level.var_c59392fa) {
            level.var_c59392fa = 1;
            level thread zm_tungsten_vo::function_d137d6a0(#"hash_2b81b9c79a3e14fa", #"hash_169bb9dc4c056704", #"hash_17786d8ce3c106cc");
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x2df68046, Offset: 0xefb0
// Size: 0x110
function function_e408d81(n_id) {
    level flag::wait_till(#"hash_22a51e8b22086fc6" + n_id);
    var_60f945b7 = getentarray("crystal_shard", "script_noteworthy");
    foreach (shard in var_60f945b7) {
        if (shard.n_id === n_id) {
            shard notify(#"done");
            if (isdefined(shard)) {
                shard delete();
            }
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x138f419a, Offset: 0xf0c8
// Size: 0xdc
function function_b6f5ae25() {
    level.var_1f7f9ebe++;
    if (level.var_1f7f9ebe === 2) {
        zm_tungsten_vo::function_d137d6a0(#"hash_50aa78b55b72fc5", #"hash_33ce49529b635e45", #"hash_626f2a598b399499");
        return;
    }
    if (level.var_1f7f9ebe === 1) {
        array::thread_all(function_a1ef346b(), &zm_intel::collect_intel, #"zmintel_tungsten_darkaether_artifact_4");
        zm_vo::function_7622cb70(#"hash_752068cdf74086e9");
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x9db95d77, Offset: 0xf1b0
// Size: 0x2c
function function_28eb7fe5() {
    wait(1);
    zm_vo::function_7622cb70(#"hash_794b50df34e72a9a");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x413c05db, Offset: 0xf1e8
// Size: 0xbc
function function_2a5d8845(mdl_crystal) {
    self endon(#"death");
    mdl_crystal endon(#"death");
    self val::set("crystal_orb", "takedamage", 1);
    self val::set("crystal_orb", "allowdeath", 1);
    self.health = 300;
    self thread function_694e280();
    self thread function_bc91db26();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xd443d6ca, Offset: 0xf2b0
// Size: 0xec
function function_182e8559(*str_notify) {
    if (isdefined(self)) {
        self.e_fx clientfield::set("" + #"hash_5b48c7bf93fc3a4b", 0);
        self.e_owner notify(#"hash_4da63fe4689abc76");
        if (self.e_owner.var_9bfb3ba < 1) {
            self.e_owner flag::set(#"hash_28e0be8a85b0be77");
        }
        wait(0.1);
        if (isdefined(self.e_fx)) {
            self.e_fx delete();
        }
        if (isdefined(self)) {
            self delete();
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xe4292fbf, Offset: 0xf3a8
// Size: 0x160
function function_694e280() {
    self endoncallback(&function_182e8559, #"death");
    while (true) {
        a_zombies = undefined;
        wait(3);
        while (!isdefined(a_zombies)) {
            a_zombies = getaiteamarray(level.zombie_team);
            wait(0.1);
        }
        foreach (zombie in a_zombies) {
            if (zombie.archetype === #"zombie") {
                n_health = zombie.health * 2;
                break;
            }
        }
        if (isdefined(self) && isdefined(n_health)) {
            self.health = n_health;
        }
        level waittill(#"start_of_round");
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xcb8c9527, Offset: 0xf510
// Size: 0x148
function function_bc91db26() {
    self endon(#"death");
    level endon(#"hash_3e765c26047c9f54");
    while (isdefined(self) && self.health > 0) {
        s_result = self waittill(#"damage");
        if (isplayer(s_result.attacker) && isalive(s_result.attacker)) {
            s_result.attacker util::show_hit_marker();
            if (!self.e_owner flag::get(#"hash_60b2f597116f5ae")) {
                self.e_owner flag::set(#"hash_60b2f597116f5ae");
            }
            if (!level.var_2961befd) {
                level.var_2961befd = 1;
                level thread function_2fa3d84f();
            }
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xae348b7e, Offset: 0xf660
// Size: 0x110
function function_2fa3d84f() {
    str_vo = array::random(array(#"hash_3d72e6f276957956", #"hash_3d72e7f276957b09", #"hash_3d72e4f2769575f0", #"hash_3d72e5f2769577a3", #"hash_3d72eaf276958022"));
    foreach (player in getplayers()) {
        player thread zm_vo::function_c4303dda(str_vo);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x128dc943, Offset: 0xf778
// Size: 0x142
function function_cd8e8b80(var_181a390b, mdl_orb) {
    self endon(#"death");
    mdl_orb endon(#"death");
    var_181a390b endon(#"death");
    self.n_rate = 1;
    mdl_orb.e_fx clientfield::set("" + #"hash_5b48c7bf93fc3a4b", 1);
    mdl_orb.e_fx linkto(mdl_orb, undefined, (0, 0, 18));
    wait(var_181a390b.n_delay);
    while (true) {
        if (!var_181a390b.n_delay) {
            var_181a390b rotateroll(-90, self.n_rate);
        } else {
            var_181a390b rotateroll(90, self.n_rate);
        }
        wait(self.n_rate - 0.05);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x58b771ef, Offset: 0xf8c8
// Size: 0x54
function function_dd0ca999(b_skipped) {
    if (b_skipped) {
        return;
    }
    level flag::wait_till(#"hash_45d1ea5a016b7916");
    /#
        iprintlnbold("lgtexp_cin_zm_amerika_mid_sh200");
    #/
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x2d0588ee, Offset: 0xf928
// Size: 0xec
function function_73076ac9(b_skipped, var_19e802fa) {
    if (b_skipped || var_19e802fa) {
        level flag::set(#"hash_331ca6d639f4883d");
        level flag::set(#"hash_21844688fcfdffe4");
        level flag::set(#"hash_717f6f193982a127");
        level flag::set(#"hash_45d1ea5a016b7916");
        level zm_ui_inventory::function_7df6bb60(#"hash_4273532945cef4b0", 4);
    }
    level flag::set(#"hash_45d1ea5a016b7916");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x80ab062d, Offset: 0xfa20
// Size: 0xb4
function escort_setup(b_skipped) {
    if (b_skipped) {
        return;
    }
    level thread function_2073cf2f();
    level thread function_d4c62e3d();
    level thread function_7b087186();
    level thread function_f03b2c72();
    level flag::wait_till(#"hash_33aac7e159ca8f89");
    /#
        iprintlnbold("trigger_abom_smash");
    #/
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x3bc4b46a, Offset: 0xfae0
// Size: 0x5c
function function_e0567b44(b_skipped, var_19e802fa) {
    if (b_skipped || var_19e802fa) {
        /#
            namespace_95c839d1::function_14a35d6f();
        #/
    }
    level flag::set(#"hash_33aac7e159ca8f89");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xbc3f9c5d, Offset: 0xfb48
// Size: 0x160
function function_71926382() {
    level endon(#"rbz_exfil_started");
    level flag::wait_till(#"start_zombie_round_logic");
    zm_crafting::function_d1f16587("ztable_tungsten_neutralizer_device", &function_65b074ce);
    level flag::wait_till_all(array(#"hash_21844688fcfdffe4", #"hash_45d1ea5a016b7916"));
    level thread function_be62f260();
    foreach (player in getplayers()) {
        zm_items::player_pick_up(player, zm_crafting::get_component("zitem_tungsten_neutralizer_device_zm"));
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x0
// Checksum 0x7659d2ab, Offset: 0xfcb0
// Size: 0x7a
function function_7d260d0(*player) {
    if (level flag::get(#"hash_45d1ea5a016b7916")) {
        self sethintstring(#"hash_57381e8243f9e1d4");
        return 1;
    }
    self sethintstring(#"hash_64cb545dd18c607");
    return 1;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x99236cce, Offset: 0xfd38
// Size: 0xcc
function function_65b074ce(*var_1377a1e8) {
    level endon(#"rbz_exfil_started");
    s_device = struct::get(self.target);
    level thread function_ada90340();
    level flag::wait_till(#"hash_652d6448c4e0fd9b");
    level thread function_d89378e();
    level.mdl_device zm_unitrigger::create(&function_d285d2e5, 80, &function_24a32a6d);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x5a6ab018, Offset: 0xfe10
// Size: 0x8a
function function_d285d2e5(player) {
    if (!level flag::get(#"hash_22e95ce422f36713")) {
        self sethintstringforplayer(player, #"hash_75d22fd1a57d9a99");
        return 1;
    }
    self sethintstringforplayer(player, #"hash_1f74c6e83a487cab");
    return 1;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x2a325102, Offset: 0xfea8
// Size: 0xc4
function function_d89378e() {
    level endon(#"rbz_exfil_started");
    level flag::wait_till(#"hash_22e95ce422f36713");
    level.mdl_device thread function_1ddf7c10("tag_screen_full");
    level.mdl_device clientfield::set("" + #"hash_77d7a6f3a8842303", 1);
    level.mdl_device thread zm_vo::function_d6f8bbd9(#"hash_1550c0af5e37322b", undefined, undefined, 1);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x6b3ae4a5, Offset: 0xff78
// Size: 0xec
function function_24a32a6d() {
    level endon(#"rbz_exfil_started");
    while (true) {
        s_waitresult = self waittill(#"trigger");
        if (zm_utility::is_player_valid(s_waitresult.activator) && level flag::get(#"hash_22e95ce422f36713")) {
            level.var_fdf0d3fc thread function_c02f8acc();
            level thread function_7ba475a2();
            level thread function_4718251f();
            zm_unitrigger::unregister_unitrigger(self.stub);
            break;
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x644c995b, Offset: 0x10070
// Size: 0x21c
function function_be62f260() {
    level endon(#"rbz_exfil_started");
    level thread zm_vo::function_7622cb70(#"hash_33b8257a9869fa96");
    level flag::wait_till(#"hash_652d6448c4e0fd9b");
    zm_vo::function_7622cb70(#"hash_3db24cc3d4d62abd");
    zm_vo::function_7622cb70(#"hash_643db03576bae4af");
    playsoundatposition(#"hash_4b5114dc3a728de3", (5713, 5999, 935));
    exploder::exploder("lgt_fx_tower_explosion");
    wait(0.1);
    foreach (player in function_a1ef346b()) {
        playrumbleonposition("sr_prototype_generator_explosion", player.origin);
    }
    wait(1);
    zm_tungsten_vo::function_d137d6a0(#"hash_7aec9a847d0d9dee", #"hash_70cddb474ae3cad0", #"hash_643f7116d93e2ba8");
    wait(0.5);
    zm_vo::function_7622cb70(#"hash_49e005837257928b");
    level flag::set(#"hash_22e95ce422f36713");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xfe123c60, Offset: 0x10298
// Size: 0x21c
function function_ada90340() {
    s_device = struct::get("device");
    var_8a5cde88 = getent("vehicle_device", "targetname");
    level.var_fdf0d3fc = spawnvehicle(#"fake_vehicle", var_8a5cde88.origin, var_8a5cde88.angles);
    waitframe(1);
    level.var_fdf0d3fc thread function_dd5a203f();
    if (isdefined(s_device)) {
        level.mdl_device = util::spawn_model(#"hash_2730e79c7f028537", s_device.origin, s_device.angles);
    }
    waitframe(1);
    level flag::set(#"hash_652d6448c4e0fd9b");
    level.mdl_device val::set("escort", "takedamage", 0);
    level.mdl_device function_619a5c20();
    level.mdl_device clientfield::increment("" + #"hash_4b03e692ae3dfa64");
    level.mdl_device thread function_bc4f36d7();
    level.mdl_device.var_401b92e8 = array("tag_screen_25", "tag_screen_50", "tag_screen_full", "tag_screen_less");
    array::thread_all(function_a1ef346b(), &zm_intel::collect_intel, #"zmintel_tungsten_requiem_artifact_5");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x2fef0b2f, Offset: 0x104c0
// Size: 0x1ac
function function_dd5a203f() {
    self.var_aa4b496 = 0;
    self.var_265cb589 = 1;
    self.var_a123c71 = 0;
    self val::set("escort", "takedamage", 0);
    self.team = #"allies";
    s_door = struct::get("interact_door_town_square");
    self.str_zone = "zone_main_street_tunnel";
    var_b4e8228c = struct::get_array("zone_main_street_tunnel_02_spawns");
    var_e271c42 = struct::get_array("zone_main_street_03_spawns");
    var_d73d2e6f = struct::get_array("zone_main_street_04_spawns");
    var_1fe91dac = arraycombine(var_e271c42, var_b4e8228c);
    var_32174208 = arraycombine(var_1fe91dac, var_d73d2e6f);
    target_zone = level.zones[self.str_zone];
    self.a_s_spawns = var_32174208;
    self vehicle::get_on_path(getvehiclenode("node_start_device", "targetname"));
    self thread function_df4e6f32();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x8628f31f, Offset: 0x10678
// Size: 0xae
function function_df4e6f32() {
    self endon(#"death", #"reached_end_node");
    var_f2bbbcb4 = struct::get_array("zone_main_street_tunnel_spawns");
    var_b4e8228c = struct::get_array("zone_main_street_tunnel_02_spawns");
    var_1fe91dac = arraycombine(var_f2bbbcb4, var_b4e8228c);
    self waittill(#"switch");
    self.a_s_spawns = var_1fe91dac;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x121e540f, Offset: 0x10730
// Size: 0x1c0
function function_7ba475a2() {
    level endon(#"game_ended");
    level flag::set("in_dark_side");
    level flag::clear("rbz_exfil_allowed");
    if (level flag::get("rbz_exfil_beacon_active")) {
        if (isdefined(level.var_c5beea37) && isdefined(level.var_c5beea37.var_2d1ee75a)) {
            level.var_c5beea37.var_2d1ee75a zm_vote::function_3728d19b();
        }
        level flag::clear("rbz_exfil_beacon_active");
    }
    foreach (player in getplayers()) {
        if (isalive(player)) {
            player chopper_gunner::function_24fbd61e();
        }
    }
    level flag::set(#"hash_23d445a634bedeae");
    level notify(#"hash_1ca30bf3bc01d214");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xe085a92c, Offset: 0x108f8
// Size: 0x14c
function function_c8b3217e() {
    self endon(#"death");
    level endon(#"hash_1a21f991103bbd5d");
    while (true) {
        if (self.var_a5c9efc1 === 1) {
            n_dist = 250000;
        } else if (self.var_a5c9efc1 === 2) {
            n_dist = 140625;
        } else {
            n_dist = 62500;
        }
        foreach (player in function_a1ef346b()) {
            if (distance2dsquared(player.origin, self.origin) <= n_dist) {
                player.b_ignore_fow_damage = 1;
                continue;
            }
            player.b_ignore_fow_damage = 0;
        }
        wait(0.25);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xc6d6b792, Offset: 0x10a50
// Size: 0x120
function function_1e2224f5() {
    self endon(#"death");
    level endon(#"hash_5c1b510c0cd18144");
    var_48f01f34 = 1;
    var_e26a4af6 = 1;
    while (true) {
        if (self.var_1105889c >= 0.7 && self.var_1105889c < 0.85 && var_48f01f34) {
            var_e26a4af6 = 1;
            var_48f01f34 = 0;
            self zm_vo::function_d6f8bbd9(#"hash_285aea366a26cbe5");
        }
        if (self.var_1105889c >= 0.4 && self.var_1105889c < 0.6 && var_e26a4af6) {
            var_e26a4af6 = 0;
            var_48f01f34 = 1;
            self zm_vo::function_d6f8bbd9(#"hash_6e7b57447c9db2fa");
        }
        wait(0.1);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xbf963e1a, Offset: 0x10b78
// Size: 0x990
function function_c02f8acc() {
    self endon(#"death");
    level.mdl_device endon(#"death");
    n_zombies = level.zombie_ai_limit;
    level.disable_nuke_delay_spawning = 1;
    level flag::clear("spawn_zombies");
    self playsound(#"hash_50a878a81f6971b3");
    self.var_a123c71 = 0;
    self.var_f8edfabd = 0;
    self.var_59078fae = 0;
    self.var_de319661 = 100;
    self.var_fce6b9f4 = 100;
    self.str_zone = zm_zonemgr::get_zone_from_position(self.origin, 1, 1);
    level clientfield::set("" + #"hash_5a36f05cbdf2580", 12);
    level thread namespace_c097de49::function_8f85d169();
    music::setmusicstate("escort");
    level.mdl_device thread function_c8b3217e();
    level.mdl_device.var_a5c9efc1 = 1;
    level.mdl_device movez(40, 2);
    wait(1.95);
    level.mdl_device moveto(self.origin, 3);
    level.mdl_device clientfield::set("" + #"hash_6ba3e6fd544c34a5", 1);
    level.mdl_device playsound(#"hash_7ef122464223c4c5");
    wait(0.5);
    level thread zm_utility::function_9ad5aeb1(0, 1, 0, 0);
    level flag::set(#"in_dark_side");
    playrumbleonposition("sr_prototype_generator_explosion", level.mdl_device.origin);
    var_aaa9a919 = getent("main_street_clip", "targetname");
    if (isdefined(var_aaa9a919)) {
        var_aaa9a919 connectpaths();
    }
    mdl_debris = getent("mainstreet_debris", "targetname");
    mdl_debris thread scene::play(#"hash_49d9e1d456ebd4a9", mdl_debris);
    level flag::set("main_street_tunnel_open");
    wait(0.1);
    if (isdefined(var_aaa9a919)) {
        var_aaa9a919 delete();
    }
    level.mdl_device waittill(#"movedone");
    waitframe(1);
    level.mdl_device linkto(self, undefined, (0, 0, 0), (0, -90, 0));
    level.mdl_device.e_parent = self;
    wait(0.1);
    level.mdl_device thread function_28eb7fe5();
    self setspeedimmediate(0);
    self thread vehicle::go_path();
    self thread function_b2897fd3();
    self thread function_bc00d546();
    self thread function_5732ebe3();
    self.var_cd2c36da = spawn("trigger_radius_use", self.origin + (0, 0, 16), 0, 80, 80, 1);
    self.var_cd2c36da setcursorhint("HINT_NOICON");
    self.var_cd2c36da usetriggerrequirelookat(1);
    self.var_cd2c36da triggerignoreteam();
    self.var_cd2c36da enablelinkto();
    self.var_cd2c36da linkto(self, "tag_origin");
    self.var_cd2c36da thread function_7d757c5b();
    self thread function_83c7caee();
    level thread zm_utility::function_9ad5aeb1(1, 1, 1, 0);
    wait(1);
    level.var_b54157cf = 1;
    foreach (player in getplayers()) {
        player.var_45ef153 = 1;
        player.var_1a4a768c = 1;
    }
    level.mdl_device thread function_1e2224f5();
    self thread function_95015f9a(n_zombies);
    while (true) {
        self.b_proximity = 1;
        self.n_players = 0;
        if (level.mdl_device.var_a5c9efc1 === 1) {
            n_dist = 250000;
        } else if (level.mdl_device.var_a5c9efc1 === 2) {
            n_dist = 140625;
        } else {
            n_dist = 62500;
        }
        foreach (player in function_a1ef346b()) {
            if (distance2dsquared(player.origin, self.origin) > n_dist || !zm_utility::is_player_valid(player)) {
                self.b_proximity = 0;
            }
        }
        wait(0.25);
        if (!self.b_proximity || is_true(self.abnormal_status.emped) || !self.var_fce6b9f4) {
            self setspeed(0, 5, 3);
            self notify(#"hash_4e0c5de3e24d5af8");
            if (is_true(self.var_a123c71)) {
                self playsound(#"hash_5680f14366ba7aa5");
                self.var_a123c71 = 0;
            }
            continue;
        }
        self notify(#"hash_d2f2236898d7b64");
        self setspeed(3, 2, 1);
        if (!is_true(self.var_a123c71)) {
            self playsound(#"hash_523a36c12a3dc59d");
            self.var_a123c71 = 1;
        }
        if (self.var_fce6b9f4) {
            self.var_fce6b9f4 -= 1;
            level.mdl_device clientfield::increment("" + #"hash_36fbe21deb0433d8");
        }
        if (self.var_59078fae) {
            self.var_59078fae = 0;
            self connectpaths();
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x19cce695, Offset: 0x11510
// Size: 0x112
function function_7d757c5b() {
    level endon(#"hash_5c1b510c0cd18144");
    while (true) {
        foreach (player in function_a1ef346b()) {
            if (is_true(player.var_a74ce90c)) {
                self sethintstringforplayer(player, #"hash_3469f9b4e1b6241d");
                continue;
            }
            self sethintstringforplayer(player, "");
        }
        waitframe(1);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x9694f6ba, Offset: 0x11630
// Size: 0x2a6
function function_83c7caee() {
    level endon(#"hash_5c1b510c0cd18144");
    self endon(#"death", #"reached_end_node");
    while (true) {
        s_result = self.var_cd2c36da waittill(#"trigger");
        if (zm_utility::is_player_valid(s_result.activator) && is_true(s_result.activator.var_a74ce90c)) {
            level.mdl_device clientfield::increment("" + #"hash_2ad0f9c6cbc5eed");
            s_result.activator.var_a74ce90c = undefined;
            if (s_result.activator clientfield::get_to_player("" + #"hash_1509a2aa5d40a44c")) {
                s_result.activator clientfield::set_to_player("" + #"hash_1509a2aa5d40a44c", 0);
            }
            s_result.activator function_bc82f900("damage_heavy");
            if (!level.mdl_device.e_parent.var_fce6b9f4) {
                level.mdl_device thread zm_vo::function_d6f8bbd9(#"hash_2f866dec2871d934");
            }
            if (level.mdl_device.e_parent.var_fce6b9f4 < level.mdl_device.e_parent.var_de319661) {
                level.mdl_device.e_parent.var_fce6b9f4 += 40;
                if (level.mdl_device.e_parent.var_fce6b9f4 > level.mdl_device.e_parent.var_de319661) {
                    level.mdl_device.e_parent.var_fce6b9f4 = level.mdl_device.e_parent.var_de319661;
                }
            }
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x19e967c9, Offset: 0x118e0
// Size: 0xbc
function function_5732ebe3() {
    self endon(#"death");
    self waittill(#"hash_7fbe2660a81c5667");
    zm_vo::function_7622cb70(#"hash_a4d87c4b79e93d");
    self waittill(#"half");
    zm_vo::function_7622cb70(#"hash_93d57c4b6b70f1");
    self waittill(#"hash_13c0437f438490d8");
    zm_vo::function_7622cb70(#"hash_9ac47c4b7172bc");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x64f72743, Offset: 0x119a8
// Size: 0x25c
function function_bc00d546() {
    self endon(#"death");
    self waittill(#"reached_end_node");
    level notify(#"hash_5c1b510c0cd18144");
    level flag::set(#"hash_5c1b510c0cd18144");
    str_zone = zm_zonemgr::get_zone_from_position(self.origin, 1, 1);
    level thread zm_utility::function_9ad5aeb1(0, 1, 0, 0);
    music::setmusicstate("");
    level.mdl_device clientfield::set("" + #"hash_6ba3e6fd544c34a5", 0);
    level.mdl_device clientfield::set("" + #"hash_77d7a6f3a8842303", 0);
    level.mdl_device playsound(#"hash_1c8b9b9e4a1275c1");
    level.mdl_device unlink();
    wait(3);
    level.mdl_device playsound(#"hash_7053c73b9bb95889");
    level.mdl_device physicslaunch(level.mdl_device gettagorigin("tag_monitor"), (-5, -25, 5));
    level.mdl_device thread zm_vo::function_d6f8bbd9(#"hash_50b84c7dd7bfb1e3");
    level.mdl_device thread function_1ddf7c10("tag_screen_less");
    level flag::wait_till(#"hash_1a21f991103bbd5d");
    level thread door_town_square();
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x20d53e95, Offset: 0x11c10
// Size: 0x2e8
function function_b2897fd3() {
    self endon(#"death", #"reached_end_node");
    var_1105889c = self.var_fce6b9f4 / self.var_de319661;
    while (true) {
        wait(1);
        var_1105889c = self.var_fce6b9f4 / self.var_de319661;
        level.mdl_device.var_1105889c = var_1105889c;
        if (var_1105889c > 0.5) {
            if (level.mdl_device clientfield::get("" + #"hash_6ba3e6fd544c34a5") !== 1) {
                level.mdl_device clientfield::set("" + #"hash_6ba3e6fd544c34a5", 1);
                level.mdl_device.var_a5c9efc1 = 1;
                level.mdl_device thread function_1ddf7c10("tag_screen_full");
            }
            continue;
        }
        if (var_1105889c <= 0.5 && var_1105889c >= 0.25) {
            if (level.mdl_device clientfield::get("" + #"hash_6ba3e6fd544c34a5") !== 2) {
                level.mdl_device clientfield::set("" + #"hash_6ba3e6fd544c34a5", 2);
                level.mdl_device.var_a5c9efc1 = 2;
                level.mdl_device thread function_1ddf7c10("tag_screen_50");
            }
            continue;
        }
        if (var_1105889c > 0) {
            if (level.mdl_device clientfield::get("" + #"hash_6ba3e6fd544c34a5") !== 3) {
                level.mdl_device clientfield::set("" + #"hash_6ba3e6fd544c34a5", 3);
                level.mdl_device.var_a5c9efc1 = 3;
                level.mdl_device thread function_1ddf7c10("tag_screen_25");
            }
            continue;
        }
        level.mdl_device thread function_1ddf7c10("tag_screen_less");
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x59f1d07a, Offset: 0x11f00
// Size: 0x1e8
function function_95015f9a(n_zombies) {
    self endon(#"death", #"reached_end_node");
    self.a_s_spawns = array::randomize(self.a_s_spawns);
    i = 0;
    while (true) {
        s_spawnpt = self.a_s_spawns[i];
        if (isdefined(s_spawnpt) && function_e1403814() < n_zombies) {
            ai_zombie = zombie_utility::spawn_zombie(function_7002478(), undefined, s_spawnpt, level.round_number);
        }
        wait(0.1);
        if (isdefined(ai_zombie)) {
            i++;
            ai_zombie thread zm_score::function_acaab828();
            ai_zombie clientfield::increment("" + #"hash_11839f68b17da97a");
            ai_zombie.ignore_enemy_count = 1;
            if (ai_zombie.zombie_move_speed !== "super_sprint") {
                ai_zombie zombie_utility::set_zombie_run_cycle("sprint");
            }
            if (i >= self.a_s_spawns.size) {
                i = 0;
                self.a_s_spawns = array::randomize(self.a_s_spawns);
                wait(5);
            }
        }
        wait(randomfloatrange(0.5, 1));
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x15ccf1c9, Offset: 0x120f0
// Size: 0x138
function function_d4c62e3d() {
    var_d56fdb6 = struct::get_array(#"hash_8b320c6cb413f97");
    level.var_99018b7a = [];
    for (i = 0; i < var_d56fdb6.size; i++) {
        level.var_99018b7a[level.var_99018b7a.size] = util::spawn_model(var_d56fdb6[i].model, var_d56fdb6[i].origin, var_d56fdb6[i].angles);
    }
    wait(0.1);
    foreach (mdl_crystal in level.var_99018b7a) {
        mdl_crystal thread function_843a2c7e();
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x4cc87dd0, Offset: 0x12230
// Size: 0x13c
function function_843a2c7e() {
    self endon(#"death");
    self val::set(#"hash_7215c772b9355b8f", "ignoreme", 1);
    self val::set(#"hash_7215c772b9355b8f", "takedamage", 1);
    self.health = 5;
    self clientfield::set("" + #"hash_54a76d632c7c51", 1);
    if (self.script_int === 1) {
        str_scene = "p9_zm_gold_sur_crystal_medium_01_bundle";
        self.var_86bb28cd = #"hash_3c3c40375febff35";
    } else {
        str_scene = "p9_zm_gold_sur_crystal_medium_02_bundle";
        self.var_86bb28cd = #"hash_50aa2075dbc5e6e0";
    }
    self thread scene::play(str_scene, self);
    level thread function_8265e656(self);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xb5cd4415, Offset: 0x12378
// Size: 0x84
function function_c9d75a2e() {
    level endon(#"hash_5c1b510c0cd18144");
    wait(60);
    while (isdefined(self.var_b8e3924c)) {
        wait(1);
    }
    wait(60);
    if (isdefined(self)) {
        self setmodel(#"hash_44dfd29196ca201c");
    }
    waitframe(1);
    if (isdefined(self)) {
        self thread function_843a2c7e();
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x190f3cc0, Offset: 0x12408
// Size: 0x11c
function function_8265e656(mdl_crystal) {
    mdl_crystal endon(#"death");
    mdl_crystal callback::function_d8abfc3d(#"hash_5f0caa4b2d44fedf", &function_1cabf2e9);
    while (isdefined(mdl_crystal)) {
        s_result = mdl_crystal waittill(#"damage", #"death");
        if (isplayer(s_result.attacker) && isalive(s_result.attacker)) {
            s_result.attacker util::show_hit_marker();
            break;
        }
    }
    mdl_crystal callback::callback(#"hash_5f0caa4b2d44fedf", s_result);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x44ef48b, Offset: 0x12530
// Size: 0x124
function function_1cabf2e9(s_result) {
    if (isplayer(s_result.attacker) || isai(s_result.attacker) || isvehicle(s_result.attacker)) {
        if (isdefined(self)) {
            self setmodel(self.var_86bb28cd);
            self connectpaths();
            self thread function_84ddb230();
            self thread function_c9d75a2e();
            self clientfield::set("" + #"hash_54a76d632c7c51", 0);
            playsoundatposition(#"hash_54c5c342b84cf845", self.origin);
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x353b63e7, Offset: 0x12660
// Size: 0xa4
function function_84ddb230() {
    var_b8e3924c = function_3d102402(#"item_zmquest_tungsten_mq_quest_part_refuel", self.origin + (0, 0, 32), (90, 0, 0), 0);
    self.var_b8e3924c = var_b8e3924c;
    waitframe(1);
    if (isdefined(var_b8e3924c)) {
        var_b8e3924c clientfield::increment("" + #"hash_1b9d966608efb40e");
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xa0b220ab, Offset: 0x12710
// Size: 0xbc
function function_e655e275() {
    self endon(#"death");
    mdl_cage = util::spawn_model(#"hash_e05c1b39403d7b2");
    if (self haspart("tag_stowed_back")) {
        mdl_cage linkto(self, "tag_stowed_back");
        return;
    }
    mdl_cage linkto(self, undefined, (-12, 0, 45), (-5, 0, 0));
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x1fec3752, Offset: 0x127d8
// Size: 0x1a0
function function_7b087186() {
    level flag::wait_till(#"hash_5c1b510c0cd18144");
    function_4718251f();
    trigger::wait_till("trigger_tunnel_end");
    var_c89beff = getent("clip_tunnel_end", "targetname");
    var_c89beff setvisibletoall();
    level flag::set(#"hash_1a21f991103bbd5d");
    wait(0.5);
    foreach (player in getplayers()) {
        player.b_ignore_fow_damage = 0;
        if (player clientfield::get_to_player("" + #"hash_1509a2aa5d40a44c")) {
            player clientfield::set_to_player("" + #"hash_1509a2aa5d40a44c", 0);
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x5407120e, Offset: 0x12980
// Size: 0x594
function function_3eb5183() {
    var_c1f80780 = struct::get_array(#"hash_6ed57be36f241c4e");
    var_7594f81c = struct::get_array(#"hash_564a02bdac4a92fd");
    foreach (var_54961156 in var_c1f80780) {
        var_d0d7a17e = util::spawn_model(var_54961156.model, var_54961156.origin, var_54961156.angles);
        waitframe(1);
        if (isdefined(var_d0d7a17e)) {
            var_d0d7a17e clientfield::set("" + #"hash_55456562f670860", 1);
        }
    }
    foreach (var_49af023b in var_7594f81c) {
        var_9ff72f0c = util::spawn_model(var_49af023b.model, var_49af023b.origin, var_49af023b.angles);
        waitframe(1);
        if (isdefined(var_9ff72f0c)) {
            var_9ff72f0c clientfield::set("" + #"hash_55456562f670860", 1);
            var_9ff72f0c.targetname = "phase_wall";
        }
    }
    var_e74b3eec = struct::get(#"hash_1afd80bc27a25ca1");
    var_a450be6b = struct::get(#"hash_6ddb42502a4c85b6");
    var_f5adc5bf = util::spawn_model(var_e74b3eec.model, var_e74b3eec.origin, var_e74b3eec.angles);
    var_97ed3bd6 = util::spawn_model(var_a450be6b.model, var_a450be6b.origin, var_a450be6b.angles);
    waitframe(1);
    if (isdefined(var_f5adc5bf)) {
        var_f5adc5bf clientfield::set("" + #"hash_55456562f670860", 1);
    }
    if (isdefined(var_97ed3bd6)) {
        var_97ed3bd6 clientfield::set("" + #"hash_55456562f670860", 1);
    }
    level flag::wait_till(#"hash_33aac7e159ca8f89");
    var_c89beff = getent("clip_tunnel_end", "targetname");
    var_4c979c5b = getentarray("phase_wall", "targetname");
    if (isdefined(var_f5adc5bf)) {
        var_f5adc5bf delete();
    }
    if (isdefined(var_97ed3bd6)) {
        var_97ed3bd6 delete();
    }
    wait(10);
    var_c89beff movey(-746, 10);
    foreach (var_b7e0b1c0 in var_4c979c5b) {
        var_b7e0b1c0 movey(-746, 15);
    }
    var_c89beff waittill(#"movedone");
    level.var_c79d163e movez(-230, 6);
    level.var_c79d163e waittill(#"movedone");
    level.var_c79d163e thread function_b42e11c3();
    if (isdefined(var_d0d7a17e)) {
        var_d0d7a17e delete();
    }
    if (isdefined(var_9ff72f0c)) {
        var_9ff72f0c delete();
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x4e53101f, Offset: 0x12f20
// Size: 0x8c
function function_b42e11c3() {
    function_4718251f();
    a_players = function_a1ef346b();
    for (i = 0; i < a_players.size; i++) {
        if (a_players[i].origin[1] >= self.origin[1]) {
            a_players[i] thread function_fffd60cd(i);
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xd8dbed5c, Offset: 0x12fb8
// Size: 0x114
function function_fffd60cd(n_index) {
    self endon(#"disconnect");
    self thread lui::screen_flash(1, 1, 0.5, 1, (1, 1, 1));
    wait(1);
    if (isdefined(self)) {
        if (n_index == 0) {
            v_pos = (8952, 4516, -512);
        } else if (n_index == 1) {
            v_pos = (9014, 4516, -512);
        } else if (n_index == 2) {
            v_pos = (9087, 4516, -512);
        } else {
            v_pos = (9149, 4516, -512);
        }
        self setorigin(v_pos);
        self setplayerangles((0, 270, 0));
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x741791fa, Offset: 0x130d8
// Size: 0x8c
function door_town_square() {
    s_door = struct::get("interact_door_town_square");
    var_1ecccb40 = s_door zm_unitrigger::create(#"hash_5c200a5697d4b52a", 50, &function_c55d06d8);
    level thread function_a47abe3d();
    level thread function_11e30695(var_1ecccb40);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x7d43f577, Offset: 0x13170
// Size: 0x84
function function_c55d06d8() {
    level endon(#"hash_43b2db4b49d724ba");
    while (true) {
        s_waitresult = self waittill(#"trigger");
        if (zm_utility::is_player_valid(s_waitresult.activator)) {
            level flag::set(#"hash_43b2db4b49d724ba");
            break;
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x8b923123, Offset: 0x13200
// Size: 0xfc
function function_11e30695(stub) {
    level flag::wait_till(#"hash_43b2db4b49d724ba");
    level.var_b54157cf = 0;
    foreach (player in getplayers()) {
        player.var_45ef153 = 0;
        player.var_1a4a768c = 0;
    }
    level.var_c79d163e thread function_59bed7ab();
    zm_unitrigger::unregister_unitrigger(stub);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x27ff8b13, Offset: 0x13308
// Size: 0x44
function function_a47abe3d() {
    level endon(#"hash_43b2db4b49d724ba");
    wait(600);
    level flag::set(#"hash_43b2db4b49d724ba");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x44992a89, Offset: 0x13358
// Size: 0xcc
function function_59bed7ab() {
    self movez(230, 6);
    self playsound(#"hash_61e120ca9d9d409f");
    self connectpaths();
    level thread namespace_c097de49::function_8f85d169();
    music::setmusicstate("boss_part1");
    level flag::clear(#"in_dark_side");
    level flag::set(#"hash_33aac7e159ca8f89");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x5e5d9cfc, Offset: 0x13430
// Size: 0x532
function function_2073cf2f() {
    level endon(#"game_ended");
    var_a1cc3481 = getent("trigger_phase", "targetname");
    var_f4d9a132 = gettime() + int(1 * 1000);
    var_549429b9 = int(3.33333 * 1000);
    var_3c43f4e0 = var_549429b9 * 2;
    var_10e74788 = 10;
    var_69a1706b = int(var_10e74788 / 3);
    var_2df437f5 = 0;
    for (i = 1; i <= var_69a1706b; i++) {
        var_2df437f5 += var_69a1706b * i;
    }
    while (true) {
        time = gettime();
        dodamage = time >= var_f4d9a132;
        var_6effa129 = function_a1ef346b();
        foreach (entity in var_6effa129) {
            if (!isdefined(entity.var_6a2e2f41)) {
                entity.var_6a2e2f41 = gettime();
            }
            if (isplayer(entity) && (!isalive(entity) || entity scene::is_igc_active())) {
                entity hide_effects();
                continue;
            }
            if (entity istouching(var_a1cc3481) && !is_true(entity.b_ignore_fow_damage) && isdefined(entity.maxhealth)) {
                player = undefined;
                vehicle = undefined;
                if (!isdefined(entity.var_9a1624b5)) {
                    entity.var_9a1624b5 = time;
                }
                elapsed_time = time - entity.var_9a1624b5;
                if (elapsed_time < var_549429b9) {
                    intensity = 1;
                } else if (elapsed_time < var_3c43f4e0) {
                    intensity = 2;
                } else {
                    intensity = 3;
                }
                var_727ff533 = entity.maxhealth / var_2df437f5;
                var_9d778583 = int(var_727ff533 * intensity);
                if (isplayer(entity)) {
                    entity show_effects(intensity);
                    player = entity;
                }
                if (dodamage) {
                    if (isdefined(player)) {
                        if (is_true(player.var_e5f956c5)) {
                            var_9d778583 *= 2;
                        }
                        player dodamage(var_9d778583, player.origin, undefined, undefined, undefined, "MOD_TRIGGER_HURT", 8192);
                        player playsoundtoplayer(#"hash_11f49f9aedeeff5e", player);
                        player function_bc82f900(#"damage_light");
                        if (time >= player.var_6a2e2f41) {
                            player thread globallogic_audio::play_taacom_dialog("fogOfWarTrappedPlayer");
                            player.var_6a2e2f41 = time + int(240 * 1000);
                        }
                    }
                }
                continue;
            }
            if (isplayer(entity)) {
                entity hide_effects();
            }
            entity.var_9a1624b5 = undefined;
        }
        if (dodamage) {
            var_f4d9a132 = gettime() + int(1 * 1000);
        }
        waitframe(1);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x3ad84137, Offset: 0x13970
// Size: 0x2c
function show_effects(*intensity) {
    self clientfield::set_to_player("fogofwareffects", 1);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x3e6763ed, Offset: 0x139a8
// Size: 0x24
function hide_effects() {
    self clientfield::set_to_player("fogofwareffects", 0);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 4, eflags: 0x2 linked
// Checksum 0x82c25549, Offset: 0x139d8
// Size: 0x12a
function function_3d102402(str_item, v_org, v_ang, var_b17ecef0) {
    point = function_4ba8fde(str_item);
    if (!isdefined(var_b17ecef0)) {
        var_eaa939f9 = item_drop::drop_item(0, undefined, 1, 0, point.id, v_org, v_ang, 3);
    } else if (!var_b17ecef0) {
        var_eaa939f9 = item_drop::drop_item(0, undefined, 1, 0, point.id, v_org, v_ang, 0);
    } else if (var_b17ecef0) {
        var_eaa939f9 = item_drop::drop_item(0, undefined, 1, 0, point.id, v_org, v_ang, 5);
    }
    var_eaa939f9.var_dd21aec2 = 1 | 16;
    var_eaa939f9.itementry.var_4cd830a = 1;
    return var_eaa939f9;
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x5ed7a5ab, Offset: 0x13b10
// Size: 0xd0
function function_4718251f() {
    foreach (player in getplayers()) {
        if (isdefined(player)) {
            if (player laststand::player_is_in_laststand()) {
                player zm_laststand::auto_revive(player, 0, 0);
                continue;
            }
            player zm_player::spectator_respawn_player();
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x42ea5610, Offset: 0x13be8
// Size: 0x184
function function_f03b2c72() {
    var_877be6db = struct::get("armor_machine_tunnel");
    var_a8574c85 = struct::get("wonderfizz_tunnel");
    s_crafting = struct::get("crafting_table_tunnel");
    s_pap = struct::get("pap_machine_tunnel");
    model = #"hash_6e47d6576612543c";
    level thread function_be1b951c();
    level flag::wait_till(#"hash_1a21f991103bbd5d");
    namespace_4b9fccd8::function_e0069640(s_pap);
    namespace_1cc7b406::function_db05041b(s_crafting, #"hash_1e1b751abcb0c5b6", &namespace_1cc7b406::function_e3ad9f54);
    namespace_dd7e54e3::function_93a99046(var_877be6db);
    namespace_82b4c2d1::function_744f2a2(var_a8574c85, #"hash_6217ef2a3d7d895b", model, #"hash_4af85251966549b8", #"hash_3eac5ec7a888ddfb", 0, &namespace_82b4c2d1::function_472f16d8, undefined);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0x18f97417, Offset: 0x13d78
// Size: 0x128
function function_be1b951c() {
    level endon(#"end_game");
    models = getentarraybytype(6);
    s_door = struct::get("interact_door_town_square");
    a_models = array::get_all_closest(s_door.origin, models, undefined, undefined, 1000);
    foreach (model in a_models) {
        if (model.model === #"hash_94b3a8b935248d0") {
            self thread function_ed93e125(model);
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x3eb9ce72, Offset: 0x13ea8
// Size: 0x114
function function_ed93e125(model) {
    model hide();
    if (isdefined(model.trigger)) {
        model.trigger triggerenable(0);
    }
    if (isdefined(model.objectiveid)) {
        objective_setinvisibletoall(model.objectiveid);
    }
    level flag::wait_till(#"hash_1a21f991103bbd5d");
    model show();
    if (isdefined(model.trigger)) {
        model.trigger triggerenable(1);
    }
    wait(0.5);
    if (isdefined(model.objectiveid)) {
        objective_setvisibletoall(model.objectiveid);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x7edc6956, Offset: 0x13fc8
// Size: 0x52c
function function_197d500b(b_skipped) {
    foreach (e_player in getplayers()) {
        e_player val::set(#"outro_igc", "allowdeath", 0);
        e_player val::set(#"outro_igc", "takedamage", 0);
        e_player val::set(#"outro_igc", "ignoreme", 1);
        e_player.var_f22c83f5 = 1;
        e_player.var_f4e33249 = 1;
        e_player val::set(#"outro_igc", "show_hud", 0);
        e_player val::set(#"outro_igc", "freezecontrols", 1);
    }
    level clientfield::set("" + #"hash_763dd8035e80f7c", 1);
    level clientfield::set("" + #"hash_1fb207d10fbe27ce", 1);
    if (b_skipped) {
        return;
    }
    if (!level flag::get(#"hash_16783a54b8777dc")) {
        level flag::set(#"hash_16783a54b8777dc");
        level lui::screen_fade_out(0, (0, 0, 0));
    }
    n_start_time = gettime();
    level scene::init_streamer(#"hash_111ad10d96cf00ac", getplayers());
    n_time_left = 3 - float(gettime() - n_start_time) / 1000;
    if (n_time_left > 0) {
        wait(n_time_left);
    }
    level clientfield::set("" + #"hash_7b50097ac4242bc9", 1);
    scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_d55fcc73, "play");
    scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_cf3ede8a, "Shot 010");
    scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_b78ba960, "Shot 010");
    scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_dc9b74df, "Shot 050");
    scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_3d0889e3, "Shot 060");
    scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_6644db7b, "Shot 070");
    scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_35fc7d2f, "Shot 090");
    scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_3276c278, "Shot 150");
    scene::add_scene_func(#"hash_111ad10d96cf00ac", &function_a0ceaf8e, "Shot 170");
    level scene::play(#"hash_111ad10d96cf00ac");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x1b8cbb28, Offset: 0x14500
// Size: 0x44
function outro_cleanup(*b_skipped, *var_19e802fa) {
    level clientfield::set("" + #"hash_7b50097ac4242bc9", 0);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x442fb21b, Offset: 0x14550
// Size: 0x94
function function_d55fcc73(*a_ents) {
    scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_d55fcc73, "play");
    music::setmusicstate("outro");
    exploder::stop_exploder("fxexp_sky_portal");
    wait(1);
    level lui::screen_fade_in(0, (0, 0, 0));
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x7d0369ea, Offset: 0x145f0
// Size: 0x74
function function_cf3ede8a(*a_ents) {
    scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_cf3ede8a, "Shot 010");
    level waittill(#"hash_1c788a515fa14bec");
    hidemiscmodels("weaver_rings");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x77cbe113, Offset: 0x14670
// Size: 0xb4
function function_b78ba960(a_ents) {
    scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_b78ba960, "Shot 020");
    level clientfield::set("" + #"hash_7b50097ac4242bc9", 0);
    vh_heli = a_ents[#"hash_1154b5797e3db10e"];
    if (isdefined(vh_heli)) {
        vh_heli vehicle::toggle_tread_fx(0);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x39eeaef, Offset: 0x14730
// Size: 0x130
function function_dc9b74df(a_ents) {
    scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_dc9b74df, "Shot 050");
    var_b9f89aa6 = a_ents[#"hash_f49100b73641f9b"];
    if (isdefined(var_b9f89aa6)) {
        foreach (str_tag in ["tag_eye_fx", "tag_eye_fx1", "tag_eye_fx2", "tag_eye_fx3"]) {
            level thread function_be188dd8(var_b9f89aa6, str_tag);
        }
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x6e0a8cf9, Offset: 0x14868
// Size: 0x124
function function_be188dd8(var_b9f89aa6, str_tag) {
    if (!isdefined(var_b9f89aa6) || !isstring(str_tag)) {
        return;
    }
    var_b9f89aa6 endon(#"death");
    mdl_fx = util::spawn_model(#"tag_origin", var_b9f89aa6 gettagorigin(str_tag), var_b9f89aa6 gettagangles(str_tag));
    mdl_fx endon(#"death");
    var_b9f89aa6 thread util::delete_on_death(mdl_fx);
    mdl_fx linkto(var_b9f89aa6, str_tag);
    playfxontag(#"hash_20dea26bf4474819", mdl_fx, "tag_origin");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xbcd1004c, Offset: 0x14998
// Size: 0xa4
function function_3d0889e3(*a_ents) {
    scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_3d0889e3, "Shot 060");
    level waittill(#"hash_30d1cedfe65248c4");
    level thread lui::screen_fade_out(1, (1, 1, 1));
    wait(2.33);
    level thread lui::screen_fade_in(1, (1, 1, 1));
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x8e421f23, Offset: 0x14a48
// Size: 0xbc
function function_6644db7b(a_ents) {
    scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_6644db7b, "Shot 070");
    level clientfield::set("" + #"hash_7b50097ac4242bc9", 2);
    vh_heli = a_ents[#"hash_1154b5797e3db10e"];
    if (isdefined(vh_heli)) {
        vh_heli vehicle::toggle_tread_fx(0);
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x4382ccf7, Offset: 0x14b10
// Size: 0x8c
function function_35fc7d2f(*a_ents) {
    scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_35fc7d2f, "Shot 090");
    level clientfield::set("" + #"hash_7b50097ac4242bc9", 0);
    hidemiscmodels("director_hide");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x5d494912, Offset: 0x14ba8
// Size: 0xdc
function function_3276c278(*a_ents) {
    scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_3276c278, "Shot 150");
    level clientfield::set("" + #"hash_7b50097ac4242bc9", 3);
    level waittill(#"hash_3df325d01f1f7a18");
    level thread lui::screen_fade_out(1, (1, 1, 1));
    wait(2.6);
    level thread lui::screen_fade_in(1, (1, 1, 1));
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x231ffc7d, Offset: 0x14c90
// Size: 0x74
function function_a0ceaf8e(*a_ents) {
    scene::remove_scene_func(#"hash_111ad10d96cf00ac", &function_a0ceaf8e, "Shot 170");
    level clientfield::set("" + #"hash_7b50097ac4242bc9", 0);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xfe2ef210, Offset: 0x14d10
// Size: 0x48e
function function_756178a(*b_skipped) {
    level lui::screen_fade_out(0, (0, 0, 0));
    foreach (e_player in function_a1ef346b()) {
        level thread function_c1719fb7(e_player);
    }
    level thread function_3eb6da0d();
    wait(4);
    foreach (e_player in getplayers()) {
        level.var_9b6e1cc9 zm_tungsten_title_cards::set_is_title_card_02(e_player, 1);
        if (!level.var_9b6e1cc9 zm_tungsten_title_cards::is_open(e_player)) {
            level.var_9b6e1cc9 zm_tungsten_title_cards::open(e_player);
        }
    }
    wait(2);
    level flag::wait_till(#"hash_67867730df53852");
    scene::add_scene_func(#"hash_3981b8c38bf4acb7", &function_7f7899bf, "play");
    level scene::play(#"hash_3981b8c38bf4acb7");
    level lui::screen_fade_out(0, (0, 0, 0));
    foreach (e_player in function_a1ef346b()) {
        level thread function_c1719fb7(e_player);
    }
    wait(1);
    foreach (e_player in getplayers()) {
        level.var_9b6e1cc9 zm_tungsten_title_cards::set_is_title_card_02(e_player, 0);
        if (!level.var_9b6e1cc9 zm_tungsten_title_cards::is_open(e_player)) {
            level.var_9b6e1cc9 zm_tungsten_title_cards::open(e_player);
        }
    }
    level clientfield::set("" + #"hash_763dd8035e80f7c", 0);
    wait(8);
    foreach (e_player in getplayers()) {
        if (level.var_9b6e1cc9 zm_tungsten_title_cards::is_open(e_player)) {
            level.var_9b6e1cc9 zm_tungsten_title_cards::close(e_player);
        }
    }
    wait(1);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 2, eflags: 0x2 linked
// Checksum 0x5fb72f8a, Offset: 0x151a8
// Size: 0x1c4
function function_3cccb124(*b_skipped, *var_19e802fa) {
    var_a347ab1 = level.var_75a7d6.var_4d537044;
    level notify(#"hash_780ee87a1c42cb4c");
    foreach (i, e_player in getplayers()) {
        e_player thread zm_utility::function_ee6da6f6();
        e_player function_995ecb95();
        if (isarray(var_a347ab1)) {
            s_teleport = var_a347ab1[i];
            v_teleport = s_teleport.origin;
            if (isvec(v_teleport)) {
                e_player setorigin(v_teleport);
            }
        }
    }
    level clientfield::set("" + #"hash_763dd8035e80f7c", 0);
    level thread util::delay(1, undefined, &lui::screen_fade_in, 1, (0, 0, 0));
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x62eceb1a, Offset: 0x15378
// Size: 0x10c
function function_c1719fb7(e_player) {
    if (!isalive(e_player)) {
        return;
    }
    level endon(#"end_game", #"hash_780ee87a1c42cb4c");
    e_player endon(#"death");
    e_player callback::function_d8abfc3d(#"on_player_killed", &function_995ecb95);
    e_player.var_f22c83f5 = 1;
    e_player.var_f4e33249 = 1;
    e_player.var_d7bb5e99 = util::spawn_model(#"tag_origin", e_player.origin, e_player.angles);
    e_player linkto(e_player.var_d7bb5e99);
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0x3195631f, Offset: 0x15490
// Size: 0x64
function function_995ecb95(*s_params) {
    self callback::function_52ac9652(#"on_player_killed", &function_995ecb95);
    if (isdefined(self.var_d7bb5e99)) {
        self.var_d7bb5e99 delete();
    }
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 0, eflags: 0x2 linked
// Checksum 0xf5f02588, Offset: 0x15500
// Size: 0x6c
function function_3eb6da0d() {
    level endon(#"end_game");
    level scene::init_streamer(#"hash_3981b8c38bf4acb7", getplayers());
    level flag::set(#"hash_67867730df53852");
}

// Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
// Params 1, eflags: 0x2 linked
// Checksum 0xa121e9e1, Offset: 0x15578
// Size: 0x174
function function_7f7899bf(*a_ents) {
    scene::remove_scene_func(#"hash_3981b8c38bf4acb7", &function_7f7899bf, "play");
    music::setmusicstate("epilogue");
    level notify(#"hash_780ee87a1c42cb4c");
    foreach (e_player in getplayers()) {
        e_player function_995ecb95();
        if (level.var_9b6e1cc9 zm_tungsten_title_cards::is_open(e_player)) {
            level.var_9b6e1cc9 zm_tungsten_title_cards::close(e_player);
        }
    }
    util::wait_network_frame(2);
    level thread lui::screen_fade_in(1, (0, 0, 0));
}

/#

    // Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
    // Params 1, eflags: 0x0
    // Checksum 0x6f594103, Offset: 0x156f8
    // Size: 0xc4
    function function_a4c80826(a_s_pos) {
        a_e_players = function_a1ef346b();
        for (i = 0; i < a_e_players.size; i++) {
            e_player = a_e_players[i];
            s_teleport = a_s_pos[i];
            if (isdefined(e_player) && isdefined(s_teleport)) {
                e_player setorigin(s_teleport.origin);
                e_player setplayerangles(s_teleport.angles);
            }
        }
    }

    // Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
    // Params 0, eflags: 0x0
    // Checksum 0x74ed4814, Offset: 0x157c8
    // Size: 0x194
    function function_cd7a3de4() {
        util::add_debug_command("tank_process_soa");
        util::add_debug_command("MOD_TRIGGER_HURT");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        zm_devgui::add_custom_devgui_callback(&cmd);
    }

    // Namespace zm_tungsten_main_quest/zm_tungsten_main_quest
    // Params 1, eflags: 0x0
    // Checksum 0x3c39a750, Offset: 0x15968
    // Size: 0x98a
    function cmd(cmd) {
        zm_tungsten::function_71a6c3ea();
        switch (cmd) {
        case #"hash_390016349056b819":
            zm_sq::function_f2dd8601(#"hash_6deef93cdc13faf2", zm_sq::function_9212ff4d(#"hash_6deef93cdc13faf2", #"hash_2cec5bd1113224f4"));
            iprintlnbold("<unknown string>");
            level thread function_a4c80826(struct::get_array(#"hash_12376e3570660abc"));
            break;
        case #"hash_48a8b88c7ce6ae03":
            level flag::set(#"hash_77e125d6f8b2733e");
            level zm_ui_inventory::function_7df6bb60(#"hash_4273532945cef4b0", 1);
            iprintlnbold("<unknown string>");
            break;
        case #"hash_a2d020f3f18130d":
            level flag::set(#"hash_52d565520308890c");
            level zm_ui_inventory::function_7df6bb60(#"hash_4273562945cef9c9", 1);
            iprintlnbold("<unknown string>");
            break;
        case #"hash_73a9e3fd790e09ac":
            level flag::set(#"hash_407e12c104cfde25");
            level zm_ui_inventory::function_7df6bb60(#"hash_4273552945cef816", 1);
            iprintlnbold("<unknown string>");
            break;
        case #"hash_48909ec43ecd9048":
            level flag::set(#"hash_52d565520308890c");
            level flag::set(#"hash_77e125d6f8b2733e");
            level flag::set(#"hash_407e12c104cfde25");
            level zm_ui_inventory::function_7df6bb60(#"hash_4273532945cef4b0", 1);
            level zm_ui_inventory::function_7df6bb60(#"hash_4273562945cef9c9", 1);
            level zm_ui_inventory::function_7df6bb60(#"hash_4273552945cef816", 1);
            iprintlnbold("<unknown string>");
            break;
        case #"hash_7fdb12828b80c706":
            iprintlnbold("<unknown string>");
            break;
        case #"hash_5722c0e70313508d":
            iprintlnbold("<unknown string>");
            break;
        case #"hash_20df7d72cbca695b":
            iprintlnbold("<unknown string>");
            break;
        case #"hash_39538636199f1fb5":
            iprintlnbold("<unknown string>");
            break;
        case #"hash_60e984dbc694d6d2":
            level.var_1f7f9ebe++;
            level flag::set(#"hash_6702dc6ad4563f02");
            if (!isdefined(level.var_566d0d14)) {
                level.var_566d0d14 = 1;
            }
            level.var_566d0d14++;
            level zm_ui_inventory::function_7df6bb60(#"hash_4273532945cef4b0", level.var_566d0d14);
            iprintlnbold("<unknown string>");
            break;
        case #"hash_42adc8078d26599":
            level.var_1f7f9ebe++;
            level flag::set(#"hash_6702da6ad4563b9c");
            if (!isdefined(level.var_566d0d14)) {
                level.var_566d0d14 = 1;
            }
            level.var_566d0d14++;
            level zm_ui_inventory::function_7df6bb60(#"hash_4273532945cef4b0", level.var_566d0d14);
            iprintlnbold("<unknown string>");
            break;
        case #"hash_38df87bcd0f3b46f":
            level.var_1f7f9ebe++;
            level flag::set(#"hash_6702dd6ad45640b5");
            if (!isdefined(level.var_566d0d14)) {
                level.var_566d0d14 = 1;
            }
            level.var_566d0d14++;
            level zm_ui_inventory::function_7df6bb60(#"hash_4273532945cef4b0", level.var_566d0d14);
            iprintlnbold("<unknown string>");
            break;
        case #"hash_34cbc37fe364c47e":
            level flag::set(#"hash_6702dc6ad4563f02");
            level flag::set(#"hash_6702dd6ad45640b5");
            level flag::set(#"hash_6702da6ad4563b9c");
            level flag::set(#"hash_45d1ea5a016b7916");
            level.var_1f7f9ebe = 3;
            level zm_ui_inventory::function_7df6bb60(#"hash_4273532945cef4b0", 4);
            iprintlnbold("<unknown string>");
            break;
        case #"hash_32de2812b8f91f4c":
            level thread zm_sq::function_f2dd8601(#"hash_6deef93cdc13faf2", zm_sq::function_9212ff4d(#"hash_6deef93cdc13faf2", #"hash_2cec5bd1113224f4"));
            level flag::set(#"hash_331ca6d639f4883d");
            level flag::set(#"hash_21844688fcfdffe4");
            level flag::set(#"hash_717f6f193982a127");
            level flag::set(#"hash_45d1ea5a016b7916");
            level thread function_a4c80826(struct::get_array(#"hash_5c81ab439fcc310e"));
            iprintlnbold("<unknown string>");
            break;
        case #"hash_62c5a8940f2696c2":
            level thread zm_sq::function_f2dd8601(#"hash_6deef93cdc13faf2", zm_sq::function_9212ff4d(#"hash_6deef93cdc13faf2", #"hash_2cec5bd1113224f4"));
            level flag::set(#"hash_331ca6d639f4883d");
            level flag::set(#"hash_21844688fcfdffe4");
            level flag::set(#"hash_717f6f193982a127");
            level flag::set(#"hash_45d1ea5a016b7916");
            level thread function_a4c80826(struct::get_array(#"hash_5c81ab439fcc310e"));
            level.var_c79d163e function_59bed7ab();
            iprintlnbold("<unknown string>");
            break;
        }
    }

#/
