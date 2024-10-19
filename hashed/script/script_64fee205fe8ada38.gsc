// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\debug_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\hud_shared.gsc;
#using script_789f2367a00401d8;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_cc727a3b;

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 0, eflags: 0x5
// Checksum 0xc1f71c77, Offset: 0x258
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"hash_507ba1ac0432a7e6", &preinit, undefined, undefined, undefined);
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 0, eflags: 0x6 linked
// Checksum 0xe488cda4, Offset: 0x2a0
// Size: 0x164
function private preinit() {
    clientfield::register("scriptmover", "" + #"dog_launcher_explode_fx", 16000, 1, "int");
    clientfield::register("scriptmover", "hs_swarm_state", 1, 1, "counter");
    clientfield::register("allplayers", "hs_swarm_damage", 1, 1, "counter");
    clientfield::register("allplayers", "" + #"hash_2201faa112c8313", 16000, 1, "counter");
    clientfield::register("scriptmover", "" + #"hash_2201faa112c8313", 16000, 1, "counter");
    clientfield::register("scriptmover", "" + #"dog_projectile_fx", 16000, 1, "int");
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 2, eflags: 0x2 linked
// Checksum 0x1098b824, Offset: 0x410
// Size: 0x8f8
function function_4b462025(enemy, b_ignore_cleanup) {
    self endon(#"death");
    if (!isdefined(enemy)) {
        return false;
    }
    enemy clientfield::increment("" + #"hash_2201faa112c8313", 1);
    var_d54a1968 = getweapon(#"hash_7b102ea666456cda");
    var_dd6bc3a6 = var_d54a1968.projectilespeed;
    target_pos = enemy.origin;
    if (isplayer(enemy)) {
        var_11b59192 = abs(math::random_normal_distribution(0, getdvarfloat(#"hash_24c8c69455c84258", 750) * 0.25, undefined, getdvarfloat(#"hash_24c8c69455c84258", 750)));
        var_389d01c3 = vectornormalize(target_pos - self gettagorigin("j_pocket5_le"));
        target_pos -= var_389d01c3 * (getdvarfloat(#"hash_24c8c69455c84258", 750) - var_11b59192);
        var_18ee0f33 = (randomfloat(1) - 0.5) * 100;
        target_pos += rotatepoint(var_389d01c3, (0, 90, 0)) * var_18ee0f33;
    }
    angles = vectortoangles(target_pos - self gettagorigin("j_pocket5_le"));
    dir = anglestoforward(angles);
    launch_offset = dir * 10;
    var_8598bad6 = self gettagorigin("j_pocket5_le") + launch_offset;
    dist = distance(var_8598bad6, target_pos);
    velocity = dir * var_dd6bc3a6;
    to_target = target_pos - var_8598bad6;
    time = length((to_target[0], to_target[1], to_target[2])) / var_dd6bc3a6;
    if (time <= 0) {
        time = 1;
    }
    var_813d38fa = (to_target[2] + 0.5 * getdvarint(#"bg_gravity", 800) * sqr(time)) / time;
    var_578ee39a = var_813d38fa * var_813d38fa / 2 * getdvarint(#"bg_gravity", 800);
    if (var_578ee39a > 100) {
        var_b0eeef83 = sqrt(2 * getdvarint(#"bg_gravity", 800) * 100);
        a = -0.5 * getdvarint(#"bg_gravity", 800);
        b = var_b0eeef83;
        c = abs(to_target[2]);
        var_b2ca2007 = (b * -1 - sqrt(sqr(b) - 4 * a * c)) / 2 * a;
        var_ea3a82ca = length((to_target[0], to_target[1], to_target[2])) / var_b2ca2007;
        velocity = dir * var_ea3a82ca;
        var_813d38fa = var_b0eeef83;
        time = var_b2ca2007;
    }
    velocity = (velocity[0], velocity[1], var_813d38fa);
    /#
        if (getdvarint(#"hash_23c79bd6109328a", 0)) {
            sphere(target_pos, 16, (1, 1, 0), 1, 1, 8, 300);
            thread debug::drawdebugline(var_8598bad6, target_pos, (1, 1, 0), 300);
            println("<unknown string>" + enemy.origin + "<unknown string>" + target_pos);
            i = 0;
            last_pos = var_8598bad6;
            while (i <= time) {
                height = var_8598bad6[2] + var_813d38fa * i - 0.5 * getdvarint(#"bg_gravity", 800) * sqr(i);
                debug_pos = (var_8598bad6[0] + velocity[0] * i, var_8598bad6[1] + velocity[1] * i, height);
                sphere(debug_pos, 8, (0, 1, 0), 1, 1, 8, 300);
                thread debug::drawdebugline(last_pos, debug_pos, (0, 1, 0), 300);
                last_pos = debug_pos;
                if (i == time) {
                    break;
                }
                i = math::clamp(i + 0.1, 0, time);
            }
        }
    #/
    grenade = self magicgrenadetype(var_d54a1968, var_8598bad6, velocity);
    playsoundatposition(#"hash_4897d1a140f146f5", var_8598bad6);
    var_9f0ffc57 = (0, 0, 30);
    var_b1d0a64 = util::spawn_model(#"hash_143e0a5b60055506", var_8598bad6 + var_9f0ffc57, grenade.angles);
    var_b1d0a64 clientfield::set("" + #"dog_projectile_fx", 1);
    var_b1d0a64 linkto(grenade, "tag_origin", var_9f0ffc57);
    var_b1d0a64 useanimtree("generic");
    var_b1d0a64 thread animation::play(#"hash_164d6b226523d90a", var_b1d0a64, (30, var_b1d0a64.angles[1], var_b1d0a64.angles[2]));
    if (isdefined(grenade)) {
        grenade thread function_b38c1846(var_b1d0a64, enemy, b_ignore_cleanup, self);
    }
    return true;
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 4, eflags: 0x6 linked
// Checksum 0x3b45eb75, Offset: 0xd10
// Size: 0x654
function private function_b38c1846(e_projectile, target, b_ignore_cleanup, orda) {
    level endon(#"end_game");
    self endon(#"entitydeleted");
    waitframe(1);
    e_projectile thread function_cf57c2cb(self);
    s_waitresult = self waittill(#"death", #"projectile_impact_explode", #"explode", #"hash_38b24dfa52842786");
    /#
        if (getdvarint(#"hash_23c79bd6109328a", 0)) {
            sphere(self.origin, 8, (1, 0, 0), 1, 1, 8, 300);
        }
    #/
    if (s_waitresult._notify == "death") {
        self deletedelay();
        s_waitresult = self waittilltimeout(float(function_60d95f53()) / 1000, #"projectile_impact_explode", #"explode", #"hash_38b24dfa52842786");
        if (s_waitresult._notify == "timeout") {
            return;
        }
    }
    if (s_waitresult._notify == "projectile_impact_explode") {
        e_projectile deletedelay();
        a_players = function_a1ef346b();
        var_2cadffe7 = util::spawn_model("tag_origin", self.origin);
        var_2cadffe7 clientfield::set("" + #"dog_launcher_explode_fx", 1);
        if (isdefined(target.targetname) && target.targetname == #"mdl_support_machine") {
            if (level.var_f0fc72bc > 0 && distancesquared(target.origin, var_2cadffe7.origin) < 40000) {
                target notify(#"damage", {#amount:250});
            }
        }
        var_3e7a440 = getscriptbundle("molotov_custom_settings");
        blast_radius = 65;
        level thread namespace_68a80213::function_59d981cc(var_2cadffe7.origin + (0, 0, 18), blast_radius, a_players[0], var_2cadffe7);
        namespace_68a80213::function_ccb2e201(var_2cadffe7.origin + (0, 0, 18), blast_radius);
        spawn_pos = getclosestpointonnavmesh(var_2cadffe7.origin, 32, 32);
        var_8f744cff = function_a1ef346b(undefined, var_2cadffe7.origin + (0, 0, 18), blast_radius);
        var_5eda8c18 = isdefined(var_8f744cff) && var_8f744cff.size > 0;
        var_55783e7b = 1;
        if (isdefined(orda)) {
            if (!isdefined(orda.var_1cf9bc4)) {
                orda.var_1cf9bc4 = [];
            }
            function_1eaaceab(orda.var_1cf9bc4);
            var_55783e7b = orda.var_1cf9bc4.size < 4;
        }
        var_a3f16cf9 = 0;
        if (randomfloat(1) < 0.2) {
            var_a3f16cf9 = 1;
        }
        if (isdefined(spawn_pos) && !var_5eda8c18 && var_55783e7b && !var_a3f16cf9) {
            if (getfreeactorcount() < 1) {
                a_zombie = getaiarchetypearray(#"zombie");
                if (isdefined(a_zombie)) {
                    a_zombie[0].allowdeath = 1;
                    a_zombie[0] kill();
                }
            }
            ai_dog = spawnactor(#"hash_7a8b592728eec95d", spawn_pos, var_2cadffe7.angles);
            if (isdefined(ai_dog)) {
                ai_dog.b_ignore_cleanup = b_ignore_cleanup;
                ai_dog.var_bee4eef1 = 1;
                if (isdefined(orda)) {
                    if (!isdefined(orda.var_1cf9bc4)) {
                        orda.var_1cf9bc4 = [];
                    } else if (!isarray(orda.var_1cf9bc4)) {
                        orda.var_1cf9bc4 = array(orda.var_1cf9bc4);
                    }
                    orda.var_1cf9bc4[orda.var_1cf9bc4.size] = ai_dog;
                }
            }
        }
        var_2cadffe7 thread function_4f093018();
    }
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 0, eflags: 0x6 linked
// Checksum 0xb2768be7, Offset: 0x1370
// Size: 0x44
function private function_4f093018() {
    self endon(#"entitydeleted");
    wait(5);
    if (isdefined(self)) {
        if (isdefined(self)) {
            self delete();
        }
    }
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 1, eflags: 0x6 linked
// Checksum 0x6c32526b, Offset: 0x13c0
// Size: 0x112
function private function_cf57c2cb(grenade) {
    self endon(#"entitydeleted", #"death");
    self setcandamage(1);
    self.health = 10;
    while (true) {
        waitresult = self waittill(#"damage");
        if (waitresult.amount > 0) {
            self.health -= waitresult.amount;
            if (self.health <= 0) {
                if (isdefined(grenade)) {
                    grenade deletedelay();
                    grenade notify(#"projectile_impact_explode");
                }
                self deletedelay();
                break;
            }
            waitframe(1);
        }
    }
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 1, eflags: 0x2 linked
// Checksum 0xe0b90ddd, Offset: 0x14e0
// Size: 0x400
function function_23e153fb(var_bb13ffb2) {
    a_players = function_a1ef346b();
    a_zombies = getaispeciesarray(level.zombie_team);
    if (is_true(var_bb13ffb2)) {
        foreach (player in a_players) {
            if (distancesquared(player.origin, self gettagorigin("j_ball_ri")) <= 72900) {
                function_6b6fce46(player);
                player dodamage(player.health + 999, self gettagorigin("j_ball_ri"));
            }
        }
        foreach (zombie in a_zombies) {
            if (distancesquared(zombie.origin, self gettagorigin("j_ball_ri")) <= 72900) {
                zombie.allowdeath = 1;
                zombie kill();
            }
        }
        return;
    }
    foreach (player in a_players) {
        if (distancesquared(player.origin, self gettagorigin("j_ball_le")) <= 72900) {
            function_6b6fce46(player);
            player dodamage(player.health + 999, self gettagorigin("j_ball_le"));
        }
    }
    foreach (zombie in a_zombies) {
        if (distancesquared(zombie.origin, self gettagorigin("j_ball_le")) <= 72900) {
            zombie.allowdeath = 1;
            zombie kill();
        }
    }
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 1, eflags: 0x6 linked
// Checksum 0x969f7c2d, Offset: 0x18e8
// Size: 0x5c
function private function_6b6fce46(target) {
    if (!target util::isusingremote()) {
        target thread hud::fade_to_black_for_x_sec(0, 2.5, 0.2, 0.2, "black");
    }
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 0, eflags: 0x2 linked
// Checksum 0x320f609a, Offset: 0x1950
// Size: 0xf4
function function_2d86c7c9() {
    self endon(#"death");
    n_players = getplayers().size;
    var_fc398f5e = n_players * 2;
    var_8214bfd5 = floor(var_fc398f5e / 4) + (3 - self.var_f01add23 > var_fc398f5e % 4 ? 0 : 1);
    self.var_f01add23 += 1;
    for (i = 0; i < var_8214bfd5; i++) {
        self function_9fc2b867();
        wait(0.25);
    }
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 0, eflags: 0x2 linked
// Checksum 0x42b2f678, Offset: 0x1a50
// Size: 0xe
function function_f2b0a2e1() {
    self.var_f01add23 = 0;
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 0, eflags: 0x6 linked
// Checksum 0xe4bdfd2d, Offset: 0x1a68
// Size: 0x16c
function private function_9fc2b867() {
    origin = vectorlerp(self gettagorigin("j_shoulder_le"), self gettagorigin("j_shoulder_ri"), 0.5);
    swarm = util::spawn_model(#"hash_7a7aadfb584e0859", origin);
    swarm playloopsound(#"hash_4c9124e9213250df");
    swarm.var_66a3d186 = self;
    if (!isdefined(self.var_36225742)) {
        self.var_36225742 = [];
    }
    if (!isdefined(self.var_36225742)) {
        self.var_36225742 = [];
    } else if (!isarray(self.var_36225742)) {
        self.var_36225742 = array(self.var_36225742);
    }
    self.var_36225742[self.var_36225742.size] = swarm;
    swarm thread function_187bcbe();
    swarm thread function_e57b9f29();
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 0, eflags: 0x6 linked
// Checksum 0x7d04492, Offset: 0x1be0
// Size: 0x94a
function private function_187bcbe() {
    self endon(#"death");
    self.var_88b20e7f = 60;
    self.target_ent = undefined;
    self.var_a7882c19 = 0;
    if (isdefined(self.var_66a3d186)) {
        var_b048de07 = vectorlerp(self.var_66a3d186 gettagorigin("j_head_mouth1"), self.var_66a3d186 gettagorigin("j_head_mouth5"), 0.5);
        var_5846115f = vectornormalize(var_b048de07 - self.origin);
        self moveto(self.origin + var_5846115f * 200, 0.25);
        wait(0.25);
        self moveto(self.origin + var_5846115f * 100, 0.25, 0, 0.1875);
        wait(0.25);
    }
    while (true) {
        clockwise = 1;
        var_2f769fb1 = (0, 0, 0);
        var_2d0b175 = 0;
        var_f6107d1 = self.origin;
        self.var_88b20e7f = min(self.var_88b20e7f, 60);
        while (true) {
            if (isdefined(self.var_66a3d186)) {
                var_2f769fb1 = self.var_66a3d186 gettagorigin("j_head");
            }
            var_f6107d1 = (self.origin[0], self.origin[1], var_2f769fb1[2] + sin(var_2d0b175) * 100);
            var_2d0b175 += 0.02;
            var_8a380e81 = vectornormalize(var_2f769fb1 - var_f6107d1);
            circle_pos = -1 * var_8a380e81 * 200 + var_2f769fb1;
            /#
                if (getdvarint(#"hash_7b1300b093008e51", 0) > 0) {
                    debugstar(circle_pos, 20, (0, 1, 0));
                }
            #/
            z_axis = (0, 0, clockwise);
            var_dc77dd5c = vectorcross(var_8a380e81, z_axis);
            target_pos = circle_pos + var_dc77dd5c * self.var_88b20e7f;
            self function_c9bcf1cb(target_pos);
            if (gettime() > self.var_a7882c19) {
                if (isdefined(self.var_66a3d186)) {
                    self.var_66a3d186 function_953cead6();
                    self.target_ent = self.var_66a3d186 function_ae1ac363();
                } else {
                    self.target_ent = self function_ae1ac363();
                }
                if (isdefined(self.target_ent)) {
                    break;
                }
            }
        }
        to_target = undefined;
        var_1f2ee4ae = distance2d(self.origin, self.target_ent.origin);
        var_584124bc = self.origin;
        var_c0500b76 = (randomint(2) - 0.5) * 2;
        while (true) {
            if (isdefined(self.target_ent)) {
                var_2f769fb1 = self.target_ent.origin + (0, 0, 70);
                to_target = vectornormalize(var_2f769fb1 - self.origin);
                target_pos = to_target * self.var_88b20e7f + self.origin;
                self.var_88b20e7f = min(self.var_88b20e7f + 0.1, 100);
                target_pos += function_d321dcc8(1, to_target);
                target_pos += function_d321dcc8(-1, to_target);
                target_pos += function_4e15ba87(var_2f769fb1);
                target_pos += function_3a260c9e(var_c0500b76, to_target, var_584124bc, var_1f2ee4ae);
                if (self function_c9bcf1cb(var_2f769fb1, 60, target_pos)) {
                    break;
                }
                if (!zombie_utility::is_player_valid(self.target_ent, 1, 1)) {
                    self.target_ent = undefined;
                    break;
                }
            }
        }
        if (isdefined(self.target_ent) && isplayer(self.target_ent)) {
            params = getstatuseffect("dot_molotov_hulk_fireball");
            self.target_ent status_effect::status_effect_apply(params, undefined, self, 0, undefined, undefined, self.origin);
            self.target_ent clientfield::increment("hs_swarm_damage", 1);
            var_354c977e = self.health / self.maxhealth;
            self.target_ent dodamage(100 * var_354c977e, self.origin, undefined, undefined, "none", "MOD_EXPLOSIVE");
            self.target_ent playsoundtoplayer(#"hash_6bee01b489607edd", self.target_ent);
            self deletedelay();
        }
        var_dd660bcf = 15;
        for (i = 0; i < var_dd660bcf; i++) {
            if (zombie_utility::is_player_valid(self.target_ent, 1, 1)) {
                self moveto(self.target_ent geteye(), 0.2);
            }
            wait(0.2);
        }
        self.var_88b20e7f = 60;
        var_2f769fb1 = (0, 0, 0);
        var_584124bc = self.origin;
        while (true) {
            if (isdefined(self.var_66a3d186)) {
                var_2f769fb1 = self.var_66a3d186 gettagorigin("j_head");
            }
            self.var_88b20e7f = min(self.var_88b20e7f + 0.1, 100);
            to_target = vectornormalize(var_2f769fb1 - (self.origin[0], self.origin[1], var_2f769fb1[2]));
            circle_pos = var_2f769fb1 - to_target * 200;
            target_pos = vectornormalize(circle_pos - self.origin) * self.var_88b20e7f + self.origin;
            target_pos += function_4e15ba87(var_2f769fb1);
            target_pos += function_3a260c9e(var_c0500b76, to_target, var_584124bc, var_1f2ee4ae);
            if (self function_c9bcf1cb(var_2f769fb1, 200, target_pos)) {
                break;
            }
        }
        self.var_a7882c19 = gettime() + int(5 * 1000);
    }
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 3, eflags: 0x6 linked
// Checksum 0x7521228f, Offset: 0x2538
// Size: 0x12a
function private function_c9bcf1cb(var_2f769fb1, var_1f14bda8, var_4717cb50) {
    self endon(#"death");
    if (!isdefined(var_4717cb50)) {
        var_4717cb50 = var_2f769fb1;
    }
    target_pos = vectornormalize(var_4717cb50 - self.origin) * self.var_88b20e7f + self.origin;
    self moveto(target_pos, 0.2);
    waitresult = self waittilltimeout(0.2, #"movedone");
    if (waitresult._notify === "movedone") {
        return true;
    }
    if (isdefined(var_1f14bda8) && distancesquared(var_2f769fb1, self.origin) < sqr(var_1f14bda8)) {
        return true;
    }
    return false;
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 0, eflags: 0x6 linked
// Checksum 0x70d17e1c, Offset: 0x2670
// Size: 0x280
function private function_953cead6() {
    if (!isdefined(self.var_36225742) || self.var_36225742.size === 0) {
        return;
    }
    self.var_9cf16573 = [];
    players = function_a1ef346b();
    var_b6e967f9 = arraysortclosest(players, self gettagorigin("j_head"));
    foreach (player in var_b6e967f9) {
        if (zombie_utility::is_player_valid(player, 1, 1)) {
            if (issentient(self) && !self cansee(player)) {
                continue;
            }
            if (isdefined(self.var_36225742)) {
                var_ebfb164 = 0;
                foreach (swarm in self.var_36225742) {
                    if (isdefined(swarm.target_ent) && swarm.target_ent == player) {
                        var_ebfb164 = 1;
                        break;
                    }
                }
                if (var_ebfb164) {
                    continue;
                }
            }
            if (!isdefined(self.var_9cf16573)) {
                self.var_9cf16573 = [];
            } else if (!isarray(self.var_9cf16573)) {
                self.var_9cf16573 = array(self.var_9cf16573);
            }
            self.var_9cf16573[self.var_9cf16573.size] = player;
        }
    }
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 0, eflags: 0x6 linked
// Checksum 0x79be14b2, Offset: 0x28f8
// Size: 0x52
function private function_ae1ac363() {
    if (!isdefined(self.var_9cf16573) || self.var_9cf16573.size === 0) {
        return;
    }
    target_player = array::pop_front(self.var_9cf16573);
    return target_player;
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 2, eflags: 0x6 linked
// Checksum 0x83f799c9, Offset: 0x2958
// Size: 0x1c8
function private function_d321dcc8(var_af0000ca, to_target) {
    var_817b26d2 = var_af0000ca;
    var_dc77dd5c = vectorcross(to_target, (0, 0, var_817b26d2));
    var_d01d9a4b = to_target * 100 + var_dc77dd5c * 100 + self.origin;
    bullet_trace = bullettrace(self.origin, var_d01d9a4b, 0, self);
    fraction = bullet_trace[#"fraction"];
    result = (0, 0, 0);
    if (fraction > 0 && fraction < 1) {
        result = var_dc77dd5c * -1 * (1 - fraction) * self.var_88b20e7f;
    }
    /#
        if (getdvarint(#"hash_7b1300b093008e51", 0) > 0) {
            recordline(self.origin, var_d01d9a4b, (1, 1, 0));
            if (fraction > 0 && fraction < 1) {
                debugstar(vectornormalize(var_d01d9a4b - self.origin) * fraction + self.origin, 20, (1, 0, 0));
            }
        }
    #/
    return result;
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 1, eflags: 0x6 linked
// Checksum 0xf97d845c, Offset: 0x2b28
// Size: 0xb8
function private function_4e15ba87(var_2f769fb1) {
    delta_z = var_2f769fb1[2] - self.origin[2];
    multiplier = 0.05;
    push_vector = (0, 0, delta_z * multiplier);
    /#
        if (getdvarint(#"hash_7b1300b093008e51", 0) > 0) {
            recordline(self.origin, self.origin + push_vector, (1, 0, 1));
        }
    #/
    return push_vector;
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 4, eflags: 0x6 linked
// Checksum 0x8679b8a0, Offset: 0x2be8
// Size: 0x178
function private function_3a260c9e(var_af0000ca, to_target, spawn_pos, var_93b101fe) {
    var_815a5910 = distance2d(self.origin, spawn_pos);
    var_269a05 = var_93b101fe * 0.5;
    if (var_815a5910 > var_269a05) {
        return (0, 0, 0);
    }
    t = var_815a5910 / var_269a05;
    var_500bdd34 = pow(100, -1 * pow(t - 0.5, 2));
    var_dc77dd5c = vectorcross(to_target, (0, 0, var_af0000ca));
    push_length = 50;
    push_vector = var_dc77dd5c * push_length * var_500bdd34;
    /#
        if (getdvarint(#"hash_7b1300b093008e51", 0) > 0) {
            recordline(self.origin, self.origin + push_vector, (0, 0, 1));
        }
    #/
    return push_vector;
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 0, eflags: 0x2 linked
// Checksum 0x87922bf6, Offset: 0x2d68
// Size: 0xd8
function function_e57b9f29() {
    self endon(#"death", #"end_game");
    self.takedamage = 1;
    self.maxhealth = 360;
    self.health = 360;
    self clientfield::increment("hs_swarm_state", 1);
    self thread function_51d2e478();
    while (isdefined(self)) {
        waitresult = self waittill(#"damage");
        if (self.health <= 0) {
            self deletedelay();
        }
    }
}

// Namespace namespace_cc727a3b/namespace_cc727a3b
// Params 0, eflags: 0x6 linked
// Checksum 0x2147fa39, Offset: 0x2e48
// Size: 0x6e
function private function_51d2e478() {
    self endon(#"death", #"end_game");
    while (isdefined(self)) {
        self.health -= 6;
        self util::damage_notify_wrapper(6, self);
        wait(1);
    }
}

