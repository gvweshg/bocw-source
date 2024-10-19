// Atian COD Tools GSC CW decompiler test
#using script_2a5bf5b4a00cee0d;
#using script_164a456ce05c3483;
#using script_47851dbeea22fe66;
#using script_1ee011cd0961afd7;
#using script_5f20d3b434d24884;
#using script_774302f762d76254;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\ai\blackboard_vehicle.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\statemachine_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\systems\ai_blackboard.gsc;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_7457b8d5;

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 0, eflags: 0x2 linked
// Checksum 0x38d16ed5, Offset: 0x270
// Size: 0x5e
function init() {
    namespace_250e9486::function_252dff4d("spider", 14, &function_66da4f00, &function_9bb842bf, undefined, &function_75f88bcf);
    level.doa.var_5b56a42c = 0;
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 0, eflags: 0x2 linked
// Checksum 0x7f52939f, Offset: 0x2d8
// Size: 0x1c
function function_75f88bcf() {
    return level.doa.var_5b56a42c < 15;
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 0, eflags: 0x2 linked
// Checksum 0x80f724d1, Offset: 0x300
// Size: 0x4
function function_9bb842bf() {
    
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 0, eflags: 0x2 linked
// Checksum 0xe668091, Offset: 0x310
// Size: 0x2c4
function function_66da4f00() {
    level.doa.var_5b56a42c++;
    namespace_250e9486::function_25b2c8a9();
    self.fovcosine = 0;
    self.fovcosinebusy = 0;
    self.delete_on_death = 1;
    self.maxhealth = 800;
    self.health = self.maxhealth;
    self.var_3a001247 = 1;
    self.var_bba2883e = 1;
    self useanimtree("generic");
    self vehicle::friendly_fire_shield();
    assert(isdefined(self.scriptbundlesettings));
    self.settings = getscriptbundle(self.scriptbundlesettings);
    self enableaimassist();
    self turretsetontargettolerance(0, 3);
    self setdrawinfrared(1);
    self setvehicleavoidance(1);
    blackboard::createblackboardforentity(self);
    self blackboard::registervehicleblackboardattributes();
    self setneargoalnotifydist(40);
    self.goalradius = 60;
    self.goalheight = 128;
    self.showdelay = 0.2;
    self setgoal(self.origin, 0, 1);
    self force_get_enemies();
    self.overridevehicledamage = &function_725d9b34;
    self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_spider_spawn");
    self thread vehicle_ai::nudge_collision();
    if (isdefined(level.vehicle_initializer_cb)) {
        [[ level.vehicle_initializer_cb ]](self);
    }
    self asmrequestsubstate("locomotion@movement");
    defaultrole();
    if (namespace_4dae815d::function_59a9cf1d() == 0) {
        self thread namespace_ec06fe4a::function_570729f0(60);
    }
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 0, eflags: 0x2 linked
// Checksum 0xb7be86ac, Offset: 0x5e0
// Size: 0x16c
function defaultrole() {
    self vehicle_ai::init_state_machine_for_role("default");
    self vehicle_ai::get_state_callbacks("combat").update_func = &function_ae36dd9f;
    self vehicle_ai::get_state_callbacks("death").update_func = &state_death_update;
    self vehicle_ai::get_state_callbacks("driving").update_func = &state_driving_update;
    self vehicle_ai::add_state("meleeCombat", undefined, &function_aebf9e0f, undefined);
    vehicle_ai::add_utility_connection("combat", "meleeCombat", &function_259536c8);
    vehicle_ai::add_utility_connection("meleeCombat", "combat", &function_e32c6513);
    self vehicle_ai::call_custom_add_state_callbacks();
    vehicle_ai::startinitialstate("combat");
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 1, eflags: 0x2 linked
// Checksum 0xeca39b3e, Offset: 0x758
// Size: 0xdc
function state_death_update(*params) {
    self endon(#"death");
    self namespace_83eb6304::function_3ecfde67("egg_explode");
    self asmrequestsubstate("death@stationary");
    vehicle_ai::waittill_asm_complete("death@stationary", 2);
    level.doa.var_5b56a42c--;
    if (level.doa.var_5b56a42c < 0) {
        level.doa.var_5b56a42c = 0;
    }
    self vehicle_death::death_fx();
    vehicle_death::deletewhensafe();
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 1, eflags: 0x2 linked
// Checksum 0x45d66b2d, Offset: 0x840
// Size: 0x4c
function state_driving_update(*params) {
    self endon(#"change_state");
    self endon(#"death");
    self asmrequestsubstate("locomotion@movement");
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 1, eflags: 0x2 linked
// Checksum 0xa3de063e, Offset: 0x898
// Size: 0x76e
function function_be5ba736(enemy) {
    if (self.goalforced) {
        return self.goalpos;
    }
    selfdisttotarget = distance2d(self.origin, enemy.origin);
    gooddist = 0.5 * (self.settings.engagementdistmin + self.settings.engagementdistmax);
    tooclosedist = 150;
    closedist = 1.2 * gooddist;
    fardist = 3 * gooddist;
    querymultiplier = mapfloat(closedist, fardist, 1, 3, selfdisttotarget);
    prefereddistawayfromorigin = 300;
    randomness = 30;
    queryresult = positionquery_source_navigation(self.origin, 80, 300 * querymultiplier, 150, 2 * self.radius * querymultiplier, self, 1 * self.radius * querymultiplier);
    positionquery_filter_distancetogoal(queryresult, self);
    vehicle_ai::positionquery_filter_outofgoalanchor(queryresult);
    positionquery_filter_inclaimedlocation(queryresult, self);
    vehicle_ai::positionquery_filter_engagementdist(queryresult, enemy, self.settings.engagementdistmin, self.settings.engagementdistmax);
    if (isdefined(self.avoidentities) && isdefined(self.avoidentitiesdistance)) {
        vehicle_ai::positionquery_filter_distawayfromtarget(queryresult, self.avoidentities, self.avoidentitiesdistance, -500);
    }
    best_point = undefined;
    best_score = -999999;
    foreach (point in queryresult.data) {
        /#
            if (!isdefined(point._scoredebug)) {
                point._scoredebug = [];
            }
            if (!isdefined(point._scoredebug[#"disttoorigin"])) {
                point._scoredebug[#"disttoorigin"] = spawnstruct();
            }
            point._scoredebug[#"disttoorigin"].score = mapfloat(0, prefereddistawayfromorigin, 0, 300, point.disttoorigin2d);
            point._scoredebug[#"disttoorigin"].scorename = "<unknown string>";
        #/
        point.score += mapfloat(0, prefereddistawayfromorigin, 0, 300, point.disttoorigin2d);
        if (point.inclaimedlocation) {
            /#
                if (!isdefined(point._scoredebug)) {
                    point._scoredebug = [];
                }
                if (!isdefined(point._scoredebug[#"inclaimedlocation"])) {
                    point._scoredebug[#"inclaimedlocation"] = spawnstruct();
                }
                point._scoredebug[#"inclaimedlocation"].score = -500;
                point._scoredebug[#"inclaimedlocation"].scorename = "<unknown string>";
            #/
            point.score += -500;
        }
        /#
            if (!isdefined(point._scoredebug)) {
                point._scoredebug = [];
            }
            if (!isdefined(point._scoredebug[#"random"])) {
                point._scoredebug[#"random"] = spawnstruct();
            }
            point._scoredebug[#"random"].score = randomfloatrange(0, randomness);
            point._scoredebug[#"random"].scorename = "<unknown string>";
        #/
        point.score += randomfloatrange(0, randomness);
        /#
            if (!isdefined(point._scoredebug)) {
                point._scoredebug = [];
            }
            if (!isdefined(point._scoredebug[#"engagementdist"])) {
                point._scoredebug[#"engagementdist"] = spawnstruct();
            }
            point._scoredebug[#"engagementdist"].score = point.distawayfromengagementarea * -1;
            point._scoredebug[#"engagementdist"].scorename = "<unknown string>";
        #/
        point.score += point.distawayfromengagementarea * -1;
        if (point.score > best_score) {
            best_score = point.score;
            best_point = point;
        }
    }
    self vehicle_ai::positionquery_debugscores(queryresult);
    /#
        self.debug_ai_move_to_points_considered = queryresult.data;
    #/
    if (!isdefined(best_point)) {
        return undefined;
    }
    /#
        if (is_true(getdvarint(#"hkai_debugpositionquery"))) {
            recordline(self.origin, best_point.origin, (0.3, 1, 0));
            recordline(self.origin, enemy.origin, (1, 0, 0.4));
        }
    #/
    return best_point.origin;
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 1, eflags: 0x2 linked
// Checksum 0xacefcd19, Offset: 0x1010
// Size: 0x27e
function function_ae36dd9f(*params) {
    self endon(#"change_state");
    self endon(#"death");
    self.pathfailcount = 0;
    self.foundpath = 1;
    self util::cooldown("state_change", 2);
    self thread prevent_stuck();
    self thread nudge_collision();
    self thread function_aea2bda3();
    self setspeed(self.settings.defaultmovespeed);
    self asmrequestsubstate("locomotion@movement");
    self.dont_move = undefined;
    for (;;) {
        if (!isdefined(self.enemy)) {
            self force_get_enemies();
            wait(0.1);
            continue;
        }
        if (isdefined(self.enemy) && is_true(self.enemy.laststand)) {
            self force_get_enemies();
            wait(0.1);
            continue;
        } else if (self.dont_move === 1) {
            wait(0.1);
            continue;
        }
        if (isdefined(self.var_ebf5af53)) {
            if (!self [[ self.var_ebf5af53 ]]()) {
                wait(0.1);
                continue;
            }
        }
        if (!self seerecently(self.enemy, 5)) {
            self.current_pathto_pos = function_4417a164();
        } else {
            self.current_pathto_pos = function_be5ba736(self.enemy);
        }
        if (isdefined(self.current_pathto_pos)) {
            self function_a57c34b7(self.current_pathto_pos, 0, 1);
            self vehicle_ai::waittill_pathing_done();
        }
        waitframe(1);
    }
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 0, eflags: 0x2 linked
// Checksum 0x6faa0396, Offset: 0x1298
// Size: 0x2c8
function function_aea2bda3() {
    self endon(#"change_state");
    self endon(#"death");
    for (;;) {
        state_params = spawnstruct();
        state_params.var_cc308559 = 1;
        self vehicle_ai::evaluate_connections(undefined, state_params);
        if (!isdefined(self.enemy)) {
            wait(0.1);
            continue;
        }
        var_f5ad2338 = 1;
        foreach (player in getplayers()) {
            self getperfectinfo(player, 0);
            if (player.b_is_designated_target === 1 && self.enemy.b_is_designated_target !== 1) {
                self getperfectinfo(player, 1);
                self setpersonalthreatbias(player, 100000, 2);
                var_f5ad2338 = 0;
            }
        }
        if (var_f5ad2338) {
            if (self cansee(self.enemy)) {
                self vehlookat(self.enemy);
                self turretsettarget(0, self.enemy);
            }
            if (distance2dsquared(self.origin, self.enemy.origin) < sqr(self.settings.engagementdistmax * 1.5) && util::iscooldownready("rocket") && self cansee(self.enemy)) {
                self function_c7208b7d(self.enemy);
                wait(0.5);
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 1, eflags: 0x2 linked
// Checksum 0xa69d61f5, Offset: 0x1568
// Size: 0x316
function function_c7208b7d(enemy) {
    self notify(#"near_goal");
    self endon(#"death");
    self vehicle_ai::clearallmovement(1);
    self.dont_move = 1;
    self vehlookat(enemy);
    self turretsettarget(0, enemy);
    self function_a57c34b7(enemy.origin, 0, 0);
    self setgoal(enemy.origin, 0, 0);
    var_2fd0e338 = 30;
    v_to_enemy = ((enemy.origin - self.origin)[0], (enemy.origin - self.origin)[1], 0);
    goalangles = vectortoangles(v_to_enemy);
    anglediff = absangleclamp180(self.angles[1] - goalangles[1]);
    var_29b2c7c7 = gettime();
    while (anglediff > var_2fd0e338 && util::timesince(var_29b2c7c7) < 0.8) {
        anglediff = absangleclamp180(self.angles[1] - goalangles[1]);
        waitframe(1);
    }
    self vehicle_ai::clearallmovement(1);
    if (anglediff <= var_2fd0e338 && isdefined(enemy)) {
        enemy thread function_f7d9bc34();
        wait(0.75);
        self asmrequestsubstate("fire@stationary");
        timedout = self waittilltimeout(5, #"hash_89a861e8c0ab929");
        if (timedout._notify !== #"timeout") {
            self fireweapon();
            self util::cooldown("rocket", 3);
            self vehicle_ai::waittill_asm_complete("fire@stationary", 5);
        }
    }
    self asmrequestsubstate("locomotion@movement");
    self.dont_move = undefined;
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 0, eflags: 0x2 linked
// Checksum 0x30fb9d8a, Offset: 0x1888
// Size: 0x64
function function_f7d9bc34() {
    self endon(#"disconnect");
    self namespace_83eb6304::function_3ecfde67("incoming_impact");
    wait(1.2);
    if (isdefined(self)) {
        self namespace_83eb6304::turnofffx("incoming_impact");
    }
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 0, eflags: 0x0
// Checksum 0xcda7d548, Offset: 0x18f8
// Size: 0x12
function function_fb7f416c() {
    self.var_fb7f416c = 1;
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 3, eflags: 0x2 linked
// Checksum 0x9cce4f4e, Offset: 0x1918
// Size: 0x50
function function_259536c8(*from_state, *to_state, *connection) {
    if (!util::iscooldownready("state_change")) {
        return false;
    }
    if (!isdefined(self.enemy)) {
        return false;
    }
    return true;
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 1, eflags: 0x2 linked
// Checksum 0x3a61462a, Offset: 0x1970
// Size: 0x9fc
function function_aebf9e0f(*params) {
    self endon(#"change_state");
    self endon(#"death");
    self util::cooldown("state_change", 8);
    self thread prevent_stuck();
    self thread nudge_collision();
    self thread function_8a699cff();
    self.pathfailcount = 0;
    self.var_fb7f416c = undefined;
    self setspeed(self.settings.defaultmovespeed * 1.5);
    self asmrequestsubstate("locomotion@movement");
    self.dont_move = undefined;
    wait(0.5);
    for (;;) {
        foreach (player in getplayers()) {
            self getperfectinfo(player, 1);
            if (player.b_is_designated_target === 1) {
                self setpersonalthreatbias(player, 100000, 3);
            }
        }
        if (!isdefined(self.enemy)) {
            self force_get_enemies();
            wait(0.1);
            continue;
        }
        if (isdefined(self.enemy) && is_true(self.enemy.laststand)) {
            self force_get_enemies();
            wait(0.1);
            continue;
        } else if (self.dont_move === 1) {
            wait(0.1);
            continue;
        }
        if (isdefined(self.var_ebf5af53)) {
            if (!self [[ self.var_ebf5af53 ]]()) {
                wait(0.1);
                continue;
            }
        }
        self.foundpath = 0;
        targetpos = function_4417a164();
        if (isdefined(targetpos)) {
            if (distancesquared(self.origin, targetpos) > sqr(1300) && self isposinclaimedlocation(targetpos)) {
                queryresult = positionquery_source_navigation(targetpos, 0, self.settings.max_move_dist, self.settings.max_move_dist, self.radius, self);
                positionquery_filter_inclaimedlocation(queryresult, self.enemy);
                best_point = undefined;
                best_score = -999999;
                foreach (point in queryresult.data) {
                    /#
                        if (!isdefined(point._scoredebug)) {
                            point._scoredebug = [];
                        }
                        if (!isdefined(point._scoredebug[#"disttoorigin"])) {
                            point._scoredebug[#"disttoorigin"] = spawnstruct();
                        }
                        point._scoredebug[#"disttoorigin"].score = mapfloat(0, 200, 0, -200, distance(point.origin, queryresult.origin));
                        point._scoredebug[#"disttoorigin"].scorename = "<unknown string>";
                    #/
                    point.score += mapfloat(0, 200, 0, -200, distance(point.origin, queryresult.origin));
                    /#
                        if (!isdefined(point._scoredebug)) {
                            point._scoredebug = [];
                        }
                        if (!isdefined(point._scoredebug[#"heighttoorigin"])) {
                            point._scoredebug[#"heighttoorigin"] = spawnstruct();
                        }
                        point._scoredebug[#"heighttoorigin"].score = mapfloat(50, 200, 0, -200, abs(point.origin[2] - queryresult.origin[2]));
                        point._scoredebug[#"heighttoorigin"].scorename = "<unknown string>";
                    #/
                    point.score += mapfloat(50, 200, 0, -200, abs(point.origin[2] - queryresult.origin[2]));
                    if (point.inclaimedlocation === 1) {
                        /#
                            if (!isdefined(point._scoredebug)) {
                                point._scoredebug = [];
                            }
                            if (!isdefined(point._scoredebug[#"inclaimedlocation"])) {
                                point._scoredebug[#"inclaimedlocation"] = spawnstruct();
                            }
                            point._scoredebug[#"inclaimedlocation"].score = -500;
                            point._scoredebug[#"inclaimedlocation"].scorename = "<unknown string>";
                        #/
                        point.score += -500;
                    }
                    if (point.score > best_score) {
                        best_score = point.score;
                        best_point = point;
                    }
                }
                self vehicle_ai::positionquery_debugscores(queryresult);
                if (isdefined(best_point)) {
                    targetpos = best_point.origin;
                }
            }
            self function_a57c34b7(targetpos, 0, 1);
            self.foundpath = self vehicle_ai::waittill_pathresult();
            if (self.foundpath) {
                self.current_pathto_pos = targetpos;
                self thread function_b38859f();
                self.pathfailcount = 0;
                self vehicle_ai::waittill_pathing_done();
            }
        }
        if (!self.foundpath) {
            self.pathfailcount++;
            if (self.pathfailcount > 2) {
                if (isdefined(self.enemy) && issentient(self.enemy)) {
                    self setpersonalthreatbias(self.enemy, -2000, 5);
                }
            }
            wait(0.1);
            queryresult = positionquery_source_navigation(self.origin, 0, self.settings.max_move_dist, self.settings.max_move_dist, self.radius, self);
            if (queryresult.data.size) {
                point = queryresult.data[randomint(queryresult.data.size)];
                self function_a57c34b7(point.origin, 0, 0);
                self.current_pathto_pos = undefined;
                self thread function_b38859f();
                wait(2);
                self notify(#"near_goal");
            }
        }
        wait(0.2);
    }
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 0, eflags: 0x2 linked
// Checksum 0x4c7ac155, Offset: 0x2378
// Size: 0x1f8
function function_8a699cff() {
    self endon(#"change_state");
    self endon(#"death");
    for (;;) {
        state_params = spawnstruct();
        state_params.var_cc308559 = 1;
        if (!isdefined(self.enemy)) {
            wait(0.1);
            self vehicle_ai::evaluate_connections(undefined, state_params);
            continue;
        }
        self vehicle_ai::evaluate_connections(undefined, state_params);
        if (self cansee(self.enemy)) {
            self vehlookat(self.enemy);
            self turretsettarget(0, self.enemy);
        }
        if (distance2dsquared(self.origin, self.enemy.origin) < sqr(48) && self cansee(self.enemy)) {
            if (bullettracepassed(self.origin + (0, 0, 10), self.enemy.origin + (0, 0, 20), 0, self, self.enemy, 0, 1)) {
                self function_f7dc8837(self.enemy);
                wait(0.5);
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 1, eflags: 0x2 linked
// Checksum 0x36f12d53, Offset: 0x2578
// Size: 0x16e
function function_f7dc8837(enemy) {
    self notify(#"near_goal");
    self vehicle_ai::clearallmovement(1);
    self.dont_move = 1;
    self asmrequestsubstate("melee@stationary");
    timedout = self waittilltimeout(3, #"hash_30146e30dbd0d26b");
    if (timedout._notify !== #"timeout") {
        if (isalive(enemy) && distance2dsquared(self.origin, enemy.origin) < sqr(60)) {
            enemy dodamage(100, self.origin, self, self);
        }
        self vehicle_ai::waittill_asm_complete("melee@stationary", 2);
    }
    self asmrequestsubstate("locomotion@movement");
    self.dont_move = undefined;
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 3, eflags: 0x2 linked
// Checksum 0xa44ff86c, Offset: 0x26f0
// Size: 0xcc
function function_e32c6513(*from_state, *to_state, *connection) {
    if (self.pathfailcount > 4) {
        return true;
    }
    if (!util::iscooldownready("state_change")) {
        return false;
    }
    if (isalive(self.enemy) && distance2dsquared(self.origin, self.enemy.origin) > sqr(200)) {
        return true;
    }
    if (!isdefined(self.enemy)) {
        return true;
    }
    return false;
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 0, eflags: 0x2 linked
// Checksum 0x456d394f, Offset: 0x27c8
// Size: 0xf8
function prevent_stuck() {
    self endon(#"change_state");
    self endon(#"death");
    self notify(#"end_prevent_stuck");
    self endon(#"end_prevent_stuck");
    wait(2);
    count = 0;
    previous_origin = undefined;
    while (true) {
        if (isdefined(previous_origin) && distancesquared(previous_origin, self.origin) < sqr(0.1)) {
            count++;
        } else {
            previous_origin = self.origin;
            count = 0;
        }
        if (count > 10) {
            self.pathfailcount = 10;
        }
        wait(1);
    }
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 0, eflags: 0x2 linked
// Checksum 0xa016ad9a, Offset: 0x28c8
// Size: 0x37c
function function_4417a164() {
    if (self.goalforced) {
        return self.goalpos;
    }
    if (isdefined(self.settings.all_knowing)) {
        if (isdefined(self.enemy)) {
            target_pos = self.enemy.origin;
        }
    } else {
        target_pos = vehicle_ai::gettargetpos(vehicle_ai::getenemytarget());
    }
    enemy = self.enemy;
    if (isdefined(target_pos)) {
        target_pos_onnavmesh = getclosestpointonnavmesh(target_pos, self.settings.detonation_distance * 1.5, self.radius, 4194287);
    }
    if (!isdefined(target_pos_onnavmesh)) {
        if (isdefined(self.enemy) && issentient(self.enemy)) {
            self setpersonalthreatbias(self.enemy, -2000, 5);
        }
        if (isdefined(self.current_pathto_pos) && distancesquared(self.origin, self.current_pathto_pos) > sqr(60)) {
            return self.current_pathto_pos;
        } else {
            return undefined;
        }
    } else if (isdefined(self.enemy) && issentient(self.enemy)) {
        if (distancesquared(target_pos, target_pos_onnavmesh) > sqr(self.settings.detonation_distance * 0.9)) {
            self setpersonalthreatbias(self.enemy, -2000, 5);
        }
    }
    if (isdefined(enemy) && isplayer(enemy)) {
        enemy_vel_offset = enemy getvelocity() * 0.5;
        enemy_look_dir_offset = anglestoforward(enemy.angles);
        if (distance2dsquared(self.origin, enemy.origin) > sqr(500)) {
            enemy_look_dir_offset *= 110;
        } else {
            enemy_look_dir_offset *= 35;
        }
        offset = enemy_vel_offset + enemy_look_dir_offset;
        offset = (offset[0], offset[1], 0);
        if (tracepassedonnavmesh(target_pos_onnavmesh, target_pos + offset)) {
            target_pos += offset;
        } else {
            target_pos = target_pos_onnavmesh;
        }
    } else {
        target_pos = target_pos_onnavmesh;
    }
    return target_pos;
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 0, eflags: 0x2 linked
// Checksum 0x3f1c7865, Offset: 0x2c50
// Size: 0x304
function function_b38859f() {
    self endon(#"death");
    self endon(#"change_state");
    self endon(#"near_goal");
    self endon(#"reached_end_node");
    self notify(#"hash_49730fc0dae6993c");
    self endon(#"hash_49730fc0dae6993c");
    wait(0.1);
    while (true) {
        if (isdefined(self.current_pathto_pos)) {
            if (distance2dsquared(self.current_pathto_pos, self.goalpos) > sqr(self.goalradius)) {
                wait(0.5);
                self notify(#"near_goal");
            }
            targetpos = function_4417a164();
            if (isdefined(targetpos)) {
                if (distancesquared(self.origin, targetpos) > sqr(1000)) {
                    repath_range = self.settings.repath_range * 2;
                    wait(0.1);
                } else {
                    repath_range = self.settings.repath_range;
                }
                if (distance2dsquared(self.current_pathto_pos, targetpos) > sqr(repath_range)) {
                    self notify(#"near_goal");
                }
            }
            if (isdefined(self.enemy) && isplayer(self.enemy)) {
                forward = anglestoforward(self.enemy getplayerangles());
                var_933b09a6 = self.origin - self.enemy.origin;
                speedtouse = self.settings.defaultmovespeed * 2;
                if (vectordot(forward, var_933b09a6) > 0) {
                    self setspeed(speedtouse);
                } else {
                    self setspeed(speedtouse * 0.75);
                }
            } else {
                speedtouse = self.settings.defaultmovespeed * 2;
                self setspeed(speedtouse);
            }
            wait(0.2);
            continue;
        }
        wait(0.4);
    }
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 0, eflags: 0x2 linked
// Checksum 0x8ade2dcb, Offset: 0x2f60
// Size: 0x130
function nudge_collision() {
    self endon(#"death");
    self endon(#"change_state");
    self notify(#"end_nudge_collision");
    self endon(#"end_nudge_collision");
    while (true) {
        result = self waittill(#"veh_collision");
        ang_vel = self getangularvelocity() * 0.8;
        self setangularvelocity(ang_vel);
        if (isalive(self) && vectordot(result.normal, (0, 0, 1)) < 0.5) {
            self setvehvelocity(self.velocity + result.normal * 400);
        }
    }
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 0, eflags: 0x2 linked
// Checksum 0x3aaeaecd, Offset: 0x3098
// Size: 0xd4
function force_get_enemies() {
    foreach (player in getplayers()) {
        if (self util::isenemyplayer(player) && !player.ignoreme) {
            self getperfectinfo(player, 1);
        }
    }
    self namespace_250e9486::function_4b49bf0d();
}

// Namespace namespace_7457b8d5/namespace_7457b8d5
// Params 15, eflags: 0x2 linked
// Checksum 0xc5e56b87, Offset: 0x3178
// Size: 0xb6
function function_725d9b34(*einflictor, eattacker, idamage, *idflags, *smeansofdeath, *weapon, *vpoint, *vdir, *shitloc, *vdamageorigin, *psoffsettime, *damagefromunderneath, *modelindex, *partname, *vsurfacenormal) {
    if (isalive(partname) && partname.team === self.team) {
        return 0;
    }
    return vsurfacenormal;
}

