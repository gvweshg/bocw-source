// Atian COD Tools GSC CW decompiler test
#using script_3d64d88008582147;
#using scripts\core_common\item_world.gsc;
#using scripts\core_common\flag_shared.gsc;
#using script_27347f09888ad15;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\aats\ammomods\ammomod_cryofreeze.gsc;
#using script_34ab99a4ca1a43d;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_471b31bd963b388e;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_45ec1026;

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 0, eflags: 0x5
// Checksum 0x5cce2c7a, Offset: 0x358
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"hash_68ea361a06c5f8ed", undefined, &init, undefined, undefined);
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 0, eflags: 0x2 linked
// Checksum 0xc4746df1, Offset: 0x3a0
// Size: 0x5bc
function init() {
    if ((is_true(getgametypesetting(#"hash_7e8e34cc69a77e0b")) || getdvarint(#"hash_40bd34b35079cf2e", 0) > 0) && (zm_utility::function_c200446c() || util::get_game_type() === #"hash_321225a5ce1eb35")) {
        level.var_70b6f044 = [#"hash_5f22ecce894282fa":#"hash_796dff2ea842c1ac", #"hash_12a17ab3df5889eb":#"hash_2792674ef4fce09f", #"spawner_zm_steiner":#"hash_43b8d4f24851653e", #"spawner_zm_steiner_split_radiation_blast":#"hash_2c0da7720a1c2f90", #"spawner_zm_steiner_split_radiation_bomb":#"hash_16d309f1ce9e015a"];
        level.var_9d098364 = #"hash_43b8d4f24851653e";
        level.var_c42bdd1b = #"hash_2c0da7720a1c2f90";
        level.var_dc38daf = #"hash_16d309f1ce9e015a";
        level.var_d3d40dcb = #"hash_156c697af81feaf9";
        level.var_68b26ea = #"hash_2c0da7720a1c2f90";
        level.var_887c5017 = #"hash_16d309f1ce9e015a";
        level thread function_3a268da9();
        callback::on_ai_damage(&on_ai_damaged);
        callback::on_ai_killed(&on_ai_killed);
        level.var_77143112 = [];
        if (isdefined(level.var_d4c0ef1a)) {
            foreach (zone in level.var_d4c0ef1a) {
                if (level.var_8de4d059 === #"mp_cartel" && zone.script_index === 1) {
                    continue;
                }
                if (!isdefined(level.var_77143112)) {
                    level.var_77143112 = [];
                } else if (!isarray(level.var_77143112)) {
                    level.var_77143112 = array(level.var_77143112);
                }
                if (!isinarray(level.var_77143112, zone)) {
                    level.var_77143112[level.var_77143112.size] = zone;
                }
                if (!isdefined(zone.var_6284d1b2)) {
                    zone.var_6284d1b2 = [];
                }
                zone.var_9c75f552 = 1;
                var_544ae93d = tacticalquery("onslaught_tacticalquery_large", zone.origin, zone);
                for (i = 0; i < 10; i++) {
                    if (isarray(var_544ae93d) && var_544ae93d.size) {
                        rand_index = randomint(var_544ae93d.size);
                        snow_mound = spawnstruct();
                        snow_mound.origin = var_544ae93d[rand_index].origin;
                        if (!isdefined(zone.var_6284d1b2)) {
                            zone.var_6284d1b2 = [];
                        } else if (!isarray(zone.var_6284d1b2)) {
                            zone.var_6284d1b2 = array(zone.var_6284d1b2);
                        }
                        if (!isinarray(zone.var_6284d1b2, snow_mound)) {
                            zone.var_6284d1b2[zone.var_6284d1b2.size] = snow_mound;
                        }
                        arrayremoveindex(var_544ae93d, rand_index);
                    }
                }
                if (!isdefined(zone.var_a5015123)) {
                    zone.var_a5015123 = [];
                }
            }
        }
        level thread function_128f3b6b();
        level.var_162c45e4 = 1;
        level.var_72182681 = 1;
        thread function_e71942eb();
        callback::on_spawned(&function_8f677e13);
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 0, eflags: 0x2 linked
// Checksum 0x27b41a59, Offset: 0x968
// Size: 0x388
function function_e71942eb() {
    level endon(#"end_game");
    waittillframeend();
    level flag::wait_till("all_players_spawned");
    players = getplayers();
    var_3e9f9f65 = spawn("script_origin", players[0].origin);
    if (!isdefined(level.var_77143112)) {
        level.var_77143112 = [];
    } else if (!isarray(level.var_77143112)) {
        level.var_77143112 = array(level.var_77143112);
    }
    if (!isinarray(level.var_77143112, var_3e9f9f65)) {
        level.var_77143112[level.var_77143112.size] = var_3e9f9f65;
    }
    if (!isdefined(var_3e9f9f65.var_6284d1b2)) {
        var_3e9f9f65.var_6284d1b2 = [];
    }
    var_544ae93d = tacticalquery("onslaught_tacticalquery_large", var_3e9f9f65.origin, var_3e9f9f65);
    for (i = 0; i < 10; i++) {
        if (isarray(var_544ae93d) && var_544ae93d.size) {
            rand_index = randomint(var_544ae93d.size);
            snow_mound = spawnstruct();
            snow_mound.origin = var_544ae93d[rand_index].origin;
            if (!isdefined(var_3e9f9f65.var_6284d1b2)) {
                var_3e9f9f65.var_6284d1b2 = [];
            } else if (!isarray(var_3e9f9f65.var_6284d1b2)) {
                var_3e9f9f65.var_6284d1b2 = array(var_3e9f9f65.var_6284d1b2);
            }
            if (!isinarray(var_3e9f9f65.var_6284d1b2, snow_mound)) {
                var_3e9f9f65.var_6284d1b2[var_3e9f9f65.var_6284d1b2.size] = snow_mound;
            }
            arrayremoveindex(var_544ae93d, rand_index);
        }
    }
    if (!isdefined(var_3e9f9f65.var_a5015123)) {
        var_3e9f9f65.var_a5015123 = [];
    }
    var_3e9f9f65.var_9c75f552 = 1;
    function_bf79a643();
    foreach (player in players) {
        player thread function_6f65e552();
        player function_8f677e13();
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 0, eflags: 0x2 linked
// Checksum 0xd7e12714, Offset: 0xcf8
// Size: 0x86
function function_6f65e552() {
    self endon(#"death", #"disconnect");
    var_4531f22a = 0;
    while (true) {
        if (var_4531f22a >= 3) {
            return;
        }
        self waittill(#"loadout_given");
        var_4531f22a++;
        self function_8f677e13();
        wait(1);
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 0, eflags: 0x2 linked
// Checksum 0x944663f8, Offset: 0xd88
// Size: 0x522
function function_bf79a643() {
    foreach (zone in level.var_77143112) {
        if (!isdefined(zone.var_6cff21f5)) {
            zone.var_6cff21f5 = 0;
        }
        if (!isdefined(zone.var_e600b8df)) {
            zone.var_e600b8df = 0;
        }
        if (isdefined(zone.var_a5015123)) {
            function_1eaaceab(zone.var_a5015123);
            if (zone.var_e600b8df < 2) {
                index = 0;
                if (zone.var_6284d1b2.size === 0) {
                    continue;
                } else if (zone.var_6284d1b2.size > 1) {
                    index = randomint(zone.var_6284d1b2.size);
                }
                var_e779ff3c = 0;
                players_in_range = getplayers(undefined, zone.var_6284d1b2[index].origin, 740);
                players = getplayers();
                foreach (player in players) {
                    if (player util::is_looking_at(zone.var_6284d1b2[index], 0.8, 1, (0, 0, 32))) {
                        var_e779ff3c = 1;
                    }
                }
                if (is_true(zone.var_9c75f552) || var_e779ff3c === 0 && players_in_range.size === 0 && (!isdefined(zone.var_6284d1b2[index].var_9ae54d14) || zone.var_6284d1b2[index].var_9ae54d14 < gettime() - 30000)) {
                    zone.var_6284d1b2[index] function_4d68903d(zone);
                    arrayremoveindex(zone.var_6284d1b2, index);
                }
            }
            function_1eaaceab(zone.var_a5015123);
            if (zone.var_6cff21f5 < 3) {
                index = 0;
                if (zone.var_6284d1b2.size === 0) {
                    continue;
                } else if (zone.var_6284d1b2.size > 1) {
                    index = randomint(zone.var_6284d1b2.size);
                }
                var_e779ff3c = 0;
                players_in_range = getplayers(undefined, zone.var_6284d1b2[index].origin, 740);
                players = getplayers();
                foreach (player in players) {
                    if (player util::is_looking_at(zone.var_6284d1b2[index], 0.8, 1, (0, 0, 16))) {
                        var_e779ff3c = 1;
                    }
                }
                if (is_true(zone.var_9c75f552) || var_e779ff3c === 0 && players_in_range.size === 0) {
                    zone.var_6284d1b2[index] function_f5527ca2(zone);
                    arrayremoveindex(zone.var_6284d1b2, index);
                }
            }
            zone.var_9c75f552 = 0;
        }
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 0, eflags: 0x2 linked
// Checksum 0x56e514b4, Offset: 0x12b8
// Size: 0x38
function function_128f3b6b() {
    while (true) {
        level waittill(#"hash_5797e93787e36c6d");
        function_bf79a643();
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 1, eflags: 0x6 linked
// Checksum 0xeee3af3d, Offset: 0x12f8
// Size: 0x50
function private function_dd028fcb(e_player) {
    var_d49d10b0 = e_player zm_loadout::get_player_lethal_grenade();
    self sethintstring(#"hash_302511d2e9a9429b");
    return true;
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 0, eflags: 0x2 linked
// Checksum 0xf31b0392, Offset: 0x1350
// Size: 0x22a
function function_8f677e13() {
    self endon(#"disconnect", #"death");
    waittillframeend();
    item = function_4ba8fde("snowball_item_sr");
    currentweapon = self getcurrentweapon();
    if (isdefined(item)) {
        if (self item_inventory::function_bba770de(item.itementry) === 5) {
            return;
        }
        var_fbf4dc0d = self item_inventory::function_bba770de(item.itementry);
        var_ff2621e6 = 5 - var_fbf4dc0d;
        item.itementry.amount = var_ff2621e6;
        var_fa3df96 = self item_inventory::function_e66dcff5(item);
        if (isdefined(var_fa3df96)) {
            if (!item_world_util::function_db35e94f(item.networkid)) {
                item.networkid = item_world_util::function_970b8d86(var_fa3df96);
            }
            item.hidetime = 0;
            if (self.inventory.items[var_fa3df96].networkid != 32767 && self.inventory.items[var_fa3df96].itementry.name != item.itementry.name) {
                self item_inventory::function_fba40e6c(item);
            } else {
                item_world::function_de2018e3(item, self, var_fa3df96);
            }
        } else {
            item_world::function_de2018e3(item, self, var_fa3df96);
        }
        item.itementry.amount = 1;
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 0, eflags: 0x6 linked
// Checksum 0x9e2b945c, Offset: 0x1588
// Size: 0x200
function private function_608b90b4() {
    self endon(#"end_game", #"death");
    self.var_e95e6830 = 5;
    while (true) {
        s_notify = self waittill(#"trigger_activated");
        e_player = s_notify.e_who;
        e_player function_79ef6b93(self);
        if (!is_true(e_player.var_61fca2c3)) {
            e_player.var_61fca2c3 = 1;
        }
        if (self.var_e95e6830 <= 0) {
            if (!isdefined(self.zone.var_6284d1b2)) {
                self.zone.var_6284d1b2 = [];
            } else if (!isarray(self.zone.var_6284d1b2)) {
                self.zone.var_6284d1b2 = array(self.zone.var_6284d1b2);
            }
            if (!isinarray(self.zone.var_6284d1b2, self.mound)) {
                self.zone.var_6284d1b2[self.zone.var_6284d1b2.size] = self.mound;
            }
            self.zone.var_6cff21f5--;
            zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
            playfx("maps/ltm/fx9_winter_snowball_pile_pickup", self.origin);
            self delete();
        }
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 1, eflags: 0x2 linked
// Checksum 0x229e0f3f, Offset: 0x1790
// Size: 0x37e
function function_79ef6b93(snowball_pile) {
    self endon(#"disconnect", #"death");
    self playsound("fly_pickup_snowball");
    item = function_4ba8fde("snowball_item_sr");
    currentweapon = self getcurrentweapon();
    if (isdefined(item)) {
        if (self item_inventory::function_bba770de(item.itementry) === 5) {
            return;
        }
        var_fbf4dc0d = self item_inventory::function_bba770de(item.itementry);
        var_ff2621e6 = 5 - var_fbf4dc0d;
        if (var_ff2621e6 > snowball_pile.var_e95e6830) {
            var_ff2621e6 = snowball_pile.var_e95e6830;
        }
        item.itementry.amount = var_ff2621e6;
        var_fa3df96 = self item_inventory::function_e66dcff5(item);
        if (isdefined(var_fa3df96)) {
            if (!item_world_util::function_db35e94f(item.networkid)) {
                item.networkid = item_world_util::function_970b8d86(var_fa3df96);
            }
            item.hidetime = 0;
            if (self.inventory.items[var_fa3df96].networkid != 32767 && self.inventory.items[var_fa3df96].itementry.name != item.itementry.name) {
                self item_inventory::function_fba40e6c(item);
                for (i = 0; i < var_ff2621e6 - 1; i++) {
                    item_world::function_de2018e3(item, self, var_fa3df96);
                }
            } else {
                for (i = 0; i < var_ff2621e6; i++) {
                    item_world::function_de2018e3(item, self, var_fa3df96);
                }
            }
        } else {
            for (i = 0; i < var_ff2621e6; i++) {
                item_world::function_de2018e3(item, self, var_fa3df96);
            }
        }
        item.itementry.amount = 1;
        if (snowball_pile.var_8438fd5c === 1) {
            snowball_pile.var_8438fd5c = 0;
            playfx("maps/ltm/fx9_winter_snowball_pile_pickup", self.origin);
            snowball_pile setmodel("p8_wz_snowball_pile_sml");
        }
        if (var_ff2621e6 > 0) {
            playfx("maps/ltm/fx9_winter_snowball_pile_pickup", snowball_pile.origin);
        }
        snowball_pile.var_e95e6830 -= var_ff2621e6;
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 1, eflags: 0x2 linked
// Checksum 0x139fdaf4, Offset: 0x1b18
// Size: 0x1ec
function function_f5527ca2(zone) {
    playfx("maps/ltm/fx9_winter_snowball_pile_pickup", self.origin);
    snowball_pile = spawn("script_model", self.origin);
    snowball_pile setmodel("p8_wz_snowball_pile");
    snowball_pile.targetname = "snowball_pile";
    snowball_pile.mound = self;
    snowball_pile.zone = zone;
    snowball_pile.zone.var_6cff21f5++;
    snowball_pile.var_8438fd5c = 1;
    snowball_pile function_619a5c20();
    snowball_pile zm_unitrigger::create(&function_dd028fcb, 64);
    snowball_pile.s_unitrigger.origin += (0, 0, 32);
    function_1eaaceab(zone.var_a5015123);
    if (!isdefined(zone.var_a5015123)) {
        zone.var_a5015123 = [];
    } else if (!isarray(zone.var_a5015123)) {
        zone.var_a5015123 = array(zone.var_a5015123);
    }
    if (!isinarray(zone.var_a5015123, snowball_pile)) {
        zone.var_a5015123[zone.var_a5015123.size] = snowball_pile;
    }
    snowball_pile thread function_608b90b4();
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 1, eflags: 0x2 linked
// Checksum 0x5d460f37, Offset: 0x1d10
// Size: 0x274
function function_4d68903d(zone) {
    self endon(#"death");
    playfx("_t7/snow/fx_snow_impact_lg", self.origin + (0, 0, 30));
    var_948a74e8 = randomintrange(0, 360);
    snowman = util::spawn_model("p9_nt6x_win_snowman", self.origin, (0, var_948a74e8, 0));
    snowman.takedamage = 1;
    snowman.health = 100;
    snowman.var_493b77d4 = 1;
    snowman.var_defc3cee = 1;
    snowman.mound = self;
    snowman.zone = zone;
    snowman.zone.var_e600b8df++;
    snowman.spawn_time = gettime();
    snowman.var_5d6eb0f1 = 1;
    snowman solid();
    snowman setcandamage(1);
    self.var_38409c6 = "snowman";
    self.snowman = snowman;
    function_1eaaceab(zone.var_a5015123);
    if (!isdefined(zone.var_a5015123)) {
        zone.var_a5015123 = [];
    } else if (!isarray(zone.var_a5015123)) {
        zone.var_a5015123 = array(zone.var_a5015123);
    }
    if (!isinarray(zone.var_a5015123, snowman)) {
        zone.var_a5015123[zone.var_a5015123.size] = snowman;
    }
    snowman thread function_dc8f034(self.snowman);
    var_c416888f = randomint(100);
    if (var_c416888f < 100) {
        snowman thread function_36043197();
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 0, eflags: 0x2 linked
// Checksum 0xc810a530, Offset: 0x1f90
// Size: 0x2fc
function function_36043197() {
    self endon(#"death");
    var_47b592ad = randomfloatrange(1250, 7000);
    level flag::wait_till("gameplay_started");
    while (true) {
        players = function_a1ef346b(#"allies", self.origin, 750);
        if (players.size === 0) {
            self.spawn_time = gettime();
        }
        foreach (player in players) {
            if (player util::is_looking_at(self, 0.8, 1, (0, 0, 32))) {
                if (self.spawn_time < gettime() - var_47b592ad) {
                    if (!isdefined(self.var_bd710417)) {
                        self.var_bd710417 = [];
                    }
                    if (isdefined(self.var_bd710417[player getentitynumber()])) {
                        if (self.var_bd710417[player getentitynumber()] === 0) {
                            self.var_bd710417[player getentitynumber()] = gettime();
                        } else if (self.var_bd710417[player getentitynumber()] < gettime() - 500) {
                            if (!is_true(self.var_624e969b)) {
                                self thread zm_utility::function_e77fca72();
                            }
                            wait(0.5);
                            self.zone.var_e600b8df--;
                            self.var_9d1762d6 = 1;
                            self.mound thread function_87490b97(self.zone);
                            self.mound.var_9ae54d14 = gettime();
                            self function_856d0105();
                        }
                    } else {
                        self.var_bd710417[player getentitynumber()] = gettime();
                    }
                }
                continue;
            }
            self.var_bd710417[player getentitynumber()] = 0;
        }
        wait(0.25);
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 1, eflags: 0x2 linked
// Checksum 0xe9001973, Offset: 0x2298
// Size: 0x178
function function_87490b97(zone) {
    self endon(#"death");
    spawner = #"hash_796dff2ea842c1ac";
    point = getclosestpointonnavmesh(self.origin, 32, 16);
    if (isdefined(point)) {
        ai = spawnactor(spawner, point, self.snowman.angles);
        ai thread function_d6ad49c2();
    }
    self function_a9114898(self.snowman.origin, self.snowman.angles);
    if (!isdefined(zone.var_6284d1b2)) {
        zone.var_6284d1b2 = [];
    } else if (!isarray(zone.var_6284d1b2)) {
        zone.var_6284d1b2 = array(zone.var_6284d1b2);
    }
    if (!isinarray(zone.var_6284d1b2, self)) {
        zone.var_6284d1b2[zone.var_6284d1b2.size] = self;
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 0, eflags: 0x2 linked
// Checksum 0x36f1ec8f, Offset: 0x2418
// Size: 0xf0
function function_d6ad49c2() {
    waitresult = self waittill(#"death");
    attacker = waitresult.attacker;
    if (!isplayer(attacker)) {
        return;
    }
    level.var_d1876457 = self.origin;
    if (isdefined(level.var_bc2071f) && isdefined(level.var_3a23a27)) {
        level.var_bc2071f = min(100, level.var_bc2071f + level.var_3a23a27);
    }
    self clientfield::set("orb_soul_capture_fx", 1);
    level notify(#"hash_221bff60f501cbaf");
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 2, eflags: 0x2 linked
// Checksum 0x65354f83, Offset: 0x2510
// Size: 0xb4
function function_a9114898(origin, angles) {
    self endon(#"death");
    fwd = anglestoforward(angles);
    up = anglestoup(angles);
    playfx("maps/ltm/fx9_winter_snowman_dest", origin, fwd, up);
    playsoundatposition(#"hash_a00a48925a72e55", origin + (0, 0, 30));
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 1, eflags: 0x2 linked
// Checksum 0xe2633e12, Offset: 0x25d0
// Size: 0x218
function function_dc8f034(*snowman) {
    self endon(#"death");
    while (true) {
        waitresult = self waittill(#"damage");
        self function_96244838(waitresult.weapon, waitresult.attacker);
        if (self.health <= 0 && !is_true(self.var_9d1762d6)) {
            self.mound function_a9114898(self.origin, self.angles);
            self function_83cb84d3(#"hash_24af9f98f7899474", 1, 0);
            self setmodel("tag_origin");
            self.zone.var_e600b8df--;
            if (!isdefined(self.zone.var_6284d1b2)) {
                self.zone.var_6284d1b2 = [];
            } else if (!isarray(self.zone.var_6284d1b2)) {
                self.zone.var_6284d1b2 = array(self.zone.var_6284d1b2);
            }
            if (!isinarray(self.zone.var_6284d1b2, self.mound)) {
                self.zone.var_6284d1b2[self.zone.var_6284d1b2.size] = self.mound;
            }
            self.mound.var_9ae54d14 = gettime();
            self function_856d0105();
        }
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 0, eflags: 0x2 linked
// Checksum 0x60125631, Offset: 0x27f0
// Size: 0x24
function function_856d0105() {
    if (isdefined(self)) {
        self deletedelay();
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 1, eflags: 0x2 linked
// Checksum 0x36656131, Offset: 0x2820
// Size: 0x1ac
function function_3a268da9(*params) {
    self endon(#"endgame");
    while (true) {
        waitresult = level waittill(#"hash_4a4f23c60bbb7f6f");
        if (waitresult.itemname === "item_zm_ltm_holiday_gift_01" || waitresult.itemname === "item_zm_ltm_holiday_gift_02" || waitresult.itemname === "item_zm_ltm_holiday_gift_03") {
            switch (waitresult.itemname) {
            case #"item_zm_ltm_holiday_gift_01":
                waitresult.item function_83cb84d3(#"hash_3adefdb432d5b064", 0, 1, waitresult.item.var_7b02ac6a);
                break;
            case #"item_zm_ltm_holiday_gift_02":
                waitresult.item function_83cb84d3(#"hash_3adefdb432d5b064", 0, 1, waitresult.item.var_7b02ac6a);
                break;
            case #"item_zm_ltm_holiday_gift_03":
                waitresult.item function_83cb84d3(#"hash_3adefdb432d5b064", 0, 1, waitresult.item.var_7b02ac6a);
                break;
            }
        }
        waitframe(1);
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 5, eflags: 0x2 linked
// Checksum 0xf9d0a5da, Offset: 0x29d8
// Size: 0x23c
function function_83cb84d3(var_20287981, var_3798631c, var_b9012667, var_63942b62, var_6ff6be61) {
    var_7580ce3e = spawnstruct();
    var_7580ce3e.origin = self.origin;
    var_7580ce3e.angles = self.angles;
    var_7580ce3e.var_738dfc81 = 1;
    var_7580ce3e.scriptmodel = self;
    if (var_3798631c === 1 && is_true(level.var_72182681) && !is_true(var_6ff6be61)) {
        level.var_72182681 = 0;
        var_9b2da190 = "ltm_chest_item_list";
    } else if (var_3798631c === 1 && is_true(level.var_162c45e4) && is_true(var_6ff6be61)) {
        level.var_162c45e4 = 0;
        var_9b2da190 = "ltm_chest_item_list";
    } else if (var_3798631c === 1) {
        var_9b2da190 = namespace_58949729::function_fd5e77fa(var_20287981);
    } else if (var_b9012667 === 1) {
        var_59364773 = 0;
        if (var_63942b62 === 1) {
            var_59364773 = 1;
        }
        var_9b2da190 = namespace_58949729::function_257d7203(var_20287981, var_59364773);
    } else {
        var_9b2da190 = namespace_58949729::function_257d7203(var_20287981);
    }
    if (var_b9012667 === 1) {
        level thread namespace_58949729::function_f82f361c(var_7580ce3e, var_9b2da190, 0, 1);
    } else {
        level thread namespace_58949729::function_f82f361c(var_7580ce3e, var_9b2da190, 2, 1);
    }
    var_7580ce3e struct::delete();
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 2, eflags: 0x2 linked
// Checksum 0xc56a4fa5, Offset: 0x2c20
// Size: 0x9c
function function_96244838(weapon, attacker) {
    self endon(#"death");
    if (isdefined(weapon) && isdefined(attacker) && isplayer(attacker)) {
        var_594a2d34 = isdefined(weapon) && isdefined(weapon.var_965cc0b3) && weapon.var_965cc0b3;
        attacker util::show_hit_marker(0, var_594a2d34);
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 1, eflags: 0x2 linked
// Checksum 0x7d95ad79, Offset: 0x2cc8
// Size: 0x114
function on_ai_damaged(params) {
    if (params.weapon.name === #"snowball" && !(self.var_6f84b820 === #"elite")) {
        if (!isdefined(self.var_2b2c16c7)) {
            self.var_2b2c16c7 = {};
        }
        self.var_2b2c16c7 = {#time:gettime(), #player:params.eattacker};
        if (params.idamage >= self.health) {
            self.var_b69c12bc = 0;
        }
        if (params.eattacker zm_powerups::is_insta_kill_active()) {
            self.var_958cf9c5 = 1;
            return;
        }
        self thread ammomod_cryofreeze::function_f00409f3(params.eattacker, undefined, params.weapon, 0, 3);
    }
}

// Namespace namespace_45ec1026/namespace_45ec1026
// Params 1, eflags: 0x2 linked
// Checksum 0x9d562c3d, Offset: 0x2de8
// Size: 0x1bc
function on_ai_killed(params) {
    if (self.var_958cf9c5 === 1 && isdefined(self.var_2b2c16c7) && self.var_2b2c16c7.time > gettime() - 4000) {
        self.var_aa2ce9a4 = 1;
        if (getdvar(#"hash_12465a7e77cbf476", 0) == 1 && zm_utility::is_player_valid(params.eattacker, 0, 0)) {
            params.eattacker zm_stats::increment_challenge_stat(#"hash_558f7942e2401eff", undefined, 1);
        }
        if (zm_utility::is_player_valid(self.var_2b2c16c7.player, 0, 0)) {
            if (self.var_2b2c16c7.player === params.eattacker) {
                scoreevents::processscoreevent(#"hash_62d538ab42fe8565", params.eattacker, self, params.weapon);
            } else {
                scoreevents::processscoreevent(#"hash_1fb5d644e5408000", params.eattacker, self, params.weapon);
            }
        }
        self function_83cb84d3(#"hash_24af9f98f7899474", 1, 0, undefined, 1);
    }
}

