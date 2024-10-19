// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\gametypes\globallogic_utils.gsc;
#using scripts\zm_common\gametypes\globallogic_score.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\gametypes\dev_class.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\dev_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace dev;

/#

    // Namespace dev/dev
    // Params 0, eflags: 0x5
    // Checksum 0x775afb45, Offset: 0x100
    // Size: 0x4c
    function private autoexec __init__system__() {
        system::register(#"dev", &preinit, undefined, undefined, #"spawnlogic");
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x4
    // Checksum 0x1ff2225, Offset: 0x158
    // Size: 0x2c
    function private preinit() {
        callback::on_start_gametype(&init);
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xdb9effd3, Offset: 0x190
    // Size: 0x258
    function init() {
        if (getdvarstring(#"scr_show_hq_spawns") == "<unknown string>") {
            setdvar(#"scr_show_hq_spawns", "<unknown string>");
        }
        if (!isdefined(getdvar(#"scr_testscriptruntimeerror"))) {
            setdvar(#"scr_testscriptruntimeerror", "<unknown string>");
        }
        thread testscriptruntimeerror();
        thread testdvars();
        thread devhelipathdebugdraw();
        thread devstraferunpathdebugdraw();
        thread globallogic_score::setplayermomentumdebug();
        thread dev_class::dev_cac_init();
        level.dem_spawns = [];
        if (level.gametype == "<unknown string>") {
            extra_spawns = [];
            extra_spawns[0] = "<unknown string>";
            extra_spawns[1] = "<unknown string>";
            extra_spawns[2] = "<unknown string>";
            extra_spawns[3] = "<unknown string>";
            for (i = 0; i < extra_spawns.size; i++) {
                points = getentarray(extra_spawns[i], "<unknown string>");
                if (isdefined(points) && points.size > 0) {
                    level.dem_spawns = arraycombine(level.dem_spawns, points, 1, 0);
                }
            }
        }
        callback::on_connect(&on_player_connect);
        for (;;) {
            updatedevsettings();
            wait(0.5);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x761b7b7c, Offset: 0x3f0
    // Size: 0x8
    function on_player_connect() {
        
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x6a561899, Offset: 0x400
    // Size: 0x2a8
    function updatehardpoints() {
        foreach (key, streak in level.killstreaks) {
            dvar = streak.devdvar;
            enemydvar = streak.devenemydvar;
            host = util::gethostplayer();
            if (isdefined(dvar) && getdvarint(dvar, 0) == 1) {
                foreach (player in level.players) {
                    if (is_true(level.usingmomentum) && is_true(level.usingscorestreaks)) {
                        player killstreaks::give(key);
                        continue;
                    }
                    if (isbot(player)) {
                        player.bot[#"killstreaks"] = [];
                        player.bot[#"killstreaks"][0] = killstreaks::get_menu_name(key);
                        killstreakweapon = killstreaks::get_killstreak_weapon(key);
                        player killstreaks::give_weapon(killstreakweapon, 1);
                        globallogic_score::_setplayermomentum(player, 2000);
                        continue;
                    }
                    player killstreaks::give(key);
                }
                setdvar(dvar, 0);
            }
        }
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0x20556174, Offset: 0x6b0
    // Size: 0x4c
    function warpalltohost(team) {
        host = util::gethostplayer();
        warpalltoplayer(team, host.name);
    }

    // Namespace dev/dev
    // Params 2, eflags: 0x0
    // Checksum 0xbec9a8bf, Offset: 0x708
    // Size: 0x31c
    function warpalltoplayer(team, player) {
        players = getplayers();
        target = undefined;
        for (i = 0; i < players.size; i++) {
            if (players[i].name == player) {
                target = players[i];
                break;
            }
        }
        if (isdefined(target)) {
            origin = target.origin;
            nodes = getnodesinradius(origin, 128, 32, 128, #"path");
            angles = target getplayerangles();
            yaw = (0, angles[1], 0);
            forward = anglestoforward(yaw);
            spawn_origin = origin + forward * 128 + (0, 0, 16);
            if (!bullettracepassed(target geteye(), spawn_origin, 0, target)) {
                spawn_origin = undefined;
            }
            for (i = 0; i < players.size; i++) {
                if (players[i] == target) {
                    continue;
                }
                if (isdefined(team)) {
                    if (strstartswith(team, "<unknown string>") && target.team == players[i].team) {
                        continue;
                    }
                    if (strstartswith(team, "<unknown string>") && target.team != players[i].team) {
                        continue;
                    }
                }
                if (isdefined(spawn_origin)) {
                    players[i] setorigin(spawn_origin);
                    continue;
                }
                if (nodes.size > 0) {
                    node = array::random(nodes);
                    players[i] setorigin(node.origin);
                    continue;
                }
                players[i] setorigin(origin);
            }
        }
        setdvar(#"scr_playerwarp", "<unknown string>");
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x887c8a87, Offset: 0xa30
    // Size: 0x424
    function updatedevsettingszm() {
        if (level.players.size > 0) {
            if (getdvarint(#"hash_6efff55aa118c517", 0) == 3) {
                if (!isdefined(level.streamdumpteamindex)) {
                    level.streamdumpteamindex = 0;
                } else {
                    level.streamdumpteamindex++;
                }
                numpoints = 0;
                spawnpoints = [];
                location = level.scr_zm_map_start_location;
                if ((location == "<unknown string>" || location == "<unknown string>") && isdefined(level.default_start_location)) {
                    location = level.default_start_location;
                }
                match_string = level.scr_zm_ui_gametype + "<unknown string>" + location;
                if (level.streamdumpteamindex < level.teams.size) {
                    structs = struct::get_array("<unknown string>", "<unknown string>");
                    if (isdefined(structs)) {
                        foreach (struct in structs) {
                            if (isdefined(struct.script_string)) {
                                tokens = strtok(struct.script_string, "<unknown string>");
                                foreach (token in tokens) {
                                    if (token == match_string) {
                                        spawnpoints[spawnpoints.size] = struct;
                                    }
                                }
                            }
                        }
                    }
                    if (!isdefined(spawnpoints) || spawnpoints.size == 0) {
                        spawnpoints = struct::get_array("<unknown string>", "<unknown string>");
                    }
                    if (isdefined(spawnpoints)) {
                        numpoints = spawnpoints.size;
                    }
                }
                if (numpoints == 0) {
                    setdvar(#"hash_6efff55aa118c517", 0);
                    level.streamdumpteamindex = -1;
                    return;
                }
                averageorigin = (0, 0, 0);
                averageangles = (0, 0, 0);
                foreach (spawnpoint in spawnpoints) {
                    averageorigin += spawnpoint.origin / numpoints;
                    averageangles += spawnpoint.angles / numpoints;
                }
                level.players[0] setplayerangles(averageangles);
                level.players[0] setorigin(averageorigin);
                waitframe(1);
                setdvar(#"hash_6efff55aa118c517", 2);
            }
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x72ee904f, Offset: 0xe60
    // Size: 0x1604
    function updatedevsettings() {
        show_spawns = getdvarint(#"scr_showspawns", 0);
        show_start_spawns = getdvarint(#"scr_showstartspawns", 0);
        player = util::gethostplayer();
        if (show_spawns >= 1) {
            show_spawns = 1;
        } else {
            show_spawns = 0;
        }
        if (show_start_spawns >= 1) {
            show_start_spawns = 1;
        } else {
            show_start_spawns = 0;
        }
        if (!isdefined(level.show_spawns) || level.show_spawns != show_spawns) {
            level.show_spawns = show_spawns;
            setdvar(#"scr_showspawns", level.show_spawns);
            if (level.show_spawns) {
                showspawnpoints();
            } else {
                hidespawnpoints();
            }
        }
        if (!isdefined(level.show_start_spawns) || level.show_start_spawns != show_start_spawns) {
            level.show_start_spawns = show_start_spawns;
            setdvar(#"scr_showstartspawns", level.show_start_spawns);
            if (level.show_start_spawns) {
                showstartspawnpoints();
            } else {
                hidestartspawnpoints();
            }
        }
        updateminimapsetting();
        if (level.players.size > 0) {
            updatehardpoints();
            if (getdvarstring(#"scr_player_ammo") != "<unknown string>") {
                players = getplayers();
                if (!isdefined(level.devgui_unlimited_ammo)) {
                    level.devgui_unlimited_ammo = 1;
                } else {
                    level.devgui_unlimited_ammo = !level.devgui_unlimited_ammo;
                }
                if (level.devgui_unlimited_ammo) {
                    iprintln("<unknown string>");
                } else {
                    iprintln("<unknown string>");
                }
                for (i = 0; i < players.size; i++) {
                    if (level.devgui_unlimited_ammo) {
                        players[i] thread devgui_unlimited_ammo();
                        continue;
                    }
                    players[i] notify(#"devgui_unlimited_ammo");
                }
                setdvar(#"scr_player_ammo", "<unknown string>");
            } else if (getdvarstring(#"scr_player_momentum") != "<unknown string>") {
                if (!isdefined(level.devgui_unlimited_momentum)) {
                    level.devgui_unlimited_momentum = 1;
                } else {
                    level.devgui_unlimited_momentum = !level.devgui_unlimited_momentum;
                }
                if (level.devgui_unlimited_momentum) {
                    iprintln("<unknown string>");
                    level thread devgui_unlimited_momentum();
                } else {
                    iprintln("<unknown string>");
                    level notify(#"devgui_unlimited_momentum");
                }
                setdvar(#"scr_player_momentum", "<unknown string>");
            } else if (getdvarstring(#"scr_give_player_score") != "<unknown string>") {
                level thread devgui_increase_momentum(getdvarint(#"scr_give_player_score", 0));
                setdvar(#"scr_give_player_score", "<unknown string>");
            } else if (getdvarstring(#"scr_player_zero_ammo") != "<unknown string>") {
                players = getplayers();
                for (i = 0; i < players.size; i++) {
                    player = players[i];
                    weapons = player getweaponslist();
                    arrayremovevalue(weapons, level.weaponbasemelee);
                    for (j = 0; j < weapons.size; j++) {
                        if (weapons[j] == level.weaponnone) {
                            continue;
                        }
                        player setweaponammostock(weapons[j], 0);
                        player setweaponammoclip(weapons[j], 0);
                    }
                }
                setdvar(#"scr_player_zero_ammo", "<unknown string>");
            } else if (getdvarstring(#"scr_emp_jammed") != "<unknown string>") {
                players = getplayers();
                for (i = 0; i < players.size; i++) {
                    player = players[i];
                    player setempjammed(getdvarint(#"scr_emp_jammed", 0));
                }
                setdvar(#"scr_emp_jammed", "<unknown string>");
            } else if (getdvarstring(#"scr_round_pause") != "<unknown string>") {
                if (!level.timerstopped) {
                    iprintln("<unknown string>");
                    globallogic_utils::pausetimer();
                } else {
                    iprintln("<unknown string>");
                    globallogic_utils::resumetimer();
                }
                setdvar(#"scr_round_pause", "<unknown string>");
            } else if (getdvarstring(#"scr_round_end") != "<unknown string>") {
                level globallogic::forceend();
                setdvar(#"scr_round_end", "<unknown string>");
            } else if (getdvarstring(#"scr_show_hq_spawns") != "<unknown string>") {
                if (!isdefined(level.devgui_show_hq)) {
                    level.devgui_show_hq = 0;
                }
                if (level.gametype == "<unknown string>" && isdefined(level.radios)) {
                    if (!level.devgui_show_hq) {
                        for (i = 0; i < level.radios.size; i++) {
                            color = (1, 0, 0);
                            level showonespawnpoint(level.radios[i], color, "<unknown string>", 32, "<unknown string>");
                        }
                    } else {
                        level notify(#"hide_hq_points");
                    }
                    level.devgui_show_hq = !level.devgui_show_hq;
                }
                setdvar(#"scr_show_hq_spawns", "<unknown string>");
            }
            if (getdvarint(#"hash_6efff55aa118c517", 0) == 3) {
                if (!isdefined(level.streamdumpteamindex)) {
                    level.streamdumpteamindex = 0;
                } else {
                    level.streamdumpteamindex++;
                }
                numpoints = 0;
                if (level.streamdumpteamindex < level.teams.size) {
                    teamname = getarraykeys(level.teams)[level.streamdumpteamindex];
                    if (isdefined(level.spawn_start[teamname])) {
                        numpoints = level.spawn_start[teamname].size;
                    }
                }
                if (numpoints == 0) {
                    setdvar(#"hash_6efff55aa118c517", 0);
                    level.streamdumpteamindex = -1;
                } else {
                    averageorigin = (0, 0, 0);
                    averageangles = (0, 0, 0);
                    foreach (spawnpoint in level.spawn_start[teamname]) {
                        averageorigin += spawnpoint.origin / numpoints;
                        averageangles += spawnpoint.angles / numpoints;
                    }
                    level.players[0] setplayerangles(averageangles);
                    level.players[0] setorigin(averageorigin);
                    waitframe(1);
                    setdvar(#"hash_6efff55aa118c517", 2);
                }
            }
        }
        if (getdvarstring(#"scr_giveperk") == "<unknown string>") {
            players = getplayers();
            iprintln("<unknown string>");
            for (i = 0; i < players.size; i++) {
                players[i] clearperks();
            }
            setdvar(#"scr_giveperk", "<unknown string>");
        }
        if (getdvarstring(#"scr_giveperk") != "<unknown string>") {
            perk = getdvarstring(#"scr_giveperk");
            specialties = strtok(perk, "<unknown string>");
            players = getplayers();
            iprintln("<unknown string>" + perk + "<unknown string>");
            foreach (player in players) {
                foreach (specialty in specialties) {
                    player setperk(specialty);
                    if (!isdefined(player.extraperks)) {
                        player.extraperks = [];
                    }
                    player.extraperks[specialty] = 1;
                }
            }
            setdvar(#"scr_giveperk", "<unknown string>");
        }
        if (getdvarstring(#"scr_toggleperk") != "<unknown string>") {
            perk = getdvarstring(#"scr_toggleperk");
            specialties = strtok(perk, "<unknown string>");
            players = getplayers();
            iprintln("<unknown string>" + perk + "<unknown string>");
            foreach (player in players) {
                foreach (specialty in specialties) {
                    if (!isdefined(player.extraperks)) {
                        player.extraperks = [];
                    }
                    if (player hasperk(specialty)) {
                        player unsetperk(specialty);
                        player.extraperks[specialty] = 0;
                        continue;
                    }
                    player setperk(specialty);
                    player.extraperks[specialty] = 1;
                }
            }
            setdvar(#"scr_toggleperk", "<unknown string>");
        }
        if (getdvarstring(#"scr_forceevent") != "<unknown string>") {
            event = getdvarstring(#"scr_forceevent");
            player = util::gethostplayer();
            forward = anglestoforward(player.angles);
            right = anglestoright(player.angles);
            if (event == "<unknown string>") {
                player dodamage(1, player.origin + forward);
            } else if (event == "<unknown string>") {
                player dodamage(1, player.origin - forward);
            } else if (event == "<unknown string>") {
                player dodamage(1, player.origin - right);
            } else if (event == "<unknown string>") {
                player dodamage(1, player.origin + right);
            }
            setdvar(#"scr_forceevent", "<unknown string>");
        }
        if (getdvarstring(#"scr_takeperk") != "<unknown string>") {
            perk = getdvarstring(#"scr_takeperk");
            for (i = 0; i < level.players.size; i++) {
                level.players[i] unsetperk(perk);
                level.players[i].extraperks[perk] = undefined;
            }
            setdvar(#"scr_takeperk", "<unknown string>");
        }
        if (getdvarstring(#"scr_x_kills_y") != "<unknown string>") {
            nametokens = strtok(getdvarstring(#"scr_x_kills_y"), "<unknown string>");
            if (nametokens.size > 1) {
                thread xkillsy(nametokens[0], nametokens[1]);
            }
            setdvar(#"scr_x_kills_y", "<unknown string>");
        }
        if (getdvarstring(#"scr_entdebug") != "<unknown string>") {
            ents = getentarray();
            level.entarray = [];
            level.entcounts = [];
            level.entgroups = [];
            for (index = 0; index < ents.size; index++) {
                classname = ents[index].classname;
                if (!issubstr(classname, "<unknown string>")) {
                    curent = ents[index];
                    level.entarray[level.entarray.size] = curent;
                    if (!isdefined(level.entcounts[classname])) {
                        level.entcounts[classname] = 0;
                    }
                    level.entcounts[classname]++;
                    if (!isdefined(level.entgroups[classname])) {
                        level.entgroups[classname] = [];
                    }
                    level.entgroups[classname][level.entgroups[classname].size] = curent;
                }
            }
        }
        potm::debugupdate();
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xf2f47a57, Offset: 0x2470
    // Size: 0x1b6
    function devgui_spawn_think() {
        self notify(#"devgui_spawn_think");
        self endon(#"devgui_spawn_think", #"disconnect");
        dpad_left = 0;
        dpad_right = 0;
        for (;;) {
            self setactionslot(3, "<unknown string>");
            self setactionslot(4, "<unknown string>");
            if (!dpad_left && self buttonpressed("<unknown string>")) {
                setdvar(#"scr_playerwarp", "<unknown string>");
                dpad_left = 1;
            } else if (!self buttonpressed("<unknown string>")) {
                dpad_left = 0;
            }
            if (!dpad_right && self buttonpressed("<unknown string>")) {
                setdvar(#"scr_playerwarp", "<unknown string>");
                dpad_right = 1;
            } else if (!self buttonpressed("<unknown string>")) {
                dpad_right = 0;
            }
            waitframe(1);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xda81559f, Offset: 0x2630
    // Size: 0x148
    function devgui_unlimited_ammo() {
        self notify(#"devgui_unlimited_ammo");
        self endon(#"devgui_unlimited_ammo", #"disconnect");
        for (;;) {
            wait(1);
            primary_weapons = self getweaponslistprimaries();
            offhand_weapons_and_alts = array::exclude(self getweaponslist(1), primary_weapons);
            weapons = arraycombine(primary_weapons, offhand_weapons_and_alts, 0, 0);
            arrayremovevalue(weapons, level.weaponbasemelee);
            for (i = 0; i < weapons.size; i++) {
                weapon = weapons[i];
                if (weapon == level.weaponnone) {
                    continue;
                }
                self givemaxammo(weapon);
            }
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xac2a366d, Offset: 0x2780
    // Size: 0x11c
    function devgui_unlimited_momentum() {
        level notify(#"devgui_unlimited_momentum");
        level endon(#"devgui_unlimited_momentum");
        for (;;) {
            wait(1);
            players = getplayers();
            foreach (player in players) {
                if (!isdefined(player)) {
                    continue;
                }
                if (!isalive(player)) {
                    continue;
                }
                if (player.sessionstate != "<unknown string>") {
                    continue;
                }
                globallogic_score::_setplayermomentum(player, 5000);
            }
        }
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0xd82a29a8, Offset: 0x28a8
    // Size: 0x100
    function devgui_increase_momentum(score) {
        players = getplayers();
        foreach (player in players) {
            if (!isdefined(player)) {
                continue;
            }
            if (!isalive(player)) {
                continue;
            }
            if (player.sessionstate != "<unknown string>") {
                continue;
            }
            player globallogic_score::giveplayermomentumnotification(score, #"testplayerscorefortan", "<unknown string>", 0);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x37c72387, Offset: 0x29b0
    // Size: 0x320
    function devgui_health_debug() {
        self notify(#"devgui_health_debug");
        self endon(#"devgui_health_debug", #"disconnect");
        x = 80;
        y = 40;
        self.debug_health_bar = newdebughudelem(self);
        self.debug_health_bar.x = x + 80;
        self.debug_health_bar.y = y + 2;
        self.debug_health_bar.alignx = "<unknown string>";
        self.debug_health_bar.aligny = "<unknown string>";
        self.debug_health_bar.horzalign = "<unknown string>";
        self.debug_health_bar.vertalign = "<unknown string>";
        self.debug_health_bar.alpha = 1;
        self.debug_health_bar.foreground = 1;
        self.debug_health_bar setshader(#"black", 1, 8);
        self.debug_health_text = newdebughudelem(self);
        self.debug_health_text.x = x + 80;
        self.debug_health_text.y = y;
        self.debug_health_text.alignx = "<unknown string>";
        self.debug_health_text.aligny = "<unknown string>";
        self.debug_health_text.horzalign = "<unknown string>";
        self.debug_health_text.vertalign = "<unknown string>";
        self.debug_health_text.alpha = 1;
        self.debug_health_text.fontscale = 1;
        self.debug_health_text.foreground = 1;
        if (!isdefined(self.maxhealth) || self.maxhealth <= 0) {
            self.maxhealth = 100;
        }
        for (;;) {
            waitframe(1);
            width = self.health / self.maxhealth * 300;
            width = int(max(width, 1));
            self.debug_health_bar setshader(#"black", width, 8);
            self.debug_health_text setvalue(self.health);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xe1b22967, Offset: 0x2cd8
    // Size: 0xac
    function giveextraperks() {
        if (!isdefined(self.extraperks)) {
            return;
        }
        perks = getarraykeys(self.extraperks);
        for (i = 0; i < perks.size; i++) {
            println("<unknown string>" + self.name + "<unknown string>" + perks[i] + "<unknown string>");
            self setperk(perks[i]);
        }
    }

    // Namespace dev/dev
    // Params 2, eflags: 0x0
    // Checksum 0xc2ec0122, Offset: 0x2d90
    // Size: 0x140
    function xkillsy(attackername, victimname) {
        attacker = undefined;
        victim = undefined;
        for (index = 0; index < level.players.size; index++) {
            if (level.players[index].name == attackername) {
                attacker = level.players[index];
                continue;
            }
            if (level.players[index].name == victimname) {
                victim = level.players[index];
            }
        }
        if (!isalive(attacker) || !isalive(victim)) {
            return;
        }
        victim thread [[ level.callbackplayerdamage ]](attacker, attacker, 1000, 0, "<unknown string>", level.weaponnone, (0, 0, 0), (0, 0, 0), "<unknown string>", 0, 0);
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xb9cc17af, Offset: 0x2ed8
    // Size: 0x24
    function testscriptruntimeerrorassert() {
        wait(1);
        assert(0);
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x29ece536, Offset: 0x2f08
    // Size: 0x44
    function testscriptruntimeerror2() {
        myundefined = "<unknown string>";
        if (myundefined == 1) {
            println("<unknown string>");
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x9e8e005d, Offset: 0x2f58
    // Size: 0x1c
    function testscriptruntimeerror1() {
        testscriptruntimeerror2();
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xeb5c69f9, Offset: 0x2f80
    // Size: 0xdc
    function testscriptruntimeerror() {
        wait(5);
        for (;;) {
            if (getdvarstring(#"scr_testscriptruntimeerror") != "<unknown string>") {
                break;
            }
            wait(1);
        }
        myerror = getdvarstring(#"scr_testscriptruntimeerror");
        setdvar(#"scr_testscriptruntimeerror", "<unknown string>");
        if (myerror == "<unknown string>") {
            testscriptruntimeerrorassert();
        } else {
            testscriptruntimeerror1();
        }
        thread testscriptruntimeerror();
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xf5983560, Offset: 0x3068
    // Size: 0xfc
    function testdvars() {
        wait(5);
        for (;;) {
            if (getdvarstring(#"scr_testdvar") != "<unknown string>") {
                break;
            }
            wait(1);
        }
        tokens = strtok(getdvarstring(#"scr_testdvar"), "<unknown string>");
        dvarname = tokens[0];
        dvarvalue = tokens[1];
        setdvar(dvarname, dvarvalue);
        setdvar(#"scr_testdvar", "<unknown string>");
        thread testdvars();
    }

    // Namespace dev/dev
    // Params 5, eflags: 0x0
    // Checksum 0xcf5073d6, Offset: 0x3170
    // Size: 0x4ae
    function showonespawnpoint(spawn_point, color, notification, height, print) {
        if (!isdefined(height) || height <= 0) {
            height = util::get_player_height();
        }
        if (!isdefined(print)) {
            print = spawn_point.classname;
        }
        center = spawn_point.origin;
        forward = anglestoforward(spawn_point.angles);
        right = anglestoright(spawn_point.angles);
        forward = vectorscale(forward, 16);
        right = vectorscale(right, 16);
        a = center + forward - right;
        b = center + forward + right;
        c = center - forward + right;
        d = center - forward - right;
        thread lineuntilnotified(a, b, color, 0, notification);
        thread lineuntilnotified(b, c, color, 0, notification);
        thread lineuntilnotified(c, d, color, 0, notification);
        thread lineuntilnotified(d, a, color, 0, notification);
        thread lineuntilnotified(a, a + (0, 0, height), color, 0, notification);
        thread lineuntilnotified(b, b + (0, 0, height), color, 0, notification);
        thread lineuntilnotified(c, c + (0, 0, height), color, 0, notification);
        thread lineuntilnotified(d, d + (0, 0, height), color, 0, notification);
        a += (0, 0, height);
        b += (0, 0, height);
        c += (0, 0, height);
        d += (0, 0, height);
        thread lineuntilnotified(a, b, color, 0, notification);
        thread lineuntilnotified(b, c, color, 0, notification);
        thread lineuntilnotified(c, d, color, 0, notification);
        thread lineuntilnotified(d, a, color, 0, notification);
        center += (0, 0, height / 2);
        arrow_forward = anglestoforward(spawn_point.angles);
        arrowhead_forward = anglestoforward(spawn_point.angles);
        arrowhead_right = anglestoright(spawn_point.angles);
        arrow_forward = vectorscale(arrow_forward, 32);
        arrowhead_forward = vectorscale(arrowhead_forward, 24);
        arrowhead_right = vectorscale(arrowhead_right, 8);
        a = center + arrow_forward;
        b = center + arrowhead_forward - arrowhead_right;
        c = center + arrowhead_forward + arrowhead_right;
        thread lineuntilnotified(center, a, color, 0, notification);
        thread lineuntilnotified(a, b, color, 0, notification);
        thread lineuntilnotified(a, c, color, 0, notification);
        thread print3duntilnotified(spawn_point.origin + (0, 0, height), print, color, 1, 1, notification);
        return;
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x994e225c, Offset: 0x3628
    // Size: 0xd6
    function showspawnpoints() {
        if (isdefined(level.spawnpoints)) {
            color = (1, 1, 1);
            for (spawn_point_index = 0; spawn_point_index < level.spawnpoints.size; spawn_point_index++) {
                showonespawnpoint(level.spawnpoints[spawn_point_index], color, "<unknown string>");
            }
        }
        for (i = 0; i < level.dem_spawns.size; i++) {
            color = (0, 1, 0);
            showonespawnpoint(level.dem_spawns[i], color, "<unknown string>");
        }
        return;
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x2e41c147, Offset: 0x3708
    // Size: 0x22
    function hidespawnpoints() {
        level notify(#"hide_spawnpoints");
        return;
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xa37b728a, Offset: 0x3738
    // Size: 0x23e
    function showstartspawnpoints() {
        if (!level.teambased) {
            return;
        }
        if (!isdefined(level.spawn_start)) {
            return;
        }
        team_colors = [];
        team_colors[#"axis"] = (1, 0, 1);
        team_colors[#"allies"] = (0, 1, 1);
        team_colors[#"team3"] = (1, 1, 0);
        team_colors[#"team4"] = (0, 1, 0);
        team_colors[#"team5"] = (0, 0, 1);
        team_colors[#"team6"] = (1, 0.7, 0);
        team_colors[#"team7"] = (0.25, 0.25, 1);
        team_colors[#"team8"] = (0.88, 0, 1);
        foreach (team, _ in level.teams) {
            color = team_colors[team];
            foreach (spawnpoint in level.spawn_start[team]) {
                showonespawnpoint(spawnpoint, color, "<unknown string>");
            }
        }
        return;
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x9374c538, Offset: 0x3980
    // Size: 0x22
    function hidestartspawnpoints() {
        level notify(#"hide_startspawnpoints");
        return;
    }

    // Namespace dev/dev
    // Params 6, eflags: 0x0
    // Checksum 0x59909ed5, Offset: 0x39b0
    // Size: 0x6e
    function print3duntilnotified(origin, text, color, alpha, scale, notification) {
        level endon(notification);
        for (;;) {
            print3d(origin, text, color, alpha, scale);
            waitframe(1);
        }
    }

    // Namespace dev/dev
    // Params 5, eflags: 0x0
    // Checksum 0xf4769737, Offset: 0x3a28
    // Size: 0x66
    function lineuntilnotified(start, end, color, depthtest, notification) {
        level endon(notification);
        for (;;) {
            line(start, end, color, depthtest);
            waitframe(1);
        }
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0x72d68c99, Offset: 0x3a98
    // Size: 0x2a
    function dvar_turned_on(val) {
        if (val <= 0) {
            return 0;
        }
        return 1;
    }

    // Namespace dev/dev
    // Params 5, eflags: 0x0
    // Checksum 0x11330f8a, Offset: 0x3ad0
    // Size: 0xc4
    function new_hud(hud_name, msg, x, y, scale) {
        if (!isdefined(level.hud_array)) {
            level.hud_array = [];
        }
        if (!isdefined(level.hud_array[hud_name])) {
            level.hud_array[hud_name] = [];
        }
        hud = set_hudelem(msg, x, y, scale);
        level.hud_array[hud_name][level.hud_array[hud_name].size] = hud;
        return hud;
    }

    // Namespace dev/dev
    // Params 7, eflags: 0x0
    // Checksum 0x80affc32, Offset: 0x3ba0
    // Size: 0x142
    function set_hudelem(text, x, y, scale, alpha, sort, *debug_hudelem) {
        /#
            if (!isdefined(sort)) {
                sort = 1;
            }
            if (!isdefined(alpha)) {
                alpha = 1;
            }
            if (!isdefined(debug_hudelem)) {
                debug_hudelem = 20;
            }
            hud = newdebughudelem();
            hud.debug_hudelem = 1;
            hud.location = 0;
            hud.alignx = "<unknown string>";
            hud.aligny = "<unknown string>";
            hud.foreground = 1;
            hud.fontscale = alpha;
            hud.sort = debug_hudelem;
            hud.alpha = sort;
            hud.x = y;
            hud.y = scale;
            hud.og_scale = alpha;
            if (isdefined(x)) {
                hud settext(x);
            }
            return hud;
        #/
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x7dc6fddb, Offset: 0x3cf0
    // Size: 0x14c
    function print_weapon_name() {
        self notify(#"print_weapon_name");
        self endon(#"print_weapon_name");
        wait(0.2);
        if (self isswitchingweapons()) {
            waitresult = self waittill(#"weapon_change_complete");
            fail_safe = 0;
            while (waitresult.weapon == level.weaponnone) {
                waitresult = self waittill(#"weapon_change_complete");
                waitframe(1);
                fail_safe++;
                if (fail_safe > 120) {
                    break;
                }
            }
        } else {
            weapon = self getcurrentweapon();
        }
        printweaponname = getdvarint(#"scr_print_weapon_name", 1);
        if (printweaponname) {
            iprintlnbold(weapon.name);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xb07792dd, Offset: 0x3e48
    // Size: 0x1d8
    function set_equipment_list() {
        if (isdefined(level.dev_equipment)) {
            return;
        }
        level.dev_equipment = [];
        level.dev_equipment[1] = getweapon(#"acoustic_sensor");
        level.dev_equipment[2] = getweapon(#"camera_spike");
        level.dev_equipment[3] = getweapon(#"claymore");
        level.dev_equipment[4] = getweapon(#"satchel_charge");
        level.dev_equipment[5] = getweapon(#"scrambler");
        level.dev_equipment[6] = getweapon(#"tactical_insertion");
        level.dev_equipment[7] = getweapon(#"bouncingbetty");
        level.dev_equipment[8] = getweapon(#"trophy_system");
        level.dev_equipment[9] = getweapon(#"pda_hack");
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xf9b0c5c5, Offset: 0x4028
    // Size: 0x208
    function set_grenade_list() {
        if (isdefined(level.dev_grenade)) {
            return;
        }
        level.dev_grenade = [];
        level.dev_grenade[1] = getweapon(#"frag_grenade");
        level.dev_grenade[2] = getweapon(#"sticky_grenade");
        level.dev_grenade[3] = getweapon(#"hatchet");
        level.dev_grenade[4] = getweapon(#"willy_pete");
        level.dev_grenade[5] = getweapon(#"proximity_grenade");
        level.dev_grenade[6] = getweapon(#"flash_grenade");
        level.dev_grenade[7] = getweapon(#"concussion_grenade");
        level.dev_grenade[8] = getweapon(#"nightingale");
        level.dev_grenade[9] = getweapon(#"emp_grenade");
        level.dev_grenade[10] = getweapon(#"sensor_grenade");
    }

    // Namespace dev/dev
    // Params 1, eflags: 0x0
    // Checksum 0xf7ad993c, Offset: 0x4238
    // Size: 0xac
    function take_all_grenades_and_equipment(player) {
                for (i = 0; i < level.dev_equipment.size; i++) {
            player takeweapon(level.dev_equipment[i + 1]);
        }
        for (i = 0; i < level.dev_grenade.size; i++) {
            player takeweapon(level.dev_grenade[i + 1]);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x35541b09, Offset: 0x42f0
    // Size: 0x138
    function equipment_dev_gui() {
        set_equipment_list();
        set_grenade_list();
        setdvar(#"scr_give_equipment", "<unknown string>");
        while (true) {
            wait(0.5);
            devgui_int = getdvarint(#"scr_give_equipment", 0);
            if (devgui_int != 0) {
                for (i = 0; i < level.players.size; i++) {
                    take_all_grenades_and_equipment(level.players[i]);
                    level.players[i] giveweapon(level.dev_equipment[devgui_int]);
                }
                setdvar(#"scr_give_equipment", 0);
            }
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xe21bc74, Offset: 0x4430
    // Size: 0x138
    function grenade_dev_gui() {
        set_equipment_list();
        set_grenade_list();
        setdvar(#"scr_give_grenade", "<unknown string>");
        while (true) {
            wait(0.5);
            devgui_int = getdvarint(#"scr_give_grenade", 0);
            if (devgui_int != 0) {
                for (i = 0; i < level.players.size; i++) {
                    take_all_grenades_and_equipment(level.players[i]);
                    level.players[i] giveweapon(level.dev_grenade[devgui_int]);
                }
                setdvar(#"scr_give_grenade", 0);
            }
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0xf733fb66, Offset: 0x4570
    // Size: 0x44e
    function devstraferunpathdebugdraw() {
        white = (1, 1, 1);
        red = (1, 0, 0);
        green = (0, 1, 0);
        blue = (0, 0, 1);
        violet = (0.4, 0, 0.6);
        maxdrawtime = 10;
        drawtime = maxdrawtime;
        origintextoffset = (0, 0, -50);
        endonmsg = "<unknown string>";
        while (true) {
            if (getdvarint(#"scr_devstraferunpathdebugdraw", 0) > 0) {
                nodes = [];
                end = 0;
                node = getvehiclenode("<unknown string>", "<unknown string>");
                if (!isdefined(node)) {
                    println("<unknown string>");
                    setdvar(#"scr_devstraferunpathdebugdraw", 0);
                    continue;
                }
                while (isdefined(node.target)) {
                    new_node = getvehiclenode(node.target, "<unknown string>");
                    foreach (n in nodes) {
                        if (n == new_node) {
                            end = 1;
                        }
                    }
                    textscale = 30;
                    if (drawtime == maxdrawtime) {
                        node thread drawpathsegment(new_node, violet, violet, 1, textscale, origintextoffset, drawtime, endonmsg);
                    }
                    if (isdefined(node.script_noteworthy)) {
                        textscale = 10;
                        switch (node.script_noteworthy) {
                        case #"strafe_start":
                            textcolor = green;
                            textalpha = 1;
                            break;
                        case #"strafe_stop":
                            textcolor = red;
                            textalpha = 1;
                            break;
                        case #"strafe_leave":
                            textcolor = white;
                            textalpha = 1;
                            break;
                        }
                        switch (node.script_noteworthy) {
                        case #"strafe_stop":
                        case #"strafe_leave":
                        case #"strafe_start":
                            sides = 10;
                            radius = 100;
                            if (drawtime == maxdrawtime) {
                                sphere(node.origin, radius, textcolor, textalpha, 1, sides, drawtime * 1000);
                            }
                            node draworiginlines();
                            node drawnoteworthytext(textcolor, textalpha, textscale);
                            break;
                        }
                    }
                    if (end) {
                        break;
                    }
                    nodes[nodes.size] = new_node;
                    node = new_node;
                }
                drawtime -= 0.05;
                if (drawtime < 0) {
                    drawtime = maxdrawtime;
                }
                waitframe(1);
                continue;
            }
            wait(1);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x8d653f8c, Offset: 0x49c8
    // Size: 0x3bc
    function devhelipathdebugdraw() {
        white = (1, 1, 1);
        red = (1, 0, 0);
        green = (0, 1, 0);
        blue = (0, 0, 1);
        textcolor = white;
        textalpha = 1;
        textscale = 1;
        maxdrawtime = 10;
        drawtime = maxdrawtime;
        origintextoffset = (0, 0, -50);
        endonmsg = "<unknown string>";
        while (true) {
            if (getdvarint(#"scr_devhelipathsdebugdraw", 0) > 0) {
                script_origins = getentarray("<unknown string>", "<unknown string>");
                foreach (ent in script_origins) {
                    if (isdefined(ent.targetname)) {
                        switch (ent.targetname) {
                        case #"heli_start":
                            textcolor = blue;
                            textalpha = 1;
                            textscale = 3;
                            break;
                        case #"heli_loop_start":
                            textcolor = green;
                            textalpha = 1;
                            textscale = 3;
                            break;
                        case #"heli_attack_area":
                            textcolor = red;
                            textalpha = 1;
                            textscale = 3;
                            break;
                        case #"heli_leave":
                            textcolor = white;
                            textalpha = 1;
                            textscale = 3;
                            break;
                        }
                        switch (ent.targetname) {
                        case #"heli_leave":
                        case #"heli_attack_area":
                        case #"heli_start":
                        case #"heli_loop_start":
                            if (drawtime == maxdrawtime) {
                                ent thread drawpath(textcolor, white, textalpha, textscale, origintextoffset, drawtime, endonmsg);
                            }
                            ent draworiginlines();
                            ent drawtargetnametext(textcolor, textalpha, textscale);
                            ent draworigintext(textcolor, textalpha, textscale, origintextoffset);
                            break;
                        }
                    }
                }
                drawtime -= 0.05;
                if (drawtime < 0) {
                    drawtime = maxdrawtime;
                }
            }
            if (getdvarint(#"scr_devhelipathsdebugdraw", 0) == 0) {
                level notify(endonmsg);
                drawtime = maxdrawtime;
                wait(1);
            }
            waitframe(1);
        }
    }

    // Namespace dev/dev
    // Params 0, eflags: 0x0
    // Checksum 0x386174c2, Offset: 0x4d90
    // Size: 0xfc
    function draworiginlines() {
        red = (1, 0, 0);
        green = (0, 1, 0);
        blue = (0, 0, 1);
        line(self.origin, self.origin + anglestoforward(self.angles) * 10, red);
        line(self.origin, self.origin + anglestoright(self.angles) * 10, green);
        line(self.origin, self.origin + anglestoup(self.angles) * 10, blue);
    }

    // Namespace dev/dev
    // Params 4, eflags: 0x0
    // Checksum 0xd1cb446e, Offset: 0x4e98
    // Size: 0x64
    function drawtargetnametext(textcolor, textalpha, textscale, textoffset) {
        if (!isdefined(textoffset)) {
            textoffset = (0, 0, 0);
        }
        print3d(self.origin + textoffset, self.targetname, textcolor, textalpha, textscale);
    }

    // Namespace dev/dev
    // Params 4, eflags: 0x0
    // Checksum 0xce7aa2cc, Offset: 0x4f08
    // Size: 0x64
    function drawnoteworthytext(textcolor, textalpha, textscale, textoffset) {
        if (!isdefined(textoffset)) {
            textoffset = (0, 0, 0);
        }
        print3d(self.origin + textoffset, self.script_noteworthy, textcolor, textalpha, textscale);
    }

    // Namespace dev/dev
    // Params 4, eflags: 0x0
    // Checksum 0x5cefa793, Offset: 0x4f78
    // Size: 0xbc
    function draworigintext(textcolor, textalpha, textscale, textoffset) {
        if (!isdefined(textoffset)) {
            textoffset = (0, 0, 0);
        }
        originstring = "<unknown string>" + self.origin[0] + "<unknown string>" + self.origin[1] + "<unknown string>" + self.origin[2] + "<unknown string>";
        print3d(self.origin + textoffset, originstring, textcolor, textalpha, textscale);
    }

    // Namespace dev/dev
    // Params 4, eflags: 0x0
    // Checksum 0xf1ecd12f, Offset: 0x5040
    // Size: 0xcc
    function drawspeedacceltext(textcolor, textalpha, textscale, textoffset) {
        if (isdefined(self.script_airspeed)) {
            print3d(self.origin + (0, 0, textoffset[2] * 2), "<unknown string>" + self.script_airspeed, textcolor, textalpha, textscale);
        }
        if (isdefined(self.script_accel)) {
            print3d(self.origin + (0, 0, textoffset[2] * 3), "<unknown string>" + self.script_accel, textcolor, textalpha, textscale);
        }
    }

    // Namespace dev/dev
    // Params 7, eflags: 0x0
    // Checksum 0x9f790004, Offset: 0x5118
    // Size: 0x11e
    function drawpath(linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg) {
        level endon(endonmsg);
        ent = self;
        entfirsttarget = ent.targetname;
        while (isdefined(ent.target)) {
            enttarget = getent(ent.target, "<unknown string>");
            ent thread drawpathsegment(enttarget, linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg);
            if (ent.targetname == "<unknown string>") {
                entfirsttarget = ent.target;
            } else if (ent.target == entfirsttarget) {
                break;
            }
            ent = enttarget;
            waitframe(1);
        }
    }

    // Namespace dev/dev
    // Params 8, eflags: 0x0
    // Checksum 0xf3fa8849, Offset: 0x5240
    // Size: 0x116
    function drawpathsegment(enttarget, linecolor, textcolor, textalpha, textscale, textoffset, drawtime, endonmsg) {
        level endon(endonmsg);
        while (drawtime > 0) {
            if (isdefined(self.targetname) && self.targetname == "<unknown string>") {
                print3d(self.origin + textoffset, self.targetname, textcolor, textalpha, textscale);
            }
            line(self.origin, enttarget.origin, linecolor);
            self drawspeedacceltext(textcolor, textalpha, textscale, textoffset);
            drawtime -= 0.05;
            waitframe(1);
        }
    }

#/
