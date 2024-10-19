// Atian COD Tools GSC CW decompiler test
#using scripts\zm\zm_gold_util.gsc;
#using scripts\zm\zm_gold_vo.gsc;
#using scripts\zm\zm_gold_main_quest.gsc;
#using script_25ebc9ade08aed84;
#using scripts\zm\zm_gold_pap_quest.gsc;
#using script_5fd73298643b6fff;
#using script_46fe62930372dc4e;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using script_663d23db6a134b9c;
#using script_1df36deb5752c05d;
#using script_113dd7f0ea2a1d4f;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_power.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_f7b3ed9;

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0x7cda6101, Offset: 0x3a0
// Size: 0x35c
function init() {
    clientfield::register("scriptmover", "" + #"hash_4824b5ad2c6adfcf", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_33fa936b763918a", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_20b22d2242b107cc", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_4cf52ac8c941f331", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_354f2f0ca110088b", 16000, 1, "counter");
    clientfield::register("scriptmover", "" + #"hash_221e597b28199323", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_48cdaba6cfee3ee8", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_11d9c3835adcaece", 16000, 1, "int");
    clientfield::register("actor", "" + #"hash_5342c00e940ad12b", 16000, 1, "int");
    level.var_cc43b632 = struct::get_array("control_point_pos", "targetname");
    level.var_547f9dd5 = [];
    level.dont_unset_perk_when_machine_paused = 1;
    level.var_cc984236 = &function_cc984236;
    array::thread_all(level.var_cc43b632, &function_e199d168);
    level thread function_ef4139d1();
    callback::add_callback(#"hash_594217387367ebb4", &function_d81240c3);
    callback::on_ai_spawned(&function_3a3787ec);
    level.var_7dbadc8c = zm_control_point_hud::register();
    /#
        level thread function_37597f29();
    #/
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 1, eflags: 0x2 linked
// Checksum 0x80d6bcb6, Offset: 0x708
// Size: 0xc2
function function_cc984236(str_zone) {
    foreach (var_32f76af8 in level.var_cc43b632) {
        if (var_32f76af8.var_269ad176 === 1 && var_32f76af8.script_string === str_zone) {
            return 1;
        }
    }
    return zm_zonemgr::any_player_in_zone(str_zone);
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0x30ec2d2a, Offset: 0x7d8
// Size: 0x15c
function function_d81240c3() {
    callback::remove_callback(#"hash_594217387367ebb4", &function_d81240c3);
    foreach (var_32f76af8 in level.var_cc43b632) {
        level thread zm_unitrigger::unregister_unitrigger(var_32f76af8.objective_pos.s_unitrigger);
        if (var_32f76af8.var_269ad176 === 1) {
            var_32f76af8 thread function_21a9e71b(0);
        }
    }
    zm_sq::objective_complete(#"hash_8602209567f541c");
    zm_sq::objective_complete(#"hash_3e7926c5aefe4406");
    level thread zm_power::turn_power_on_and_open_doors(2);
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0xe6b655ac, Offset: 0x940
// Size: 0x68
function function_3a3787ec() {
    self endon(#"death");
    while (true) {
        self waittill(#"bad_path");
        if (isdefined(self.attackable)) {
            self.var_12af7864 = 1;
            self.attackable = undefined;
            break;
        }
        wait(0.5);
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0xc43b88e8, Offset: 0x9b0
// Size: 0xac
function function_e199d168() {
    self.var_af9beb09 = getent(self.target, "targetname");
    self.var_af9beb09 function_619a5c20();
    self.var_af9beb09 clientfield::set("set_compass_icon", 1);
    self.var_af9beb09.control_point = self;
    self.var_af9beb09 scene::init(#"hash_5ee79d3fbd128d25", self.var_af9beb09);
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0x5edc9165, Offset: 0xa68
// Size: 0xba
function function_60f09fb9() {
    self scene::init(#"hash_e47497b4ff880f5");
    self.mdl = self.scene_ents[#"prop 1"];
    self.mdl function_619a5c20();
    self.mdl clientfield::set("set_compass_icon", 1);
    self.mdl.control_point = self;
    self.objective_pos = struct::get(self.target, "targetname");
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0x307ba5f4, Offset: 0xb30
// Size: 0x340
function function_ef4139d1() {
    level flag::wait_till("start_zombie_round_logic");
    foreach (control_point_pos in level.var_cc43b632) {
        if (isdefined(control_point_pos)) {
            control_point_pos.var_547f9dd5 = [];
            control_point_pos.var_56d2adea = 0;
            control_point_pos.var_269ad176 = 0;
            var_1baed918 = struct::get_array(control_point_pos.target, "targetname");
            foreach (target_pos in var_1baed918) {
                if (target_pos.script_noteworthy === "satellite_pos") {
                    if (!isdefined(control_point_pos.var_547f9dd5)) {
                        control_point_pos.var_547f9dd5 = [];
                    } else if (!isarray(control_point_pos.var_547f9dd5)) {
                        control_point_pos.var_547f9dd5 = array(control_point_pos.var_547f9dd5);
                    }
                    if (!isinarray(control_point_pos.var_547f9dd5, target_pos)) {
                        control_point_pos.var_547f9dd5[control_point_pos.var_547f9dd5.size] = target_pos;
                    }
                    if (!isdefined(level.var_547f9dd5)) {
                        level.var_547f9dd5 = [];
                    } else if (!isarray(level.var_547f9dd5)) {
                        level.var_547f9dd5 = array(level.var_547f9dd5);
                    }
                    if (!isinarray(level.var_547f9dd5, target_pos)) {
                        level.var_547f9dd5[level.var_547f9dd5.size] = target_pos;
                    }
                    continue;
                }
                if (target_pos.script_noteworthy === "objective_pos") {
                    control_point_pos.objective_pos = target_pos;
                }
            }
            control_point_pos thread function_6ed31494(control_point_pos.script_int);
            control_point_pos.mdl_tag = util::spawn_model("tag_origin", control_point_pos.origin, control_point_pos.angles);
            array::thread_all(control_point_pos.var_547f9dd5, &function_60f09fb9);
        }
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 1, eflags: 0x2 linked
// Checksum 0xa3b2f9ac, Offset: 0xe78
// Size: 0x66
function function_6ed31494(index) {
    var_8c61185f = self.objective_pos zm_unitrigger::create(&function_c03a8002, 100, &function_789417a9);
    var_8c61185f.zone_index = index;
    var_8c61185f.control_point = self;
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 1, eflags: 0x2 linked
// Checksum 0x17f689e5, Offset: 0xee8
// Size: 0x24a
function function_c03a8002(e_player) {
    e_player globallogic::function_d96c031e();
    if (isplayer(e_player)) {
        if (level flag::get(#"hash_1c70d74ceb5e9aa2") || level flag::get(#"hash_7752d012501cd222") || level flag::get(#"hash_49e515cdcf4bb8db")) {
            return false;
        } else if (isdefined(level.var_28c80220) && level.var_28c80220 != 0 && !is_true(self.stub.control_point.var_4e953b00)) {
            self sethintstringforplayer(e_player, #"hash_308c87761b873a1b");
            return true;
        } else if (level.round_number < self.stub.control_point.var_56d2adea) {
            self sethintstringforplayer(e_player, #"hash_7925f5addbd983a8");
            return true;
        } else if (self.stub.control_point.var_269ad176 === 0) {
            self sethintstringforplayer(e_player, #"hash_1dea4a165481ef03", 500);
            if (!e_player zm_score::can_player_purchase(500)) {
                e_player globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
            }
            return true;
        } else {
            self sethintstringforplayer(e_player, #"");
            return false;
        }
    }
    return false;
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0x8cea66d1, Offset: 0x1140
// Size: 0x208
function function_789417a9() {
    level endon(#"end_game");
    while (true) {
        waitresult = self waittill(#"trigger");
        e_player = waitresult.activator;
        if (level flag::get(#"hash_1c70d74ceb5e9aa2") || level flag::get(#"hash_49e515cdcf4bb8db")) {
            continue;
        }
        if (isdefined(level.var_28c80220) && level.var_28c80220 != 0 && !is_true(self.stub.control_point.var_4e953b00)) {
            level thread function_b7c45db1(self.stub.control_point, e_player);
            continue;
        }
        if (e_player zm_score::can_player_purchase(500) && level.round_number >= self.stub.control_point.var_56d2adea && self.stub.control_point.var_269ad176 === 0) {
            e_player thread zm_score::minus_to_player_score(500);
            self.stub.control_point.activator = e_player;
            self.stub.control_point thread function_7df47abd();
            e_player function_bc82f900(#"hash_7ba664a71b6d6bc8");
        }
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 2, eflags: 0x2 linked
// Checksum 0x6ba2777a, Offset: 0x1350
// Size: 0x4b4
function function_b7c45db1(control_point, e_player) {
    e_player function_bc82f900(#"zm_gold_interact_rumble_small");
    e_player playsound(#"hash_28c6c102591388a");
    level.var_28c80220--;
    if (level flag::get(#"hash_10087ff5db48e4db")) {
        level flag::clear(#"hash_10087ff5db48e4db");
        level zm_ui_inventory::function_7df6bb60(#"hash_41f1735c1f1772a1", 2);
    } else if (level flag::get(#"hash_dca80b283387742")) {
        level flag::clear(#"hash_dca80b283387742");
        level zm_ui_inventory::function_7df6bb60(#"hash_41f1705c1f176d88", 2);
    } else {
        level flag::clear(#"hash_7a45234210f642a1");
        level zm_ui_inventory::function_7df6bb60(#"hash_41f1715c1f176f3b", 2);
    }
    control_point.var_93623c13 = control_point util::spawn_model(#"hash_7cf020c84a283dd7", control_point.origin, control_point.angles);
    control_point.var_93623c13 thread function_6ed4e713();
    control_point.var_4e953b00 = 1;
    level flag::set(#"hash_647ab45ea0e2deb9" + control_point.script_int);
    level.var_2912d8c5++;
    if (level.var_2912d8c5 < 3) {
        control_point.mdl_tag zm_vo::function_d6f8bbd9(#"hash_15658e0da81868ac", 0, undefined, 1);
    } else {
        playsoundatposition(#"hash_7b48ab684f546cde", (0, 0, 0));
        foreach (player in function_a1ef346b()) {
            earthquake(0.5, 4, player.origin, 2000);
            player function_bc82f900(#"hash_60f6431aa35823e4");
        }
        control_point.mdl_tag zm_vo::function_d6f8bbd9(#"hash_15658e0da81868ac", 0, undefined, 1);
        control_point.mdl_tag zm_vo::function_d6f8bbd9(#"hash_513b5b11b067f41e", 0, undefined, 1);
        level zm_vo::function_7622cb70(#"hash_725c10b600ae89b");
    }
    foreach (var_9673500d in struct::get_array(control_point.target, "targetname")) {
        if (var_9673500d.script_noteworthy === "objective_pos") {
            zm_sq::objective_complete(#"hash_520d09b88a205eac", var_9673500d);
        }
    }
    /#
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0xbf234d90, Offset: 0x1810
// Size: 0x74
function function_6ed4e713() {
    self scene::play(#"hash_17724c22a7ab4091", "up", self);
    self scene::stop(#"hash_17724c22a7ab4091");
    self thread scene::play(#"hash_17724c22a7ab4091", "idle", self);
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0x9d299494, Offset: 0x1890
// Size: 0x47c
function function_7df47abd() {
    level endon(#"end_game", #"hash_3e765c26047c9f54");
    playsoundatposition(#"hash_2ea7b4a593646089", self.origin);
    level flag::set(#"hash_1c70d74ceb5e9aa2");
    level flag::set(#"hash_5dce120a8e013b48");
    thread namespace_4ce4e65e::function_4f292ffc();
    self.var_269ad176 = 1;
    if (level.var_2645bbc0 === 1) {
        zm_sq::objective_complete(#"hash_69cca9825b7edc33");
    }
    if (level.var_2645bbc0 === 2) {
        zm_sq::objective_complete(#"hash_2b663a5dd7beb565");
    }
    n_round = level.round_number;
    if (n_round < 5) {
        n_round = 5;
    } else if (n_round > 10) {
        n_round = 10;
    }
    n_players = getplayers().size;
    if (!isdefined(n_players)) {
        return;
    }
    switch (n_players) {
    case 1:
    default:
        var_4f886dd2 = 10;
        var_b90dca7b = 12;
        break;
    case 2:
        var_4f886dd2 = 13;
        var_b90dca7b = 15;
        break;
    case 3:
        var_4f886dd2 = 16;
        var_b90dca7b = 18;
        break;
    case 4:
        var_4f886dd2 = 19;
        var_b90dca7b = 21;
        break;
    }
    var_37c20fcf = 5;
    var_4340bf8a = var_b90dca7b - var_4f886dd2;
    var_3b3dba11 = var_4340bf8a / var_37c20fcf;
    n_count = int(var_4f886dd2 + var_3b3dba11 * (n_round - var_37c20fcf));
    if (n_count < var_4f886dd2) {
        n_count = var_4f886dd2;
    } else if (n_count > var_b90dca7b) {
        n_count = var_b90dca7b;
    }
    level.var_6fad6ea9 = level.zombie_ai_limit - n_count;
    level.zombie_ai_limit -= level.var_6fad6ea9;
    callback::on_ai_spawned(&function_de517a00);
    foreach (ai_zombie in getaiteamarray(level.zombie_team)) {
        ai_zombie thread function_de517a00();
    }
    self thread function_752dbea1(#"low");
    self function_1ef4bcd6();
    self thread function_bc369205();
    self thread function_e69a5ae5();
    self thread function_ca558ad5();
    self.var_af9beb09 thread zm_vo::function_d6f8bbd9(#"hash_8e1c13fa865fc0", 0, undefined, 1);
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 1, eflags: 0x2 linked
// Checksum 0x24b2eca8, Offset: 0x1d18
// Size: 0xe0
function function_752dbea1(var_d9e04bad = #"low") {
    self notify("117a7689a7d01c77");
    self endon("117a7689a7d01c77");
    level endon(#"end_game");
    self endon(#"hash_327866e1223171e5");
    str_rumble = #"hash_4a5df674b579db5e";
    if (var_d9e04bad == #"med") {
        str_rumble = #"hash_52050074b9862432";
    }
    while (true) {
        playrumbleonposition(str_rumble, self.origin);
        wait(0.5);
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0x36b62d6e, Offset: 0x1e00
// Size: 0x12a
function function_de517a00() {
    self notify("5fadc52d5fa39e8c");
    self endon("5fadc52d5fa39e8c");
    self endon(#"death");
    level endon(#"hash_397aa803a58d2ea3", #"hash_3e765c26047c9f54");
    self.var_6d81bf5c = self.var_126d7bef;
    self.var_c8a896e3 = self.ignore_round_spawn_failsafe;
    self.var_4e219048 = self.b_ignore_cleanup;
    while (true) {
        wait(randomfloatrange(0.8, 1.2));
        var_ad7db199 = self.attackable;
        if (isdefined(var_ad7db199.control_point)) {
            self.var_126d7bef = 1;
            self.ignore_round_spawn_failsafe = 1;
            self.b_ignore_cleanup = 1;
            continue;
        }
        self.var_126d7bef = self.var_6d81bf5c;
        self.ignore_round_spawn_failsafe = self.var_c8a896e3;
        self.b_ignore_cleanup = self.var_4e219048;
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 1, eflags: 0x2 linked
// Checksum 0xf3d353e0, Offset: 0x1f38
// Size: 0x9a
function function_9112b94e(ai_zombie) {
    if (!isdefined(ai_zombie)) {
        return;
    }
    if (isdefined(ai_zombie.var_6d81bf5c)) {
        ai_zombie.var_126d7bef = ai_zombie.var_6d81bf5c;
        ai_zombie.var_6d81bf5c = undefined;
    }
    if (isdefined(ai_zombie.var_c8a896e3)) {
        ai_zombie.ignore_round_spawn_failsafe = ai_zombie.var_c8a896e3;
        ai_zombie.var_c8a896e3 = undefined;
    }
    if (isdefined(ai_zombie.var_4e219048)) {
        ai_zombie.b_ignore_cleanup = ai_zombie.var_4e219048;
        ai_zombie.var_4e219048 = undefined;
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 1, eflags: 0x2 linked
// Checksum 0x2ba537ea, Offset: 0x1fe0
// Size: 0x6d4
function function_1ef4bcd6(var_14a22ccd = 0) {
    level endon(#"end_game", #"hash_3e765c26047c9f54");
    level flag::clear("failed_control_point" + self.script_int);
    self.var_16ad7e31 = 0;
    self.var_ff770ca = 0;
    self.var_2b239c6f = 0;
    self.var_f303d9b0 = 0;
    self.var_cc514373 = [];
    self.var_fb721650 = [];
    if (self.var_269ad176 !== 2) {
        self.mdl_tag clientfield::set("" + #"hash_48cdaba6cfee3ee8", 1);
        self thread function_c1bde2a0();
    }
    self.mdl_tag clientfield::set("" + #"hash_4824b5ad2c6adfcf", 0);
    self.mdl_tag clientfield::set("" + #"hash_33fa936b763918a", 0);
    level.available_slots = [];
    if (!var_14a22ccd) {
        if (getplayers().size == 1) {
            var_8c10e30b = 2;
        } else if (getplayers().size == 2) {
            var_8c10e30b = 3;
        } else {
            var_8c10e30b = 3;
        }
    }
    foreach (satellite_pos in self.var_547f9dd5) {
        if (self.var_269ad176 !== 2) {
            satellite_pos.mdl clientfield::set("" + #"hash_4cf52ac8c941f331", 1);
            satellite_pos thread function_741d2259();
        }
    }
    if (!var_14a22ccd) {
        for (i = 0; i < var_8c10e30b; i++) {
            satellite = array::random(array::randomize(self.var_547f9dd5));
            if (isdefined(satellite.mdl) && !is_true(satellite.mdl.is_active)) {
                if (!isdefined(self.var_fb721650)) {
                    self.var_fb721650 = [];
                } else if (!isarray(self.var_fb721650)) {
                    self.var_fb721650 = array(self.var_fb721650);
                }
                if (!isinarray(self.var_fb721650, satellite)) {
                    self.var_fb721650[self.var_fb721650.size] = satellite;
                }
                satellite.mdl val::set("defend", "takedamage", 1);
                slots = function_bdb2b85b(satellite.mdl.origin, satellite.mdl.angles, 50, 3, satellite.script_string);
                if (isdefined(slots) && slots.size > 0) {
                    satellite.mdl.is_active = 1;
                    satellite.mdl.var_b79a8ac7 = {#var_f019ea1a:1024, #slots:slots};
                    level.attackables[level.attackables.size] = satellite.mdl;
                    satellite.mdl thread function_30f8cfb4(satellite, self.script_int);
                }
            }
        }
        return;
    }
    var_af9beb09 = self.var_af9beb09;
    if (isdefined(var_af9beb09) && !is_true(var_af9beb09.is_active)) {
        var_af9beb09 val::set(#"hash_439fa8a074e8455c", "takedamage", 1);
        slots = function_bdb2b85b(var_af9beb09.origin, var_af9beb09.angles, 60, 6, self.script_string);
        if (isdefined(slots) && slots.size > 0) {
            var_af9beb09.is_active = 1;
            var_af9beb09.var_b79a8ac7 = {#var_f019ea1a:1024, #slots:slots};
            level.attackables[level.attackables.size] = var_af9beb09;
            foreach (var_9ed85498 in struct::get_array(self.target)) {
                if (var_9ed85498.script_noteworthy === #"hash_7ce1ee69c12d2f2e") {
                    s_objective = var_9ed85498;
                    break;
                }
            }
            var_af9beb09 thread function_30f8cfb4(self, self.script_int, 1);
        }
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0x31db1b69, Offset: 0x26c0
// Size: 0x8c
function function_c1bde2a0() {
    self endon(#"hash_27ce7699e31c77b");
    self.var_af9beb09 scene::play(#"hash_5ee79d3fbd128d25", "activate", self.var_af9beb09);
    self.var_af9beb09 thread scene::play(#"hash_5ee79d3fbd128d25", "activate_idle", self.var_af9beb09);
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0x604ca3e6, Offset: 0x2758
// Size: 0x154
function function_8ab36f01() {
    self endon(#"hash_27ce7699e31c77b");
    self flag::set(#"exploded");
    self.var_af9beb09 clientfield::set("" + #"hash_11d9c3835adcaece", 1);
    wait(3);
    playrumbleonposition(#"hash_605684c23d123c36", self.origin);
    playsoundatposition(#"hash_302f5ee824b9e9eb", self.origin);
    self.var_af9beb09 scene::play(#"hash_5ee79d3fbd128d25", "explosion", self.var_af9beb09);
    self.var_af9beb09 thread scene::play(#"hash_5ee79d3fbd128d25", "explosion_idle", self.var_af9beb09);
    wait(3);
    self thread zm_gold_vo::function_891da57a();
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0xd799539f, Offset: 0x28b8
// Size: 0x6c
function function_741d2259() {
    self endon(#"hash_27ce7699e31c77b");
    self scene::play(#"hash_e47497b4ff880f5", "activate");
    self thread scene::play(#"hash_e47497b4ff880f5", "activate_idle");
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0x8f4bad0b, Offset: 0x2930
// Size: 0x2ec
function function_ca558ad5() {
    level endon(#"end_game", "failed_control_point" + self.script_int, #"hash_3e765c26047c9f54");
    callback::on_ai_killed(&function_559a9ad3);
    var_10ff40e4 = 7 + function_a1ef346b().size * 5;
    if (level.round_number > 20) {
        var_10ff40e4 += level.round_number - 20;
    }
    if (var_10ff40e4 > 50) {
        var_10ff40e4 = 50;
    }
    var_f5a1c26a = 0;
    while (var_f5a1c26a < var_10ff40e4) {
        result = level waittill(#"hash_7de17e8051b0d8d2");
        var_135c0555 = result.entity;
        attacker = result.attacker;
        if (isdefined(var_135c0555) && isdefined(self.var_547f9dd5)) {
            var_c2b976ac = zm_gold_main_quest::function_db7e1556(var_135c0555, self.var_547f9dd5);
            if (var_c2b976ac.dis <= 600) {
                var_135c0555.var_923bed7a = var_c2b976ac.entity;
                var_135c0555 clientfield::set("" + #"hash_5342c00e940ad12b", 1);
                var_f5a1c26a++;
                sndonoverride_eye_(var_f5a1c26a, var_10ff40e4);
            }
            if (!isinarray(self.var_cc514373, attacker)) {
                if (!isdefined(self.var_cc514373)) {
                    self.var_cc514373 = [];
                } else if (!isarray(self.var_cc514373)) {
                    self.var_cc514373 = array(self.var_cc514373);
                }
                if (!isinarray(self.var_cc514373, attacker)) {
                    self.var_cc514373[self.var_cc514373.size] = attacker;
                }
            }
        }
    }
    var_3b0cab15 = 4000;
    if (is_true(self.var_3dacb34d)) {
        var_3b0cab15 = 100000;
    }
    if (self.var_2b239c6f <= var_3b0cab15) {
        self thread function_21a9e71b(1);
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 1, eflags: 0x2 linked
// Checksum 0x580d81df, Offset: 0x2c28
// Size: 0xb8
function function_559a9ad3(params) {
    e_attacker = params.eattacker;
    damage_mod = params.smeansofdeath;
    if ((isplayer(e_attacker) || is_true(self.nuked)) && self.team === level.zombie_team) {
        level notify(#"hash_7de17e8051b0d8d2", {#entity:self, #attacker:e_attacker});
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 3, eflags: 0x2 linked
// Checksum 0xe76ff96e, Offset: 0x2ce8
// Size: 0x2c0
function function_30f8cfb4(satellite, zone_index, var_14a22ccd = 0) {
    level endon(#"end_game", "captured_control_point" + zone_index, "failed_control_point" + zone_index, #"defend_succeed", #"hash_397aa803a58d2ea3", #"hash_3e765c26047c9f54");
    e_objective = satellite.mdl;
    var_9bb2940e = #"hash_3859482a0c5aa91f";
    if (var_14a22ccd) {
        e_objective = self;
        var_9bb2940e = #"hash_7918446edcdf4bdd";
    }
    zm_sq::function_266d66eb(#"hash_1598ff25b76743dd", e_objective, undefined, undefined, #"hash_8602209567f541c", undefined, &zm_gold_util::function_13ebb331, "vol_player_in_firebase");
    zm_sq::function_3029d343(#"hash_8602209567f541c", e_objective);
    zm_sq::function_266d66eb(#"hash_68f4e9062d28524d", e_objective, undefined, var_9bb2940e, #"hash_3e7926c5aefe4406", undefined, &zm_gold_util::function_13ebb331, "vol_player_in_firebase");
    while (true) {
        result = self waittill(#"damage");
        if (!isplayer(result.attacker)) {
            level notify("damage" + zone_index, {#amount:result.amount, #var_e3276b1e:satellite.mdl});
            satellite thread function_49401276(e_objective);
            if (isdefined(result.attacker)) {
                playsoundatposition(#"hash_2b4962dfa0b1e01", self.origin);
            }
            if (!var_14a22ccd && isdefined(satellite.mdl)) {
                satellite.mdl clientfield::increment("" + #"hash_354f2f0ca110088b");
            }
        }
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 1, eflags: 0x2 linked
// Checksum 0x332e0363, Offset: 0x2fb0
// Size: 0x194
function function_49401276(e_objective) {
    level endon(#"hash_3e765c26047c9f54");
    self endon(#"hash_3ff994bb36bd6fa0");
    self.var_94d080b = 3;
    if (self flag::get(#"hash_4677a94e0a997ed7")) {
        return;
    }
    self flag::set(#"hash_4677a94e0a997ed7");
    while (self.var_94d080b > 0) {
        for (i = 0; i < 2; i++) {
            var_cc3dc062 = #"hash_3e7926c5aefe4406";
            var_ff8e0f2d = #"hash_8602209567f541c";
            if (i > 0) {
                var_cc3dc062 = #"hash_8602209567f541c";
                var_ff8e0f2d = #"hash_3e7926c5aefe4406";
            }
            zm_sq::function_aee0b4b4(var_ff8e0f2d, e_objective);
            waitframe(1);
            zm_sq::function_3029d343(var_cc3dc062, e_objective);
            wait(0.5);
        }
        self.var_94d080b--;
    }
    self flag::clear(#"hash_4677a94e0a997ed7");
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 1, eflags: 0x2 linked
// Checksum 0xc93afafc, Offset: 0x3150
// Size: 0x14c
function function_640d77f3(var_931d409 = undefined) {
    if (isdefined(var_931d409)) {
        if (var_931d409) {
            level flag::clear("spawn_zombies");
        } else {
            level flag::set("spawn_zombies");
        }
        return;
    }
    var_dc5c4436 = 0;
    foreach (control_point in level.var_cc43b632) {
        if (control_point.var_269ad176 === 1) {
            var_dc5c4436 = 1;
            break;
        }
    }
    if (var_dc5c4436) {
        level flag::clear("spawn_zombies");
        return;
    }
    level flag::set("spawn_zombies");
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 1, eflags: 0x0
// Checksum 0x8142e2a1, Offset: 0x32a8
// Size: 0x2c
function function_ea727237(*params) {
    function_1eaaceab(self.var_8ae5ea26.var_f8e2e6ae);
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0x79e8eeaa, Offset: 0x32e0
// Size: 0x1e2
function function_e69a5ae5() {
    level endon(#"end_game", "captured_control_point" + self.script_int, "failed_control_point" + self.script_int, #"hash_3e765c26047c9f54");
    self endon(#"defend_succeed");
    while (true) {
        var_df9ba9f = getaiarchetypearray(#"zombie");
        foreach (ai in var_df9ba9f) {
            if (ai.zombie_move_speed !== "sprint" && !is_true(ai.in_the_ground) && ai getpathmode() !== "dont move") {
                str_zone = zm_zonemgr::get_zone_from_position(ai.origin, 1, 1);
                if (isdefined(str_zone) && isdefined(level.var_4b35561a) && isinarray(level.var_4b35561a, str_zone)) {
                    ai zombie_utility::set_zombie_run_cycle("sprint");
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 3, eflags: 0x2 linked
// Checksum 0x298bb362, Offset: 0x34d0
// Size: 0x590
function function_bc369205(var_14a22ccd = 0, var_17f8efd5 = 0, var_d219813c = 0) {
    level endon(#"end_game", "captured_control_point" + self.script_int, "failed_control_point" + self.script_int, #"hash_5dc90fb13f4ddf12", #"hash_22e4c4a43b33a4bd", #"hash_3e765c26047c9f54");
    self endon(#"defend_succeed");
    self thread function_2f28c166();
    if (!var_17f8efd5) {
        var_819b2764 = 1;
        var_7780c6f3 = 1;
        var_a79c7394 = 0;
        if (var_14a22ccd) {
            var_819b2764 = 0;
            if (level flag::get(#"hash_7a6662c944c5f275")) {
                var_a79c7394 = 1;
            }
        }
        foreach (e_player in getplayers()) {
            if (!level.var_7dbadc8c zm_control_point_hud::is_open(e_player)) {
                level.var_7dbadc8c zm_control_point_hud::open(e_player, 1);
            }
            level.var_7dbadc8c zm_control_point_hud::function_751f7270(e_player, var_819b2764);
            level.var_7dbadc8c zm_control_point_hud::function_338d48a0(e_player, var_7780c6f3);
            level.var_7dbadc8c zm_control_point_hud::function_a95c34f3(e_player, var_a79c7394);
            level.var_7dbadc8c zm_control_point_hud::function_a04ff29a(e_player, 0.025);
            if (var_819b2764 >= 1) {
                level.var_7dbadc8c zm_control_point_hud::function_62264c81(e_player, 0.025);
            }
            if (!level.var_31028c5d prototype_hud::is_open(e_player)) {
                level.var_31028c5d prototype_hud::open(e_player);
            }
        }
    }
    self flag::clear(#"hash_7288309470ca474f");
    while (true) {
        waitresult = level waittill("damage" + self.script_int);
        amount = waitresult.amount;
        var_3b0cab15 = 4000;
        if (!self flag::get(#"hash_7288309470ca474f")) {
            self flag::set(#"hash_7288309470ca474f");
            str_vo = #"hash_3029705148f472c1";
            if (!var_14a22ccd) {
                level thread function_9fed0352(self);
            } else {
                str_vo = #"hash_1f238da9ccf34af9";
            }
            level thread zm_vo::function_d6f8bbd9(str_vo, 0.5, function_a1ef346b());
        }
        if (is_true(self.var_3dacb34d)) {
            var_3b0cab15 = 100000;
        }
        if (self.var_2b239c6f > var_3b0cab15) {
            self thread function_21a9e71b(0, var_14a22ccd, var_d219813c);
        } else {
            self.var_2b239c6f += amount;
        }
        if (!var_17f8efd5) {
            sndonoverride_eye_(self.var_2b239c6f, var_3b0cab15, 1);
        }
        if (!self.var_16ad7e31 && self.var_2b239c6f >= 2000) {
            self.var_16ad7e31 = 1;
            self.mdl_tag clientfield::set("" + #"hash_4824b5ad2c6adfcf", 1);
        }
        if (!self.var_ff770ca && self.var_2b239c6f >= 3000) {
            self.var_ff770ca = 1;
            self.mdl_tag clientfield::set("" + #"hash_33fa936b763918a", 1);
        }
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 1, eflags: 0x2 linked
// Checksum 0x407ccf3a, Offset: 0x3a68
// Size: 0x64
function function_9fed0352(var_32f76af8) {
    level endon(#"end_game");
    level waittill(#"end_of_round");
    if (isdefined(var_32f76af8)) {
        var_32f76af8 flag::clear(#"hash_7288309470ca474f");
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 3, eflags: 0x2 linked
// Checksum 0xc99a7aa5, Offset: 0x3ad8
// Size: 0x158
function sndonoverride_eye_(var_c8d0baba, max_points, var_a80d5874) {
    progress = var_c8d0baba / max_points;
    if (progress < 0.025) {
        progress = 0.025;
    } else if (progress > 1) {
        progress = 1;
    }
    foreach (e_player in getplayers()) {
        if (level.var_7dbadc8c zm_control_point_hud::is_open(e_player)) {
            if (is_true(var_a80d5874)) {
                level.var_7dbadc8c zm_control_point_hud::function_a04ff29a(e_player, progress);
                continue;
            }
            level.var_7dbadc8c zm_control_point_hud::function_62264c81(e_player, progress);
        }
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 3, eflags: 0x2 linked
// Checksum 0xff1c6925, Offset: 0x3c38
// Size: 0xd14
function function_21a9e71b(success, var_14a22ccd, *var_d219813c = 0) {
    level endon(#"end_game");
    callback::remove_on_ai_killed(&function_559a9ad3);
    callback::remove_on_ai_spawned(&function_de517a00);
    foreach (ai_zombie in getaiteamarray(level.zombie_team)) {
        function_9112b94e(ai_zombie);
    }
    level notify(#"hash_397aa803a58d2ea3");
    var_527d6d2 = self.var_547f9dd5;
    if (var_d219813c) {
        var_527d6d2 = [self];
    }
    foreach (cleanup in var_527d6d2) {
        if (var_d219813c) {
            attackable = cleanup.var_af9beb09;
        } else {
            attackable = cleanup.mdl;
        }
        if (isdefined(attackable)) {
            attackable.is_active = 0;
            attackable thread namespace_85745671::function_b70e2a37(attackable);
            attackable notify(#"hash_3ff994bb36bd6fa0");
            attackable flag::clear(#"hash_4677a94e0a997ed7");
        }
    }
    zm_sq::objective_complete(#"hash_8602209567f541c");
    zm_sq::objective_complete(#"hash_3e7926c5aefe4406");
    foreach (e_player in getplayers()) {
        if (isdefined(level.var_7dbadc8c) && level.var_7dbadc8c zm_control_point_hud::is_open(e_player)) {
            level.var_7dbadc8c zm_control_point_hud::close(e_player);
            level.var_7dbadc8c zm_control_point_hud::function_a95c34f3(e_player, 0);
        }
    }
    if (!var_d219813c && isdefined(level.var_6fad6ea9)) {
        level.zombie_ai_limit += level.var_6fad6ea9;
        level.var_6fad6ea9 = undefined;
        self.mdl_tag clientfield::set("" + #"hash_48cdaba6cfee3ee8", 0);
    }
    if (is_true(var_14a22ccd)) {
        namespace_b7a7e548::function_947330e6(self, #"power_on");
        self.var_269ad176 = 2;
        if (!var_d219813c) {
            self thread function_752dbea1(#"med");
            self thread function_8ab36f01();
            wait(3);
            level thread function_e8799ac6(self);
            self thread function_5bd01372(1);
            level thread zm_power::turn_power_on_and_open_doors(self.script_int);
            namespace_8dac58da::function_1a3aacac(self.script_int);
            self thread function_ef08f824();
            level thread namespace_47809ab2::function_b858693f(self.script_int);
            level notify(#"captured_control_point");
            level flag::set("captured_control_point" + self.script_int);
            self.mdl_tag clientfield::set("" + #"hash_221e597b28199323", 1);
            if (zm_utility::is_ee_enabled()) {
                level thread zm_gold_main_quest::function_9e39dad3(self.script_int);
            }
            foreach (satellite in self.var_547f9dd5) {
                satellite.mdl clientfield::set("" + #"hash_4cf52ac8c941f331", 0);
                satellite.mdl clientfield::set("" + #"hash_20b22d2242b107cc", 1);
            }
            /#
                iprintlnbold("<unknown string>" + self.script_int);
                iprintlnbold("<unknown string>");
            #/
        }
    } else {
        namespace_b7a7e548::function_947330e6(self, #"power_off");
        namespace_b7a7e548::function_83285a17(self, 0);
        self thread function_5bd01372();
        self.var_269ad176 = 0;
        namespace_8dac58da::function_1a3aacac(self.script_int + 3);
        self.mdl_tag clientfield::set("" + #"hash_221e597b28199323", 0);
        self notify(#"hash_327866e1223171e5");
        self notify(#"hash_27ce7699e31c77b");
        if (self flag::get(#"exploded")) {
            self.var_af9beb09 clientfield::set("" + #"hash_11d9c3835adcaece", 0);
            self.var_af9beb09 thread scene::play(#"hash_5ee79d3fbd128d25", "collapse_fall", self.var_af9beb09);
            self flag::clear(#"exploded");
        } else {
            self.var_af9beb09 scene::stop();
            self.var_af9beb09 scene::init(#"hash_5ee79d3fbd128d25", self.var_af9beb09);
        }
        foreach (satellite in self.var_547f9dd5) {
            satellite.mdl clientfield::set("" + #"hash_20b22d2242b107cc", 0);
            satellite notify(#"hash_27ce7699e31c77b");
            satellite thread scene::play(#"hash_e47497b4ff880f5", "stop");
        }
        if (level flag::get("power_on" + self.script_int)) {
            level flag::clear("power_on" + self.script_int);
        }
        if (var_d219813c) {
            level flag::set(#"hash_6b46a8438582259d");
            level notify(#"hash_63059cf6806229ba");
            self.var_56d2adea = level.round_number + 1;
            self thread function_afa5893c();
            level thread zm_gold_vo::function_df0c6e4e();
            foreach (e_player in getplayers()) {
                level.var_31028c5d prototype_hud::set_active_objective_string(e_player, #"");
                level.var_31028c5d prototype_hud::function_817e4d10(e_player, 0);
                level.var_31028c5d prototype_hud::function_1b05e380(e_player, 0);
            }
        }
        if (zm_utility::is_ee_enabled()) {
            level thread zm_gold_main_quest::function_1621782d(self.script_int);
        }
        level thread namespace_47809ab2::function_1f622ac(self.script_int);
        level flag::set("failed_control_point" + self.script_int);
        level flag::clear("captured_control_point" + self.script_int);
        level notify(#"failed_control_point");
        playsoundatposition(#"hash_1e81b38b571878ba", self.origin);
    }
    if (!level flag::get(#"pap_quest_completed")) {
        zm_gold_pap_quest::function_b8854133();
    }
    level flag::clear(#"hash_1c70d74ceb5e9aa2");
    self.mdl_tag clientfield::set("" + #"hash_4824b5ad2c6adfcf", 0);
    self.mdl_tag clientfield::set("" + #"hash_33fa936b763918a", 0);
    if (!var_d219813c) {
        level flag::clear(#"hash_5dce120a8e013b48");
        thread namespace_4ce4e65e::function_453254ee();
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 1, eflags: 0x2 linked
// Checksum 0x12559156, Offset: 0x4958
// Size: 0x6c
function function_5bd01372(var_5e21d8ec = 0) {
    if (!isdefined(self.var_1c10e39f)) {
        self.var_1c10e39f = 0;
    }
    if (self.var_1c10e39f != var_5e21d8ec) {
        self.var_1c10e39f = var_5e21d8ec;
        util::clientnotify(self.script_string);
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 1, eflags: 0x2 linked
// Checksum 0x5022cf3c, Offset: 0x49d0
// Size: 0x2ec
function function_e8799ac6(var_32f76af8) {
    function_640d77f3(1);
    var_17c7dbe6 = arraysortclosest(zombie_utility::get_zombie_array(), var_32f76af8.origin, undefined, 0, 1024);
    foreach (var_ccea7dbf in var_17c7dbe6) {
        if (isalive(var_ccea7dbf)) {
            level.zombie_total++;
            level.zombie_respawns++;
            level.zombie_total_subtract++;
            if (math::cointoss()) {
                gibserverutils::gibhead(var_ccea7dbf);
            }
            if (math::cointoss()) {
                if (math::cointoss()) {
                    gibserverutils::gibleftarm(var_ccea7dbf);
                } else {
                    gibserverutils::gibrightarm(var_ccea7dbf);
                }
            }
            if (math::cointoss()) {
                if (math::cointoss()) {
                    gibserverutils::gibleftleg(var_ccea7dbf);
                } else {
                    gibserverutils::gibrightleg(var_ccea7dbf);
                }
            }
            n_random_x = randomfloatrange(-3, 3);
            n_random_y = randomfloatrange(-3, 3);
            v_fling = 150 * vectornormalize(var_ccea7dbf.origin - var_32f76af8.origin + (n_random_x, n_random_y, 500));
            var_ccea7dbf.var_d45ca662 = 1;
            var_ccea7dbf.var_98f1f37c = 1;
            var_ccea7dbf thread zm_utility::function_ffc279(v_fling, var_ccea7dbf);
        }
    }
    level thread zm_utility::function_9ad5aeb1(1, 1, 0, 0);
    wait(8);
    function_640d77f3(0);
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0x82a66f31, Offset: 0x4cc8
// Size: 0x156
function function_bf606a73() {
    level endon(#"hash_3e765c26047c9f54");
    self endon(#"death");
    self callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_fd68cae4);
    while (true) {
        a_players = getplayers();
        player = array::get_all_closest(self.origin, a_players)[0];
        namespace_85745671::function_744beb04(self);
        if (!isdefined(self.var_b7e90547) && isalive(self) && !isdefined(self.var_b238ef38) && isalive(player)) {
            self.var_b7e90547 = 1;
            awareness::function_c241ef9a(self, player, 15);
        }
        wait(15);
        self.var_b7e90547 = undefined;
        self.var_ff290a61 = undefined;
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0x1826beee, Offset: 0x4e28
// Size: 0x3c
function function_fd68cae4() {
    if (self.archetype == #"zombie") {
        self namespace_85745671::function_9758722("sprint");
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x2 linked
// Checksum 0x716e683c, Offset: 0x4e70
// Size: 0x108
function function_ef08f824() {
    if (isdefined(self.var_cc514373)) {
        foreach (player in getplayers()) {
            if (isinarray(self.var_cc514373, player)) {
                if (player === self.activator) {
                    scoreevents::processscoreevent(#"hash_338f0007dcc1d9df", player);
                    continue;
                }
                scoreevents::processscoreevent(#"hash_578cee6e9f63bcd3", player);
            }
        }
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 6, eflags: 0x2 linked
// Checksum 0x764a34b9, Offset: 0x4f80
// Size: 0x37e
function function_bdb2b85b(origin, angles, radius, num_spots, zone_name, max_height = 512) {
    level endon(#"game_ended");
    slots = [];
    mins = (-10, -10, 0);
    maxs = (10, 10, 48);
    /#
        record3dtext("<unknown string>", origin, (0, 0, 1));
    #/
    for (i = 0; i < num_spots; i++) {
        t = mapfloat(0, num_spots, 0, 360, i);
        x = radius * cos(t + angles[1]);
        y = radius * sin(t + angles[1]);
        pos = (x, y, 0) + origin;
        var_e07c7e8 = physicstrace(pos + (0, 0, 10), pos + (0, 0, -10), mins, maxs, self, 1);
        var_c060661b = var_e07c7e8[#"position"];
        var_3e98a413 = getclosestpointonnavmesh(var_c060661b, 64, 15);
        if (isdefined(var_3e98a413)) {
            if (abs(var_3e98a413[2] - origin[2]) <= max_height) {
                var_bb3288df = zm_zonemgr::get_zone_from_position(var_3e98a413, 1);
                if (var_bb3288df === zone_name) {
                    /#
                        recordstar(var_3e98a413, (0, 1, 0));
                    #/
                    if (!isdefined(level.available_slots)) {
                        level.available_slots = [];
                    } else if (!isarray(level.available_slots)) {
                        level.available_slots = array(level.available_slots);
                    }
                    if (!isinarray(level.available_slots, var_3e98a413)) {
                        level.available_slots[level.available_slots.size] = var_3e98a413;
                    }
                    slots[slots.size] = {#origin:var_3e98a413, #on_navmesh:1};
                }
            }
        }
        if (i % 2 == 1) {
            waitframe(1);
        }
    }
    return slots;
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x6 linked
// Checksum 0xa2d2064f, Offset: 0x5308
// Size: 0xb2
function private function_afa5893c() {
    self notify("69d00b780355467d");
    self endon("69d00b780355467d");
    level endon(#"end_game", #"game_ended", #"hash_3e765c26047c9f54");
    while (true) {
        if (level.round_number == self.var_56d2adea) {
            level zm_vo::function_d6f8bbd9(#"hash_51289ba87392a862", 5, function_a1ef346b());
            break;
        }
        wait(1);
    }
}

// Namespace namespace_f7b3ed9/namespace_f7b3ed9
// Params 0, eflags: 0x6 linked
// Checksum 0xdd723c15, Offset: 0x53c8
// Size: 0x144
function private function_2f28c166() {
    self notify("49c2422d7007c933");
    self endon("49c2422d7007c933");
    level endon(#"end_game", "captured_control_point" + self.script_int, "failed_control_point" + self.script_int, #"hash_5dc90fb13f4ddf12", #"hash_22e4c4a43b33a4bd", #"hash_3e765c26047c9f54");
    while (true) {
        if (self.var_2b239c6f > 2000) {
            level thread zm_vo::function_d6f8bbd9(#"hash_5aa4b5320ce722e0", undefined, function_a1ef346b());
            break;
        }
        wait(0.5);
    }
    while (true) {
        if (self.var_2b239c6f > 3400) {
            level thread zm_vo::function_d6f8bbd9(#"hash_a7e5d16b0fe0df", undefined, function_a1ef346b());
            break;
        }
        wait(0.5);
    }
}

/#

    // Namespace namespace_f7b3ed9/namespace_f7b3ed9
    // Params 0, eflags: 0x0
    // Checksum 0x94d79d54, Offset: 0x5518
    // Size: 0x8c
    function function_37597f29() {
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        zm_devgui::add_custom_devgui_callback(&cmd);
    }

    // Namespace namespace_f7b3ed9/namespace_f7b3ed9
    // Params 1, eflags: 0x0
    // Checksum 0x1334d3db, Offset: 0x55b0
    // Size: 0xd2
    function cmd(cmd) {
        switch (cmd) {
        case #"hash_4d05810932ce7723":
            function_2ecb6786();
            break;
        case #"hash_5076e04551545ed9":
            function_b2d9913a();
            break;
        case #"hash_69d305bb8a491ab8":
            function_c4d7b0f0();
            break;
        case #"hash_3cc8f8a1ca5d7c9b":
            function_353c005c();
            break;
        default:
            break;
        }
    }

    // Namespace namespace_f7b3ed9/namespace_f7b3ed9
    // Params 0, eflags: 0x0
    // Checksum 0xea86fafa, Offset: 0x5690
    // Size: 0x9c
    function function_2ecb6786() {
        foreach (control_point in level.var_cc43b632) {
            control_point.var_3dacb34d = 1;
        }
        iprintlnbold("<unknown string>");
    }

    // Namespace namespace_f7b3ed9/namespace_f7b3ed9
    // Params 0, eflags: 0x0
    // Checksum 0x4bb1433e, Offset: 0x5738
    // Size: 0x1fc
    function function_b2d9913a() {
        foreach (control_point in level.var_cc43b632) {
            if (isdefined(control_point.mdl_tag)) {
                control_point.mdl_tag clientfield::set("<unknown string>" + #"hash_221e597b28199323", 0);
                control_point.mdl_tag clientfield::set("<unknown string>" + #"hash_48cdaba6cfee3ee8", 1);
            }
            satellites = struct::get_array(control_point.target, "<unknown string>");
            foreach (satellite in satellites) {
                if (isdefined(satellite.mdl)) {
                    satellite.mdl clientfield::set("<unknown string>" + #"hash_20b22d2242b107cc", 0);
                    satellite.mdl clientfield::set("<unknown string>" + #"hash_4cf52ac8c941f331", 1);
                }
            }
        }
    }

    // Namespace namespace_f7b3ed9/namespace_f7b3ed9
    // Params 0, eflags: 0x0
    // Checksum 0x1575ce4d, Offset: 0x5940
    // Size: 0x1fc
    function function_c4d7b0f0() {
        foreach (control_point in level.var_cc43b632) {
            if (isdefined(control_point.mdl_tag)) {
                control_point.mdl_tag clientfield::set("<unknown string>" + #"hash_48cdaba6cfee3ee8", 0);
                control_point.mdl_tag clientfield::set("<unknown string>" + #"hash_221e597b28199323", 1);
            }
            satellites = struct::get_array(control_point.target, "<unknown string>");
            foreach (satellite in satellites) {
                if (isdefined(satellite.mdl)) {
                    satellite.mdl clientfield::set("<unknown string>" + #"hash_4cf52ac8c941f331", 0);
                    satellite.mdl clientfield::set("<unknown string>" + #"hash_20b22d2242b107cc", 1);
                }
            }
        }
    }

    // Namespace namespace_f7b3ed9/namespace_f7b3ed9
    // Params 0, eflags: 0x0
    // Checksum 0x2c36f67f, Offset: 0x5b48
    // Size: 0x1ec
    function function_353c005c() {
        foreach (control_point in level.var_cc43b632) {
            if (isdefined(control_point.mdl_tag)) {
                control_point.mdl_tag clientfield::set("<unknown string>" + #"hash_48cdaba6cfee3ee8", 0);
                control_point.mdl_tag clientfield::set("<unknown string>" + #"hash_221e597b28199323", 0);
            }
            satellites = struct::get_array(control_point.target, "<unknown string>");
            foreach (satellite in satellites) {
                if (isdefined(satellite.mdl)) {
                    satellite.mdl clientfield::set("<unknown string>" + #"hash_4cf52ac8c941f331", 0);
                    satellite.mdl clientfield::set("<unknown string>" + #"hash_20b22d2242b107cc", 0);
                }
            }
        }
    }

#/
