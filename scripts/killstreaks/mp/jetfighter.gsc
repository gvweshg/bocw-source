// Atian COD Tools GSC CW decompiler test
#using scripts\weapons\heatseekingmissile.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using script_4721de209091b1a6;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace jetfighter;

// Namespace jetfighter/jetfighter
// Params 0, eflags: 0x5
// Checksum 0xcc6e2632, Offset: 0x2b8
// Size: 0x44
function private autoexec __init__system__() {
    system::register(#"jetfighter", &preinit, undefined, undefined, #"killstreaks");
}

// Namespace jetfighter/jetfighter
// Params 0, eflags: 0x6 linked
// Checksum 0x5b2ca576, Offset: 0x308
// Size: 0x1d4
function private preinit() {
    killstreaks::register_killstreak("killstreak_jetfighter", &usekillstreak);
    killstreakrules::function_feb4595f("jetfighter", &function_a0624137);
    clientfield::register("scriptmover", "jetfighter_contrail", 1, 1, "int");
    scene::add_scene_func(#"p9_fxanim_mp_jetfighter_bundle", &function_c3c5d5e1, "play");
    level.var_a78d8a55 = array("ac130", "hoverjet", "chopper_gunner", "recon_plane", "helicopter_guard", "helicopter_comlink", "straferun", "uav", "counteruav");
    level.var_500867a0 = [];
    level.var_3e99cf4e = [];
    if (!isdefined(level.var_2d90c17e)) {
        level.var_2d90c17e = [];
    } else if (!isarray(level.var_2d90c17e)) {
        level.var_2d90c17e = array(level.var_2d90c17e);
    }
    level.var_2d90c17e[level.var_2d90c17e.size] = &function_fee93694;
    /#
        level thread function_35b87c52();
    #/
}

// Namespace jetfighter/jetfighter
// Params 1, eflags: 0x2 linked
// Checksum 0x19c5c506, Offset: 0x4e8
// Size: 0x144
function function_fee93694(killstreakbundle) {
    if (isdefined(killstreakbundle.var_d3413870) && isinarray(level.var_a78d8a55, killstreakbundle.var_d3413870)) {
        if (!isdefined(level.var_500867a0[killstreakbundle.var_d3413870])) {
            level.var_500867a0[killstreakbundle.var_d3413870] = [];
        } else if (!isarray(level.var_500867a0[killstreakbundle.var_d3413870])) {
            level.var_500867a0[killstreakbundle.var_d3413870] = array(level.var_500867a0[killstreakbundle.var_d3413870]);
        }
        if (!isinarray(level.var_500867a0[killstreakbundle.var_d3413870], self)) {
            level.var_500867a0[killstreakbundle.var_d3413870][level.var_500867a0[killstreakbundle.var_d3413870].size] = self;
        }
        level function_6384fa58();
    }
}

// Namespace jetfighter/jetfighter
// Params 0, eflags: 0x2 linked
// Checksum 0x382cddc8, Offset: 0x638
// Size: 0x90
function function_6384fa58() {
    foreach (var_cc10f597 in level.var_500867a0) {
        arrayremovevalue(var_cc10f597, undefined);
    }
}

// Namespace jetfighter/jetfighter
// Params 1, eflags: 0x2 linked
// Checksum 0x33380732, Offset: 0x6d0
// Size: 0x68
function usekillstreak(*hardpointtype) {
    killstreak_id = self killstreakrules::killstreakstart("jetfighter", self.team, undefined, 1);
    if (killstreak_id == -1) {
        return false;
    }
    self thread function_4b3b25af(killstreak_id);
    return true;
}

// Namespace jetfighter/jetfighter
// Params 1, eflags: 0x6 linked
// Checksum 0x967e7045, Offset: 0x740
// Size: 0x4b4
function private function_4b3b25af(killstreak_id) {
    bundle = killstreaks::get_script_bundle("jetfighter");
    self thread namespace_f9b02f80::play_killstreak_start_dialog("jetfighter", self.team, killstreak_id);
    team = self.team;
    var_10c3dd58 = self function_6ff76fc6();
    var_d44b8c3e = var_10c3dd58.var_d44b8c3e;
    angles = var_10c3dd58.angles;
    adjustedpath = function_8f304847(var_d44b8c3e, angles);
    if (!isdefined(self)) {
        return;
    }
    startposition = adjustedpath[#"startposition"];
    forward = adjustedpath[#"forward"];
    angles = adjustedpath[#"angles"];
    var_ce2c18d3 = util::spawn_model("tag_origin", (var_d44b8c3e[0], var_d44b8c3e[1], startposition[2]), angles);
    var_ce2c18d3.team = team;
    var_ce2c18d3.killstreak_id = killstreak_id;
    var_ce2c18d3.owner = self;
    var_ce2c18d3.pilotindex = namespace_f9b02f80::get_random_pilot_index("jetfighter");
    var_ce2c18d3 killstreakrules::function_2e6ff61a("jetfighter", killstreak_id, {#origin:var_ce2c18d3.origin, #team:team});
    if (var_ce2c18d3 function_3fbf2154()) {
        return;
    }
    var_ce2c18d3 endoncallback(&function_47cd37b6, #"hash_658778b8e9e9d13a");
    if (!isdefined(level.var_3e99cf4e)) {
        level.var_3e99cf4e = [];
    } else if (!isarray(level.var_3e99cf4e)) {
        level.var_3e99cf4e = array(level.var_3e99cf4e);
    }
    level.var_3e99cf4e[level.var_3e99cf4e.size] = var_ce2c18d3;
    right = anglestoright(angles);
    var_d86e4fe0 = bundle.var_8ddf638c / 5;
    var_f77cb43b = 0;
    var_196fbc4d = [];
    for (i = 1; i <= 5; i++) {
        if (i % 2 == 0) {
            var_f77cb43b++;
            var_ab422cc1 = -1;
        } else {
            var_ab422cc1 = 1;
        }
        var_367ba7d3 = startposition + vectorscale(right, var_ab422cc1 * var_d86e4fe0 * var_f77cb43b);
        if (!isdefined(var_196fbc4d)) {
            var_196fbc4d = [];
        } else if (!isarray(var_196fbc4d)) {
            var_196fbc4d = array(var_196fbc4d);
        }
        var_196fbc4d[var_196fbc4d.size] = var_367ba7d3;
    }
    targets = level function_ce402c10(bundle, team, var_d44b8c3e);
    playsoundatposition(#"hash_2fbfd58a6c32dd81", var_ce2c18d3.origin);
    var_ce2c18d3 function_c578ef61(targets, killstreak_id);
    wait(4);
    if (!isdefined(var_ce2c18d3)) {
        return;
    }
    var_ce2c18d3 function_86d35bfe(targets, var_196fbc4d, self);
    var_ce2c18d3 function_568f6426(targets, killstreak_id);
    var_ce2c18d3 thread function_f7961216();
    var_ce2c18d3 function_6fe870ea();
}

// Namespace jetfighter/jetfighter
// Params 0, eflags: 0x6 linked
// Checksum 0x83a3033d, Offset: 0xc00
// Size: 0x284
function private function_6ff76fc6() {
    height = killstreaks::function_43f4782d() + 4000 + randomfloatrange(-200, 200);
    if (sessionmodeiswarzonegame()) {
        height += self.origin[2];
    } else if (level.teams.size == 2) {
        if (isdefined(level.var_3944682)) {
            var_7188db6d = level.var_3944682[self.team];
        } else {
            friendlyspawn = function_77b7335(self.team, "start_spawn");
            enemyspawn = function_77b7335(util::get_enemy_team(self.team), "start_spawn");
        }
    } else if (isdefined(level.var_3944682)) {
        var_7188db6d = array::random(level.var_3944682);
    }
    if (isdefined(var_7188db6d)) {
        angles = var_7188db6d.angles;
        var_d44b8c3e = (var_7188db6d.origin[0], var_7188db6d.origin[1], var_7188db6d.origin[2] + height);
    } else if (isdefined(friendlyspawn) && isdefined(enemyspawn)) {
        var_ed17afc5 = friendlyspawn.origin;
        forward = vectornormalize(enemyspawn.origin - friendlyspawn.origin);
        angles = vectortoangles(forward);
        var_d44b8c3e = (var_ed17afc5[0], var_ed17afc5[1], height);
    } else {
        angles = self.angles;
        var_d44b8c3e = (self.origin[0], self.origin[1], height);
    }
    return {#var_d44b8c3e:var_d44b8c3e, #angles:angles};
}

// Namespace jetfighter/jetfighter
// Params 2, eflags: 0x6 linked
// Checksum 0x7d94c8ec, Offset: 0xe90
// Size: 0x454
function private function_8f304847(var_d44b8c3e, startangles) {
    startforward = anglestoforward(startangles);
    startforward = (startforward[0], startforward[1], 0);
    if (sessionmodeiswarzonegame()) {
        var_51cabd75 = 180 / 30;
        var_ddd8ddab = 20000 * 2.5 / (3 - 1);
        var_c8e01926 = undefined;
        var_37db735d = [];
        var_51c6fb78 = 0;
        forward = startforward;
        angles = startangles;
        while (var_51c6fb78 < var_51cabd75) {
            var_59a518e1 = [];
            for (i = 0; i < 3; i++) {
                position = var_d44b8c3e + vectorscale(forward, -1 * 20000 + var_ddd8ddab * i);
                if (i == 0) {
                    var_90aa61b = position;
                }
                var_b0490eb9 = getheliheightlockheight(position);
                if (var_b0490eb9 != position[2]) {
                    var_59a518e1[var_59a518e1.size] = var_b0490eb9;
                }
            }
            if (var_59a518e1.size) {
                var_59a518e1 = array::sort_by_value(var_59a518e1, 1);
                maxheight = var_59a518e1[var_59a518e1.size - 1];
                var_35637e22 = maxheight - var_59a518e1[0];
                trace = groundtrace((var_d44b8c3e[0], var_d44b8c3e[1], maxheight), var_d44b8c3e - (0, 0, 5000), 0, undefined);
                groundheight = trace[#"position"][2];
                bundle = killstreaks::get_script_bundle("jetfighter");
                var_6b1fb8d9 = groundheight + (maxheight - groundheight) * bundle.var_ff73e08c;
                if (var_35637e22 < 2000) {
                    adjustedpath[#"startposition"] = (var_90aa61b[0], var_90aa61b[1], var_6b1fb8d9);
                    adjustedpath[#"forward"] = forward;
                    adjustedpath[#"angles"] = angles;
                    return adjustedpath;
                }
                if (!isdefined(var_c8e01926) || var_35637e22 < var_c8e01926) {
                    var_c8e01926 = var_35637e22;
                    var_af2fe365[#"startposition"] = (var_90aa61b[0], var_90aa61b[1], var_6b1fb8d9);
                    var_af2fe365[#"forward"] = forward;
                    var_af2fe365[#"angles"] = angles;
                }
            }
            angles += (0, 30, 0);
            forward = anglestoforward(angles);
            var_51c6fb78++;
            waitframe(1);
        }
        if (isdefined(var_af2fe365)) {
            return var_af2fe365;
        }
    }
    adjustedpath[#"startposition"] = var_d44b8c3e + vectorscale(startforward, -1 * 20000);
    adjustedpath[#"forward"] = startforward;
    adjustedpath[#"angles"] = startangles;
    return adjustedpath;
}

// Namespace jetfighter/jetfighter
// Params 3, eflags: 0x6 linked
// Checksum 0xc762052b, Offset: 0x12f0
// Size: 0x274
function private function_ce402c10(bundle, team, var_d44b8c3e) {
    level function_6384fa58();
    maxtargets = bundle.var_1018bb1;
    var_85014cc6 = sqr(bundle.var_41c04fda);
    targets = [];
    foreach (streaktype in level.var_a78d8a55) {
        var_e54ee670 = level.var_500867a0[streaktype];
        if (isarray(var_e54ee670)) {
            foreach (streak in var_e54ee670) {
                if (util::function_fbce7263(streak.team, team)) {
                    if (sessionmodeiswarzonegame() && distance2dsquared(var_d44b8c3e, streak.origin) > var_85014cc6) {
                        continue;
                    }
                    if (!isdefined(targets)) {
                        targets = [];
                    } else if (!isarray(targets)) {
                        targets = array(targets);
                    }
                    targets[targets.size] = streak;
                    streak.killstreakbundle = killstreaks::get_script_bundle(streaktype);
                    if (targets.size >= maxtargets) {
                        return targets;
                    }
                }
            }
        }
    }
    return targets;
}

// Namespace jetfighter/jetfighter
// Params 1, eflags: 0x6 linked
// Checksum 0x7e5cb081, Offset: 0x1570
// Size: 0x268
function private function_a0624137(var_be96ce4e) {
    level function_6384fa58();
    bundle = killstreaks::get_script_bundle("jetfighter");
    var_85014cc6 = sqr(bundle.var_41c04fda);
    targets = [];
    canuse = 0;
    foreach (streaktype in level.var_a78d8a55) {
        var_e54ee670 = level.var_500867a0[streaktype];
        if (isarray(var_e54ee670)) {
            foreach (streak in var_e54ee670) {
                if (util::function_fbce7263(streak.team, self.team)) {
                    if (sessionmodeiswarzonegame() && distance2dsquared(self.origin, streak.origin) > var_85014cc6) {
                        continue;
                    }
                    canuse = 1;
                    break;
                }
            }
        }
        if (canuse) {
            break;
        }
    }
    if (!canuse) {
        canuse = function_3fbf2154(0);
    }
    if (isdefined(var_be96ce4e)) {
        self clientfield::set_player_uimodel(level.var_ce69c3cb[var_be96ce4e], !canuse);
    }
    return canuse;
}

// Namespace jetfighter/jetfighter
// Params 3, eflags: 0x6 linked
// Checksum 0xcc16a88, Offset: 0x17e0
// Size: 0x170
function private function_86d35bfe(targets, var_196fbc4d, owner) {
    self endon(#"hash_658778b8e9e9d13a");
    if (!isdefined(self.var_fb24e6b5)) {
        self.var_fb24e6b5 = [];
    } else if (!isarray(self.var_fb24e6b5)) {
        self.var_fb24e6b5 = array(self.var_fb24e6b5);
    }
    foreach (index, target in targets) {
        if (isdefined(target)) {
            var_5ed3a06 = arraysortclosest(var_196fbc4d, target.origin);
            self thread function_a04ffd9d(target, var_5ed3a06, owner);
            if (index < targets.size - 1) {
                wait(randomfloatrange(0.5, 2));
            }
        }
    }
}

// Namespace jetfighter/jetfighter
// Params 3, eflags: 0x6 linked
// Checksum 0x92df70d2, Offset: 0x1958
// Size: 0x22c
function private function_a04ffd9d(target, var_196fbc4d, owner) {
    self endon(#"hash_658778b8e9e9d13a", #"death");
    target endoncallback(&function_165f8cad, #"death");
    if (!isdefined(target.var_7cc84720)) {
        target.var_7cc84720 = self;
    }
    weapon = getweapon("jetfighter_missile");
    missilesfired = 0;
    while (missilesfired < 1) {
        var_6a709ea1 = 0;
        foreach (var_367ba7d3 in var_196fbc4d) {
            if (isinarray(self.var_fb24e6b5, var_367ba7d3)) {
                continue;
            }
            if (isdefined(owner)) {
                self thread firemissile(target, var_367ba7d3, weapon, owner);
            }
            var_6a709ea1 = 1;
            missilesfired++;
            break;
        }
        if (var_6a709ea1) {
            wait(randomfloatrange(0.5, 2.5));
            continue;
        }
        waitframe(1);
    }
    wait(4);
    target dodamage(9999, target.origin, owner, undefined, undefined, "MOD_PROJECTILE", 0, weapon);
    self function_8f23fd43();
}

// Namespace jetfighter/jetfighter
// Params 1, eflags: 0x6 linked
// Checksum 0x9f904b9e, Offset: 0x1b90
// Size: 0x5c
function private function_165f8cad(*_notify) {
    if (isdefined(self.var_7cc84720) && isdefined(self.var_d02ddb8e) && self.var_d02ddb8e.name === "jetfighter_missile") {
        self.var_7cc84720 function_8f23fd43();
    }
}

// Namespace jetfighter/jetfighter
// Params 0, eflags: 0x6 linked
// Checksum 0x32146292, Offset: 0x1bf8
// Size: 0x10c
function private function_8f23fd43() {
    if (!is_true(self.scoreeventprocessed) && isdefined(self.owner)) {
        self.scoreeventprocessed = 1;
        scoreevents::processscoreevent(#"hash_5432fd0f11d1c9c4", self.owner, undefined, getweapon("jetfighter"));
        self.owner contracts::increment_contract(#"hash_566ff65991651a40");
        self.owner stats::function_8fb23f94("jetfighter", #"destructions", 1);
        self.owner stats::function_b04e7184("jetfighter", #"hash_98b8582b08abfa5");
    }
}

// Namespace jetfighter/jetfighter
// Params 4, eflags: 0x6 linked
// Checksum 0x757ad531, Offset: 0x1d10
// Size: 0x1cc
function private firemissile(target, spawnpoint, weapon, owner) {
    self endon(#"death");
    if (!isdefined(self.var_fb24e6b5)) {
        self.var_fb24e6b5 = [];
    } else if (!isarray(self.var_fb24e6b5)) {
        self.var_fb24e6b5 = array(self.var_fb24e6b5);
    }
    self.var_fb24e6b5[self.var_fb24e6b5.size] = spawnpoint;
    heatseekingmissile::initlockfield(target);
    missile = owner magicmissile(weapon, spawnpoint, vectornormalize(target.origin - spawnpoint), target);
    missile thread function_644ef4bf(target);
    missile missile_settarget(target);
    missile.team = self.team;
    missile setteam(self.team);
    missile.var_30dc969d = 1;
    missile.var_b324d423 = 1;
    target heatseekingmissile::function_a439ae56(missile, weapon, owner);
    wait(randomfloatrange(0.1, 0.75));
    arrayremovevalue(self.var_fb24e6b5, spawnpoint);
}

// Namespace jetfighter/jetfighter
// Params 1, eflags: 0x6 linked
// Checksum 0x649ed308, Offset: 0x1ee8
// Size: 0x6c
function private function_644ef4bf(target) {
    self endon(#"death");
    target waittill(#"death", #"crashing", #"explode");
    self detonate();
}

// Namespace jetfighter/jetfighter
// Params 1, eflags: 0x6 linked
// Checksum 0x1a6dc9da, Offset: 0x1f60
// Size: 0x150
function private function_3fbf2154(var_593a7842 = 1) {
    var_11c5ecfd = killstreakrules::function_7f69aa48("jetfighter");
    if (level.var_3e99cf4e.size) {
        foreach (var_ce2c18d3 in level.var_3e99cf4e) {
            if (util::function_fbce7263(var_ce2c18d3.team, self.team)) {
                if (!isdefined(var_11c5ecfd) || distance2dsquared(var_ce2c18d3.origin, self.origin) <= sqr(var_11c5ecfd)) {
                    if (var_593a7842) {
                        self thread function_593a7842(var_ce2c18d3);
                    }
                    return true;
                }
            }
        }
    }
    return false;
}

// Namespace jetfighter/jetfighter
// Params 1, eflags: 0x6 linked
// Checksum 0x4e51086e, Offset: 0x20b8
// Size: 0xfc
function private function_593a7842(var_6709bbd6) {
    self endon(#"death");
    arrayremovevalue(level.var_3e99cf4e, var_6709bbd6);
    var_6709bbd6 notify(#"hash_658778b8e9e9d13a");
    wait(2);
    if (isdefined(var_6709bbd6)) {
        self thread function_1e2a93a2(var_6709bbd6);
    }
    playsoundatposition("mpl_dogfight_base_quad", self.origin);
    self thread function_cc4c1fca();
    self scene::play(#"p9_fxanim_mp_dogfight_01_bundle");
    if (isdefined(var_6709bbd6)) {
        var_6709bbd6 notify(#"hash_3776146d4b415f0c");
    }
    self function_da1b219d();
}

// Namespace jetfighter/jetfighter
// Params 0, eflags: 0x2 linked
// Checksum 0xa9678540, Offset: 0x21c0
// Size: 0x4c
function function_cc4c1fca() {
    wait(4);
    scoreevents::processscoreevent(#"hash_52373301253712bb", self.owner, undefined, getweapon("jetfighter"));
}

// Namespace jetfighter/jetfighter
// Params 0, eflags: 0x6 linked
// Checksum 0x7ed38de9, Offset: 0x2218
// Size: 0x54
function private function_da1b219d() {
    self killstreakrules::killstreakstop("jetfighter", self.team, self.killstreak_id);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace jetfighter/jetfighter
// Params 1, eflags: 0x6 linked
// Checksum 0x66c8bcd6, Offset: 0x2278
// Size: 0x44
function private function_47cd37b6(*notifyhash) {
    self waittill(#"death", #"hash_3776146d4b415f0c");
    self function_da1b219d();
}

// Namespace jetfighter/jetfighter
// Params 0, eflags: 0x6 linked
// Checksum 0xc0d72e27, Offset: 0x22c8
// Size: 0x5c
function private function_f7961216() {
    arrayremovevalue(level.var_3e99cf4e, self);
    self scene::play(#"p9_fxanim_mp_jetfighter_bundle");
    self function_da1b219d();
}

// Namespace jetfighter/jetfighter
// Params 1, eflags: 0x6 linked
// Checksum 0xbc5adb23, Offset: 0x2330
// Size: 0x1e8
function private function_c3c5d5e1(var_f7d31a7) {
    foreach (jet in var_f7d31a7) {
        jet killstreaks::configure_team("jetfighter", self.killstreak_id, self.owner, undefined, undefined, undefined);
        jet thread killstreaks::function_5a7ecb6b();
        jet clientfield::set("jetfighter_contrail", 1);
        jet playloopsound(#"hash_1245719ce362e37");
    }
    scenelength = scene::function_12479eba(#"p9_fxanim_mp_jetfighter_bundle");
    wait(scenelength - 1.5);
    foreach (jet in var_f7d31a7) {
        if (isdefined(jet)) {
            jet clientfield::set("jetfighter_contrail", 0);
            jet thread killstreaks::function_3696d106();
        }
    }
}

// Namespace jetfighter/jetfighter
// Params 2, eflags: 0x2 linked
// Checksum 0xaf11e3bc, Offset: 0x2520
// Size: 0x64
function function_c578ef61(targets, killstreak_id) {
    if (targets.size > 0) {
        dialogkey = "arrive";
    } else {
        dialogkey = "targetLost";
    }
    self namespace_f9b02f80::play_pilot_dialog_on_owner(dialogkey, "jetfighter", killstreak_id);
}

// Namespace jetfighter/jetfighter
// Params 2, eflags: 0x2 linked
// Checksum 0x20279e89, Offset: 0x2590
// Size: 0x114
function function_568f6426(targets, killstreak_id) {
    var_eb1ffad9 = isdefined(targets.size) ? targets.size : 0;
    switch (var_eb1ffad9) {
    case 0:
        dialogkey = "killNone";
        break;
    case 1:
        dialogkey = "kill1";
        break;
    case 2:
        dialogkey = "kill2";
        break;
    case 3:
        dialogkey = "kill3";
        break;
    default:
        dialogkey = "killMultiple";
        break;
    }
    self namespace_f9b02f80::play_pilot_dialog_on_owner(dialogkey, "jetfighter", killstreak_id);
}

// Namespace jetfighter/jetfighter
// Params 1, eflags: 0x2 linked
// Checksum 0x59a90f20, Offset: 0x26b0
// Size: 0xac
function function_1e2a93a2(var_6709bbd6) {
    self namespace_f9b02f80::play_pilot_dialog_on_owner("activateCounter", "jetfighter", self.killstreak_id);
    var_6709bbd6 namespace_f9b02f80::play_destroyed_dialog_on_owner("jetfighter", self.killstreak_id);
    self namespace_f9b02f80::play_pilot_dialog_on_owner("killAircraft", "jetfighter", self.killstreak_id);
    self function_6fe870ea();
}

// Namespace jetfighter/jetfighter
// Params 0, eflags: 0x2 linked
// Checksum 0x3c3c5e66, Offset: 0x2768
// Size: 0x34
function function_6fe870ea() {
    self namespace_f9b02f80::play_taacom_dialog_response_on_owner("timeoutConfirmed", "jetfighter", self.killstreak_id);
}

/#

    // Namespace jetfighter/jetfighter
    // Params 0, eflags: 0x0
    // Checksum 0xea724d4d, Offset: 0x27a8
    // Size: 0x5c
    function function_35b87c52() {
        util::init_dvar("<unknown string>", 0, &function_2f5700b4);
        util::waittill_can_add_debug_command();
        adddebugcommand("<unknown string>");
    }

    // Namespace jetfighter/jetfighter
    // Params 1, eflags: 0x0
    // Checksum 0x50cf78a9, Offset: 0x2810
    // Size: 0x194
    function function_2f5700b4(params) {
        if (params.value) {
            player = getplayers()[0];
            var_10c3dd58 = player function_6ff76fc6();
            var_d44b8c3e = var_10c3dd58.var_d44b8c3e;
            angles = var_10c3dd58.angles;
            adjustedpath = function_8f304847(var_d44b8c3e, angles);
            startposition = adjustedpath[#"startposition"];
            angles = adjustedpath[#"angles"];
            var_a50bad8f = util::spawn_model("<unknown string>", (var_d44b8c3e[0], var_d44b8c3e[1], startposition[2]), angles);
            playsoundatposition("<unknown string>", var_a50bad8f.origin);
            var_a50bad8f scene::play(#"p9_fxanim_mp_dogfight_01_bundle");
            var_a50bad8f delete();
            setdvar(#"hash_62c0e40b6a2a602d", 0);
        }
    }

#/
