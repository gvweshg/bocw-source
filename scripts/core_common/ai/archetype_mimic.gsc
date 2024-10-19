// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using script_3a704cbcf4081bfb;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\behavior_state_machine.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;

#namespace archetype_mimic;

// Namespace archetype_mimic/archetype_mimic
// Params 0, eflags: 0x5
// Checksum 0xf0635ff9, Offset: 0x3d0
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"archetype_mimic", &preinit, undefined, undefined, undefined);
}

// Namespace archetype_mimic/archetype_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0x63c1e0c3, Offset: 0x418
// Size: 0x256
function preinit() {
    profilestart();
    if (!isarchetypeloaded(#"mimic")) {
        profilestop();
        return;
    }
    clientfield::register("actor", "" + #"hash_2f1c34ea62d86c57", 1, 1, "int");
    clientfield::register("toplayer", "mimic_force_stream", 1, 1, "int");
    clientfield::register("actor", "mimic_emerge_fx", 1, 1, "int");
    clientfield::register("toplayer", "mimic_attack_hit", 1, 1, "int");
    clientfield::register("toplayer", "mimic_grab_hit", 1, 1, "int");
    clientfield::register("actor", "mimic_weakpoint_fx", 1, 1, "int");
    clientfield::register("scriptmover", "mimic_prop_lure_fx", 16000, 1, "int");
    clientfield::register("actor", "mimic_death_gib_fx", 1, 1, "int");
    clientfield::register("toplayer", "mimic_bite_hit", 16000, 1, "counter");
    registerbehaviorscriptfunctions();
    spawner::add_archetype_spawn_function(#"mimic", &function_9e93acd1);
    mimic_prop_spawn::init();
    /#
        thread function_b2616fd7();
    #/
    profilestop();
}

// Namespace archetype_mimic/archetype_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0x279d5a0d, Offset: 0x678
// Size: 0x162
function function_9e93acd1() {
    function_5c843fec();
    self setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
    self callback::on_death(&function_6a99dcd1);
    self callback::function_d8abfc3d(#"on_ai_killed", &function_33960526);
    self callback::function_d8abfc3d(#"hash_484127e0cbd8f8cb", &function_1ef44bfb);
    self.var_6f5b56f6 = 0;
    self.var_6467a1c = 0;
    self callback::function_d8abfc3d(#"on_ai_melee", &function_931c3820);
    self clientfield::set("mimic_weakpoint_fx", 1);
    self.custom_melee_fire = &function_caa61267;
    if (is_true(self.var_c588eb)) {
        self.var_8706203c = 0;
    }
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x6491ac6e, Offset: 0x7e8
// Size: 0x24c
function function_6a99dcd1(*params) {
    level endon(#"game_ended");
    self endon(#"death", #"entitydeleted");
    if (is_true(self.var_655fccbb)) {
        return;
    }
    self.var_655fccbb = 1;
    if (self.damagemod === "MOD_CRUSH" && isplayer(self.attacker) && self.attacker isinvehicle()) {
        playfx(#"hash_394bead400fb65a0", self.origin);
        self deletedelay();
        return;
    }
    if (self isplayinganimscripted() && !self isragdoll()) {
        self stopanimscripted(0, 1);
        self notsolid();
        anim_time = getanimlength(#"hash_5e5bb6d5393f508e");
        self animscripted(#"hash_f4dc819c820cb3f", self.origin, self.angles, #"hash_5e5bb6d5393f508e", "normal", undefined, 1, 0.2);
        self waittillmatchtimeout(anim_time, {#notetrack:"end"}, #"hash_5e5bb6d5393f508e");
        if (isdefined(self)) {
            self deletedelay();
        }
    }
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x96c1b0d0, Offset: 0xa40
// Size: 0x3c
function function_33960526(*params) {
    self notsolid();
    mimic_prop_spawn::function_8c7b02b0(self);
}

// Namespace archetype_mimic/archetype_mimic
// Params 0, eflags: 0x6 linked
// Checksum 0x2fea5f1a, Offset: 0xa88
// Size: 0x4a
function private function_5c843fec() {
    blackboard::createblackboardforentity(self);
    self.___archetypeonanimscriptedcallback = &function_91dbc944;
    self.___archetypeonbehavecallback = &function_cc066c14;
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x6 linked
// Checksum 0xd7821dc4, Offset: 0xae0
// Size: 0x2c
function private function_91dbc944(entity) {
    entity.__blackboard = undefined;
    entity function_5c843fec();
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x6 linked
// Checksum 0x1ca50e1a, Offset: 0xb18
// Size: 0x16
function private function_cc066c14(entity) {
    entity.keepclaimednode = 0;
}

// Namespace archetype_mimic/archetype_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0x2de358fd, Offset: 0xb38
// Size: 0x7d4
function registerbehaviorscriptfunctions() {
    assert(isscriptfunctionptr(&function_ce7cc822));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2d48c1194e87de26", &function_ce7cc822);
    assert(isscriptfunctionptr(&function_1cd29506));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_332bdf71be5c0dc9", &function_1cd29506);
    assert(isscriptfunctionptr(&function_b773e233));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_49cd4dd204633bfe", &function_b773e233);
    assert(isscriptfunctionptr(&function_e955e6e1));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_129489a91f88a6f9", &function_e955e6e1);
    assert(isscriptfunctionptr(&function_4eb15d93));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_248d62b738ab1ca0", &function_4eb15d93);
    assert(isscriptfunctionptr(&function_d4d23d4a));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1a4b21648a0c98a9", &function_d4d23d4a);
    assert(isscriptfunctionptr(&function_d577e006));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_55836e8f1dc1426e", &function_d577e006);
    assert(isscriptfunctionptr(&function_59fd3f1d));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_413bf2f81ac3089f", &function_59fd3f1d);
    assert(isscriptfunctionptr(&function_cf8f5cca));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_693f6d1f82cb9a7a", &function_cf8f5cca);
    assert(isscriptfunctionptr(&function_d3b009d4));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7e3b668935979156", &function_d3b009d4);
    assert(!isdefined(&function_15ef07a4) || isscriptfunctionptr(&function_15ef07a4));
    assert(!isdefined(&function_5f11c5b7) || isscriptfunctionptr(&function_5f11c5b7));
    assert(!isdefined(&function_5b50f629) || isscriptfunctionptr(&function_5b50f629));
    behaviortreenetworkutility::registerbehaviortreeaction(#"hash_2278f951c4d99cef", &function_15ef07a4, &function_5f11c5b7, &function_5b50f629);
    assert(isscriptfunctionptr(&function_3678cec8));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_a7de028e2afdb64", &function_3678cec8);
    assert(isscriptfunctionptr(&function_5eb9b69e));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3099a99e0cb59557", &function_5eb9b69e);
    assert(isscriptfunctionptr(&function_cc64096c));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1394a7bab6b295f", &function_cc64096c);
    assert(isscriptfunctionptr(&function_ee186f54));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_322662da0af7b874", &function_ee186f54);
    assert(isscriptfunctionptr(&function_8177d507));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_234bec6511a23130", &function_8177d507);
    animationstatenetwork::registernotetrackhandlerfunction("mimic_bite", &function_20d2827d);
    animationstatenetwork::registernotetrackhandlerfunction("mimic_death_hide", &function_5c840d7b);
    animationstatenetwork::registernotetrackhandlerfunction("mimic_death_head_explosion", &mimic_death_head_explosion);
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x94015a04, Offset: 0x1318
// Size: 0x14e
function function_931c3820(*params) {
    self endon(#"death");
    var_f8ca59a8 = getentitiesinradius(self.origin, self.meleeweapon.aimeleerange, 15);
    foreach (ai in var_f8ca59a8) {
        if (isalive(ai) && absangleclamp180(ai.angles[1] - vectortoangles(self.origin - ai.origin)[1]) <= 45) {
            ai zombie_utility::setup_zombie_knockdown(self);
            waitframe(1);
        }
    }
}

// Namespace archetype_mimic/archetype_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0xdde271de, Offset: 0x1470
// Size: 0x5a0
function function_caa61267() {
    var_9051190 = [];
    nearby_players = function_a1ef346b(undefined, self.origin, self.meleeweapon.aimeleerange);
    foreach (player in nearby_players) {
        if (isdefined(self.var_f6fd2062) && ![[ self.var_f6fd2062 ]](player)) {
            if (!is_true(player.var_b895a3ff)) {
                continue;
            }
        }
        in_vehicle = player isinvehicle();
        var_7bbf287d = in_vehicle ? 80 : 45;
        if (!isalive(player) || absangleclamp180(self.angles[1] - vectortoangles(player.origin - self.origin)[1]) > var_7bbf287d) {
            continue;
        }
        if (in_vehicle) {
            vehicle = player getvehicleoccupied();
            if (!isinarray(var_9051190, vehicle)) {
                if (isdefined(level.var_34a02ce7)) {
                    [[ level.var_34a02ce7 ]](vehicle, self.var_a0193213);
                }
                if (!isdefined(var_9051190)) {
                    var_9051190 = [];
                } else if (!isarray(var_9051190)) {
                    var_9051190 = array(var_9051190);
                }
                var_9051190[var_9051190.size] = vehicle;
            }
            if (!is_true(vehicle.var_9a6644f2)) {
                player dodamage(50, self.origin, self, self, 0, "MOD_MELEE", 0, self.weapon);
            }
            continue;
        }
        player dodamage(50, self.origin, self, self, 0, "MOD_MELEE", 0, self.weapon);
    }
    var_1ff1751 = 1.2;
    var_15978c43 = getentitiesinradius(self.origin, self.meleeweapon.aimeleerange * var_1ff1751, 12);
    foreach (vehicle in var_15978c43) {
        if (isinarray(var_9051190, vehicle)) {
            continue;
        }
        if (absangleclamp180(self.angles[1] - vectortoangles(vehicle.origin - self.origin)[1]) > 80) {
            continue;
        }
        if (isdefined(level.var_34a02ce7)) {
            [[ level.var_34a02ce7 ]](vehicle, self.var_a0193213);
        }
        if (!isdefined(var_9051190)) {
            var_9051190 = [];
        } else if (!isarray(var_9051190)) {
            var_9051190 = array(var_9051190);
        }
        var_9051190[var_9051190.size] = vehicle;
    }
    attackables = [];
    if (isdefined(level.attackables) && level.attackables.size > 0) {
        attackables = arraysortclosest(level.attackables, self.origin, undefined, undefined, self.meleeweapon.aimeleerange);
    }
    foreach (attackable in attackables) {
        if (isinarray(var_9051190, attackable)) {
            continue;
        }
        if (isdefined(attackable)) {
            attackable dodamage(50, self.origin, self, self, 0, "MOD_MELEE", 0, self.weapon);
        }
    }
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0xb34f5e1d, Offset: 0x1a18
// Size: 0x1d2
function function_ce7cc822(entity) {
    enemy = zm_ai_utility::function_825317c(entity);
    if (!isdefined(enemy) || !isentity(enemy)) {
        return false;
    }
    if (!is_true(entity.var_c588eb)) {
        return false;
    }
    var_ff38566a = lengthsquared(enemy getvelocity());
    var_17c3916f = sqr(100);
    if (var_ff38566a < sqr(175)) {
        var_17c3916f = sqr(190);
    }
    if (!is_true(level.intermission)) {
        if (distancesquared(entity.origin, enemy.origin) > var_17c3916f) {
            return false;
        }
    }
    yawtoenemy = angleclamp180(entity.angles[1] - vectortoangles(enemy.origin - entity.origin)[1]);
    if (abs(yawtoenemy) > 60) {
        return false;
    }
    return true;
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x2ef855c1, Offset: 0x1bf8
// Size: 0x6e
function function_1cd29506(entity) {
    return !is_true(entity.never_hide) && is_true(entity.should_hide) && (isdefined(entity.var_a6fe91fd) || mimic_prop_spawn::function_1541ff3a());
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0xcd87faf3, Offset: 0x1c70
// Size: 0x14c
function function_b773e233(entity) {
    result = 0;
    if (!isdefined(entity.var_a6fe91fd) || !entity.var_a6fe91fd.size) {
        result = mimic_prop_spawn::function_861757a2(entity);
    }
    /#
        if (is_true(level.var_bce8fb65)) {
            println("<unknown string>" + "<unknown string>" + entity getentitynumber() + (result ? "<unknown string>" : "<unknown string>"));
        }
    #/
    /#
        if (is_true(level.var_bce8fb65)) {
            println("<unknown string>" + "<unknown string>" + entity getentitynumber() + (isdefined(entity.var_a6fe91fd) ? "<unknown string>" : "<unknown string>"));
        }
    #/
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x5e4bda9c, Offset: 0x1dc8
// Size: 0x24
function function_3336041e(entity) {
    mimic_prop_spawn::function_8c7b02b0(entity);
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x218eced7, Offset: 0x1df8
// Size: 0x7c
function function_e955e6e1(entity) {
    if (hasasm(entity) && entity asmgetstatus() == "asm_status_complete") {
        profilestart();
        function_5fa4b25d(entity);
        profilestop();
    }
    function_3336041e(entity);
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0xc56d04a4, Offset: 0x1e80
// Size: 0x1be
function function_5fa4b25d(entity) {
    entity clientfield::set("mimic_weakpoint_fx", 0);
    if (isdefined(entity.var_a6fe91fd)) {
        arrayremovevalue(entity.var_a6fe91fd, undefined, 0);
    }
    props = entity.var_a6fe91fd;
    trap_prop = entity.trap_prop;
    var_98b1552 = !isdefined(trap_prop);
    if (isdefined(trap_prop.spawn_loc.lure_prop_type)) {
        var_98b1552 = 1;
        level thread mimic_prop_spawn::clean_up_prop(trap_prop);
        arrayremovevalue(entity.var_a6fe91fd, trap_prop);
        entity.trap_prop = undefined;
    }
    num_props = randomintrangeinclusive(3, 5);
    if (var_98b1552 && mimic_prop_spawn::function_1541ff3a(1, entity)) {
        mimic_prop_spawn::function_51012821(entity.origin, entity, undefined, num_props);
        entity.should_hide = 0;
        return;
    }
    if (isdefined(trap_prop)) {
        trap_prop.origin = entity.origin;
    }
    mimic_prop_spawn::function_913ecbbc(props, entity, trap_prop, entity.origin);
    entity.should_hide = 0;
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0xd1c87194, Offset: 0x2048
// Size: 0x42c
function function_1ef44bfb(params) {
    prop = self.trap_prop;
    angles = isdefined(prop.angles) ? prop.angles : self.angles;
    origin = isdefined(prop.origin) ? prop.origin : self.origin;
    activator = undefined;
    if (isdefined(params.activators) && isentity(params.activators[0])) {
        activator = params.activators[0];
        angles = vectortoangles(activator.origin - origin);
    }
    self forceteleport(self.origin, angles, 1, 1);
    if (self ispaused()) {
        self setentitypaused(0);
    }
    self clientfield::set("mimic_emerge_fx", 1);
    self solid();
    self val::reset(#"hash_263a780666aef25", "hide");
    self.var_2ca2d270 = undefined;
    self.var_e8920729 = 0;
    self.clamptonavmesh = 0;
    self pathmode("move allowed");
    self clientfield::set("mimic_weakpoint_fx", 1);
    dist_sqr = 0;
    if (isdefined(activator)) {
        dist_sqr = distancesquared(activator.origin, self.origin);
    }
    if (isplayer(activator) && dist_sqr < sqr(96)) {
        self.var_34e5b945 = 1;
    } else {
        self.var_a516906f = {#origin:origin, #angles:(0, angles[1], 0), #activator:activator};
        self.var_a516906f.anim = #"hash_66ffb0e987e7ed06";
        if (dist_sqr > sqr(200)) {
            if (isentity(activator)) {
                var_8a9e27f9 = self getcentroid();
                end_point = var_8a9e27f9 + vectornormalize(activator getcentroid() - var_8a9e27f9) * 200;
                if (bullettracepassed(var_8a9e27f9, end_point, 0, self, activator)) {
                    self.var_a516906f.anim = #"hash_6194bdd16068478f";
                }
            }
        }
        /#
            recordcircle(self.origin, 200, (1, 1, 1));
        #/
        self animcustom(&function_f3b371f1);
    }
    self function_9e27379a();
}

// Namespace archetype_mimic/archetype_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0x459edbcb, Offset: 0x2480
// Size: 0x150
function function_9e27379a() {
    players = function_a1ef346b(undefined, self.origin, 200);
    foreach (player in players) {
        targetorigin = (player.origin[0], player.origin[1], self.origin[2]);
        var_a6470558 = vectornormalize(targetorigin - self.origin);
        player playerknockback(1);
        player applyknockback(100, var_a6470558);
        player playerknockback(0);
    }
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0xfd5ed052, Offset: 0x25d8
// Size: 0x3c
function function_4654959e(*notifyhash) {
    self clientfield::set("" + #"hash_2f1c34ea62d86c57", 1);
}

// Namespace archetype_mimic/archetype_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0xe2d46ac8, Offset: 0x2620
// Size: 0x1fc
function function_f3b371f1() {
    self endoncallback(&function_4654959e, #"death", #"killanimscript");
    if (self isragdoll()) {
        return;
    }
    self clientfield::set("" + #"hash_2f1c34ea62d86c57", 0);
    self orientmode("face angle", self.var_a516906f.angles[1]);
    self animmode("nogravity");
    self pathmode("dont move", 1);
    self animscripted(self.var_a516906f.anim, self.var_a516906f.origin, self.angles, self.var_a516906f.anim, "custom");
    wait(getanimlength(self.var_a516906f.anim));
    self.clamptonavmesh = 1;
    self pathmode("move allowed");
    self.var_9d11c76e = undefined;
    if (isplayer(self.var_a516906f.activator)) {
        self.favoriteenemy = self.var_a516906f.activator;
    }
    self clientfield::set("" + #"hash_2f1c34ea62d86c57", 1);
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x1424c812, Offset: 0x2828
// Size: 0x22
function function_4eb15d93(entity) {
    return is_true(entity.var_34e5b945);
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0xbdc31284, Offset: 0x2858
// Size: 0xc
function function_d4d23d4a(*entity) {
    
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0xc8e5021d, Offset: 0x2870
// Size: 0x56
function function_d577e006(entity) {
    entity.clamptonavmesh = 1;
    entity.var_34e5b945 = undefined;
    entity.var_6f5b56f6 = gettime() + int(5 * 1000);
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0xa3b6c2fd, Offset: 0x28d0
// Size: 0x1ac
function function_59fd3f1d(entity) {
    players = function_a1ef346b(undefined, entity.origin, 96);
    closest_player = arraygetclosest(entity.origin, players);
    if (!isdefined(closest_player) || closest_player isplayinganimscripted() || isdefined(entity.var_f6fd2062) && ![[ entity.var_f6fd2062 ]](closest_player)) {
        return;
    }
    if (absangleclamp180(self.angles[1] - vectortoangles(closest_player.origin - self.origin)[1]) < 30 && !function_4f401255(entity.origin, entity.angles, #"hash_5cfca059cd6fdb4c", closest_player getmins(), closest_player getmaxs(), [entity, closest_player])) {
        self thread function_d291b5a9(closest_player, #"hash_49907200665866a4", 0, #"hash_5cfca059cd6fdb4c");
    }
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x1d4734d4, Offset: 0x2a88
// Size: 0xc
function function_cf8f5cca(*entity) {
    
}

// Namespace archetype_mimic/archetype_mimic
// Params 6, eflags: 0x2 linked
// Checksum 0xe1aa9f3c, Offset: 0x2aa0
// Size: 0x27c
function function_4f401255(start_origin, start_angles, player_anim, mins, maxs, &var_d72e649c) {
    var_cc01fa57 = (0, 0, 15);
    var_f60dbcf6 = getstartorigin(start_origin, start_angles, player_anim);
    var_8fccab5b = getstartangles(start_origin, start_angles, player_anim);
    move_delta = getmovedelta(player_anim, 0, 0.5);
    move_delta = rotatepoint(move_delta, var_8fccab5b);
    var_d26e393f = var_f60dbcf6 + move_delta;
    var_603d4563 = var_f60dbcf6 + (isdefined(var_cc01fa57) ? var_cc01fa57 : (0, 0, 0));
    /#
        recordstar(var_f60dbcf6, (0, 1, 0), "<unknown string>");
        recordline(var_d26e393f, var_f60dbcf6, (0, 1, 0), "<unknown string>");
        recordstar(var_603d4563 + (var_603d4563 == var_f60dbcf6 ? (0, 0, 1) : (0, 0, 0)), (1, 1, 0), "<unknown string>");
        recordline(var_603d4563 + (var_603d4563 == var_f60dbcf6 ? (0, 0, 1) : (0, 0, 0)), var_d26e393f, (1, 1, 0), "<unknown string>");
    #/
    trace_result = physicstraceex(var_d26e393f, var_603d4563, mins, maxs, var_d72e649c);
    /#
        if (trace_result[#"fraction"] < 1) {
            record3dtext("<unknown string>", var_f60dbcf6, (1, 0, 0), "<unknown string>");
            recordstar(var_d26e393f + (var_603d4563 - var_d26e393f) * trace_result[#"fraction"], (1, 0, 0));
        }
    #/
    return trace_result[#"fraction"] < 1;
}

// Namespace archetype_mimic/archetype_mimic
// Params 2, eflags: 0x2 linked
// Checksum 0xf2e9ec05, Offset: 0x2d28
// Size: 0x174
function function_435d7c54(origin, angles) {
    end_origin = origin + anglestoforward(angles) * 202;
    /#
        recordstar(end_origin, (1, 0.5, 0), "<unknown string>");
        recordline(origin, end_origin, (1, 0.5, 0), "<unknown string>");
    #/
    trace_result = physicstrace(origin, end_origin, (-4, -4, -16), (4, 4, 16), undefined, 2);
    /#
        if (trace_result[#"fraction"] < 1) {
            record3dtext("<unknown string>", end_origin, (1, 0, 0), "<unknown string>");
            recordstar(origin + (end_origin - origin) * trace_result[#"fraction"], (1, 0, 0));
        }
    #/
    return trace_result[#"fraction"] < 1;
}

// Namespace archetype_mimic/archetype_mimic
// Params 4, eflags: 0x2 linked
// Checksum 0x1e9c6a17, Offset: 0x2ea8
// Size: 0x194
function function_d291b5a9(player, var_1b024168, var_52a75904, player_anim) {
    self endon(#"death");
    level endon(#"game_ended");
    origin = self.origin;
    angles = self.angles;
    waittillframeend();
    if (!isalive(self) || self isragdoll()) {
        return;
    }
    self animscripted(var_1b024168, origin, angles, var_1b024168, "normal", undefined, 1, var_52a75904);
    player thread function_224f342a(player_anim, self, origin, angles);
    anim_time = getanimlength(var_1b024168);
    self waittillmatchtimeout(anim_time, {#notetrack:"end"}, var_1b024168);
    if (isplayer(player)) {
        self.favoriteenemy = player;
    }
    self clientfield::set("" + #"hash_2f1c34ea62d86c57", 1);
}

// Namespace archetype_mimic/archetype_mimic
// Params 4, eflags: 0x6 linked
// Checksum 0x11366088, Offset: 0x3048
// Size: 0x30c
function private function_224f342a(player_anim, mimic, origin, angles) {
    self endon(#"death", #"disconnect");
    level endon(#"game_ended");
    if (!isalive(self)) {
        return;
    }
    player = self;
    player childthread function_66eaacd9();
    callback::callback(#"hash_3065435e3005a796", {#player:player});
    player val::set(#"hash_43ae43be63a51874", "ignoreme", 1);
    player clientfield::set_to_player("mimic_grab_hit", 1);
    player.var_7342424d = mimic;
    mimic.grabbed_player = player;
    player animscripted(player_anim, origin, angles, player_anim, "normal", undefined, 1, 0.2, 0.3, 0, 1, 1, undefined, 0, "linear", 0);
    anim_time = getanimlength(player_anim);
    player waittillmatchtimeout(anim_time, {#notetrack:"end"}, player_anim);
    while (isdefined(player) && player isplayinganimscripted()) {
        waitframe(1);
    }
    if (isdefined(player)) {
        callback::callback(#"hash_2745091e63972f13", {#player:player});
        if (isdefined(mimic)) {
            mimic.grabbed_player = undefined;
            to_player = player.origin - origin;
            player applyknockback(200, (to_player[0], to_player[1], 10));
        }
        player val::reset(#"hash_43ae43be63a51874", "ignoreme");
        player.var_7342424d = undefined;
        player clientfield::set_to_player("mimic_attack_hit", 0);
        player clientfield::set_to_player("mimic_grab_hit", 0);
    }
}

// Namespace archetype_mimic/archetype_mimic
// Params 0, eflags: 0x2 linked
// Checksum 0x5696fefd, Offset: 0x3360
// Size: 0x3c
function function_66eaacd9() {
    self waittill(#"mimic_attack_hit");
    self clientfield::set_to_player("mimic_attack_hit", 1);
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0xb70d58c7, Offset: 0x33a8
// Size: 0x1c4
function function_d3b009d4(entity) {
    if (entity.var_6f5b56f6 > gettime() || !isplayer(entity.favoriteenemy) || distancesquared(entity.favoriteenemy.origin, entity.origin) > sqr(96)) {
        return false;
    }
    if (isdefined(entity.var_f6fd2062) && ![[ entity.var_f6fd2062 ]](entity.favoriteenemy)) {
        return false;
    }
    if (isplayer(entity.favoriteenemy) && entity.favoriteenemy isinvehicle()) {
        return false;
    }
    if (function_435d7c54(entity gettagorigin("j_spine4"), entity.angles)) {
        return false;
    }
    return !function_4f401255(entity.origin, entity.angles, #"hash_770f46ba71e975e9", entity.favoriteenemy getmins(), entity.favoriteenemy getmaxs(), [entity, entity.favoriteenemy]);
}

// Namespace archetype_mimic/archetype_mimic
// Params 2, eflags: 0x2 linked
// Checksum 0x987fe091, Offset: 0x3578
// Size: 0x60
function function_15ef07a4(entity, asmstatename) {
    animationstatenetworkutility::requeststate(entity, asmstatename);
    entity clientfield::set("" + #"hash_2f1c34ea62d86c57", 0);
    return 5;
}

// Namespace archetype_mimic/archetype_mimic
// Params 2, eflags: 0x2 linked
// Checksum 0x51af6f3c, Offset: 0x35e0
// Size: 0x478
function function_5f11c5b7(entity, *asmstatename) {
    if (asmstatename asmgetstatus() == "asm_status_complete") {
        return 4;
    }
    if (!isdefined(asmstatename.var_50a08864)) {
        notetracks = getnotetracktimes(asmstatename asmgetcurrentdeltaanimation(), "tentacle_launch_start");
        if (notetracks.size > 0) {
            asmstatename.var_50a08864 = notetracks[0];
        }
    } else if (asmstatename getanimtime(asmstatename asmgetcurrentdeltaanimation()) <= asmstatename.var_50a08864) {
        return 5;
    }
    var_52b615cf = (4, 4, 16) - (-4, -4, -16);
    var_2ed29acc = asmstatename gettagorigin("j_tentacle_04_ri");
    var_1ed13caa = asmstatename gettagorigin("j_tentacle_01_ri");
    var_a36e995b = asmstatename gettagorigin("j_tentacle_04_le");
    var_e49586c9 = asmstatename gettagorigin("j_tentacle_01_le");
    closest_player = arraygetclosest(var_2ed29acc, function_a1ef346b());
    /#
        if (is_true(level.var_ec72eeae)) {
            recordstar(var_2ed29acc, (0, 1, 0), "<unknown string>");
            recordline(var_1ed13caa, var_2ed29acc, (0, 1, 0), "<unknown string>");
            recordstar(math::closest_point_on_line(closest_player.origin, var_1ed13caa, var_2ed29acc), (1, 0, 1), "<unknown string>");
            recordstar(var_a36e995b, (0, 1, 0), "<unknown string>");
            recordline(var_e49586c9, var_a36e995b, (0, 1, 0), "<unknown string>");
            recordstar(math::closest_point_on_line(closest_player.origin, var_e49586c9, var_a36e995b), (1, 0, 1), "<unknown string>");
        }
    #/
    if (!isdefined(closest_player) || closest_player isplayinganimscripted() || isdefined(asmstatename.var_f6fd2062) && ![[ asmstatename.var_f6fd2062 ]](closest_player) || !istouching(math::closest_point_on_line(closest_player.origin, var_1ed13caa, var_2ed29acc), closest_player, var_52b615cf) || !istouching(math::closest_point_on_line(closest_player.origin, var_e49586c9, var_a36e995b), closest_player, var_52b615cf)) {
        return 5;
    } else if (!function_4f401255(asmstatename.origin, asmstatename.angles, #"hash_770f46ba71e975e9", closest_player getmins(), closest_player getmaxs(), [asmstatename, closest_player])) {
        asmstatename thread function_d291b5a9(closest_player, #"hash_318ef3b5409e6403", 0.2, #"hash_770f46ba71e975e9");
    }
    return 5;
}

// Namespace archetype_mimic/archetype_mimic
// Params 2, eflags: 0x2 linked
// Checksum 0xd0e36c44, Offset: 0x3a60
// Size: 0x4e
function function_5b50f629(entity, *asmstatename) {
    asmstatename.var_6f5b56f6 = gettime() + int(5 * 1000);
    asmstatename.var_50a08864 = undefined;
    return 4;
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x500bc064, Offset: 0x3ab8
// Size: 0xc
function function_3678cec8(*entity) {
    
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x70e5df44, Offset: 0x3ad0
// Size: 0x44
function function_5eb9b69e(entity) {
    entity clientfield::set("" + #"hash_2f1c34ea62d86c57", 1);
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0x61733743, Offset: 0x3b20
// Size: 0xac
function function_20d2827d(entity) {
    if (!is_true(entity.aat_turned) && isplayer(entity.grabbed_player)) {
        entity.grabbed_player clientfield::increment_to_player("mimic_bite_hit", 1);
        entity.grabbed_player dodamage(75, entity.origin, entity, entity, "none", "MOD_MELEE", 0);
    }
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0xc84003ff, Offset: 0x3bd8
// Size: 0x5c
function function_5c840d7b(entity) {
    entity ghost();
    entity notsolid();
    self clientfield::set("mimic_death_gib_fx", 1);
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x2 linked
// Checksum 0xc0af0f8e, Offset: 0x3c40
// Size: 0xa4
function mimic_death_head_explosion(entity) {
    if (entity haspart("j_head", "c_t9_zmb_mimic_head") && !entity isattached(#"hash_25e5543fd258a1a6")) {
        entity hidepart("j_head", "c_t9_zmb_mimic_head", 1);
        entity attach(#"hash_25e5543fd258a1a6");
    }
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x6 linked
// Checksum 0x5d08d627, Offset: 0x3cf0
// Size: 0x54
function private function_cc64096c(entity) {
    decision = randomint(2);
    entity setblackboardattribute("_ranged_attack_variant", decision);
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x6 linked
// Checksum 0x94165c47, Offset: 0x3d50
// Size: 0xe8
function private function_ee186f54(entity) {
    if (is_true(entity.var_c588eb) && isdefined(entity.favoriteenemy) && gettime() >= entity.var_8706203c && distancesquared(entity.favoriteenemy.origin, entity.origin) <= sqr(500) && bullettracepassed(entity.favoriteenemy geteyeapprox(), entity geteyeapprox(), 0, undefined)) {
        entity.var_8c4d3e5d = 1;
    }
    return false;
}

// Namespace archetype_mimic/archetype_mimic
// Params 1, eflags: 0x6 linked
// Checksum 0xd3419f87, Offset: 0x3e40
// Size: 0x56
function private function_8177d507(entity) {
    entity.var_205ab08b = 1;
    entity.var_1087b4ab = "j_helmet";
    entity.var_8706203c = gettime() + int(10 * 1000);
}

/#

    // Namespace archetype_mimic/archetype_mimic
    // Params 0, eflags: 0x0
    // Checksum 0x75d5ceb2, Offset: 0x3ea0
    // Size: 0x76c
    function function_b2616fd7() {
        function_5ac4dc99(#"hash_63d887d4b23cb6e", "<unknown string>");
        function_cd140ee9(#"hash_63d887d4b23cb6e", &function_c19802);
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        __index = isdefined(__index) ? __index : 0;
        util::add_debug_command("<unknown string>" + "<unknown string>" + "<unknown string>" + __index + "<unknown string>" + "<unknown string>" + "<unknown string>");
        __index++;
        level thread function_c5a69992(__index);
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 1, eflags: 0x0
    // Checksum 0xe247a513, Offset: 0x4618
    // Size: 0x3cc
    function function_c19802(dvar) {
        tokens = strtok(dvar.value, "<unknown string>");
        switch (isdefined(tokens[0]) ? tokens[0] : "<unknown string>") {
        case #"hash_31323c2655b560b7":
            level thread function_f543fa16();
            break;
        case #"hash_601090df5cf5a69a":
            level thread function_fa613511();
            break;
        case #"hash_252ab6031286d4fb":
            level thread function_a42f6839();
            break;
        case #"hash_7369a81a09f4035":
            level thread function_d70b96a8();
            break;
        case #"hash_ae178db3a20b85":
            level thread function_5b9e63e6();
            break;
        case #"hash_43a02611d9b79ced":
            level thread function_3bd29cb8();
            break;
        case #"hash_68817045e64df700":
            level thread function_d312cd2c();
            break;
        case #"hash_22d6e20b320c956b":
            level.var_bce8fb65 = !is_true(level.var_bce8fb65);
            break;
        case #"hash_721abb229b429d1d":
            level thread function_37c34605();
            break;
        case #"hash_10ab0e022e9a6697":
            mimic_prop_spawn::function_fd24f982();
            break;
        case #"hash_21d6880dde085ff6":
            level.var_72a9fe4c = !is_true(level.var_72a9fe4c);
            break;
        case #"hash_31c1a67e639807f4":
            level.var_8861a2c7 = !is_true(level.var_8861a2c7);
            break;
        case #"hash_2b8cdb3e5ae034ec":
            level notify(#"hash_7fd40fb3202e52db");
            break;
        case #"hash_3c03579da902b40e":
            level.var_ec72eeae = !is_true(level.var_ec72eeae);
            break;
        case #"hash_1cb34c5ebb1662de":
            level thread function_6469c221();
            break;
        case #"hash_2bed8c55c06b6d52":
            level.var_dc3159ff = tokens[1];
            break;
        case #"hash_15242ba18dadcfca":
            level thread function_bc75224c();
            break;
        case #"hash_8c4454ea8f84335":
            level thread function_7f6a5e14();
            break;
        default:
            return;
        }
        setdvar(#"hash_63d887d4b23cb6e", "<unknown string>");
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 1, eflags: 0x0
    // Checksum 0xd8c9d8af, Offset: 0x49f0
    // Size: 0x218
    function function_c5a69992(__index) {
        if (!isdefined(__index)) {
            __index = 0;
        }
        level endon(#"game_ended");
        spawn_points = struct::get_array("<unknown string>", "<unknown string>");
        scriptbundlenames = [];
        foreach (index, point in spawn_points) {
            if (isdefined(point.scriptbundlename) && !isinarray(scriptbundlenames, point.scriptbundlename)) {
                scriptbundlenames[scriptbundlenames.size] = point.scriptbundlename;
            }
            if (index & 16) {
                waitframe(1);
            }
        }
        foreach (name_index, name in scriptbundlenames) {
            util::add_debug_command("<unknown string>" + __index + "<unknown string>" + function_9e72a96(name) + "<unknown string>" + name_index + "<unknown string>" + function_9e72a96(name) + "<unknown string>");
        }
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 0, eflags: 0x0
    // Checksum 0x27c591c9, Offset: 0x4c10
    // Size: 0x21a
    function function_f543fa16() {
        level.("<unknown string>") = !is_true(level.("<unknown string>"));
        if (!is_true(level.("<unknown string>"))) {
            level notify(#"kill_" + "<unknown string>");
            return;
        }
        level endon(#"kill_" + "<unknown string>");
        while (true) {
            var_2a1f535d = mimic_prop_spawn::function_2e8c33f6();
            foreach (trap_prop in var_2a1f535d) {
                color = is_true(trap_prop.pause_trap) ? (1, 0, 0) : (0, 1, 1);
                debugstar(trap_prop.origin, 1, color);
                line(trap_prop.origin, trap_prop.origin + (0, 0, 900), color);
                if (is_true(trap_prop.pause_trap)) {
                    print3d(trap_prop.origin + (0, 0, 48), "<unknown string>", color);
                }
            }
            waitframe(1);
        }
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 0, eflags: 0x0
    // Checksum 0x1d008253, Offset: 0x4e38
    // Size: 0x162
    function function_fa613511() {
        level.("<unknown string>") = !is_true(level.("<unknown string>"));
        if (!is_true(level.("<unknown string>"))) {
            level notify(#"kill_" + "<unknown string>");
            return;
        }
        level endon(#"kill_" + "<unknown string>");
        while (true) {
            foreach (prop in level.var_5fafe5ac) {
                if (is_true(prop.var_3e64167)) {
                    continue;
                }
                debugstar(prop.origin, 1, (0, 1, 0));
            }
            waitframe(1);
        }
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 0, eflags: 0x0
    // Checksum 0x5ccee968, Offset: 0x4fa8
    // Size: 0xf4
    function function_ea10da3f() {
        waitframe(1);
        player = getplayers()[0];
        direction = player getplayerangles();
        direction_vec = anglestoforward(direction);
        eye = player geteye();
        direction_vec = (direction_vec[0] * 8000, direction_vec[1] * 8000, direction_vec[2] * 8000);
        trace = bullettrace(eye, eye + direction_vec, 0, undefined);
        return trace;
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 0, eflags: 0x0
    // Checksum 0x51493cd8, Offset: 0x50a8
    // Size: 0xac
    function function_a42f6839() {
        self notify("<unknown string>");
        self endon("<unknown string>");
        trace = function_ea10da3f();
        queryresult = positionquery_source_navigation(trace[#"position"], 500, 1200, 256, 128);
        if (!queryresult.data.size) {
            return;
        }
        mimic_prop_spawn::function_b309db61(queryresult.data, undefined, level.var_dc3159ff);
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 0, eflags: 0x0
    // Checksum 0xa0828702, Offset: 0x5160
    // Size: 0x64
    function function_d70b96a8() {
        self notify("<unknown string>");
        self endon("<unknown string>");
        trace = function_ea10da3f();
        mimic_prop_spawn::function_51012821(trace[#"position"], undefined, undefined, 3);
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 0, eflags: 0x0
    // Checksum 0x43dd2511, Offset: 0x51d0
    // Size: 0x64
    function function_5b9e63e6() {
        self notify("<unknown string>");
        self endon("<unknown string>");
        trace = function_ea10da3f();
        mimic_prop_spawn::function_51012821(trace[#"position"], undefined, undefined, 1);
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 0, eflags: 0x0
    // Checksum 0x5fb225f8, Offset: 0x5240
    // Size: 0xa4
    function function_3bd29cb8() {
        self notify("<unknown string>");
        self endon("<unknown string>");
        trace = function_ea10da3f();
        closest_point = arraygetclosest(trace[#"position"], level.var_6e175eb);
        mimic_prop_spawn::function_b309db61(array(closest_point), undefined, undefined);
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 0, eflags: 0x0
    // Checksum 0xdbb45d75, Offset: 0x52f0
    // Size: 0xca
    function function_d312cd2c() {
        self notify("<unknown string>");
        self endon("<unknown string>");
        trace = function_ea10da3f();
        mimic = spawnactor("<unknown string>", trace[#"position"], vectortoangles(getplayers()[0].origin - trace[#"position"]));
        if (isdefined(mimic)) {
            mimic.never_hide = 1;
        }
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 0, eflags: 0x0
    // Checksum 0xb856ff21, Offset: 0x53c8
    // Size: 0x142
    function function_37c34605() {
        level.("<unknown string>") = !is_true(level.("<unknown string>"));
        if (!is_true(level.("<unknown string>"))) {
            level notify(#"kill_" + "<unknown string>");
            return;
        }
        level endon(#"kill_" + "<unknown string>");
        while (true) {
            foreach (point in level.var_6e175eb) {
                debugstar(point.origin, 5, (1, 0, 0));
            }
            waitframe(5);
        }
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 0, eflags: 0x0
    // Checksum 0xdb785813, Offset: 0x5518
    // Size: 0x274
    function function_bc75224c() {
        level.("<unknown string>") = !is_true(level.("<unknown string>"));
        if (!is_true(level.("<unknown string>"))) {
            level notify(#"kill_" + "<unknown string>");
            return;
        }
        level endon(#"kill_" + "<unknown string>");
        var_d6d4c388 = int(5 * 1000);
        var_88f244b8 = 0;
        spawn_points = [];
        while (true) {
            if (gettime() >= var_88f244b8 + var_d6d4c388) {
                spawn_points = mimic_prop_spawn::function_bc29cf28();
                var_88f244b8 = gettime();
            }
            foreach (point in spawn_points) {
                debugstar(point.origin, int(0.5 / float(function_60d95f53()) / 1000), (0, 1, 0));
                line(point.origin, point.origin + (0, 0, 64), (0, 1, 0), 1, 0, int(0.5 / float(function_60d95f53()) / 1000));
            }
            wait(0.5);
        }
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 0, eflags: 0x0
    // Checksum 0x4c0fe291, Offset: 0x5798
    // Size: 0xbc
    function function_6469c221() {
        self notify("<unknown string>");
        self endon("<unknown string>");
        trace = function_ea10da3f();
        spawn_structs = mimic_prop_spawn::function_bc29cf28();
        if (!spawn_structs.size) {
            return;
        }
        closest_struct = arraygetclosest(trace[#"position"], spawn_structs);
        mimic_prop_spawn::function_b309db61([closest_struct]);
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 0, eflags: 0x0
    // Checksum 0xb9c1cb60, Offset: 0x5860
    // Size: 0x2f4
    function function_7f6a5e14() {
        level.("<unknown string>") = !is_true(level.("<unknown string>"));
        if (!is_true(level.("<unknown string>"))) {
            level notify(#"kill_" + "<unknown string>");
            return;
        }
        level endon(#"kill_" + "<unknown string>");
        var_d4034654 = struct::get_array("<unknown string>", "<unknown string>");
        var_d4034654 = arraycombine(var_d4034654, mimic_prop_spawn::function_bc29cf28(), 0, 0);
        waitframe(1);
        while (true) {
            player = getplayers()[0];
            direction = player getplayerangles();
            direction_vec = anglestoforward(direction);
            eye = player geteye();
            direction_vec = (direction_vec[0] * 8000, direction_vec[1] * 8000, direction_vec[2] * 8000);
            trace = bullettrace(eye, eye + direction_vec, 0, undefined);
            debugstar(trace[#"position"], 5, (0, 1, 1));
            spawn_points = arraysortclosest(var_d4034654, trace[#"position"], 1);
            foreach (point in spawn_points) {
                info = function_5ef9a937(point);
                function_ccc08aea(info);
            }
            wait(0.25);
        }
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 1, eflags: 0x4
    // Checksum 0x5628ac1, Offset: 0x5b60
    // Size: 0x580
    function private function_5ef9a937(point) {
        if (isdefined(point.lure_prop_type)) {
            switch (point.lure_prop_type) {
            case 0:
                new_point = isdefined(point.trigger.scriptmodel) ? point.trigger.scriptmodel : point.scriptmodel;
                point = isdefined(new_point) ? new_point : point;
                break;
            case 1:
                if (point.targetname === "<unknown string>") {
                    point = point.machine;
                }
                break;
            default:
                break;
            }
            new_origin = point.origin;
        } else {
            new_origin = groundtrace(point.origin + (0, 0, 15) + (0, 0, 8), point.origin + (0, 0, 15) + (0, 0, -100000), 0, undefined)[#"position"];
        }
        validation_info = {#origin:new_origin, #angles:point.angles, #var_60d91344:[], #var_ed56107c:[]};
        for (i = -180; i < 180; i += 15) {
            move_delta = getmovedelta(#"hash_414bef9b5dcae460");
            angle_delta = getangledelta(#"hash_414bef9b5dcae460");
            move_delta = rotatepoint(move_delta, point.angles + (0, angle_delta + i, 0));
            var_feb3dda6 = {#origin:new_origin + move_delta, #angles:vectortoangles(move_delta)};
            var_f60dbcf6 = getstartorigin(var_feb3dda6.origin, var_feb3dda6.angles, #"hash_5cfca059cd6fdb4c");
            var_8fccab5b = getstartangles(var_feb3dda6.origin, var_feb3dda6.angles, #"hash_5cfca059cd6fdb4c");
            move_delta = getmovedelta(#"hash_5cfca059cd6fdb4c", 0, 0.5);
            move_delta = rotatepoint(move_delta, var_8fccab5b);
            var_d26e393f = var_f60dbcf6 + move_delta;
            var_261937fc = groundtrace(var_feb3dda6.origin + (0, 0, 15) + (0, 0, 8), var_feb3dda6.origin + (0, 0, 15) + (0, 0, -100000), 0, undefined)[#"position"];
            if (abs(var_261937fc[2] - var_feb3dda6.origin[2]) < 15) {
                var_feb3dda6.origin = var_261937fc;
            }
            passed = !function_4f401255(var_feb3dda6.origin, var_feb3dda6.angles, #"hash_5cfca059cd6fdb4c", level.players[0] getmins(), level.players[0] getmaxs(), [level.players[0]]);
            var_ed56107c = {#passed:passed, #var_9f7d6d3b:var_feb3dda6.origin, #var_dc11f544:var_f60dbcf6, #var_20f2bd48:var_d26e393f};
            validation_info.var_ed56107c[validation_info.var_ed56107c.size] = var_ed56107c;
        }
        return validation_info;
    }

    // Namespace archetype_mimic/archetype_mimic
    // Params 1, eflags: 0x4
    // Checksum 0xd759a16, Offset: 0x60e8
    // Size: 0x130
    function private function_ccc08aea(validation_info) {
        foreach (var_ed56107c in validation_info.var_ed56107c) {
            debugstar(var_ed56107c.var_dc11f544, 5, var_ed56107c.passed ? (0, 1, 0) : (1, 0, 0));
            line(var_ed56107c.var_dc11f544, var_ed56107c.var_20f2bd48, var_ed56107c.passed ? (0, 1, 0) : (1, 0, 0), 1, 0, 5);
            line(var_ed56107c.var_9f7d6d3b, var_ed56107c.var_dc11f544, (1, 0, 1), 1, 0, 5);
        }
    }

#/
