// Atian COD Tools GSC CW decompiler test
#using script_770e34dfe9b07f3c;
#using script_1496ada77dc2f2e2;
#using scripts\zm_common\trials\zm_trial_restrict_controls.gsc;
#using script_6951ea86fdae9ae0;
#using scripts\zm_common\trials\zm_trial_double_damage.gsc;
#using scripts\zm_common\trials\zm_trial_activate_hazards.gsc;
#using scripts\zm_common\trials\zm_trial_add_special.gsc;
#using scripts\zm_common\trials\zm_trial_moving_hill.gsc;
#using scripts\zm_common\trials\zm_trial_weapon_rotation.gsc;
#using scripts\zm_common\trials\zm_trial_upgrade_multiple.gsc;
#using scripts\zm_common\trials\zm_trial_repair_boards.gsc;
#using scripts\zm_common\trials\zm_trial_timed_round.gsc;
#using scripts\zm_common\trials\zm_trial_no_sprint.gsc;
#using scripts\zm_common\trials\zm_trial_kill_with_special.gsc;
#using script_e59b4cddfde38fe;
#using scripts\zm_common\trials\zm_trial_no_ads.gsc;
#using script_3688d332e17e9ac1;
#using scripts\zm_common\trials\zm_trial_give_reward.gsc;
#using script_35d3717bf2cbee8f;
#using scripts\zm_common\trials\zm_trial_disable_hud.gsc;
#using scripts\zm_common\trials\zm_trial_reset_loadout.gsc;
#using scripts\zm_common\trials\zm_trial_timeout.gsc;
#using script_698dd790cdc4965f;
#using scripts\zm_common\trials\zm_trial_force_archetypes.gsc;
#using scripts\zm_common\trials\zm_trial_super_sprinters_only.gsc;
#using scripts\zm_common\trials\zm_trial_sprinters_only.gsc;
#using script_760b801e43fe3017;
#using script_68cf49837639e4f1;
#using script_3c5fdcb080338059;
#using script_c65026898539e6d;
#using script_7b843bf90a032750;
#using script_444bc5b4fa0fe14f;
#using scripts\zm_common\trials\zm_trial_no_powerups.gsc;
#using scripts\zm_common\trials\zm_trial_special_enemy.gsc;
#using scripts\zm_common\trials\zm_trial_damage_drains_points.gsc;
#using scripts\zm_common\trials\zm_trial_headshots_only.gsc;
#using scripts\zm_common\trials\zm_trial_open_all_doors.gsc;
#using scripts\zm_common\trials\zm_trial_crawlers_only.gsc;
#using scripts\zm_common\trials\zm_trial_use_pack_a_punch.gsc;
#using scripts\zm_common\trials\zm_trial_disable_perks.gsc;
#using scripts\zm_common\trials\zm_trial_defend_area.gsc;
#using scripts\zm_common\trials\zm_trial_use_magicbox.gsc;
#using scripts\zm_common\trials\zm_trial_disable_buys.gsc;
#using scripts\zm_common\trials\zm_trial_turn_on_power.gsc;
#using scripts\zm_common\trials\zm_trial_acquire_weapon.gsc;
#using scripts\zm_common\trials\zm_trial_acquire_perks.gsc;
#using script_7828033bc0ecda72;
#using script_75f53105a210f2f7;
#using scripts\zm_common\trials\zm_trial_restrict_loadout.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_game_module.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace ztrials;

