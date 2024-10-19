// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\audio_shared.csc;

#namespace driving_fx;

// Namespace driving_fx/enter_vehicle
// Params 1, eflags: 0x20
// Checksum 0x6e64fc67, Offset: 0x178
// Size: 0x6c
function event_handler[enter_vehicle] codecallback_vehicleenter(eventstruct) {
    if (!isplayer(self)) {
        return;
    }
    vehicle = eventstruct.vehicle;
    localclientnum = eventstruct.localclientnum;
    self thread vehicle_enter(localclientnum, vehicle);
}

// Namespace driving_fx/driving_fx
// Params 2, eflags: 0x2 linked
// Checksum 0xae101d49, Offset: 0x1f0
// Size: 0x13c
function vehicle_enter(localclientnum, vehicle) {
    self endon(#"death");
    vehicle endon(#"death");
    waitframe(1);
    if (vehicle isvehicle() && vehicle isdrivingvehicle(self)) {
        vehicle thread collision_thread(localclientnum);
        vehicle thread vehicle::boost_think(localclientnum);
        if (vehicle function_b835102b()) {
            vehicle thread jump_landing_thread(localclientnum);
            vehicle thread suspension_thread(localclientnum);
        }
        if (self function_21c0fa55()) {
            vehicle thread function_d79b3148(localclientnum, self);
            vehicle thread vehicle::lights_group_toggle(localclientnum, 1, 0);
        }
    }
}

// Namespace driving_fx/driving_fx
// Params 1, eflags: 0x2 linked
// Checksum 0x514f1aef, Offset: 0x338
// Size: 0x3f8
function collision_thread(localclientnum) {
    self endon(#"death");
    self endon(#"exit_vehicle");
    while (true) {
        waitresult = self waittill(#"veh_collision");
        hip = waitresult.velocity;
        hitn = waitresult.normal;
        hit_intensity = waitresult.intensity;
        player = function_5c10bd79(localclientnum);
        if (isdefined(self.driving_fx_collision_override)) {
            if (player function_21c0fa55() && self isdrivingvehicle(player)) {
                self [[ self.driving_fx_collision_override ]](localclientnum, player, hip, hitn, hit_intensity);
            }
            continue;
        }
        if (isdefined(player) && isdefined(hit_intensity)) {
            if (hit_intensity > self.heavycollisionspeed) {
                volume = get_impact_vol_from_speed();
                var_be2370d6 = self.var_be2370d6;
                if (isdefined(var_be2370d6)) {
                    alias = var_be2370d6;
                } else {
                    alias = "veh_default_suspension_lg_hd";
                }
                self playsound(localclientnum, alias, undefined, volume);
                /#
                    if (getdvarint(#"hash_1ea6228199536d7e", 0) == 1) {
                        debug2dtext((0, 100, 0), function_9e72a96(alias) + "<unknown string>" + volume + "<unknown string>", undefined, undefined, (0, 0, 0), 1, 3, 16);
                    }
                #/
                if (isdefined(self.heavycollisionrumble) && player function_21c0fa55() && self isdrivingvehicle(player)) {
                    player playrumbleonentity(localclientnum, self.heavycollisionrumble);
                }
                continue;
            }
            if (hit_intensity > self.lightcollisionspeed) {
                volume = get_impact_vol_from_speed();
                var_b3195e3c = self.var_b3195e3c;
                if (isdefined(var_b3195e3c)) {
                    alias = var_b3195e3c;
                } else {
                    alias = "veh_default_suspension_lg_lt";
                }
                self playsound(localclientnum, alias, undefined, volume);
                /#
                    if (getdvarint(#"hash_1ea6228199536d7e", 0) == 1) {
                        debug2dtext((0, 200, 0), function_9e72a96(alias) + "<unknown string>" + volume + "<unknown string>", undefined, undefined, (0, 0, 0), 1, 3, 16);
                    }
                #/
                if (isdefined(self.lightcollisionrumble) && player function_21c0fa55() && self isdrivingvehicle(player)) {
                    player playrumbleonentity(localclientnum, self.lightcollisionrumble);
                }
            }
        }
    }
}

// Namespace driving_fx/driving_fx
// Params 1, eflags: 0x2 linked
// Checksum 0xffddbbbc, Offset: 0x738
// Size: 0x1f0
function jump_landing_thread(localclientnum) {
    self endon(#"death");
    self endon(#"exit_vehicle");
    while (true) {
        self waittill(#"veh_landed");
        player = function_5c10bd79(localclientnum);
        if (isdefined(player)) {
            if (isdefined(self.driving_fx_jump_landing_override)) {
                self [[ self.driving_fx_jump_landing_override ]](localclientnum, player);
                continue;
            }
            volume = get_impact_vol_from_speed();
            var_be2370d6 = self.var_be2370d6;
            if (isdefined(var_be2370d6)) {
                alias = var_be2370d6;
            } else {
                alias = "veh_default_suspension_lg_hd";
            }
            self playsound(localclientnum, alias, undefined, volume);
            /#
                if (getdvarint(#"hash_1ea6228199536d7e", 0) == 1) {
                    debug2dtext((0, 0, 0), function_9e72a96(alias) + "<unknown string>" + volume + "<unknown string>", undefined, undefined, (0, 0, 0), 1, 3, 16);
                }
            #/
            if (isdefined(self.jumplandingrumble) && player function_21c0fa55() && self isdrivingvehicle(player)) {
                player playrumbleonentity(localclientnum, self.jumplandingrumble);
            }
        }
    }
}

// Namespace driving_fx/driving_fx
// Params 1, eflags: 0x2 linked
// Checksum 0x7a694cbe, Offset: 0x930
// Size: 0x1c8
function suspension_thread(localclientnum) {
    self endon(#"death");
    self endon(#"exit_vehicle");
    while (true) {
        self waittill(#"veh_suspension_limit_activated");
        player = function_5c10bd79(localclientnum);
        if (isdefined(player)) {
            volume = get_impact_vol_from_speed();
            var_be2370d6 = self.var_be2370d6;
            if (isdefined(var_be2370d6)) {
                alias = var_be2370d6;
            } else {
                alias = "veh_default_suspension_lg_hd";
            }
            self playsound(localclientnum, alias, undefined, volume);
            /#
                if (getdvarint(#"hash_1ea6228199536d7e", 0) == 1) {
                    debug2dtext((0, 300, 0), function_9e72a96(alias) + "<unknown string>" + volume + "<unknown string>", undefined, undefined, (0, 0, 0), 1, 3, 16);
                }
            #/
            if (player function_21c0fa55() && self isdrivingvehicle(player)) {
                player playrumbleonentity(localclientnum, "damage_light");
            }
        }
    }
}

// Namespace driving_fx/driving_fx
// Params 0, eflags: 0x2 linked
// Checksum 0x84885732, Offset: 0xb00
// Size: 0x82
function get_impact_vol_from_speed() {
    curspeed = self getspeed();
    maxspeed = self getmaxspeed();
    volume = audio::scale_speed(0, maxspeed, 0, 1, curspeed);
    volume = volume * volume * volume;
    return volume;
}

// Namespace driving_fx/driving_fx
// Params 0, eflags: 0x2 linked
// Checksum 0x57b340bf, Offset: 0xb90
// Size: 0x240
function function_b6f1b2f1() {
    var_9687e67e = array("front_right", "front_left", "middle_right", "middle_left", "back_right", "back_left");
    surfaces = [];
    foreach (var_2ada890e in var_9687e67e) {
        if (self function_387f3e55(var_2ada890e)) {
            if (!isdefined(surfaces)) {
                surfaces = [];
            } else if (!isarray(surfaces)) {
                surfaces = array(surfaces);
            }
            if (!isinarray(surfaces, function_73e08cca("water"))) {
                surfaces[surfaces.size] = function_73e08cca("water");
            }
        }
        if (!isdefined(surfaces)) {
            surfaces = [];
        } else if (!isarray(surfaces)) {
            surfaces = array(surfaces);
        }
        if (!isinarray(surfaces, function_73e08cca(self getwheelsurface(var_2ada890e)))) {
            surfaces[surfaces.size] = function_73e08cca(self getwheelsurface(var_2ada890e));
        }
    }
    arrayremovevalue(surfaces, undefined);
    return surfaces;
}

// Namespace driving_fx/driving_fx
// Params 1, eflags: 0x2 linked
// Checksum 0xf181210d, Offset: 0xdd8
// Size: 0x6c
function function_73e08cca(surface) {
    switch (surface) {
    case #"dirt":
        return #"hash_69a53e8913317ecf";
    case #"water":
    case #"watershallow":
        return #"hash_7c5d3ac35353f95c";
    }
    return undefined;
}

// Namespace driving_fx/driving_fx
// Params 1, eflags: 0x2 linked
// Checksum 0x387a86aa, Offset: 0xe50
// Size: 0xce
function stop_postfx_on_exit(var_89ae88b4) {
    self notify("stop_postfx_on_exit_" + var_89ae88b4);
    self endon("stop_postfx_on_exit_" + var_89ae88b4);
    self waittill(#"exit_vehicle", #"death");
    if (isdefined(self) && isdefined(self.var_8e45c356) && isdefined(self.var_8e45c356[var_89ae88b4]) && self postfx::function_556665f2(var_89ae88b4)) {
        self postfx::stoppostfxbundle(var_89ae88b4);
        self.var_8e45c356[var_89ae88b4].exiting = 1;
    }
}

// Namespace driving_fx/driving_fx
// Params 1, eflags: 0x2 linked
// Checksum 0xb695c515, Offset: 0xf28
// Size: 0x10e
function function_ace6c248(var_89ae88b4) {
    if (!isdefined(self.var_8e45c356)) {
        self.var_8e45c356 = [];
    }
    if (!isdefined(self.var_8e45c356[var_89ae88b4])) {
        self.var_8e45c356[var_89ae88b4] = {#exiting:1, #endtime:0};
    }
    if (self.var_8e45c356[var_89ae88b4].exiting && !self postfx::function_556665f2(var_89ae88b4)) {
        self postfx::playpostfxbundle(var_89ae88b4);
        self thread stop_postfx_on_exit(var_89ae88b4);
        self.var_8e45c356[var_89ae88b4].exiting = 0;
    }
    self.var_8e45c356[var_89ae88b4].endtime = gettime() + 1000;
}

// Namespace driving_fx/driving_fx
// Params 2, eflags: 0x2 linked
// Checksum 0x103f831f, Offset: 0x1040
// Size: 0x112
function function_dc263531(var_fd4bffcb, forcestop) {
    if (!isdefined(self.var_8e45c356)) {
        self.var_8e45c356 = [];
    }
    foreach (key, postfx in self.var_8e45c356) {
        if (postfx.exiting) {
            continue;
        }
        if (forcestop || postfx.endtime <= gettime() && !isinarray(var_fd4bffcb, key)) {
            self postfx::exitpostfxbundle(key);
            self.var_8e45c356[key].exiting = 1;
        }
    }
}

// Namespace driving_fx/driving_fx
// Params 2, eflags: 0x2 linked
// Checksum 0xf780b78e, Offset: 0x1160
// Size: 0x268
function function_d79b3148(localclientnum, driver) {
    self notify("72f19083713b1cac");
    self endon("72f19083713b1cac");
    self endon(#"death", #"exit_vehicle");
    if (!self isvehicle() || is_true(self.var_da04aa74)) {
        return;
    }
    while (true) {
        wait(0.1);
        speed = self getspeed();
        player = function_5c10bd79(localclientnum);
        if (isdefined(self.var_c6a9216)) {
            var_89ae88b4 = self [[ self.var_c6a9216 ]](localclientnum, driver);
        } else {
            var_89ae88b4 = self function_b6f1b2f1();
        }
        var_9dc6e5f2 = 1;
        if (isdefined(self.var_917cf8e3)) {
            var_9dc6e5f2 = self [[ self.var_917cf8e3 ]](localclientnum, driver);
        }
        if (isdefined(self.var_41860110)) {
            var_9979f775 = self [[ self.var_41860110 ]](localclientnum, driver);
        } else {
            var_9979f775 = speed > 200;
        }
        if (isdefined(player)) {
            if (var_9979f775 && var_9dc6e5f2) {
                foreach (postfx_bundle in var_89ae88b4) {
                    player function_ace6c248(postfx_bundle);
                }
            }
            player function_dc263531(var_89ae88b4, !var_9979f775 || !var_9dc6e5f2);
        }
    }
}

