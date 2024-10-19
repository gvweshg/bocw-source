// Atian COD Tools GSC CW decompiler test
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_9bef0a98;

// Namespace namespace_9bef0a98/namespace_9bef0a98
// Params 0, eflags: 0x2 linked
// Checksum 0x39828077, Offset: 0x20e8
// Size: 0x191c
function function_fd4107e4() {
    namespace_e32bb68::function_c1e0cc87("zmb_ragdoll_launched");
    namespace_e32bb68::function_c1e0cc87("fly_door_locked");
    namespace_e32bb68::function_c1e0cc87("fly_open_door");
    namespace_e32bb68::function_c1e0cc87("zmb_box_interact");
    namespace_e32bb68::function_c1e0cc87("zmb_chest_explode");
    namespace_e32bb68::function_c1e0cc87("zmb_pwup_slowspeed_loop");
    namespace_e32bb68::function_c1e0cc87("zmb_pwup_slowspeed_end");
    namespace_e32bb68::function_c1e0cc87("zmb_egg_hatch");
    namespace_e32bb68::function_c1e0cc87("zmb_egg_shake");
    namespace_e32bb68::function_c1e0cc87("zmb_explode");
    namespace_e32bb68::function_c1e0cc87("zmb_basket_explode");
    namespace_e32bb68::function_c1e0cc87("zmb_aat_kilowatt_explode");
    namespace_e32bb68::function_c1e0cc87("wpn_doa_buzzsaw_impact_zombie");
    namespace_e32bb68::function_c1e0cc87("evt_doa_player_shield_start");
    namespace_e32bb68::function_c1e0cc87("evt_doa_player_shield_full");
    namespace_e32bb68::function_c1e0cc87("evt_doa_player_shield_half");
    namespace_e32bb68::function_c1e0cc87("evt_doa_player_shield_stop");
    namespace_e32bb68::function_c1e0cc87("evt_doa_player_death");
    namespace_e32bb68::function_c1e0cc87("evt_doa_powerup_boost_activate");
    namespace_e32bb68::function_c1e0cc87("evt_doa_powerup_boost_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_powerup_nuke_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_weapon_charge_start");
    namespace_e32bb68::function_c1e0cc87("evt_doa_weapon_charge_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_weapon_charge_end");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_default_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_default_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_default_despawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_default_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_gem_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_gem_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_gem_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_money_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_money_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_money_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_weapon_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_weapon_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_weapon_upgraded");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_weapon_downgraded");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_chicken_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_chicken_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_chicken_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_chicken_despawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_chicken_squawk");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_chicken_squawk_spinout");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_chicken_explode");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_key_unlock");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_key_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_key_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_barrel_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_barrel_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_barrel_active_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_barrel_active_impact");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_barrel_active_end");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_boots_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_boots_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_boots_active_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_boxers_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_boxers_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_boxers_active_impact");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_boxers_active_end");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_clock_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_clock_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_clock_active_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_clock_active_end");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_coatofarms_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_coatofarms_active_start");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_coatofarms_active_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_coatofarms_active_end");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_coatofarms_zombie_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_extralife_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_extralife_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_firstperson_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_firstperson_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_firstperson_end");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_giftbox_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_giftbox_activated");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_giftbox_explode");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_giftbox_fireworks");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_magichat_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_magichat_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_magichat_clone_appear");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_magichat_clone_disappear");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_healthpotion_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_healthpotion_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_magnet_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_magnet_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_magnet_active_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_magnet_active_end");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_monkeybomb_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_monkeybomb_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_monkeybomb_music");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_monkeybomb_byebye");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_monkeybomb_explode");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_sawblade_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_sawblade_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_sawblade_active_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_sawblade_active_impact");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_sawblade_lose_blade");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_sentry_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_sentry_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_sentry_land");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_sentry_takeoff");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_skeleton_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_skeleton_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_sprinkler_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_sprinkler_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_sprinkler_land");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_sprinkler_takeoff");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_teddybear_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_teddybear_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_teddybear_active_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_teddybear_repulse");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_teddybear_active_end");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_teslaball_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_teslaball_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_teslaball_active_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_teslaball_active_end");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_teslaball_impact");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_umbrella_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_umbrella_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_umbrella_storm_2d_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_umbrella_storm_2d_end");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_arcade_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_arcade_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_arcade_active_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_vortex_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_vortex_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_vortex_active_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_vortex_explode");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_missileturret_fire");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_hind_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_hind_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_tank_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_tank_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_mech_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_pickup_mech_consumed");
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_flogger_eng_start");
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_flogger_eng_stop");
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_flogger_whoosh_0");
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_flogger_whoosh_1");
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_flogger_impact");
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_flogger_eng_loop", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_pungi_spike_set");
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_pungi_spike_up");
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_pungi_spike_down");
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_pungi_spike_impact");
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_pole_warning");
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_pole_off");
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_pole_impact");
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_redbarrel_ignite");
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_redbarrel_fuse_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_redbarrel_warning");
    namespace_e32bb68::function_c1e0cc87("evt_doa_hazard_redbarrel_explosion");
    namespace_e32bb68::function_c1e0cc87("zmb_hellhound_bolt");
    namespace_e32bb68::function_c1e0cc87("zmb_magic_door_open");
    namespace_e32bb68::function_c1e0cc87("zmb_quad_explo");
    namespace_e32bb68::function_c1e0cc87("hallelujah");
    namespace_e32bb68::function_c1e0cc87("fate_denied");
    namespace_e32bb68::function_c1e0cc87("evt_doa_lightning_bolt");
    namespace_e32bb68::function_c1e0cc87("evt_doa_teleporter_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_teleporter_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_teleporter_bomb_explo");
    namespace_e32bb68::function_c1e0cc87("evt_doa_teleporter_spark");
    namespace_e32bb68::function_c1e0cc87("evt_doa_teleporter_bomb_fuse_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_teleporter_wilds_spawn");
    namespace_e32bb68::function_c1e0cc87("evt_doa_teleporter_wilds_burst");
    namespace_e32bb68::function_c1e0cc87("evt_doa_teleporter_wilds_lp", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_press_pad_down");
    namespace_e32bb68::function_c1e0cc87("zmb_press_pad_up");
    namespace_e32bb68::function_c1e0cc87("zmb_traps_blade_lp", 1);
    namespace_e32bb68::function_c1e0cc87("evt_doa_outro_gem_shower");
    namespace_e32bb68::function_c1e0cc87("evt_doa_outro_mamaback_takeoff");
    namespace_e32bb68::function_c1e0cc87("evt_doa_outro_mamaback_land");
    namespace_e32bb68::function_c1e0cc87("evt_doa_outro_mamaback_land_last");
    namespace_e32bb68::function_c1e0cc87("evt_doa_outro_raygun_fire");
    namespace_e32bb68::function_c1e0cc87("evt_doa_outro_raygun_impact");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_bfather_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_bfather_vocal_melee");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_bfather_vocal_missile");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_bfather_vocal_puke_start");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_bfather_vocal_puke_lp", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_bfather_vocal_puke_end");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_bfather_egg_explode");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_bfather_egg_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_bfather_missile_start");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_bfather_missile_lp", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_bfather_missile_imp");
    namespace_e32bb68::function_c1e0cc87("zmb_ai_gladiator_axe_lp", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_ai_gladiator_spawn_des");
    namespace_e32bb68::function_c1e0cc87("zmb_ai_gladiator_spawn_mar");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_demon_vocal_leap");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_demon_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_brutus_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_brutus_death");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_ghost_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_ghost_lp", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_ghost_explo");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_ghost_warp_out");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_ghost_warp_in");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_ghost_melee");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_margwa_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_meatball_lrg_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_meatball_lrg_lp", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_meatball_lrg_death");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_meatball_med_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_meatball_med_lp", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_meatball_med_death");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_meatball_sml_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_meatball_sml_lp", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_meatball_sml_death");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_skeleton_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_smokeman_lp", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_smokeman_teleport_out");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_smokeman_teleport_in_pre");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_smokeman_teleport_in");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_smokeman_death");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_spider_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_steiner_split_start");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_steiner_split_explode");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_werewolf_vocal_pain");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_werewolf_vocal_summon");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_hellhound_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_hellhound_vocal_sprint", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_hellhound_explode");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_plaguehound_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_plaguehound_vocal_sprint", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_plaguehound_explode");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_ghosthound_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_ghosthound_vocal_sprint", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_ghosthound_explode");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_hound_bite");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_gegenees_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_hellephant_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_bat_spawn");
    namespace_e32bb68::function_c1e0cc87("zmb_ai_gladiator_axe_throw");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_silverback_gather_lp", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_silverback_shield_lp", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_silverback_boost");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_silverback_jet_takeoff");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_silverback_jet_land");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_ai_silverback_banana_explo");
    namespace_e32bb68::function_c1e0cc87("evt_doa_travel_doors_chosen");
    namespace_e32bb68::function_c1e0cc87("evt_doa_travel_warning");
    namespace_e32bb68::function_c1e0cc87("zmb_water_geyser_sm_warn", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_water_geyser_active", 1);
    namespace_e32bb68::function_c1e0cc87("zmb_doom_door_good");
    namespace_e32bb68::function_c1e0cc87("zmb_doom_door_bad");
    namespace_e32bb68::function_c1e0cc87("evt_doa_stonedoor_open");
    namespace_e32bb68::function_c1e0cc87("evt_doa_stonedoor_close");
    namespace_e32bb68::function_c1e0cc87("evt_doa_stonedoor_close_fast");
    namespace_e32bb68::function_c1e0cc87("evt_doa_springboard");
    namespace_e32bb68::function_c1e0cc87("fly_doa_jump_plr");
    namespace_e32bb68::function_c1e0cc87("evt_doa_slideways_dead");
    namespace_e32bb68::function_c1e0cc87("zmb_doa_fireball_emit");
    namespace_e32bb68::function_c1e0cc87("zmb_special_chest_explode");
}

