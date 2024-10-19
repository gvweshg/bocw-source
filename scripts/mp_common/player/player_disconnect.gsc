// Atian COD Tools GSC CW decompiler test
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\gamerep.gsc;
#using scripts\mp_common\player\player_record.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\core_common\gamestate_util.gsc;

#namespace player;

// Namespace player/player_disconnect
// Params 0, eflags: 0x2 linked
// Checksum 0x5c59768d, Offset: 0x130
// Size: 0x704
function callback_playerdisconnect() {
    profilelog_begintiming(5, "ship");
    if (!gamestate::is_game_over() && !level.gameended) {
        gamelength = game.timepassed;
        self globallogic::bbplayermatchend(gamelength, "MP_PLAYER_DISCONNECT", 0);
        if (util::isroundbased()) {
            recordplayerstats(self, "playerQuitRoundNumber", game.roundsplayed + 1);
        }
        if (level.teambased) {
            ourteam = self.team;
            if (ourteam == #"allies" || ourteam == #"axis") {
                theirteam = "";
                if (ourteam == #"allies") {
                    theirteam = #"axis";
                } else if (ourteam == #"axis") {
                    theirteam = #"allies";
                }
                recordplayerstats(self, "playerQuitTeamScore", getteamscore(ourteam));
                recordplayerstats(self, "playerQuitOpposingTeamScore", getteamscore(theirteam));
            }
        }
        self player_record::function_96d38b95(#"disconnect");
    }
    arrayremovevalue(level.players, self);
    if (level.splitscreen) {
        players = level.players;
        if (players.size <= 1) {
            level thread globallogic::forceend();
        }
        setdvar(#"splitscreen_playernum", players.size);
    }
    if (isdefined(self.score) && isdefined(self.pers) && isdefined(self.pers[#"team"])) {
        /#
            print("<unknown string>" + self.pers[#"team"] + "<unknown string>" + self.score);
        #/
        level.dropteam += 1;
    }
    [[ level.onplayerdisconnect ]]();
    lpselfnum = self getentitynumber();
    self player_record::record_global_mp_stats_for_player_at_match_end();
    self player_record::record_special_move_data_for_life(undefined);
    self player_record::record_misc_player_stats();
    self gamerep::gamerepplayerdisconnected();
    for (entry = 0; entry < level.players.size; entry++) {
        if (level.players[entry] == self) {
            while (entry < level.players.size - 1) {
                level.players[entry] = level.players[entry + 1];
                entry++;
            }
            level.players[entry] = undefined;
            break;
        }
    }
    for (entry = 0; entry < level.players.size; entry++) {
        if (isdefined(level.players[entry].pers[#"killed_players"][self.name])) {
            level.players[entry].pers[#"killed_players"][self.name] = undefined;
        }
        if (isdefined(level.players[entry].pers[#"killed_players_with_specialist"][self.name])) {
            level.players[entry].pers[#"killed_players_with_specialist"][self.name] = undefined;
        }
        if (isdefined(level.players[entry].killedplayerscurrent[self.name])) {
            level.players[entry].killedplayerscurrent[self.name] = undefined;
        }
        if (isdefined(level.players[entry].pers[#"killed_by"][self.name])) {
            level.players[entry].pers[#"killed_by"][self.name] = undefined;
        }
        if (isdefined(level.players[entry].pers[#"nemesis_tracking"][self.name])) {
            level.players[entry].pers[#"nemesis_tracking"][self.name] = undefined;
        }
        if (level.players[entry].pers[#"nemesis_name"] === self.name) {
            level.players[entry] function_79915d44();
        }
    }
    if (level.gameended) {
        self globallogic::removedisconnectedplayerfromplacement();
    }
    level thread globallogic::updateteamstatus();
    level thread globallogic::updateallalivetimes();
    profilelog_endtiming(5, "gs=" + game.state);
}

// Namespace player/player_disconnect
// Params 0, eflags: 0x6 linked
// Checksum 0xf72bc6b, Offset: 0x840
// Size: 0x2c4
function private function_79915d44() {
    nemesisarray = self.pers[#"nemesis_tracking"];
    nemesisamount = 0;
    nemesisname = "";
    foreach (nemesis in nemesisarray) {
        if (nemesis.value > nemesisamount) {
            nemesisname = nemesis.name;
            nemesisamount = nemesis.value;
        }
    }
    assert(isdefined(nemesisname), "<unknown string>" + self.name);
    assert(isstring(nemesisname), "<unknown string>" + nemesisname + "<unknown string>" + self.name);
    self.pers[#"nemesis_name"] = nemesisname;
    if (nemesisname != "") {
        for (playerindex = 0; playerindex < level.players.size; playerindex++) {
            if (level.players[playerindex].name == nemesisname) {
                nemesisplayer = level.players[playerindex];
                self.pers[#"nemesis_rank"] = nemesisplayer.pers[#"rank"];
                self.pers[#"nemesis_rankicon"] = nemesisplayer.pers[#"rankxp"];
                self.pers[#"nemesis_xp"] = nemesisplayer.pers[#"prestige"];
                self.pers[#"nemesis_xuid"] = nemesisplayer getxuid();
                break;
            }
        }
        return;
    }
    self.pers[#"nemesis_xuid"] = "";
}

