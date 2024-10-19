// Atian COD Tools GSC CW decompiler test
#using script_18077945bb84ede7;
#using script_12538a87a80a2978;
#using script_6155d71e1c9a57eb;
#using script_7b1cd3908a825fdd;
#using script_113dd7f0ea2a1d4f;
#using scripts\zm\ai\zm_ai_hulk.gsc;
#using scripts\zm_common\aats\zm_aat.gsc;
#using scripts\zm_common\objective_manager.gsc;
#using scripts\zm_common\zm_wallbuy.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility_zsurvival.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_player.gsc;
#using script_4421226bbc54b398;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using script_2618e0f3e5e11649;
#using scripts\core_common\values_shared.gsc;
#using script_340a2e805e35f7a2;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\item_drop.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\content_manager.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_85b89288;

// Namespace namespace_85b89288/namespace_85b89288
// Params 0, eflags: 0x5
// Checksum 0x2e78f977, Offset: 0x420
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"hash_621e37612030164f", &preinit, undefined, undefined, undefined);
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 0, eflags: 0x6 linked
// Checksum 0x73abb9ea, Offset: 0x468
// Size: 0x214
function private preinit() {
    if (is_true(getgametypesetting(#"hash_1e1a5ebefe2772ba"))) {
        level.var_53bc31ad = 1;
        level.var_149a60e7 = 1;
        level.var_f045e945 = 30;
        level.var_11cc6ef9 = 0.5;
        level.var_9fbbf524 = &function_1bcf260b;
        level.var_acd0f67e = 9;
        setgametypesetting(#"hash_f3d3533f21841ae", 1);
        level callback::add_callback(#"hash_3ca80e35288a78d0", &function_1f01cc3b);
        callback::on_game_playing(&on_game_playing);
        level.var_4e5449b1 = [];
        if (level.script === #"mp_dune") {
            function_549c8ed1((-1977, -973, 936), 225, 128, 45);
            return;
        }
        if (level.script === #"wz_duga") {
            function_549c8ed1((2294.5, 2921, 2816), 200, 128, 30);
            return;
        }
        if (level.script === #"wz_golova") {
            function_549c8ed1((-19440, 4163, 1848), 24, 65, 30);
        }
    }
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 0, eflags: 0x2 linked
// Checksum 0x5bd7c368, Offset: 0x688
// Size: 0x1c
function on_game_playing() {
    level thread function_c8fb4513();
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 2, eflags: 0x2 linked
// Checksum 0x2b49ec25, Offset: 0x6b0
// Size: 0x600
function function_c8fb4513(var_63c85287 = 600, var_1f7b3936 = int(600 / 5)) {
    level flag::wait_till_all([#"intro_scene_done", #"start_zombie_round_logic"]);
    var_9c1ed9ea = "collapse_underscore";
    if (isdefined(level.var_f546b995)) {
        var_9c1ed9ea = "collapse_underscore_" + level.var_f546b995;
        level.var_75b02512 = "objective_" + level.var_f546b995;
        level.var_e6512c09 = "gameover_survival_halloween";
    }
    namespace_9b972177::function_9f5c2ff2(var_9c1ed9ea);
    level thread function_e0d97436();
    var_135e25da = function_a42a57d2();
    foreach (var_495727a3 in var_135e25da) {
        content_manager::spawn_instance(var_495727a3);
    }
    level.var_20c6962b = array::random([#"strauss", #"grey", #"carver"]);
    function_877c8d9c("objectiveBoostStartCollapseStrauss", "objectiveBoostStartCollapseGrey", "objectiveBoostStartCollapseCarver", 2);
    level thread zm_vo::function_7622cb70("objectiveBoostStartCollapseResponse", 2);
    level thread objective_manager::start_timer(var_63c85287, "collapse");
    level thread function_ab0f88ca();
    foreach (player in getplayers()) {
        level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_513d77a3a7ff9312");
        level.var_31028c5d prototype_hud::function_817e4d10(player, 2);
    }
    n_time_remaining = var_63c85287 + 1;
    var_13bba26f = 0;
    while (n_time_remaining > 0) {
        if (level flag::get(#"hash_742b43f40747c72a")) {
            break;
        }
        if (var_13bba26f == var_1f7b3936) {
            var_13bba26f = 0;
            level thread function_8c6ab347();
        }
        n_time_remaining -= 1;
        var_13bba26f += 1;
        wait(1);
    }
    objective_manager::stop_timer();
    var_e2062f3 = function_a68a96e7();
    level.var_f045e945 = undefined;
    level notify(#"hash_58abffc4e8e535c7");
    if (!isdefined(var_e2062f3)) {
        assertmsg("<unknown string>" + (isdefined(level.script) ? level.script : "<unknown string>") + "<unknown string>");
        level notify(#"end_game", {#reason:#"hash_22a0611dcd352614"});
        return;
    }
    content_manager::spawn_instance(var_e2062f3);
    level notify(#"hash_3e765c26047c9f54");
    level flag::set(#"hash_742b43f40747c72a");
    s_result = level waittill(#"objective_ended");
    if (is_true(s_result.completed)) {
        str_reason = #"hash_6ebafb1370ab6c93";
        level.winningteam = #"allies";
    } else {
        str_reason = #"hash_22a0611dcd352614";
        level.winningteam = #"axis";
    }
    level notify(#"end_game", {#reason:str_reason});
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 0, eflags: 0x2 linked
// Checksum 0xbd38a064, Offset: 0xcb8
// Size: 0x3c
function function_e0d97436() {
    wait(1);
    namespace_ce1f29cc::function_368a7cde();
    level flag::clear(#"hash_44074059e3987765");
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 0, eflags: 0x2 linked
// Checksum 0xc2ad1d58, Offset: 0xd00
// Size: 0x6b4
function function_8c6ab347() {
    self notify("f1ef72c19e21995");
    self endon("f1ef72c19e21995");
    function_4718251f();
    callback::callback(#"hash_4ce318cfe14b54e7");
    level.var_64606faa = 0;
    namespace_553954de::function_7c97e961(level.var_b48509f9 + 1);
    level notify(#"hash_6a805bca389d1daf");
    level flag::wait_till_clear(#"hash_21921ed511559aa3");
    switch (level.var_b48509f9) {
    case 2:
        changeadvertisedstatus(0);
        level thread function_877c8d9c("objectiveCollapseDifficultyIncreaseTwoStrauss", "objectiveCollapseDifficultyIncreaseTwoGrey", "objectiveCollapseDifficultyIncreaseTwoCarver", 3);
        break;
    case 3:
        level thread function_877c8d9c("objectiveCollapseDifficultyIncreaseTwoStrauss", "objectiveCollapseDifficultyIncreaseTwoGrey", "objectiveCollapseDifficultyIncreaseTwoCarver", 3);
        break;
    case 4:
        level thread zm_vo::function_7622cb70("objectiveCollapseDifficultyIncreaseThree", 3);
        break;
    case 5:
        level thread zm_vo::function_7622cb70("objectiveCollapseDifficultyIncreaseFour", 3);
        break;
    case 6:
        break;
    }
    a_ai = getaiteamarray(level.zombie_team);
    foreach (ai in a_ai) {
        if (!(ai.var_6f84b820 === #"normal")) {
            ai.var_d45ca662 = 1;
        }
    }
    array::thread_all(getplayers(), &val::set, #"hash_7a406b91ff079d07", "takedamage", 0);
    array::thread_all(getplayers(), &val::set, #"hash_7a406b91ff079d07", "ignoreme", 1);
    foreach (player in getplayers()) {
        player playlocalsound(#"evt_nuke_flash");
    }
    level thread zm_utility::function_9ad5aeb1(0, 1, 1, 1);
    level thread function_ec609754(level.var_b48509f9);
    wait(3);
    array::thread_all(getplayers(), &val::reset, #"hash_7a406b91ff079d07", "takedamage");
    array::thread_all(getplayers(), &val::reset, #"hash_7a406b91ff079d07", "ignoreme");
    level thread function_4b10f2d6();
    level flag::clear("spawn_zombies");
    players = getplayers();
    foreach (player in players) {
        player luinotifyevent(#"hash_5b1ff06d07e9002a", 3, 2, level.var_b48509f9, 0);
    }
    foreach (player in getplayers()) {
        player namespace_d4ecbbf0::function_a2d61378(level.var_b48509f9 - 1, 3);
        player namespace_d4ecbbf0::function_e32813ee(level.var_b48509f9 - 1, 3, 1);
    }
    wait(10);
    level flag::set("spawn_zombies");
    level thread function_ab0f88ca();
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 1, eflags: 0x2 linked
// Checksum 0xe2c40861, Offset: 0x13c0
// Size: 0x60a
function function_ec609754(n_difficulty) {
    if (!isarray(level.contentmanager.spawnedinstances[#"wallbuy"])) {
        return;
    }
    self notify("4ab74cc0629a2b86");
    self endon("4ab74cc0629a2b86");
    foreach (instance in level.contentmanager.spawnedinstances[#"wallbuy"]) {
        foreach (chalk in instance.contentgroups[#"wallbuy_chalk"]) {
            if (isdefined(chalk.trigger.weapon.name) && isdefined(chalk.trigger.rarity) && isdefined(chalk.trigger) && isdefined(chalk.trigger.weapon.displayname) && is_true(chalk.trigger.var_9f32a5f4) && chalk.trigger.rarity != "orange") {
                n_chance = 0;
                switch (n_difficulty) {
                case 1:
                    break;
                case 2:
                    if (chalk.trigger.rarity == "green") {
                        n_chance = 45;
                    } else if (chalk.trigger.rarity == "blue") {
                        n_chance = 10;
                    } else if (chalk.trigger.rarity == "purple") {
                        n_chance = 7;
                    }
                    break;
                case 3:
                    if (chalk.trigger.rarity == "green") {
                        n_chance = 74;
                    } else if (chalk.trigger.rarity == "blue") {
                        n_chance = 19;
                    } else if (chalk.trigger.rarity == "purple") {
                        n_chance = 9;
                    }
                    break;
                case 4:
                    if (chalk.trigger.rarity == "green") {
                        n_chance = 95;
                    } else if (chalk.trigger.rarity == "blue") {
                        n_chance = 73;
                    } else if (chalk.trigger.rarity == "purple") {
                        n_chance = 18;
                    }
                    break;
                case 5:
                    if (chalk.trigger.rarity == "green") {
                        n_chance = 100;
                    } else if (chalk.trigger.rarity == "blue") {
                        n_chance = 100;
                    } else if (chalk.trigger.rarity == "purple") {
                        n_chance = 63;
                    }
                    break;
                case 6:
                default:
                    if (chalk.trigger.rarity == "green") {
                        n_chance = 100;
                    } else if (chalk.trigger.rarity == "blue") {
                        n_chance = 100;
                    } else if (chalk.trigger.rarity == "purple") {
                        n_chance = 90;
                    }
                    break;
                }
                if (math::cointoss(n_chance)) {
                    switch (chalk.trigger.rarity) {
                    case #"green":
                        new_rarity = "blue";
                        break;
                    case #"blue":
                        new_rarity = "purple";
                        break;
                    case #"purple":
                    default:
                        new_rarity = "orange";
                        break;
                    }
                    zm_wallbuy::function_26b21477(chalk, new_rarity);
                    waitframe(1);
                }
            }
        }
    }
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 0, eflags: 0x6 linked
// Checksum 0x15b4db00, Offset: 0x19d8
// Size: 0x90
function private function_4718251f() {
    foreach (player in getplayers()) {
        player zm_player::spectator_respawn_player();
    }
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 0, eflags: 0x2 linked
// Checksum 0x69dced43, Offset: 0x1a70
// Size: 0x24
function function_1bcf260b() {
    wait(randomfloatrange(0.5, 2));
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 4, eflags: 0x2 linked
// Checksum 0xa0fd57ff, Offset: 0x1aa0
// Size: 0xd2
function function_877c8d9c(var_b2825a6f, var_bee6a2c9, var_eb773ad6, n_delay) {
    switch (level.var_20c6962b) {
    case #"strauss":
        level zm_vo::function_7622cb70(var_b2825a6f, n_delay);
        break;
    case #"grey":
        level zm_vo::function_7622cb70(var_bee6a2c9, n_delay);
        break;
    case #"carver":
        level zm_vo::function_7622cb70(var_eb773ad6, n_delay);
        break;
    }
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 0, eflags: 0x2 linked
// Checksum 0xc105dc76, Offset: 0x1b80
// Size: 0x1b0
function function_4b10f2d6() {
    a_ai = getaiteamarray(level.zombie_team);
    foreach (ai in a_ai) {
        if (isalive(ai)) {
            var_bb17225f = ai.health / ai.maxhealth;
            ai zm_utility::init_zombie_run_cycle();
            ai._starting_round_number = zm_utility::get_round_number();
            if (isdefined(ai.aitype) || isdefined(ai.archetype)) {
                var_d0aa45b6 = ai zm_ai_utility::function_f7014c3d(ai.basehealth);
            }
            if (isdefined(var_d0aa45b6) && var_d0aa45b6 > ai.maxhealth) {
                ai.maxhealth = int(var_d0aa45b6);
                ai setmaxhealth(ai.maxhealth);
                ai setnormalhealth(var_bb17225f);
            }
        }
    }
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 0, eflags: 0x2 linked
// Checksum 0x2addeeb1, Offset: 0x1d38
// Size: 0x3cc
function function_ab0f88ca() {
    self notify("59ba60f87992239b");
    self endon("59ba60f87992239b");
    level endon(#"hash_58abffc4e8e535c7", #"hash_6a805bca389d1daf", #"end_game");
    if (level.script === #"mp_black_sea") {
        var_2a291abf = 1500;
        n_delay = 15;
    } else {
        var_2a291abf = 3000;
        n_delay = 20;
    }
    var_ca838126 = getailimit();
    while (true) {
        a_players = function_a1ef346b();
        var_62455b3e = min(var_ca838126 / (a_players.size + 1), var_ca838126 / 3);
        foreach (player in a_players) {
            if (player laststand::player_is_in_laststand()) {
                continue;
            }
            var_6b6b0446 = player.origin + anglestoforward(player.angles) * 300;
            v_mod = namespace_591b4396::function_411bb920(player);
            v_dir = vectornormalize(var_6b6b0446 - player.origin + v_mod);
            v_spawn = player.origin + v_dir * var_2a291abf;
            if (level.script === #"mp_black_sea" || level.script === #"wz_forest") {
                var_c8311b6d = getnavfaceregion(v_spawn, 100);
                var_69ad0d71 = getnavfaceregion(player.origin, 100);
                if (!(isdefined(var_69ad0d71) && isdefined(var_c8311b6d)) || var_69ad0d71 !== var_c8311b6d) {
                    v_spawn = player.origin;
                }
            }
            /#
                if (getdvarint(#"hash_33b0be96bf3cd69a", 0) || getdvarint(#"hash_7466f1c38ea3ceab", 0)) {
                    cylinder(v_spawn, v_spawn + (0, 0, 5000), 500, (1, 0, 0), 0, n_delay * 20);
                }
            #/
            player thread namespace_591b4396::function_64df57fc(v_spawn, var_62455b3e);
        }
        level waittilltimeout(n_delay, #"hash_3babb5bf72d208da", #"hash_58df1e8b20eb71d2");
    }
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 0, eflags: 0x2 linked
// Checksum 0x2668d8bc, Offset: 0x2110
// Size: 0x1c6
function function_a42a57d2() {
    var_6581be33 = [];
    if (isdefined(level.contentmanager.currentdestination)) {
        foreach (location in level.contentmanager.currentdestination.locations) {
            instances = array::randomize(content_manager::get_children(location));
            foreach (instance in instances) {
                if (instance.content_script_name === #"safehouse") {
                    if (!isdefined(var_6581be33)) {
                        var_6581be33 = [];
                    } else if (!isarray(var_6581be33)) {
                        var_6581be33 = array(var_6581be33);
                    }
                    if (!isinarray(var_6581be33, instance)) {
                        var_6581be33[var_6581be33.size] = instance;
                    }
                }
            }
        }
    }
    return var_6581be33;
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 0, eflags: 0x2 linked
// Checksum 0xc5160406, Offset: 0x22e0
// Size: 0x352
function function_a68a96e7() {
    var_1dc01e72 = [];
    var_b81a64be = [];
    if (isdefined(level.contentmanager.currentdestination)) {
        foreach (location in level.contentmanager.currentdestination.locations) {
            instances = array::randomize(content_manager::get_children(location));
            foreach (instance in instances) {
                if (instance.content_script_name === #"exfil") {
                    if (!isdefined(var_b81a64be)) {
                        var_b81a64be = [];
                    } else if (!isarray(var_b81a64be)) {
                        var_b81a64be = array(var_b81a64be);
                    }
                    if (!isinarray(var_b81a64be, instance)) {
                        var_b81a64be[var_b81a64be.size] = instance;
                    }
                    if (!is_true(instance.var_ea25c617)) {
                        if (!isdefined(var_1dc01e72)) {
                            var_1dc01e72 = [];
                        } else if (!isarray(var_1dc01e72)) {
                            var_1dc01e72 = array(var_1dc01e72);
                        }
                        if (!isinarray(var_1dc01e72, instance)) {
                            var_1dc01e72[var_1dc01e72.size] = instance;
                        }
                    }
                }
            }
        }
    }
    v_pos = (0, 0, 0);
    foreach (player in function_a1ef346b()) {
        v_pos += player.origin;
    }
    v_pos /= function_a1ef346b().size;
    var_e2062f3 = arraygetfarthest(v_pos, var_1dc01e72);
    if (!isdefined(var_e2062f3)) {
        var_e2062f3 = array::random(var_b81a64be);
    }
    return var_e2062f3;
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 0, eflags: 0x2 linked
// Checksum 0xa1917a8a, Offset: 0x2640
// Size: 0x14
function function_1f01cc3b() {
    objective_manager::stop_timer();
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 4, eflags: 0x2 linked
// Checksum 0xe0c4528b, Offset: 0x2660
// Size: 0x18c
function function_549c8ed1(v_location, n_radius, n_height, n_time) {
    var_8bfc79f8 = spawn("trigger_radius", v_location, 0, n_radius, n_height);
    var_8bfc79f8.n_radius = n_radius;
    var_8bfc79f8.n_height = n_height;
    var_8bfc79f8.n_max_time = n_time;
    var_8bfc79f8 callback::on_trigger(&function_5cdaa521);
    var_c3ad43e6 = {#trigger:var_8bfc79f8, #n_time:n_time};
    if (!isdefined(level.var_4e5449b1)) {
        level.var_4e5449b1 = [];
    } else if (!isarray(level.var_4e5449b1)) {
        level.var_4e5449b1 = array(level.var_4e5449b1);
    }
    if (!isinarray(level.var_4e5449b1, var_c3ad43e6)) {
        level.var_4e5449b1[level.var_4e5449b1.size] = var_c3ad43e6;
    }
    /#
        var_8bfc79f8 thread function_6b8103bd();
    #/
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 1, eflags: 0x2 linked
// Checksum 0x4c1902f0, Offset: 0x27f8
// Size: 0x17c
function function_5cdaa521(params) {
    if (level flag::get(#"hash_742b43f40747c72a")) {
        return;
    }
    player = params.activator;
    if (isplayer(player) && isalive(player) && !is_true(player.var_2dac955e) && !player laststand::player_is_in_laststand() && !is_true(player.ignoreme)) {
        foreach (var_c3ad43e6 in level.var_4e5449b1) {
            if (var_c3ad43e6.trigger === self) {
                player thread function_e01cf436(var_c3ad43e6.trigger, var_c3ad43e6.n_time);
                break;
            }
        }
    }
}

// Namespace namespace_85b89288/namespace_85b89288
// Params 2, eflags: 0x2 linked
// Checksum 0xb27cdfe2, Offset: 0x2980
// Size: 0x4cc
function function_e01cf436(var_36b79a75, n_max_time = 30) {
    self notify("7fe01552ca743270");
    self endon("7fe01552ca743270");
    self endon(#"disconnect");
    self.var_2dac955e = 1;
    if (!isdefined(self.var_5946e38a)) {
        self.var_5946e38a = [];
    }
    arrayremovevalue(self.var_5946e38a, undefined);
    n_time = 0;
    /#
        var_36b79a75 notify(#"hash_6c4af0ee6174d8d3");
    #/
    while (isalive(self) && !self laststand::player_is_in_laststand()) {
        if (self istouching(var_36b79a75)) {
            n_time += float(function_60d95f53()) / 1000;
            /#
                function_3ff09157(var_36b79a75, n_time, 1);
            #/
        } else {
            n_time -= float(function_60d95f53()) / 1000 * 2;
            if (is_true(self.var_33c177a5) && n_time <= n_max_time / 3) {
                foreach (var_b9d62e05 in self.var_5946e38a) {
                    if (isdefined(var_b9d62e05)) {
                        var_b9d62e05 delete();
                    }
                }
                arrayremovevalue(self.var_5946e38a, undefined);
                self.var_33c177a5 = undefined;
            }
            /#
                function_3ff09157(var_36b79a75, n_time, 0);
            #/
        }
        if (n_time >= n_max_time && !is_true(self.ignoreme)) {
            v_start = self.origin + (0, 0, 2000) + anglestoforward(self.angles) * -2000;
            array::delete_all(self.var_5946e38a);
            arrayremovevalue(self.var_5946e38a, undefined);
            var_8214bfd5 = 4;
            for (i = 0; i < var_8214bfd5; i++) {
                if (isalive(self) && !self laststand::player_is_in_laststand()) {
                    var_b9d62e05 = zm_ai_hulk::function_eceecc98(undefined, v_start, self);
                    if (!isdefined(self.var_5946e38a)) {
                        self.var_5946e38a = [];
                    } else if (!isarray(self.var_5946e38a)) {
                        self.var_5946e38a = array(self.var_5946e38a);
                    }
                    if (!isinarray(self.var_5946e38a, var_b9d62e05)) {
                        self.var_5946e38a[self.var_5946e38a.size] = var_b9d62e05;
                    }
                    wait(0.25);
                }
            }
            self.var_33c177a5 = 1;
            n_time /= 2;
        }
        if (n_time <= 0) {
            break;
        }
        waitframe(1);
    }
    array::delete_all(self.var_5946e38a);
    arrayremovevalue(self.var_5946e38a, undefined);
    self.var_2dac955e = undefined;
    self.var_33c177a5 = undefined;
    /#
        var_36b79a75 thread function_6b8103bd();
    #/
}

/#

    // Namespace namespace_85b89288/namespace_85b89288
    // Params 0, eflags: 0x0
    // Checksum 0x53a077a3, Offset: 0x2e58
    // Size: 0x5e
    function function_6b8103bd() {
        self notify(#"hash_6c4af0ee6174d8d3");
        self endon(#"hash_6c4af0ee6174d8d3");
        while (true) {
            function_3ff09157(self, 0, 0);
            waitframe(1);
        }
    }

    // Namespace namespace_85b89288/namespace_85b89288
    // Params 3, eflags: 0x0
    // Checksum 0x1c7e00f4, Offset: 0x2ec0
    // Size: 0x264
    function function_3ff09157(var_36b79a75, n_current_time, b_inside) {
        if (!isdefined(b_inside)) {
            b_inside = 1;
        }
        if (getdvarint(#"hash_efbcdc90002337", 0)) {
            var_5c77052c = var_36b79a75.origin;
            var_9d01657b = (var_36b79a75.origin[0], var_36b79a75.origin[1], var_36b79a75.origin[2] + var_36b79a75.n_height);
            n_radius = var_36b79a75.n_radius;
            n_max_time = var_36b79a75.n_max_time;
            if (isdefined(var_9d01657b) && isdefined(var_5c77052c) && isdefined(n_radius)) {
                if (b_inside) {
                    debug2dtext((300, 600, 0), "<unknown string>" + (isdefined(n_current_time) ? n_current_time : 0) + "<unknown string>" + n_max_time, (1, 0, 0));
                    print3d(var_5c77052c + (0, 0, 40), "<unknown string>" + (isdefined(n_current_time) ? n_current_time : 0) + "<unknown string>" + n_max_time, (1, 0, 0), undefined, 0.1, 1, 1);
                    cylinder(var_5c77052c, var_9d01657b, n_radius, (1, 0, 0), undefined, 1);
                    return;
                }
                print3d(var_5c77052c + (0, 0, 40), "<unknown string>" + (isdefined(n_current_time) ? n_current_time : 0) + "<unknown string>" + n_max_time, (0, 1, 0), undefined, 0.25, 1, 1);
                cylinder(var_5c77052c, var_9d01657b, n_radius, (0, 1, 0), undefined, 1);
            }
        }
    }

#/
