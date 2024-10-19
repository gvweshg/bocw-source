// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\gametypes\globallogic.gsc;
#using script_5f261a5d57de5f7c;
#using scripts\zm_common\trials\zm_trial_disable_buys.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\bb.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using script_471b31bd963b388e;
#using scripts\core_common\item_world.gsc;
#using script_340a2e805e35f7a2;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\item_drop.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\content_manager.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_magicbox;

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x5
// Checksum 0x2ff3eea5, Offset: 0x5c8
// Size: 0x4c
function private autoexec __init__system__() {
    system::register(#"zm_magicbox", &preinit, &postinit, undefined, undefined);
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x6 linked
// Checksum 0xd52e89f9, Offset: 0x620
// Size: 0x34c
function private preinit() {
    level.start_chest_name = "start_chest";
    level._effect[#"hash_2ff87d61167ea531"] = #"hash_d66a9f5776f1fba";
    level._effect[#"hash_4048cb4967032c4a"] = #"hash_1e43d43c6586fcb5";
    level._effect[#"lght_marker"] = #"zombie/fx_weapon_box_marker_zmb";
    level._effect[#"lght_marker_flare"] = #"zombie/fx_weapon_box_marker_fl_zmb";
    level._effect[#"poltergeist"] = #"zombie/fx_barrier_buy_zmb";
    clientfield::register("zbarrier", "magicbox_open_fx", 1, 1, "int");
    clientfield::register("zbarrier", "magicbox_closed_fx", 1, 1, "int");
    clientfield::register("zbarrier", "magicbox_leave_fx", 1, 1, "counter");
    clientfield::register("zbarrier", "zbarrier_arriving_sounds", 1, 1, "counter");
    clientfield::register("zbarrier", "zbarrier_leaving_sounds", 1, 1, "counter");
    clientfield::register("zbarrier", "force_stream_magicbox", 1, 1, "int");
    clientfield::register("zbarrier", "force_stream_magicbox_leave", 1, 1, "int");
    clientfield::register("zbarrier", "" + #"hash_2fcdae6b889933c7", 1, 1, "int");
    clientfield::register("zbarrier", "" + #"hash_66b8b96e588ce1ac", 1, 3, "int");
    clientfield::register("toplayer", "stream_magicbox_guns", 1, 1, "int");
    level thread magicbox_host_migration();
    level.var_11ab9932 = [];
    content_manager::register_script("magicbox", &function_165d2388);
    callback::on_revived(&on_revived);
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x6 linked
// Checksum 0x56d7b9b9, Offset: 0x978
// Size: 0x164
function private postinit() {
    level flag::wait_till("start_zombie_round_logic");
    if (!isdefined(level.chest_joker_model)) {
        level.chest_joker_model = "p9_zm_ndu_magic_box_bunny";
    }
    if (!isdefined(level.magic_box_zbarrier_state_func)) {
        level.magic_box_zbarrier_state_func = &process_magic_box_zbarrier_state;
    }
    if (!isdefined(level.magic_box_check_equipment)) {
        level.magic_box_check_equipment = &default_magic_box_check_equipment;
    }
    if (!zm_utility::is_survival()) {
        treasure_chest_init(level.start_chest_name);
        if (is_true(zm_custom::function_901b751c(#"zmmysteryboxlimitround"))) {
            level thread function_338c302b();
        }
        level flag::set("magicbox_initialized");
    }
    if (!isdefined(level.var_a619f078)) {
        level.var_a619f078 = [];
    }
    if (!isdefined(level.var_940d400a)) {
        level.var_940d400a = [];
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 3, eflags: 0x0
// Checksum 0x7049544c, Offset: 0xae8
// Size: 0x3c
function function_fcbfc7e9(item, var_11d03b9a, var_6197f314) {
    level.var_a619f078[item] = var_6197f314;
    level.var_940d400a[item] = var_11d03b9a;
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x9de7d1d3, Offset: 0xb30
// Size: 0xf8
function on_revived() {
    self endon(#"death");
    if (!self zm_laststand::laststand_has_players_weapons_returned()) {
        self waittill(#"hash_9b426cce825928d");
    }
    if (isarray(level.chests)) {
        foreach (chest in level.chests) {
            if (isdefined(chest.trigger)) {
                chest.trigger function_3238e2f9(chest);
            }
        }
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x8db39a5e, Offset: 0xc30
// Size: 0x7c
function function_2dcb5cea(s_destination) {
    if (!zm_utility::is_survival()) {
        return;
    }
    level flag::wait_till("start_zombie_round_logic");
    waittillframeend();
    treasure_chest_init(level.start_chest_name, s_destination);
    level flag::set("magicbox_initialized");
}

// Namespace zm_magicbox/zm_magicbox
// Params 2, eflags: 0x2 linked
// Checksum 0x473230af, Offset: 0xcb8
// Size: 0x46c
function treasure_chest_init(start_chest_name, s_destination) {
    level.chest_moves = 0;
    level.chest_level = 0;
    level flag::clear("moving_chest_now");
    level.chests = [];
    if (isdefined(s_destination)) {
        foreach (s_location in s_destination.locations) {
            if (content_manager::function_fe9fb6fd(s_location)) {
                continue;
            }
            s_magicbox = s_location.instances[#"magicbox"];
            if (isdefined(s_magicbox)) {
                content_manager::spawn_instance(s_magicbox);
            }
        }
    } else {
        foreach (location in level.contentmanager.locations) {
            s_magicbox = location.instances[#"magicbox"];
            if (isdefined(s_magicbox)) {
                content_manager::spawn_instance(s_magicbox);
            }
        }
    }
    if (level.chests.size == 0) {
        return;
    }
    foreach (s_chest in level.chests) {
        s_chest.box_hacks = [];
        s_chest.orig_origin = s_chest.origin;
        if (isdefined(s_chest.zombie_cost)) {
            s_chest.old_cost = s_chest.zombie_cost;
            continue;
        }
        s_chest.old_cost = 950;
    }
    if (!is_true(level.enable_magic) || zm_custom::function_901b751c(#"zmmysteryboxstate") === 0) {
        foreach (s_chest in level.chests) {
            s_chest hide_chest();
        }
        return;
    }
    level.chest_accessed = 0;
    if (level flag::get(#"hash_6d89e1456f61e5ab")) {
        level.var_2c678640 = array::function_a3b0f814(level.chests, 0);
    }
    if (level.chests.size > 1) {
        level flag::set("moving_chest_enabled");
        level.chests = array::randomize(level.chests);
    } else {
        level.chest_index = 0;
        level.chests[0].no_fly_away = 1;
    }
    init_starting_chest_location(start_chest_name);
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x9d81f91e, Offset: 0x1130
// Size: 0x46c
function init_starting_chest_location(start_chest_name) {
    level.chest_index = 0;
    start_chest_found = 0;
    if (level.chests.size == 1) {
        start_chest_found = 1;
        if (isdefined(level.chests[level.chest_index].zbarrier)) {
            level.chests[level.chest_index].zbarrier set_magic_box_zbarrier_state("initial");
            level.chests[level.chest_index] thread zm_audio::function_ef9ba49c(#"box", 0, -1, 500, array("left", "trigger"));
        }
    } else if (zm_custom::function_901b751c(#"zmmysteryboxstate") == 3) {
        for (i = 0; i < level.chests.size; i++) {
            level.chests[i] function_2db086bf();
            level.chests[i].no_fly_away = 1;
            level.chests[i] thread show_chest();
        }
    } else if (zm_custom::function_901b751c(#"zmmysteryboxstate") == 1) {
        level.chest_index = -1;
        for (i = 0; i < level.chests.size; i++) {
            level.chests[i] hide_chest();
        }
    } else {
        for (i = 0; i < level.chests.size; i++) {
            if (is_true(level.random_pandora_box_start)) {
                if (start_chest_found || is_true(level.chests[i].start_exclude)) {
                    level.chests[i] hide_chest();
                } else {
                    level.chest_index = i;
                    level.chests[i] thread function_2db086bf();
                    start_chest_found = 1;
                }
                continue;
            }
            if (start_chest_found || !isdefined(level.chests[i].script_noteworthy) || !issubstr(level.chests[i].script_noteworthy, start_chest_name)) {
                level.chests[i] hide_chest();
                continue;
            }
            level.chest_index = i;
            level.chests[i] thread function_2db086bf();
            start_chest_found = 1;
        }
    }
    if (!isdefined(level.pandora_show_func)) {
        if (isdefined(level.custom_pandora_show_func)) {
            level.pandora_show_func = level.custom_pandora_show_func;
        } else {
            level.pandora_show_func = &default_pandora_show_func;
        }
    }
    if (!is_true(zm_custom::function_901b751c(#"zmmysteryboxstate") == 1)) {
        level.chests[level.chest_index] thread [[ level.pandora_show_func ]]();
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x6 linked
// Checksum 0x46ee1c6d, Offset: 0x15a8
// Size: 0x6c
function private function_62197845(str_notify) {
    if (str_notify === "death") {
        if (isdefined(self.weapon_model)) {
            self.weapon_model delete();
        }
        if (isdefined(self.weapon_model_dw)) {
            self.weapon_model_dw delete();
        }
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x0
// Checksum 0x68a28d5b, Offset: 0x1620
// Size: 0x1c
function set_treasure_chest_cost(cost) {
    level.zombie_treasure_chest_cost = cost;
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x52dd42fb, Offset: 0x1648
// Size: 0x2cc
function function_165d2388(s_instance) {
    a_s_chests = s_instance.contentgroups[#"magicbox_zbarrier"];
    foreach (s_chest in a_s_chests) {
        if (isdefined(s_chest.zbarrier) && !isstring(s_chest.zbarrier) && !ishash(s_chest.zbarrier) && (isentity(s_chest.zbarrier) || s_chest.zbarrier iszbarrier())) {
            var_a662d2c4 = 1;
        }
        if (isstring(s_chest.zbarrier)) {
            var_95140b5e = "zbarrier_" + s_chest.zbarrier;
        } else {
            var_95140b5e = "zbarrier_zmcore_magicbox";
        }
        if (!is_true(var_a662d2c4)) {
            s_chest.zbarrier = content_manager::spawn_zbarrier(s_chest, var_95140b5e);
            s_chest.zbarrier.owner = s_chest;
        }
        if (isdefined(s_chest.zbarrier)) {
            s_chest.zbarrier zbarrierpieceuseboxriselogic(3);
            s_chest.zbarrier zbarrierpieceuseboxriselogic(4);
        }
        s_chest function_76830bc7();
        if (!isdefined(level.chests)) {
            level.chests = [];
        } else if (!isarray(level.chests)) {
            level.chests = array(level.chests);
        }
        if (!isinarray(level.chests, s_chest)) {
            level.chests[level.chests.size] = s_chest;
        }
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x648a8ec7, Offset: 0x1920
// Size: 0x1e2
function function_76830bc7() {
    if (!isdefined(self.trigger)) {
        self.trigger = content_manager::spawn_interact(self, &function_c8745555, #"hash_40a3bd4c33eac8cc", self.zombie_cost, 72, 128, undefined, (0, 0, 24));
        self.trigger.zbarrier = self.zbarrier;
        self.trigger.s_chest = self;
        self.zbarrier.trigger = self.trigger;
    }
    if (!isdefined(self.zbarrier.var_e55c8b4e)) {
        if (isdefined(self.var_8d3fc50c)) {
            params = {#var_5068abe1:self.var_8d3fc50c};
        }
        if (zm_utility::is_survival()) {
            if (self !== level.var_2c678640) {
                self.zbarrier.var_e55c8b4e = zm_utility::function_f5a222a8(#"hash_5be32dd788d540d", self.zbarrier);
            }
        } else {
            self.zbarrier.var_e55c8b4e = zm_utility::function_4a4cf79a(#"hash_5be32dd788d540d", self.zbarrier, params);
        }
    }
    self.trigger triggerenable(1);
    self.trigger setvisibletoall();
    self.trigger thread function_3a083565(self);
    return self.trigger;
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0xbaeca26a, Offset: 0x1b10
// Size: 0x86
function function_3a083565(s_chest) {
    self notify("210091cdf5b025b1");
    self endon("210091cdf5b025b1");
    self endon(#"death");
    if (isdefined(self.zbarrier)) {
        self.zbarrier endon(#"death");
    }
    while (isdefined(s_chest)) {
        function_3238e2f9(s_chest);
        wait(1);
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 2, eflags: 0x2 linked
// Checksum 0x21bf895c, Offset: 0x1ba0
// Size: 0x204
function function_882a650f(str_rarity, var_e1669514 = 0) {
    switch (str_rarity) {
    case #"green":
    case #"uncommon":
        if (var_e1669514) {
            return #"hash_2446e535f851a299";
        } else {
            return #"hash_616fe2e500fd2474";
        }
        break;
    case #"blue":
    case #"rare":
        if (var_e1669514) {
            return #"hash_4dff3909af1f4fbf";
        } else {
            return #"hash_77ec251dc914f9de";
        }
        break;
    case #"purple":
    case #"epic":
        if (var_e1669514) {
            return #"hash_40895d69c438082e";
        } else {
            return #"hash_197f678e812120bf";
        }
        break;
    case #"orange":
    case #"legendary":
        if (var_e1669514) {
            return #"hash_3e7473705b8922c";
        } else {
            return #"hash_342c7ce3e17daa73";
        }
        break;
    case #"yellow":
    case #"ultra":
    case #"gold":
    case #"named":
    case #"resource":
    case #"none":
    case #"white":
    case #"loadout":
        if (var_e1669514) {
            return #"hash_4a972ee1265d60a";
        } else {
            return #"hash_6a4c5538a960189d";
        }
        break;
    }
    return 0;
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x23f72821, Offset: 0x1db0
// Size: 0x5d8
function function_3238e2f9(s_chest) {
    if (!isdefined(s_chest)) {
        return 0;
    }
    if (is_true(s_chest.var_dd0d4460)) {
        return 0;
    }
    if (is_true(s_chest.is_locked)) {
        return 0;
    }
    if (!isdefined(self)) {
        return 0;
    }
    foreach (player in getplayers()) {
        if (!self trigger_visible_to_player(player)) {
            if (is_true(player.var_c90ad01c)) {
                player.var_c90ad01c = undefined;
                player globallogic::function_d96c031e();
            }
            if (is_true(s_chest.var_a7b092aa) && (self function_c7446f41(player) || player util::is_player_looking_at(self.origin, 0.8, 1, self, self.zbarrier))) {
                player clientfield::set_to_player("stream_magicbox_guns", 1);
            } else {
                player clientfield::set_to_player("stream_magicbox_guns", 0);
            }
            continue;
        }
        if (!is_true(s_chest.var_a7b092aa) && !self function_c7446f41(player)) {
            player clientfield::set_to_player("stream_magicbox_guns", 0);
        }
        if (is_true(s_chest.grab_weapon_hint)) {
            cursor_hint_weapon = s_chest.grab_weapon;
            if (isdefined(cursor_hint_weapon)) {
                if (isdefined(level.magic_box_check_equipment) && [[ level.magic_box_check_equipment ]](cursor_hint_weapon)) {
                    self setcursorhint("HINT_WEAPON", cursor_hint_weapon);
                    self.hint_string = #"hash_53005c8d5b45bca3";
                } else {
                    self setcursorhint("HINT_NOICON");
                    self.hint_parm1 = s_chest.grab_weapon.displayname;
                    if (zm_weapons::is_wonder_weapon(cursor_hint_weapon) || killstreaks::is_killstreak_weapon(cursor_hint_weapon)) {
                        self.hint_string = #"hash_6a4c5538a960189d";
                    } else {
                        self.hint_string = function_882a650f(s_chest.rarity);
                    }
                }
            }
            player clientfield::set_to_player("stream_magicbox_guns", 0);
        } else if (zm_trial_disable_buys::is_active()) {
            self sethintstring(#"hash_55d25caf8f7bbb2f");
            player clientfield::set_to_player("stream_magicbox_guns", 0);
        } else {
            self setcursorhint("HINT_NOICON");
            self.hint_parm1 = s_chest.zombie_cost;
            self.hint_string = zm_utility::get_hint_string(self, "default_treasure_chest");
            if (self function_c7446f41(player)) {
                player clientfield::set_to_player("stream_magicbox_guns", 1);
            } else {
                player clientfield::set_to_player("stream_magicbox_guns", 0);
            }
            player.var_c90ad01c = 1;
            if (!is_true(s_chest.grab_weapon_hint)) {
                if (player zm_score::can_player_purchase(self.hint_parm1)) {
                    player globallogic::function_d96c031e();
                } else if (self zm_utility::function_4f593819(player)) {
                    player globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
                } else {
                    player globallogic::function_d96c031e();
                }
            } else {
                player globallogic::function_d96c031e();
                player clientfield::set_to_player("stream_magicbox_guns", 0);
            }
        }
        if (isdefined(self.hint_parm1)) {
            self sethintstring(self.hint_string, self.hint_parm1);
            continue;
        }
        self sethintstring(self.hint_string);
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x6 linked
// Checksum 0x39549ba8, Offset: 0x2390
// Size: 0x102
function private function_c7446f41(player) {
    if (!(isdefined(player.origin) && isdefined(self.origin))) {
        return false;
    }
    if (zm_utility::is_survival()) {
        n_distance = 375;
        n_max_height = 125;
    } else {
        n_distance = 300;
        n_max_height = 100;
    }
    n_height_diff = abs(player.origin[2] - self.origin[2]);
    if (n_height_diff <= n_max_height && distance2dsquared(player.origin, self.origin) <= sqr(n_distance)) {
        return true;
    }
    return false;
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x84405575, Offset: 0x24a0
// Size: 0x102
function function_9d363a9e(player) {
    if (!(isdefined(player.origin) && isdefined(self.origin))) {
        return false;
    }
    if (zm_utility::is_survival()) {
        n_distance = 750;
        n_max_height = 125;
    } else {
        n_distance = 600;
        n_max_height = 100;
    }
    n_height_diff = abs(player.origin[2] - self.origin[2]);
    if (n_height_diff <= n_max_height && distance2dsquared(player.origin, self.origin) <= sqr(n_distance)) {
        return true;
    }
    return false;
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x49e8f260, Offset: 0x25b0
// Size: 0x22
function default_magic_box_check_equipment(weapon) {
    return zm_loadout::is_offhand_weapon(weapon);
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0xa3d33823, Offset: 0x25e0
// Size: 0x2f0
function trigger_visible_to_player(player) {
    self setinvisibletoplayer(player);
    visible = 1;
    s_chest = self.s_chest;
    if (isdefined(s_chest.chest_user) && !isdefined(s_chest.box_rerespun)) {
        wpn_current = s_chest.chest_user getcurrentweapon();
        if (player != s_chest.chest_user && is_true(s_chest.var_1f9dff37) || player != s_chest.chest_user && !is_true(s_chest.var_481aa649) || zm_loadout::is_placeable_mine(wpn_current) || wpn_current.isheroweapon || wpn_current.isgadget || wpn_current.isriotshield || s_chest.chest_user zm_equipment::hacker_active()) {
            visible = 0;
        }
    } else if (!self function_9d363a9e(player) || !player can_buy_weapon()) {
        visible = 0;
    }
    if (player bgb::is_enabled(#"zm_bgb_disorderly_combat")) {
        visible = 0;
    }
    if (is_true(s_chest.weapon_out)) {
        if (player zm_weapons::has_weapon_or_upgrade(s_chest.zbarrier.weapon)) {
            return false;
        }
        if (is_true(s_chest.var_a7b092aa) || level flag::get("moving_chest_now")) {
            return false;
        }
    }
    if (is_true(s_chest.timedout) && is_true(s_chest._box_open)) {
        visible = 0;
    }
    if (isdefined(level.var_2f57e2d2)) {
        if (!self [[ level.var_2f57e2d2 ]](player)) {
            visible = 0;
        }
    }
    if (!visible) {
        return false;
    }
    self setvisibletoplayer(player);
    return true;
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x3dbd3385, Offset: 0x28d8
// Size: 0x24
function play_crazi_sound() {
    self playlocalsound(#"hash_7d764f09cd3dea92");
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x18fed253, Offset: 0x2908
// Size: 0x138
function function_2db086bf() {
    self.hidden = 0;
    self.zbarrier.state = "initial";
    self.zbarrier function_619a5c20();
    level flag::wait_till("start_zombie_round_logic");
    if (isdefined(self.zbarrier)) {
        self.zbarrier set_magic_box_zbarrier_state("initial");
        self thread zm_audio::function_ef9ba49c(#"box", 0, -1, 500, array("left", "trigger"));
        if (self.zbarrier.classname === "zbarrier_zm_esc_magicbox") {
            self.zbarrier thread function_ecf6901d();
        }
    }
    level notify(#"hash_e39eca74fa250b4", {#s_magic_box:self});
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x3b631a0b, Offset: 0x2a48
// Size: 0x200
function show_chest() {
    if (!level.enable_magic || zm_custom::function_901b751c(#"zmmysteryboxstate") == 0) {
        return;
    }
    self.zbarrier endoncallback(&function_62197845, #"death");
    self.zbarrier function_619a5c20();
    self.zbarrier clientfield::set("force_stream_magicbox", 1);
    self.zbarrier set_magic_box_zbarrier_state("arriving");
    self.zbarrier waittilltimeout(5, #"arrived");
    assert(isdefined(level.pandora_show_func), "itemspawnlist");
    if (isdefined(level.pandora_show_func)) {
        self thread [[ level.pandora_show_func ]]();
    }
    self.zbarrier clientfield::set("magicbox_closed_fx", 1);
    self function_76830bc7();
    self.hidden = 0;
    if (isdefined(self.box_hacks[#"summon_box"])) {
        self [[ self.box_hacks[#"summon_box"] ]](0);
    }
    self.zbarrier clientfield::set("force_stream_magicbox", 0);
    level notify(#"hash_e39eca74fa250b4", {#s_magic_box:self});
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x24b16eb1, Offset: 0x2c50
// Size: 0x3b0
function hide_chest(doboxleave) {
    if (isdefined(self.trigger)) {
        self.trigger delete();
    }
    if (isdefined(self.pandora_light)) {
        self.pandora_light delete();
    }
    if (isdefined(self.zbarrier) && self.zbarrier iszbarrier()) {
        self.zbarrier function_23a29590();
    }
    if (isdefined(self.zbarrier.var_e55c8b4e)) {
        zm_utility::function_bc5a54a8(self.zbarrier.var_e55c8b4e);
        self.zbarrier.var_e55c8b4e = undefined;
    }
    self.zbarrier clientfield::set("magicbox_closed_fx", 0);
    self.hidden = 1;
    self._box_open = 0;
    self._box_opened_by_fire_sale = 0;
    self.var_afba7c1f = undefined;
    self.unbearable_respin = undefined;
    self.chest_user = undefined;
    if (isdefined(self.box_hacks) && isdefined(self.box_hacks[#"summon_box"])) {
        self [[ self.box_hacks[#"summon_box"] ]](1);
    }
    if (isdefined(self.zbarrier)) {
        self.zbarrier endoncallback(&function_62197845, #"death");
        if (is_true(doboxleave)) {
            self.zbarrier thread magic_box_zbarrier_leave();
            if (self.zbarrier.state == "leaving") {
                s_result = self.zbarrier waittilltimeout(10, #"left", #"zbarrier_state_change");
                if (s_result._notify !== "left") {
                    self.zbarrier notify(#"timeout_away");
                    level notify(#"hash_e39eca74fa250b4", {#s_magic_box:self});
                    return;
                }
            }
            if (isdefined(level.var_678333a6)) {
                str_fx = level.var_678333a6;
            } else {
                str_fx = level._effect[#"poltergeist"];
            }
            playfx(str_fx, self.zbarrier.origin, anglestoup(self.zbarrier.angles), anglestoforward(self.zbarrier.angles));
        } else {
            self.zbarrier thread set_magic_box_zbarrier_state("away");
        }
    }
    level notify(#"hash_e39eca74fa250b4", {#s_magic_box:self});
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0xcc63b524, Offset: 0x3008
// Size: 0x1a4
function default_pandora_fx_func() {
    self endon(#"death");
    self.pandora_light = spawn("script_model", self.zbarrier.origin);
    s_pandora_fx_pos_override = struct::get(self.target, "targetname");
    if (isdefined(s_pandora_fx_pos_override) && s_pandora_fx_pos_override.script_noteworthy === "pandora_fx_pos_override") {
        self.pandora_light.origin = s_pandora_fx_pos_override.origin;
    }
    self.pandora_light.angles = self.zbarrier.angles + (-90, 0, -90);
    self.pandora_light setmodel(#"tag_origin");
    if (!is_true(level._box_initialized)) {
        level flag::wait_till("start_zombie_round_logic");
        level._box_initialized = 1;
    }
    wait(1);
    if (isdefined(self) && isdefined(self.pandora_light)) {
        playfxontag(level._effect[#"lght_marker"], self.pandora_light, "tag_origin");
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 3, eflags: 0x2 linked
// Checksum 0xa2ee7fcb, Offset: 0x31b8
// Size: 0x9c
function default_pandora_show_func(*anchor, *anchortarget, *pieces) {
    if (!isdefined(self.pandora_light)) {
        if (!isdefined(level.pandora_fx_func)) {
            level.pandora_fx_func = &default_pandora_fx_func;
        }
        self thread [[ level.pandora_fx_func ]]();
    }
    playfx(level._effect[#"lght_marker_flare"], self.pandora_light.origin);
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x9667b152, Offset: 0x3260
// Size: 0x94
function function_ecf6901d() {
    self endoncallback(&function_62197845, #"death");
    self clientfield::set("" + #"hash_2fcdae6b889933c7", 1);
    self waittill(#"zbarrier_state_change");
    self clientfield::set("" + #"hash_2fcdae6b889933c7", 0);
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x3939d03f, Offset: 0x3300
// Size: 0xdc4
function function_c8745555(params) {
    s_chest = self.s_chest;
    if (!isdefined(s_chest.zbarrier)) {
        /#
            println("<unknown string>" + s_chest.origin + "<unknown string>");
            iprintlnbold("<unknown string>" + s_chest.origin + "<unknown string>");
        #/
        return;
    }
    s_chest.zbarrier endoncallback(&function_62197845, #"death");
    if (is_true(s_chest._box_open)) {
        return;
    }
    if (is_true(zm_custom::function_901b751c(#"zmmysteryboxlimit"))) {
        var_96299149 = zm_custom::function_901b751c(#"zmmysteryboxlimit");
        if ((isdefined(level.var_bcd3620a) ? level.var_bcd3620a : 0) >= (isdefined(var_96299149) ? var_96299149 : 0)) {
            return;
        }
    }
    s_chest.box_rerespun = undefined;
    s_chest.weapon_out = undefined;
    s_chest endon(#"kill_chest_think");
    user = undefined;
    user_cost = undefined;
    if (!isdefined(s_chest.forced_user)) {
        user = params.activator;
        if (user == level || is_true(user.var_838c00de)) {
            return;
        }
    } else {
        user = s_chest.forced_user;
    }
    s_chest.var_75c86f89 = undefined;
    if (!user can_buy_weapon() || is_true(s_chest.disabled) || zm_trial_disable_buys::is_active() || is_true(s_chest.being_removed)) {
        return;
    }
    reduced_cost = undefined;
    if (isdefined(s_chest.auto_open) && zm_utility::is_player_valid(user)) {
        if (!isdefined(s_chest.var_3b8f3332)) {
            user zm_score::minus_to_player_score(s_chest.zombie_cost);
            user_cost = s_chest.zombie_cost;
        } else {
            user_cost = 0;
        }
        s_chest.chest_user = user;
    } else if (zm_utility::is_player_valid(user) && user zm_score::can_player_purchase(s_chest.zombie_cost)) {
        user zm_score::minus_to_player_score(s_chest.zombie_cost);
        user_cost = s_chest.zombie_cost;
        s_chest.chest_user = user;
    } else if (isdefined(reduced_cost) && user zm_score::can_player_purchase(reduced_cost)) {
        user zm_score::minus_to_player_score(reduced_cost);
        user_cost = reduced_cost;
        s_chest.chest_user = user;
    } else if (!user zm_score::can_player_purchase(s_chest.zombie_cost)) {
        zm_utility::play_sound_at_pos("no_purchase", s_chest.origin);
        user zm_audio::create_and_play_dialog(#"general", #"outofmoney");
        return;
    }
    level flag::set("chest_has_been_used");
    demo::bookmark(#"zm_player_use_magicbox", gettime(), user);
    potm::bookmark(#"zm_player_use_magicbox", gettime(), user);
    user zm_stats::increment_client_stat("use_magicbox");
    user zm_stats::increment_player_stat("use_magicbox");
    user zm_stats::increment_challenge_stat(#"survivalist_buy_magic_box", undefined, 1);
    user zm_stats::function_8f10788e("boas_use_magicbox");
    user zm_stats::function_c0c6ab19(#"boxbuys", 1, 1);
    user zm_stats::function_c0c6ab19(#"weapons_bought", 1, 1);
    user contracts::increment_zm_contract(#"contract_zm_weapons_bought", 1, #"zstandard");
    if (isplayer(s_chest.chest_user)) {
        s_chest.chest_user util::delay(0, "death", &zm_audio::create_and_play_dialog, #"box", #"interact");
        level notify(#"hash_39b0256c6c9885fc", {#var_c192c739:self, #e_player:s_chest.chest_user});
    }
    s_chest thread watch_for_emp_close();
    s_chest thread zm_trial_disable_buys::function_8327d26e();
    if (isdefined(level.var_f39bb42a)) {
        s_chest thread [[ level.var_f39bb42a ]]();
    }
    s_chest._box_open = 1;
    s_chest._box_opened_by_fire_sale = 0;
    if (is_true(zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_on")) && !isdefined(s_chest.auto_open) && s_chest [[ level._zombiemode_check_firesale_loc_valid_func ]]()) {
        s_chest._box_opened_by_fire_sale = 1;
    }
    if (is_true(zm_custom::function_901b751c(#"zmmysteryboxlimit"))) {
        if (!isdefined(level.var_bcd3620a)) {
            level.var_bcd3620a = 0;
        }
        level.var_bcd3620a += 1;
        var_96299149 = zm_custom::function_901b751c(#"zmmysteryboxlimit");
        if (level.var_bcd3620a >= (isdefined(var_96299149) ? var_96299149 : 0)) {
            zm_powerups::powerup_remove_from_regular_drops("fire_sale");
            level thread function_7d384b90();
        }
    }
    if (is_true(zm_custom::function_901b751c(#"zmmysteryboxlimitround"))) {
        if (level.var_fc02e2df !== level.round_number) {
            level.var_40f4f72d = 1;
            level.var_fc02e2df = level.round_number;
        } else {
            level.var_40f4f72d += 1;
        }
    }
    if (isdefined(s_chest.chest_lid)) {
        s_chest.chest_lid thread treasure_chest_lid_open();
    }
    if (isdefined(s_chest.zbarrier)) {
        s_chest.zbarrier set_magic_box_zbarrier_state("open");
    }
    s_chest.timedout = 0;
    s_chest.weapon_out = 1;
    s_chest.var_a7b092aa = 1;
    s_chest.zbarrier thread treasure_chest_weapon_spawn(s_chest, user);
    if (isdefined(level.custom_treasure_chest_glowfx)) {
        s_chest.zbarrier thread [[ level.custom_treasure_chest_glowfx ]]();
    } else {
        s_chest.zbarrier thread treasure_chest_glowfx();
    }
    self setinvisibletoall();
    s_chest.zbarrier waittill(#"randomization_done", #"box_hacked_respin");
    s_chest.var_a7b092aa = undefined;
    if (isdefined(user)) {
        if (level flag::get("moving_chest_now") && !s_chest._box_opened_by_fire_sale && isdefined(user_cost)) {
            user zm_stats::increment_challenge_stat(#"hash_7ff6f7b0eafc8be9");
            user zm_score::add_to_player_score(user_cost, 0, "magicbox_bear");
        }
    }
    if (level flag::get("moving_chest_now") && !zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_on") && !s_chest._box_opened_by_fire_sale) {
        s_chest thread treasure_chest_move(s_chest.chest_user);
    } else if (!is_true(s_chest.unbearable_respin) && !is_true(s_chest.var_afba7c1f)) {
        if (isdefined(user)) {
            s_chest.grab_weapon_hint = 1;
            if (!isdefined(s_chest.zbarrier.weapon.itementry.weapon)) {
                s_chest.zbarrier.weapon = level.weaponnone;
            }
            s_chest.grab_weapon = s_chest.zbarrier.weapon.itementry.weapon;
            s_chest.rarity = s_chest.zbarrier.weapon.itementry.rarity;
            s_chest.chest_user = user;
            bb::logpurchaseevent(user, s_chest, user_cost, s_chest.grab_weapon, 0, "_magicbox", "_offered");
            weaponidx = undefined;
            if (isdefined(self)) {
                self function_3238e2f9(s_chest);
            }
            if (isdefined(s_chest.grab_weapon)) {
                weaponidx = matchrecordgetweaponindex(s_chest.grab_weapon);
            }
            if (isdefined(weaponidx)) {
                user recordmapevent(10, gettime(), user.origin, level.round_number, weaponidx);
            }
            if (isdefined(self)) {
                self setvisibletoplayer(s_chest.chest_user);
            }
            if (!is_true(s_chest.zbarrier.weapon.isheroweapon) && zm_utility::get_number_of_valid_players() > 1 && !is_true(s_chest.var_1f9dff37)) {
                s_chest thread function_e4dcca48();
            }
        }
        if (isdefined(s_chest.zbarrier) && !is_true(s_chest.zbarrier.var_7672d70d)) {
            s_chest thread treasure_chest_timeout(user);
        }
    }
    if (isdefined(self)) {
        self function_c6cfae9e(user, s_chest, user_cost);
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 3, eflags: 0x2 linked
// Checksum 0x2aed1919, Offset: 0x40d0
// Size: 0x994
function function_c6cfae9e(user, s_chest, user_cost) {
    self endon(#"death");
    while (isdefined(self) && !is_true(s_chest.var_7672d70d) && !is_true(s_chest.var_afba7c1f)) {
        waitresult = self waittill(#"trigger");
        grabber = waitresult.activator;
        s_chest.weapon_out = undefined;
        if (is_true(level.magic_box_grab_by_anyone) || is_true(s_chest.var_481aa649)) {
            if (isplayer(grabber)) {
                user = grabber;
            }
        }
        if (isdefined(user)) {
            wpn_current = user getcurrentweapon();
            if (grabber != level && grabber zm_utility::is_drinking() || grabber == user && wpn_current == level.weaponnone || grabber == user && wpn_current.isriotshield) {
                wait(0.1);
                continue;
            }
            if (grabber != level && isdefined(s_chest.box_rerespun) && s_chest.box_rerespun) {
                user = grabber;
            }
        }
        if (grabber == user || grabber == level) {
            s_chest.box_rerespun = undefined;
            current_weapon = level.weaponnone;
            if (zm_utility::is_player_valid(user)) {
                current_weapon = user getcurrentweapon();
            }
            if (grabber != level && zm_utility::is_player_valid(user) && (killstreaks::is_killstreak_weapon(current_weapon) || isdefined(user.laststandpistol) || is_true(user.var_b895a3ff) || user isswitchingweapons())) {
                wait(0.1);
                continue;
            }
            if (grabber == user && zm_utility::is_player_valid(user) && !user zm_utility::is_drinking() && !zm_loadout::is_placeable_mine(current_weapon) && !zm_equipment::is_equipment(current_weapon) && !user zm_laststand::function_94cd8c0f() && !current_weapon.isheroweapon && !current_weapon.isgadget && !user ismeleeing()) {
                bb::logpurchaseevent(user, s_chest, user_cost, s_chest.zbarrier.weapon, 0, "_magicbox", "_grabbed");
                weaponidx = undefined;
                if (isdefined(s_chest.zbarrier) && isdefined(s_chest.zbarrier.weapon.itementry.weapon)) {
                    weaponidx = matchrecordgetweaponindex(s_chest.zbarrier.weapon.itementry.weapon);
                }
                if (isdefined(weaponidx)) {
                    user recordmapevent(11, gettime(), user.origin, level.round_number, weaponidx);
                }
                s_chest notify(#"user_grabbed_weapon");
                user notify(#"user_grabbed_weapon");
                user.var_d0355ca8 = 0;
                user thread treasure_chest_give_weapon(s_chest.zbarrier.weapon, s_chest.var_75c86f89, s_chest.zbarrier);
                demo::bookmark(#"zm_player_grabbed_magicbox", gettime(), user);
                potm::bookmark(#"zm_player_grabbed_magicbox", gettime(), user);
                user zm_stats::increment_client_stat("grabbed_from_magicbox");
                user zm_stats::increment_player_stat("grabbed_from_magicbox");
                user zm_stats::function_8f10788e("boas_grabbed_from_magicbox");
                if (isdefined(level.var_bb6907a4)) {
                    s_chest [[ level.var_bb6907a4 ]](user);
                }
                break;
            } else if (grabber == level) {
                s_chest.timedout = 1;
                if (isdefined(user)) {
                    bb::logpurchaseevent(user, s_chest, user_cost, s_chest.zbarrier.weapon.itementry.weapon, 0, "_magicbox", "_returned");
                    weaponidx = undefined;
                    if (isdefined(s_chest.zbarrier.weapon.itementry.weapon)) {
                        weaponidx = matchrecordgetweaponindex(s_chest.zbarrier.weapon.itementry.weapon);
                    }
                    if (isdefined(weaponidx)) {
                        user recordmapevent(12, gettime(), user.origin, level.round_number, weaponidx);
                    }
                }
                break;
            }
        }
        waitframe(1);
    }
    s_chest.grab_weapon_hint = 0;
    s_chest.zbarrier notify(#"weapon_grabbed");
    if (!is_true(s_chest._box_opened_by_fire_sale)) {
        level.chest_accessed += 1;
    }
    if (isdefined(s_chest.chest_lid)) {
        s_chest.chest_lid thread treasure_chest_lid_close(s_chest.timedout);
    }
    if (isdefined(self)) {
        self setinvisibletoall();
    }
    if (isdefined(self.zbarrier)) {
        s_chest.zbarrier set_magic_box_zbarrier_state("close");
        zm_utility::play_sound_at_pos("close_chest", s_chest.origin);
        s_chest.zbarrier waittill(#"closed");
        wait(1);
    } else {
        wait(3);
    }
    if (isdefined(self) && (is_true(zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_on")) && s_chest [[ level._zombiemode_check_firesale_loc_valid_func ]]() || zm_custom::function_901b751c(#"zmmysteryboxstate") == 3 || zm_custom::function_901b751c(#"zmmysteryboxstate") == 1 || s_chest == level.chests[level.chest_index])) {
        self setinvisibletoall();
    } else {
        self setvisibletoall();
    }
    s_chest._box_open = 0;
    s_chest._box_opened_by_fire_sale = 0;
    s_chest.var_afba7c1f = undefined;
    s_chest.unbearable_respin = undefined;
    s_chest.chest_user = undefined;
    s_chest notify(#"chest_accessed");
    level flag::set("chest_weapon_has_been_taken");
    self function_3238e2f9(s_chest);
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x9f356cc9, Offset: 0x4a70
// Size: 0x24a
function function_e4dcca48() {
    self.chest_user endon(#"bled_out", #"death");
    self.zbarrier endon(#"weapon_grabbed");
    self.var_481aa649 = 0;
    self.var_c2f3a87c = 0;
    var_369ce419 = self.chest_user;
    var_63f52acb = self.zbarrier.weapon_model;
    if (isdefined(var_63f52acb)) {
        var_63f52acb endon(#"death");
    }
    var_13370b92 = self.trigger;
    if (!isdefined(var_13370b92)) {
        return;
    }
    var_13370b92 endon(#"death");
    while (isdefined(var_13370b92) && isdefined(self)) {
        self.var_c2f3a87c = 0;
        if (isdefined(var_369ce419) && isdefined(var_63f52acb)) {
            if (var_369ce419 util::is_looking_at(var_63f52acb)) {
                self.var_c2f3a87c = 1;
            }
        }
        var_13370b92 function_3238e2f9(self);
        if (isdefined(var_369ce419) && var_369ce419 meleebuttonpressed() && self.var_c2f3a87c && var_369ce419 istouching(var_13370b92)) {
            self.var_481aa649 = 1;
            self.var_75c86f89 = var_369ce419;
            if (isdefined(var_63f52acb)) {
                var_63f52acb clientfield::set("powerup_fx", 1);
            }
            var_369ce419 thread zm_audio::create_and_play_dialog(#"magicbox", #"share");
            var_13370b92 setvisibletoall();
            var_13370b92 function_3238e2f9(self);
            break;
        }
        waitframe(1);
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x60810c19, Offset: 0x4cc8
// Size: 0x1c6
function watch_for_emp_close() {
    self endon(#"chest_accessed");
    self.var_7672d70d = 0;
    if (!zm_utility::should_watch_for_emp()) {
        return;
    }
    if (isdefined(self.zbarrier)) {
        self.zbarrier.var_7672d70d = 0;
    }
    while (true) {
        waitresult = level waittill(#"emp_detonate");
        if (distancesquared(waitresult.position, self.origin) < waitresult.radius * waitresult.radius) {
            break;
        }
    }
    if (level flag::get("moving_chest_now")) {
        return;
    }
    self.var_7672d70d = 1;
    if (isdefined(self.zbarrier)) {
        self.zbarrier.var_7672d70d = 1;
        self.zbarrier notify(#"box_hacked_respin");
        if (isdefined(self.zbarrier.weapon_model)) {
            self.zbarrier.weapon_model notify(#"kill_weapon_movement");
        }
        if (isdefined(self.zbarrier.weapon_model_dw)) {
            self.zbarrier.weapon_model_dw notify(#"kill_weapon_movement");
        }
    }
    wait(0.1);
    self notify(#"trigger", {#activator:level});
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x8db29e00, Offset: 0x4e98
// Size: 0x1ee
function can_buy_weapon(var_5429ee1f = 1) {
    if (!isdefined(self)) {
        return false;
    }
    if (var_5429ee1f && is_true(zm_custom::function_901b751c(#"zmmysteryboxlimitround"))) {
        var_96299149 = zm_custom::function_901b751c(#"zmmysteryboxlimitround");
        if ((isdefined(level.var_40f4f72d) ? level.var_40f4f72d : 0) >= (isdefined(var_96299149) ? var_96299149 : 0)) {
            return false;
        }
    }
    if (self zm_utility::is_drinking()) {
        return false;
    }
    if (self zm_equipment::hacker_active()) {
        return false;
    }
    current_weapon = self getcurrentweapon();
    if (zm_loadout::is_placeable_mine(current_weapon) || zm_equipment::is_equipment_that_blocks_purchase(current_weapon)) {
        return false;
    }
    if (self zm_utility::in_revive_trigger()) {
        return false;
    }
    if (current_weapon == level.weaponnone) {
        return false;
    }
    if (killstreaks::is_killstreak_weapon(current_weapon)) {
        return false;
    }
    if (current_weapon.isheroweapon || current_weapon.isgadget || current_weapon.isriotshield) {
        return false;
    }
    if (!self zm_laststand::laststand_has_players_weapons_returned()) {
        return false;
    }
    return true;
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x348db314, Offset: 0x5090
// Size: 0x18c
function default_box_move_logic() {
    index = -1;
    for (i = 0; i < level.chests.size; i++) {
        if (isdefined(level.chests[i].script_noteworthy) && issubstr(level.chests[i].script_noteworthy, "move" + level.chest_moves + 1) && i != level.chest_index) {
            index = i;
            break;
        }
    }
    if (index != -1) {
        level.chest_index = index;
    } else {
        level.chest_index++;
    }
    if (level.chest_index >= level.chests.size) {
        temp_chest_name = level.chests[level.chest_index - 1].script_noteworthy;
        level.chest_index = 0;
        level.chests = array::randomize(level.chests);
        if (temp_chest_name === level.chests[level.chest_index].script_noteworthy) {
            level.chest_index++;
        }
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0xac61f4f2, Offset: 0x5228
// Size: 0x446
function treasure_chest_move(player_vox) {
    if (isdefined(self.zbarrier)) {
        self.zbarrier endoncallback(&function_62197845, #"death");
    }
    level waittill(#"weapon_fly_away_start");
    players = getplayers();
    array::thread_all(players, &play_crazi_sound);
    level thread function_f81251c9();
    if (isdefined(player_vox)) {
        player_vox thread zm_audio::create_and_play_dialog(#"magicbox", #"move", undefined, 2);
    }
    level waittill(#"weapon_fly_away_end");
    if (isdefined(self.zbarrier)) {
        self hide_chest(1);
    }
    wait(0.1);
    post_selection_wait_duration = 7;
    if (isdefined(level._zombiemode_custom_box_move_logic)) {
        [[ level._zombiemode_custom_box_move_logic ]]();
    } else {
        default_box_move_logic();
    }
    if (zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_on") == 1 && self [[ level._zombiemode_check_firesale_loc_valid_func ]]()) {
        current_sale_time = zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_time");
        util::wait_network_frame();
        level flag::clear("moving_chest_now");
        self thread fire_sale_fix();
        zombie_utility::set_zombie_var(#"zombie_powerup_fire_sale_time", current_sale_time);
        while (zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_time") > 0) {
            wait(0.1);
        }
    } else {
        post_selection_wait_duration += 5;
    }
    level.verify_chest = 0;
    if (isdefined(level.chests[level.chest_index].box_hacks[#"summon_box"])) {
        level.chests[level.chest_index] [[ level.chests[level.chest_index].box_hacks[#"summon_box"] ]](0);
    }
    wait(post_selection_wait_duration);
    if (isdefined(level.var_678333a6)) {
        str_fx = level.var_678333a6;
    } else {
        str_fx = level._effect[#"poltergeist"];
    }
    playfx(str_fx, level.chests[level.chest_index].zbarrier.origin, anglestoup(level.chests[level.chest_index].zbarrier.angles), anglestoforward(level.chests[level.chest_index].zbarrier.angles));
    level.chests[level.chest_index] show_chest();
    level flag::clear("moving_chest_now");
    self.zbarrier.chest_moving = 0;
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0xd9c95ded, Offset: 0x5678
// Size: 0x54
function function_f81251c9() {
    level endon(#"game_over", #"hash_5002eab927d4056d");
    wait(5);
    level thread zm_vo::function_8abe0568(#"boxmove");
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x9c85a696, Offset: 0x56d8
// Size: 0x16c
function fire_sale_fix() {
    if (!isdefined(zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_on"))) {
        return;
    }
    if (zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_on")) {
        self.old_cost = 950;
        self thread show_chest();
        self.zombie_cost = 10;
        util::wait_network_frame();
        level waittill(#"fire_sale_off");
        for (i = 0; i < level.chests.size; i++) {
            if (i == level.chest_index) {
                level.chests[i].was_temp = undefined;
                continue;
            }
            level.chests[i].was_temp = 1;
        }
        while (is_true(self._box_open)) {
            wait(0.1);
        }
        self.zombie_cost = self.old_cost;
        self hide_chest(1);
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x4471c01a, Offset: 0x5850
// Size: 0x150
function treasure_chest_timeout(user) {
    self endon(#"user_grabbed_weapon");
    self.zbarrier endoncallback(&function_62197845, #"box_hacked_respin", #"box_hacked_rerespin", #"death");
    n_timeout = isdefined(level.var_ad2674fe) ? level.var_ad2674fe : 12;
    wait(n_timeout);
    if (isdefined(self.trigger)) {
        self.trigger notify(#"trigger", {#activator:level});
    }
    if (isdefined(self.zbarrier.var_b52f8370) && self.zbarrier.var_b52f8370 != level.weaponnone) {
        item_world::consume_item(self.zbarrier.var_b52f8370);
    }
    if (isdefined(user)) {
        if (isdefined(level.var_bb6907a4)) {
            self [[ level.var_bb6907a4 ]](user);
        }
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0xa1196109, Offset: 0x59a8
// Size: 0x4c
function treasure_chest_lid_open() {
    openroll = 105;
    opentime = 0.5;
    self rotateroll(105, opentime, opentime * 0.5);
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x86b39908, Offset: 0x5a00
// Size: 0x66
function treasure_chest_lid_close(*timedout) {
    closeroll = -105;
    closetime = 0.5;
    self rotateroll(closeroll, closetime, closetime * 0.5);
    self notify(#"lid_closed");
}

// Namespace zm_magicbox/zm_magicbox
// Params 3, eflags: 0x2 linked
// Checksum 0x61c0cc4e, Offset: 0x5a70
// Size: 0x230
function function_db355791(player, item, var_21b5a3f4 = 1) {
    if (!isdefined(player)) {
        return 0;
    }
    if (!isdefined(player.var_16fc6934)) {
        base_weapon = zm_weapons::get_base_weapon(item.itementry.weapon);
        if (isdefined(base_weapon)) {
            if (var_21b5a3f4 && isinarray(level.var_11ab9932, base_weapon)) {
                return 0;
            }
        }
    }
    if (isdefined(item.itementry.weapon)) {
        if (!player zm_weapons::player_can_use_content(item.itementry.weapon)) {
            return 0;
        }
        if (isdefined(level.custom_magic_box_selection_logic) && ![[ level.custom_magic_box_selection_logic ]](item, player)) {
            return 0;
        }
        if (item.itementry.weapon.name === #"ray_gun" && player zm_weapons::has_weapon_or_upgrade(getweapon(#"raygun_mark2"))) {
            return 0;
        }
        if (isdefined(level.special_weapon_magicbox_check)) {
            return player [[ level.special_weapon_magicbox_check ]](item.itementry.weapon);
        }
        if (!zm_weapons::limited_weapon_below_quota(item.itementry.weapon, player)) {
            return 0;
        }
        if (isdefined(level.var_cbc6587a) && isinarray(level.var_cbc6587a, item.itementry.weapon)) {
            return 0;
        }
    }
    return 1;
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x7895eb1, Offset: 0x5ca8
// Size: 0xf4
function function_ebff068f() {
    range = randomfloat(1);
    range *= 100;
    low_threshold = 0;
    var_e7308a9 = level.var_e2f02558;
    foreach (i, weight in level.var_c0c63390) {
        if (range >= low_threshold && range < weight) {
            var_e7308a9 = i;
            break;
        }
        low_threshold = weight;
    }
    return var_e7308a9;
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x943088ab, Offset: 0x5da8
// Size: 0xd56
function function_4aa1f177(player) {
    self endon(#"death");
    level endon(#"game_ended");
    /#
        if (isdefined(level.var_f83c8dc2)) {
            point = function_4ba8fde(level.var_f83c8dc2);
            level.var_f83c8dc2 = undefined;
            if (isdefined(point) && isdefined(point.itementry.weapon)) {
                item = item_drop::drop_item(0, point.itementry.weapon, 1, point.itementry.weapon.maxammo, point.id, self.origin, self.angles, 1);
                item.magic_box_weapon = 1;
                item.hidetime = 1;
                item hide();
                function_a6d171f4(item.itementry.rarity);
                self.owner.var_c639ca3e = item.itementry.rarity;
                self.owner.var_9e7e27d7 = item.itementry.name;
                if (!isdefined(player.var_3a289354)) {
                    player.var_3a289354 = [];
                } else if (!isarray(player.var_3a289354)) {
                    player.var_3a289354 = array(player.var_3a289354);
                }
                if (!isinarray(player.var_3a289354, isdefined(item.item.name) ? item.item.name : item.name)) {
                    player.var_3a289354[player.var_3a289354.size] = isdefined(item.item.name) ? item.item.name : item.name;
                }
                return item;
            }
        }
    #/
    n_roll = randomfloat(100);
    var_257fe1c5 = 0;
    /#
        var_56513915 = getdvarint(#"hash_49ab619fd82a8ffc", 0);
        if (var_56513915) {
            n_roll = 99;
        }
    #/
    var_c1e65f4 = 100 - (isdefined(level.var_54c1f9aa) ? level.var_54c1f9aa : 5);
    var_3afe334f = zm_utility::function_e3025ca5();
    var_3afe334f = math::clamp(var_3afe334f, 1, 8);
    switch (var_3afe334f) {
    case 1:
        var_8eb06b25 = var_c1e65f4 - 1;
        break;
    case 2:
        var_8eb06b25 = var_c1e65f4 - 1;
        break;
    case 3:
        var_8eb06b25 = var_c1e65f4 - 2;
        break;
    case 4:
        var_8eb06b25 = var_c1e65f4 - 2;
        break;
    case 5:
        var_8eb06b25 = var_c1e65f4 - 3;
        break;
    case 6:
        var_8eb06b25 = var_c1e65f4 - 3;
        break;
    case 7:
        var_8eb06b25 = var_c1e65f4 - 3;
        break;
    default:
        var_8eb06b25 = var_c1e65f4 - 5;
        break;
    }
    if (n_roll >= var_c1e65f4) {
        var_754850f5 = arraycopy(level.var_e5067476);
    } else if (n_roll >= var_8eb06b25 && !is_true(level.var_f6bc1355)) {
        var_754850f5 = arraycopy(level.var_597e3b64);
    } else {
        var_e7308a9 = function_ebff068f();
        var_754850f5 = level.var_4da246c[var_e7308a9];
        var_257fe1c5 = 1;
    }
    var_754850f5 = array::randomize(var_754850f5);
    var_ad162e6a = 0;
    if (isdefined(player)) {
        if (isdefined(level.customrandomweaponweights)) {
            var_754850f5 = player [[ level.customrandomweaponweights ]](var_754850f5);
        }
        if (isdefined(player.var_afb3ba4e)) {
            var_754850f5 = player [[ player.var_afb3ba4e ]](var_754850f5);
        }
        if (isdefined(player.var_abaf754e)) {
            if (isdefined(player.var_61c96978)) {
                player thread [[ player.var_61c96978 ]](self);
            }
            arrayinsert(var_754850f5, player.var_abaf754e, 0);
            var_ad162e6a = 1;
        }
    }
    /#
        var_915d93e6 = getdvarstring(#"hash_5577163bdcd854a2");
        if (isdefined(var_915d93e6) && var_915d93e6 != "<unknown string>") {
            arrayinsert(var_754850f5, var_915d93e6, 0);
            var_ad162e6a = 1;
        }
    #/
    if (isdefined(player)) {
        if (var_ad162e6a) {
            var_4ac286cf = array(#"uncommon", #"rare", #"epic", #"legendary", #"ultra");
            weapon = function_830aff18(var_754850f5[0], player, var_4ac286cf, var_257fe1c5);
            return (isdefined(weapon) ? weapon : level.weaponnone);
        } else if (var_257fe1c5) {
            switch (var_3afe334f) {
            case 1:
                if (is_true(getgametypesetting(#"hash_1e8998fd7f271bb7"))) {
                    var_dcdb4bb7 = 100;
                    var_fef08b67 = 0;
                    var_6c903ad5 = 0;
                    var_f5e41acd = 0;
                } else {
                    var_dcdb4bb7 = 77;
                    var_fef08b67 = 15;
                    var_6c903ad5 = 2;
                    var_f5e41acd = 0;
                }
                break;
            case 2:
                if (is_true(getgametypesetting(#"hash_1e8998fd7f271bb7"))) {
                    var_dcdb4bb7 = 50;
                    var_fef08b67 = 50;
                    var_6c903ad5 = 0;
                    var_f5e41acd = 0;
                } else {
                    var_dcdb4bb7 = 55;
                    var_fef08b67 = 35;
                    var_6c903ad5 = 3;
                    var_f5e41acd = 1;
                }
                break;
            case 3:
                if (is_true(getgametypesetting(#"hash_1e8998fd7f271bb7"))) {
                    var_dcdb4bb7 = 33;
                    var_fef08b67 = 33;
                    var_6c903ad5 = 34;
                    var_f5e41acd = 0;
                } else {
                    var_dcdb4bb7 = 26;
                    var_fef08b67 = 55;
                    var_6c903ad5 = 10;
                    var_f5e41acd = 2;
                }
                break;
            case 4:
                var_dcdb4bb7 = 16;
                var_fef08b67 = 40;
                var_6c903ad5 = 35;
                var_f5e41acd = 2;
                break;
            case 5:
                var_dcdb4bb7 = 5;
                var_fef08b67 = 22;
                var_6c903ad5 = 55;
                var_f5e41acd = 10;
                break;
            case 6:
                var_dcdb4bb7 = 0;
                var_fef08b67 = 10;
                var_6c903ad5 = 47;
                var_f5e41acd = 35;
                break;
            case 7:
                var_dcdb4bb7 = 0;
                var_fef08b67 = 0;
                var_6c903ad5 = 37;
                var_f5e41acd = 60;
                break;
            default:
                var_dcdb4bb7 = 0;
                var_fef08b67 = 0;
                var_6c903ad5 = 10;
                var_f5e41acd = 80;
                break;
            }
            var_42bbb9f1 = var_8eb06b25 - var_f5e41acd;
            var_7a27b7c1 = var_42bbb9f1 - var_6c903ad5;
            var_d82105ed = var_7a27b7c1 - var_fef08b67;
            var_2b426a85 = var_d82105ed - var_dcdb4bb7;
            if (n_roll >= var_42bbb9f1) {
                var_4ac286cf = array(#"legendary");
            } else if (n_roll >= var_7a27b7c1) {
                var_4ac286cf = array(#"epic");
            } else if (n_roll >= var_d82105ed) {
                var_4ac286cf = array(#"rare");
            } else {
                var_4ac286cf = array(#"uncommon");
            }
        }
        for (;;) {
            foreach (var_986a7654 in var_754850f5) {
                weapon = function_830aff18(var_986a7654, player, var_4ac286cf, var_257fe1c5, var_e7308a9);
                if (isdefined(weapon)) {
                    var_e63a3f7b = 0;
                    if (var_257fe1c5) {
                        base_weapon = zm_weapons::get_base_weapon(weapon.itementry.weapon);
                        if (isinarray(level.var_11ab9932, base_weapon)) {
                            var_e63a3f7b = 1;
                        }
                    }
                    if (!var_e63a3f7b) {
                        if (level.var_11ab9932.size >= 3) {
                            arrayremoveindex(level.var_11ab9932, 0, 0);
                        }
                        base_weapon = zm_weapons::get_base_weapon(weapon.itementry.weapon);
                        if (!isdefined(level.var_11ab9932)) {
                            level.var_11ab9932 = [];
                        } else if (!isarray(level.var_11ab9932)) {
                            level.var_11ab9932 = array(level.var_11ab9932);
                        }
                        if (!isinarray(level.var_11ab9932, base_weapon)) {
                            level.var_11ab9932[level.var_11ab9932.size] = base_weapon;
                        }
                        player notify(#"hash_63344bbf1789e2c7");
                        return weapon;
                    }
                }
            }
            var_e7308a9 = function_ebff068f();
            var_754850f5 = level.var_4da246c[var_e7308a9];
        }
    }
    return level.weaponnone;
}

// Namespace zm_magicbox/zm_magicbox
// Params 5, eflags: 0x2 linked
// Checksum 0x80840c42, Offset: 0x6b08
// Size: 0x75a
function function_830aff18(str_item, player, var_4ac286cf, var_257fe1c5, *var_e7308a9 = 0) {
    var_517c3cf5 = getscriptbundle(player);
    if (var_517c3cf5.type === "itemspawnlist") {
        var_b8a06478 = arraycopy(var_517c3cf5.itemlist);
        var_b8a06478 = array::randomize(var_b8a06478);
        foreach (var_3bbf766e in var_b8a06478) {
            weapon = function_830aff18(var_3bbf766e.itementry, var_4ac286cf, var_257fe1c5, var_e7308a9);
            if (isdefined(weapon)) {
                if (!isdefined(var_4ac286cf.var_3a289354)) {
                    var_4ac286cf.var_3a289354 = [];
                } else if (!isarray(var_4ac286cf.var_3a289354)) {
                    var_4ac286cf.var_3a289354 = array(var_4ac286cf.var_3a289354);
                }
                if (!isinarray(var_4ac286cf.var_3a289354, weapon.itementry.weapon.name)) {
                    var_4ac286cf.var_3a289354[var_4ac286cf.var_3a289354.size] = weapon.itementry.weapon.name;
                }
                return weapon;
            }
        }
        return;
    }
    var_89230090 = var_517c3cf5;
    if (isdefined(level.var_a619f078[var_89230090.name]) && isdefined(level.var_940d400a[var_89230090.name])) {
        var_cc054a2 = [[ level.var_a619f078[var_89230090.name] ]](var_4ac286cf);
        if (!var_cc054a2) {
            var_89230090 = getscriptbundle(level.var_940d400a[var_89230090.name]);
            assert(isdefined(var_89230090), "<unknown string>");
        }
    }
    if (isdefined(var_89230090.var_a53e9db0)) {
        if (isdefined(var_89230090.name)) {
            weapon = namespace_65181344::function_67456242(var_89230090);
            point = function_4ba8fde(var_89230090.name);
            if (isdefined(point)) {
                ammo = weapon.maxammo;
                if (point.itementry.itemtype == #"scorestreak") {
                    ammo = 1;
                } else if (ammo == 0) {
                    ammo = weapon.clipsize;
                }
                item = item_drop::drop_item(0, weapon, 1, ammo, point.id, self.origin, self.angles, 1);
                if (!isdefined(item)) {
                    return;
                }
                item.magic_box_weapon = 1;
                item.hidetime = 1;
                item hide();
            }
        } else {
            return;
        }
    } else if (isdefined(var_89230090.name)) {
        weapon = item_world_util::function_35e06774(var_89230090, isdefined(var_89230090.attachments));
        point = function_4ba8fde(var_89230090.name);
        if (isdefined(point)) {
            ammo = weapon.maxammo;
            if (point.itementry.itemtype == #"scorestreak") {
                ammo = 1;
            } else if (ammo == 0) {
                ammo = weapon.clipsize;
            }
            item = item_drop::drop_item(0, weapon, 1, ammo, point.id, self.origin, self.angles, 1);
            if (!isdefined(item)) {
                return;
            }
            item.magic_box_weapon = 1;
            item.hidetime = 1;
            item hide();
        }
    } else {
        return;
    }
    /#
        if (var_e7308a9 && isdefined(var_89230090) && !isdefined(var_89230090.rarity)) {
            assertmsg("<unknown string>" + var_89230090.name);
        }
    #/
    if (function_db355791(var_4ac286cf, item, 0) && (!var_e7308a9 || var_e7308a9 && isdefined(var_89230090.rarity) && isinarray(var_257fe1c5, hash(var_89230090.rarity)))) {
        self.owner.var_c639ca3e = var_89230090.rarity;
        self.owner.var_9e7e27d7 = var_89230090.name;
        if (!isdefined(var_4ac286cf.var_3a289354)) {
            var_4ac286cf.var_3a289354 = [];
        } else if (!isarray(var_4ac286cf.var_3a289354)) {
            var_4ac286cf.var_3a289354 = array(var_4ac286cf.var_3a289354);
        }
        if (!isinarray(var_4ac286cf.var_3a289354, isdefined(item.item.name) ? item.item.name : item.name)) {
            var_4ac286cf.var_3a289354[var_4ac286cf.var_3a289354.size] = isdefined(item.item.name) ? item.item.name : item.name;
        }
        return item;
    }
    self.owner.var_c639ca3e = #"legendary";
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x108725b, Offset: 0x7270
// Size: 0x30
function weapon_show_hint_choke() {
    level._weapon_show_hint_choke = 0;
    while (true) {
        waitframe(1);
        level._weapon_show_hint_choke = 0;
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 6, eflags: 0x2 linked
// Checksum 0x6cff16a0, Offset: 0x72a8
// Size: 0x41c
function decide_hide_show_hint(endon_notify, second_endon_notify, onlyplayer, can_buy_weapon_extra_check_func, var_5429ee1f = 1, var_e6473bf1 = 600) {
    self endon(#"death");
    if (isdefined(endon_notify)) {
        self endon(endon_notify);
    }
    if (isdefined(second_endon_notify)) {
        self endon(second_endon_notify);
    }
    if (!isdefined(level._weapon_show_hint_choke)) {
        level thread weapon_show_hint_choke();
    }
    use_choke = 0;
    if (isdefined(level._use_choke_weapon_hints) && level._use_choke_weapon_hints == 1) {
        use_choke = 1;
    }
    while (true) {
        last_update = gettime();
        if (isdefined(self.chest_user) && !isdefined(self.box_rerespun)) {
            if (zm_loadout::is_placeable_mine(self.chest_user getcurrentweapon()) || self.chest_user zm_equipment::hacker_active()) {
                self setinvisibletoplayer(self.chest_user);
            } else {
                self setvisibletoplayer(self.chest_user);
            }
        } else if (isdefined(onlyplayer)) {
            if (distancesquared(onlyplayer.origin, self.origin) <= sqr(var_e6473bf1) && onlyplayer can_buy_weapon(var_5429ee1f) && (!isdefined(can_buy_weapon_extra_check_func) || onlyplayer [[ can_buy_weapon_extra_check_func ]](self.weapon)) && !onlyplayer bgb::is_enabled(#"zm_bgb_disorderly_combat")) {
                self setinvisibletoplayer(onlyplayer, 0);
            } else {
                self setinvisibletoplayer(onlyplayer, 1);
            }
        } else {
            players = getplayers();
            for (i = 0; i < players.size; i++) {
                if (distancesquared(players[i].origin, self.origin) <= sqr(var_e6473bf1) && players[i] can_buy_weapon(var_5429ee1f) && (!isdefined(can_buy_weapon_extra_check_func) || players[i] [[ can_buy_weapon_extra_check_func ]](self.weapon)) && !players[i] bgb::is_enabled(#"zm_bgb_disorderly_combat")) {
                    self setinvisibletoplayer(players[i], 0);
                    continue;
                }
                self setinvisibletoplayer(players[i], 1);
            }
        }
        if (use_choke) {
            while (level._weapon_show_hint_choke > 4 && gettime() < last_update + 150) {
                waitframe(1);
            }
        } else {
            wait(0.1);
        }
        level._weapon_show_hint_choke++;
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x0
// Checksum 0x6d8b2566, Offset: 0x76d0
// Size: 0x4a
function get_left_hand_weapon_model_name(weapon) {
    dw_weapon = weapon.dualwieldweapon;
    if (dw_weapon != level.weaponnone) {
        return dw_weapon.worldmodel;
    }
    return weapon.worldmodel;
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0xfbed7c0c, Offset: 0x7728
// Size: 0x11c
function clean_up_hacked_box() {
    self endoncallback(&function_62197845, #"death");
    self waittill(#"box_hacked_respin");
    self endon(#"box_spin_done");
    if (isdefined(self.weapon_model)) {
        self.weapon_model delete();
        self.weapon_model = undefined;
    }
    if (isdefined(self.weapon_model_dw)) {
        self.weapon_model_dw delete();
        self.weapon_model_dw = undefined;
    }
    self hidezbarrierpiece(3);
    self hidezbarrierpiece(4);
    self setzbarrierpiecestate(3, "closed");
    self setzbarrierpiecestate(4, "closed");
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0xccaa60db, Offset: 0x7850
// Size: 0x32
function treasure_chest_firesale_active() {
    return is_true(zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_on"));
}

// Namespace zm_magicbox/zm_magicbox
// Params 2, eflags: 0x2 linked
// Checksum 0xa54c3cb4, Offset: 0x7890
// Size: 0x44e
function treasure_chest_should_move(chest, player) {
    if (getdvarint(#"magic_chest_movable", 0) && !is_true(chest._box_opened_by_fire_sale) && !treasure_chest_firesale_active() && self [[ level._zombiemode_check_firesale_loc_valid_func ]]() && !is_true(player.var_c21099c0)) {
        chance_of_joker = 0;
        if (zm_trial::is_trial_mode()) {
            if (level.chest_accessed >= 3 || is_true(level.var_bb641599)) {
                return true;
            }
        }
        a_players = getplayers();
        level.chest_min_move_usage = 3 + a_players.size;
        if (level.chest_moves) {
            if (zm_utility::is_survival()) {
                level.chest_min_move_usage = 2;
            } else {
                level.chest_min_move_usage = 4;
            }
        }
        if (level.chest_accessed < level.chest_min_move_usage) {
            chance_of_joker = -1;
        }
        if (chance_of_joker >= 0) {
            if (level.chest_moves == 0) {
                chance_of_joker = 100;
            } else if (zm_utility::is_survival()) {
                switch (level.chest_accessed) {
                case 1:
                    chance_of_joker = 0;
                    break;
                case 2:
                case 3:
                    chance_of_joker = 15;
                    break;
                case 4:
                case 5:
                case 6:
                case 7:
                    chance_of_joker = 30;
                    break;
                default:
                    chance_of_joker = 50;
                    break;
                }
            } else {
                switch (level.chest_accessed) {
                case 1:
                case 2:
                case 3:
                    chance_of_joker = 0;
                    break;
                case 4:
                case 5:
                case 6:
                case 7:
                    chance_of_joker = 15;
                    break;
                case 8:
                case 9:
                case 10:
                case 11:
                    chance_of_joker = 30;
                    break;
                default:
                    chance_of_joker = 50;
                    break;
                }
            }
        }
        if (isdefined(chest.no_fly_away)) {
            chance_of_joker = -1;
        }
        if (isdefined(level.var_b0344a3c)) {
            chance_of_joker = [[ level.var_b0344a3c ]](chance_of_joker);
        }
        if (is_true(level.var_401aaa92)) {
            level.var_401aaa92 = 0;
            chance_of_joker = 100;
        }
        n_random = randomint(100);
        if (chance_of_joker > n_random) {
            return true;
        }
    }
    return false;
}

// Namespace zm_magicbox/zm_magicbox
// Params 4, eflags: 0x2 linked
// Checksum 0xe6de7144, Offset: 0x7ce8
// Size: 0x78
function spawn_joker_weapon_model(*player, model, origin, angles) {
    weapon_model = spawn("script_model", origin);
    if (isdefined(angles)) {
        weapon_model.angles = angles;
    }
    weapon_model setmodel(model);
    return weapon_model;
}

// Namespace zm_magicbox/zm_magicbox
// Params 3, eflags: 0x2 linked
// Checksum 0xe22e81d5, Offset: 0x7d68
// Size: 0x194
function treasure_chest_weapon_locking(player, item, onoff) {
    if (isdefined(self.locked_model)) {
        self.locked_model delete();
        self.locked_model = undefined;
    }
    if (isdefined(item.itementry.weapon)) {
        weapon = item.itementry.weapon;
    } else {
        weapon = level.weaponnone;
    }
    if (onoff) {
        if (weapon == level.weaponnone) {
            self.locked_model = spawn_joker_weapon_model(player, level.chest_joker_model, self.origin, (0, 0, 0));
        } else if (isdefined(player)) {
            self.locked_model = zm_utility::spawn_buildkit_weapon_model(player, weapon, undefined, self.origin, (0, 0, 0));
            level thread function_3d81b400(item.var_627c698b, 2);
        } else {
            self.locked_model = util::spawn_model(item.model, self.origin, (0, 0, 0));
        }
        self.locked_model ghost();
        zm_utility::function_ca960904(self.locked_model);
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 3, eflags: 0x6 linked
// Checksum 0x820688bf, Offset: 0x7f08
// Size: 0x84
function private function_3d81b400(weapon, n_delay = 0, var_9aed3072 = 10) {
    if (isdefined(n_delay) && n_delay > 0) {
        wait(n_delay);
    }
    if (isdefined(weapon.viewmodel)) {
        streamermodelhint(weapon.viewmodel, var_9aed3072);
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x6f6b9d01, Offset: 0x7f98
// Size: 0x3c
function function_38456836() {
    index = randomint(level.var_e5067476.size);
    return level.var_e5067476[index];
}

// Namespace zm_magicbox/zm_magicbox
// Params 3, eflags: 0x2 linked
// Checksum 0xe6c15968, Offset: 0x7fe0
// Size: 0x12be
function treasure_chest_weapon_spawn(chest, player, respin) {
    if (isdefined(level.var_555605da)) {
        self.owner endon(#"box_locked");
        self thread [[ level.var_555605da ]]();
    }
    self endoncallback(&function_62197845, #"box_hacked_respin", #"death");
    self thread clean_up_hacked_box();
    assert(isdefined(player));
    self.chest_moving = 0;
    move_the_box = treasure_chest_should_move(chest, player);
    preferred_weapon = undefined;
    if (move_the_box) {
        preferred_weapon = level.weaponnone;
    } else {
        preferred_weapon = function_4aa1f177(player);
    }
    chest treasure_chest_weapon_locking(player, preferred_weapon, 1);
    self.weapon = level.weaponnone;
    modelname = undefined;
    rand = undefined;
    var_943077fe = isdefined(level.var_3ba4b305) ? level.var_3ba4b305 : 40;
    if (player hasperk(#"specialty_cooldown") || player namespace_e86ffa8::function_efb6dedf(4)) {
        var_943077fe = min(var_943077fe, 10);
    }
    var_f91a62a4 = 1;
    if (var_943077fe < 40) {
        var_f91a62a4 = var_943077fe / 40;
    }
    assert(var_f91a62a4 >= 0.1 && var_f91a62a4 <= 2, "<unknown string>");
    if (chest.zbarrier iszbarrier()) {
        if (isdefined(level.custom_magic_box_do_weapon_rise)) {
            chest.zbarrier thread [[ level.custom_magic_box_do_weapon_rise ]]();
        } else {
            chest.zbarrier thread magic_box_do_weapon_rise(var_f91a62a4);
        }
        chest.zbarrier endoncallback(&function_62197845, #"death");
    }
    for (i = 0; i < var_943077fe; i++) {
        if (i < var_943077fe * 0.5) {
            waitframe(1);
            continue;
        }
        if (i < var_943077fe * 0.75) {
            wait(0.1);
            continue;
        }
        if (i < var_943077fe * 0.875) {
            wait(0.2);
            continue;
        }
        if (i < var_943077fe * 0.95) {
            wait(0.3);
        }
    }
    if (isdefined(level.var_9e2df930)) {
        [[ level.var_9e2df930 ]]();
    }
    if (!move_the_box && preferred_weapon == level.weaponnone) {
        var_dd68aed7 = function_38456836();
        point = function_4ba8fde(var_dd68aed7);
        if (isdefined(point)) {
            preferred_weapon = point;
            if (isdefined(point.itementry.rarity)) {
                function_a6d171f4(point.itementry.rarity);
            }
        } else {
            if (isdefined(player)) {
                player iprintlnbold(#"zombie/magic_box_empty");
            }
            wait(1);
            if (isdefined(player)) {
                player zm_score::add_to_player_score(self.owner.zombie_cost, 0, "magicbox_bear");
            }
            self.owner.var_afba7c1f = 1;
            self notify(#"randomization_done");
            return;
        }
    }
    new_firesale = move_the_box && treasure_chest_firesale_active();
    if (new_firesale) {
        move_the_box = 0;
        preferred_weapon = function_4aa1f177(player);
    }
    if (!move_the_box && function_db355791(player, preferred_weapon, 0)) {
        rand = preferred_weapon;
    } else {
        rand = self function_4aa1f177(player);
    }
    if (!isdefined(rand.itementry.weapon)) {
        rand = level.weaponnone;
    }
    if (rand == level.weaponnone) {
        var_dd68aed7 = function_38456836();
        point = function_4ba8fde(var_dd68aed7);
        if (isdefined(point)) {
            rand = point;
        } else {
            if (isdefined(player)) {
                player iprintlnbold(#"zombie/magic_box_empty");
            }
            wait(1);
            if (isdefined(player)) {
                player zm_score::add_to_player_score(self.owner.zombie_cost, 0, "magicbox_bear");
            }
            self.owner.var_afba7c1f = 1;
            self notify(#"randomization_done");
            return;
        }
    }
    self.weapon = rand;
    self.var_b52f8370 = rand;
    if (isdefined(level.func_magicbox_weapon_spawned)) {
        self thread [[ level.func_magicbox_weapon_spawned ]](self.weapon);
    }
    wait(0.1);
    if (isdefined(level.custom_magicbox_float_height)) {
        v_float = anglestoup(self.angles) * level.custom_magicbox_float_height;
    } else {
        v_float = anglestoup(self.angles) * 40;
    }
    var_f05b52fe = anglestoforward(self.angles) * -1 * (isdefined(rand.itementry.var_bbdaa6b7) ? rand.itementry.var_bbdaa6b7 : 0) + anglestoright(self.angles) * -1 * (isdefined(rand.itementry.var_c96041c2) ? rand.itementry.var_c96041c2 : 0) + anglestoup(self.angles) * (isdefined(rand.itementry.var_e6b47c6a) ? rand.itementry.var_e6b47c6a : 0);
    self.model_dw = undefined;
    var_eb2b60e6 = self.origin + v_float + var_f05b52fe;
    if (isdefined(player)) {
        buildkitweapon = rand.itementry.weapon;
        if (killstreaks::is_killstreak_weapon(buildkitweapon)) {
            self.weapon_model = util::spawn_model(rand.itementry.model, var_eb2b60e6, (self.angles[0] * -1, self.angles[1] + 180, self.angles[2] * -1));
            self.weapon_model setscale(isdefined(rand.itementry.modelscale) ? rand.itementry.modelscale : 1);
            self.weapon_model notsolid();
        } else {
            self.weapon_model = zm_utility::spawn_buildkit_weapon_model(player, buildkitweapon, undefined, var_eb2b60e6, (self.angles[0] * -1, self.angles[1] + 180, self.angles[2] * -1));
        }
    } else {
        self.weapon_model = util::spawn_model(rand.model, var_eb2b60e6, (self.angles[0] * -1, self.angles[1] + 180, self.angles[2] * -1));
    }
    if (is_true(rand.itementry.weapon.isdualwield)) {
        dweapon = rand.itementry.weapon;
        if (isdefined(rand.itementry.weapon.dualwieldweapon) && rand.itementry.weapon.dualwieldweapon != level.weaponnone) {
            dweapon = rand.itementry.weapon.dualwieldweapon;
        }
        if (isdefined(player)) {
            self.weapon_model_dw = zm_utility::spawn_buildkit_weapon_model(player, dweapon, undefined, self.weapon_model.origin - (6, 3, 3), self.weapon_model.angles);
        } else {
            self.weapon_model_dw = util::spawn_model(dweapon.worldmodel, self.weapon_model.origin - (6, 3, 3), self.weapon_model.angles);
        }
    }
    wait(0.5);
    if (move_the_box && !(zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_on") && self [[ level._zombiemode_check_firesale_loc_valid_func ]]())) {
        self.weapon_model setmodel(level.chest_joker_model);
        foreach (player in getplayers()) {
            player clientfield::set_to_player("stream_magicbox_guns", 0);
        }
        if (isdefined(self.weapon_model_dw)) {
            self.weapon_model_dw delete();
            self.weapon_model_dw = undefined;
        }
        if (isplayer(chest.chest_user)) {
            if (chest.chest_user bgb::is_enabled(#"zm_bgb_unbearable")) {
                level.chest_accessed = 0;
                chest.unbearable_respin = 1;
                chest.chest_user notify(#"zm_bgb_unbearable", {#chest:chest});
                chest waittill(#"forever");
            } else {
                chest.chest_user contracts::increment_zm_contract(#"hash_684bf7f56e8b7557");
            }
        }
        self.chest_moving = 1;
        level flag::set("moving_chest_now");
        level.chest_accessed = 0;
        level.chest_moves++;
    }
    self notify(#"randomization_done");
    if (is_true(self.chest_moving)) {
        self.owner.var_c639ca3e = undefined;
        self function_a6d171f4(#"none");
        item_world::consume_item(self.var_b52f8370);
        if (isdefined(level.chest_joker_custom_movement)) {
            self thread [[ level.chest_joker_custom_movement ]]();
        } else {
            if (isdefined(self.weapon_model)) {
                v_origin = self.weapon_model.origin;
                self.weapon_model delete();
            }
            self.weapon_model = spawn("script_model", v_origin);
            self.weapon_model setmodel(level.chest_joker_model);
            self.weapon_model.angles = self.angles + (0, 180, 0);
            wait(0.5);
            level notify(#"weapon_fly_away_start");
            wait(2);
            if (isdefined(self.weapon_model)) {
                v_fly_away = self.origin + anglestoup(self.angles) * 500;
                self.weapon_model moveto(v_fly_away, 4, 3);
            }
            if (isdefined(self.weapon_model_dw)) {
                v_fly_away = self.origin + anglestoup(self.angles) * 500;
                self.weapon_model_dw moveto(v_fly_away, 4, 3);
            }
            if (isdefined(self.weapon_model)) {
                self.weapon_model waittill(#"movedone");
                self.weapon_model delete();
            }
            if (isdefined(self.weapon_model_dw)) {
                self.weapon_model_dw delete();
                self.weapon_model_dw = undefined;
            }
            self notify(#"box_moving");
            level notify(#"weapon_fly_away_end");
        }
    } else {
        if (!isdefined(respin)) {
            if (isdefined(chest.box_hacks[#"respin"])) {
                self [[ chest.box_hacks[#"respin"] ]](chest, player);
            }
        } else if (isdefined(chest.box_hacks[#"respin_respin"])) {
            self [[ chest.box_hacks[#"respin_respin"] ]](chest, player);
        }
        if (isdefined(level.custom_magic_box_timer_til_despawn)) {
            self.weapon_model thread [[ level.custom_magic_box_timer_til_despawn ]](self);
        } else {
            self.weapon_model thread timer_til_despawn(v_float);
        }
        if (isdefined(self.weapon_model_dw)) {
            if (isdefined(level.custom_magic_box_timer_til_despawn)) {
                self.weapon_model_dw thread [[ level.custom_magic_box_timer_til_despawn ]](self);
            } else {
                self.weapon_model_dw thread timer_til_despawn(v_float);
            }
        }
        if (isdefined(self.weapon_model)) {
            self.weapon_model zm_utility::function_36eb0acc(self.owner.var_c639ca3e);
        }
        if (isdefined(self.weapon_model_dw)) {
            self.weapon_model_dw zm_utility::function_36eb0acc(self.owner.var_c639ca3e);
        }
        self waittill(#"weapon_grabbed");
        self thread zm_vo::vo_stop();
        if (!chest.timedout) {
            if (isdefined(self.weapon_model)) {
                self.weapon_model delete();
            }
            if (isdefined(self.weapon_model_dw)) {
                self.weapon_model_dw delete();
            }
        }
    }
    chest treasure_chest_weapon_locking(player, preferred_weapon, 0);
    self.weapon = level.weaponnone;
    self notify(#"box_spin_done");
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x1d6f2445, Offset: 0x92a8
// Size: 0x262
function function_a6d171f4(str_rarity) {
    if (!isdefined(str_rarity) || str_rarity == "") {
        self clientfield::set("" + #"hash_66b8b96e588ce1ac", 0);
        return;
    }
    switch (str_rarity) {
    case #"none":
        self clientfield::set("" + #"hash_66b8b96e588ce1ac", 1);
        break;
    case #"resource":
        self clientfield::set("" + #"hash_66b8b96e588ce1ac", 2);
        break;
    case #"uncommon":
        self clientfield::set("" + #"hash_66b8b96e588ce1ac", 3);
        break;
    case #"rare":
        self clientfield::set("" + #"hash_66b8b96e588ce1ac", 4);
        break;
    case #"epic":
        self clientfield::set("" + #"hash_66b8b96e588ce1ac", 5);
        break;
    case #"legendary":
        self clientfield::set("" + #"hash_66b8b96e588ce1ac", 6);
        break;
    case #"ultra":
        self clientfield::set("" + #"hash_66b8b96e588ce1ac", 7);
        break;
    default:
        self clientfield::set("" + #"hash_66b8b96e588ce1ac", 0);
        break;
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0xa9679730, Offset: 0x9518
// Size: 0xf4
function timer_til_despawn(v_float) {
    self endon(#"kill_weapon_movement");
    if (#"hash_30b0badbca0a10de" === self.model) {
        self.angles = (self.angles[0] + 90, self.angles[1], self.angles[2]);
    }
    var_3be81b3b = isdefined(level.var_ad2674fe) ? level.var_ad2674fe : 12;
    self moveto(self.origin - v_float * 0.85, var_3be81b3b, var_3be81b3b * 0.5);
    wait(var_3be81b3b);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x2b0f8482, Offset: 0x9618
// Size: 0x14c
function treasure_chest_glowfx() {
    self endoncallback(&function_62197845, #"death");
    self clientfield::set("magicbox_open_fx", 1);
    self clientfield::set("magicbox_closed_fx", 0);
    self waittill(#"randomization_done");
    self function_a6d171f4(self.owner.var_c639ca3e);
    self clientfield::set("magicbox_open_fx", 0);
    s_waitresult = self waittill(#"weapon_grabbed", #"box_moving");
    if (s_waitresult._notify == "weapon_grabbed") {
        self clientfield::set("magicbox_closed_fx", 1);
    }
    self function_a6d171f4();
}

// Namespace zm_magicbox/zm_magicbox
// Params 3, eflags: 0x2 linked
// Checksum 0x7825e6fe, Offset: 0x9770
// Size: 0x59c
function treasure_chest_give_weapon(item, *var_75c86f89, e_chest) {
    self.last_box_weapon = gettime();
    if (!isentity(var_75c86f89) && !isstruct(var_75c86f89)) {
        println("<unknown string>");
        return;
    }
    weapon = isdefined(var_75c86f89.itementry.weapon) ? var_75c86f89.itementry.weapon : level.weaponnone;
    var_75c86f89.var_14948fd = 1;
    if (should_upgrade_weapon(self, weapon)) {
        if (self zm_weapons::can_upgrade_weapon(weapon)) {
            weapon = zm_weapons::get_upgrade_weapon(weapon);
            self notify(#"zm_bgb_crate_power_used");
        }
    }
    if (weapon.name == #"ww_ray_rifle_t9" || weapon.name == #"ray_gun" || weapon.name == #"ray_gun_mk2") {
        playsoundatposition(#"mus_raygun_stinger", (0, 0, 0));
    }
    if (zm_loadout::is_offhand_weapon(weapon)) {
        self give_offhand_weapon(weapon, e_chest.owner.var_9e7e27d7);
    } else {
        self.var_966bfd1b = 1;
        self playrumbleonentity(#"zm_interact_rumble");
        if (var_75c86f89.itementry.itemtype === #"scorestreak" || var_75c86f89.itementry.itemtype === #"equipment" || var_75c86f89.itementry.itemtype === #"tactical") {
            var_fa3df96 = self item_inventory::function_e66dcff5(var_75c86f89);
            if (isdefined(var_fa3df96)) {
                if (!item_world_util::function_db35e94f(var_75c86f89.networkid)) {
                    var_75c86f89.networkid = item_world_util::function_970b8d86(var_fa3df96);
                }
                var_75c86f89.hidetime = 0;
                if (var_75c86f89.itementry.itemtype === #"scorestreak") {
                    if (self.inventory.items[var_fa3df96].networkid != 32767) {
                        self item_inventory::function_fba40e6c(var_75c86f89);
                    } else {
                        item_world::function_de2018e3(var_75c86f89, self, var_fa3df96);
                    }
                } else if (self.inventory.items[var_fa3df96].networkid != 32767 && self.inventory.items[var_fa3df96].itementry.name != var_75c86f89.itementry.name) {
                    self item_inventory::function_fba40e6c(var_75c86f89);
                } else {
                    item_world::function_de2018e3(var_75c86f89, self, var_fa3df96);
                }
            } else {
                item_world::function_de2018e3(var_75c86f89, self);
            }
        } else {
            if (var_75c86f89.amount === 0) {
                var_75c86f89.amount = weapon.clipsize;
            }
            self zm_weapons::function_98776900(var_75c86f89, 0, 0, 1);
        }
    }
    weaponslotid = self item_inventory::function_d768ea30();
    if (!isdefined(weaponslotid)) {
        return;
    }
    if (!killstreaks::is_killstreak_weapon(weapon)) {
        weapon_item = self.inventory.items[weaponslotid];
        weapon_item.var_a0cc02cf = 1;
    } else {
        var_bcc2655a = undefined;
        var_16f12c31 = self.inventory.items[17];
        if (var_16f12c31.networkid !== 32767) {
            var_bcc2655a = var_16f12c31.itementry;
            var_bcc2655a.var_a0cc02cf = 1;
        }
    }
    self contracts::increment_zm_contract(#"contract_zm_magicbox", 1, #"zstandard");
    self callback::callback(#"hash_7d40e25056b9275c", weapon);
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x4
// Checksum 0xb62e595, Offset: 0x9d18
// Size: 0xb4
function private function_e62595c2(e_chest) {
    e_chest zm_vo::vo_stop();
    b_said = zm_vo::vo_say(#"hash_6364370b57ccf050" + zm_vo::function_82f9bc9f() + "_homu");
    if (is_true(b_said)) {
        wait(1);
    }
    zm_audio::create_and_play_dialog(#"magicbox", #"homunculus");
}

// Namespace zm_magicbox/zm_magicbox
// Params 2, eflags: 0x2 linked
// Checksum 0xa164460c, Offset: 0x9dd8
// Size: 0x1ec
function give_offhand_weapon(*weapon, str_item) {
    if (isdefined(str_item)) {
        for (i = 0; i < 5; i++) {
            point = function_4ba8fde(str_item);
            if (isdefined(point) && isdefined(point.itementry)) {
                dropitem = self item_drop::drop_item(i, point.itementry.weapon, 1, point.itementry.amount, point.id, self.origin, self.angles);
                if (isdefined(dropitem)) {
                    var_641d3dc2 = dropitem.itementry.itemtype != #"attachment";
                    itementry = dropitem.itementry;
                    var_1035544d = self item_world::pickup_item(dropitem, var_641d3dc2);
                    if (is_true(var_1035544d)) {
                        if (isdefined(itementry)) {
                            inventoryitem = self item_inventory::function_8babc9f9(itementry);
                        }
                        if (isdefined(inventoryitem)) {
                            self item_inventory::equip_equipment(inventoryitem);
                        }
                        continue;
                    }
                    self item_inventory::function_fba40e6c(dropitem);
                }
            }
        }
    }
    self zm_audio::create_and_play_dialog(#"magicbox", #"offhand");
}

// Namespace zm_magicbox/zm_magicbox
// Params 2, eflags: 0x2 linked
// Checksum 0xc096faf7, Offset: 0x9fd0
// Size: 0x66
function should_upgrade_weapon(player, weapon) {
    if (isdefined(level.magicbox_should_upgrade_weapon_override)) {
        return [[ level.magicbox_should_upgrade_weapon_override ]](player, weapon);
    }
    if (player bgb::is_enabled(#"zm_bgb_crate_power")) {
        return 1;
    }
    return 0;
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x9b2f944c, Offset: 0xa040
// Size: 0x244
function magic_box_do_weapon_rise(var_f91a62a4) {
    self endoncallback(&function_62197845, #"box_hacked_respin", #"death");
    self setzbarrierpiecestate(3, "closed");
    self setzbarrierpiecestate(4, "closed");
    util::wait_network_frame();
    self zbarrierpieceuseboxriselogic(3);
    self zbarrierpieceuseboxriselogic(4);
    self showzbarrierpiece(3);
    self showzbarrierpiece(4);
    self setzbarrierpiecestate(3, "opening", var_f91a62a4);
    self setzbarrierpiecestate(4, "opening", var_f91a62a4);
    if (var_f91a62a4 != 1) {
        self playsound(#"hash_59a4ec7cb3de7d13");
        self waittill(#"randomization_done");
        self setzbarrierpiecestate(3, "open");
        self setzbarrierpiecestate(4, "open");
    } else {
        self playsound(#"hash_1530a7e6184b9b2e");
        while (self getzbarrierpiecestate(3) != "open") {
            wait(0.5);
        }
    }
    self hidezbarrierpiece(3);
    self hidezbarrierpiece(4);
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x273fc4b4, Offset: 0xa290
// Size: 0xd0
function function_15cd8d85() {
    self endoncallback(&function_62197845, #"death", #"zbarrier_state_change");
    self setzbarrierpiecestate(0, "closed");
    while (true) {
        wait(randomfloatrange(180, 1800));
        self setzbarrierpiecestate(0, "opening");
        wait(randomfloatrange(180, 1800));
        self setzbarrierpiecestate(0, "closing");
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x40a433a0, Offset: 0xa368
// Size: 0x44
function function_f6a827d1() {
    self setzbarrierpiecestate(1, "opening");
    self clientfield::set("magicbox_closed_fx", 1);
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0xad9119da, Offset: 0xa3b8
// Size: 0xa4
function magic_box_zbarrier_leave() {
    self endoncallback(&function_62197845, #"death");
    self clientfield::increment("magicbox_leave_fx");
    self set_magic_box_zbarrier_state("leaving");
    self waittill(#"left", #"timeout_away");
    self set_magic_box_zbarrier_state("away");
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0xc114d4ed, Offset: 0xa468
// Size: 0xa6
function function_24ce1c91() {
    self endoncallback(&function_62197845, #"death");
    self clientfield::increment("zbarrier_arriving_sounds");
    self setzbarrierpiecestate(1, "opening");
    while (self getzbarrierpiecestate(1) == "opening") {
        waitframe(1);
    }
    self notify(#"arrived");
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0xb339cb6e, Offset: 0xa518
// Size: 0xa6
function function_65b1adcb() {
    self endoncallback(&function_62197845, #"death");
    self clientfield::increment("zbarrier_leaving_sounds");
    self setzbarrierpiecestate(1, "closing");
    while (self getzbarrierpiecestate(1) == "closing") {
        wait(0.1);
    }
    self notify(#"left");
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x4dfece0d, Offset: 0xa5c8
// Size: 0x8e
function function_12804472() {
    self endoncallback(&function_62197845, #"death");
    self setzbarrierpiecestate(2, "opening");
    while (self getzbarrierpiecestate(2) == "opening") {
        wait(0.1);
    }
    self notify(#"opened");
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x9d9d883f, Offset: 0xa660
// Size: 0x8e
function function_cd5d65b0() {
    self endoncallback(&function_62197845, #"death");
    self setzbarrierpiecestate(2, "closing");
    while (self getzbarrierpiecestate(2) == "closing") {
        wait(0.1);
    }
    self notify(#"closed");
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x0
// Checksum 0xe3f66519, Offset: 0xa6f8
// Size: 0xa
function get_magic_box_zbarrier_state() {
    return self.state;
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x97d4d5d1, Offset: 0xa710
// Size: 0x7c
function set_magic_box_zbarrier_state(state) {
    for (i = 0; i < self getnumzbarrierpieces(); i++) {
        self hidezbarrierpiece(i);
    }
    self notify(#"zbarrier_state_change");
    self [[ level.magic_box_zbarrier_state_func ]](state);
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x4c69d042, Offset: 0xa798
// Size: 0x232
function process_magic_box_zbarrier_state(state) {
    switch (state) {
    case #"away":
        self showzbarrierpiece(0);
        self thread function_15cd8d85();
        self.state = "away";
        break;
    case #"arriving":
        self showzbarrierpiece(1);
        self thread function_24ce1c91();
        self.state = "arriving";
        break;
    case #"initial":
        self showzbarrierpiece(1);
        self thread function_f6a827d1();
        self.state = "initial";
        break;
    case #"open":
        self showzbarrierpiece(2);
        self thread function_12804472();
        self.state = "open";
        break;
    case #"close":
        self showzbarrierpiece(2);
        self thread function_cd5d65b0();
        self.state = "close";
        break;
    case #"leaving":
        self showzbarrierpiece(1);
        self thread function_65b1adcb();
        self.state = "leaving";
        break;
    default:
        if (isdefined(level.custom_magicbox_state_handler)) {
            self [[ level.custom_magicbox_state_handler ]](state);
        }
        break;
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x39c87e32, Offset: 0xa9d8
// Size: 0x16c
function magicbox_host_migration() {
    level endon(#"end_game");
    level notify(#"mb_hostmigration");
    level endon(#"mb_hostmigration");
    while (true) {
        level waittill(#"host_migration_end");
        if (!isdefined(level.chests)) {
            continue;
        }
        foreach (chest in level.chests) {
            if (!is_true(chest.hidden)) {
                if (isdefined(chest) && isdefined(chest.pandora_light)) {
                    playfxontag(level._effect[#"lght_marker"], chest.pandora_light, "tag_origin");
                }
            }
            util::wait_network_frame();
        }
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x1baad2ed, Offset: 0xab50
// Size: 0x90
function function_7d384b90() {
    foreach (s_chest in level.chests) {
        level thread function_d81704a5(s_chest);
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 1, eflags: 0x2 linked
// Checksum 0x3e7102dd, Offset: 0xabe8
// Size: 0x3e
function function_d81704a5(s_chest) {
    while (is_true(s_chest._box_open)) {
        waitframe(1);
    }
    s_chest.var_dd0d4460 = 1;
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x2 linked
// Checksum 0x5a86457b, Offset: 0xac30
// Size: 0x4c
function function_338c302b() {
    level endon(#"game_ended");
    while (true) {
        level waittill(#"start_of_round");
        level.var_40f4f72d = 0;
    }
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0xac88
// Size: 0x4
function magicbox_unitrigger_think() {
    
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x0
// Checksum 0x988ab8a8, Offset: 0xac98
// Size: 0x14
function function_35c66b27() {
    process_magic_box_zbarrier_state();
}

// Namespace zm_magicbox/zm_magicbox
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0xacb8
// Size: 0x4
function function_f5503c41() {
    
}

