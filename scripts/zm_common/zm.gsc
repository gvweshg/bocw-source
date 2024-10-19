// Atian COD Tools GSC CW decompiler test
#using script_48f7c4ab73137f8;
#using script_4194df57536e11ed;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm\powerup\zm_powerup_bonus_points_player.gsc;
#using script_190d6b82bcca0908;
#using script_1cd534c7e79b126f;
#using scripts\zm_common\objective_manager.gsc;
#using script_25be5471a9c31833;
#using script_3751b21462a54a7d;
#using script_7a5293d92c61c788;
#using script_7b1cd3908a825fdd;
#using scripts\zm_common\zm_holiday_event.gsc;
#using script_437ce686d29bb81b;
#using scripts\zm_common\zm_trial.gsc;
#using script_3688d332e17e9ac1;
#using scripts\zm_common\trials\zm_trial_headshots_only.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using script_3a88f428c6d8ef90;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_wallbuy.gsc;
#using scripts\zm_common\zm_vote.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_quick_spawning.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_playerzombie.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_placeable_mine.gsc;
#using scripts\zm_common\zm_ping.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_melee_weapon.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_intel.gsc;
#using scripts\zm_common\zm_hud.gsc;
#using scripts\zm_common\zm_game_module.gsc;
#using scripts\zm_common\zm_ffotd.gsc;
#using script_301f64a4090c381a;
#using scripts\zm_common\zm_equipment.gsc;
#using script_62caa307a394c18c;
#using scripts\zm_common\zm_crafting.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_challenges.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_armor.gsc;
#using scripts\zm_common\zm_attachments.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\scoreevents.gsc;
#using script_dc49265d9886946;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\callings\zm_callings.gsc;
#using scripts\zm_common\gametypes\globallogic_scriptmover.gsc;
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using scripts\zm_common\gametypes\globallogic_spawn.gsc;
#using scripts\zm_common\gametypes\zm_gametype.gsc;
#using script_5a525a75a8f1f7e4;
#using scripts\zm_common\bots\zm_bot.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\bb.gsc;
#using script_72401f526ba71638;
#using scripts\killstreaks\zm\sparrow.gsc;
#using scripts\killstreaks\zm\chopper_gunner.gsc;
#using scripts\killstreaks\sparrow.gsc;
#using scripts\killstreaks\zm\ultimate_turret.gsc;
#using scripts\killstreaks\warmachine.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using script_61828ad9e71c6616;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreak_hacking.gsc;
#using script_4721de209091b1a6;
#using scripts\killstreaks\killstreak_detect.gsc;
#using scripts\killstreaks\killstreak_bundles.gsc;
#using script_7bdcff4f92f3d220;
#using script_5f261a5d57de5f7c;
#using scripts\zm\perk\zm_perk_quick_revive.gsc;
#using scripts\zm\perk\zm_perk_juggernaut.gsc;
#using scripts\zm\perk\zm_perk_deadshot.gsc;
#using script_4421226bbc54b398;
#using script_165beea08a63a243;
#using scripts\core_common\item_world.gsc;
#using script_471b31bd963b388e;
#using scripts\core_common\item_inventory.gsc;
#using scripts\zm_common\aats\zm_aat.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using script_41b18a77720c5395;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\ai\zombie_eye_glow.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\globallogic\globallogic_vehicle.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\status_effects\status_effects.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\rat_shared.gsc;
#using scripts\core_common\persistence_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using script_1caf36ff04a85ff6;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\gamestate.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_puppeteer_shared.gsc;
#using script_2c5daa95f8fec03c;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm;