// Namespace ztrials/gametype_init
// Params 1, eflags: 0x20
// Checksum 0xdb5c5905, Offset: 0x310
// Size: 0x164
function event_handler[gametype_init] main(*eventstruct) {
    zm_gametype::main();
    level.onprecachegametype = &onprecachegametype;
    level.onstartgametype = &onstartgametype;
    level._game_module_custom_spawn_init_func = &zm_gametype::custom_spawn_init_func;
    level._game_module_stat_update_func = &zm_stats::survival_classic_custom_stat_update;
    level._round_start_func = &zm_round_logic::round_start;
    level.var_57cc29f3 = &function_491101ba;
    level.var_d0b54199 = &function_b8839207;
    level.var_9093a47e = &function_b8839207;
    level.round_end_custom_logic = &function_61fd0e87;
    level.round_number = 0;
    level.var_df8480a0 = 0;
    level flag::init(#"ztrial", 1);
    callback::on_connect(&function_8277ff43);
    level._supress_survived_screen = 1;
}

// Namespace ztrials/level_init
// Params 1, eflags: 0x20
// Checksum 0x789c63a2, Offset: 0x480
// Size: 0x164
function event_handler[level_init] levelinit(*eventstruct) {
    var_189d26ca = "";
    /#
        var_189d26ca = getdvarstring(#"ztrial_name");
    #/
    var_3b363b7a = getgametypesetting(#"zmtrialsvariant");
    if (isdefined(var_3b363b7a) && var_3b363b7a > 0) {
        var_189d26ca = util::get_map_name() + "_variant_" + var_3b363b7a;
    } else if (var_189d26ca == "") {
        var_189d26ca = util::get_map_name() + "_default";
    }
    assert(var_189d26ca != "<unknown string>", "<unknown string>");
    level.var_6d87ac05 = zm_trial::function_d02ffd(var_189d26ca);
    assert(isdefined(level.var_6d87ac05), "<unknown string>");
    /#
        function_9a6b2309();
    #/
}

// Namespace ztrials/ztrials
// Params 0, eflags: 0x0
// Checksum 0x2f0cdc76, Offset: 0x5f0
// Size: 0x1c
function onprecachegametype() {
    level.canplayersuicide = &zm_gametype::canplayersuicide;
}

// Namespace ztrials/ztrials
// Params 0, eflags: 0x0
// Checksum 0xffd2b5c8, Offset: 0x618
// Size: 0x1bc
function onstartgametype() {
    zm_behavior::preinit();
    zm_cleanup::preinit();
    zm_spawner::init();
    zm_behavior::postinit();
    zm_cleanup::postinit();
    level.spawnmins = (0, 0, 0);
    level.spawnmaxs = (0, 0, 0);
    structs = struct::get_array("player_respawn_point", "targetname");
    foreach (struct in structs) {
        level.spawnmins = math::expand_mins(level.spawnmins, struct.origin);
        level.spawnmaxs = math::expand_maxs(level.spawnmaxs, struct.origin);
    }
    level.mapcenter = math::find_box_center(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    changeadvertisedstatus(0);
}

// Namespace ztrials/ztrials
// Params 0, eflags: 0x4
// Checksum 0x1e3ae1f2, Offset: 0x7e0
// Size: 0x54
function private function_8277ff43() {
    self endon(#"disconnect");
    level flag::wait_till("start_zombie_round_logic");
    waitframe(1);
    self zm_laststand::function_3d685b5f(0);
}

// Namespace ztrials/ztrials
// Params 1, eflags: 0x4
// Checksum 0xb170dbbf, Offset: 0x840
// Size: 0x2ae
function private function_491101ba(player) {
    if (player hasperk(#"specialty_berserker") && !is_true(player.var_a4630f64)) {
        return true;
    }
    if (level flag::get("round_reset")) {
        return true;
    }
    var_57807cdc = [];
    foreach (player in getplayers()) {
        if (!isdefined(var_57807cdc)) {
            var_57807cdc = [];
        } else if (!isarray(var_57807cdc)) {
            var_57807cdc = array(var_57807cdc);
        }
        if (!isinarray(var_57807cdc, player)) {
            var_57807cdc[var_57807cdc.size] = player;
        }
    }
    if (var_57807cdc.size > 1) {
        zm_trial::fail(#"hash_60e5e8df8709ad64", var_57807cdc);
    } else if (var_57807cdc.size == 1) {
        zm_trial::fail(#"hash_272fae998263208b", var_57807cdc);
    } else {
        if (!isdefined(var_57807cdc)) {
            var_57807cdc = [];
        } else if (!isarray(var_57807cdc)) {
            var_57807cdc = array(var_57807cdc);
        }
        if (!isinarray(var_57807cdc, player)) {
            var_57807cdc[var_57807cdc.size] = player;
        }
        zm_trial::fail(#"hash_272fae998263208b", var_57807cdc);
    }
    if (level flag::get("round_reset")) {
        return true;
    }
    assert(level flag::get(#"trial_failed"));
    return false;
}

// Namespace ztrials/ztrials
// Params 0, eflags: 0x4
// Checksum 0x15db5bcf, Offset: 0xaf8
// Size: 0xf4
function private function_61fd0e87() {
    assert(isdefined(level.var_6d87ac05));
    if (!level flag::get("round_reset") && level.round_number >= level.var_6d87ac05.rounds.size) {
        level thread zm_trial::function_361e2cb0();
    }
    if (!level flag::get("round_reset") && !level flag::get(#"trial_failed")) {
        zm_trial_util::function_96e10d88(1);
        wait(3);
    }
}

// Namespace ztrials/ztrials
// Params 2, eflags: 0x4
// Checksum 0x5129f9eb, Offset: 0xbf8
// Size: 0xee
function private function_b8839207(e_door, n_cost) {
    level flag::wait_till("start_zombie_round_logic");
    e_door notify(#"hash_42c191c31ed08a4");
    e_door endon(#"hash_42c191c31ed08a4", #"death");
    while (true) {
        if (n_cost > 0 && zm_trial_disable_buys::is_active()) {
            e_door sethintstring(#"hash_55d25caf8f7bbb2f");
        } else {
            e_door zm_utility::set_hint_string(self, "default_buy_door", n_cost);
        }
        wait(1);
    }
}

/#

    // Namespace ztrials/ztrials
    // Params 0, eflags: 0x4
    // Checksum 0x3b825ee8, Offset: 0xcf0
    // Size: 0xec
    function private complete_current_round() {
        level.devcheater = 1;
        level.zombie_total = 0;
        level notify(#"kill_round");
        wait(1);
        zombies = getaiteamarray(level.zombie_team);
        if (isdefined(zombies)) {
            for (i = 0; i < zombies.size; i++) {
                if (is_true(zombies[i].ignore_devgui_death)) {
                    continue;
                }
                zombies[i] dodamage(zombies[i].health + 666, zombies[i].origin);
            }
        }
    }

    // Namespace ztrials/ztrials
    // Params 1, eflags: 0x4
    // Checksum 0x112c9a79, Offset: 0xde8
    // Size: 0x188
    function private function_1201b5da(medal) {
        round = undefined;
        switch (medal) {
        case #"gold":
            round = 30;
            break;
        case #"silver":
            round = 20;
            break;
        case #"bronze":
            round = 10;
            break;
        default:
            assert(0);
            break;
        }
        assert(isdefined(round));
        round_info = level.var_6d87ac05.rounds[round - 1];
        assert(isdefined(round_info));
        for (i = 0; i < round_info.challenges.size; i++) {
            challenge = round_info.challenges[i];
            if (challenge.name == #"give_reward") {
                return challenge;
            }
        }
        assert(0);
        return undefined;
    }

    // Namespace ztrials/ztrials
    // Params 0, eflags: 0x4
    // Checksum 0xf3b3dc94, Offset: 0xf78
    // Size: 0x87e
    function private function_9a6b2309() {
        assert(isdefined(level.var_6d87ac05));
        foreach (round_info in level.var_6d87ac05.rounds) {
            adddebugcommand("<unknown string>" + round_info.round + "<unknown string>" + function_9e72a96(round_info.name) + "<unknown string>" + round_info.round + "<unknown string>" + round_info.round + "<unknown string>");
        }
        for (i = 0; i <= 3; i++) {
            adddebugcommand("<unknown string>" + i + "<unknown string>" + i + "<unknown string>");
        }
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        while (true) {
            string = getdvarstring(#"hash_57e97658cd1d89e2", "<unknown string>");
            cmd = strtok(string, "<unknown string>");
            if (cmd.size > 0) {
                round_number = int(cmd[0]);
                if (isdefined(level.var_b9714a5d)) {
                    [[ level.var_b9714a5d ]](round_number);
                }
                level thread zm_game_module::zombie_goto_round(round_number);
                setdvar(#"hash_57e97658cd1d89e2", "<unknown string>");
            }
            string = getdvarstring(#"hash_25a4cfc19b09ae41", "<unknown string>");
            cmd = strtok(string, "<unknown string>");
            if (cmd.size > 0) {
                strikes = int(cmd[0]);
                if (strikes == 3) {
                    zm_trial::function_fe2ecb6(strikes - 1);
                    zm_trial::fail();
                } else {
                    zm_trial::function_fe2ecb6(strikes);
                }
                setdvar(#"hash_25a4cfc19b09ae41", "<unknown string>");
            }
            string = getdvarstring(#"hash_2446ebd1d15f0dab", "<unknown string>");
            cmd = strtok(string, "<unknown string>");
            if (cmd.size > 0) {
                complete_current_round();
                setdvar(#"hash_2446ebd1d15f0dab", "<unknown string>");
            }
            string = getdvarstring(#"hash_5a32209acb1f54a0", "<unknown string>");
            cmd = strtok(string, "<unknown string>");
            if (cmd.size > 0) {
                zm_trial::fail(undefined, getplayers());
                setdvar(#"hash_5a32209acb1f54a0", "<unknown string>");
            }
            string = getdvarstring(#"hash_1576c65ebdf43de0", "<unknown string>");
            cmd = strtok(string, "<unknown string>");
            if (cmd.size > 0) {
                foreach (player in getplayers()) {
                    player zm_stats::function_49469f35("<unknown string>", 0);
                    player zm_stats::function_49469f35("<unknown string>", 0);
                    player zm_stats::function_49469f35("<unknown string>", 0);
                }
                level.var_ee7ca64 = [];
                setdvar(#"hash_1576c65ebdf43de0", "<unknown string>");
            }
            string = getdvarstring(#"hash_2f6ef50454652bf2", "<unknown string>");
            cmd = strtok(string, "<unknown string>");
            if (cmd.size > 0) {
                challenge = function_1201b5da(cmd[0]);
                foreach (player in getplayers()) {
                    player luinotifyevent(#"hash_8d33c3be569f08", 1, challenge.row);
                    stat_name = challenge.params[1];
                    curr_time = gettime();
                    player zm_stats::function_49469f35(stat_name, curr_time);
                }
                setdvar(#"hash_2f6ef50454652bf2", "<unknown string>");
            }
            if (getdvarint(#"hash_145033f5271f2651", 0) == 1) {
                zm_trial_util::function_9c1092f6();
                setdvar(#"hash_145033f5271f2651", 0);
            }
            waitframe(1);
        }
    }

#/
