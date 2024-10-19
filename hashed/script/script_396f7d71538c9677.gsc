// Atian COD Tools GSC CW decompiler test
#using scripts\weapons\weapon_utils.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace battlechatter;

// Namespace battlechatter/namespace_7819da81
// Params 1, eflags: 0x2 linked
// Checksum 0x98deaf76, Offset: 0x1c8
// Size: 0x80
function dialog_chance(chancekey) {
    dialogchance = mpdialog_value(chancekey);
    if (!isdefined(dialogchance) || dialogchance <= 0) {
        return false;
    } else if (dialogchance >= 100) {
        return true;
    }
    return randomint(100) < dialogchance;
}

// Namespace battlechatter/namespace_7819da81
// Params 2, eflags: 0x2 linked
// Checksum 0x5681f57e, Offset: 0x250
// Size: 0xa2
function mpdialog_value(mpdialogkey, defaultvalue) {
    if (!isdefined(mpdialogkey)) {
        return defaultvalue;
    }
    if (!isdefined(level.var_36301b61)) {
        level.var_36301b61 = getscriptbundle("mpdialog_default");
    }
    mpdialog = level.var_36301b61;
    if (!isdefined(mpdialog)) {
        return defaultvalue;
    }
    structvalue = mpdialog.(mpdialogkey);
    if (!isdefined(structvalue)) {
        return defaultvalue;
    }
    return structvalue;
}

// Namespace battlechatter/namespace_7819da81
// Params 1, eflags: 0x2 linked
// Checksum 0xb54bea41, Offset: 0x300
// Size: 0x42
function function_e05060f0(player) {
    playerbundle = function_58c93260(player);
    if (!isdefined(playerbundle)) {
        return undefined;
    }
    return playerbundle.voiceprefix;
}

