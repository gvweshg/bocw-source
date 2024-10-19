// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_death_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace wasp;

// Namespace wasp/wasp
// Params 0, eflags: 0x5
// Checksum 0xd8a7ce8, Offset: 0x2a0
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"wasp", &preinit, undefined, undefined, undefined);
}

// Namespace wasp/wasp
// Params 0, eflags: 0x6 linked
// Checksum 0x15ee723b, Offset: 0x2e8
// Size: 0x74
function private preinit() {
    vehicle::add_main_callback("wasp", &wasp_initialize);
    clientfield::register("vehicle", "rocket_wasp_hijacked", 1, 1, "int");
    level thread wasp_towers_on_load();
}

// Namespace wasp/wasp
// Params 0, eflags: 0x2 linked
// Checksum 0xe21527a5, Offset: 0x368
// Size: 0x27c
function wasp_initialize() {
    self useanimtree("generic");
    vehicle::make_targetable(self);
    self.health = self.healthdefault;
    self vehicle::friendly_fire_shield();
    self enableaimassist();
    self setneargoalnotifydist(40);
    self sethoverparams(50, 100, 100);
    self.fovcosine = 0;
    self.fovcosinebusy = 0;
    self.vehaircraftcollisionenabled = 1;
    assert(isdefined(self.scriptbundlesettings));
    self.settings = getscriptbundle(self.scriptbundlesettings);
    self.goalradius = 999999;
    self.goalheight = 999999;
    if (issentient(self) && ispathfinder(self)) {
        self setgoal(self.origin, 0, self.goalradius, self.goalheight);
    } else {
        self setgoal(self.origin, 1, 0);
    }
    self.variant = "mg";
    if (issubstr(self.scriptvehicletype, "rocket")) {
        self.variant = "rocket";
    }
    self.overridevehicledamage = &drone_callback_damage;
    self.allowfriendlyfiredamageoverride = &drone_allowfriendlyfiredamage;
    self thread vehicle_ai::nudge_collision();
    if (isdefined(level.vehicle_initializer_cb)) {
        [[ level.vehicle_initializer_cb ]](self);
    }
    init_guard_points();
    defaultrole();
}

// Namespace wasp/wasp
// Params 0, eflags: 0x2 linked
// Checksum 0x4c71a7ae, Offset: 0x5f0
// Size: 0x2d4
function defaultrole() {
    self vehicle_ai::init_state_machine_for_role("default");
    self vehicle_ai::get_state_callbacks("combat").enter_func = &state_combat_enter;
    if (ispathfinder(self)) {
        self vehicle_ai::get_state_callbacks("combat").update_func = &state_combat_update;
        self vehicle_ai::get_state_callbacks("death").update_func = &state_death_update;
        self vehicle_ai::get_state_callbacks("driving").update_func = &wasp_driving;
        self vehicle_ai::get_state_callbacks("emped").update_func = &state_emped_update;
        self vehicle_ai::add_state("guard", &state_guard_enter, &state_guard_update, &state_guard_exit);
        vehicle_ai::add_utility_connection("combat", "guard", &state_guard_can_enter);
        vehicle_ai::add_utility_connection("guard", "combat");
        vehicle_ai::add_interrupt_connection("guard", "emped", "emped");
        vehicle_ai::add_interrupt_connection("guard", "off", "shut_off");
        vehicle_ai::add_interrupt_connection("guard", "pain", "pain");
        vehicle_ai::add_interrupt_connection("guard", "driving", "enter_vehicle");
    } else {
        self vehicle_ai::get_state_callbacks("combat").update_func = &function_739ac4a0;
        self vehicle_ai::get_state_callbacks("death").update_func = &state_death_update;
    }
    vehicle_ai::startinitialstate("combat");
}