// Namespace zm/zm
// Params 0, eflags: 0x1
// Checksum 0xebf211cb, Offset: 0x1460
// Size: 0x284
function autoexec ignore_systems() {
    system::ignore(#"gadget_clone");
    system::ignore(#"gadget_armor");
    system::ignore(#"gadget_cleanse");
    system::ignore(#"gadget_heat_wave");
    system::ignore(#"gadget_resurrect");
    system::ignore(#"gadget_health_boost");
    system::ignore(#"gadget_shock_field");
    system::ignore(#"gadget_other");
    system::ignore(#"gadget_camo");
    system::ignore(#"gadget_vision_pulse");
    system::ignore(#"gadget_speed_burst");
    system::ignore(#"gadget_overdrive");
    system::ignore(#"gadget_security_breach");
    system::ignore(#"gadget_combat_efficiency");
    system::ignore(#"gadget_sprint_boost");
    system::ignore(#"spike_charge_siegebot");
    system::ignore(#"siegebot");
    system::ignore(#"amws");
    system::ignore(#"influencers_shared");
    system::ignore(#"mute_smoke");
}

// Namespace zm/zm
// Params 0, eflags: 0x5
// Checksum 0x462df5ab, Offset: 0x16f0
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"zm", &preinit, undefined, undefined, undefined);
}

// Namespace zm/zm
// Params 0, eflags: 0x6 linked
// Checksum 0x4319e111, Offset: 0x1738
// Size: 0x204
function private preinit() {
    if (!isdefined(level.zombie_vars)) {
        level.zombie_vars = [];
    }
    level.var_b68902c4 = 1;
    level.bgb_in_use = 0;
    level.growing_hitmarker = 1;
    level.var_7ed465e4 = &function_7ed465e4;
    level.var_a27256f0 = &function_a27256f0;
    level.var_7db94180 = &function_bdf9485e;
    level.var_fd112605 = &function_21e4b1c2;
    level.var_77d7c40d = &zm_utility::function_1a01f2f7;
    level.scr_zm_ui_gametype = util::get_game_type();
    level.scr_zm_ui_gametype_group = "";
    level.scr_zm_map_start_location = "";
    level.var_aaf21bbb = 0;
    level.var_5caadd40 = 0;
    level._use_choke_weapon_hints = 1;
    level._use_choke_blockers = 1;
    level.var_dcf5a517 = 1;
    level.var_74b10e67 = &register_perks;
    level.var_9d1d502c = 1;
    if (!isdefined(level.var_376e688)) {
        level.var_376e688 = 60;
    }
    callback::on_connect(&on_connect);
    clientfield::register_clientuimodel("hudItems.srOverlayOpen", 1, 1, "int");
    level callback::add_callback(#"on_actor_killed", &function_960f8b0e);
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0x3a301c65, Offset: 0x1948
// Size: 0x5c
function function_960f8b0e(*params) {
    self endon(#"death");
    self setforcenocull();
    wait(5);
    if (!isdefined(self)) {
        return;
    }
    self removeforcenocull();
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x3a7a63be, Offset: 0x19b0
// Size: 0x910
function init() {
    if (is_true(level.aat_in_use)) {
        register_vehicle_damage_callback(&aat::aat_vehicle_damage_monitor);
        register_zombie_damage_override_callback(&aat::aat_response);
    }
    setdvar(#"weaponrest_enabled", 0);
    setdvar(#"ui_allowdisplaycontinue", 1);
    if (!isdefined(level.killstreakweapons)) {
        level.killstreakweapons = [];
    }
    level.weaponnone = getweapon(#"none");
    level.weaponnull = getweapon(#"weapon_null");
    level.weaponbasemeleeheld = getweapon(#"bare_hands");
    if (!isdefined(level.weaponriotshield)) {
        level.weaponriotshield = getweapon(#"riotshield");
    }
    level.weaponzmdeaththroe = getweapon(#"death_throe");
    level.weaponzmfists = getweapon(#"hash_46125fd7f3ad4b82");
    level.projectiles_should_ignore_world_pause = 1;
    if (!isdefined(level.player_out_of_playable_area_monitor)) {
        level.player_out_of_playable_area_monitor = 1;
    }
    level.player_too_many_players_check = 1;
    level.player_too_many_players_check_func = &player_too_many_players_check;
    level.speed_change_round = 15;
    if (!isdefined(level.custom_ai_type)) {
        level.custom_ai_type = [];
    }
    level.custom_ai_spawn_check_funcs = [];
    level thread zm_ffotd::main_start();
    level.zombiemode = 1;
    level.revivefeature = 0;
    level.swimmingfeature = 0;
    level.calc_closest_player_using_paths = 0;
    level.zombie_melee_in_water = 1;
    level.put_timed_out_zombies_back_in_queue = 1;
    level.use_alternate_poi_positioning = 1;
    level.zmb_laugh_alias = "zmb_player_outofbounds";
    level.sndannouncerisrich = 1;
    level.curr_gametype_affects_rank = 0;
    gametype = util::get_game_type();
    if ("zclassic" == gametype || "zstandard" == gametype) {
        level.curr_gametype_affects_rank = 1;
    }
    setailimit(40);
    /#
        spawner::add_ai_spawn_function(&function_23ae4c41);
    #/
    level.grenade_multiattack_bookmark_count = 1;
    demo::initactorbookmarkparams(3, 6000, 6000);
    if (!isdefined(level._zombies_round_spawn_failsafe)) {
        level._zombies_round_spawn_failsafe = &zombie_utility::round_spawn_failsafe;
    }
    level.func_get_zombie_spawn_delay = &zm_round_logic::get_zombie_spawn_delay;
    if (!isdefined(level.func_get_delay_between_rounds)) {
        level.func_get_delay_between_rounds = &zm_round_logic::get_delay_between_rounds;
    }
    level.var_3426461d = &function_be95f56d;
    level.var_2f528eb0 = &function_2c96cf0e;
    if (!isdefined(level.no_target_override)) {
        level.no_target_override = &zm_cleanup::no_target_override;
    }
    level.var_d22435d9 = &zm_cleanup::function_d22435d9;
    level.zombie_visionset = "zombie_neutral";
    level.wait_and_revive = 0;
    if (getdvarint(#"anim_intro", 0) == 1) {
        level.zombie_anim_intro = 1;
    } else {
        level.zombie_anim_intro = 0;
    }
    zm_player::precache_models();
    precache_zombie_leaderboards();
    level._zombie_gib_piece_index_all = 0;
    level._zombie_gib_piece_index_right_arm = 1;
    level._zombie_gib_piece_index_left_arm = 2;
    level._zombie_gib_piece_index_right_leg = 3;
    level._zombie_gib_piece_index_left_leg = 4;
    level._zombie_gib_piece_index_head = 5;
    level._zombie_gib_piece_index_guts = 6;
    level._zombie_gib_piece_index_hat = 7;
    if (!isdefined(level.zombie_ai_limit)) {
        level.zombie_ai_limit = 32;
    }
    if (!isdefined(level.zombie_actor_limit)) {
        level.zombie_actor_limit = 31;
    }
    level.var_7c7c6c35 = zm_game_over::register();
    init_flags();
    init_dvars();
    init_strings();
    init_levelvars();
    init_sounds();
    init_shellshocks();
    init_client_field_callback_funcs();
    zm_loadout::register_offhand_weapons_for_level_defaults();
    zm_perks::init();
    zm_powerups::init();
    zm_vote::init();
    level flag::set(#"hash_507a4486c4a79f1d");
    level.zombie_poi_array = getentarray("zombie_poi", "script_noteworthy");
    init_function_overrides();
    level thread zm_laststand::function_5ff83684();
    level thread post_all_players_connected();
    zm_utility::init_utility();
    initializestattracking();
    callback::on_connect(&zm_player::zm_on_player_connect);
    zm_utility::set_demo_intermission_point();
    level thread zm_ffotd::main_end();
    level thread zm_utility::track_players_intersection_tracker();
    level thread zm_utility::function_55295a16();
    level thread onallplayersready();
    level thread zm_round_logic::function_d20309f1();
    callback::on_spawned(&zm_player::zm_on_player_spawned);
    callback::on_disconnect(&on_player_disconnect);
    callback::on_deleted(&on_entity_deleted);
    level thread zm_utility::function_a3648315();
    level.var_f365bb30 = &function_85ea1f60;
    level.var_767a6421 = &function_d2e09320;
    level.var_fe1dd361 = &function_fe1dd361;
    level.var_b059ce9e = &function_b059ce9e;
    level.var_8822a6d5 = &function_8822a6d5;
    level.var_ce82b9ae = &function_ce82b9ae;
    level.var_d539e0dd = &function_85ea1f60;
    /#
    #/
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x8fcb6e13, Offset: 0x22c8
// Size: 0x254
function function_bdf9485e() {
    var_34451a50 = self.pers[#"hash_4a01db5796cf12b1"] === #"failure";
    if (var_34451a50) {
        var_c069e1cd = self.pers[#"hash_3b7fc8c62a7d4420"] * level.var_df437ed2;
        self.var_c069e1cd = var_c069e1cd;
        if (!self ishost()) {
            var_66a3da0e = 0;
            if (zm_utility::is_survival()) {
                var_66a3da0e = zm_utility::function_e3025ca5() > 1;
            } else {
                var_66a3da0e = zm_utility::get_round_number() > 5;
            }
            var_dccfc12 = var_66a3da0e ? level.var_a3354733 : level.var_87e0e72d;
            warning_time = getdvar(#"warningtime", 30);
            if (var_c069e1cd >= var_dccfc12 - warning_time) {
                if (!self.pers[#"controllerparticipationinactivitywarnings"]) {
                    self.pers[#"controllerparticipationinactivitywarnings"]++;
                    self iprintlnbold(#"hash_59bd89e170a924ac");
                }
            }
            if (var_c069e1cd >= var_dccfc12) {
                self.pers[#"controllerparticipationendgameresult"] = -2;
                if (isdefined(level.gamehistoryplayerkicked)) {
                    self thread [[ level.gamehistoryplayerkicked ]]();
                }
                kick(self getentitynumber(), "GAME/DROPPEDFORINACTIVITY");
            }
        }
    } else {
        self function_f986fb53();
    }
    /#
        self thread function_b0613540();
    #/
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x22417fb3, Offset: 0x2528
// Size: 0x15c
function function_21e4b1c2() {
    if (getdvarint(#"hash_5ba7cd097f9ffc14", 1) <= 0) {
        return true;
    }
    if (is_true(self.laststand)) {
        return true;
    }
    if (!level flag::get(#"intro_scene_done")) {
        return true;
    }
    if (self scene::is_igc_active()) {
        return true;
    }
    if (isdefined(self.var_11eebcd3)) {
        var_57e7a401 = float(gettime() - self.var_11eebcd3) / 1000;
        if (var_57e7a401 < level.var_df437ed2) {
            if (isdefined(self.var_97a988e7) && namespace_1b527536::function_841bae20(self.var_97a988e7.statname) === #"hash_5d6f444e983b62ca") {
                return false;
            }
            self function_f986fb53();
            return true;
        }
    }
    return false;
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x448d888a, Offset: 0x2690
// Size: 0x54
function function_f986fb53() {
    self.var_c069e1cd = 0;
    if (self.pers[#"hash_4a01db5796cf12b1"] === #"failure") {
        self.pers[#"hash_3b7fc8c62a7d4420"] = 0;
    }
}

/#

    // Namespace zm/zm
    // Params 0, eflags: 0x0
    // Checksum 0x12d22753, Offset: 0x26f0
    // Size: 0x316
    function function_b0613540() {
        self endon(#"death");
        var_17b7891d = "playerzombie_usebutton_sound" + "drop_metal_bar";
        self notify(var_17b7891d);
        self endon(var_17b7891d);
        var_655d056a = undefined;
        while (true) {
            if (!isdefined(self)) {
                return;
            }
            if (getdvarint(#"hash_174ecf3dea3f9d9c", 0) > 0) {
                if (self ishost() && var_655d056a !== self.var_c069e1cd) {
                    var_655d056a = self.var_c069e1cd;
                    self iprintlnbold("zmb_music_box" + self.var_c069e1cd);
                }
                text_pos = (50, 200, 0);
                var_609025d8 = (0, 30, 0);
                var_6fbe10c9 = self getentitynumber();
                text = "dog_round" + var_6fbe10c9 + "zombie_riser_fx_lowg" + (isdefined(self.var_c069e1cd) ? self.var_c069e1cd : 0);
                debug2dtext(text_pos + var_609025d8 * var_6fbe10c9, text, zm_utility::function_1a01f2f7(self) ? (1, 0, 0) : (0, 1, 0), 1, (0, 0, 0), 1);
                if (var_655d056a !== self.var_c069e1cd) {
                    println(text);
                }
                sphere_pos = self getplayercamerapos() + anglestoforward(self getplayerangles()) * 50 + (0, 0, 15) + anglestoright(self getplayerangles()) * 25;
                sphere(sphere_pos, 3, zm_utility::function_1a01f2f7(self) ? (1, 0, 0) : (0, 1, 0), 1, 0, 10, 1);
                debugstar(sphere_pos, 1, zm_utility::function_1a01f2f7(self) ? (1, 0, 0) : (0, 1, 0));
            }
            waitframe(1);
        }
    }

#/

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0x8eac2bef, Offset: 0x2a10
// Size: 0x24
function function_a27256f0(killstreaktype) {
    self function_d5766919(killstreaktype);
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0x19ebaf1c, Offset: 0x2a40
// Size: 0xec
function function_d5766919(killstreaktype) {
    if (isplayer(self)) {
        var_16f12c31 = item_world_util::function_3531b9ba(killstreaktype);
        if (!isdefined(var_16f12c31)) {
            return;
        }
        var_1120bf0 = self.inventory.items[17];
        if (var_1120bf0.networkid != 32767) {
            self item_inventory::drop_inventory_item(var_1120bf0.networkid);
        }
        itempoint = function_4ba8fde(var_16f12c31);
        if (isdefined(itempoint)) {
            item_world::function_de2018e3(itempoint, self, 17);
        }
    }
}

/#

    // Namespace zm/zm
    // Params 1, eflags: 0x0
    // Checksum 0xfd59a63a, Offset: 0x2b38
    // Size: 0x7c
    function function_23ae4c41(*params) {
        assert(getaicount() <= getailimit(), "MOD_MELEE" + getaicount() + "quadkill" + getailimit());
    }

#/

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x11affa59, Offset: 0x2bc0
// Size: 0x54
function on_connect() {
    self.var_b6577248 = zm_utility::get_round_number();
    if (is_true(self.is_hotjoining)) {
        item_world::function_4c0953c4(level.item_spawn_seed);
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xfac6166b, Offset: 0x2c20
// Size: 0x1c
function on_player_disconnect() {
    zm_stats::function_ea5b4947(0);
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x73939521, Offset: 0x2c48
// Size: 0x16
function on_entity_deleted() {
    self notify(#"deleted");
}

// Namespace zm/zm
// Params 0, eflags: 0x0
// Checksum 0xb75f336a, Offset: 0x2c68
// Size: 0x1c
function post_main() {
    level thread init_custom_ai_type();
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0x8e224d49, Offset: 0x2c90
// Size: 0x5e
function cheat_enabled(val) {
    if (getdvarint(#"zombie_cheat", 0) >= val) {
        /#
            return true;
        #/
        if (isprofilebuild()) {
            return true;
        }
    }
    return false;
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0xffb69293, Offset: 0x2cf8
// Size: 0x14c
function fade_out_intro_screen_zm(hold_black_time = 0.2) {
    if (isdefined(level.var_fdba6f4b)) {
        [[ level.var_fdba6f4b ]]();
    } else {
        wait(hold_black_time);
    }
    level flag::set("initial_blackscreen_passed");
    level clientfield::set("sndZMBFadeIn", 1);
    wait(level.var_ab367500);
    if (is_true(level.var_3dfa8db4)) {
        level flag::wait_till("intro_scene_done");
    } else if (isdefined(level.var_3a382f82)) {
        wait(level.var_3a382f82);
    } else {
        wait(1.6);
    }
    level flag::set("gameplay_started");
    level clientfield::set("gameplay_started", 1);
    setmatchflag("disableIngameMenu", 0);
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x3871d79d, Offset: 0x2e50
// Size: 0x564
function onallplayersready() {
    level endon(#"game_ended");
    changeadvertisedstatus(0);
    gametype = hash(util::get_game_type());
    if (gametype == #"zclassic") {
        changeadvertisedstatus(1);
    }
    if (zm_utility::is_survival() && !namespace_cf6efd05::function_85b812c9()) {
        changeadvertisedstatus(1);
    } else if (zm_utility::is_survival() && zm_utility::function_e3025ca5() <= 3) {
        changeadvertisedstatus(0, 1);
    }
    while (!getnumexpectedplayers(1)) {
        waitframe(1);
    }
    println("killingBlow" + getnumexpectedplayers(1));
    player_count_actual = 0;
    while (player_count_actual < getnumexpectedplayers(1)) {
        players = getplayers();
        player_count_actual = 0;
        for (i = 0; i < players.size; i++) {
            if (players[i].sessionstate == "playing" && !isbot(players[i])) {
                player_count_actual++;
            }
        }
        println("LB_ZM_GB_PERKS_DRANK_AT " + getnumconnectedplayers() + "<unknown string>" + getnumexpectedplayers(1));
        waitframe(1);
    }
    setinitialplayersconnected();
    println("<unknown string>");
    a_e_players = getplayers();
    if (a_e_players.size == 1) {
        level flag::set("solo_game");
        level.solo_lives_given = 0;
    }
    level flag::set("all_players_connected");
    while (!aretexturesloaded()) {
        waitframe(1);
    }
    level util::streamer_wait(undefined, 2, 15);
    var_1b933759 = 5;
    n_start_delay = 3;
    var_902bdd11 = 2;
    if (is_true(level.var_4ea2c79a)) {
        thread globallogic::matchstarttimer(var_1b933759 + n_start_delay + var_902bdd11);
    }
    wait(var_1b933759);
    function_5fad41b5();
    level thread util::delay(n_start_delay, "game_ended", &flag::set, "start_zombie_round_logic");
    level thread function_d797f41f(n_start_delay - 0.1);
    set_intermission_point();
    n_black_screen = n_start_delay + var_902bdd11;
    level thread fade_out_intro_screen_zm(n_black_screen);
    wait(n_black_screen);
    level.n_gameplay_start_time = gettime();
    clientfield::set("game_start_time", level.n_gameplay_start_time);
    var_85b812c9 = undefined;
    var_85b812c9 = namespace_cf6efd05::function_85b812c9();
    level flag::set("initial_fade_in_complete");
    /#
        rat::function_7d22c1c9();
    #/
    wait(n_start_delay);
    luinotifyevent(#"hash_3aef0da8363893b6");
    if (!is_true(var_85b812c9)) {
        level thread function_3dbf3e8e();
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x6 linked
// Checksum 0xb36a8949, Offset: 0x33c0
// Size: 0x280
function private function_3dbf3e8e() {
    level endon(#"end_game");
    if (!is_true(getgametypesetting(#"hash_70ed9f3754351408"))) {
        return;
    }
    if (sessionmodeisprivate()) {
        return;
    }
    var_6aeffaf2 = undefined;
    while (true) {
        var_17be922c = 1;
        fresh = 1;
        var_9084754 = getgametypesetting(#"hash_3afb9ec2416f3b78");
        if (!isdefined(var_9084754)) {
            var_9084754 = 0;
        }
        if (isdefined(level.round_number)) {
            if (level.round_number > var_9084754) {
                fresh = 0;
            }
            var_466778ca = getgametypesetting(#"hash_4e802ac0cfc8e1ba");
            if (!isdefined(var_466778ca)) {
                var_466778ca = 0;
            }
            if (level.round_number >= var_466778ca) {
                changeadvertisedstatus(0);
                return;
            }
        }
        if (fresh) {
            var_17be922c = 1;
        } else {
            players = getplayers();
            alive_players = function_a1ef346b();
            var_40ccb153 = getgametypesetting(#"hash_6996c421425cbae9");
            var_8a7a698 = getgametypesetting(#"hash_164754ccf007dbb4");
            if (!isdefined(var_40ccb153)) {
                var_40ccb153 = 0;
            }
            if (!isdefined(var_8a7a698)) {
                var_8a7a698 = 0;
            }
            if (players.size >= var_40ccb153 && alive_players.size >= var_8a7a698) {
                var_17be922c = 1;
            } else {
                var_17be922c = 0;
            }
        }
        if (var_17be922c !== var_6aeffaf2) {
            changeadvertisedstatus(var_17be922c);
            var_6aeffaf2 = var_17be922c;
        }
        wait(0.5);
    }
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0x9506fb88, Offset: 0x3648
// Size: 0x22
function function_d797f41f(n_waittime = 1) {
    wait(n_waittime);
}

// Namespace zm/zm
// Params 1, eflags: 0x0
// Checksum 0x62cdc3e9, Offset: 0x3678
// Size: 0xa8
function _outro_slow(func) {
    level endon(#"all_players_connected", #"game_ended");
    array::thread_all(getplayers(), func);
    while (true) {
        result = level waittill(#"connected");
        result.player thread [[ func ]]();
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xe7e224a1, Offset: 0x3728
// Size: 0x3a4
function initialblack() {
    self endon(#"disconnect");
    gametype = hash(util::get_game_type());
    if (gametype != #"zsurvival" && level flag::get("start_zombie_round_logic")) {
        return;
    }
    if (!is_true(self.hasspawned)) {
        self waittill(#"spawned");
    }
    do {
        waitframe(1);
    } while (!self isclientuivisibilityflagset("hud_visible"));
    val::set(#"initial_black", "hide");
    val::set(#"initial_black", "takedamage", 0);
    val::set(#"initial_black", "ignoreme");
    val::set(#"initial_black", "freezecontrols");
    val::set(#"initial_black", "disablegadgets");
    val::set(#"initial_black", "show_hud", 0);
    level flag::wait_till("initial_blackscreen_passed");
    util::wait_network_frame(2);
    val::reset(#"initial_black", "hide");
    val::reset(#"initial_black", "takedamage");
    util::wait_network_frame(2);
    val::reset(#"initial_black", "freezecontrols");
    if (zm_utility::function_c200446c()) {
        self util::delay(1, "disconnect", &clientfield::set_player_uimodel, "closeLoadingMovie", 1);
    } else {
        self clientfield::set_player_uimodel("closeLoadingMovie", 1);
    }
    level flag::wait_till("gameplay_started");
    val::reset(#"initial_black", "ignoreme");
    val::reset(#"initial_black", "disablegadgets");
    val::reset(#"initial_black", "show_hud");
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x7e3b164c, Offset: 0x3ad8
// Size: 0xf0
function delete_in_createfx() {
    exterior_goals = struct::get_array("exterior_goal", "targetname");
    for (i = 0; i < exterior_goals.size; i++) {
        if (!isdefined(exterior_goals[i].target)) {
            continue;
        }
        targets = getentarray(exterior_goals[i].target, "targetname");
        for (j = 0; j < targets.size; j++) {
            targets[j] zm_utility::self_delete();
        }
    }
    if (isdefined(level.level_createfx_callback_thread)) {
        level thread [[ level.level_createfx_callback_thread ]]();
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xf7287aa9, Offset: 0x3bd0
// Size: 0x228
function post_all_players_connected() {
    level thread end_game();
    level flag::wait_till("start_zombie_round_logic");
    level.var_aaf21bbb = level.players.size;
    level.var_5caadd40 = function_58385b58(#"allies").size;
    setteamspyplane(#"allies", 1);
    println("<unknown string>", level.script, "<unknown string>", getplayers().size);
    level thread round_end_monitor();
    if (!level.zombie_anim_intro) {
        if (isdefined(level._round_start_func)) {
            level thread [[ level._round_start_func ]]();
        }
    }
    level thread players_playing();
    level.startinvulnerabletime = getdvarint(#"player_deathinvulnerabletime", 0);
    level thread zm_stats::function_b14863c1();
    /#
        players = getplayers();
        foreach (player in players) {
            player thread function_b0613540();
        }
    #/
}

// Namespace zm/zm
// Params 0, eflags: 0x0
// Checksum 0xc831008c, Offset: 0x3e00
// Size: 0x1c
function start_zm_dash_counter_watchers() {
    level thread first_consumables_used_watcher();
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xf47d0055, Offset: 0x3e28
// Size: 0x24
function first_consumables_used_watcher() {
    level flag::init("first_consumables_used");
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x9600b624, Offset: 0x3e58
// Size: 0x52
function init_custom_ai_type() {
    if (isdefined(level.custom_ai_type)) {
        for (i = 0; i < level.custom_ai_type.size; i++) {
            [[ level.custom_ai_type[i] ]]();
        }
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x0
// Checksum 0xb6528681, Offset: 0x3eb8
// Size: 0x74
function zombiemode_melee_miss() {
    if (isdefined(self.enemy.var_e764ac36)) {
        self.enemy dodamage(getdvarint(#"ai_meleedamage", 0), self.origin, self, self, "none", "melee");
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xdd5af29e, Offset: 0x3f38
// Size: 0x14
function init_shellshocks() {
    level.player_killed_shellshock = "zombie_death";
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x4e16c5e8, Offset: 0x3f58
// Size: 0x144
function init_strings() {
    zm_utility::add_zombie_hint("undefined", #"zombie/undefined");
    zm_utility::add_zombie_hint("default_treasure_chest", #"hash_40a3bd4c33eac8cc");
    zm_utility::add_zombie_hint("default_buy_barrier_piece_10", #"hash_1c189b8ad7ec73a1");
    zm_utility::add_zombie_hint("default_buy_barrier_piece_20", #"hash_1c1c218ad7ef8d2a");
    zm_utility::add_zombie_hint("default_buy_barrier_piece_50", #"hash_1c26138ad7f7c9e5");
    zm_utility::add_zombie_hint("default_buy_barrier_piece_100", #"hash_2a43ddece6c85f63");
    zm_utility::add_zombie_hint("default_reward_barrier_piece", #"hash_6a8e67597b680da2");
    zm_utility::add_zombie_hint("default_buy_area", #"hash_cc45440fbd070dc");
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x17a79042, Offset: 0x40a8
// Size: 0x3e4
function init_sounds() {
    zm_utility::add_sound("end_of_round", "mus_zmb_round_over");
    zm_utility::add_sound("end_of_game", "mus_zmb_game_over");
    zm_utility::add_sound("chalk_one_up", "mus_zmb_chalk");
    zm_utility::add_sound("purchase", "zmb_cha_ching");
    zm_utility::add_sound("no_purchase", "zmb_no_cha_ching");
    zm_utility::add_sound("playerzombie_usebutton_sound", "zmb_zombie_vocals_attack");
    zm_utility::add_sound("playerzombie_attackbutton_sound", "zmb_zombie_vocals_attack");
    zm_utility::add_sound("playerzombie_adsbutton_sound", "zmb_zombie_vocals_attack");
    zm_utility::add_sound("zombie_head_gib", "zmb_zombie_head_gib");
    zm_utility::add_sound("rebuild_barrier_piece", "zmb_repair_boards");
    zm_utility::add_sound("rebuild_barrier_metal_piece", "zmb_metal_repair");
    zm_utility::add_sound("rebuild_barrier_hover", "zmb_boards_float");
    zm_utility::add_sound("debris_hover_loop", "zmb_couch_loop");
    zm_utility::add_sound("break_barrier_piece", "zmb_break_boards");
    zm_utility::add_sound("grab_metal_bar", "zmb_bar_pull");
    zm_utility::add_sound("break_metal_bar", "zmb_bar_break");
    zm_utility::add_sound("drop_metal_bar", "zmb_bar_drop");
    zm_utility::add_sound("blocker_end_move", "zmb_board_slam");
    zm_utility::add_sound("barrier_rebuild_slam", "zmb_board_slam");
    zm_utility::add_sound("bar_rebuild_slam", "zmb_bar_repair");
    zm_utility::add_sound("zmb_rock_fix", "zmb_break_rock_barrier_fix");
    zm_utility::add_sound("zmb_vent_fix", "evt_vent_slat_repair");
    zm_utility::add_sound("zmb_barrier_debris_move", "zmb_barrier_debris_move");
    zm_utility::add_sound("door_slide_open", "zmb_door_slide_open");
    zm_utility::add_sound("door_rotate_open", "zmb_door_slide_open");
    zm_utility::add_sound("debris_move", "zmb_weap_wall");
    zm_utility::add_sound("open_chest", "zmb_lid_open");
    zm_utility::add_sound("music_chest", "zmb_music_box");
    zm_utility::add_sound("close_chest", "zmb_lid_close");
    zm_utility::add_sound("weapon_show", "zmb_weap_wall");
    zm_utility::add_sound("break_stone", "evt_break_stone");
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x51320c0a, Offset: 0x4498
// Size: 0x9cc
function init_levelvars() {
    level.is_zombie_level = 1;
    level.default_laststandpistol = getweapon(#"pistol_semiauto_t9");
    level.default_solo_laststandpistol = getweapon(#"pistol_semiauto_t9_upgraded");
    level.super_ee_weapon = getweapon(#"pistol_burst_t9");
    level.laststandpistol = level.default_laststandpistol;
    level.start_weapon = level.default_laststandpistol;
    level.first_round = 1;
    level.start_round = 1;
    /#
        level.start_round = getgametypesetting(#"startround");
    #/
    level.round_number = level.start_round;
    level.enable_magic = getgametypesetting(#"magic");
    level.headshots_only = getgametypesetting(#"zmheadshotsonly");
    level.player_starting_points = function_b10f6843();
    level.round_start_time = 0;
    level.pro_tips_start_time = 0;
    level.intermission = 0;
    level.dog_intermission = 0;
    level.zombie_total = 0;
    level.zombie_respawns = 0;
    level.var_9427911d = 0;
    level.total_zombies_killed = 0;
    level.zm_loc_types = [];
    level.zm_loc_types[#"zombie_location"] = [];
    level.var_9b91564e = 8;
    level.zm_variant_type_max = [];
    level.zm_variant_type_max[#"walk"] = [];
    level.zm_variant_type_max[#"run"] = [];
    level.zm_variant_type_max[#"sprint"] = [];
    level.zm_variant_type_max[#"super_sprint"] = [];
    level.zm_variant_type_max[#"walk"][#"down"] = 14;
    level.zm_variant_type_max[#"walk"][#"up"] = 16;
    level.zm_variant_type_max[#"run"][#"down"] = 13;
    level.zm_variant_type_max[#"run"][#"up"] = 12;
    level.zm_variant_type_max[#"sprint"][#"down"] = 9;
    level.zm_variant_type_max[#"sprint"][#"up"] = 8;
    level.zm_variant_type_max[#"super_sprint"][#"down"] = 1;
    level.zm_variant_type_max[#"super_sprint"][#"up"] = 1;
    level.zm_variant_type_max[#"burned"][#"down"] = 1;
    level.zm_variant_type_max[#"burned"][#"up"] = 1;
    level.zm_variant_type_max[#"jump_pad_super_sprint"][#"down"] = 1;
    level.zm_variant_type_max[#"jump_pad_super_sprint"][#"up"] = 1;
    level.var_d9ffddf4 = [];
    level.var_d9ffddf4[#"walk"] = 4;
    level.var_d9ffddf4[#"run"] = 4;
    level.var_d9ffddf4[#"sprint"] = 4;
    level.var_d9ffddf4[#"super_sprint"] = 4;
    level.var_d9ffddf4[#"crawl"] = 3;
    level.current_zombie_array = [];
    level.current_zombie_count = 0;
    level.zombie_total_subtract = 0;
    level.destructible_callbacks = [];
    foreach (team, _ in level.teams) {
        if (!isdefined(level.zombie_vars[team])) {
            level.zombie_vars[team] = [];
        }
    }
    if (!isdefined(level.var_aed5d327)) {
        level.var_aed5d327 = [];
    }
    level.gamedifficulty = getgametypesetting(#"zmdifficulty");
    level.var_ab367500 = 1.5;
    zmsettings = zm_utility::function_10e38d86();
    zombie_utility::set_zombie_var(#"below_world_check", zmsettings.var_c9ca5291, 0);
    zombie_utility::set_zombie_var(#"spectators_respawn", zmsettings.var_629f7daa, 0);
    zombie_utility::set_zombie_var(#"zombie_use_failsafe", zmsettings.var_388eb2fd, 0);
    zombie_utility::set_zombie_var(#"zombie_between_round_time", zmsettings.var_7c95cc24, 0);
    zombie_utility::set_zombie_var(#"zombie_intermission_time", zmsettings.var_54e1d605, 0);
    zombie_utility::set_zombie_var(#"hash_6bae95928bbe8f1", zmsettings.var_db686493, 0);
    zombie_utility::set_zombie_var(#"zombie_score_kill", zmsettings.var_e1b7f6c8, 0);
    zombie_utility::set_zombie_var(#"zombie_score_bonus_melee", zmsettings.var_23244f59, 0);
    zombie_utility::set_zombie_var(#"zombie_score_bonus_head", zmsettings.var_4a0240f3, 0);
    zombie_utility::set_zombie_var(#"hash_68aa9b4c8de33261", zmsettings.var_86036d4, 0);
    zombie_utility::set_zombie_var(#"zombify_player", zmsettings.var_d996cae, 0);
    zombie_utility::set_zombie_var(#"hash_6ba259e60f87bb15", zmsettings.var_b39946c5, []);
    if (issplitscreen()) {
        zombie_utility::set_zombie_var(#"zombie_timer_offset", zmsettings.var_37d2cb01, 0);
    }
    function_1442d44f();
    level thread init_player_levelvars();
    level.speed_change_max = 0;
    level.speed_change_num = 0;
    zm_round_logic::set_round_number(level.round_number);
    zm_score::function_e5d6e6dd(#"zombie", zombie_utility::get_zombie_var(#"zombie_score_kill"));
    level.missileremotelaunchtargetdist = 0;
    setdvar(#"hash_6e8eff11c6fb1621", 1);
}

// Namespace zm/zm
// Params 0, eflags: 0x6 linked
// Checksum 0x3ee71436, Offset: 0x4e70
// Size: 0x7e
function private function_b10f6843() {
    n_starting = zm_utility::is_survival() ? 1000 : (level.round_number - zm_custom::function_901b751c(#"startround") + 1) * 500;
    return isdefined(level.player_starting_points) ? level.player_starting_points : n_starting;
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xe32ef772, Offset: 0x4ef8
// Size: 0x88c
function function_1442d44f() {
    zmsettings = zm_utility::function_10e38d86();
    zombie_utility::set_zombie_var(#"zombie_health_start", zmsettings.difficultysettings[level.gamedifficulty].var_d2a37ad0, 0);
    zombie_utility::set_zombie_var(#"zombie_health_increase", zmsettings.difficultysettings[level.gamedifficulty].var_2defce07, 0);
    zombie_utility::set_zombie_var(#"zombie_health_increase_multiplier", zmsettings.difficultysettings[level.gamedifficulty].var_68f07704, 0);
    zombie_utility::set_zombie_var(#"hash_7d5a25e2463f7fc5", zmsettings.difficultysettings[level.gamedifficulty].var_75236df1, 0);
    zombie_utility::set_zombie_var(#"zombie_new_runner_interval", zmsettings.difficultysettings[level.gamedifficulty].var_8cb6013d, 0);
    zombie_utility::set_zombie_var(#"zombie_max_ai", zmsettings.difficultysettings[level.gamedifficulty].var_e134c623, 0);
    zombie_utility::set_zombie_var(#"zombie_ai_per_player", zmsettings.difficultysettings[level.gamedifficulty].var_8c9f998a);
    zombie_utility::set_zombie_var(#"zombie_move_speed_multiplier", zmsettings.difficultysettings[level.gamedifficulty].var_ecafcfe9);
    zombie_utility::set_zombie_var(#"hash_607bc50072c2a386", zmsettings.difficultysettings[level.gamedifficulty].var_9e2df5e5, 0);
    zombie_utility::set_zombie_var(#"hash_67b3cbf79292e047", zmsettings.difficultysettings[level.gamedifficulty].var_24d886f5, 0);
    zombie_utility::set_zombie_var(#"hash_115c28dc9ed1e60e", 0.84, 0);
    zombie_utility::set_zombie_var(#"hash_3a53015873fb9c74", 0.6, 0);
    zombie_utility::set_zombie_var(#"hash_4127e6c9e8fdd112", 29, 0);
    zombie_utility::set_zombie_var(#"hash_40be0852fb086eb0", 20, 0);
    zombie_utility::set_zombie_var(#"player_base_health", zmsettings.difficultysettings[level.gamedifficulty].var_edc0d364, 0);
    zombie_utility::set_zombie_var(#"player_health_regen_rate", zmsettings.difficultysettings[level.gamedifficulty].var_d3001509, 0);
    zombie_utility::set_zombie_var(#"player_health_regen_delay", zmsettings.difficultysettings[level.gamedifficulty].var_73b26261, 0);
    zombie_utility::set_zombie_var(#"penalty_no_revive", zmsettings.difficultysettings[level.gamedifficulty].var_6e13b2b7, 0);
    zombie_utility::set_zombie_var(#"penalty_died", zmsettings.difficultysettings[level.gamedifficulty].var_a93b7e4f, 0);
    zombie_utility::set_zombie_var(#"penalty_downed", zmsettings.difficultysettings[level.gamedifficulty].var_415b24aa, 0);
    zombie_utility::set_zombie_var(#"hash_3037a1f286b662e6", zmsettings.difficultysettings[level.gamedifficulty].var_b84141ad, 0);
    zombie_utility::set_zombie_var(#"hash_3098c53bba6402d3", zmsettings.difficultysettings[level.gamedifficulty].var_6de8fcc4, 0);
    zombie_utility::set_zombie_var(#"hash_67ae1b8cbb7c985", zmsettings.difficultysettings[level.gamedifficulty].var_e8996012, 0);
    zombie_utility::set_zombie_var(#"hash_cc85b961f25c2ff", zmsettings.difficultysettings[level.gamedifficulty].var_4a94ab75, 0);
    zombie_utility::set_zombie_var(#"retain_weapons", zmsettings.difficultysettings[level.gamedifficulty].var_3c177b07, 0);
    zombie_utility::set_zombie_var(#"perks_decay", zmsettings.difficultysettings[level.gamedifficulty].var_792e5fa0, 0);
    zombie_utility::set_zombie_var(#"hash_1ab42b4d7db4cb3c", zmsettings.difficultysettings[level.gamedifficulty].var_539d49a1, 0);
    zombie_utility::set_zombie_var(#"highlight_craftables", zmsettings.difficultysettings[level.gamedifficulty].var_93820904, 0);
    zombie_utility::set_zombie_var(#"zombie_point_scalar", zmsettings.difficultysettings[level.gamedifficulty].var_5a60ae8, 0, 1);
    zombie_utility::set_zombie_var(#"hash_3a4a041c1d674898", zmsettings.difficultysettings[level.gamedifficulty].var_dd67fc96, 0);
    zombie_utility::set_zombie_var(#"hash_762b7db4166c70aa", zmsettings.difficultysettings[level.gamedifficulty].var_f40fa2be, 0);
    zombie_utility::set_zombie_var(#"hash_6eb9b2d60babd5aa", zmsettings.difficultysettings[level.gamedifficulty].var_e97877db, 0);
    zombie_utility::set_zombie_var(#"hash_376905ad360fc2e8", zmsettings.difficultysettings[level.gamedifficulty].var_5e295f7d, 0);
    zombie_utility::set_zombie_var(#"hash_3b4ad7449c039d1b", zmsettings.difficultysettings[level.gamedifficulty].var_38e75b4c, 0);
    zombie_utility::set_zombie_var(#"hash_2374f3ef775ac2c3", zmsettings.difficultysettings[level.gamedifficulty].var_bc2d6211, 0);
    level flag::set(#"zombie_vars_init");
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x97c74029, Offset: 0x5790
// Size: 0xd6
function init_player_levelvars() {
    level flag::wait_till("start_zombie_round_logic");
    difficulty = 1;
    column = int(difficulty) + 1;
    for (i = 0; i < 8; i++) {
        points = 500;
        if (i > 3) {
            points = 3000;
        }
        points = zombie_utility::set_zombie_var("zombie_score_start_" + i + 1 + "p", points);
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xe5e6a7a0, Offset: 0x5870
// Size: 0x7c
function init_dvars() {
    setdvar(#"magic_chest_movable", 1);
    setdvar(#"revive_trigger_radius", 100);
    setdvar(#"cg_healthperbar", 50);
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x17ce4207, Offset: 0x58f8
// Size: 0x20c
function init_function_overrides() {
    level.callbackplayerdamage = &zm_player::callback_playerdamage;
    level.overrideplayerdamage = &zm_player::player_damage_override;
    if (isdefined(getgametypesetting(#"allowlaststandforactiveclients")) ? getgametypesetting(#"allowlaststandforactiveclients") : 0) {
        if (!isdefined(level.callbackplayerkilled)) {
            level.callbackplayerkilled = &zm_player::player_killed_override;
        }
        if (!isdefined(level.callbackplayerlaststand)) {
            level.callbackplayerlaststand = &zm_player::callback_playerlaststand;
        }
    }
    level.prevent_player_damage = &zm_player::player_prevent_damage;
    level.callbackactorkilled = &actor_killed_override;
    level.callbackactordamage = &actor_damage_override_wrapper;
    level.var_6788bf11 = &globallogic_scriptmover::function_8c7ec52f;
    level.callbackvehicledamage = &vehicle_damage_override;
    level.callbackvehiclekilled = &globallogic_vehicle::callback_vehiclekilled;
    level.callbackvehicleradiusdamage = &globallogic_vehicle::callback_vehicleradiusdamage;
    level.custom_introscreen = &zombie_intro_screen;
    level.custom_intermission = &zm_player::player_intermission;
    level.reset_clientdvars = &zm_player::onplayerconnect_clientdvars;
    level.player_becomes_zombie = &zm_playerzombie::zombify_player;
    level.validate_enemy_path_length = &zm_utility::default_validate_enemy_path_length;
    level.curclass = &zm_loadout::menuclass;
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xbca66406, Offset: 0x5b10
// Size: 0x2d0
function init_flags() {
    level flag::init("solo_game");
    level flag::init("start_zombie_round_logic");
    level flag::init("start_encounters_match_logic");
    level flag::init("spawn_point_override");
    level flag::init("crawler_round");
    level flag::init("spawn_zombies", 1);
    level flag::init("special_round");
    level flag::init("dog_round");
    level flag::init("raps_round");
    level flag::init("begin_spawning");
    level flag::init("end_round_wait");
    level flag::init("wait_and_revive");
    level flag::init("initial_blackscreen_passed");
    level flag::init("gameplay_started");
    setmatchflag("disableIngameMenu", 1);
    level flag::init("power_on");
    power_trigs = getentarray("use_elec_switch", "targetname");
    foreach (trig in power_trigs) {
        if (isdefined(trig.script_int)) {
            level flag::init("power_on" + trig.script_int);
        }
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xa4985d73, Offset: 0x5de8
// Size: 0x3ac
function init_client_field_callback_funcs() {
    clientfield::register("actor", "zombie_riser_fx", 1, 1, "int");
    if (is_true(level.use_water_risers)) {
        clientfield::register("actor", "zombie_riser_fx_water", 1, 1, "int");
    }
    if (is_true(level.use_foliage_risers)) {
        clientfield::register("actor", "zombie_riser_fx_foliage", 1, 1, "int");
    }
    if (is_true(level.use_low_gravity_risers)) {
        clientfield::register("actor", "zombie_riser_fx_lowg", 1, 1, "int");
    }
    clientfield::register("actor", "zombie_ragdoll_explode", 1, 1, "int");
    clientfield::register("actor", "zombie_gut_explosion", 1, 1, "int");
    clientfield::register("actor", "zombie_keyline_render", 1, 1, "int");
    bits = 4;
    trigs = getentarray("use_elec_switch", "targetname");
    if (isdefined(trigs)) {
        bits = getminbitcountfornum(trigs.size + 1);
    }
    clientfield::register("world", "zombie_power_on", 1, bits, "int");
    clientfield::register("world", "zombie_power_off", 1, bits, "int");
    clientfield::register("world", "zesn", 1, 1, "int");
    clientfield::register("world", "round_complete_time", 1, 20, "int");
    clientfield::register("world", "round_complete_num", 1, 8, "int");
    clientfield::register("world", "game_end_time", 1, 20, "int");
    clientfield::register("world", "quest_complete_time", 1, 20, "int");
    clientfield::register("world", "game_start_time", 1, 20, "int");
    clientfield::register("scriptmover", "rob_zm_prop_fade", 1, 1, "int");
}

// Namespace zm/zm
// Params 0, eflags: 0x0
// Checksum 0x20c140b, Offset: 0x61a0
// Size: 0x4b4
function init_fx() {
    level.createfx_callback_thread = &delete_in_createfx;
    level._effect[#"animscript_gib_fx"] = #"zombie/fx_blood_torso_explo_zmb";
    level._effect[#"animscript_gibtrail_fx"] = #"blood/fx_blood_gib_limb_trail";
    level._effect[#"switch_sparks"] = #"hash_26f37488feec03c3";
    level._effect[#"hash_4159f23a18f644a7"] = #"hash_71ed4f412b17e19e";
    level._effect[#"fx_zombie_bar_break"] = #"hash_718a24841c1e00c9";
    level._effect[#"fx_zombie_bar_break_lite"] = #"hash_35ee6425adf16fb6";
    if (!is_true(level.fx_exclude_edge_fog)) {
        level._effect[#"edge_fog"] = #"_t6/maps/zombie/fx_fog_zombie_amb";
    }
    level._effect[#"chest_light"] = #"zombie/fx_weapon_box_open_glow_zmb";
    level._effect[#"chest_light_closed"] = #"zombie/fx_weapon_box_closed_glow_zmb";
    level._effect[#"headshot"] = #"zombie/fx_bul_flesh_head_fatal_zmb";
    level._effect[#"headshot_nochunks"] = #"zombie/fx_bul_flesh_head_nochunks_zmb";
    level._effect[#"bloodspurt"] = #"zombie/fx_bul_flesh_neck_spurt_zmb";
    if (!is_true(level.fx_exclude_tesla_head_light)) {
        level._effect[#"tesla_head_light"] = #"hash_757d002378ec934c";
    }
    level._effect[#"zombie_guts_explosion"] = #"zombie/fx_blood_torso_explo_lg_zmb";
    level._effect[#"rise_burst_water"] = #"zombie/fx_spawn_dirt_hand_burst_zmb";
    level._effect[#"rise_billow_water"] = #"zombie/fx_spawn_dirt_body_billowing_zmb";
    level._effect[#"rise_dust_water"] = #"zombie/fx_spawn_dirt_body_dustfalling_zmb";
    level._effect[#"rise_burst"] = #"zombie/fx_spawn_dirt_hand_burst_zmb";
    level._effect[#"rise_billow"] = #"zombie/fx_spawn_dirt_body_billowing_zmb";
    level._effect[#"rise_dust"] = #"zombie/fx_spawn_dirt_body_dustfalling_zmb";
    level._effect[#"fall_burst"] = #"zombie/fx_spawn_dirt_hand_burst_zmb";
    level._effect[#"fall_billow"] = #"zombie/fx_spawn_dirt_body_billowing_zmb";
    level._effect[#"fall_dust"] = #"zombie/fx_spawn_dirt_body_dustfalling_zmb";
    level._effect[#"character_fire_death_sm"] = #"hash_c9cf0acc938a7f6";
    level._effect[#"character_fire_death_torso"] = #"hash_5686def5b4c85661";
    if (!is_true(level.fx_exclude_default_explosion)) {
        level._effect[#"def_explosion"] = #"_t6/explosions/fx_default_explosion";
    }
    if (!is_true(level.disable_fx_upgrade_aquired)) {
        level._effect[#"upgrade_aquired"] = #"hash_359f0993cf4ebe66";
    }
}

// Namespace zm/zm
// Params 5, eflags: 0x2 linked
// Checksum 0x5decac5c, Offset: 0x6660
// Size: 0x4c
function zombie_intro_screen(*string1, *string2, *string3, *string4, *string5) {
    level flag::wait_till("start_zombie_round_logic");
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xa171298c, Offset: 0x66b8
// Size: 0x60
function players_playing() {
    players = getplayers();
    level.players_playing = players.size;
    wait(20);
    players = getplayers();
    level.players_playing = players.size;
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x432cc2d7, Offset: 0x6720
// Size: 0x8c
function set_intermission_point() {
    points = struct::get_array("intermission", "targetname");
    if (points.size < 1) {
        return;
    }
    points = array::randomize(points);
    point = points[0];
    setdemointermissionpoint(point.origin, point.angles);
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0xa9f07445, Offset: 0x67b8
// Size: 0x44
function register_vehicle_damage_callback(func) {
    if (!isdefined(level.vehicle_damage_callbacks)) {
        level.vehicle_damage_callbacks = [];
    }
    level.vehicle_damage_callbacks[level.vehicle_damage_callbacks.size] = func;
}

// Namespace zm/zm
// Params 16, eflags: 0x2 linked
// Checksum 0xaec037da, Offset: 0x6808
// Size: 0x1ec
function vehicle_damage_override(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    if (isdefined(level.vehicle_damage_callbacks)) {
        for (i = 0; i < level.vehicle_damage_callbacks.size; i++) {
            idamage = self [[ level.vehicle_damage_callbacks[i] ]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
        }
    }
    if (is_true(self.var_1e7e5205)) {
        idamage *= 2;
    }
    self globallogic_vehicle::callback_vehicledamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
    if (isdefined(eattacker) && isdefined(self) && idamage > 0 && !is_true(self.var_265cb589) && !is_true(level.var_dc60105c)) {
        eattacker thread damagefeedback::update(smeansofdeath, einflictor, undefined, weapon, self, psoffsettime, shitloc, self.health <= 0, idflags);
    }
}

// Namespace zm/zm
// Params 5, eflags: 0x6 linked
// Checksum 0x8fe4f6b6, Offset: 0x6a00
// Size: 0x166
function private function_7bdb1f9f(attacker, damage, meansofdeath, weapon, shitloc) {
    if ((is_true(level.headshots_only) || zm_trial_headshots_only::is_active()) && isplayer(attacker)) {
        if (meansofdeath == "MOD_MELEE" && (shitloc == "head" || shitloc == "helmet")) {
            return int(damage);
        }
        if (zm_utility::is_explosive_damage(meansofdeath)) {
            return int(damage);
        }
        if (weapon.isheroweapon) {
            return int(damage);
        }
        if (is_true(self.var_7105092c)) {
            return int(damage);
        }
        if (!self zm_utility::is_headshot(weapon, shitloc, meansofdeath)) {
            return 0;
        }
    }
    return damage;
}

// Namespace zm/zm
// Params 6, eflags: 0x2 linked
// Checksum 0x2cfdd0fb, Offset: 0x6b70
// Size: 0xe4
function function_34d1053d(damage, weapon, vpoint, shitloc, attacker, meansofdeath) {
    if (!isplayer(attacker) || meansofdeath === "MOD_MELEE" || !isdefined(weapon.var_349c3324)) {
        return damage;
    }
    if (!self zm_utility::function_4562a3ef(shitloc, vpoint)) {
        return damage;
    }
    damage *= weapon.var_349c3324;
    var_fd72ea28 = attacker namespace_b61a349a::function_817f0439(damage, weapon, vpoint, shitloc);
    damage += var_fd72ea28;
    return damage;
}

// Namespace zm/zm
// Params 13, eflags: 0x2 linked
// Checksum 0x7ec2b607, Offset: 0x6c60
// Size: 0xd9a
function actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (!isdefined(self) || !isdefined(attacker)) {
        return damage;
    }
    var_b8e81da3 = 0;
    if (isactor(attacker) && isdefined(attacker.var_5ade90d9)) {
        damage = attacker.var_5ade90d9;
    }
    if (meansofdeath == "MOD_MELEE") {
        rootweapon = weapon.rootweapon;
        if (isdefined(rootweapon) && isdefined(level.var_69acf721) && isinarray(level.var_69acf721, rootweapon)) {
            var_b8e81da3 = 1;
        }
    }
    if (meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_PROJECTILE_SPLASH" || meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH") {
        self.var_e6675d2d = vpoint;
    } else {
        self.var_e6675d2d = undefined;
    }
    if (isdefined(weapon) && isplayer(attacker) && meansofdeath !== "MOD_AAT") {
        if (weapon.offhandslot === "Tactical grenade" || weapon.offhandslot === "Lethal grenade" || weapon.offhandslot === "Special" || killstreaks::is_killstreak_weapon(weapon)) {
            if (!zm_equipment::function_4f51b6ea(weapon, meansofdeath) && !is_true(self.var_88bc9ca8) && meansofdeath !== "MOD_MELEE") {
                if (zm_utility::is_survival()) {
                    if (self.var_6f84b820 === #"boss") {
                        if (killstreaks::is_killstreak_weapon(weapon)) {
                            if (weapon.name === #"hero_annihilator") {
                                damage = zm_equipment::function_739fbb72(damage, weapon, self.var_6f84b820, self.maxhealth);
                            } else {
                                damage = zm_equipment::function_739fbb72(damage, weapon, self.var_6f84b820, self.maxhealth);
                                damage *= 0.5;
                                if (weapon.firetype === "Minigun") {
                                    damage *= 0.5;
                                }
                            }
                        } else {
                            damage = zm_equipment::function_739fbb72(damage, weapon, self.var_6f84b820, self.maxhealth);
                            damage *= 0.1;
                        }
                    } else {
                        damage = zm_equipment::function_739fbb72(damage, weapon, self.var_6f84b820, self.maxhealth);
                    }
                } else {
                    damage = zm_equipment::function_379f6b5d(damage, weapon, self.var_6f84b820, self.maxhealth);
                }
            }
        }
        item = attacker item_inventory::function_230ceec4(weapon);
        if (isdefined(item)) {
            var_528363fd = self namespace_b61a349a::function_b3496fde(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
            damage += var_528363fd;
            if (meansofdeath != "MOD_MELEE" || var_b8e81da3) {
                var_4d1602de = zm_weapons::function_d85e6c3a(item.itementry);
                damage *= var_4d1602de;
                if (isdefined(item.paplv)) {
                    var_645b8bb = zm_weapons::function_896671d5(item.itementry.weapon, item.paplv);
                    damage *= var_645b8bb;
                }
            }
        } else {
            var_fd72ea28 = self namespace_b61a349a::function_b3496fde(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
            damage += var_fd72ea28;
        }
    }
    if (isdefined(weapon) && isai(self)) {
        if (is_true(weapon.dostun)) {
            if (!isdefined(self.var_31cadcc9)) {
                self.var_31cadcc9 = [];
            }
            self.var_31cadcc9[weapon.statname] = {#time:gettime(), #player:attacker};
            self ai::stun();
        }
    }
    if (weapon.name === #"hero_flamethrower" && (self.var_6f84b820 === #"normal" || self.var_6f84b820 === #"special")) {
        if (isdefined(level.var_da1321f4) && !is_true(self.var_e7dcb25b)) {
            self.var_e7dcb25b = 1;
            self thread [[ level.var_da1321f4 ]](attacker, weapon, 0);
        }
    }
    if (isplayer(attacker) && attacker aat::has_aat(weapon)) {
        aat = attacker aat::getaatonweapon(weapon);
    }
    element = namespace_42457a0::function_d6863a3(inflictor, attacker, meansofdeath, weapon, aat, item);
    if (isdefined(element)) {
        if (!isdefined(self.var_c6f48ff5)) {
            self.var_c6f48ff5 = 0;
        }
        if (!isdefined(self.var_ce699d16)) {
            self.var_ce699d16 = [];
        }
        if (!isinarray(self.var_ce699d16, element)) {
            self.var_c6f48ff5++;
            self.var_ce699d16[self.var_ce699d16.size] = element;
        }
        damage = namespace_42457a0::function_9fbcd067(element, inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
    }
    if (meansofdeath != "MOD_MELEE" || var_b8e81da3) {
        if (isdefined(aat) && isplayer(attacker)) {
            damage = attacker zm_aat::function_6b15092(aat.name, damage, self);
        }
    }
    if (is_true(level.bgb_in_use)) {
        damage = bgb::actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
    }
    if (isdefined(weapon.name) && isdefined(level.var_aed5d327[weapon.name])) {
        damage = self [[ level.var_aed5d327[weapon.name] ]](inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
    }
    damage = zm_perks::actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
    damage = self function_34d1053d(damage, weapon, vpoint, shitloc, attacker, meansofdeath);
    damage = self check_actor_damage_callbacks(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
    damage = namespace_1b527536::actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
    attacker thread zm_audio::sndplayerhitalert(self, meansofdeath, inflictor, weapon, shitloc, damage);
    if (!isbot(attacker)) {
        level notify(#"hash_3fdaafe712252cf5");
    }
    if (is_true(level.zm_bots_scale) && isbot(attacker)) {
        damage = int(damage * zm_bot::function_e16b5033(self));
    }
    self.var_88bc9ca8 = undefined;
    if (!isdefined(damage) || !isdefined(meansofdeath) || meansofdeath == "") {
        return damage;
    }
    if (isdefined(self.var_318a0ac8) && !isinarray(level.var_66c53c7e, weapon.name)) {
        self.var_6936b30b = self [[ self.var_318a0ac8 ]](inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, undefined);
        damage = self.var_6936b30b.damage;
    }
    if (isdefined(self.aioverridedamage)) {
        for (index = 0; index < self.aioverridedamage.size; index++) {
            damagecallback = self.aioverridedamage[index];
            damage = self [[ damagecallback ]](inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, undefined);
        }
        if (damage < 1) {
            return 0;
        }
        damage = int(damage + 0.5);
    }
    final_damage = damage;
    if (is_true(self.in_water)) {
        if (int(final_damage) >= self.health) {
            self.water_damage = 1;
        }
    }
    if (isplayer(attacker)) {
        if (attacker === inflictor) {
            if (meansofdeath == "MOD_HEAD_SHOT" || meansofdeath == "MOD_PISTOL_BULLET" || meansofdeath == "MOD_RIFLE_BULLET") {
                if (!isdefined(attacker.hits)) {
                    attacker.hits = 0;
                }
                attacker.hits++;
            }
        }
        if (isalive(attacker) && (meansofdeath === "MOD_GRENADE" || meansofdeath === "MOD_GRENADE_SPLASH")) {
            attacker.grenade_multiattack_count++;
            attacker.grenade_multiattack_ent = self;
        }
        final_damage = self zm_powerups::function_fe6d6eac(attacker, meansofdeath, shitloc, weapon, final_damage);
        self.has_been_damaged_by_player = 1;
    }
    final_damage = self function_7bdb1f9f(attacker, final_damage, meansofdeath, weapon, shitloc);
    if (isplayer(attacker)) {
        if (!isdefined(attacker.pers[#"damagedone"])) {
            attacker.pers[#"damagedone"] = 0;
        }
        attacker.pers[#"damagedone"] = attacker.pers[#"damagedone"] + final_damage;
    }
    return int(final_damage);
}

// Namespace zm/zm
// Params 13, eflags: 0x2 linked
// Checksum 0x7d3f08a7, Offset: 0x7a08
// Size: 0x100
function check_actor_damage_callbacks(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (!isdefined(level.actor_damage_callbacks)) {
        return damage;
    }
    for (i = 0; i < level.actor_damage_callbacks.size; i++) {
        newdamage = self [[ level.actor_damage_callbacks[i] ]](inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
        if (-1 !== newdamage) {
            return newdamage;
        }
    }
    return damage;
}

// Namespace zm/zm
// Params 2, eflags: 0x2 linked
// Checksum 0x660168ad, Offset: 0x7b10
// Size: 0x40
function function_84d343d(str_weapon, func) {
    if (!isdefined(level.var_aed5d327)) {
        level.var_aed5d327 = [];
    }
    level.var_aed5d327[str_weapon] = func;
}

// Namespace zm/zm
// Params 2, eflags: 0x2 linked
// Checksum 0x2196aa13, Offset: 0x7b58
// Size: 0x84
function register_actor_damage_callback(func, var_61bac8c = 0) {
    if (!isdefined(level.actor_damage_callbacks)) {
        level.actor_damage_callbacks = [];
    }
    if (var_61bac8c) {
        array::push_front(level.actor_damage_callbacks, func);
        return;
    }
    level.actor_damage_callbacks[level.actor_damage_callbacks.size] = func;
}

// Namespace zm/zm
// Params 16, eflags: 0x2 linked
// Checksum 0x15b274c4, Offset: 0x7be8
// Size: 0x12d4
function actor_damage_override_wrapper(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, modelindex, surfacetype, vsurfacenormal) {
    if (isdefined(level.var_d2895b5f[weapon]) && isdefined(self.team) && self.team === attacker.team) {
        return 0;
    }
    if (getdvarint(#"hash_4355774544882de3", 1)) {
        var_2aa2348 = undefined;
        if (isdefined(weapon.rootweapon) && isdefined(level.var_6476d5c6[weapon.rootweapon])) {
            var_2aa2348 = weapon.rootweapon;
        } else if (flags & 1 && !(isdefined(weapon) && isdefined(level.var_b6bda274[weapon]))) {
            var_2aa2348 = weapon.rootweapon;
            if (isdefined(weapon.rootweapon)) {
                if (!(isdefined(weapon.rootweapon) && isdefined(level.var_6476d5c6[weapon.rootweapon]))) {
                    zm_weapons::function_90953640(weapon.rootweapon, 3, float(function_60d95f53()) / 1000);
                }
            } else {
                var_2aa2348 = 1;
            }
        }
        if (isdefined(var_2aa2348)) {
            self endon(#"death");
            profilestart();
            if (isdefined(weapon.rootweapon) && isdefined(level.var_60387857[weapon.rootweapon])) {
                foreach (callback in level.var_60387857[weapon.rootweapon]) {
                    self [[ callback ]](inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, modelindex, surfacetype, vsurfacenormal);
                }
            }
            profilestop();
            self zm_weapons::function_a76ab7f7(var_2aa2348, attacker);
            if (!isalive(self)) {
                return;
            }
        }
    }
    self.var_6936b30b = undefined;
    if (inflictor.classname === "script_vehicle" && meansofdeath === "MOD_CRUSH" && is_true(self.var_122bd98d)) {
        return;
    }
    if (isvehicle(inflictor) && !isplayer(attacker) && isdefined(inflictor.var_260e3593)) {
        player = inflictor getseatoccupant(inflictor.var_260e3593);
        if (isplayer(player)) {
            attacker = player;
        }
    }
    if (!isdefined(self)) {
        return damage;
    }
    if (level.var_9427911d <= 0 && level flag::get(#"infinite_round_spawning") && !is_true(level.var_382a24b0)) {
        self.var_12745932 = 1;
    }
    if (isdefined(attacker) && attacker zm_utility::function_45492cc4()) {
        attacker = attacker.owner;
    }
    if (!(flags & 8192)) {
        if ((isdefined(self.var_ccefa6dd) || isai(attacker) && meansofdeath === "MOD_MELEE") && isdefined(attacker) && attacker.team === self.team) {
            return 0;
        }
    }
    if (flags & 8192) {
        damage_override = damage;
    } else {
        damage_override = self actor_damage_override(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
    }
    willbekilled = self.health - damage_override <= 0;
    if (isdefined(level.zombie_damage_override_callbacks)) {
        foreach (func_override in level.zombie_damage_override_callbacks) {
            self thread [[ func_override ]](willbekilled, inflictor, attacker, damage_override, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
        }
    }
    if (isdefined(self.var_5fe6212f) && damage_override == 0) {
        return 0;
    }
    if (isdefined(inflictor) && isvehicle(inflictor) && inflictor.vehicletype !== #"hash_d57fa1b1aacffc7") {
        if (meansofdeath === "MOD_CRUSH") {
            var_6348e344 = self.maxhealth / self.basehealth;
            damage_override = int(damage_override * var_6348e344);
        } else if (meansofdeath === "MOD_RIFLE_BULLET") {
            if (isplayer(attacker) && attacker isinvehicle() && attacker getvehicleoccupied() === inflictor) {
                var_6348e344 = self.maxhealth / self.basehealth;
                var_40bc7bf7 = 1;
                if (self.var_6f84b820 === #"special" || self.var_6f84b820 === #"elite") {
                    var_40bc7bf7 = 0.2;
                } else if (self.var_6f84b820 === #"boss") {
                    var_40bc7bf7 = 0.1;
                } else {
                    var_40bc7bf7 = 0.4;
                }
                damage_override = int(ceil(damage_override * var_6348e344 * var_40bc7bf7));
            }
        }
    } else if (isplayer(attacker) && attacker isinvehicle()) {
        vehicle = attacker getvehicleoccupied();
        if (vehicle.scriptvehicletype === "player_tank") {
            var_6348e344 = self.maxhealth / self.basehealth;
            var_40bc7bf7 = 1;
            if (self.var_6f84b820 === #"special" || self.var_6f84b820 === #"elite") {
                var_40bc7bf7 = 0.8;
            } else if (self.var_6f84b820 === #"boss") {
                var_40bc7bf7 = 1;
            } else {
                var_40bc7bf7 = 0.4;
            }
            damage_override = int(ceil(damage_override * var_6348e344 * var_40bc7bf7));
        }
    }
    if (!(flags & 8192)) {
        if (isdefined(self.var_21567e64) && self.health - damage_override <= self.var_21567e64 && !is_true(self.marked_for_death)) {
            damage_override = int(max(0, self.health - self.var_21567e64));
        } else if (isdefined(self.var_94378ef) && self.health - damage_override <= self.var_94378ef && !is_true(self.marked_for_death)) {
            damage_override = int(max(0, self.health - self.var_94378ef));
        }
    }
    if (isdefined(level.var_8d314fbb)) {
        final_damage = [[ level.var_8d314fbb ]](inflictor, attacker, damage_override, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
        if (is_true(final_damage.var_1918799e) && final_damage.damage === 0) {
            return 0;
        }
    }
    if (!isdefined(final_damage)) {
        final_damage = damage_override;
    }
    scoreevents::function_82234b38(self, attacker, weapon, meansofdeath, inflictor.var_443d78cc, inflictor);
    bb::logdamage(attacker, self, weapon, damage_override, meansofdeath, shitloc, willbekilled, willbekilled);
    if (!willbekilled || !is_true(self.dont_die_on_me)) {
        params = spawnstruct();
        params.einflictor = inflictor;
        params.eattacker = attacker;
        params.idamage = damage_override;
        params.idflags = flags;
        params.smeansofdeath = meansofdeath;
        params.weapon = weapon;
        params.var_fd90b0bb = var_fd90b0bb;
        params.vpoint = vpoint;
        params.vdir = vdir;
        params.shitloc = shitloc;
        params.vdamageorigin = vdamageorigin;
        params.psoffsettime = psoffsettime;
        params.boneindex = boneindex;
        params.modelindex = modelindex;
        params.surfacetype = surfacetype;
        params.vsurfacenormal = vsurfacenormal;
        if (params.idamage > 0 || namespace_ae2d0839::is_active()) {
            self callback::callback(#"on_ai_damage", params);
            self callback::callback(#"on_actor_damage", params);
        }
        var_e2e301c8 = undefined;
        if (self flag::get("kill_hvt_teleporting")) {
            var_ebcff177 = 4;
        } else if (isdefined(self.var_6936b30b.var_ebcff177) && self.var_6936b30b.var_ebcff177 != 1) {
            var_ebcff177 = self.var_6936b30b.var_ebcff177;
            if (var_ebcff177 === 3) {
                var_e2e301c8 = "armor";
                if (is_true(self.var_426947c4)) {
                    var_e2e301c8 = "armorBroke";
                }
                flags |= 2048;
            } else if (var_ebcff177 === 2) {
                level.var_d7e2833c = 1;
            }
        } else if (!killstreaks::is_killstreak_weapon(weapon) && self zm_utility::is_headshot(weapon, shitloc, meansofdeath) && !is_true(self.var_58c4c69b) && aiutility::function_e2278a4b(weapon, meansofdeath)) {
            level.var_d7e2833c = 1;
            var_ebcff177 = 2;
        } else {
            var_ebcff177 = 1;
        }
        if (!isdefined(level.var_f96e7a56[weapon]) && !is_true(self.var_36d6f09a)) {
            if (isdefined(self.var_306ee014) && is_true([[ self.var_306ee014 ]](self))) {
                var_ebcff177 = 4;
            }
            var_cb7c50c0 = vpoint;
            if (!aiutility::function_493e5914(params.smeansofdeath) && !is_true(self.var_85369277)) {
                var_cb7c50c0 = aiutility::function_cb552839(self);
            }
            if (isplayer(attacker) && attacker aat::has_aat(weapon)) {
                aat = attacker aat::getaatonweapon(weapon);
            }
            if (isplayer(attacker)) {
                item = attacker item_inventory::function_230ceec4(weapon);
            }
            element = self namespace_42457a0::function_d6863a3(inflictor, attacker, meansofdeath, weapon, aat, item);
            hud::function_c9800094(attacker, var_cb7c50c0, damage_override, var_ebcff177, self namespace_42457a0::function_1b3815a7(element));
        }
        if (is_true(level.var_d7e2833c)) {
            level.var_d7e2833c = undefined;
            flags |= 131072;
        }
        if (is_true(level.var_d921ba10)) {
            level.var_d921ba10 = undefined;
            flags |= 262144;
        }
        self finishactordamage(inflictor, attacker, int(final_damage), flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, surfacetype, vsurfacenormal);
        if (isplayer(attacker) && (damage_override > 0 || var_ebcff177 === 4) && !is_true(self.var_265cb589) && !is_true(level.var_dc60105c) && (!attacker issplitscreen() || getplayers().size < 4)) {
            attacker thread damagefeedback::update(meansofdeath, inflictor, var_e2e301c8, weapon, self, psoffsettime, shitloc, self.health <= 0, flags);
        }
    }
    if (!isdefined(attacker.var_e7b05e99) && zm_utility::is_player_valid(attacker) && meansofdeath !== "MOD_MELEE") {
        attacker.var_e7b05e99 = 1;
    }
    if ((shitloc === "head" || shitloc === "helmet") && !zm_ai_utility::hashelmet(shitloc, self) && self.archetype !== #"zombie_dog" && meansofdeath != "MOD_MELEE") {
        level scoreevents::doscoreeventcallback("scoreEventZM", {#attacker:attacker, #scoreevent:"hit_weak_point_zm", #enemy:self, #hitloc:shitloc, #weapon:weapon});
    }
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0xbb92a179, Offset: 0x8ec8
// Size: 0xa8
function register_zombie_damage_override_callback(func) {
    if (!isdefined(level.zombie_damage_override_callbacks)) {
        level.zombie_damage_override_callbacks = [];
    }
    if (!isdefined(level.zombie_damage_override_callbacks)) {
        level.zombie_damage_override_callbacks = [];
    } else if (!isarray(level.zombie_damage_override_callbacks)) {
        level.zombie_damage_override_callbacks = array(level.zombie_damage_override_callbacks);
    }
    level.zombie_damage_override_callbacks[level.zombie_damage_override_callbacks.size] = func;
}

// Namespace zm/zm
// Params 9, eflags: 0x2 linked
// Checksum 0x39f9d677, Offset: 0x8f78
// Size: 0xbec
function actor_killed_override(einflictor, attacker, idamage, smeansofdeath, weapon, var_fd90b0bb, vdir, shitloc, psoffsettime) {
    if (game.state == "postgame") {
        return;
    }
    if (self.var_c39323b5 !== 1) {
        level.var_9427911d--;
        if (level.var_9427911d <= 0 && level flag::get(#"infinite_round_spawning") && !is_true(level.var_382a24b0)) {
            self.var_12745932 = 1;
        }
    }
    if (is_true(self.var_2e85cbf2) && is_true(einflictor.aat_turned)) {
        self flag::set(#"hash_206b99f9504c6c41");
        self thread namespace_63c7213c::actor_damage_override(einflictor, attacker, idamage);
    }
    player = undefined;
    eattacker = attacker;
    if (!isdefined(level.n_total_kills)) {
        level.n_total_kills = 0;
    }
    if (isdefined(eattacker)) {
        if (isplayer(eattacker)) {
            player = eattacker;
        } else {
            if (isdefined(eattacker.owner) && isplayer(eattacker) && eattacker.classname == "script_vehicle") {
                player = eattacker.owner;
            }
            if (!isdefined(player)) {
                if (isvehicle(eattacker) && isdefined(eattacker.var_260e3593)) {
                    vehicle = eattacker;
                    var_a5165f0e = vehicle.var_260e3593;
                } else if (isvehicle(einflictor) && eattacker.classname === "worldspawn" && isdefined(einflictor.var_260e3593)) {
                    vehicle = einflictor;
                    var_a5165f0e = vehicle.var_260e3593;
                }
                if (isvehicle(vehicle) && isdefined(var_a5165f0e)) {
                    player = vehicle getseatoccupant(var_a5165f0e);
                    if (isplayer(player)) {
                        attacker = player;
                        eattacker = player;
                    }
                }
            }
        }
    }
    if (isdefined(player) && isplayer(player)) {
        killcam_entity_info = killcam::get_killcam_entity_info(player, einflictor, weapon);
        deathtime = gettime();
        deathtimeoffset = 0;
        perks = [];
        killstreaks = [];
        rounds = level.round_number;
        bookmarkname = #"";
        if (isdefined(self.archetype) && (self.archetype == #"tiger" || self.archetype == #"brutus" || self.archetype == #"zombie_dog" || self.archetype == #"catalyst" || self.archetype == #"stoker" || self.archetype == #"blight_father")) {
            bookmarkname = #"hash_1553fcea4f6a00e";
        } else {
            bookmarkname = #"hash_37300d83d8e6f1fc";
        }
        if (bookmarkname == #"hash_1553fcea4f6a00e") {
            demo::bookmark(bookmarkname, gettime(), player);
        }
        potm::bookmark(bookmarkname, gettime(), player);
        level thread potm::function_5523a49a(bookmarkname, player getentitynumber(), player getxuid(), self, killcam_entity_info, weapon, smeansofdeath, deathtime, deathtimeoffset, psoffsettime, perks, killstreaks, player);
    }
    if (isai(attacker) && isdefined(attacker.script_owner)) {
        if (attacker.script_owner.team != self.team) {
            attacker = attacker.script_owner;
        }
    }
    if (isdefined(attacker) && attacker zm_utility::function_45492cc4(0)) {
        attacker = attacker.owner;
    }
    if (isdefined(attacker) && isplayer(attacker)) {
        level.n_total_kills++;
        type = undefined;
        if (isdefined(self.animname)) {
            switch (self.animname) {
            case #"quad_zombie":
                type = "quadkill";
                break;
            case #"ape_zombie":
                type = "apekill";
                break;
            case #"zombie":
                type = "zombiekill";
                break;
            case #"zombie_dog":
                type = "dogkill";
                break;
            }
        }
    }
    if (is_true(self.is_ziplining)) {
        self.deathanim = undefined;
    }
    params = spawnstruct();
    params.einflictor = einflictor;
    params.eattacker = attacker;
    params.idamage = idamage;
    params.smeansofdeath = smeansofdeath;
    params.weapon = weapon;
    params.var_fd90b0bb = var_fd90b0bb;
    params.vdir = vdir;
    params.shitloc = shitloc;
    params.psoffsettime = psoffsettime;
    self callback::callback(#"on_ai_killed", params);
    self callback::callback(#"on_actor_killed", params);
    self zm_stats::handle_death(einflictor, attacker, weapon, smeansofdeath);
    if (isdefined(self.actor_killed_override)) {
        self [[ self.actor_killed_override ]](einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime);
    }
    if (isdefined(self.deathfunction)) {
        self [[ self.deathfunction ]](einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime);
    }
    var_82700ea5 = zm_custom::function_901b751c(#"zmkillcap");
    if (!isdefined(var_82700ea5)) {
        var_82700ea5 = 0;
    }
    if (var_82700ea5 > 0 && level.n_total_kills >= var_82700ea5) {
        zm_custom::function_9be9c072("zmKillCap");
    }
    if (isdefined(einflictor.var_443d78cc)) {
        params.var_a3660fca = einflictor.var_443d78cc;
        scoreevents::function_82234b38(self, attacker, weapon, undefined, params.var_a3660fca, einflictor);
    } else if (isdefined(attacker.var_443d78cc)) {
        params.var_a3660fca = attacker.var_443d78cc;
        params.eattacker = attacker.var_443d78cc;
        scoreevents::function_82234b38(self, attacker, weapon, undefined, params.var_a3660fca, attacker);
    }
    params.enemy = self;
    if (smeansofdeath !== "MOD_MELEE" && (shitloc === "head" || shitloc === "helmet") && !zm_ai_utility::hashelmet(shitloc, self) && self.archetype !== #"zombie_dog") {
        params.var_3fb48d9c = 1;
    }
    if (isdefined(attacker) && isplayer(attacker)) {
        attacker function_9dd8ba0b(weapon.name);
        attacker function_df94f87e(weapon);
        switch (weapon.name) {
        case #"gun_ultimate_turret":
        case #"energy_mine":
        case #"energy_mine_4":
        case #"hash_4ac3fea4add2a2c9":
        case #"energy_mine_2":
        case #"energy_mine_3":
        case #"energy_mine_1":
        case #"satchel_charge":
            attacker zm_stats::increment_challenge_stat(#"hash_6b6279ca26024847");
            break;
        }
        if (einflictor.item.name === #"hatchet") {
            if (isdefined(attacker.var_8ff34f45)) {
                einflictor.var_8ff34f45 = attacker.var_8ff34f45;
            } else {
                einflictor.var_8ff34f45 = 0;
            }
            einflictor.var_8ff34f45++;
            if (einflictor.var_8ff34f45 >= 5) {
                einflictor.var_8ff34f45 = 0;
                attacker.var_8ff34f45 = 0;
                attacker zm_stats::increment_challenge_stat(#"hash_b023b1e339c3ab");
            }
        }
    }
    if (!isplayer(params.eattacker) || params.enemy.var_c3083789 === 0) {
        return;
    }
    level scoreevents::doscoreeventcallback("killingBlow", params);
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0x24f50695, Offset: 0x9b70
// Size: 0x12c
function function_df94f87e(weapon) {
    if (killstreaks::is_killstreak_weapon(weapon) && weapon.name !== #"gun_ultimate_turret") {
        killstreak_item = self.inventory.items[17];
        if (isdefined(killstreak_item.kills)) {
            killstreak_item.kills++;
            if (killstreak_item.kills >= 30) {
                killstreak_item.kills = undefined;
                self zm_stats::increment_challenge_stat(#"hash_6dfaf1d66eb666ae");
            }
        } else {
            killstreak_item.kills = 1;
        }
        if (weapon.name == #"remote_missile_missile" || weapon.name == #"remote_missile_bomblet") {
            if (!isdefined(self.remotemissilebda)) {
                self.remotemissilebda = 0;
            }
            self.remotemissilebda++;
        }
    }
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0x52e27763, Offset: 0x9ca8
// Size: 0x162
function function_9dd8ba0b(weapon_name) {
    switch (weapon_name) {
    case #"hash_6319e23758cd25e":
    case #"hash_6319f23758cd411":
    case #"hash_631a023758cd5c4":
    case #"hash_631a123758cd777":
    case #"hash_631a223758cd92a":
    case #"frost_blast":
    case #"hash_1d9cb9dbd298acba":
    case #"frost_blast_1":
    case #"frost_blast_3":
    case #"frost_blast_2":
    case #"frost_blast_5":
    case #"frost_blast_4":
    case #"energy_mine":
    case #"energy_mine_4":
    case #"hash_4ac3fea4add2a2c9":
    case #"energy_mine_2":
    case #"energy_mine_3":
    case #"energy_mine_1":
        self zm_stats::increment_challenge_stat(#"hash_2c0504992b5785f2");
        break;
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x84b7a932, Offset: 0x9e18
// Size: 0x6e
function round_end_monitor() {
    while (true) {
        level waittill(#"end_of_round");
        demo::bookmark(#"zm_round_end", gettime(), undefined, undefined, 1);
        bbpostdemostreamstatsforround(level.round_number);
        waitframe(1);
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xd9e79ea2, Offset: 0x9e90
// Size: 0xbc
function function_51133aa1() {
    level endon(#"resume_end_game");
    while (true) {
        waitresult = self waittill(#"menuresponse");
        response = waitresult.response;
        if (response == "restart_level_zm") {
            level thread zm_gametype::zm_map_restart();
            wait(666);
            continue;
        }
        if (response == "resume_end_game") {
            level notify(#"resume_end_game");
        }
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xfc40af79, Offset: 0x9f58
// Size: 0x78
function function_d723e40() {
    level endon(#"resume_end_game");
    wait(1);
    luinotifyevent(#"hash_1fc4832b89307895", 0);
    wait(zombie_utility::get_zombie_var(#"hash_6bae95928bbe8f1"));
    level notify(#"resume_end_game");
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xf1e38dc7, Offset: 0x9fd8
// Size: 0xec
function restart_prompt() {
    players = getplayers();
    foreach (player in players) {
        player thread function_51133aa1();
    }
    level thread function_d723e40();
    level waittill(#"resume_end_game");
    luinotifyevent(#"hash_3aa743d9ad6c8e19", 0);
}

// Namespace zm/zm
// Params 0, eflags: 0x6 linked
// Checksum 0x21e8695f, Offset: 0xa0d0
// Size: 0x7e
function private function_70171add() {
    if (randomfloat(1) <= getdvarfloat(#"survey_chance", 0)) {
        return randomintrange(1, getdvarint(#"survey_count", 0) + 1);
    }
    return 0;
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x705618dc, Offset: 0xa158
// Size: 0x108
function function_6c369691() {
    a_ai = getaiteamarray("axis");
    foreach (n_index, ai in a_ai) {
        if (isalive(ai)) {
            ai val::set(#"end_game", "ignoreall", 1);
            ai thread zm_cleanup::no_target_override(ai);
            if (n_index % 2) {
                wait(0.05);
            }
        }
    }
}

// Namespace zm/zm
// Params 1, eflags: 0x0
// Checksum 0xd5c20568, Offset: 0xa268
// Size: 0x134
function function_2a49523d(winner) {
    outcome = {#var_c1e98979:0, #var_68c25772:1, #var_7d5c2c5f:0, #var_277c7d47:1, #var_14f94126:game.strings[#"defeat"], #team:#"axis", #players:[]};
    if (isdefined(winner) && winner == #"allies") {
        outcome.var_14f94126 = game.strings[#"victory"];
        outcome.team = #"allies";
    }
    display_transition::function_e6b4f2f7(outcome);
    display_transition::function_15e28b1a(outcome);
}

/#

    // Namespace zm/zm
    // Params 1, eflags: 0x4
    // Checksum 0x69a50b01, Offset: 0xa3a8
    // Size: 0xcc
    function private function_529b6f7d(waitresult) {
        reason = "<unknown string>";
        if (isdefined(waitresult.reason)) {
            reason = "<unknown string>";
            if (ishash(waitresult.reason)) {
                reason += function_9e72a96(waitresult.reason);
            } else if (isstring(waitresult.reason)) {
                reason += waitresult.reason;
            }
        }
        println("<unknown string>" + reason);
    }

#/

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xaa10f615, Offset: 0xa480
// Size: 0xc4
function function_1bcdea84() {
    if (zm_utility::is_survival()) {
        music::setmusicstate("SILENT");
        return;
    }
    if (zm_utility::is_tutorial()) {
        music::setmusicstate("zodt8_death");
        return;
    }
    if (isdefined(level.var_f546b995)) {
        level thread zm_audio::sndmusicsystem_playstate("game_over" + "_" + level.var_f546b995);
        return;
    }
    level thread zm_audio::sndmusicsystem_playstate("game_over");
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x437d95ac, Offset: 0xa550
// Size: 0x150a
function end_game() {
    waitresult = level waittill(#"end_game");
    if (!isdefined(level.winningteam)) {
        level.winningteam = #"draw";
    }
    [[ level.onendgame ]](level.winningteam);
    changeadvertisedstatus(0);
    check_end_game_intermission_delay();
    /#
        function_529b6f7d(waitresult);
    #/
    setmatchflag("game_ended", 1);
    setmatchflag("cg_drawSpectatorMessages", 0);
    setmatchflag("disableIngameMenu", 1);
    if (!is_true(level.disableoutrovisionset) && level.forcedend) {
        visionsetnaked("zombie_last_stand", 2);
    }
    game.state = #"postgame";
    level.ingraceperiod = 0;
    level.intermission = 1;
    setdvar(#"g_gameended", 1);
    if (!isdefined(level.var_21e22beb)) {
        level.var_21e22beb = gettime();
    }
    var_7da9f0c = isdefined(level.var_bccd8271) ? level.var_bccd8271 : gettime() - level.var_21e22beb;
    if (!isdefined(level.n_gameplay_start_time)) {
        level.n_gameplay_start_time = gettime();
    }
    level clientfield::set("gameplay_started", 0);
    level clientfield::set("game_end_time", int((gettime() - level.n_gameplay_start_time + 500) / 1000));
    level clientfield::set("zesn", 1);
    if (isdefined(level.var_ea32773)) {
        level [[ level.var_ea32773 ]](waitresult);
    }
    recordgameresult(level.winningteam);
    globallogic::function_6c8d7c31(level.winningteam);
    globallogic_player::recordactiveplayersendgamematchrecordstats();
    players = getplayers();
    clientnums = [];
    foreach (player in players) {
        player globallogic_player::freezeplayerforroundend();
        if (isbot(player)) {
            continue;
        }
        player thread globallogic::roundenddof(4);
        player closeingamemenu();
        player closemenu("StartMenu_Main");
        if (!isdefined(player.pers[#"hash_76fbbcf94dab5536"])) {
            player persistence::function_acac764e();
        }
        player persistence::set_recent_stat(0, 0, #"outcome", player.pers[#"outcome"]);
        player persistence::set_recent_stat(0, 0, #"valid", 1);
        player persistence::set_recent_stat(0, 0, #"deaths", player.deaths);
        player persistence::set_recent_stat(0, 0, #"kills", player.kills);
        player persistence::set_recent_stat(0, 0, #"score", player.pers[#"score"]);
        player persistence::set_recent_stat(0, 0, #"damage", int(isdefined(player.pers[#"damagedone"]) ? player.pers[#"damagedone"] : 0));
        clientnum = player getentitynumber();
        clientnums[clientnum] = clientnum;
        player zm_stats::function_9daadcaa(#"clientnum", clientnum);
        characterindex = player getcharacterbodytype();
        player zm_stats::function_9daadcaa(#"characterindex", characterindex);
        player zm_stats::function_9daadcaa(#"lobbypopup", #"summary");
        player zm_stats::function_9daadcaa(#"difficulty", level.gamedifficulty);
        player zm_stats::function_9daadcaa(#"gametype", level.var_12323003);
        if (level.var_ff482f76 zm_laststand_client::is_open(player)) {
            level.var_ff482f76 zm_laststand_client::close(player);
        }
        gamelength = globallogic::getgamelength();
        player globallogic::bbplayermatchend(gamelength);
        player persistence::set_recent_stat(0, 0, #"timeplayed", int(gamelength));
        if (player ishost() && zm_utility::function_1a01f2f7(player)) {
            function_31f24041();
        }
    }
    function_c5c3929(clientnums);
    if (!is_true(level.host_ended_game)) {
        level callback::callback(#"hash_3b7d3ed9e484ef72");
    }
    level notify(#"game_ended");
    level callback::callback(#"hash_3ca80e35288a78d0");
    function_1bcdea84();
    if (!is_true(level.host_ended_game)) {
        thread challenges::gameend(level.winningteam);
    }
    skillupdate();
    if (zm_utility::is_survival()) {
        level.gameendtime = gettime();
        level.gameended = 1;
    }
    foreach (player in players) {
        player val::set(#"end_game", "ignoreme", 1);
        player enableinvulnerability();
        if (!isdefined(player.score_total)) {
            player.score_total = 0;
        }
        player.score = player.score_total;
        player notify(#"stop_ammo_tracking");
        player clientfield::set("zmbLastStand", 0);
    }
    if (!zm_utility::is_survival()) {
        level thread function_6c369691();
    }
    surveyid = function_70171add();
    for (i = 0; i < players.size; i++) {
        if (sessionmodeisonlinegame()) {
            players[i] stats::function_7a850245(#"demofileid", getdemofileid());
            players[i] stats::function_7a850245(#"matchid", getmatchid());
            if (level.rankedmatch) {
                players[i] stats::function_7a850245(#"surveyid", surveyid);
            }
        }
        if (players[i] laststand::player_is_in_laststand()) {
            players[i] recordplayerdeathzombies();
            players[i] zm_stats::increment_player_stat("deaths");
            players[i] zm_stats::increment_client_stat("deaths");
            players[i] zm_stats::function_8f10788e("boas_deaths");
        }
    }
    stopallrumbles();
    zombie_utility::set_zombie_var(#"zombie_powerup_insta_kill_time", 0);
    zombie_utility::set_zombie_var(#"zombie_powerup_fire_sale_time", 0);
    zombie_utility::set_zombie_var(#"zombie_powerup_double_points_time", 0);
    wait(0.1);
    if (!isdefined(level._supress_survived_screen)) {
        var_5c965b78 = 0;
        if (is_true(level.var_458eec65)) {
            var_5c965b78 = 1;
        }
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            players[i] setclientuivisibilityflag("hud_visible", 0);
            players[i] display_transition::function_d7b5082e();
            level.var_7c7c6c35 zm_game_over::open(players[i]);
            level.var_7c7c6c35 zm_game_over::set_rounds(players[i], level.round_number - zm_custom::function_901b751c(#"startround") + var_5c965b78);
        }
        if (waitresult.reason === #"hash_4e5756202af6ae94" || waitresult.reason === #"last_player_died" || waitresult.reason === #"hash_22a0611dcd352614") {
            playsoundatposition(#"hash_3f1eca72dab56b29", (0, 0, 0));
        }
    } else if ("ztrials" == util::get_game_type()) {
        zm_trial_util::function_2ee2d021();
    }
    if (isdefined(level.var_77805e8)) {
        level [[ level.var_77805e8 ]]();
    }
    players = getplayers();
    foreach (player in players) {
        player setclientuivisibilityflag("weapon_hud_visible", 0);
        player setclientminiscoreboardhide(1);
    }
    zm_stats::update_players_stats_at_match_end(players);
    zm_stats::update_global_counters_on_match_end();
    zm_stats::set_match_stat("gameLength", var_7da9f0c);
    foreach (player in getplayers()) {
        player zm_stats::function_9daadcaa("gameLength", var_7da9f0c);
        player zm_stats::function_ae547e45("boas_gameLength", var_7da9f0c);
        player zm_stats::function_ae547e45("boas_numZombieRounds", level.round_number);
        player zm_stats::function_ae547e45("boas_score", player.score);
        if (isdefined(level.var_211e3a53)) {
            player zm_stats::function_ae547e45("boas_gameType", level.var_211e3a53);
            continue;
        }
        player zm_stats::function_ae547e45("boas_gameType", util::get_game_type());
    }
    zm_stats::function_ea5b4947(1, 1);
    if (!zm_utility::is_survival()) {
        upload_leaderboards();
        recordnumzombierounds(level.round_number);
    }
    finalizematchrecord();
    players = getplayers();
    foreach (player in players) {
        if (isdefined(player.sessionstate) && player.sessionstate == "spectator") {
            player thread end_game_player_was_spectator();
        }
    }
    waitframe(1);
    /#
        if (!is_true(level.host_ended_game) && getdvarint(#"hash_2a088de8afba1c99", 0) > 1) {
            luinotifyevent(#"force_scoreboard", 0);
            map_restart(1);
            wait(666);
        }
    #/
    luinotifyevent(#"force_scoreboard", 1, 1);
    if (!zm_utility::function_c200446c()) {
        intermission();
    }
    if (getdvar(#"hash_4413f876155a89bd", 0)) {
        restart_prompt();
    }
    if (zm_trial::is_trial_mode()) {
        level thread zm_trial_util::function_f79b96ac();
    }
    if (potm::function_afe21831() == 0) {
        wait(zombie_utility::get_zombie_var(#"zombie_intermission_time"));
    }
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        if (level.var_7c7c6c35 zm_game_over::is_open(players[i])) {
            level.var_7c7c6c35 zm_game_over::close(players[i]);
        }
    }
    level notify(#"stop_intermission");
    array::thread_all(getplayers(), &zm_player::player_exit_level);
    wait(1.5);
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        players[i] cameraactivate(0);
    }
    /#
        if (!is_true(level.host_ended_game) && getdvarint(#"hash_2a088de8afba1c99", 0)) {
            luinotifyevent(#"force_scoreboard", 1, 0);
            map_restart(1);
            wait(666);
        }
    #/
    gamestate::set_state(#"shutdown");
    stats::function_ca76d4a();
    exitlevel(0);
    wait(666);
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xbbbcb79f, Offset: 0xba68
// Size: 0x54
function end_game_player_was_spectator() {
    waitframe(1);
    if (isdefined(self)) {
        self ghost();
        self val::set(#"end_game_player_was_spectator", "freezecontrols", 1);
    }
}

// Namespace zm/zm
// Params 1, eflags: 0x0
// Checksum 0x9fd27c4d, Offset: 0xbac8
// Size: 0x2e
function disable_end_game_intermission(delay) {
    level.disable_intermission = 1;
    wait(delay);
    level.disable_intermission = undefined;
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x8faaf67f, Offset: 0xbb00
// Size: 0x3c
function check_end_game_intermission_delay() {
    if (isdefined(level.disable_intermission)) {
        while (true) {
            if (!isdefined(level.disable_intermission)) {
                break;
            }
            wait(0.01);
        }
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x3ace31d5, Offset: 0xbb48
// Size: 0x54
function upload_leaderboards() {
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        players[i] uploadleaderboards();
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xbb0a7984, Offset: 0xbba8
// Size: 0x64
function initializestattracking() {
    level.global_zombies_killed = 0;
    level.zombies_timeout_spawn = 0;
    level.zombies_timeout_playspace = 0;
    level.zombies_timeout_undamaged = 0;
    level.zombie_player_killed_count = 0;
    level.zombie_trap_killed_count = 0;
    level.zombie_pathing_failed = 0;
    level.zombie_breadcrumb_failed = 0;
}

// Namespace zm/zm
// Params 1, eflags: 0x0
// Checksum 0xc56bd887, Offset: 0xbc18
// Size: 0x18e
function to_mins(seconds) {
    hours = 0;
    minutes = 0;
    if (seconds > 59) {
        minutes = int(seconds / 60);
        seconds = int(seconds * 1000) % 60000;
        seconds *= 0.001;
        if (minutes > 59) {
            hours = int(minutes / 60);
            minutes = int(minutes * 1000) % 60000;
            minutes *= 0.001;
        }
    }
    if (hours < 10) {
        hours = "0" + hours;
    }
    if (minutes < 10) {
        minutes = "0" + minutes;
    }
    seconds = int(seconds);
    if (seconds < 10) {
        seconds = "0" + seconds;
    }
    combined = "" + hours + ":" + minutes + ":" + seconds;
    return combined;
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x844c0d58, Offset: 0xbdb0
// Size: 0x14c
function function_dccccaf2() {
    self closeingamemenu();
    self closemenu("StartMenu_Main");
    self notify(#"player_intermission");
    self endon(#"player_intermission");
    level endon(#"stop_intermission");
    self endon(#"disconnect", #"death");
    self notify(#"_zombie_game_over");
    self.score = self.score_total;
    wait(0.51);
    self lui::screen_fade_out(1);
    level waittill(#"play_potm");
    self lui::screen_fade_in(0.1);
    level waittill(#"potm_finished");
    self lui::screen_fade_out(2);
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xd05bad3c, Offset: 0xbf08
// Size: 0x21c
function intermission() {
    potm_enabled = 0;
    if (potm::function_afe21831() > 0) {
        potm_enabled = 1;
    }
    level.intermission = 1;
    level notify(#"intermission");
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        players[i] setclientthirdperson(0);
        players[i] resetfov();
        players[i].health = players[i].maxhealth;
        if (potm_enabled) {
            players[i] thread function_dccccaf2();
        } else {
            players[i] thread [[ level.custom_intermission ]]();
        }
        players[i] stopsounds();
    }
    if (potm_enabled) {
        wait(5);
        level thread potm::play_potm(2);
        waitframe(1);
        level notify(#"play_potm");
        level waittill(#"potm_finished");
        wait(2.25);
        return;
    }
    wait(5.25);
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        players[i] clientfield::set("zmbLastStand", 0);
    }
    level thread zombie_game_over_death();
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xb7c6dd40, Offset: 0xc130
// Size: 0x194
function zombie_game_over_death() {
    zombies = getaiteamarray(level.zombie_team);
    for (i = 0; i < zombies.size; i++) {
        if (!isalive(zombies[i])) {
            continue;
        }
        zombies[i] setgoal(zombies[i].origin);
    }
    for (i = 0; i < zombies.size; i++) {
        if (!isalive(zombies[i])) {
            continue;
        }
        if (is_true(zombies[i].ignore_game_over_death)) {
            continue;
        }
        wait(0.5 + randomfloat(2));
        if (isdefined(zombies[i])) {
            if (!isvehicle(zombies[i])) {
                zombies[i] zombie_utility::zombie_head_gib();
            }
            zombies[i].allowdeath = 1;
            zombies[i] kill(zombies[i].origin, undefined, undefined, undefined, 0, 1);
        }
    }
}

/#

    // Namespace zm/zm
    // Params 1, eflags: 0x0
    // Checksum 0x29f656e9, Offset: 0xc2d0
    // Size: 0x32
    function fade_up_over_time(t) {
        self fadeovertime(t);
        self.alpha = 1;
    }

#/

// Namespace zm/zm
// Params 0, eflags: 0x0
// Checksum 0x78ee41e5, Offset: 0xc310
// Size: 0xe4
function default_exit_level() {
    zombies = getaiteamarray(level.zombie_team);
    for (i = 0; i < zombies.size; i++) {
        if (is_true(zombies[i].ignore_solo_last_stand)) {
            continue;
        }
        if (isdefined(zombies[i].find_exit_point)) {
            zombies[i] thread [[ zombies[i].find_exit_point ]]();
            continue;
        }
        if (zombies[i].ignoreme) {
            zombies[i] thread default_delayed_exit();
            continue;
        }
        zombies[i] thread default_find_exit_point();
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x349d1fa1, Offset: 0xc400
// Size: 0x74
function default_delayed_exit() {
    self endon(#"death");
    while (true) {
        if (!level flag::get("wait_and_revive")) {
            return;
        }
        if (!self.ignoreme) {
            break;
        }
        wait(0.1);
    }
    self thread default_find_exit_point();
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x671722c, Offset: 0xc480
// Size: 0x204
function default_find_exit_point() {
    self endon(#"death");
    player = util::gethostplayer();
    if (!isdefined(player)) {
        return;
    }
    dist_zombie = 0;
    dist_player = 0;
    dest = 0;
    away = vectornormalize(self.origin - player.origin);
    endpos = self.origin + vectorscale(away, 600);
    locs = [];
    if (isdefined(level.zm_loc_types[#"wait_location"]) && level.zm_loc_types[#"wait_location"].size > 0) {
        locs = array::randomize(level.zm_loc_types[#"wait_location"]);
    }
    for (i = 0; i < locs.size; i++) {
        dist_zombie = distancesquared(locs[i].origin, endpos);
        dist_player = distancesquared(locs[i].origin, player.origin);
        if (dist_zombie < dist_player) {
            dest = i;
            break;
        }
    }
    self notify(#"stop_find_flesh");
    self notify(#"zombie_acquire_enemy");
    if (isdefined(locs[dest])) {
        self setgoal(locs[dest].origin);
    }
}

// Namespace zm/zm
// Params 2, eflags: 0x0
// Checksum 0xc385d0bc, Offset: 0xc690
// Size: 0x122
function register_sidequest(id, sidequest_stat) {
    if (!isdefined(level.zombie_sidequest_stat)) {
        level.zombie_sidequest_previously_completed = [];
        level.zombie_sidequest_stat = [];
    }
    level.zombie_sidequest_stat[id] = sidequest_stat;
    level flag::wait_till("start_zombie_round_logic");
    level.zombie_sidequest_previously_completed[id] = 0;
    if (!level.onlinegame) {
        return;
    }
    if (is_true(level.zm_disable_recording_stats)) {
        return;
    }
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        if (players[i] zm_stats::get_global_stat(level.zombie_sidequest_stat[id])) {
            level.zombie_sidequest_previously_completed[id] = 1;
            return;
        }
    }
}

// Namespace zm/zm
// Params 1, eflags: 0x0
// Checksum 0x992861, Offset: 0xc7c0
// Size: 0x2a
function is_sidequest_previously_completed(id) {
    return is_true(level.zombie_sidequest_previously_completed[id]);
}

// Namespace zm/zm
// Params 1, eflags: 0x0
// Checksum 0x751f3f77, Offset: 0xc7f8
// Size: 0xdc
function set_sidequest_completed(id) {
    level notify(#"zombie_sidequest_completed", id);
    level.zombie_sidequest_previously_completed[id] = 1;
    if (!level.onlinegame) {
        return;
    }
    if (is_true(level.zm_disable_recording_stats)) {
        return;
    }
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        if (isdefined(level.zombie_sidequest_stat[id])) {
            players[i] zm_stats::add_global_stat(level.zombie_sidequest_stat[id], 1);
        }
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xfdc961e8, Offset: 0xc8e0
// Size: 0x1c4
function precache_zombie_leaderboards() {
    if (sessionmodeissystemlink()) {
        return;
    }
    globalleaderboards = "LB_ZM_GB_BULLETS_FIRED_AT ";
    globalleaderboards += "LB_ZM_GB_BULLETS_HIT_AT ";
    globalleaderboards += "LB_ZM_GB_DISTANCE_TRAVELED_AT ";
    globalleaderboards += "LB_ZM_GB_DOORS_PURCHASED_AT ";
    globalleaderboards += "LB_ZM_GB_GRENADE_KILLS_AT ";
    globalleaderboards += "LB_ZM_GB_HEADSHOTS_AT ";
    globalleaderboards += "LB_ZM_GB_KILLS_AT ";
    globalleaderboards += "LB_ZM_GB_PERKS_DRANK_AT ";
    globalleaderboards += "LB_ZM_GB_REVIVES_AT ";
    globalleaderboards += "LB_ZM_GB_KILLSTATS_MR ";
    globalleaderboards += "LB_ZM_GB_GAMESTATS_MR ";
    if (!level.rankedmatch && getdvarint(#"zm_private_rankedmatch", 0) == 0) {
        precacheleaderboards(globalleaderboards);
        return;
    }
    mapname = util::get_map_name();
    expectedplayernum = getnumexpectedplayers();
    mapleaderboard = "LB_ZM_MAP_" + getsubstr(mapname, 3, mapname.size) + "_" + expectedplayernum + "PLAYER";
    precacheleaderboards(globalleaderboards + mapleaderboard);
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0xa0caf5a3, Offset: 0xcab0
// Size: 0xb8
function increment_dog_round_stat(stat) {
    players = getplayers();
    foreach (player in players) {
        player zm_stats::increment_client_stat("zdog_rounds_" + stat);
    }
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0x8cef384b, Offset: 0xcb70
// Size: 0x120
function player_too_many_players_check() {
    max_players = 4;
    if (level.scr_zm_ui_gametype == "zgrief" || level.scr_zm_ui_gametype == "zmeat") {
        max_players = 8;
    }
    if (getplayers().size > max_players) {
        foreach (player in getplayers()) {
            player val::set(#"hash_1a88595aedca8cc4", "freezecontrols");
        }
        level notify(#"end_game");
    }
}

// Namespace zm/zm
// Params 1, eflags: 0x0
// Checksum 0xa3b229ff, Offset: 0xcc98
// Size: 0x46
function is_idgun_damage(weapon) {
    if (isdefined(level.idgun_weapons)) {
        if (isinarray(level.idgun_weapons, weapon)) {
            return true;
        }
    }
    return false;
}

// Namespace zm/zm
// Params 1, eflags: 0x0
// Checksum 0xe9f10e71, Offset: 0xcce8
// Size: 0x1ee
function function_a2b54d42(*event) {
    n_multiplier = zombie_utility::get_zombie_var(#"hash_1ab42b4d7db4cb3c");
    if (zm_utility::is_standard()) {
        switch (level.players.size) {
        case 1:
            n_multiplier *= 0.55;
            break;
        case 2:
            n_multiplier *= 0.75;
            break;
        case 3:
            n_multiplier *= 0.9;
            break;
        case 4:
            n_multiplier *= 1.1;
            break;
        default:
            n_multiplier *= 1.3;
            break;
        }
    } else {
        switch (level.players.size) {
        case 1:
            n_multiplier *= 0.63;
            break;
        case 2:
            n_multiplier *= 0.75;
            break;
        case 3:
            n_multiplier *= 0.8;
            break;
        case 4:
            n_multiplier *= 0.95;
            break;
        default:
            n_multiplier *= 1.1;
            break;
        }
    }
    return n_multiplier;
}

// Namespace zm/zm
// Params 1, eflags: 0x6 linked
// Checksum 0x975e197c, Offset: 0xcee0
// Size: 0xb4
function private function_70ce74eb(event) {
    var_326a8ea4 = isdefined(level.scoreinfo[event][#"medalnamehash"]) && level.scoreinfo[event][#"medalnamehash"] != #"";
    var_b6cc2245 = is_true(level.scoreinfo[event][#"hash_2ecf46b14fe1efc9"]);
    return var_326a8ea4 || var_b6cc2245;
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0xae088b3b, Offset: 0xcfa0
// Size: 0x1cc
function function_be95f56d(event) {
    if (function_70ce74eb(event)) {
        return 1;
    }
    var_900d44db = function_d3113f01();
    var_b0620785 = 1;
    var_20eefff5 = 1;
    if (!self function_8190887e(event)) {
        var_20eefff5 = var_900d44db.var_9efd3539;
        n_players = getplayers().size;
        var_b0620785 = var_900d44db.var_b5ce9d6d[n_players - 1];
    }
    var_652c6235 = function_7a2da789()[#"hash_16a3b3072a1b1e64"];
    var_debc856d = getdvarfloat(#"scr_xpscalezm", 1);
    var_1c6aa4bd = 1;
    if (is_true(level.var_41eb9e50)) {
        var_1c6aa4bd = getdvarfloat(#"hash_16b2dc4785de5e55", 0.5);
    }
    assert(isdefined(var_debc856d) && isdefined(var_652c6235) && isdefined(var_20eefff5) && isdefined(var_b0620785) && isdefined(var_1c6aa4bd), "<unknown string>");
    return var_b0620785 * var_20eefff5 * var_652c6235 * var_debc856d * var_1c6aa4bd;
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0x19791bf8, Offset: 0xd178
// Size: 0x12a
function function_2c96cf0e(event) {
    var_900d44db = function_d3113f01();
    n_players = getplayers().size;
    var_b0620785 = var_900d44db.var_a2a0937f[n_players - 1];
    var_b33e35e2 = function_be95f56d(event);
    if (var_b33e35e2 === 0) {
        var_b33e35e2 = 1;
    }
    var_1c6aa4bd = 1;
    if (is_true(level.var_41eb9e50)) {
        var_1c6aa4bd = getdvarfloat(#"hash_16b2dc4785de5e55", 0.5);
    }
    return var_900d44db.var_592f4307 * var_b0620785 * var_1c6aa4bd * getdvarfloat(#"scr_gunxpscalezm", 1) / var_b33e35e2;
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0x3d7fd57a, Offset: 0xd2b0
// Size: 0x72e
function function_d3113f01(var_bfe774a8) {
    var_ee65a0a8 = isdefined(level.var_acd0f67e) ? level.var_acd0f67e : 0;
    var_931577c = isdefined(function_302bd0b9().var_4f7d48d7) ? function_302bd0b9().var_4f7d48d7 : #"gamedata/tables/zm/zm_perroundxp.csv";
    /#
        assert(isdefined(var_931577c), "<unknown string>");
        assert(tablelookupcolumnforrow(var_931577c, 0, 0) == 1, "<unknown string>");
    #/
    if (!isdefined(var_bfe774a8)) {
        if (zm_utility::is_survival()) {
            var_bfe774a8 = zm_utility::function_e3025ca5();
        } else {
            var_bfe774a8 = zm_utility::get_round_number();
        }
    }
    if (level.var_a5464d2a !== var_931577c) {
        level.var_207e65ab = tablelookuprowcount(var_931577c);
        level.var_a5464d2a = var_931577c;
    }
    var_86c339ea = isdefined(level.var_207e65ab) ? level.var_207e65ab : tablelookuprowcount(var_931577c);
    round_number = min(var_bfe774a8, isdefined(var_86c339ea) ? var_86c339ea : 100);
    if (!isdefined(level.var_4b2568ad) || level.var_4b2568ad.round != round_number || level.var_4b2568ad.version != var_ee65a0a8) {
        var_ed316a9c = tablelookuprow(var_931577c, int(max(round_number, 1) - 1));
        var_3882466d = [var_ed316a9c[0]];
        for (i = 1; i < 17; i++) {
            col = i + var_ee65a0a8 * 16;
            if (!isdefined(var_3882466d)) {
                var_3882466d = [];
            } else if (!isarray(var_3882466d)) {
                var_3882466d = array(var_3882466d);
            }
            var_3882466d[var_3882466d.size] = var_ed316a9c[col];
        }
        var_ed316a9c = var_3882466d;
        /#
            for (col = 1; col < 17; col += 1) {
                if (!isdefined(var_ed316a9c[col])) {
                    println("<unknown string>" + var_bfe774a8 + "<unknown string>" + var_931577c);
                }
            }
        #/
        def = 0;
        parameters = {#var_bd588afd:isdefined(var_ed316a9c[1]) ? var_ed316a9c[1] : 0, #var_9efd3539:isdefined(var_ed316a9c[2]) ? var_ed316a9c[2] : def, #var_592f4307:isdefined(var_ed316a9c[3]) ? var_ed316a9c[3] : def, #var_c6f2635d:isdefined(var_ed316a9c[4]) ? var_ed316a9c[4] : def, #var_b5ce9d6d:[isdefined(var_ed316a9c[5]) ? var_ed316a9c[5] : def, isdefined(var_ed316a9c[6]) ? var_ed316a9c[6] : def, isdefined(var_ed316a9c[7]) ? var_ed316a9c[7] : def, isdefined(var_ed316a9c[8]) ? var_ed316a9c[8] : def], #var_a2a0937f:[isdefined(var_ed316a9c[9]) ? var_ed316a9c[9] : def, isdefined(var_ed316a9c[10]) ? var_ed316a9c[10] : def, isdefined(var_ed316a9c[11]) ? var_ed316a9c[11] : def, isdefined(var_ed316a9c[12]) ? var_ed316a9c[12] : def], #var_b93abbed:[isdefined(var_ed316a9c[13]) ? var_ed316a9c[13] : def, isdefined(var_ed316a9c[14]) ? var_ed316a9c[14] : def, isdefined(var_ed316a9c[15]) ? var_ed316a9c[15] : def, isdefined(var_ed316a9c[16]) ? var_ed316a9c[16] : def]};
        level.var_4b2568ad = {#round:round_number, #parameters:parameters, #version:var_ee65a0a8};
    } else {
        /#
            if (level.var_4b2568ad.version != var_ee65a0a8) {
                println("<unknown string>" + level.var_4b2568ad.version + "<unknown string>" + var_ee65a0a8);
            }
        #/
    }
    return level.var_4b2568ad.parameters;
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0xa2d1a1c1, Offset: 0xd9e8
// Size: 0x7a
function function_78e7b549(xp) {
    if (scoreevents::shouldaddrankxp(self)) {
        self.pers[#"totalmatchbonus"] = xp;
        self addrankxpvalue("match_end_xp", xp, 3);
        self.matchbonus = xp;
    }
}

// Namespace zm/zm
// Params 1, eflags: 0x6 linked
// Checksum 0xfc21fac2, Offset: 0xda70
// Size: 0x4e
function private function_ad7bd142(*item) {
    weapon = self getcurrentweapon();
    if (killstreaks::is_killstreak_weapon(weapon)) {
        return true;
    }
    return false;
}

// Namespace zm/zm
// Params 1, eflags: 0x6 linked
// Checksum 0x19a30b99, Offset: 0xdac8
// Size: 0x1a8
function private function_be26a3f3(*item) {
    var_e20637be = 1;
    nullweapon = getweapon(#"none");
    var_f945fa92 = getweapon(#"bare_hands");
    currentweapon = self getcurrentweapon();
    if (currentweapon != nullweapon && currentweapon != var_f945fa92 && !array::contains(level.var_faabb06f, currentweapon.name)) {
        maxammo = currentweapon.maxammo;
        currentammostock = self getweaponammostock(currentweapon);
        if (currentammostock < maxammo) {
            var_e20637be = 0;
        }
    }
    var_824ff7c7 = self getstowedweapon();
    if (var_824ff7c7 != nullweapon && var_824ff7c7 != var_f945fa92 && !array::contains(level.var_faabb06f, var_824ff7c7.name)) {
        maxammo = var_824ff7c7.maxammo;
        var_22baab7c = self getweaponammostock(var_824ff7c7);
        if (var_22baab7c < maxammo) {
            var_e20637be = 0;
        }
    }
    return var_e20637be;
}

// Namespace zm/zm
// Params 0, eflags: 0x6 linked
// Checksum 0x7b705ebc, Offset: 0xdc78
// Size: 0x2c
function private function_d87329b7() {
    if ((isdefined(self.maxarmor) ? self.maxarmor : 0) == 0) {
        return false;
    }
    return true;
}

// Namespace zm/zm
// Params 0, eflags: 0x6 linked
// Checksum 0x9b98181b, Offset: 0xdcb0
// Size: 0x46
function private function_1072c231() {
    if ((isdefined(self.maxarmor) ? self.maxarmor : 0) == 0) {
        return true;
    }
    if (self.armor < self.maxarmor) {
        return false;
    }
    return true;
}

// Namespace zm/zm
// Params 1, eflags: 0x6 linked
// Checksum 0xeedb1df4, Offset: 0xdd00
// Size: 0x15a
function private function_96184f63(item) {
    if (isdefined(item.itementry.talents) && isdefined(self.var_7341f980)) {
        foreach (talent in item.itementry.talents) {
            foreach (var_7387d8e1 in self.var_7341f980) {
                if (talent.talent == var_7387d8e1 || talent.talent == namespace_e86ffa8::function_cde018a9(var_7387d8e1)) {
                    return true;
                }
            }
        }
    }
    return false;
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0x7620ef10, Offset: 0xde68
// Size: 0x16
function function_fe1dd361(item) {
    return item.weaponoptions;
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0xae1ad65, Offset: 0xde88
// Size: 0x16
function function_b059ce9e(item) {
    return item.var_e91aba42;
}

// Namespace zm/zm
// Params 1, eflags: 0x2 linked
// Checksum 0xdce0d3ca, Offset: 0xdea8
// Size: 0x16
function function_8822a6d5(item) {
    return item.var_908f65ca;
}

// Namespace zm/zm
// Params 1, eflags: 0x6 linked
// Checksum 0x555d3ba3, Offset: 0xdec8
// Size: 0x2e
function private function_ce82b9ae(*weapon) {
    if (self laststand::player_is_in_laststand()) {
        return false;
    }
    return true;
}

// Namespace zm/zm
// Params 1, eflags: 0x6 linked
// Checksum 0xdcef0869, Offset: 0xdf00
// Size: 0x2a
function private function_d2e09320(item) {
    return zm_weapons::function_2bcaec6f(item.itementry.weapon);
}

// Namespace zm/zm
// Params 1, eflags: 0x6 linked
// Checksum 0x7019f0f8, Offset: 0xdf38
// Size: 0x796
function private function_85ea1f60(item) {
    if (self isswitchingweapons() || isdefined(self.laststandpistol) || self zm_utility::is_drinking() || is_true(self.var_bd5b6650) || is_true(self.var_b895a3ff)) {
        return 0;
    }
    if (is_true(getgametypesetting(#"hash_1e8998fd7f271bb7"))) {
        if (isdefined(item.itementry.name)) {
            var_b74300d3 = item.itementry.name;
            if (isarray(level.var_3a2ad19b) && isinarray(level.var_3a2ad19b, hash(var_b74300d3))) {
                if (self.health >= self.var_66cb03ad) {
                    return 0;
                } else {
                    return 1;
                }
            }
        }
    }
    if (item.itementry.name === #"self_revive_sr_item") {
        if (self zm_laststand::function_618fd37e() < 1) {
            return 1;
        } else {
            return 0;
        }
    }
    if (is_true(item.magic_box_weapon) || is_true(item.wallbuy_weapon) || is_true(item.var_864ea466)) {
        return 0;
    }
    var_5d43f96a = 1;
    if (isdefined(level.var_91f71aa[item.itementry.name])) {
        profilestart();
        var_5d43f96a = self [[ level.var_91f71aa[item.itementry.name] ]](item);
        profilestop();
    } else if (isdefined(level.var_d2ba1c27)) {
        profilestart();
        var_5d43f96a = self [[ level.var_d2ba1c27 ]](item);
        profilestop();
    }
    if (!is_true(var_5d43f96a)) {
        return 0;
    }
    switch (item.itementry.itemtype) {
    case #"quest":
        if (isdefined(item.var_d5fa8477) && (self zm_intel::function_f0f36d47(item.var_d5fa8477) || isdefined(item.var_b09e2381) && self.name != item.var_b09e2381)) {
            return 0;
        } else if (is_true(self.var_c8f9547a) && item.itementry.name === "item_zmquest_tungsten_mq_quest_part_shard") {
            return 0;
        } else if (is_true(self.var_a74ce90c) && item.itementry.name === "item_zmquest_tungsten_mq_quest_part_refuel") {
            return 0;
        }
        if (isdefined(level.var_217d3a3b) && isdefined(item.itementry.name) && isdefined(level.var_217d3a3b[item.itementry.name])) {
            if (!is_true([[ level.var_217d3a3b[item.itementry.name] ]]())) {
                return 0;
            }
        }
        return 1;
    case #"armor":
        if (item.itementry.var_4a1a4613 === #"armor_heal") {
            return (!self function_d87329b7() || !self function_1072c231() || self.armortier < (isdefined(item.itementry.armortier) ? item.itementry.armortier : 1));
        } else {
            return 1;
        }
        break;
    case #"weapon":
    case #"scorestreak":
        return (!self function_ad7bd142(item) && self zm_weapons::function_2bcaec6f(item.itementry.weapon));
    case #"survival_ammo":
        return !self function_be26a3f3(item);
    case #"survival_armor_shard":
        return !self function_1072c231();
    case #"survival_perk":
        return !self function_96184f63(item);
    case #"survival_upgrade_item":
        return self zm_weapons::function_106ff01d(item);
    case #"equipment":
        lethal = self.inventory.items[7];
        if (lethal.networkid != 32767) {
            if (item.itementry.name === lethal.itementry.name && lethal.count >= lethal.itementry.stackcount) {
                return 0;
            } else {
                return 1;
            }
        } else {
            return 1;
        }
        break;
    case #"tactical":
        tactical = self.inventory.items[13];
        if (tactical.networkid != 32767) {
            if (item.itementry.name === tactical.itementry.name && tactical.count >= tactical.itementry.stackcount) {
                return 0;
            } else {
                return 1;
            }
        } else {
            return 1;
        }
        break;
    default:
        return 1;
    }
    return 1;
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xca6de21e, Offset: 0xe6d8
// Size: 0xd0
function register_perks() {
    perks = self.specialty;
    perks::perk_reset_all();
    if (isdefined(perks) && is_true(level.perksenabled)) {
        for (i = 0; i < perks.size; i++) {
            perk = perks[i];
            if (perk == #"specialty_null" || perk == #"weapon_null") {
                continue;
            }
            self perks::perk_setperk(perk);
        }
    }
    /#
    #/
}

// Namespace zm/zm
// Params 0, eflags: 0x2 linked
// Checksum 0xfa0e9feb, Offset: 0xe7b0
// Size: 0xec
function function_7ed465e4() {
    killstreakrules::createrule("hero_weapons", 0, 0);
    killstreakrules::addkillstreaktorule("hero_pineapplegun", "hero_weapons", 0, 0);
    killstreakrules::addkillstreaktorule("ultimate_turret", "hero_weapons", 0, 0);
    killstreakrules::addkillstreaktorule("chopper_gunner", "hero_weapons", 0, 0);
    killstreakrules::addkillstreaktorule("killstreak_sparrow", "hero_weapons", 0, 0);
    killstreakrules::addkillstreaktorule("recon_car", "hero_weapons", 0, 0);
}

/#

    // Namespace zm/zm
    // Params 0, eflags: 0x0
    // Checksum 0xe143be60, Offset: 0xe8a8
    // Size: 0x31c
    function printhashids() {
        println("<unknown string>");
        println("<unknown string>");
        foreach (powerup in level.zombie_powerups) {
            println(powerup.powerup_name + "<unknown string>" + powerup.hash_id);
        }
        println("<unknown string>");
        if (is_true(level.aat_in_use)) {
            foreach (aat in level.aat) {
                if (!isdefined(aat) || !isdefined(aat.name) || aat.name === "<unknown string>") {
                    continue;
                }
                println(aat.name + "<unknown string>" + aat.hash_id);
            }
        }
        println("<unknown string>");
        if (isdefined(level._custom_perks)) {
            foreach (perk in level._custom_perks) {
                if (!isdefined(perk) || !isdefined(perk.alias)) {
                    continue;
                }
                println(function_9e72a96(perk.alias) + "<unknown string>" + perk.alias);
            }
        }
        println("<unknown string>");
    }

#/