// Namespace battlechatter/namespace_7819da81
// Params 2, eflags: 0x2 linked
// Checksum 0xeaedd196, Offset: 0x350
// Size: 0x130
function function_58c93260(player, meansofdeath) {
    if (!isplayer(player)) {
        return undefined;
    }
    bundlename = player getmpdialogname();
    if (!isdefined(bundlename)) {
        return undefined;
    }
    if (isdefined(meansofdeath) && meansofdeath == "MOD_META" && isdefined(self.pers) && (isdefined(self.pers[#"changed_specialist"]) ? self.pers[#"changed_specialist"] : 0)) {
        bundlename = self.var_89c4a60f;
    }
    if (!isdefined(level.var_acb08231)) {
        level.var_acb08231 = [];
    }
    if (!isdefined(level.var_acb08231[bundlename])) {
        level.var_acb08231[bundlename] = getscriptbundle(bundlename);
    }
    return level.var_acb08231[bundlename];
}

// Namespace battlechatter/namespace_7819da81
// Params 1, eflags: 0x2 linked
// Checksum 0x3d970c8e, Offset: 0x488
// Size: 0xb0
function function_cdd81094(weapon) {
    assert(isdefined(weapon));
    if (!isdefined(weapon.var_5c238c21)) {
        return undefined;
    }
    if (!isdefined(level.var_acb08231)) {
        level.var_acb08231 = [];
    }
    if (!isdefined(level.var_acb08231[weapon.var_5c238c21])) {
        level.var_acb08231[weapon.var_5c238c21] = getscriptbundle(weapon.var_5c238c21);
    }
    return level.var_acb08231[weapon.var_5c238c21];
}

// Namespace battlechatter/namespace_7819da81
// Params 0, eflags: 0x2 linked
// Checksum 0x606d9a, Offset: 0x540
// Size: 0x2c
function function_e1983f22() {
    return sessionmodeismultiplayergame() || sessionmodeiszombiesgame();
}

// Namespace battlechatter/namespace_7819da81
// Params 3, eflags: 0x2 linked
// Checksum 0x21304202, Offset: 0x578
// Size: 0x196
function function_d804d2f0(speakingplayer, player, allyradiussq) {
    if (!isdefined(player) || !isdefined(player.origin) || !isdefined(speakingplayer) || !isdefined(speakingplayer.origin) || !isalive(player) || player.sessionstate != "playing" || player.playingdialog || player isplayerunderwater() || player isremotecontrolling() || player isinvehicle() || player isweaponviewonlylinked() || player == speakingplayer || player.team != speakingplayer.team || player.playerrole == speakingplayer.playerrole || player hasperk(#"specialty_quieter")) {
        return false;
    }
    distsq = distancesquared(speakingplayer.origin, player.origin);
    if (distsq > allyradiussq) {
        return false;
    }
    return true;
}

// Namespace battlechatter/namespace_7819da81
// Params 2, eflags: 0x2 linked
// Checksum 0x80dfce1d, Offset: 0x718
// Size: 0x152
function function_5d15920e(dialogkey, playerbundle) {
    if (dialogkey === playerbundle.exertdeathdrowned) {
        return "MOD_DROWN";
    }
    if (dialogkey === playerbundle.var_44d86dec) {
        return "MOD_EXPLOSIVE";
    }
    if (dialogkey === playerbundle.exertdeathburned) {
        return "MOD_BURNED";
    }
    if (dialogkey === playerbundle.var_207908de) {
        return "MOD_HEAD_SHOT";
    }
    if (dialogkey === playerbundle.var_1dfcabbd) {
        return "MOD_FALLING";
    }
    if (dialogkey === playerbundle.exertdeath) {
        return "MOD_UNKNOWN";
    }
    if (dialogkey === playerbundle.var_48305ed9) {
        return "MOD_DOT_SELF";
    }
    if (dialogkey === playerbundle.var_f8b4bcc1) {
        return "MOD_DOT";
    }
    if (dialogkey === playerbundle.exertdeathstabbed) {
        return "MOD_MELEE_ASSASSINATE";
    }
    if (dialogkey === playerbundle.exertdeathelectrocuted) {
        return "MOD_ELECTROCUTED";
    }
    if (dialogkey === playerbundle.var_53f25688) {
        return "MOD_MELEE_WEAPON_BUTT";
    }
    if (dialogkey === playerbundle.var_7a45f37b) {
        return "MOD_GAS";
    }
    if (dialogkey === playerbundle.var_35f92256) {
        return "MOD_CRUSH";
    }
    return "MOD_UNKNOWN";
}

// Namespace battlechatter/namespace_7819da81
// Params 1, eflags: 0x2 linked
// Checksum 0x5fc774fc, Offset: 0x878
// Size: 0x102
function get_closest_player_ally(teamonly) {
    if (!level.teambased) {
        return undefined;
    }
    players = self get_friendly_players();
    players = arraysort(players, self.origin);
    foreach (player in players) {
        if (player == self || !player can_play_dialog(teamonly)) {
            continue;
        }
        return player;
    }
    return undefined;
}

// Namespace battlechatter/namespace_7819da81
// Params 2, eflags: 0x2 linked
// Checksum 0x84625b26, Offset: 0x988
// Size: 0xfe
function get_closest_player_enemy(origin, teamonly) {
    if (!isdefined(self.team)) {
        return undefined;
    }
    if (!isdefined(origin)) {
        origin = self.origin;
    }
    players = self get_enemy_players();
    players = arraysort(players, origin);
    foreach (player in players) {
        if (!player can_play_dialog(teamonly)) {
            continue;
        }
        return player;
    }
    return undefined;
}

// Namespace battlechatter/namespace_7819da81
// Params 1, eflags: 0x2 linked
// Checksum 0x40925f88, Offset: 0xa90
// Size: 0x100
function can_play_dialog(teamonly) {
    if (!isplayer(self) || !isalive(self) || self.playingdialog === 1 || self isplayerunderwater() || self isremotecontrolling() || self isinvehicle() || self isweaponviewonlylinked()) {
        return false;
    }
    if (isdefined(teamonly) && !teamonly && self hasperk(#"specialty_quieter")) {
        return false;
    }
    return true;
}

// Namespace battlechatter/namespace_7819da81
// Params 0, eflags: 0x2 linked
// Checksum 0x98738cd1, Offset: 0xb98
// Size: 0xc8
function get_friendly_players() {
    players = [];
    if (level.teambased && isdefined(self.team)) {
        foreach (player in function_a1ef346b(self.team)) {
            players[players.size] = player;
        }
    } else {
        players[0] = self;
    }
    return players;
}

// Namespace battlechatter/namespace_7819da81
// Params 0, eflags: 0x2 linked
// Checksum 0x755414d0, Offset: 0xc68
// Size: 0x1be
function get_enemy_players() {
    players = [];
    if (level.teambased) {
        foreach (team, _ in level.teams) {
            if (team == self.team) {
                continue;
            }
            foreach (player in function_a1ef346b(team)) {
                players[players.size] = player;
            }
        }
    } else {
        foreach (player in function_a1ef346b()) {
            if (player != self) {
                players[players.size] = player;
            }
        }
    }
    return players;
}

// Namespace battlechatter/namespace_7819da81
// Params 1, eflags: 0x0
// Checksum 0x17d8665c, Offset: 0xe30
// Size: 0xfa
function function_94b5718c(*entity) {
    selfeye = self geteyeapprox();
    foreach (enemy in get_enemy_players()) {
        if (!isdefined(enemy)) {
            continue;
        }
        enemyeye = enemy geteyeapprox();
        if (sighttracepassed(selfeye, enemyeye, 0, enemy)) {
            return enemy;
        }
    }
    return undefined;
}

// Namespace battlechatter/namespace_7819da81
// Params 1, eflags: 0x0
// Checksum 0x280e6de6, Offset: 0xf38
// Size: 0xb4
function get_random_key(dialogkey) {
    bundlename = self getmpdialogname();
    if (!isdefined(bundlename)) {
        return undefined;
    }
    if (!isdefined(level.var_f53efe5c[bundlename]) || !isdefined(level.var_f53efe5c[bundlename][dialogkey]) || level.var_f53efe5c[bundlename][dialogkey] == 0) {
        return dialogkey;
    }
    return dialogkey + randomint(level.var_f53efe5c[bundlename][dialogkey]);
}

// Namespace battlechatter/namespace_7819da81
// Params 2, eflags: 0x2 linked
// Checksum 0xd2b19b25, Offset: 0xff8
// Size: 0x1f0
function get_player_dialog_alias(dialogkey, meansofdeath) {
    if (!isplayer(self)) {
        return undefined;
    }
    bundlename = self getmpdialogname();
    if (isdefined(meansofdeath) && meansofdeath == "MOD_META" && (isdefined(self.pers[#"changed_specialist"]) ? self.pers[#"changed_specialist"] : 0)) {
        bundlename = self.var_89c4a60f;
    }
    if (!isdefined(bundlename)) {
        return undefined;
    }
    playerbundle = getscriptbundle(bundlename);
    if (!isdefined(playerbundle)) {
        return undefined;
    }
    if (!isdefined(playerbundle) || !isdefined(dialogkey)) {
        return undefined;
    }
    if (ishash(dialogkey)) {
        if (isdefined(level.var_4edd846)) {
            dialogalias = self [[ level.var_4edd846 ]](playerbundle, dialogkey);
        } else {
            /#
                iprintlnbold("<unknown string>" + function_9e72a96(dialogkey) + "<unknown string>");
            #/
        }
    } else {
        dialogalias = playerbundle.(dialogkey);
    }
    if (!isdefined(dialogalias)) {
        return;
    }
    if (!ishash(dialogalias)) {
        voiceprefix = playerbundle.voiceprefix;
        if (isdefined(voiceprefix)) {
            dialogalias = voiceprefix + dialogalias;
        }
    }
    return dialogalias;
}

// Namespace battlechatter/namespace_7819da81
// Params 2, eflags: 0x0
// Checksum 0xc4684c4d, Offset: 0x11f0
// Size: 0x102
function function_db89c38f(speakingplayer, allyradiussq) {
    allies = [];
    foreach (player in level.players) {
        if (!function_d804d2f0(speakingplayer, player, allyradiussq)) {
            continue;
        }
        allies[allies.size] = player;
    }
    allies = arraysort(allies, speakingplayer.origin);
    if (!isdefined(allies) || allies.size == 0) {
        return undefined;
    }
    return allies[0];
}

// Namespace battlechatter/namespace_7819da81
// Params 2, eflags: 0x2 linked
// Checksum 0x366ec6db, Offset: 0x1300
// Size: 0x6c
function pick_boost_players(player1, player2) {
    player1 clientfield::set("play_boost", 1);
    player2 clientfield::set("play_boost", 2);
    game.boostplayerspicked[player1.team] = 1;
}