// Namespace wasp/wasp
// Params 1, eflags: 0x2 linked
// Checksum 0xe9d7fb9b, Offset: 0x8d0
// Size: 0x39c
function state_death_update(params) {
    self endon(#"death");
    if (isarray(self.followers)) {
        foreach (follower in self.followers) {
            if (isdefined(follower)) {
                follower.leader = undefined;
            }
        }
    }
    death_type = vehicle_ai::get_death_type(params);
    if (!isdefined(death_type) && isdefined(params)) {
        if (isdefined(params.weapon)) {
            if (params.weapon.doannihilate) {
                death_type = "gibbed";
            } else if (params.weapon.dogibbing && isdefined(params.attacker)) {
                dist = distance(self.origin, params.attacker.origin);
                if (dist < params.weapon.maxgibdistance) {
                    gib_chance = 1 - dist / params.weapon.maxgibdistance;
                    if (randomfloatrange(0, 2) < gib_chance) {
                        death_type = "gibbed";
                    }
                }
            }
        }
        if (isdefined(params.meansofdeath)) {
            meansofdeath = params.meansofdeath;
            if (meansofdeath === "MOD_EXPLOSIVE" || meansofdeath === "MOD_GRENADE_SPLASH" || meansofdeath === "MOD_PROJECTILE_SPLASH" || meansofdeath === "MOD_PROJECTILE") {
                death_type = "gibbed";
            }
        }
    }
    if (!isdefined(death_type)) {
        crash_style = randomint(3);
        switch (crash_style) {
        case 0:
            if (self.hijacked === 1) {
                params.death_type = "gibbed";
                vehicle_ai::defaultstate_death_update(params);
            } else {
                vehicle_death::barrel_rolling_crash();
            }
            break;
        case 1:
            vehicle_death::plane_crash();
            break;
        default:
            vehicle_death::random_crash(params.vdir);
            break;
        }
        self vehicle_death::deletewhensafe();
        return;
    }
    params.death_type = death_type;
    vehicle_ai::defaultstate_death_update(params);
}

// Namespace wasp/wasp
// Params 1, eflags: 0x2 linked
// Checksum 0xff90616a, Offset: 0xc78
// Size: 0x65c
function state_emped_update(params) {
    self endon(#"death", #"change_state");
    waitframe(1);
    gravity = 400;
    self notify(#"end_nudge_collision");
    empdowntime = params.param0;
    assert(isdefined(empdowntime));
    util::cooldown("emped_timer", empdowntime);
    wait(randomfloat(0.2));
    ang_vel = self getangularvelocity();
    pitch_vel = math::randomsign() * randomfloatrange(200, 250);
    yaw_vel = math::randomsign() * randomfloatrange(200, 250);
    roll_vel = math::randomsign() * randomfloatrange(200, 250);
    ang_vel += (pitch_vel, yaw_vel, roll_vel);
    self setangularvelocity(ang_vel);
    if (ispointinnavvolume(self.origin, "navvolume_small")) {
        self.position_before_fall = self.origin;
    }
    self cancelaimove();
    self setphysacceleration((0, 0, gravity * -1));
    killonimpact_speed = self.settings.killonimpact_speed;
    if (self.health <= 20) {
        killonimpact_speed = 1;
    }
    self fall_and_bounce(killonimpact_speed, self.settings.killonimpact_time, 1);
    self notify(#"landed");
    self setvehvelocity((0, 0, 0));
    self setphysacceleration((0, 0, gravity * -1 * 0.1));
    self setangularvelocity((0, 0, 0));
    while (!util::iscooldownready("emped_timer")) {
        timeleft = max(util::getcooldownleft("emped_timer"), 0.5);
        wait(timeleft);
    }
    self.abnormal_status.emped = 0;
    self vehicle::toggle_emp_fx(0);
    self vehicle_ai::emp_startup_fx();
    for (bootup_timer = 1.6; bootup_timer > 0; bootup_timer -= 0.8) {
        self vehicle::lights_on();
        wait(0.4);
        self vehicle::lights_off();
        wait(0.4);
    }
    self vehicle::lights_on();
    if (isdefined(self.position_before_fall)) {
        originoffset = (0, 0, 5);
        goalpoint = self getclosestpointonnavvolume(self.origin + originoffset, 50);
        if (isdefined(goalpoint) && sighttracepassed(self.origin + originoffset, goalpoint, 0, self)) {
            self function_a57c34b7(goalpoint, 0, 0);
            self waittilltimeout(0.3, #"near_goal", #"goal");
            if (isdefined(self.enemy) && isalive(self)) {
                self vehlookat(self.enemy);
            }
            starttime = gettime();
            self.current_pathto_pos = self.position_before_fall;
            foundgoal = self function_a57c34b7(self.current_pathto_pos, 1, 1);
            while (!foundgoal && util::timesince(starttime) < 3) {
                foundgoal = self function_a57c34b7(self.current_pathto_pos, 1, 1);
                wait(0.3);
            }
            if (foundgoal) {
                self waittilltimeout(1, #"near_goal", #"goal");
            } else {
                self function_a57c34b7(self.origin, 1, 0);
            }
            wait(1);
            self.position_before_fall = undefined;
            self vehicle_ai::evaluate_connections();
        }
    }
    self vehicle::lights_off();
    self thread function_d34735d1();
}

// Namespace wasp/wasp
// Params 0, eflags: 0x2 linked
// Checksum 0x272a22b4, Offset: 0x12e0
// Size: 0x4c
function function_d34735d1() {
    self notify("5070a0b250851eba");
    self endon("5070a0b250851eba");
    self endon(#"death");
    wait(3);
    self kill();
}

// Namespace wasp/wasp
// Params 3, eflags: 0x2 linked
// Checksum 0xbc09337c, Offset: 0x1338
// Size: 0x5a4
function fall_and_bounce(killonimpact_speed, killonimpact_time, killonimpact = 0) {
    self endon(#"death", #"change_state");
    maxbouncetime = 3;
    bouncescale = 0.3;
    velocityloss = 0.3;
    maxangle = 12;
    bouncedtime = 0;
    angularvelstablizeparams = (0.3, 0.5, 0.2);
    anglesstablizeinitialscale = 0.6;
    anglesstablizeincrement = 0.2;
    fallstart = gettime();
    while (bouncedtime < maxbouncetime && lengthsquared(self.velocity) > sqr(10)) {
        waitresult = self waittill(#"veh_collision");
        impact_vel = waitresult.velocity;
        normal = waitresult.normal;
        if (killonimpact) {
            self kill();
        } else if (lengthsquared(impact_vel) > sqr(killonimpact_speed) || util::timesince(fallstart) > killonimpact_time && lengthsquared(impact_vel) > sqr(killonimpact_speed * 0.8)) {
            self kill();
        } else if (!isdefined(self.position_before_fall)) {
            self kill();
        } else {
            fallstart = gettime();
        }
        oldvelocity = self.velocity;
        vel_hitdir = vectorprojection(impact_vel, normal) * -1;
        vel_hitdirup = vectorprojection(vel_hitdir, (0, 0, 1));
        velscale = min(bouncescale * (bouncedtime + 1), 0.9);
        newvelocity = (oldvelocity - vectorprojection(oldvelocity, vel_hitdir)) * (1 - velocityloss);
        newvelocity += vel_hitdir * velscale;
        shouldbounce = vectordot(normal, (0, 0, 1)) > 0.76;
        if (shouldbounce) {
            velocitylengthsqr = lengthsquared(newvelocity);
            stablizescale = mapfloat(sqr(5), sqr(60), 0.1, 1, velocitylengthsqr);
            ang_vel = self getangularvelocity();
            ang_vel *= angularvelstablizeparams * stablizescale;
            self setangularvelocity(ang_vel);
            angles = self.angles;
            anglesstablizescale = min(anglesstablizeinitialscale - bouncedtime * anglesstablizeincrement, 0.1);
            pitch = angles[0];
            yaw = angles[1];
            roll = angles[2];
            surfaceangles = vectortoangles(normal);
            surfaceroll = surfaceangles[2];
            if (pitch < maxangle * -1 || pitch > maxangle) {
                pitch *= anglesstablizescale;
            }
            if (roll < surfaceroll - maxangle || roll > surfaceroll + maxangle) {
                roll = lerpfloat(surfaceroll, roll, anglesstablizescale);
            }
            self.angles = (pitch, yaw, roll);
        }
        self setvehvelocity(newvelocity);
        self vehicle_ai::collision_fx(normal);
        if (shouldbounce) {
            bouncedtime++;
        }
    }
}

// Namespace wasp/wasp
// Params 0, eflags: 0x2 linked
// Checksum 0xd0bd93aa, Offset: 0x18e8
// Size: 0x244
function init_guard_points() {
    self._guard_points = [];
    if (!isdefined(self._guard_points)) {
        self._guard_points = [];
    } else if (!isarray(self._guard_points)) {
        self._guard_points = array(self._guard_points);
    }
    self._guard_points[self._guard_points.size] = (150, -110, 110);
    if (!isdefined(self._guard_points)) {
        self._guard_points = [];
    } else if (!isarray(self._guard_points)) {
        self._guard_points = array(self._guard_points);
    }
    self._guard_points[self._guard_points.size] = (150, 110, 110);
    if (!isdefined(self._guard_points)) {
        self._guard_points = [];
    } else if (!isarray(self._guard_points)) {
        self._guard_points = array(self._guard_points);
    }
    self._guard_points[self._guard_points.size] = (120, -110, 80);
    if (!isdefined(self._guard_points)) {
        self._guard_points = [];
    } else if (!isarray(self._guard_points)) {
        self._guard_points = array(self._guard_points);
    }
    self._guard_points[self._guard_points.size] = (120, 110, 80);
    if (!isdefined(self._guard_points)) {
        self._guard_points = [];
    } else if (!isarray(self._guard_points)) {
        self._guard_points = array(self._guard_points);
    }
    self._guard_points[self._guard_points.size] = (180, 0, 140);
}

/#

    // Namespace wasp/wasp
    // Params 0, eflags: 0x0
    // Checksum 0x56011100, Offset: 0x1b38
    // Size: 0x10a
    function guard_points_debug() {
        self endon(#"death");
        if (self.isdebugdrawing === 1) {
            return;
        }
        self.isdebugdrawing = 1;
        while (true) {
            foreach (point in self.debugpointsarray) {
                color = (1, 0, 0);
                if (ispointinnavvolume(point, "<unknown string>")) {
                    color = (0, 1, 0);
                }
                debugstar(point, 5, color);
            }
            waitframe(1);
        }
    }

#/

// Namespace wasp/wasp
// Params 1, eflags: 0x2 linked
// Checksum 0x2b24b1a8, Offset: 0x1c50
// Size: 0x332
function get_guard_points(owner) {
    assert(self._guard_points.size > 0, "<unknown string>");
    points_array = [];
    foreach (point in self._guard_points) {
        offset = rotatepoint(point, owner.angles);
        worldpoint = offset + owner.origin + owner getvelocity() * 0.5;
        if (ispointinnavvolume(worldpoint, "navvolume_small")) {
            if (!isdefined(points_array)) {
                points_array = [];
            } else if (!isarray(points_array)) {
                points_array = array(points_array);
            }
            points_array[points_array.size] = worldpoint;
        }
    }
    if (points_array.size < 1) {
        queryresult = positionquery_source_navigation(owner.origin + (0, 0, 50), 25, 200, 100, 1.2 * self.radius, self);
        positionquery_filter_sight(queryresult, owner.origin + (0, 0, 10), (0, 0, 0), self, 3);
        foreach (point in queryresult.data) {
            if (point.visibility === 1 && bullettracepassed(owner.origin + (0, 0, 10), point.origin, 0, self, self, 0, 1)) {
                if (!isdefined(points_array)) {
                    points_array = [];
                } else if (!isarray(points_array)) {
                    points_array = array(points_array);
                }
                points_array[points_array.size] = point.origin;
            }
        }
    }
    return points_array;
}

// Namespace wasp/wasp
// Params 3, eflags: 0x2 linked
// Checksum 0x9f4f0f17, Offset: 0x1f90
// Size: 0x146
function state_guard_can_enter(*from_state, *to_state, *connection) {
    if (self.enable_guard !== 1 || !isdefined(self.owner)) {
        return false;
    }
    if (!isdefined(self.enemy) || !self seerecently(self.enemy, 3)) {
        return true;
    }
    if (distancesquared(self.owner.origin, self.enemy.origin) > sqr(1200) && distancesquared(self.origin, self.enemy.origin) > sqr(300)) {
        return true;
    }
    if (!ispointinnavvolume(self.origin, "navvolume_small")) {
        return true;
    }
    return false;
}

// Namespace wasp/wasp
// Params 1, eflags: 0x2 linked
// Checksum 0xcfe7bcb5, Offset: 0x20e0
// Size: 0x4c
function state_guard_enter(*params) {
    if (self.enable_target_laser === 1) {
        self laseroff();
    }
    self update_main_guard();
}

// Namespace wasp/wasp
// Params 0, eflags: 0x2 linked
// Checksum 0x6c449111, Offset: 0x2138
// Size: 0x72
function update_main_guard() {
    if (isdefined(self.owner) && !isalive(self.owner.main_guard) || self.owner.main_guard.owner !== self.owner) {
        self.owner.main_guard = self;
    }
}

// Namespace wasp/wasp
// Params 1, eflags: 0x2 linked
// Checksum 0x5a0a4a30, Offset: 0x21b8
// Size: 0x3e
function state_guard_exit(*params) {
    if (isdefined(self.owner) && self.owner.main_guard === self) {
        self.owner.main_guard = undefined;
    }
}

// Namespace wasp/wasp
// Params 1, eflags: 0x2 linked
// Checksum 0x5752c18e, Offset: 0x2200
// Size: 0x64
function test_get_back_point(point) {
    if (sighttracepassed(self.origin, point, 0, self)) {
        if (bullettracepassed(self.origin, point, 0, self, self, 0, 1)) {
            return 1;
        }
        return 0;
    }
    return -1;
}

// Namespace wasp/wasp
// Params 1, eflags: 0x2 linked
// Checksum 0xd0f020b2, Offset: 0x2270
// Size: 0xe4
function test_get_back_queryresult(queryresult) {
    getbackpoint = undefined;
    foreach (point in queryresult.data) {
        testresult = test_get_back_point(point.origin);
        if (testresult == 1) {
            return point.origin;
        }
        if (testresult == 0) {
            waitframe(1);
        }
    }
    return undefined;
}

// Namespace wasp/wasp
// Params 1, eflags: 0x2 linked
// Checksum 0xce0f02f, Offset: 0x2360
// Size: 0x850
function state_guard_update(*params) {
    self endon(#"death", #"change_state");
    self sethoverparams(20, 40, 30);
    timenotatgoal = gettime();
    pointindex = 0;
    stuckcount = 0;
    while (true) {
        if (isdefined(self.enemy) && distancesquared(self.owner.origin, self.enemy.origin) < sqr(1000) && self seerecently(self.enemy, 1) && ispointinnavvolume(self.origin, "navvolume_small")) {
            self vehicle_ai::evaluate_connections();
            wait(1);
            continue;
        }
        owner = self.owner;
        if (!isdefined(owner)) {
            wait(1);
            continue;
        }
        usepathfinding = 1;
        onnavvolume = ispointinnavvolume(self.origin, "navvolume_small");
        if (!onnavvolume) {
            getbackpoint = undefined;
            pointonnavvolume = self getclosestpointonnavvolume(self.origin, 500);
            if (isdefined(pointonnavvolume)) {
                if (test_get_back_point(pointonnavvolume) == 1) {
                    getbackpoint = pointonnavvolume;
                }
            }
            if (!isdefined(getbackpoint)) {
                queryresult = positionquery_source_navigation(self.origin, 0, 1500, 200, 80, self);
                getbackpoint = test_get_back_queryresult(queryresult);
            }
            if (!isdefined(getbackpoint)) {
                queryresult = positionquery_source_navigation(self.origin, 0, 300, 700, 30, self);
                getbackpoint = test_get_back_queryresult(queryresult);
            }
            if (isdefined(getbackpoint)) {
                if (distancesquared(getbackpoint, self.origin) > sqr(20)) {
                    self.current_pathto_pos = getbackpoint;
                    usepathfinding = 0;
                    self.vehaircraftcollisionenabled = 0;
                } else {
                    onnavvolume = 1;
                }
            } else {
                stuckcount++;
                if (stuckcount == 1) {
                    stucklocation = self.origin;
                } else if (stuckcount > 10) {
                    /#
                        assert(0, "<unknown string>" + self.origin);
                        v_box_min = (self.radius * -1, self.radius * -1, self.radius * -1);
                        v_box_max = (self.radius, self.radius, self.radius);
                        box(self.origin, v_box_min, v_box_max, self.angles[1], (1, 0, 0), 1, 0, 1000000);
                        if (isdefined(stucklocation)) {
                            line(stucklocation, self.origin, (1, 0, 0), 1, 1, 1000000);
                        }
                    #/
                    self kill();
                }
            }
        }
        if (onnavvolume) {
            self update_main_guard();
            if (owner.main_guard === self) {
                guardpoints = get_guard_points(owner);
                if (guardpoints.size < 1) {
                    wait(1);
                    continue;
                }
                stuckcount = 0;
                self.vehaircraftcollisionenabled = 1;
                if (guardpoints.size <= pointindex) {
                    pointindex = randomint(int(min(self._guard_points.size, guardpoints.size)));
                    timenotatgoal = gettime();
                }
                self.current_pathto_pos = guardpoints[pointindex];
            } else {
                main_guard = owner.main_guard;
                if (isalive(main_guard) && isdefined(main_guard.current_pathto_pos)) {
                    query_position = main_guard.current_pathto_pos;
                    queryresult = positionquery_source_navigation(query_position, 20, 140, 100, 20, self, 15);
                    if (queryresult.data.size > 0) {
                        self.current_pathto_pos = queryresult.data[queryresult.data.size - 1].origin;
                    }
                }
            }
        }
        if (isdefined(self.current_pathto_pos)) {
            distancetogoalsq = distancesquared(self.current_pathto_pos, self.origin);
            if (!onnavvolume || distancetogoalsq > sqr(60)) {
                if (distancetogoalsq > sqr(600)) {
                    self setspeed(self.settings.defaultmovespeed * 2);
                } else if (distancetogoalsq < sqr(100)) {
                    self setspeed(self.settings.defaultmovespeed * 0.3);
                } else {
                    self setspeed(self.settings.defaultmovespeed);
                }
                timenotatgoal = gettime();
            } else {
                if (util::timesince(timenotatgoal) > 4) {
                    pointindex = randomint(self._guard_points.size);
                    timenotatgoal = gettime();
                }
                wait(0.2);
                continue;
            }
            if (self function_a57c34b7(self.current_pathto_pos, 1, usepathfinding)) {
                self playsound(#"veh_wasp_direction");
                self vehclearlookat();
                self notify(#"fire_stop");
                self thread path_update_interrupt();
                if (onnavvolume) {
                    self vehicle_ai::waittill_pathing_done(1);
                } else {
                    self vehicle_ai::waittill_pathing_done();
                }
            } else {
                wait(0.5);
            }
            continue;
        }
        wait(0.5);
    }
}

// Namespace wasp/wasp
// Params 1, eflags: 0x2 linked
// Checksum 0xa593ee9d, Offset: 0x2bb8
// Size: 0x84
function state_combat_enter(*params) {
    if (self.enable_target_laser === 1) {
        self laseron();
    }
    if (isdefined(self.owner) && isdefined(self.owner.enemy)) {
        self.favoriteenemy = self.owner.enemy;
    }
    self thread turretfireupdate();
}

// Namespace wasp/wasp
// Params 0, eflags: 0x2 linked
// Checksum 0x52f69e39, Offset: 0x2c48
// Size: 0x52c
function turretfireupdate() {
    self endon(#"death", #"change_state");
    isrockettype = self.variant === "rocket";
    while (true) {
        if (isdefined(self.enemy) && self cansee(self.enemy) && isalive(self)) {
            if (isdefined(self.wing_drone)) {
                foreach (drone in self.wing_drone) {
                    drone.favoriteenemy = self.enemy;
                }
            }
            if (distancesquared(self.enemy.origin, self.origin) < sqr(0.5 * (self.settings.engagementdistmin + self.settings.engagementdistmax) * 3)) {
                self vehlookat(self.enemy);
                if (isrockettype) {
                    self turretsettarget(0, self.enemy, self.enemy getvelocity() * 0.3 - vehicle_ai::gettargeteyeoffset(self.enemy) * 0.3);
                } else {
                    self turretsettarget(0, self.enemy, vehicle_ai::gettargeteyeoffset(self.enemy) * -1 * 0.3);
                }
                startaim = gettime();
                while (!self.turretontarget && util::timesince(startaim) < 3) {
                    wait(0.2);
                }
                if (isdefined(self.enemy) && self.turretontarget && self.noshoot !== 1) {
                    if (isrockettype) {
                        for (i = 0; i < 2 && isdefined(self.enemy); i++) {
                            self fireweapon(0, self.enemy);
                            fired = 1;
                            wait(0.25);
                        }
                    } else {
                        self vehicle_ai::fire_for_time(randomfloatrange(self.settings.turret_fire_burst_min, self.settings.turret_fire_burst_max), 0, self.enemy);
                    }
                    if (isdefined(self.settings.turret_cooldown_max)) {
                        if (!isdefined(self.settings.turret_cooldown_min)) {
                            self.settings.turret_cooldown_min = 0;
                        }
                        wait(randomfloatrange(self.settings.turret_cooldown_min, self.settings.turret_cooldown_max));
                    }
                } else if (isdefined(self.settings.turret_enemy_detect_freq)) {
                    wait(self.settings.turret_enemy_detect_freq);
                }
                self turretsettargetangles(0, (15, 0, 0));
            }
            if (isrockettype) {
                if (isdefined(self.enemy) && isai(self.enemy)) {
                    wait(randomfloatrange(4, 7));
                } else {
                    wait(randomfloatrange(3, 5));
                }
            } else if (isdefined(self.enemy) && isai(self.enemy)) {
                wait(randomfloatrange(2, 2.5));
            } else {
                wait(randomfloatrange(0.5, 1.5));
            }
            continue;
        }
        wait(0.4);
    }
}

// Namespace wasp/wasp
// Params 0, eflags: 0x2 linked
// Checksum 0x85c054a3, Offset: 0x3180
// Size: 0x254
function path_update_interrupt() {
    self endon(#"death", #"change_state", #"near_goal", #"reached_end_node");
    self notify(#"path_update_interrupt");
    self endon(#"path_update_interrupt");
    old_enemy = self.enemy;
    wait(1);
    while (true) {
        if (isdefined(self.current_pathto_pos)) {
            if (distance2dsquared(self.current_pathto_pos, self.goalpos) > sqr(self.goalradius)) {
                wait(0.2);
                self notify(#"near_goal");
            }
        }
        if (isdefined(self.enemy) && isalive(self)) {
            if (self.noshoot !== 1 && self cansee(self.enemy)) {
                self turretsettarget(0, self.enemy);
                self vehlookat(self.enemy);
            }
            if (!isdefined(old_enemy)) {
                self notify(#"near_goal");
            } else if (self.enemy != old_enemy) {
                self notify(#"near_goal");
            }
            if (self cansee(self.enemy) && distance2dsquared(self.origin, self.enemy.origin) < sqr(250)) {
                self notify(#"near_goal");
            }
        }
        wait(0.2);
    }
}

// Namespace wasp/wasp
// Params 1, eflags: 0x2 linked
// Checksum 0x4d6237a6, Offset: 0x33e0
// Size: 0x2d8
function wait_till_something_happens(timeout) {
    self endon(#"change_state", #"death");
    wait(0.1);
    time = timeout;
    cant_see_count = 0;
    while (time > 0) {
        if (isdefined(self.current_pathto_pos)) {
            if (distancesquared(self.current_pathto_pos, self.goalpos) > sqr(self.goalradius)) {
                break;
            }
        }
        if (isdefined(self.enemy)) {
            if (!self cansee(self.enemy)) {
                cant_see_count++;
                if (cant_see_count >= 3) {
                    break;
                }
            } else {
                cant_see_count = 0;
            }
            if (distance2dsquared(self.origin, self.enemy.origin) < sqr(250)) {
                break;
            }
            goalheight = self.enemy.origin[2] + 0.5 * (self.settings.engagementheightmin + self.settings.engagementheightmax);
            distfrompreferredheight = abs(self.origin[2] - goalheight);
            if (distfrompreferredheight > 100) {
                break;
            }
            if (isplayer(self.enemy) && self.enemy islookingat(self)) {
                if (math::cointoss()) {
                    wait(randomfloatrange(0.1, 0.5));
                }
                self drop_leader();
                break;
            }
        }
        if (isdefined(self.leader) && isdefined(self.leader.current_pathto_pos)) {
            if (distancesquared(self.origin, self.leader.current_pathto_pos) > sqr(165)) {
                break;
            }
        }
        wait(0.3);
        time -= 0.3;
    }
}

// Namespace wasp/wasp
// Params 0, eflags: 0x2 linked
// Checksum 0x758a78a4, Offset: 0x36c0
// Size: 0x3e
function drop_leader() {
    if (isdefined(self.leader)) {
        arrayremovevalue(self.leader.followers, self);
        self.leader = undefined;
    }
}

// Namespace wasp/wasp
// Params 0, eflags: 0x2 linked
// Checksum 0x3459fc23, Offset: 0x3708
// Size: 0x1e2
function update_leader() {
    if (isdefined(self.no_group) && self.no_group == 1) {
        return;
    }
    if (isdefined(self.leader)) {
        return;
    }
    if (isdefined(self.followers)) {
        function_1eaaceab(self.followers, 0);
        if (self.followers.size > 0) {
            return;
        }
    }
    team_mates = getaiteamarray(self.team);
    foreach (guy in team_mates) {
        if (isdefined(guy.archetype) && guy.archetype == "wasp") {
            if (isdefined(guy.leader)) {
                continue;
            }
            if (guy == self) {
                continue;
            }
            if (distancesquared(self.origin, guy.origin) > sqr(700)) {
                continue;
            }
            if (!isdefined(guy.followers)) {
                guy.followers = [];
            }
            if (guy.followers.size >= 2) {
                continue;
            }
            guy.followers[guy.followers.size] = self;
            self.leader = guy;
            break;
        }
    }
}

// Namespace wasp/wasp
// Params 1, eflags: 0x2 linked
// Checksum 0xe5657503, Offset: 0x38f8
// Size: 0x150
function should_fly_forward(distancetogoalsq) {
    if (self.always_face_enemy === 1) {
        return false;
    }
    if (distancetogoalsq < sqr(250)) {
        return false;
    }
    if (isdefined(self.enemy)) {
        to_goal = vectornormalize(self.current_pathto_pos - self.origin);
        to_enemy = vectornormalize(self.enemy.origin - self.origin);
        dot = vectordot(to_goal, to_enemy);
        if (abs(dot) > 0.7) {
            return false;
        }
    }
    if (distancetogoalsq > sqr(400)) {
        return (randomint(100) > 25);
    }
    return randomint(100) > 50;
}

// Namespace wasp/wasp
// Params 1, eflags: 0x2 linked
// Checksum 0xd95d1d29, Offset: 0x3a50
// Size: 0x12c
function function_739ac4a0(*params) {
    self endon(#"change_state", #"death");
    self setspeed(self.settings.defaultmovespeed);
    for (;;) {
        goalinfo = self function_4794d6a3();
        newpos = undefined;
        isatgoal = is_true(goalinfo.isatgoal) || isdefined(self.overridegoalpos) && self isapproachinggoal();
        if (!isatgoal) {
            goalpos = goalinfo.goalpos;
        }
        if (isdefined(goalpos)) {
            self setgoal(goalpos, 1, 0);
            self.current_pathto_pos = goalpos;
        }
        wait(1);
    }
}

// Namespace wasp/wasp
// Params 1, eflags: 0x2 linked
// Checksum 0xce684b7a, Offset: 0x3b88
// Size: 0x87a
function state_combat_update(*params) {
    self endon(#"change_state", #"death");
    wait(0.1);
    stuckcount = 0;
    for (;;) {
        self setspeed(self.settings.defaultmovespeed);
        self update_leader();
        if (is_true(self.inpain) || is_true(self.isstunned)) {
            wait(0.1);
            continue;
        }
        if (self.enable_guard === 1) {
            self vehicle_ai::evaluate_connections();
        }
        if (isdefined(self.enemy) && isalive(self)) {
            self turretsettarget(0, self.enemy);
            self vehlookat(self.enemy);
            self wait_till_something_happens(randomfloatrange(2, 5));
        }
        if (!isdefined(self.enemy)) {
            self vehclearlookat();
            aiarray = getaiteamarray("all");
            foreach (ai in aiarray) {
                self getperfectinfo(ai);
            }
            players = getplayers("all");
            foreach (player in players) {
                self getperfectinfo(player);
            }
            wait(1);
        }
        usepathfinding = 1;
        onnavvolume = ispointinnavvolume(self.origin, "navvolume_small");
        if (!onnavvolume) {
            getbackpoint = undefined;
            if (self.aggresive_navvolume_recover === 1) {
                self vehicle_ai::evaluate_connections();
            }
            pointonnavvolume = self getclosestpointonnavvolume(self.origin, 100);
            if (isdefined(pointonnavvolume)) {
                if (sighttracepassed(self.origin, pointonnavvolume, 0, self)) {
                    getbackpoint = pointonnavvolume;
                }
            }
            if (!isdefined(getbackpoint)) {
                queryresult = positionquery_source_navigation(self.origin, 0, 200, 100, 2 * self.radius, self);
                positionquery_filter_sight(queryresult, self.origin, (0, 0, 0), self, 1);
                getbackpoint = undefined;
                foreach (point in queryresult.data) {
                    if (point.visibility === 1) {
                        getbackpoint = point.origin;
                        break;
                    }
                }
            }
            if (isdefined(getbackpoint)) {
                self.current_pathto_pos = getbackpoint;
                usepathfinding = 0;
            } else {
                stuckcount++;
                if (stuckcount == 1) {
                    stucklocation = self.origin;
                } else if (stuckcount > 10) {
                    /#
                        v_box_min = (self.radius * -1, self.radius * -1, self.radius * -1);
                        v_box_max = (self.radius, self.radius, self.radius);
                        box(self.origin, v_box_min, v_box_max, self.angles[1], (1, 0, 0), 1, 0, 1000000);
                        if (isdefined(stucklocation)) {
                            line(stucklocation, self.origin, (1, 0, 0), 1, 1, 1000000);
                        }
                    #/
                    self kill();
                }
            }
        } else {
            stuckcount = 0;
            if (self.goalforced) {
                goalpos = self getclosestpointonnavvolume(self.goalpos, 100);
                if (isdefined(goalpos)) {
                    self.current_pathto_pos = goalpos;
                    usepathfinding = 1;
                } else {
                    self.current_pathto_pos = self.goalpos;
                    usepathfinding = 0;
                }
            } else if (isdefined(self.enemy)) {
                self.current_pathto_pos = getnextmoveposition_tactical();
                usepathfinding = 1;
            } else {
                self.current_pathto_pos = getnextmoveposition_wander();
                usepathfinding = 1;
            }
        }
        if (isdefined(self.current_pathto_pos)) {
            distancetogoalsq = distancesquared(self.current_pathto_pos, self.origin);
            if (!onnavvolume || distancetogoalsq > sqr(75)) {
                if (distancetogoalsq > sqr(2000)) {
                    self setspeed(self.settings.defaultmovespeed * 2);
                }
                if (self function_a57c34b7(self.current_pathto_pos, 1, usepathfinding)) {
                    if (isdefined(self.enemy)) {
                        self playsound(#"veh_wasp_direction");
                    } else {
                        self playsound(#"veh_wasp_vox");
                    }
                    if (should_fly_forward(distancetogoalsq)) {
                        self vehclearlookat();
                        self notify(#"fire_stop");
                        self.noshoot = 1;
                    }
                    self thread path_update_interrupt();
                    self vehicle_ai::waittill_pathing_done();
                    self.noshoot = undefined;
                }
            }
        }
    }
}

// Namespace wasp/wasp
// Params 0, eflags: 0x2 linked
// Checksum 0xcdd78103, Offset: 0x4410
// Size: 0x2b2
function getnextmoveposition_wander() {
    querymultiplier = 1;
    queryresult = positionquery_source_navigation(self.origin, 80, 500 * querymultiplier, 130, 3 * self.radius * querymultiplier, self, self.radius * querymultiplier);
    positionquery_filter_distancetogoal(queryresult, self);
    vehicle_ai::positionquery_filter_outofgoalanchor(queryresult);
    self.isonnav = queryresult.centeronnav;
    best_point = undefined;
    best_score = -999999;
    foreach (point in queryresult.data) {
        randomscore = randomfloatrange(0, 100);
        disttooriginscore = point.disttoorigin2d * 0.2;
        point.score += randomscore + disttooriginscore;
        /#
            if (!isdefined(point._scoredebug)) {
                point._scoredebug = [];
            }
            if (!isdefined(point._scoredebug[#"disttoorigin"])) {
                point._scoredebug[#"disttoorigin"] = spawnstruct();
            }
            point._scoredebug[#"disttoorigin"].score = disttooriginscore;
            point._scoredebug[#"disttoorigin"].scorename = "<unknown string>";
        #/
        point.score += disttooriginscore;
        if (point.score > best_score) {
            best_score = point.score;
            best_point = point;
        }
    }
    self vehicle_ai::positionquery_debugscores(queryresult);
    if (!isdefined(best_point)) {
        return undefined;
    }
    return best_point.origin;
}

// Namespace wasp/wasp
// Params 0, eflags: 0x2 linked
// Checksum 0x8566c270, Offset: 0x46d0
// Size: 0xf36
function getnextmoveposition_tactical() {
    if (!isdefined(self.enemy)) {
        return self getnextmoveposition_wander();
    }
    selfdisttotarget = distance2d(self.origin, self.enemy.origin);
    gooddist = 0.5 * (self.settings.engagementdistmin + self.settings.engagementdistmax);
    closedist = 1.2 * gooddist;
    fardist = 3 * gooddist;
    querymultiplier = mapfloat(closedist, fardist, 1, 3, selfdisttotarget);
    preferedheightrange = 35;
    randomness = 30;
    avoid_locations = [];
    avoid_radius = 50;
    if (isalive(self.leader) && isdefined(self.leader.current_pathto_pos)) {
        query_position = self.leader.current_pathto_pos;
        queryresult = positionquery_source_navigation(query_position, 0, 140, 100, 35, self, 25);
    } else if (isalive(self.owner) && self.enable_guard === 1) {
        ownerorigin = self getclosestpointonnavvolume(self.owner.origin + (0, 0, 40), 50);
        if (isdefined(ownerorigin)) {
            queryresult = positionquery_source_navigation(ownerorigin, 0, 500 * min(querymultiplier, 1.5), 130, 3 * self.radius, self);
            if (isdefined(queryresult) && isdefined(queryresult.data)) {
                positionquery_filter_sight(queryresult, self.owner geteye(), (0, 0, 0), self, 5, self, "visowner");
                positionquery_filter_sight(queryresult, self.enemy geteye(), (0, 0, 0), self, 5, self, "visenemy");
                foreach (point in queryresult.data) {
                    if (point.visowner === 1) {
                        /#
                            if (!isdefined(point._scoredebug)) {
                                point._scoredebug = [];
                            }
                            if (!isdefined(point._scoredebug[#"visowner"])) {
                                point._scoredebug[#"visowner"] = spawnstruct();
                            }
                            point._scoredebug[#"visowner"].score = 300;
                            point._scoredebug[#"visowner"].scorename = "<unknown string>";
                        #/
                        point.score += 300;
                    }
                    if (point.visenemy === 1) {
                        /#
                            if (!isdefined(point._scoredebug)) {
                                point._scoredebug = [];
                            }
                            if (!isdefined(point._scoredebug[#"visenemy"])) {
                                point._scoredebug[#"visenemy"] = spawnstruct();
                            }
                            point._scoredebug[#"visenemy"].score = 300;
                            point._scoredebug[#"visenemy"].scorename = "<unknown string>";
                        #/
                        point.score += 300;
                    }
                }
            }
        }
    } else {
        queryresult = positionquery_source_navigation(self.origin, 0, 500 * min(querymultiplier, 2), 130, 3 * self.radius * querymultiplier, self, 2.2 * self.radius * querymultiplier);
        team_mates = getaiteamarray(self.team);
        avoid_radius = 140;
        foreach (guy in team_mates) {
            if (isdefined(guy.archetype) && guy.archetype == "wasp") {
                if (isdefined(guy.followers) && guy.followers.size > 0 && guy != self) {
                    if (isdefined(guy.current_pathto_pos)) {
                        avoid_locations[avoid_locations.size] = guy.current_pathto_pos;
                    }
                }
            }
        }
    }
    if (!isdefined(queryresult) || !isdefined(queryresult.data) || queryresult.data.size == 0) {
        return undefined;
    }
    positionquery_filter_distancetogoal(queryresult, self);
    positionquery_filter_inclaimedlocation(queryresult, self);
    self vehicle_ai::positionquery_filter_outofgoalanchor(queryresult);
    self vehicle_ai::positionquery_filter_engagementdist(queryresult, self.enemy, self.settings.engagementdistmin, self.settings.engagementdistmax);
    self vehicle_ai::positionquery_filter_engagementheight(queryresult, self.enemy, self.settings.engagementheightmin, self.settings.engagementheightmax);
    best_point = undefined;
    best_score = -999999;
    foreach (point in queryresult.data) {
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
        /#
            if (!isdefined(point._scoredebug)) {
                point._scoredebug = [];
            }
            if (!isdefined(point._scoredebug[#"height"])) {
                point._scoredebug[#"height"] = spawnstruct();
            }
            point._scoredebug[#"height"].score = point.distengagementheight * -1 * 1.4;
            point._scoredebug[#"height"].scorename = "<unknown string>";
        #/
        point.score += point.distengagementheight * -1 * 1.4;
        if (point.disttoorigin2d < 120) {
            /#
                if (!isdefined(point._scoredebug)) {
                    point._scoredebug = [];
                }
                if (!isdefined(point._scoredebug[#"tooclosetoself"])) {
                    point._scoredebug[#"tooclosetoself"] = spawnstruct();
                }
                point._scoredebug[#"tooclosetoself"].score = (120 - point.disttoorigin2d) * -1.5;
                point._scoredebug[#"tooclosetoself"].scorename = "<unknown string>";
            #/
            point.score += (120 - point.disttoorigin2d) * -1.5;
        }
        foreach (location in avoid_locations) {
            if (distancesquared(point.origin, location) < sqr(avoid_radius)) {
                /#
                    if (!isdefined(point._scoredebug)) {
                        point._scoredebug = [];
                    }
                    if (!isdefined(point._scoredebug[#"tooclosetoothers"])) {
                        point._scoredebug[#"tooclosetoothers"] = spawnstruct();
                    }
                    point._scoredebug[#"tooclosetoothers"].score = avoid_radius * -1;
                    point._scoredebug[#"tooclosetoothers"].scorename = "<unknown string>";
                #/
                point.score += avoid_radius * -1;
            }
        }
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
        if (point.score > best_score) {
            best_score = point.score;
            best_point = point;
        }
    }
    self vehicle_ai::positionquery_debugscores(queryresult);
    if (!isdefined(best_point)) {
        return undefined;
    }
    /#
        if (is_true(getdvarint(#"hkai_debugpositionquery", 0))) {
            recordline(self.origin, best_point.origin, (0.3, 1, 0));
            recordline(self.origin, self.enemy.origin, (1, 0, 0.4));
        }
    #/
    return best_point.origin;
}

// Namespace wasp/wasp
// Params 15, eflags: 0x2 linked
// Checksum 0x464c3bdb, Offset: 0x5610
// Size: 0xb2
function drone_callback_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    idamage = vehicle_ai::shared_callback_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
    return idamage;
}

// Namespace wasp/wasp
// Params 4, eflags: 0x2 linked
// Checksum 0xbe318f60, Offset: 0x56d0
// Size: 0x86
function drone_allowfriendlyfiredamage(*einflictor, eattacker, smeansofdeath, *weapon) {
    if (isdefined(smeansofdeath) && isdefined(smeansofdeath.archetype) && isdefined(weapon) && smeansofdeath.archetype == #"wasp" && weapon == "MOD_EXPLOSIVE") {
        return true;
    }
    return false;
}

// Namespace wasp/wasp
// Params 1, eflags: 0x2 linked
// Checksum 0x1a6f6c12, Offset: 0x5760
// Size: 0xb4
function wasp_driving(*params) {
    self endon(#"change_state");
    driver = self getseatoccupant(0);
    if (isplayer(driver)) {
        clientfield::set("rocket_wasp_hijacked", 1);
    }
    if (isplayer(driver) && isdefined(self.playerdrivenversion)) {
        self thread wasp_manage_camera_swaps();
    }
}

// Namespace wasp/wasp
// Params 0, eflags: 0x2 linked
// Checksum 0x21b1e41f, Offset: 0x5820
// Size: 0x82
function wasp_manage_camera_swaps() {
    self endon(#"death", #"change_state");
    driver = self getseatoccupant(0);
    driver endon(#"disconnect");
    cam_low_type = self.vehicletype;
    cam_high_type = self.playerdrivenversion;
}

// Namespace wasp/wasp
// Params 0, eflags: 0x2 linked
// Checksum 0x971fd080, Offset: 0x58b0
// Size: 0x148
function wasp_towers_on_load() {
    if (!isdefined(level.flag) || !is_true(level.flag[#"load_main_complete"])) {
        level waittill(#"load_main_complete");
    }
    a_wasp_towers = getentarray("all_wasp_towers", "script_noteworthy");
    foreach (wasp_tower in a_wasp_towers) {
        if (is_true(wasp_tower.script_init_wasp_tower_on_load) && !is_true(wasp_tower.b_wasp_tower_init)) {
            _wasp_tower_init(wasp_tower);
        }
    }
}

// Namespace wasp/wasp
// Params 2, eflags: 0x0
// Checksum 0x601b97c3, Offset: 0x5a00
// Size: 0x108
function wasp_tower_init(str_tower_targetnames, n_spawn_count) {
    a_sp_wasp_towers = getentarray(str_tower_targetnames, "targetname");
    foreach (wasp_tower in a_sp_wasp_towers) {
        if (!is_true(wasp_tower.script_init_wasp_tower_on_load) && !is_true(wasp_tower.b_wasp_tower_init)) {
            _wasp_tower_init(wasp_tower, n_spawn_count);
        }
    }
}

// Namespace wasp/wasp
// Params 2, eflags: 0x6 linked
// Checksum 0x61e2f680, Offset: 0x5b10
// Size: 0x14e
function private _wasp_tower_init(wasp_tower, n_spawn_count) {
    if (!isspawner(wasp_tower) || wasp_tower.script_noteworthy !== "all_wasp_towers") {
        return;
    }
    if (isdefined(n_spawn_count)) {
        wasp_tower.script_wasp_tower_spawn_count = n_spawn_count;
    }
    wasp_tower.a_fxanims = struct::get_array(wasp_tower.target, "targetname");
    foreach (s_fxanim in wasp_tower.a_fxanims) {
        scene::add_scene_func(s_fxanim.scriptbundlename, &function_bbe2568c, "done");
        s_fxanim scene::init();
    }
    wasp_tower.b_wasp_tower_init = 1;
}

// Namespace wasp/wasp
// Params 2, eflags: 0x6 linked
// Checksum 0x85f6ecd3, Offset: 0x5c68
// Size: 0x14e
function private wasp_tower_spawn(sp_wasp, *n_spawn_count) {
    a_wasps = [];
    for (i = 0; i < n_spawn_count.script_wasp_tower_spawn_count; i++) {
        vh_wasp = n_spawn_count spawner::spawn(1);
        vh_wasp val::set(#"wasp_tower", "ignoreme", 1);
        vh_wasp val::set(#"wasp_tower", "ignoreall", 1);
        vh_wasp vehicle_ai::start_scripted();
        vh_wasp dontinterpolate();
        if (!isdefined(a_wasps)) {
            a_wasps = [];
        } else if (!isarray(a_wasps)) {
            a_wasps = array(a_wasps);
        }
        a_wasps[a_wasps.size] = vh_wasp;
    }
    return a_wasps;
}

// Namespace wasp/wasp
// Params 2, eflags: 0x0
// Checksum 0xb90d6980, Offset: 0x5dc0
// Size: 0xf8
function wasp_tower_launch(str_tower_targetnames, n_spawn_count) {
    a_sp_wasp_towers = getentarray(str_tower_targetnames, "targetname");
    foreach (wasp_tower in a_sp_wasp_towers) {
        if (!is_true(wasp_tower.b_wasp_tower_init)) {
            _wasp_tower_init(wasp_tower, n_spawn_count);
        }
        _wasp_tower_launch(wasp_tower);
    }
}

// Namespace wasp/wasp
// Params 1, eflags: 0x6 linked
// Checksum 0x55de2399, Offset: 0x5ec0
// Size: 0x1b8
function private _wasp_tower_launch(wasp_tower) {
    wasp_tower playsound(#"veh_wasp_tower_flaps");
    foreach (s_fxanim in wasp_tower.a_fxanims) {
        if (isdefined(wasp_tower.script_wasp_tower_launch_delay_min) && isdefined(wasp_tower.script_wasp_tower_launch_delay_max) && wasp_tower.script_wasp_tower_launch_delay_max > wasp_tower.script_wasp_tower_launch_delay_min) {
            n_delay = randomfloatrange(wasp_tower.script_wasp_tower_launch_delay_min, wasp_tower.script_wasp_tower_launch_delay_max);
        } else if (isdefined(wasp_tower.script_wasp_tower_launch_delay_min)) {
            n_delay = wasp_tower.script_wasp_tower_launch_delay_min;
        } else {
            n_delay = randomfloatrange(0, 1);
        }
        wait(n_delay);
        a_wasps = wasp_tower_spawn(wasp_tower, wasp_tower.var_ea0f728d);
        if (a_wasps.size) {
            array::thread_all(a_wasps, &wasp_tower_wakeup);
            s_fxanim thread scene::play(a_wasps);
        }
    }
}

// Namespace wasp/wasp
// Params 1, eflags: 0x2 linked
// Checksum 0xfa016cec, Offset: 0x6080
// Size: 0xce
function function_bbe2568c(a_ents) {
    foreach (ent in a_ents) {
        if (ent.archetype === "wasp") {
            v_pos = ent getclosestpointonnavvolume(ent.origin, 128);
            if (isdefined(v_pos)) {
                ent.origin = v_pos;
            }
        }
    }
}

// Namespace wasp/wasp
// Params 0, eflags: 0x6 linked
// Checksum 0xdbc765ac, Offset: 0x6158
// Size: 0x9c
function private wasp_tower_wakeup() {
    self endon(#"death");
    self notify(#"wasp_launched_from_tower");
    self vehicle_ai::stop_scripted();
    wait(3);
    self val::reset(#"wasp_tower", "ignoreme");
    self val::reset(#"wasp_tower", "ignoreall");
}

// Namespace wasp/wasp
// Params 0, eflags: 0x0
// Checksum 0xf25851f0, Offset: 0x6200
// Size: 0x58
function wasp_tower_launch_single() {
    if (!is_true(self.b_wasp_tower_init)) {
        _wasp_tower_init(self, 1);
    }
    _wasp_tower_launch(self);
    return self.a_wasps[0];
}

// Namespace wasp/wasp
// Params 2, eflags: 0x0
// Checksum 0x25322e2c, Offset: 0x6260
// Size: 0x298
function wasp_tower_destroy(str_targetname, str_fxanim_destruction) {
    a_sp_wasp_towers = getentarray(str_targetname, "targetname");
    foreach (sp_wasp_tower in a_sp_wasp_towers) {
        if (is_true(sp_wasp_tower.b_wasp_tower_init) && !is_true(sp_wasp_tower.b_is_destroyed)) {
            a_mdl_tower_parts = getentarray(sp_wasp_tower.target, "targetname");
            array::delete_all(a_mdl_tower_parts);
            foreach (fxanim in sp_wasp_tower.a_fxanims) {
                if (isdefined(fxanim.scene_ents)) {
                    foreach (ent in fxanim.scene_ents) {
                        if (isentity(ent) && !isai(ent)) {
                            ent delete();
                        }
                    }
                }
            }
            sp_wasp_tower.b_is_destroyed = 1;
            if (isdefined(str_fxanim_destruction)) {
                level scene::play(str_fxanim_destruction);
            }
        }
    }
}

