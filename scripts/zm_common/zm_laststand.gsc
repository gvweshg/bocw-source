// Atian COD Tools GSC CW decompiler test
#using script_48f7c4ab73137f8;
#using script_243ea03c7a285692;
#using scripts\weapons\weapons.gsc;
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using script_58860a35d0555f74;
#using script_5f261a5d57de5f7c;
#using script_3751b21462a54a7d;
#using scripts\zm_common\trials\zm_trial_disable_perks.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_laststand;

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x5
// Checksum 0xd2a5e181, Offset: 0x558
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"zm_laststand", &preinit, undefined, undefined, undefined);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x6 linked
// Checksum 0x568e65ca, Offset: 0x5a0
// Size: 0x30c
function private preinit() {
    level flag::init("solo_revive");
    level.revive_hud = revive_hud::register();
    level.var_ff482f76 = zm_laststand_client::register();
    callback::on_connect(&on_player_connect);
    callback::on_disconnect(&on_player_disconnect);
    callback::on_spawned(&on_spawned);
    callback::on_disconnect(&function_4d3cb10);
    callback::on_ai_killed(&on_ai_killed);
    callback::on_item_pickup(&on_item_pickup);
    callback::on_player_killed(&on_player_killed);
    callback::on_bleedout(&on_bleedout);
    level.var_402b86e = &function_c3249e8c;
    clientfield::register_clientuimodel("ZMInventoryPersonal.self_revive_count", 1, 2, "int");
    clientfield::register("allplayers", "zm_last_stand_postfx", 1, 1, "int");
    level.laststand_update_clientfields = [];
    for (i = 0; i < 5; i++) {
        level.laststand_update_clientfields[i] = "laststand_update" + i;
        clientfield::register("world", level.laststand_update_clientfields[i], 1, 5, "float");
        clientfield::register_clientuimodel("WorldSpaceIndicators.bleedOutModel" + i + ".hide", 1, 1, "int");
    }
    level.weaponsuicide = getweapon(#"death_self");
    if (!isdefined(getdvar(#"revive_trigger_radius"))) {
        setdvar(#"revive_trigger_radius", 100);
    }
    if (!isdefined(level.var_3ea7f9f4)) {
        level.var_3ea7f9f4 = 1;
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x21b4630f, Offset: 0x8b8
// Size: 0x44
function on_player_connect() {
    function_2806e8fd();
    self thread function_b7c101fa();
    self thread function_6155752d();
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x87d2250a, Offset: 0x908
// Size: 0x14
function on_player_disconnect() {
    function_2806e8fd();
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x1833c59f, Offset: 0x928
// Size: 0x1e
function on_spawned() {
    function_2806e8fd();
    self.var_39c78617 = undefined;
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x324151d9, Offset: 0x950
// Size: 0x156
function function_2806e8fd() {
    foreach (player in getplayers()) {
        if (isplayer(player)) {
            if (isdefined(player.entnum)) {
                if (player laststand::player_is_in_laststand()) {
                    clientfield::set_world_uimodel("PlayerList.client" + player.entnum + ".playerIsDowned", 1);
                } else {
                    clientfield::set_world_uimodel("PlayerList.client" + player.entnum + ".playerIsDowned", 0);
                }
            }
            if (isalive(player)) {
                player.statusicon = "";
                continue;
            }
            player.statusicon = "hud_status_dead";
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x8a8a8abc, Offset: 0xab0
// Size: 0xe4
function on_bleedout() {
    if (!zm_player::function_3799b373(self, 1) && !zm_utility::function_91403f47()) {
        if (!zm_trial::is_trial_mode()) {
            self takeallweapons();
            self allowstand(0);
            self allowcrouch(0);
            self allowprone(1);
            self allowsprint(0);
            self setstance("prone");
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 9, eflags: 0x2 linked
// Checksum 0xa05c21b2, Offset: 0xba0
// Size: 0x1ec
function player_last_stand_stats(einflictor, attacker, *idamage, *smeansofdeath, *weapon, *vdir, *shitloc, *psoffsettime, *deathanimduration) {
    if (isdefined(deathanimduration) && isplayer(deathanimduration) && deathanimduration != self) {
        if ("zcleansed" == level.gametype) {
            demo::kill_bookmark(deathanimduration, self, psoffsettime);
            potm::kill_bookmark(deathanimduration, self, psoffsettime);
        }
        if ("zcleansed" == level.gametype) {
            if (!is_true(deathanimduration.is_zombie)) {
                deathanimduration.kills++;
            } else {
                deathanimduration.downs++;
            }
        } else {
            deathanimduration.kills++;
        }
    }
    self increment_downed_stat();
    if (level flag::get("solo_game") && self function_618fd37e() == 0 && getnumconnectedplayers() < 2) {
        self zm_stats::increment_client_stat("deaths");
        self zm_stats::increment_player_stat("deaths");
        self zm_stats::function_8f10788e("boas_deaths");
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x2bb26507, Offset: 0xd98
// Size: 0x194
function increment_downed_stat() {
    if ("zcleansed" != level.gametype) {
        self.downs++;
    }
    self zm_stats::increment_global_stat("TOTAL_DOWNS");
    self zm_stats::increment_map_stat("TOTAL_DOWNS");
    self zm_stats::function_f1a1191d("TOTAL_DOWNS");
    self zm_stats::function_2726a7c2("TOTAL_DOWNS");
    self zm_stats::increment_client_stat("downs");
    self zm_stats::function_8f10788e("boas_downs");
    self add_weighted_down();
    self zm_stats::increment_player_stat("downs");
    if (!zm_utility::is_survival() && !zm_utility::function_c200446c()) {
        zonename = self zm_utility::get_current_zone();
        if (!isdefined(zonename)) {
            zonename = "";
        }
        self recordplayerdownzombies(zonename);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0x400643cb, Offset: 0xf38
// Size: 0x64
function registerfxanim_warehouse_explo(pause_enabled) {
    for (slot = 0; slot < 3; slot++) {
        if (!isdefined(self._gadgets_player[slot])) {
            continue;
        }
        self function_19ed70ca(slot, pause_enabled);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 10, eflags: 0x2 linked
// Checksum 0x12d87d84, Offset: 0xfa8
// Size: 0x984
function playerlaststand(einflictor, attacker, idamage, smeansofdeath, weapon, *var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration) {
    level notify(#"hash_18a0e5282b038637");
    self notify(#"entering_last_stand");
    callback::callback(#"entering_last_stand");
    if (self isskydiving()) {
        self function_8cf53a19();
    }
    self disableweaponcycling();
    self registerfxanim_warehouse_explo(1);
    if (self laststand::player_is_in_laststand() && !is_true(self.var_b895a3ff)) {
        return;
    }
    if (is_true(self.in_zombify_call)) {
        return;
    }
    clientfield::set_world_uimodel("PlayerList.client" + self.entnum + ".playerIsDowned", 1);
    self thread player_last_stand_stats(attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime, deathanimduration);
    if (weapon == "MOD_SUICIDE" || self === idamage) {
        self zm_stats::increment_client_stat("suicides");
        self zm_stats::increment_player_stat("suicides");
        self zm_stats::function_8f10788e("boas_suicides");
    }
    if (self namespace_e86ffa8::function_8923370c(1)) {
        self setmovespeedscale(2);
    }
    self.var_42dd3eba = 0;
    self.var_93369bb6 = 0;
    self.var_2e139723 = 0;
    self allowjump(0);
    currweapon = self getcurrentweapon();
    self stats::function_e24eec31(currweapon, #"deathsduringuse", 1);
    if (self function_618fd37e() > 0 && !is_true(level.var_28bbd30a)) {
        if (!zm_utility::is_survival() && is_true(self.var_20f86af4)) {
            self thread wait_and_revive();
        } else {
            self thread function_3699b145();
        }
    }
    self zm_utility::clear_is_drinking();
    self zm_score::player_downed_penalty();
    self disableoffhandweapons();
    self disableoffhandspecial();
    if (self isusingoffhand()) {
        self forceoffhandend();
    }
    if (isdefined(level._zombie_minigun_powerup_last_stand_func)) {
        self thread [[ level._zombie_minigun_powerup_last_stand_func ]]();
    }
    if (isdefined(level._zombie_tesla_powerup_last_stand_func)) {
        self thread [[ level._zombie_tesla_powerup_last_stand_func ]]();
    }
    if (self hasperk(#"specialty_electriccherry") || self function_6c32d092(#"hash_79774956f321dfed")) {
        if (isdefined(level.custom_laststand_func)) {
            self thread [[ level.custom_laststand_func ]]();
        }
    }
    if (isdefined(self.intermission) && self.intermission) {
        wait(0.5);
        self stopsounds();
        level waittill(#"forever");
    }
    self clientfield::set("zm_last_stand_postfx", 1);
    self.var_bd4dd069 = gettime();
    self.health = 1;
    self.laststand = 1;
    self val::set(#"laststand", "ignoreme");
    if (weapon != "MOD_SUICIDE" && weapon != "MOD_FALLING") {
        self thread util::delay(1, "disconnect", &zm_vo::function_d342796e, #"hash_97e18b450a8ee6c", undefined, 1, undefined, undefined, 20);
    }
    if (!is_true(self.no_revive_trigger) || !is_true(self.var_39c78617)) {
        self revive_trigger_spawn();
    }
    if (is_true(self.is_zombie)) {
        self takeallweapons();
        if (isdefined(idamage) && isplayer(idamage) && idamage != self) {
            idamage notify(#"killed_a_zombie_player", attacker);
        }
    } else {
        self laststand_disable_player_weapons();
        self laststand_give_pistol();
    }
    if (isdefined(self.var_c4890291)) {
        self.var_c4890291 = [];
    }
    if (!isdefined(self.n_downs)) {
        self.n_downs = 0;
    }
    self.n_downs += 1;
    bleedout_time = getdvarfloat(#"hash_1116ba0f929df636", isdefined(self.var_b92e42da) ? self.var_b92e42da : getdvarfloat(#"player_laststandbleedouttime", 0));
    if (zm_custom::function_901b751c(#"zmlimiteddownsamount") && self.n_downs > zm_custom::function_901b751c(#"zmlimiteddownsamount")) {
        bleedout_time = 0;
    }
    if (isdefined(self.n_bleedout_time_multiplier)) {
        bleedout_time *= self.n_bleedout_time_multiplier;
    }
    if (isdefined(self.var_5c4f1263)) {
        bleedout_time *= self.var_5c4f1263;
    }
    if (self namespace_e86ffa8::function_33d837e4(2)) {
        bleedout_time = 60;
    }
    self thread laststand_bleedout(bleedout_time);
    demo::bookmark(#"player_downed", gettime(), self);
    potm::bookmark(#"player_downed", gettime(), self);
    self notify(#"player_downed");
    callback::callback(#"on_player_laststand");
    self thread refire_player_downed();
    self thread laststand::function_d4c9e1b5();
    self thread auto_revive_on_notify();
    if (self function_1a2fa922()) {
        self playsound(#"hash_19b37c3454f86a4a");
    }
    self thread function_3ddb9d13();
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0xcaeec748, Offset: 0x1938
// Size: 0xcc
function function_3ddb9d13() {
    if (!isplayer(self)) {
        return;
    }
    level endon(#"end_game");
    self endon(#"death", #"player_revived");
    wait(1);
    if (isplayer(self) && (self namespace_e86ffa8::function_8923370c(5) || is_true(self.var_5f465b1))) {
        self thread zm_equipment::show_hint_text(#"hash_6a3daa16f61b974b");
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x0
// Checksum 0xf71acae4, Offset: 0x1a10
// Size: 0x126
function function_70fcc093() {
    if (isdefined(level.var_e1d82d33)) {
        foreach (player in function_a1ef346b(self.team)) {
            if (isplayer(player) && player != self) {
                s_path = generatenavmeshpath(self.origin, player.origin);
                if (isdefined(s_path)) {
                    if (isdefined(s_path.pathdistance)) {
                        if (s_path.pathdistance < level.var_e1d82d33) {
                            return true;
                        }
                    }
                } else {
                    return true;
                }
                waitframe(1);
            }
        }
    }
    return false;
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x2a039e6b, Offset: 0x1b40
// Size: 0x7c
function auto_revive_on_notify() {
    self endon(#"death", #"player_revived");
    s_result = self waittill(#"auto_revive", #"remote_revive");
    self thread auto_revive(s_result.reviver);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x55bf8b19, Offset: 0x1bc8
// Size: 0xaa
function function_1a2fa922() {
    if (level.players.size > 1) {
        foreach (e_player in level.players) {
            if (zm_utility::is_player_valid(e_player)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0xd9b4a22a, Offset: 0x1c80
// Size: 0x34c
function wait_and_revive() {
    self endoncallback(&function_e0f05bad, #"player_revived", #"death");
    level flag::set("wait_and_revive");
    level.wait_and_revive = 1;
    if (is_true(self.waiting_to_revive)) {
        return;
    }
    self.waiting_to_revive = 1;
    if (isdefined(level.exit_level_func)) {
        self thread [[ level.exit_level_func ]]();
    } else if (getplayers().size == 1) {
        player = getplayers()[0];
        level.move_away_points = positionquery_source_navigation(player.origin, 480, 960, 120, 20);
        if (!isdefined(level.move_away_points)) {
            level.move_away_points = positionquery_source_navigation(player.last_valid_position, 480, 960, 120, 20);
        }
    }
    var_3269dfa3 = (isdefined(self.var_b92e42da) ? self.var_b92e42da : getdvarfloat(#"player_laststandbleedouttime", 0)) * 0.25;
    var_3269dfa3 = getdvarfloat(#"hash_1d447d6b4492bf4f", var_3269dfa3);
    self thread laststand::revive_hud_show_n_fade(#"zombie/reviving_solo", var_3269dfa3);
    var_c564fe97 = level waittilltimeout(var_3269dfa3, #"end_of_round");
    if (var_c564fe97._notify === "end_of_round") {
        self thread laststand::revive_hud_show_n_fade(#"zombie/reviving_solo", 1);
    }
    while (self.var_16735873 === 1) {
        wait(0.1);
    }
    if (isdefined(level.a_revive_success_perk_func)) {
        foreach (func in level.a_revive_success_perk_func) {
            self [[ func ]]();
        }
    }
    self thread function_e0f05bad();
    self thread auto_revive(self, 1, 1);
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0xc7551994, Offset: 0x1fd8
// Size: 0x4a
function function_e0f05bad(*var_c34665fc) {
    level flag::clear("wait_and_revive");
    level.wait_and_revive = 0;
    if (isdefined(self)) {
        self.waiting_to_revive = 0;
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x936b6439, Offset: 0x2030
// Size: 0x4e
function refire_player_downed() {
    self endon(#"player_revived", #"death");
    wait(1);
    if (self.num_perks) {
        self notify(#"player_downed");
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0xcc219b2c, Offset: 0x2088
// Size: 0x1d6
function laststand_disable_player_weapons() {
    self disableweaponcycling();
    var_df4942c2 = self getweaponslist(1);
    self.lastactiveweapon = self.lastnonkillstreakweapon;
    self.laststandpistol = function_549df594();
    foreach (weapon in var_df4942c2) {
        if (weapon == level.var_34d27b26) {
            continue;
        }
        if (zm_weapons::get_base_weapon(weapon) == zm_weapons::get_base_weapon(self.laststandpistol)) {
            function_f351748e(weapon);
        }
        if (self function_94cd8c0f()) {
            self zm_stats::increment_client_stat("failed_sacrifices");
            self zm_stats::increment_player_stat("failed_sacrifices");
            continue;
        }
        if (weapon.isperkbottle) {
            self takeweapon(weapon);
            self.lastactiveweapon = level.weaponnone;
        }
    }
    self notify(#"weapons_taken_for_last_stand");
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0x5b15d55a, Offset: 0x2268
// Size: 0x31a
function laststand_enable_player_weapons(b_bled_out) {
    self endon(#"death");
    if (isdefined(self.laststandpistol)) {
        if (isdefined(self.var_1d2409c1)) {
            if (is_true(self.var_9c882b2d)) {
                self.var_9c882b2d = undefined;
                self takeweapon(self.laststandpistol);
            } else {
                function_a9cb028f();
            }
            self.var_1d2409c1 = undefined;
        } else if (is_true(self.var_9c882b2d)) {
            self.var_9c882b2d = undefined;
            self takeweapon(self.laststandpistol);
        }
    }
    if (!is_true(b_bled_out)) {
        self enableweaponcycling();
        self enableoffhandweapons();
        self enableoffhandspecial();
        self registerfxanim_warehouse_explo(0);
        if (self.lastactiveweapon != level.weaponnone && self hasweapon(self.lastactiveweapon, 1) && !zm_loadout::is_placeable_mine(self.lastactiveweapon) && !zm_equipment::is_equipment(self.lastactiveweapon) && !zm_loadout::is_hero_weapon(self.lastactiveweapon) && !self.lastactiveweapon.isriotshield) {
            self switchtoweapon(self.lastactiveweapon);
        } else if (self getweaponslistprimaries().size) {
            self switchtoweapon();
        } else {
            zm_weapons::give_fallback_weapon();
        }
        do {
            s_waitresult = self waittilltimeout(2.5, #"weapon_change_complete");
        } while (self getcurrentweapon() === level.weaponnone);
    }
    self.laststandpistol = undefined;
    self notify(#"hash_9b426cce825928d");
    if (is_true(b_bled_out)) {
        waitframe(1);
        self.s_loadout = zm_weapons::player_get_loadout();
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x4244c869, Offset: 0x2590
// Size: 0x18
function laststand_has_players_weapons_returned() {
    if (isdefined(self.laststandpistol)) {
        return false;
    }
    return true;
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0xbbd5780, Offset: 0x25b0
// Size: 0x34
function function_cbfcda16() {
    if (level.players.size > 1) {
        return level.default_laststandpistol;
    }
    return level.default_solo_laststandpistol;
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x997b751b, Offset: 0x25f0
// Size: 0x538
function function_5ff83684() {
    level.pistol_values = [];
    level.pistol_values[level.pistol_values.size] = level.default_laststandpistol;
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_semiauto_t9");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_burst_t9");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_revolver_t9");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_fullauto_t9");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_shotgun_t9");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_semiauto_t9_dw");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_burst_t9_dw");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_revolver_t9_dw");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_fullauto_t9_dw");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_shotgun_t9_dw");
    level.pistol_value_solo_replace_below = level.pistol_values.size - 1;
    level.pistol_values[level.pistol_values.size] = level.default_solo_laststandpistol;
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_semiauto_t9_upgraded");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_burst_t9_upgraded");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_revolver_t9_upgraded");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_fullauto_t9_upgraded");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_shotgun_t9_upgraded");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_semiauto_t9_dw_upgraded");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_burst_t9_dw_upgraded");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_revolver_t9_dw_upgraded");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_fullauto_t9_dw_upgraded");
    level.pistol_values[level.pistol_values.size] = getweapon(#"pistol_shotgun_t9_dw_upgraded");
    level.pistol_values[level.pistol_values.size] = getweapon(#"ray_gun");
    level.pistol_values[level.pistol_values.size] = getweapon(#"ray_gun_upgraded");
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x0
// Checksum 0xe9b1aa8b, Offset: 0x2b30
// Size: 0xa8
function function_aac4b2c9(weapon) {
    assert(weapon.weapclass === "<unknown string>" || weapon.weapclass === "<unknown string>" || weapon.weapclass === "<unknown string>", "<unknown string>");
    level flag::wait_till(#"load_main_complete");
    level.pistol_values[level.pistol_values.size] = weapon;
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x4cd9559c, Offset: 0x2be0
// Size: 0x1ce
function function_6155752d() {
    self endon(#"disconnect");
    self.var_d84718d1 = [];
    while (true) {
        s_result = self waittill(#"weapon_change_complete");
        if (isinarray(self.var_d84718d1, s_result.weapon) || laststand::player_is_in_laststand()) {
            continue;
        }
        if (killstreaks::is_killstreak_weapon(s_result.weapon)) {
            continue;
        }
        switch (s_result.weapon.weapclass) {
        case #"pistol spread":
        case #"pistolspread":
        case #"pistol":
            if (is_true(level.var_d3cfc0c0) && zm_weapons::is_weapon_upgraded(s_result.weapon)) {
                continue;
            } else {
                if (!isdefined(self.var_d84718d1)) {
                    self.var_d84718d1 = [];
                } else if (!isarray(self.var_d84718d1)) {
                    self.var_d84718d1 = array(self.var_d84718d1);
                }
                self.var_d84718d1[self.var_d84718d1.size] = s_result.weapon;
            }
            continue;
        default:
            continue;
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x883a3bb5, Offset: 0x2db8
// Size: 0x1ac
function function_25a89622() {
    if (self zm_loadout::has_powerup_weapon()) {
        self.lastactiveweapon = level.weaponnone;
    }
    if (isdefined(self.w_min_last_stand_pistol_override)) {
        self function_f161bb2d();
    }
    if (!self hasweapon(self.laststandpistol, 0)) {
        self.var_9c882b2d = 1;
        self giveweapon(self.laststandpistol);
    } else if (!self hasweapon(self.laststandpistol, 0, 0)) {
        n_id = function_9f1cc9a9(self.laststandpistol);
        var_feac2bf9 = n_id ? 0 : 1;
        self.laststandpistol = function_eeddea9a(self.laststandpistol, var_feac2bf9);
    }
    if (isdefined(self.var_1d2409c1)) {
        self setweaponammoclip(self.laststandpistol, self.laststandpistol.clipsize);
    }
    self setweaponammostock(self.laststandpistol, self.laststandpistol.clipsize * 2);
    self switchtoweapon(self.laststandpistol);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x7eb336af, Offset: 0x2f70
// Size: 0xd6
function function_f161bb2d() {
    for (i = 0; i < level.pistol_values.size; i++) {
        if (level.pistol_values[i] == self.w_min_last_stand_pistol_override) {
            n_min_last_stand_pistol_value = i;
            break;
        }
    }
    for (k = 0; k < level.pistol_values.size; k++) {
        if (level.pistol_values[k] == self.laststandpistol) {
            n_default_last_stand_pistol_value = k;
            break;
        }
    }
    if (n_min_last_stand_pistol_value > n_default_last_stand_pistol_value) {
        self.hadpistol = 0;
        self.laststandpistol = self.w_min_last_stand_pistol_override;
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x640f41cd, Offset: 0x3050
// Size: 0x1a2
function function_549df594() {
    var_2a32d68 = self.var_d84718d1;
    if (!isdefined(var_2a32d68)) {
        var_2a32d68 = [];
    } else if (!isarray(var_2a32d68)) {
        var_2a32d68 = array(var_2a32d68);
    }
    if (!isinarray(var_2a32d68, function_cbfcda16())) {
        var_2a32d68[var_2a32d68.size] = function_cbfcda16();
    }
    var_d3702e29 = 0;
    w_pistol = var_2a32d68[0];
    foreach (var_21ae1e3c in var_2a32d68) {
        for (j = 0; j < level.pistol_values.size; j++) {
            if (level.pistol_values[j] == var_21ae1e3c.rootweapon) {
                if (j > var_d3702e29) {
                    var_d3702e29 = j;
                    w_pistol = var_21ae1e3c;
                }
                break;
            }
        }
    }
    return self getbuildkitweapon(w_pistol);
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0x911e596e, Offset: 0x3200
// Size: 0xb6
function function_f351748e(weapon) {
    var_1d2409c1 = spawnstruct();
    var_1d2409c1.n_clip = self getweaponammoclip(weapon);
    var_1d2409c1.var_d54402a8 = 0;
    if (weapon.dualwieldweapon != level.weaponnone) {
        var_1d2409c1.var_d54402a8 = self getweaponammoclip(weapon.dualwieldweapon);
    }
    var_1d2409c1.n_stock = self getweaponammostock(weapon);
    self.var_1d2409c1 = var_1d2409c1;
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x61ee1690, Offset: 0x32c0
// Size: 0xcc
function function_a9cb028f() {
    var_1d2409c1 = self.var_1d2409c1;
    weapon = self.laststandpistol;
    if (self hasweapon(weapon, 1)) {
        self setweaponammoclip(weapon, var_1d2409c1.n_clip);
        if (weapon.dualwieldweapon != level.weaponnone) {
            self setweaponammoclip(weapon.dualwieldweapon, var_1d2409c1.var_d54402a8);
        }
        self setweaponammostock(weapon, var_1d2409c1.n_stock);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0xd8963d03, Offset: 0x3398
// Size: 0x94
function laststand_clean_up_on_disconnect(e_revivee) {
    self endon(#"do_revive_ended_normally", #"death");
    revivetrigger = e_revivee.revivetrigger;
    e_revivee waittill(#"disconnect");
    if (isdefined(revivetrigger)) {
        revivetrigger delete();
    }
    self function_92bfddb4();
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0x3f3757b2, Offset: 0x3438
// Size: 0x9a
function laststand_clean_up_reviving_any(e_revivee) {
    self endon(#"do_revive_ended_normally", #"disconnect");
    e_revivee waittill(#"disconnect", #"zombified", #"stop_revive_trigger");
    if (!isdefined(self.is_reviving_any)) {
        self.is_reviving_any = 0;
    }
    self.is_reviving_any--;
    if (self.is_reviving_any < 0) {
        self.is_reviving_any = 0;
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x1531b1b5, Offset: 0x34e0
// Size: 0x7c
function laststand_give_pistol() {
    assert(isdefined(self.laststandpistol));
    assert(self.laststandpistol != level.weaponnone);
    function_25a89622();
    self thread wait_switch_weapon(1, self.laststandpistol);
}

// Namespace zm_laststand/zm_laststand
// Params 2, eflags: 0x2 linked
// Checksum 0x643da729, Offset: 0x3568
// Size: 0x64
function wait_switch_weapon(n_delay, w_weapon) {
    self endon(#"player_revived", #"zombified", #"disconnect");
    wait(n_delay);
    self switchtoweapon(w_weapon);
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0x25b9859f, Offset: 0x35d8
// Size: 0xa4
function function_4d7504fd(*notifyhash) {
    if (isplayer(self) && isdefined(level.var_ff482f76) && level.var_ff482f76 zm_laststand_client::is_open(self)) {
        level.var_ff482f76 zm_laststand_client::close(self);
    }
    self laststand::function_f5714974();
    self namespace_791d0451::function_4af7e89f();
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x6 linked
// Checksum 0x2ff18d8a, Offset: 0x3688
// Size: 0xa8
function private function_c499895c(*notifyhash) {
    a_e_players = getplayers();
    foreach (player in a_e_players) {
        player function_4d7504fd();
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0x85ed428e, Offset: 0x3738
// Size: 0x6f4
function laststand_bleedout(delay) {
    self endoncallback(&function_4d7504fd, #"player_revived", #"zombified", #"disconnect", #"instakill_player", #"fake_death");
    level endoncallback(&function_c499895c, #"end_game", #"round_reset");
    if (level flag::get("round_reset")) {
        return;
    }
    self thread zm_perks::function_b4c0e0ee(delay);
    if (is_true(level.var_5b7d2700)) {
        return;
    }
    if (is_true(self.is_zombie) || is_true(self.var_39c78617) || is_true(level.var_d3b056a7) && !is_true(self.var_b895a3ff) && getwaterheight(self.origin) > self.origin[2] + 128) {
        self notify(#"bled_out");
        globallogic_player::function_b2873ebe();
        level notify(#"player_bled_out", {#player:self});
        self callback::callback(#"on_player_bleedout");
        util::wait_network_frame();
        self bleed_out();
        return;
    }
    self clientfield::set("zmbLastStand", 1);
    self.bleedout_time = delay;
    if (!level.var_ff482f76 zm_laststand_client::is_open(self)) {
        level.var_ff482f76 zm_laststand_client::open(self, 0);
    }
    level.var_ff482f76 zm_laststand_client::set_num_downs(self, self.n_downs);
    level.var_ff482f76 zm_laststand_client::set_revive_progress(self, 0);
    while (self.bleedout_time > 0) {
        if (is_true(level.var_d3b056a7) && getwaterheight(self.origin) > self.origin[2] + 128 && !is_true(self.var_b895a3ff)) {
            self.bleedout_time = 0;
            break;
        }
        if (is_true(self.var_16735873)) {
            if (isplayer(self) && isdefined(level.var_ff482f76) && level.var_ff482f76 zm_laststand_client::is_open(self)) {
                level.var_ff482f76 zm_laststand_client::close(self);
                self laststand::function_f5714974();
            }
        } else {
            if (!level.var_ff482f76 zm_laststand_client::is_open(self)) {
                level.var_ff482f76 zm_laststand_client::open(self, 0);
                level.var_ff482f76 zm_laststand_client::set_num_downs(self, self.n_downs);
                level.var_ff482f76 zm_laststand_client::set_revive_progress(self, 0);
            }
            self.bleedout_time -= 0.2;
            bleedoutprogress = self.bleedout_time / delay;
            if (isdefined(self.var_57b374b4) && !(self.var_c6a6f334 === 1)) {
                objective_setprogress(self.var_57b374b4, bleedoutprogress);
                objective_setgamemodeflags(self.var_57b374b4, 1);
            }
            level clientfield::set("laststand_update" + self getentitynumber(), bleedoutprogress);
            level.var_ff482f76 zm_laststand_client::set_bleedout_progress(self, bleedoutprogress);
        }
        wait(0.2);
    }
    if (is_true(self.var_16735873)) {
        self function_473d2fe1(delay);
    }
    while (isdefined(self.revivetrigger) && (is_true(self.revivetrigger.beingrevived) || is_true(self.var_d1e03242)) || self function_2520e865()) {
        wait(0.1);
    }
    self notify(#"bled_out");
    globallogic_player::function_b2873ebe();
    level notify(#"player_bled_out", {#player:self});
    self callback::callback(#"on_player_bleedout");
    self.var_ea7ea155 = 1;
    util::wait_network_frame();
    self function_4d7504fd();
    self bleed_out();
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0x2ae397dd, Offset: 0x3e38
// Size: 0x1fc
function function_473d2fe1(delay) {
    self endoncallback(&function_4d7504fd, #"player_revived", #"zombified", #"disconnect", #"instakill_player");
    level endoncallback(&function_c499895c, #"end_game", #"round_reset");
    while (self.var_16735873 === 1) {
        wait(0.1);
    }
    if (!level.var_ff482f76 zm_laststand_client::is_open(self)) {
        level.var_ff482f76 zm_laststand_client::open(self, 0);
        level.var_ff482f76 zm_laststand_client::set_num_downs(self, self.n_downs);
        level.var_ff482f76 zm_laststand_client::set_revive_progress(self, 0);
        bleedoutprogress = self.bleedout_time / delay;
        if (isdefined(self.var_57b374b4) && !(self.var_c6a6f334 === 1)) {
            objective_setprogress(self.var_57b374b4, bleedoutprogress);
            objective_setgamemodeflags(self.var_57b374b4, 1);
        }
        level clientfield::set("laststand_update" + self getentitynumber(), bleedoutprogress);
        level.var_ff482f76 zm_laststand_client::set_bleedout_progress(self, bleedoutprogress);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x33f390a2, Offset: 0x4040
// Size: 0x3bc
function bleed_out() {
    self endon(#"disconnect");
    self notify(#"stop_revive_trigger");
    if (isdefined(self.revivetrigger)) {
        self.revivetrigger delete();
        self.revivetrigger = undefined;
    }
    if (isarray(self.var_7341f980)) {
        foreach (talent in self.var_7341f980) {
            if (isdefined(talent)) {
                namespace_791d0451::function_4c1d0e25(talent);
            }
        }
    }
    if (!isdefined(self.var_3b511a7c)) {
        self.var_3b511a7c = 0;
    }
    self.var_3b511a7c++;
    self.var_3b511a7c = math::clamp(self.var_3b511a7c, 0, 9999);
    self namespace_791d0451::function_a173ab53();
    self laststand_enable_player_weapons(1);
    self.laststand = undefined;
    self.var_67ec7eb0 = 1;
    self clientfield::set("zmbLastStand", 0);
    self zm_stats::increment_client_stat("deaths");
    self zm_stats::increment_player_stat("deaths");
    self zm_stats::function_8f10788e("boas_deaths");
    self recordplayerdeathzombies();
    self.last_bleed_out_time = gettime();
    self zm_equipment::take();
    demo::bookmark(#"zm_player_bledout", gettime(), self, undefined, 1);
    potm::bookmark(#"zm_player_bledout", gettime(), self, undefined, 1);
    level notify(#"bleed_out", {#character_index:self.characterindex});
    self undolaststand();
    self clientfield::set("zm_last_stand_postfx", 0);
    zm_player::function_8ef51109(self, 1);
    self.var_ea7ea155 = undefined;
    self suicide();
    clientfield::set_world_uimodel("PlayerList.client" + self.entnum + ".playerIsDowned", 0);
    self.statusicon = "hud_status_dead";
    if (is_true(level.is_zombie_level)) {
        self thread [[ level.player_becomes_zombie ]]();
        return;
    }
    self val::reset(#"laststand", "ignoreme");
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x8e51a3a9, Offset: 0x4408
// Size: 0x8e
function can_suicide() {
    if (!isalive(self)) {
        return false;
    }
    if (!self laststand::player_is_in_laststand()) {
        return false;
    }
    if (!isdefined(self.suicideprompt)) {
        return false;
    }
    if (is_true(self.is_zombie)) {
        return false;
    }
    if (is_true(level.intermission)) {
        return false;
    }
    return true;
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x0
// Checksum 0x7486b51c, Offset: 0x44a0
// Size: 0x3c
function is_suiciding(*revivee) {
    return self usebuttonpressed() && can_suicide();
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0xd278b14a, Offset: 0x44e8
// Size: 0x288
function function_4d3cb10() {
    level notify(#"hash_ec82a2f41cadbea");
    level endon(#"hash_ec82a2f41cadbea");
    var_9156a121 = 0;
    var_972a361b = 0;
    waitframe(1);
    a_e_players = getplayers();
    if (a_e_players.size == 1) {
        var_9156a121 = 1;
        if (!level flag::get("solo_game")) {
            var_972a361b = 1;
            level flag::set("solo_game");
        }
    } else if (level flag::get("solo_game")) {
        var_972a361b = 1;
        level flag::clear("solo_game");
    }
    if (var_972a361b && !zm_utility::is_standard() && !zm_utility::is_trials()) {
        foreach (e_player in a_e_players) {
            if (is_true(e_player.var_240cf7be)) {
                if (var_9156a121) {
                    if (!(e_player function_618fd37e() > 0)) {
                        e_player function_3d685b5f(int(max(0, e_player.var_d66589da - e_player.var_308dc243)));
                    }
                    continue;
                }
                e_player function_3d685b5f(int(max(0, e_player.var_5d4c5daf - e_player.var_308dc243)));
            }
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0x406e463a, Offset: 0x4778
// Size: 0x9c
function function_3d685b5f(self_revive_count) {
    self_revive_count = int(max(self_revive_count, 0));
    self.var_72249004 = self_revive_count;
    self clientfield::set_player_uimodel("ZMInventoryPersonal.self_revive_count", self_revive_count);
    self clientfield::set_world_uimodel("PlayerList.client" + self.entnum + ".self_revives", self.var_72249004);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0xbd81915c, Offset: 0x4820
// Size: 0xa
function function_618fd37e() {
    return self.var_72249004;
}

// Namespace zm_laststand/zm_laststand
// Params 2, eflags: 0x2 linked
// Checksum 0xc434773b, Offset: 0x4838
// Size: 0x9c
function function_3a00302e(n_count = 1, var_d47c52b4 = 1) {
    if (var_d47c52b4) {
        self.var_d66589da += n_count;
        self.var_5d4c5daf += n_count;
    }
    self function_3d685b5f(self function_618fd37e() + n_count);
}

// Namespace zm_laststand/zm_laststand
// Params 2, eflags: 0x2 linked
// Checksum 0x68f60173, Offset: 0x48e0
// Size: 0x84
function function_409dc98e(n_count = 1, b_revived = 1) {
    if (b_revived) {
        self.var_308dc243 += n_count;
    }
    self function_3d685b5f(self function_618fd37e() - n_count);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x8697370, Offset: 0x4970
// Size: 0x24c
function function_b7c101fa() {
    self endon(#"disconnect");
    self.var_72249004 = 0;
    self.var_308dc243 = 0;
    self.var_d66589da = int(zombie_utility::get_zombie_var(#"hash_67ae1b8cbb7c985"));
    self.var_5d4c5daf = int(zombie_utility::get_zombie_var(#"hash_3098c53bba6402d3"));
    level thread function_4d3cb10();
    self waittill(#"spawned");
    if (!zm_utility::is_survival()) {
        level flag::wait_till("start_zombie_round_logic");
    } else if (zm_utility::function_e3025ca5() == 1) {
        while (getplayers().size <= 0) {
            waitframe(1);
        }
        level flag::wait_till(#"intro_scene_done");
    } else {
        return;
    }
    if (getplayers().size == 1) {
        self_revive_count = self.var_d66589da;
        self.var_240cf7be = 1;
    } else {
        self_revive_count = self.var_5d4c5daf;
    }
    var_48f2f554 = zm_custom::function_901b751c(#"zmselfreviveamount");
    if (var_48f2f554) {
        self.var_d66589da = int(var_48f2f554);
        self.var_5d4c5daf = int(var_48f2f554);
        self function_3d685b5f(var_48f2f554);
        return;
    }
    self function_3d685b5f(self_revive_count);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x366417e6, Offset: 0x4bc8
// Size: 0x24
function function_3699b145() {
    self.var_c2bb0cce = 1;
    self thread function_76043ec3();
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0xc1e88e3d, Offset: 0x4bf8
// Size: 0x1d8
function function_76043ec3() {
    self endon(#"disconnect", #"zombified", #"player_revived", #"bled_out", #"tombstone_shadow");
    level endon(#"end_game");
    while (self usebuttonpressed()) {
        wait(1);
    }
    if (!isdefined(self.var_c2bb0cce)) {
        return;
    }
    self.var_c6a6f334 = 0;
    while (true) {
        wait(0.1);
        if (!isdefined(self.var_c2bb0cce)) {
            continue;
        }
        if (!self function_550c4ac4()) {
            continue;
        }
        n_duration = revive_get_revive_time(self);
        self_revive_success = function_73d6c609(n_duration);
        if (self_revive_success) {
            if (isdefined(level.a_revive_success_perk_func)) {
                foreach (func in level.a_revive_success_perk_func) {
                    self [[ func ]]();
                }
            }
            self thread auto_revive(self, 1, 1);
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x1b2174de, Offset: 0x4dd8
// Size: 0x34
function function_550c4ac4() {
    return self usebuttonpressed() && function_30b9cdd5();
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x93af0983, Offset: 0x4e18
// Size: 0xb6
function function_30b9cdd5() {
    if (!isalive(self)) {
        return false;
    }
    if (is_true(self.var_c6a6f334)) {
        return false;
    }
    if (!isdefined(self.var_c2bb0cce)) {
        return false;
    }
    if (is_true(self.is_zombie)) {
        return false;
    }
    if (is_true(level.intermission)) {
        return false;
    }
    if (is_true(self.var_16735873)) {
        return false;
    }
    return true;
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0xb46d9c1b, Offset: 0x4ed8
// Size: 0x15e
function function_73d6c609(n_duration) {
    self endoncallback(&function_a7f11faa, #"player_revived", #"zombified", #"bled_out", #"disconnect");
    level endon(#"end_game");
    var_722c6f25 = 0;
    b_success = 0;
    while (true) {
        while (self function_550c4ac4()) {
            waitframe(1);
            var_722c6f25 += 0.05;
            level.var_ff482f76 zm_laststand_client::set_revive_progress(self, var_722c6f25 / n_duration);
            if (var_722c6f25 >= n_duration) {
                b_success = 1;
                break;
            }
        }
        var_722c6f25 = 0;
        level.var_ff482f76 zm_laststand_client::set_revive_progress(self, var_722c6f25 / n_duration);
        if (is_true(b_success)) {
            return b_success;
        }
        waitframe(1);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0xf30b2396, Offset: 0x5040
// Size: 0x1c
function function_a7f11faa(var_c34665fc) {
    if (var_c34665fc != "disconnect") {
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x28e1e0a, Offset: 0x5068
// Size: 0x184
function revive_trigger_spawn() {
    if (is_true(level.var_28bbd30a)) {
        return;
    }
    radius = getdvarint(#"revive_trigger_radius", 100);
    self.revivetrigger = spawn("trigger_radius", (0, 0, 0), 0, radius, radius);
    self.revivetrigger sethintstring("");
    self.revivetrigger setcursorhint("HINT_NOICON");
    self.revivetrigger setmovingplatformenabled(1);
    self.revivetrigger enablelinkto();
    self.revivetrigger.origin = self.origin;
    self.revivetrigger linkto(self);
    self.revivetrigger setinvisibletoplayer(self);
    self.revivetrigger.beingrevived = 0;
    self.revivetrigger.createtime = gettime();
    self.revivetrigger.radius = radius;
    self thread revive_trigger_think();
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0x54dc0e6f, Offset: 0x51f8
// Size: 0x594
function revive_trigger_think(t_secondary) {
    self endon(#"disconnect", #"zombified", #"stop_revive_trigger", #"death");
    level endon(#"end_game");
    while (true) {
        wait(0.1);
        if (isdefined(t_secondary)) {
            t_revive = t_secondary;
        } else if (isdefined(self.revivetrigger)) {
            if (!isdefined(self.revivetrigger)) {
                break;
            }
            t_revive = self.revivetrigger;
        } else {
            self notify(#"stop_revive_trigger");
            return;
        }
        t_revive sethintstring("");
        t_revive function_268e4500();
        foreach (e_player in getplayers()) {
            n_depth = 0;
            n_depth = self depthinwater();
            if (isdefined(t_secondary)) {
                if (e_player can_revive(self, 1, 1) && e_player istouching(t_revive) || n_depth > 20) {
                    t_revive setrevivehintstring(#"hash_12272c5573321d90", self.team);
                    break;
                }
                continue;
            }
            if (e_player can_revive_via_override(self) || e_player can_revive(self) || n_depth > 20) {
                t_revive setrevivehintstring(#"hash_12272c5573321d90", self.team);
                break;
            }
        }
        foreach (e_reviver in getplayers()) {
            if (!isdefined(e_reviver) || self == e_reviver && !isdefined(self.var_6d772cb) || !e_reviver is_reviving(self, t_secondary)) {
                continue;
            }
            if (!isdefined(self.var_6d772cb) && (!isdefined(e_reviver.s_revive_override_used) || e_reviver.s_revive_override_used.b_use_revive_tool)) {
                if (e_reviver function_94cd8c0f()) {
                    continue;
                }
                e_reviver gestures::function_56e00fbf("gestable_t9_stimshot_last_stand");
                e_reviver disableweaponcycling();
                e_reviver disableoffhandweapons();
                e_reviver disableoffhandspecial();
                e_reviver disableweaponswitchhero();
                e_reviver val::set("laststand_revive", "allow_movement", 0);
                e_reviver thread revive_give_back_weapons_when_done(self);
            }
            b_revive_successful = e_reviver revive_do_revive(self, t_secondary);
            if (isdefined(e_reviver)) {
                e_reviver notify(#"revive_done");
            }
            if (b_revive_successful) {
                if (isdefined(level.a_revive_success_perk_func)) {
                    foreach (func in level.a_revive_success_perk_func) {
                        self [[ func ]]();
                    }
                }
                self thread revive_success(e_reviver);
                self notify(#"stop_revive_trigger");
                return;
            }
            if (isdefined(e_reviver)) {
                e_reviver zm_vo::vo_stop();
            }
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0xa4753199, Offset: 0x5798
// Size: 0x114
function function_8fd9d8b9(e_reviver) {
    self endon(#"death");
    self zm_vo::vo_stop();
    self notify(#"hash_1fe68a6b935c321d", {#reviver:e_reviver});
    if (isplayer(e_reviver) && e_reviver != self && !isdefined(self.var_6d772cb) && !is_true(self.var_54cb40e6)) {
        e_reviver zm_vo::function_d342796e(#"hash_3db45a32611292d9", undefined, undefined, 1, undefined, 20);
        self thread zm_vo::function_d342796e(#"hash_3db46b326112afbc", undefined, undefined, 1, undefined, 20);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 2, eflags: 0x2 linked
// Checksum 0xc8bc5114, Offset: 0x58b8
// Size: 0x8c
function revive_give_back_weapons_wait(e_reviver, e_revivee) {
    e_revivee endon(#"disconnect", #"zombified", #"stop_revive_trigger", #"death");
    level endon(#"end_game");
    e_reviver waittill(#"revive_done");
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0xf5a64513, Offset: 0x5950
// Size: 0x4c
function revive_give_back_weapons_when_done(e_revivee) {
    self endon(#"death");
    revive_give_back_weapons_wait(self, e_revivee);
    self function_92bfddb4();
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0xaf9a3f83, Offset: 0x59a8
// Size: 0x104
function function_92bfddb4() {
    self stopgestureviewmodel(self gestures::function_c77349d4("gestable_t9_stimshot_last_stand"));
    self val::reset("laststand_revive", "allow_movement");
    if (self laststand::player_is_in_laststand()) {
        return;
    }
    self enableoffhandweapons();
    self enableoffhandspecial();
    if (!is_true(self.var_b6840ea0)) {
        self enableweaponswitchhero();
    }
    self enableweaponcycling();
    self weapons::function_d571ac59();
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x4ec1d569, Offset: 0x5ab8
// Size: 0xa6
function function_c3249e8c() {
    assert(isplayer(self));
    players = getplayers(self.team);
    for (index = 0; index < players.size; index++) {
        if (players[index] == self) {
            continue;
        }
        if (self can_revive(players[index])) {
            return true;
        }
    }
    return false;
}

// Namespace zm_laststand/zm_laststand
// Params 3, eflags: 0x2 linked
// Checksum 0x74ee3d08, Offset: 0x5b68
// Size: 0x392
function can_revive(e_revivee, ignore_sight_checks = 0, ignore_touch_checks = 0) {
    if (!isdefined(e_revivee.revivetrigger)) {
        return false;
    }
    if (!isalive(self)) {
        return false;
    }
    if (self laststand::player_is_in_laststand() && self.var_dc4f101 !== e_revivee) {
        return false;
    }
    if (self.team != e_revivee.team) {
        return false;
    }
    if (is_true(self.is_zombie)) {
        return false;
    }
    if (self zm_loadout::has_powerup_weapon()) {
        return false;
    }
    if (!is_true(level.var_3ea7f9f4) && self zm_loadout::has_hero_weapon()) {
        return false;
    }
    if (is_true(level.can_revive_use_depthinwater_test) && e_revivee depthinwater() > 10) {
        return true;
    }
    if (isdefined(level.can_revive) && ![[ level.can_revive ]](e_revivee)) {
        return false;
    }
    if (isdefined(level.var_1461fd14) && ![[ level.var_1461fd14 ]](e_revivee)) {
        return false;
    }
    if (!ignore_sight_checks && isdefined(level.revive_trigger_should_ignore_sight_checks)) {
        ignore_sight_checks = [[ level.revive_trigger_should_ignore_sight_checks ]](self);
        if (ignore_sight_checks && is_true(e_revivee.revivetrigger.beingrevived)) {
            ignore_touch_checks = 1;
        }
    }
    if (!ignore_touch_checks) {
        if (!self istouching(e_revivee.revivetrigger)) {
            return false;
        }
    }
    if (!ignore_sight_checks) {
        if (!self laststand::is_facing(e_revivee)) {
            return false;
        }
        if (!sighttracepassed(self.origin + (0, 0, 50), e_revivee.origin + (0, 0, 30), 0, undefined)) {
            return false;
        }
        if (!bullettracepassed(self.origin + (0, 0, 50), e_revivee.origin + (0, 0, 30), 0, undefined)) {
            return false;
        }
    }
    if (is_true(e_revivee.var_d1e03242)) {
        return false;
    }
    if (isdefined(e_revivee.owner) && (e_revivee.owner function_b4813488() || e_revivee.owner isziplining())) {
        return false;
    }
    return true;
}

// Namespace zm_laststand/zm_laststand
// Params 2, eflags: 0x2 linked
// Checksum 0xa92ad1a0, Offset: 0x5f08
// Size: 0xbc
function is_reviving(e_revivee, t_secondary) {
    if (self is_reviving_via_override(e_revivee)) {
        return true;
    }
    if (isdefined(t_secondary)) {
        return (self usebuttonpressed() && self can_revive(e_revivee, 1, 1) && self istouching(t_secondary));
    }
    return self usebuttonpressed() && can_revive(e_revivee);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x0
// Checksum 0xcf4db1da, Offset: 0x5fd0
// Size: 0x1a
function is_reviving_any() {
    return is_true(self.is_reviving_any);
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0x6cd0c6a1, Offset: 0x5ff8
// Size: 0x76
function revive_get_revive_time(e_revivee) {
    revivetime = 3;
    if (self namespace_e86ffa8::function_8923370c(0)) {
        revivetime *= self function_bd85bc2f();
    }
    if (isdefined(self.get_revive_time)) {
        revivetime = self [[ self.get_revive_time ]](e_revivee);
    }
    return revivetime;
}

// Namespace zm_laststand/zm_laststand
// Params 2, eflags: 0x2 linked
// Checksum 0xf7472198, Offset: 0x6078
// Size: 0x530
function revive_do_revive(e_revivee, t_secondary) {
    assert(self is_reviving(e_revivee, t_secondary));
    revivetime = self revive_get_revive_time(e_revivee);
    if (!isdefined(e_revivee.var_6fc48a11)) {
        e_revivee.var_6fc48a11 = 0;
    }
    revived = 0;
    e_revivee notify(#"player_being_revived");
    e_revivee.revivetrigger.beingrevived = 1;
    if (isplayer(e_revivee)) {
        e_revivee thread laststand::revive_hud_show_n_fade(#"hash_12e2c5e29f8ce6ad", 3, self);
    }
    e_revivee.revivetrigger sethintstring("");
    if (isplayer(e_revivee)) {
        e_revivee startrevive(self, e_revivee.var_6fc48a11 / revivetime);
        e_revivee.var_c6a6f334 = 1;
    }
    self thread laststand_clean_up_on_disconnect(e_revivee);
    if (!isdefined(self.is_reviving_any)) {
        self.is_reviving_any = 0;
    }
    self.is_reviving_any++;
    self thread laststand_clean_up_reviving_any(e_revivee);
    if (!isdefined(self.revive_progress)) {
        self.revive_progress = 0;
    }
    self.revive_progress += 1;
    self thread check_for_failed_revive(e_revivee);
    while (isdefined(self) && self is_reviving(e_revivee, t_secondary)) {
        hud_player = function_800268ed(e_revivee) ? e_revivee.var_1ff8de20 : e_revivee;
        level.var_ff482f76 zm_laststand_client::set_revive_progress(hud_player, e_revivee.var_6fc48a11 / revivetime);
        if (isdefined(hud_player.var_57b374b4)) {
            objective_setprogress(hud_player.var_57b374b4, e_revivee.var_6fc48a11 / revivetime);
            objective_setgamemodeflags(hud_player.var_57b374b4, 0);
        }
        if (is_true(e_revivee.revivetrigger.auto_revive)) {
            break;
        }
        if (e_revivee.var_6fc48a11 >= revivetime) {
            e_revivee.laststand = undefined;
            revived = 1;
            break;
        }
        waitframe(1);
        e_revivee.var_6fc48a11 += float(function_60d95f53()) / 1000;
    }
    if (!is_true(e_revivee.revivetrigger.auto_revive) && !revived) {
        if (isplayer(e_revivee)) {
            e_revivee stoprevive(self);
        }
    }
    if (isdefined(e_revivee.revivetrigger)) {
        e_revivee.revivetrigger sethintstring(#"hash_12272c5573321d90");
        e_revivee.revivetrigger.beingrevived = 0;
    }
    if (isdefined(self)) {
        self notify(#"do_revive_ended_normally");
        if (!isdefined(self.is_reviving_any)) {
            self.is_reviving_any = 0;
        }
        self.is_reviving_any--;
        if (self.is_reviving_any < 0) {
            self.is_reviving_any = 0;
        }
        self.revive_progress = 0;
    }
    e_revivee.var_c6a6f334 = 0;
    if (!revived) {
        e_revivee thread checkforbleedout(self);
        e_revivee thread function_2cc9a315(revivetime);
        e_revivee thread function_7165ead0();
    } else {
        e_revivee.var_6fc48a11 = 0;
        hud_player = function_800268ed(e_revivee) ? e_revivee.var_1ff8de20 : e_revivee;
        level.var_ff482f76 zm_laststand_client::set_revive_progress(hud_player, 0);
    }
    return revived;
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0xce1ef9d5, Offset: 0x65b0
// Size: 0x11e
function function_2cc9a315(revivetime) {
    self endon(#"player_being_revived", #"player_revived", #"disconnect", #"bled_out");
    while (isdefined(self) && !is_true(self.var_c6a6f334) && isdefined(self.var_6fc48a11) && self.var_6fc48a11 >= 0) {
        self.var_6fc48a11 -= 0.05;
        hud_player = function_800268ed(self) ? self.var_1ff8de20 : self;
        level.var_ff482f76 zm_laststand_client::set_revive_progress(hud_player, self.var_6fc48a11 / revivetime);
        waitframe(1);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x2186b2e2, Offset: 0x66d8
// Size: 0x72
function function_7165ead0() {
    self endon(#"player_being_revived", #"player_revived", #"disconnect", #"entitydeleted");
    self waittill(#"bled_out");
    if (isdefined(self.var_6fc48a11)) {
        self.var_6fc48a11 = 0;
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0xbe9a3f7, Offset: 0x6758
// Size: 0x60
function checkforbleedout(player) {
    if (isdefined(player) && zm_utility::is_classic()) {
        if (!isdefined(player.failed_revives)) {
            player.failed_revives = 0;
        }
        player.failed_revives++;
        player notify(#"player_failed_revive");
    }
}

// Namespace zm_laststand/zm_laststand
// Params 6, eflags: 0x2 linked
// Checksum 0x2371ee32, Offset: 0x67c0
// Size: 0x26c
function auto_revive(reviver, b_track_stats = 1, var_c0ab6a65, var_3f8e593d = 0, var_51ac50b4 = 0, var_ab6bd05b = 0) {
    level endon(#"end_game");
    self endoncallback(&function_48ce762a, #"disconnect");
    if (is_true(self.var_b895a3ff)) {
        if (isdefined(level.var_655e32ec)) {
            self [[ level.var_655e32ec ]]();
            return;
        }
    }
    if (!var_ab6bd05b) {
        if (isdefined(self.revivetrigger)) {
            self.revivetrigger.auto_revive = 1;
            if (self.revivetrigger.beingrevived) {
                while (true) {
                    if (!isdefined(self.revivetrigger) || !self.revivetrigger.beingrevived) {
                        break;
                    }
                    util::wait_network_frame();
                }
            }
            if (isdefined(self.revivetrigger)) {
                self.revivetrigger.auto_trigger = 0;
            }
        }
    }
    self notify(#"stop_revive_trigger");
    if (self === reviver) {
        self zm_stats::increment_challenge_stat(#"hash_5f6b0b87e8f76ae1");
        if (is_true(var_c0ab6a65)) {
            self contracts::increment_zm_contract(#"hash_15ceac9a2c2c1a18");
            self stats::function_8fb23f94(#"self_revive", #"uses", 1);
            self.var_9cd2c51d.var_3ca3137f = gettime();
        }
    }
    self thread revive_success(reviver, b_track_stats, var_c0ab6a65, var_3f8e593d, var_51ac50b4);
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0xe926b2fa, Offset: 0x6a38
// Size: 0x34
function function_48ce762a(*param) {
    if (isdefined(self.revivetrigger)) {
        self.revivetrigger delete();
    }
}

// Namespace zm_laststand/zm_laststand
// Params 5, eflags: 0x2 linked
// Checksum 0xb189495a, Offset: 0x6a78
// Size: 0x28c
function revive_success(reviver, b_track_stats = 1, var_c0ab6a65, var_5f465b1 = 0, var_51ac50b4 = 0) {
    level endon(#"end_game");
    if (!isplayer(self)) {
        self notify(#"player_revived", {#reviver:reviver});
        return;
    }
    self thread function_8fd9d8b9(reviver);
    clientfield::set_world_uimodel("PlayerList.client" + self.entnum + ".playerIsDowned", 0);
    if (isplayer(reviver) && is_true(b_track_stats)) {
        reviver xp_revive_once_per_round(self);
        if (!is_true(level.isresetting_grief)) {
            reviver thread check_for_sacrifice();
        }
    }
    if (isplayer(reviver) && (reviver namespace_e86ffa8::function_8923370c(3) || var_5f465b1)) {
        reviver zm_utility::set_max_health();
    }
    self.var_1bee6f4b = undefined;
    self val::reset(#"chopper_gunner", "ignoreme");
    self val::reset(#"chopper_gunner", "takedamage");
    self val::reset(#"remote_missile", "ignoreme");
    self val::reset(#"remote_missile", "takedamage");
    self revive_internal(reviver, b_track_stats, var_c0ab6a65, var_51ac50b4);
}

// Namespace zm_laststand/zm_laststand
// Params 4, eflags: 0x6 linked
// Checksum 0x770c9aff, Offset: 0x6d10
// Size: 0x6fc
function private revive_internal(reviver, b_track_stats, var_c0ab6a65 = 0, var_51ac50b4 = 0) {
    self reviveplayer();
    self zm_utility::set_max_health();
    self clientfield::set("zmbLastStand", 0);
    if (isdefined(self.revivetrigger)) {
        self.revivetrigger delete();
        self.revivetrigger = undefined;
    }
    self clientfield::set("zm_last_stand_postfx", 0);
    self val::set("zm_laststand", "allowdeath", 0);
    self util::delay(2, "death", &val::reset, "zm_laststand", "allowdeath");
    self util::delay(2, "death", &val::reset, "laststand", "ignoreme");
    self.laststand = undefined;
    self.var_d1e03242 = undefined;
    if (var_c0ab6a65) {
        self function_409dc98e();
    }
    self setmovespeedscale(1);
    self allowjump(1);
    if (isplayer(reviver)) {
        reviver notify(#"player_did_a_revive", {#revived_player:self});
        level thread popups::displayteammessagetoteam(#"hash_abc7d6b5c944b2", reviver, reviver.team, undefined, self.entnum);
        if (self !== reviver) {
            if (is_true(reviver.var_b1164fd0)) {
                level scoreevents::doscoreeventcallback("scoreEventZM", {#attacker:reviver, #scoreevent:"aether_shroud_revive_zm"});
                reviver stats::function_622feb0d(#"hash_2d88b4c5217c7e7c", #"hash_13a923231c746585", 1);
                reviver zm_stats::increment_challenge_stat(#"hash_2cbe744ecd9ac482");
            } else {
                level scoreevents::doscoreeventcallback("scoreEventZM", {#attacker:reviver, #scoreevent:"revived_teammate_zm"});
            }
        }
        if (!is_true(level.isresetting_grief) && is_true(b_track_stats) && reviver != self) {
            reviver.revives++;
            reviver zm_stats::increment_client_stat("revives");
            reviver zm_stats::increment_player_stat("revives");
            reviver zm_stats::function_f1a1191d("revives");
            reviver zm_stats::function_3468f864("revives");
            reviver zm_stats::function_7bc347f6("revives");
            reviver zm_stats::function_8f10788e("boas_revives");
            self recordplayerrevivezombies(reviver);
            demo::bookmark(#"zm_player_revived", gettime(), reviver, self);
            potm::bookmark(#"zm_player_revived", gettime(), reviver, self);
        }
    }
    self notify(#"player_revived", {#reviver:reviver, #var_a4916eac:self.var_84280a99});
    s_params = spawnstruct();
    s_params.e_revivee = self;
    s_params.e_reviver = reviver;
    s_params.var_84280a99 = self.var_84280a99;
    self callback::callback(#"on_player_revived", s_params);
    waitframe(1);
    if (isdefined(self)) {
        self thread laststand_enable_player_weapons();
    }
    if (getplayers().size == 1) {
        ais = getactorarray();
        foreach (ai in ais) {
            zm_utility::get_closest_valid_player(ai.origin, undefined, 1);
        }
    }
    if (isplayer(reviver) && reviver != self && reviver namespace_e86ffa8::function_8923370c(4) && !var_51ac50b4) {
        reviver thread namespace_1fd59e39::function_df6782a4(1.5, 5);
        self thread namespace_1fd59e39::function_df6782a4(1.5, 5);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0xef32c9f2, Offset: 0x7418
// Size: 0xd2
function xp_revive_once_per_round(player_being_revived) {
    if (!isdefined(self.number_revives_per_round)) {
        self.number_revives_per_round = [];
    }
    if (!isdefined(self.number_revives_per_round[player_being_revived.characterindex])) {
        self.number_revives_per_round[player_being_revived.characterindex] = 0;
    }
    if (self != player_being_revived && self.number_revives_per_round[player_being_revived.characterindex] == 0) {
        level scoreevents::doscoreeventcallback("scoreEventZM", {#attacker:self, #scoreevent:"revive_an_ally"});
    }
    self.number_revives_per_round[player_being_revived.characterindex]++;
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0x1d7e33c7, Offset: 0x74f8
// Size: 0x8c
function revive_force_revive(reviver) {
    assert(isdefined(self));
    assert(isplayer(self));
    assert(self laststand::player_is_in_laststand());
    self thread revive_success(reviver);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x0
// Checksum 0x7597335b, Offset: 0x7590
// Size: 0x224
function revive_hud_think() {
    level endon(#"last_player_died");
    while (true) {
        wait(0.1);
        if (!laststand::player_any_player_in_laststand()) {
            continue;
        }
        players = getplayers();
        playertorevive = undefined;
        for (i = 0; i < players.size; i++) {
            if (!isdefined(players[i].revivetrigger) || !isdefined(players[i].revivetrigger.createtime)) {
                continue;
            }
            if (!isdefined(playertorevive) || playertorevive.revivetrigger.createtime > players[i].revivetrigger.createtime) {
                playertorevive = players[i];
            }
        }
        if (isdefined(playertorevive)) {
            for (i = 0; i < players.size; i++) {
                if (players[i] laststand::player_is_in_laststand()) {
                    continue;
                }
                if (util::get_game_type() == "vs") {
                    if (players[i].team != playertorevive.team) {
                        continue;
                    }
                }
                if (zm_utility::is_encounter()) {
                    if (players[i].sessionteam != playertorevive.sessionteam) {
                        continue;
                    }
                    if (is_true(level.hide_revive_message)) {
                        continue;
                    }
                }
                players[i] thread laststand::revive_hud_show_n_fade(#"hash_453f3038b87fbc77", 3, playertorevive);
            }
            playertorevive.revivetrigger.createtime = undefined;
            wait(3.5);
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x4a758d0e, Offset: 0x77c0
// Size: 0x9c
function check_for_sacrifice() {
    self endon(#"death", #"sacrifice_denied");
    self util::delay_notify("sacrifice_denied", 1);
    self waittill(#"player_downed");
    self zm_stats::increment_client_stat("sacrifices");
    self zm_stats::increment_player_stat("sacrifices");
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0xa126b7bf, Offset: 0x7868
// Size: 0xec
function check_for_failed_revive(e_revivee) {
    self notify(#"checking_for_failed_revive");
    self endon(#"disconnect", #"checking_for_failed_revive");
    e_revivee endon(#"disconnect", #"player_revived", #"entitydeleted");
    e_revivee waittill(#"bled_out");
    self zm_stats::increment_client_stat("failed_revives");
    self zm_stats::increment_player_stat("failed_revives");
    self zm_stats::function_8f10788e("boas_failed_revives");
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0x8dfa657b, Offset: 0x7960
// Size: 0xc4
function add_weighted_down() {
    if (!level.curr_gametype_affects_rank) {
        return;
    }
    weighted_down = 1000;
    if (level.round_number > 0) {
        weighted_down = int(1000 / ceil(level.round_number / 5));
    }
    if (!level.onlinegame || is_true(level.zm_disable_recording_stats)) {
        return;
    }
    self stats::function_dad108fa(#"weighted_downs", weighted_down);
}

// Namespace zm_laststand/zm_laststand
// Params 3, eflags: 0x2 linked
// Checksum 0xa733e8f5, Offset: 0x7a30
// Size: 0xc8
function register_revive_override(func_is_reviving, func_can_revive = undefined, b_use_revive_tool = 0) {
    if (!isdefined(self.a_s_revive_overrides)) {
        self.a_s_revive_overrides = [];
    }
    s_revive_override = spawnstruct();
    s_revive_override.func_is_reviving = func_is_reviving;
    if (isdefined(func_can_revive)) {
        s_revive_override.func_can_revive = func_can_revive;
    } else {
        s_revive_override.func_can_revive = func_is_reviving;
    }
    s_revive_override.b_use_revive_tool = b_use_revive_tool;
    self.a_s_revive_overrides[self.a_s_revive_overrides.size] = s_revive_override;
    return s_revive_override;
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x0
// Checksum 0xdae8f8eb, Offset: 0x7b00
// Size: 0x3c
function deregister_revive_override(s_revive_override) {
    if (isdefined(self) && isdefined(self.a_s_revive_overrides)) {
        arrayremovevalue(self.a_s_revive_overrides, s_revive_override);
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0x49145ff8, Offset: 0x7b48
// Size: 0x72
function can_revive_via_override(e_revivee) {
    if (isdefined(self) && isdefined(self.a_s_revive_overrides)) {
        for (i = 0; i < self.a_s_revive_overrides.size; i++) {
            if (self [[ self.a_s_revive_overrides[i].func_can_revive ]](e_revivee)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0x75654632, Offset: 0x7bc8
// Size: 0xc4
function is_reviving_via_override(e_revivee) {
    if (isdefined(self) && isdefined(self.a_s_revive_overrides)) {
        if (isdefined(e_revivee.var_84280a99) && e_revivee.var_84280a99 !== self) {
            return false;
        }
        for (i = 0; i < self.a_s_revive_overrides.size; i++) {
            if (self [[ self.a_s_revive_overrides[i].func_is_reviving ]](e_revivee)) {
                self.s_revive_override_used = self.a_s_revive_overrides[i];
                return true;
            }
        }
    }
    if (isdefined(self)) {
        self.s_revive_override_used = undefined;
    }
    return false;
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x0
// Checksum 0xac9ffe6d, Offset: 0x7c98
// Size: 0x84
function instakill_player() {
    self.var_39c78617 = 1;
    self notify(#"instakill_player");
    if (self laststand::player_is_in_laststand()) {
        waitframe(4);
        bleed_out();
        return;
    }
    self dodamage(self.maxhealth + 666, self.origin);
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0xe2d9230d, Offset: 0x7d28
// Size: 0x1c2
function on_ai_killed(s_params) {
    e_player = s_params.eattacker;
    if (isplayer(e_player) && (e_player namespace_791d0451::function_56cedda7(#"hash_504b3df717f88c4e") || is_true(e_player.var_5f465b1)) && e_player laststand::player_is_in_laststand() && !is_true(e_player.var_b895a3ff)) {
        if (is_true(self.var_4f3445ab) || isdefined(e_player.var_bd4dd069) && gettime() - e_player.var_bd4dd069 < 1000) {
            return;
        }
        if (e_player namespace_791d0451::function_56cedda7(#"hash_504b3df717f88c4e")) {
            e_player namespace_791d0451::function_4c1d0e25(#"hash_504b3df717f88c4e");
            e_player playsoundtoplayer(#"hash_35072c2a43dd40ad", e_player);
        }
        e_player zm_stats::increment_challenge_stat(#"hash_57991934859bfc0");
        e_player thread auto_revive(e_player, 1, 0, 1, 0, 1);
        e_player notify(#"stop_revive_trigger");
        e_player.var_5f465b1 = undefined;
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0x732a42ef, Offset: 0x7ef8
// Size: 0x84
function on_item_pickup(s_params) {
    item = s_params.item;
    itementry = item.itementry;
    if (itementry.name === #"self_revive_sr_item") {
        if (self function_618fd37e() < 1) {
            self function_3a00302e(1);
        }
    }
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0xf66b1413, Offset: 0x7f88
// Size: 0x24
function on_player_killed(*s_params) {
    self function_3d685b5f(0);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0xda8821f3, Offset: 0x7fb8
// Size: 0x3e
function function_94cd8c0f() {
    if (self isgestureplaying(self gestures::function_c77349d4("gestable_t9_stimshot_last_stand"))) {
        return true;
    }
    return false;
}

// Namespace zm_laststand/zm_laststand
// Params 1, eflags: 0x2 linked
// Checksum 0x65b49d35, Offset: 0x8000
// Size: 0x22
function function_800268ed(var_4a13f016) {
    return isplayer(var_4a13f016.var_1ff8de20);
}

// Namespace zm_laststand/zm_laststand
// Params 0, eflags: 0x2 linked
// Checksum 0xcd5d3fd4, Offset: 0x8030
// Size: 0x82
function function_2520e865() {
    var_4a13f016 = self.var_dc4f101;
    if (isdefined(var_4a13f016) && isdefined(var_4a13f016.revivetrigger) && (is_true(var_4a13f016.revivetrigger.beingrevived) || is_true(var_4a13f016.var_d1e03242))) {
        return true;
    }
    return false;
}

