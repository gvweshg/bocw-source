// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using script_3411bb48d41bd3b;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\zm_intel.gsc;
#using scripts\zm_common\zm_hazard.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\ultimate_turret_shared.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\turret_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_178eb32b;

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 0, eflags: 0x2 linked
// Checksum 0x92869acd, Offset: 0x380
// Size: 0x2a4
function init() {
    clientfield::register("scriptmover", "" + #"hash_eb1d61f9d0ab6ab", 1, 2, "int");
    clientfield::register("scriptmover", "" + #"hash_4ace5aed82d35b19", 1, 1, "int");
    clientfield::register("toplayer", "" + #"hash_32d35af47559b320", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_575d68a64ff032b2", 1, 1, "counter");
    clientfield::register("scriptmover", "" + #"hash_16e5e4d2ea0716b7", 1, 2, "int");
    level.var_cd78299 = new class_c6c0e94();
    [[ level.var_cd78299 ]]->initialize(#"hash_6d4e01e572e9f81f", 1, float(function_60d95f53()) / 1000);
    level.var_d94359b = [];
    level.var_9040138a = 0.2;
    var_ebcd5c24 = getentarray("sentry_turret_switch", "targetname");
    var_ebcd5c24 array::thread_all(var_ebcd5c24, &function_ff3d341d);
    level.var_9e7b0d9 = getweapon(#"hash_6cbce408f40df23d");
    zm::register_actor_damage_callback(&function_de54ff01);
    level.var_f339857a = ["zone_no_mans_land_2", "zone_no_mans_land_3"];
    /#
        level thread function_37597f29();
    #/
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 0, eflags: 0x2 linked
// Checksum 0x106fed74, Offset: 0x630
// Size: 0x394
function function_ff3d341d() {
    level endon(#"end_game");
    var_dd87782c = getentarray(self.target, "targetname");
    foreach (entity in var_dd87782c) {
        if (entity.script_noteworthy === "sentry_turret_base") {
            if (!isdefined(level.var_d94359b)) {
                level.var_d94359b = [];
            } else if (!isarray(level.var_d94359b)) {
                level.var_d94359b = array(level.var_d94359b);
            }
            if (!isinarray(level.var_d94359b, entity)) {
                level.var_d94359b[level.var_d94359b.size] = entity;
            }
            if (!isdefined(self.var_e0b939d3)) {
                self.var_e0b939d3 = [];
            } else if (!isarray(self.var_e0b939d3)) {
                self.var_e0b939d3 = array(self.var_e0b939d3);
            }
            if (!isinarray(self.var_e0b939d3, entity)) {
                self.var_e0b939d3[self.var_e0b939d3.size] = entity;
            }
        }
    }
    array::thread_all(self.var_e0b939d3, &function_855c1e52);
    self.var_d6b3b6e0 = util::spawn_model(#"p8_zm_off_trap_switch_light", self gettagorigin("tag_top"), self.angles);
    self.var_fdec2822 = util::spawn_model(#"p8_zm_off_trap_switch_handle", self gettagorigin("tag_up"), self.angles);
    self function_7265ebeb(undefined);
    self.var_37db5cf = 0;
    self.var_c1b23abb = 2000;
    var_2ef9ada1 = self.var_fdec2822 zm_unitrigger::create(&function_89a0bd84, 64, &function_91f37293);
    var_2ef9ada1.var_4326facc = self;
    level flag::wait_till("power_on");
    self function_7265ebeb(0);
    self.var_d6b3b6e0 clientfield::set("" + #"hash_16e5e4d2ea0716b7", 1);
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 1, eflags: 0x2 linked
// Checksum 0xdd84503a, Offset: 0x9d0
// Size: 0xa4
function function_7265ebeb(b_on) {
    if (isdefined(b_on)) {
        if (b_on) {
            self.var_d6b3b6e0 setmodel(#"p8_zm_off_trap_switch_light_green_on");
        } else {
            self.var_d6b3b6e0 setmodel(#"p8_zm_off_trap_switch_light_red_on");
        }
        return;
    }
    self.var_d6b3b6e0 setmodel(#"p8_zm_off_trap_switch_light");
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 1, eflags: 0x2 linked
// Checksum 0xcab6f37c, Offset: 0xa80
// Size: 0x144
function function_89a0bd84(e_player) {
    if (isplayer(e_player)) {
        if (!level flag::get("power_on")) {
            self sethintstring(#"zombie/need_power");
            return true;
        } else if (self.stub.var_4326facc.var_37db5cf) {
            self sethintstring(#"hash_7a9fdbd8505afb95");
            return true;
        } else {
            self sethintstring(#"hash_f17e48b0e3b0846", self.stub.var_4326facc.var_c1b23abb);
            if (!e_player zm_score::can_player_purchase(self.stub.var_4326facc.var_c1b23abb)) {
                e_player globallogic::function_d1924f29(#"hash_6e3ae7967dc5d414");
            }
            return true;
        }
    }
    return false;
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 0, eflags: 0x2 linked
// Checksum 0x87452e32, Offset: 0xbd0
// Size: 0x2d8
function function_91f37293() {
    level endon(#"end_game");
    while (true) {
        result = self waittill(#"trigger");
        owner = result.activator;
        if (!level flag::get("power_on") || self.stub.var_4326facc.var_37db5cf) {
            continue;
        }
        if (owner zm_score::can_player_purchase(self.stub.var_4326facc.var_c1b23abb)) {
            owner thread zm_score::minus_to_player_score(self.stub.var_4326facc.var_c1b23abb);
            self.stub.var_4326facc.var_37db5cf = 1;
            self.stub.var_4326facc playsound(#"hash_33440052dad5d98b");
            self.stub.var_4326facc.var_fdec2822 rotateto(self.angles + (179, 0, 0), 0.3);
            self.stub.var_4326facc.var_fdec2822 waittill(#"rotatedone");
            self.stub.var_4326facc function_7265ebeb(1);
            self.stub.var_4326facc playsound(#"hash_43dad678bc35ddb7");
            self.stub.var_4326facc.var_fdec2822 clientfield::increment("" + #"hash_575d68a64ff032b2", 1);
            self.stub.var_4326facc.var_d6b3b6e0 clientfield::set("" + #"hash_16e5e4d2ea0716b7", 2);
            self.stub.var_4326facc thread function_4dd91c93(owner);
            level flag::set(#"hash_476d3c9ecf4a21de");
        }
    }
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 1, eflags: 0x2 linked
// Checksum 0x7b5675c1, Offset: 0xeb0
// Size: 0x13c
function function_4dd91c93(activator) {
    callback::on_ai_killed(&function_ae0208d3);
    level.var_9040138a = 0.1;
    if (isarray(self.var_e0b939d3)) {
        foreach (sentry_turret in self.var_e0b939d3) {
            sentry_turret.owner = activator;
            sentry_turret flag::set(#"hash_33b3801d229366b1");
            sentry_turret.var_6b71116f clientfield::set("" + #"hash_eb1d61f9d0ab6ab", 2);
        }
    }
    self thread function_f86fba0f();
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 1, eflags: 0x2 linked
// Checksum 0x57ee822, Offset: 0xff8
// Size: 0xc4
function function_ae0208d3(s_params) {
    attacker = s_params.eattacker;
    if (isinarray(level.var_d94359b, attacker) && isplayer(attacker.owner)) {
        level scoreevents::doscoreeventcallback("scoreEventZM", {#attacker:attacker.owner, #scoreevent:#"hash_748d4479ffd0521e", #enemy:self});
    }
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 0, eflags: 0x2 linked
// Checksum 0x578e40b8, Offset: 0x10c8
// Size: 0x294
function function_f86fba0f() {
    level endon(#"end_game");
    wait(30);
    self.var_fdec2822 rotateto(self.angles + (90, 0, 0), 0.3);
    self playsound(#"hash_33440052dad5d98b");
    wait(0.3);
    self playsound(#"hash_43dad678bc35ddb7");
    self function_7265ebeb(0);
    self.var_d6b3b6e0 clientfield::set("" + #"hash_16e5e4d2ea0716b7", 1);
    level.var_9040138a = 0.2;
    if (isarray(self.var_e0b939d3)) {
        foreach (sentry_turret in self.var_e0b939d3) {
            sentry_turret.owner = undefined;
            sentry_turret flag::clear(#"hash_33b3801d229366b1");
            sentry_turret.var_6b71116f clientfield::set("" + #"hash_eb1d61f9d0ab6ab", 1);
        }
    }
    wait(60);
    self.var_37db5cf = 0;
    self.var_fdec2822 rotateto(self.angles, 0.3);
    self playsound(#"hash_33440052dad5d98b");
    wait(0.3);
    self playsound(#"hash_43dad678bc35ddb7");
    callback::remove_on_ai_killed(&function_ae0208d3);
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 13, eflags: 0x2 linked
// Checksum 0xa4eaf293, Offset: 0x1368
// Size: 0xca
function function_de54ff01(*inflictor, *attacker, damage, *flags, *meansofdeath, weapon, *var_fd90b0bb, *vpoint, *vdir, *shitloc, *psoffsettime, *boneindex, *surfacetype) {
    if (surfacetype === level.var_9e7b0d9) {
        boneindex = zm_equipment::function_379f6b5d(boneindex, surfacetype, self.var_6f84b820, self.maxhealth);
        boneindex = min(boneindex, 10000);
    }
    return boneindex;
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 0, eflags: 0x2 linked
// Checksum 0x9b6ffa85, Offset: 0x1440
// Size: 0x2f4
function function_855c1e52() {
    level endon(#"end_game");
    self.var_e0159e34 = 7;
    self.var_2268588c = getent(self.target, "targetname");
    self.var_d61fef93 = getent(self.var_2268588c.target, "targetname");
    self.var_6b71116f = util::spawn_model("tag_origin", self.var_d61fef93.origin, self.var_d61fef93.angles);
    self.var_6b71116f linkto(self.var_2268588c);
    self.var_fa9fda61 = getent("sentry_turret_attack_area_" + self.script_int, "targetname");
    level flag::wait_till("power_on");
    self.var_6b71116f clientfield::set("" + #"hash_eb1d61f9d0ab6ab", 1);
    self.var_6b71116f clientfield::set("" + #"hash_4ace5aed82d35b19", 1);
    var_c4b831d0 = getentarray("vh_sentry_turret", "targetname");
    foreach (turret in var_c4b831d0) {
        if (self.script_int === turret.script_noteworthy) {
            self.e_turret = turret;
        }
    }
    level flag::wait_till(#"start_zombie_round_logic");
    var_d42609b0 = getent("pl_no_mn_st", "targetname");
    if (isdefined(self.var_2268588c)) {
        self thread function_6ecaca22();
        self thread function_fef32ab1(var_d42609b0);
        self thread function_bbf83c6f();
    }
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 0, eflags: 0x2 linked
// Checksum 0x6136f791, Offset: 0x1740
// Size: 0x1be
function function_bbf83c6f() {
    level endon(#"end_game");
    var_982da0b4 = 0;
    var_9be855ca = 0;
    while (true) {
        if (!isdefined(self.target_enemy)) {
            var_982da0b4 = 0;
            var_ebc5d65 = 0;
            if (!self.var_603547e4) {
                while (!isdefined(self.target_enemy)) {
                    wait(0.1);
                    var_ebc5d65++;
                    if (var_ebc5d65 >= 20) {
                        self thread function_6ecaca22();
                        break;
                    }
                }
            }
            waitframe(5);
            continue;
        }
        if (!var_982da0b4) {
            if (isdefined(self.target_enemy)) {
                if (isplayer(self.target_enemy)) {
                    var_9be855ca = 1;
                }
            }
            if (var_9be855ca) {
                playsoundatposition("wpn_guard_turret_lockon", self.origin);
                var_9be855ca = 0;
            }
            if (!self flag::get(#"hash_33b3801d229366b1")) {
                wait(1.5);
                var_982da0b4 = 1;
            }
        }
        if (isalive(self.target_enemy) && is_true(self function_1759c36a(self.target_enemy))) {
            self function_f35a7c49();
        }
        waitframe(1);
    }
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 1, eflags: 0x2 linked
// Checksum 0x52bc5eb2, Offset: 0x1908
// Size: 0x124
function function_f35a7c49(*target) {
    level endon(#"end_game");
    weapon = getweapon(#"hash_6cbce408f40df23d");
    var_af682a83 = struct::get(self.var_d61fef93.target, "targetname");
    while (isdefined(self.target_enemy)) {
        playsoundatposition(#"hash_28fd24537d849f13", var_af682a83.origin);
        magicbullet(weapon, var_af682a83.origin, self.target_enemy.origin + (0, 0, 40), self);
        wait(level.var_9040138a);
    }
    /#
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 1, eflags: 0x6 linked
// Checksum 0xceffe28e, Offset: 0x1a38
// Size: 0x17e
function private function_d103a3d0(entity) {
    if (isdefined(entity)) {
        self.target_enemy = entity;
        if (isplayer(self.target_enemy)) {
            self.target_enemy clientfield::set_to_player("" + #"hash_32d35af47559b320", 1);
            if (!is_true(self.target_enemy.var_b4dc71a)) {
                self.target_enemy thread zm_vo::function_7622cb70(#"zber_env_grdtwr");
                self.target_enemy.var_b4dc71a = 1;
            }
        }
        self notify(#"hash_3ddbfa242007e625");
        self.var_603547e4 = 0;
        self function_15cee126(self.var_2268588c.origin, entity.origin);
        return;
    }
    if (isplayer(self.target_enemy)) {
        self.target_enemy clientfield::set_to_player("" + #"hash_32d35af47559b320", 0);
    }
    self.target_enemy = undefined;
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 3, eflags: 0x6 linked
// Checksum 0x66641249, Offset: 0x1bc0
// Size: 0x15c
function private is_valid_target(var_c0a2d9cb, var_81e5de51, var_9f0b8aed) {
    if (!isdefined(var_c0a2d9cb) || is_true(var_c0a2d9cb.ignoreme)) {
        return 0;
    }
    if (isactor(var_c0a2d9cb) && var_c0a2d9cb.team !== level.zombie_team) {
        return 0;
    }
    if (is_true(var_81e5de51)) {
        return (!isplayer(var_c0a2d9cb) && istouching(var_c0a2d9cb.origin, self.var_fa9fda61));
    }
    var_666d5a82 = self function_1759c36a(var_c0a2d9cb);
    if (var_666d5a82 && !istouching(var_c0a2d9cb.origin, var_9f0b8aed)) {
        return (!isplayer(var_c0a2d9cb) || !var_c0a2d9cb laststand::player_is_in_laststand());
    }
    return 0;
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 1, eflags: 0x2 linked
// Checksum 0x6b3c4d2b, Offset: 0x1d28
// Size: 0x340
function function_fef32ab1(var_74bebc57) {
    level endon(#"end_game");
    self endon(#"death");
    while (true) {
        var_81e5de51 = self flag::get(#"hash_33b3801d229366b1");
        if (isalive(self.target_enemy)) {
            wait(var_81e5de51 ? 0.1 : 1);
            if (self is_valid_target(self.target_enemy, var_81e5de51, var_74bebc57)) {
                self.var_603547e4 = 0;
                self function_15cee126(self.var_2268588c.origin, self.target_enemy.origin);
            } else {
                self function_d103a3d0(undefined);
            }
        } else {
            e_target = undefined;
            var_c9e3c7bc = function_bace8f77(level.var_f339857a);
            foreach (entity in var_c9e3c7bc) {
                if (!isdefined(entity) || is_true(entity.ignoreme)) {
                    continue;
                }
                if (isactor(entity) && entity.team !== level.zombie_team) {
                    continue;
                }
                /#
                    if (is_true(level.var_e973a238)) {
                        var_abdb3f07 = anglestoforward(self.var_6b71116f.angles);
                        line(self.var_6b71116f.origin, self.var_6b71116f.origin + var_abdb3f07 * 1000, (255, 0, 0), 1, 0, 100);
                    }
                #/
                if (self is_valid_target(entity, var_81e5de51, var_74bebc57)) {
                    e_target = entity;
                    break;
                }
                if (var_81e5de51) {
                    continue;
                }
                self function_a76ab7f7();
            }
            self function_d103a3d0(e_target);
        }
        self function_a76ab7f7();
    }
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 1, eflags: 0x2 linked
// Checksum 0x2ff8cd13, Offset: 0x2070
// Size: 0x42
function function_1759c36a(entity) {
    return function_c46f0aa(self.var_6b71116f.origin, entity, self.var_6b71116f.angles, 11);
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 2, eflags: 0x2 linked
// Checksum 0x16de7389, Offset: 0x20c0
// Size: 0xac
function function_15cee126(start_origin, target_origin) {
    var_a739460a = vectortoangles(target_origin - start_origin);
    var_5317cf87 = var_a739460a[0];
    var_e72e3f5e = var_a739460a[1];
    self rotateto((0, var_e72e3f5e + 90, 0), 1);
    self.var_2268588c rotateto((0, var_e72e3f5e + 90, var_5317cf87), 1);
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 5, eflags: 0x2 linked
// Checksum 0x1bd452c7, Offset: 0x2178
// Size: 0x11c
function function_c46f0aa(var_edfffb43, target_entity, var_bb839e1, cone_angle, var_a11fa31c = 1) {
    if (!isdefined(target_entity)) {
        return false;
    }
    var_d5da08f6 = vectortoangles(target_entity.origin + (0, 0, 2) - var_edfffb43);
    var_ccde70d2 = length(var_bb839e1 - var_d5da08f6);
    if (var_ccde70d2 < cone_angle) {
        if (var_a11fa31c) {
            b_passed = bullettracepassed(var_edfffb43, target_entity.origin + (0, 0, 2), 1, self, undefined);
            if (b_passed) {
                return true;
            }
            return false;
        } else {
            return true;
        }
    }
    return false;
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 1, eflags: 0x2 linked
// Checksum 0xe6b8edc6, Offset: 0x22a0
// Size: 0x1ca
function function_bace8f77(var_d7ca0fe) {
    var_4bd85725 = [];
    var_16dffee3 = self getenemies();
    foreach (enemy in var_16dffee3) {
        if (isdefined(enemy) && !isvehicle(enemy)) {
            foreach (zone_name in var_d7ca0fe) {
                if (is_true(enemy zm_zonemgr::entity_in_zone(zone_name))) {
                    if (!isdefined(var_4bd85725)) {
                        var_4bd85725 = [];
                    } else if (!isarray(var_4bd85725)) {
                        var_4bd85725 = array(var_4bd85725);
                    }
                    if (!isinarray(var_4bd85725, enemy)) {
                        var_4bd85725[var_4bd85725.size] = enemy;
                    }
                    break;
                }
            }
        }
    }
    return var_4bd85725;
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 0, eflags: 0x2 linked
// Checksum 0x1c67d65c, Offset: 0x2478
// Size: 0x33e
function function_6ecaca22() {
    self notify("1cf7bcb5f2082076");
    self endon("1cf7bcb5f2082076");
    level endon(#"end_game");
    self endon(#"hash_3ddbfa242007e625");
    self.var_603547e4 = 1;
    while (true) {
        self.var_2268588c function_e8fbb26a(0);
        if (isdefined(self.var_2268588c.var_9dc0b96f)) {
            var_a739460a = vectortoangles(self.var_2268588c.var_9dc0b96f.origin - self.var_2268588c.origin);
            /#
                if (is_true(level.var_e973a238)) {
                    line(self.var_2268588c.origin, self.var_2268588c.origin + anglestoforward(var_a739460a) * 1000, (255, 255, 0), 1, 0, 100);
                }
            #/
        }
        var_5317cf87 = var_a739460a[0];
        var_e72e3f5e = var_a739460a[1];
        var_eb570847 = function_78344094(self.angles[1] - 90, var_e72e3f5e, self.var_e0159e34);
        var_bb2eca3e = function_78344094(self.var_2268588c.angles[2], var_5317cf87, self.var_e0159e34);
        rotate_time = max(var_eb570847, var_bb2eca3e);
        int(rotate_time);
        if (rotate_time < 2) {
            rotate_time = 2;
        } else if (rotate_time > rotate_time) {
            rotate_time = rotate_time;
        }
        /#
            if (is_true(level.var_d0a8abf7)) {
                iprintlnbold(rotate_time);
            }
        #/
        self rotateto((0, var_e72e3f5e + 90, 0), rotate_time);
        self.var_2268588c rotateto((0, var_e72e3f5e + 90, var_5317cf87), rotate_time);
        self waittilltimeout(rotate_time, #"rotatedone");
        /#
            if (is_true(level.var_d0a8abf7)) {
                iprintlnbold("<unknown string>");
            }
        #/
        wait(3);
    }
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 3, eflags: 0x2 linked
// Checksum 0x3123f8e4, Offset: 0x27c0
// Size: 0xaa
function function_78344094(var_7b783ebb, var_43ed722a, speed) {
    var_7b783ebb = var_7b783ebb < 0 ? var_7b783ebb + 360 : var_7b783ebb;
    var_43ed722a = var_43ed722a < 0 ? var_43ed722a + 360 : var_43ed722a;
    var_7b7eb047 = abs(var_7b783ebb - var_43ed722a);
    var_7b7eb047 = (var_7b7eb047 < 180 ? var_7b7eb047 : 360 - var_7b7eb047) / speed;
    return var_7b7eb047;
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 1, eflags: 0x2 linked
// Checksum 0x5e95946, Offset: 0x2878
// Size: 0x1a4
function function_e8fbb26a(var_1b26eb1c = 1) {
    level endon(#"end_game");
    self endon(#"death");
    if (!var_1b26eb1c) {
        if (!isdefined(self.var_9dc0b96f)) {
            var_27498490 = struct::get(self.target, "targetname");
            self.var_9dc0b96f = var_27498490;
        } else {
            var_7a45ae3c = struct::get(self.var_9dc0b96f.target, "targetname");
            if (isdefined(var_7a45ae3c)) {
                self.var_9dc0b96f = var_7a45ae3c;
            }
        }
        return;
    }
    while (true) {
        var_b03a7aa3 = struct::get_array(self.target, "targetname");
        if (!isdefined(self.var_9dc0b96f)) {
            if (isdefined(var_b03a7aa3) && isarray(var_b03a7aa3)) {
                self.var_9dc0b96f = array::random(var_b03a7aa3);
                break;
            }
        } else {
            var_7a45ae3c = array::random(var_b03a7aa3);
            if (var_7a45ae3c != self.var_9dc0b96f) {
                self.var_9dc0b96f = var_7a45ae3c;
                break;
            }
        }
        waitframe(5);
    }
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 0, eflags: 0x0
// Checksum 0xa5689b3d, Offset: 0x2a28
// Size: 0x264
function function_794f4716() {
    self.controlled = 0;
    self.treat_owner_damage_as_friendly_fire = 0;
    self.ignore_team_kills = 0;
    self.deal_no_crush_damage = 1;
    self.turret = self;
    self.dontfreeme = 1;
    self.maxhealth = 10000;
    self.health = self.maxhealth;
    self.will_die = 0;
    self.team = #"neutral";
    self setteam(#"neutral");
    self turret::set_team(#"neutral", 0);
    self turret::set_torso_targetting(0);
    self turret::set_target_leading(0);
    self.use_non_teambased_enemy_selection = 1;
    self.waittill_turret_on_target_delay = 0.25;
    self.ignore_vehicle_underneath_splash_scalar = 1;
    self.var_2df02a0c = 1;
    self val::set(#"hash_682ad3df1640e158", "allowdeath", 0);
    self val::set(#"hash_26706cb1f9f3a0ed", "takedamage", 0);
    self.var_63d65a8d = "arc";
    self.var_7eb3ebd5 = [];
    self.var_aac73d6c = 1;
    self.maxsightdistsqrd = 1;
    self.turret_enabled = 1;
    target_set(self);
    self unlink();
    self ultimate_turret::function_bc7568f1();
    self util::make_sentient();
    self thread ultimate_turret::turret_laser_watch();
    self thread ultimate_turret::setup_death_watch_for_new_targets();
    self thread turretscanning();
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 0, eflags: 0x2 linked
// Checksum 0x16eee9e3, Offset: 0x2c98
// Size: 0x104
function turretscanning() {
    veh = self;
    veh endon(#"death", #"death_started", #"end_turret_scanning");
    wait(0.8);
    veh playsound(#"mpl_turret_startup");
    veh playloopsound(#"hash_69240c6db92da5bf");
    s_bundle = killstreaks::get_script_bundle("ultimate_turret");
    veh.maxsightdistsqrd = sqr(isdefined(s_bundle.var_2aeadfa0) ? s_bundle.var_2aeadfa0 : 3500);
    veh thread function_9d831b2f();
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 0, eflags: 0x2 linked
// Checksum 0x5a9aef27, Offset: 0x2da8
// Size: 0x2c
function function_a76ab7f7() {
    if (isdefined(level.var_cd78299)) {
        [[ level.var_cd78299 ]]->waitinqueue(self);
    }
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 0, eflags: 0x2 linked
// Checksum 0xd5d74176, Offset: 0x2de0
// Size: 0x17e
function function_9d831b2f() {
    self endon(#"death", #"death_started", #"end_turret_scanning");
    while (true) {
        if (self.isjammed === 1 || self.isstunned === 1) {
            waitframe(1);
            continue;
        }
        if (self.var_942bf052 === "left") {
            self turretsettargetangles(0, (-10, 40, 0));
            self.var_942bf052 = "right";
        } else {
            self turretsettargetangles(0, (-10, -40, 0));
            self.var_942bf052 = "left";
        }
        waitresult = self waittilltimeout(3.5, #"ultimate_turret_potential_target_acquired");
        if (waitresult._notify == "ultimate_turret_potential_target_acquired") {
            while (isdefined(self.var_c27dadc8) || isdefined(self.e_current_target)) {
                wait(float(function_60d95f53()) / 1000);
            }
        }
    }
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 2, eflags: 0x0
// Checksum 0x2816fc1, Offset: 0x2f68
// Size: 0x2e6
function function_16ccb771(var_e110fa82, e_target) {
    self endon(#"death", #"death_started", #"end_turret_scanning");
    if (!isdefined(e_target)) {
        return;
    }
    if (self function_5acbddc8()) {
        return;
    }
    s_bundle = killstreaks::get_script_bundle("ultimate_turret");
    var_b009f4df = s_bundle.ksburstfiremintime;
    var_b72152c3 = s_bundle.ksburstfiremaxtime;
    var_1d860ae4 = s_bundle.ksburstfiredelaymintime;
    var_f8ba3204 = s_bundle.ksburstfiredelaymaxtime;
    var_108a39a1 = s_bundle.ksburstfireenabled;
    self thread function_ad3a71a3(var_e110fa82, e_target);
    if (var_108a39a1) {
        n_fire_time = var_b009f4df > var_b72152c3 ? var_b009f4df : randomfloatrange(var_b009f4df, var_b72152c3);
        self vehicle_ai::fire_for_time(n_fire_time, 0, e_target);
        var_2da97dc2 = !isdefined(e_target) || !isalive(e_target);
        if (var_1d860ae4 > 0 && !var_2da97dc2) {
            var_91d9f057 = var_1d860ae4 > var_f8ba3204 ? var_1d860ae4 : randomfloatrange(var_1d860ae4, var_f8ba3204);
            waitresult = e_target waittilltimeout(var_91d9f057, #"death", #"disconnect");
            var_2da97dc2 = waitresult._notify === "death";
        }
    } else {
        self vehicle_ai::fire_for_rounds(10, 0, e_target);
        var_2da97dc2 = !isdefined(e_target) || !isalive(e_target);
    }
    if (var_2da97dc2) {
        self.turretrotscale = 1;
        wait(randomfloatrange(0.05, 0.2));
        self.e_current_target = undefined;
        self setturretspinning(0);
        self.var_73998811 = undefined;
    }
    self notify(#"hash_417cb0aabe1a9864");
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 2, eflags: 0x2 linked
// Checksum 0x3b11e2ae, Offset: 0x3258
// Size: 0xbc
function function_ad3a71a3(var_e110fa82, e_target) {
    self endon(#"death", #"death_started", #"end_turret_scanning", #"hash_417cb0aabe1a9864");
    while (isalive(e_target)) {
        if (!is_true(var_e110fa82 function_1759c36a(e_target))) {
            self notify(#"fire_stop");
            break;
        }
        waitframe(1);
    }
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 1, eflags: 0x0
// Checksum 0x6b8260bf, Offset: 0x3320
// Size: 0x24
function aim_at_target(e_target) {
    self childthread function_b8952a40(e_target);
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 1, eflags: 0x2 linked
// Checksum 0x313b68d4, Offset: 0x3350
// Size: 0x158
function function_b8952a40(e_target) {
    self notify("4c45869b68c71d25");
    self endon("4c45869b68c71d25");
    veh = self;
    while (isdefined(veh) && isdefined(e_target) && !is_true(veh.isstunned) && !is_true(veh.isjammed)) {
        var_559acfe = e_target getvelocity() * getdvarfloat(#"hash_3a25aaa27558e77b", 0.075);
        if (isplayer(e_target)) {
            target_offset = get_target_offset(e_target);
            veh turretsettarget(0, e_target, target_offset + var_559acfe);
        } else {
            veh turretsettarget(0, e_target, var_559acfe);
        }
        wait(0.1);
    }
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 1, eflags: 0x2 linked
// Checksum 0x75f43f08, Offset: 0x34b0
// Size: 0x62
function get_target_offset(target) {
    var_8134d046 = -12;
    stance = target getstance();
    if (stance == "prone") {
        var_8134d046 = -2;
    }
    return (0, 0, var_8134d046);
}

// Namespace namespace_178eb32b/namespace_178eb32b
// Params 0, eflags: 0x2 linked
// Checksum 0xd0327144, Offset: 0x3520
// Size: 0x6a
function function_5acbddc8() {
    var_b354a26c = gettime() - (isdefined(self.var_73998811) ? self.var_73998811 : 0);
    var_f4df6b60 = isdefined(self.turretweapon.spinuptime) ? self.turretweapon.spinuptime : 0;
    return var_b354a26c <= var_f4df6b60;
}

/#

    // Namespace namespace_178eb32b/namespace_178eb32b
    // Params 0, eflags: 0x0
    // Checksum 0x34e0eba7, Offset: 0x3598
    // Size: 0x8c
    function function_37597f29() {
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        util::add_debug_command("<unknown string>");
        zm_devgui::add_custom_devgui_callback(&cmd);
    }

    // Namespace namespace_178eb32b/namespace_178eb32b
    // Params 1, eflags: 0x0
    // Checksum 0xecb4cb3d, Offset: 0x3630
    // Size: 0xd2
    function cmd(cmd) {
        switch (cmd) {
        case #"hash_72c32e4ea9754a5a":
            function_950cdfda();
            break;
        case #"hash_2b88edba72ea664":
            function_5167738a();
            break;
        case #"hash_17ddb3f9b9346fba":
            function_d0a8abf7();
            break;
        case #"hash_52e9b6c047dfc7":
            function_d5c28d2b();
            break;
        default:
            break;
        }
    }

    // Namespace namespace_178eb32b/namespace_178eb32b
    // Params 0, eflags: 0x0
    // Checksum 0xbb470d36, Offset: 0x3710
    // Size: 0x18
    function function_950cdfda() {
        level.var_e973a238 = 1;
    }

    // Namespace namespace_178eb32b/namespace_178eb32b
    // Params 0, eflags: 0x0
    // Checksum 0xdfe35fb9, Offset: 0x3730
    // Size: 0x14
    function function_5167738a() {
        level.var_e973a238 = 0;
    }

    // Namespace namespace_178eb32b/namespace_178eb32b
    // Params 0, eflags: 0x0
    // Checksum 0x907fe78f, Offset: 0x3750
    // Size: 0x18
    function function_d0a8abf7() {
        level.var_d0a8abf7 = 1;
    }

    // Namespace namespace_178eb32b/namespace_178eb32b
    // Params 0, eflags: 0x0
    // Checksum 0x626d4515, Offset: 0x3770
    // Size: 0x14
    function function_d5c28d2b() {
        level.var_d0a8abf7 = 0;
    }

#/
