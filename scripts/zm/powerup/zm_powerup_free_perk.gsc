// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_powerup_free_perk;

// Namespace zm_powerup_free_perk/zm_powerup_free_perk
// Params 0, eflags: 0x5
// Checksum 0xeb23ea57, Offset: 0x110
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"zm_powerup_free_perk", &preinit, undefined, undefined, undefined);
}

// Namespace zm_powerup_free_perk/zm_powerup_free_perk
// Params 0, eflags: 0x6 linked
// Checksum 0x394c1005, Offset: 0x158
// Size: 0x9c
function private preinit() {
    zm_powerups::register_powerup("free_perk", &grab_free_perk);
    if (zm_powerups::function_cc33adc8()) {
        str_model = zm_powerups::function_bcfcc27e();
        zm_powerups::add_zombie_powerup("free_perk", str_model, #"hash_165c84a677f7a58c", &zm_powerups::func_should_never_drop, 0, 0, 0);
    }
}

// Namespace zm_powerup_free_perk/zm_powerup_free_perk
// Params 1, eflags: 0x2 linked
// Checksum 0x4b76a0c3, Offset: 0x200
// Size: 0x128
function grab_free_perk(*var_a3878cd) {
    foreach (e_player in getplayers()) {
        if (!e_player laststand::player_is_in_laststand() && e_player.sessionstate != "spectator") {
            var_16c042b8 = e_player zm_perks::function_b2cba45a();
        }
        if (isdefined(e_player) && isplayer(e_player) && isdefined(self.hint)) {
            e_player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", self.hint);
        }
    }
}

