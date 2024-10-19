// Atian COD Tools GSC CW decompiler test
#using script_2a5bf5b4a00cee0d;
#using script_164a456ce05c3483;
#using script_3faf478d5b0850fe;
#using script_47851dbeea22fe66;
#using script_1ee011cd0961afd7;
#using script_5f20d3b434d24884;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using scripts\core_common\ai\zombie.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\systems\destructible_character.gsc;
#using script_2c5daa95f8fec03c;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp.gsc;
#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\systems\ai_blackboard.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_514c8ebc;

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 0, eflags: 0x2 linked
// Checksum 0xddaf4d5d, Offset: 0x610
// Size: 0x9bc
function init() {
    namespace_250e9486::function_252dff4d("gegenees", 27, &function_1b3fc8e4);
    clientfield::register("actor", "gegenees_shield_blast_effect", 16000, 1, "counter");
    clientfield::register("actor", "gegenees_shield_guard_effect", 16000, 1, "int");
    clientfield::register("actor", "gegenees_spear_tip_effect", 16000, 1, "int");
    clientfield::register("actor", "gegenees_spear_tip_tell_effect", 16000, 1, "int");
    clientfield::register("toplayer", "gegenees_damage_cf", 16000, 1, "counter");
    clientfield::register("scriptmover", "gegenees_spear_miss_cf", 16000, 1, "counter");
    clientfield::register("actor", "gegenees_helmet_explosion_cf", 16000, 1, "int");
    level.var_8c5f46f1 = [];
    for (i = 0; i < 2; i++) {
        level.var_8c5f46f1[level.var_8c5f46f1.size] = namespace_ec06fe4a::spawnmodel((0, 0, 0), "tag_origin", (0, 0, 0), "gegenees impact");
    }
    assert(isscriptfunctionptr(&function_d5d3aa77));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2bc0d801acaee9a4", &function_d5d3aa77);
    assert(isscriptfunctionptr(&function_4334cc3b));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4053e75ff0301438", &function_4334cc3b);
    assert(isscriptfunctionptr(&function_a953d80d));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1075ab617f39c601", &function_a953d80d);
    assert(isscriptfunctionptr(&function_7f34a57c));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1e595daa404c5a3d", &function_7f34a57c);
    assert(isscriptfunctionptr(&function_75db4aba));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7e22610d7293179e", &function_75db4aba);
    assert(isscriptfunctionptr(&function_d344063a));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1d6949a6c9ec0081", &function_d344063a);
    assert(isscriptfunctionptr(&function_3133f922));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6f4458058e881523", &function_3133f922);
    assert(isscriptfunctionptr(&function_d82de95f));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_16cf6fd0904e492f", &function_d82de95f);
    assert(isscriptfunctionptr(&function_564b9cf5));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_74ab5c3ab4cbfdda", &function_564b9cf5);
    assert(isscriptfunctionptr(&function_7505908b));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_572453d6d6540a73", &function_7505908b);
    assert(isscriptfunctionptr(&function_9175e656));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1f9cdbd55afb3860", &function_9175e656);
    assert(isscriptfunctionptr(&function_c81af561));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2c97edb3312da9c6", &function_c81af561);
    assert(isscriptfunctionptr(&function_47fdaf31));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_471802b111fa1af0", &function_47fdaf31);
    assert(isscriptfunctionptr(&gegeneesstunstart));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"gegeneesstunstart", &gegeneesstunstart);
    assert(!isdefined(&function_2301c0a7) || isscriptfunctionptr(&function_2301c0a7));
    assert(!isdefined(&function_c2155e05) || isscriptfunctionptr(&function_c2155e05));
    assert(!isdefined(&function_15502a5) || isscriptfunctionptr(&function_15502a5));
    behaviortreenetworkutility::registerbehaviortreeaction(#"hash_49454f4516c40e65", &function_2301c0a7, &function_c2155e05, &function_15502a5);
    animationstatenetwork::registeranimationmocomp("mocomp_gegenees_shield", &function_d645d2ec, &function_f6bb8a07, &function_64c4573);
    animationstatenetwork::registernotetrackhandlerfunction("gegenees_melee", &function_c3c86ec1);
    animationstatenetwork::registernotetrackhandlerfunction("geg_throw_spear", &function_7fe60e9e);
    animationstatenetwork::registernotetrackhandlerfunction("geg_grab_spear", &function_4d6e95b6);
    animationstatenetwork::registernotetrackhandlerfunction("gegenees_weapon_drop", &function_43104218);
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 0, eflags: 0x2 linked
// Checksum 0xa48025e4, Offset: 0xfd8
// Size: 0x2ea
function function_1b3fc8e4() {
    namespace_250e9486::function_25b2c8a9();
    self namespace_250e9486::function_db744d28();
    self.maxhealth += 250000 + int(100000 * namespace_ec06fe4a::function_ef369bae()) + level.doa.var_6c58d51 * 300000;
    self.health = self.maxhealth;
    self.var_1c8b76d3 = 1;
    self.no_gib = 1;
    self.meleedistsq = sqr(72);
    self.goalradius = 68;
    self setblackboardattribute("_gegenees_shield", "shield_down");
    self setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
    self.zombie_move_speed = "walk";
    self.var_3a001247 = 1;
    self collidewithactors(1);
    aiutility::addaioverridedamagecallback(self, &function_ca5688e3);
    self callback::on_ai_killed(&function_a231dd3b);
    target_set(self);
    self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_gegenees_spawn");
    self thread namespace_9fc66ac::function_ba33d23d(#"hash_2f8e9463ad366ab0", #"hash_2f8e9463ad366ab0", #"hash_4fbc2a660ed47842");
    self attach("c_t8_zmb_dlc2_gegenees_shield", "tag_weapon_left");
    self attach("c_t8_zmb_dlc2_gegenees_sword", "tag_weapon_right");
    self attach("c_t8_zmb_dlc2_gegenees_helmet1", "j_head");
    self function_d06af584();
    self.var_cc7959e1 = 1;
    self.spearweapon = getweapon("zombietron_gegenees_spear_projectile");
    self.var_a9716e54 = 0;
    self.var_c63e2811 = 0;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 2, eflags: 0x6 linked
// Checksum 0xf1e60fd2, Offset: 0x12d0
// Size: 0xec
function private function_d4f5b993(entity, eventname) {
    if (!isdefined(entity.favoriteenemy)) {
        return false;
    }
    var_b3a11ca1 = blackboard::getblackboardevents(eventname);
    if (isdefined(var_b3a11ca1) && var_b3a11ca1.size) {
        foreach (var_8d7c592b in var_b3a11ca1) {
            if (var_8d7c592b.data.favoriteenemy === entity.favoriteenemy) {
                return false;
            }
        }
    }
    return true;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 3, eflags: 0x6 linked
// Checksum 0x29b2df7b, Offset: 0x13c8
// Size: 0x110
function private function_697a9b7f(entity, minrange, maxrange) {
    if (!isdefined(entity.favoriteenemy)) {
        return 0;
    }
    if (isdefined(entity.var_b491d096)) {
        return 0;
    }
    if (!isdefined(minrange)) {
        minrange = 200;
    }
    if (!isdefined(maxrange)) {
        maxrange = 1000;
    }
    withinrange = distancesquared(entity.origin, entity.favoriteenemy.origin) <= sqr(maxrange);
    withinrange = entity isatgoal() || withinrange && distancesquared(entity.origin, entity.favoriteenemy.origin) >= sqr(minrange);
    return withinrange;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0xb9adeb95, Offset: 0x14e0
// Size: 0x92
function private function_180db9a7(entity) {
    if (!isdefined(entity.favoriteenemy)) {
        return 0;
    }
    if (isdefined(entity.var_b491d096)) {
        return 0;
    }
    can_see = bullettracepassed(entity.origin + (0, 0, 36), entity.favoriteenemy.origin + (0, 0, 36), 0, undefined);
    return can_see;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x38b48c6, Offset: 0x1580
// Size: 0x102
function private function_4b8e0aab(entity) {
    if (!isdefined(entity.favoriteenemy)) {
        return 0;
    }
    if (isdefined(entity.var_b491d096)) {
        return 0;
    }
    can_see = 0;
    trace = physicstrace(entity.origin + (0, 0, 48), entity.favoriteenemy.origin + (0, 0, 36), (-16, -16, -12), (16, 16, 12), entity);
    if (trace[#"fraction"] == 1 || trace[#"entity"] === entity.favoriteenemy) {
        can_see = 1;
    }
    return can_see;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x2 linked
// Checksum 0x8206f1b3, Offset: 0x1690
// Size: 0x9a
function function_7f34a57c(entity) {
    if (function_697a9b7f(entity) && function_4b8e0aab(entity) && function_d4f5b993(entity, "geg_spear_attack")) {
        return true;
    }
    if (isdefined(entity.enemy) && !entity haspath()) {
        return true;
    }
    return false;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 0, eflags: 0x2 linked
// Checksum 0x668c0cc8, Offset: 0x1738
// Size: 0x64
function function_f7d9bc34() {
    self endon(#"disconnect");
    self namespace_83eb6304::function_3ecfde67("incoming_impact");
    wait(1.2);
    if (isdefined(self)) {
        self namespace_83eb6304::turnofffx("incoming_impact");
    }
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x2 linked
// Checksum 0x3327789c, Offset: 0x17a8
// Size: 0x4c4
function function_7fe60e9e(entity) {
    var_d86ae1c4 = spawnstruct();
    var_d86ae1c4.favoriteenemy = entity.favoriteenemy;
    blackboard::addblackboardevent("geg_spear_attack", var_d86ae1c4, randomintrange(8500, 10000));
    if (!isactor(entity) || !isdefined(entity.favoriteenemy)) {
        return;
    }
    entity.favoriteenemy thread function_f7d9bc34();
    targetpos = entity.favoriteenemy.origin;
    launchpos = entity gettagorigin("tag_inhand");
    var_ad804014 = 5;
    if (distancesquared(targetpos, entity.origin) > sqr(250)) {
        velocity = entity.favoriteenemy getvelocity();
        velocity = (velocity[0], velocity[1], 0);
        targetpos += velocity * 0.25;
        var_a76a363d = math::randomsign() * randomint(var_ad804014);
        var_9b241db1 = math::randomsign() * randomint(var_ad804014);
        targetpos += (var_a76a363d, var_9b241db1, 0);
        speed = length(velocity);
        if (speed > 0) {
            var_7ee6937e = vectornormalize((targetpos[0], targetpos[1], 0) - (launchpos[0], launchpos[1], 0));
            dot = vectordot(-1 * var_7ee6937e, velocity / speed);
            if (dot >= 0.8) {
                targetpos += var_7ee6937e * dot * speed * 0.5;
            }
        }
    }
    targetpos += (0, 0, 36);
    var_872c6826 = vectortoangles(targetpos - launchpos);
    angles = function_cc68801f(launchpos, targetpos, 600, getdvarfloat(#"bg_lowgravity", 0));
    if (isdefined(angles) && angles[#"lowangle"] > 0) {
        dir = anglestoforward((-1 * angles[#"lowangle"], var_872c6826[1], var_872c6826[2]));
    } else {
        dir = anglestoforward(var_872c6826);
    }
    velocity = dir * 600;
    var_1a3b2274 = "zombietron_gegenees_spear_projectile";
    var_a137cb9f = entity gettagorigin("tag_inhand");
    var_eb549b4f = entity.favoriteenemy.origin;
    if (namespace_ec06fe4a::function_a8975c67(16)) {
        projectile = entity magicmissile(entity.spearweapon, var_a137cb9f, velocity, entity.favoriteenemy);
        projectile thread function_7d162bd0(projectile, entity);
        entity function_59e9f77b();
    }
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 0, eflags: 0x6 linked
// Checksum 0xc57fc908, Offset: 0x1c78
// Size: 0xa6
function private function_a1fce938() {
    foreach (var_b12a43cc in level.var_8c5f46f1) {
        if (!is_true(var_b12a43cc.in_use)) {
            var_b12a43cc.in_use = 1;
            return var_b12a43cc;
        }
    }
    return undefined;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 2, eflags: 0x6 linked
// Checksum 0xc94fcc59, Offset: 0x1d28
// Size: 0xc2
function private function_fc4cc729(enemy, origin) {
    if (!isalive(enemy)) {
        return false;
    }
    if (is_true(enemy.knockdown)) {
        return false;
    }
    if (gibserverutils::isgibbed(enemy, 384)) {
        return false;
    }
    if (enemy.archetype === #"gegenees") {
        return false;
    }
    if (distancesquared(enemy.origin, origin) > 10000) {
        return false;
    }
    return true;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 0, eflags: 0x6 linked
// Checksum 0x4cc59a75, Offset: 0x1df8
// Size: 0xe0
function private function_7e633e59() {
    zombiesarray = getaiarchetypearray(#"zombie");
    zombiesarray = array::filter(zombiesarray, 0, &function_fc4cc729, self.origin);
    foreach (zombie in zombiesarray) {
        zombie namespace_250e9486::setup_zombie_knockdown(self);
    }
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 2, eflags: 0x6 linked
// Checksum 0xf200a296, Offset: 0x1ee0
// Size: 0x1bc
function private function_7d162bd0(projectile, entity) {
    result = projectile waittill(#"projectile_impact", #"projectile_impact_player", #"death");
    if (isdefined(projectile)) {
        projectile thread namespace_ec06fe4a::function_52afe5df(3);
    }
    if (result._notify != "projectile_impact_player") {
        var_b12a43cc = function_a1fce938();
        if (isdefined(var_b12a43cc)) {
            if (isdefined(projectile.origin)) {
                projectile thread function_7e633e59();
                var_b12a43cc.origin = projectile.origin;
            } else if (isdefined(entity) && isdefined(entity.favoriteenemy)) {
                var_b12a43cc.origin = entity.favoriteenemy.origin;
            }
            util::wait_network_frame();
            var_b12a43cc clientfield::increment("gegenees_spear_miss_cf");
            wait(0.25);
            var_b12a43cc.in_use = 0;
        }
        return;
    }
    if (isdefined(result.player) && result.player.birthtime < gettime()) {
        result.player clientfield::increment_to_player("gegenees_damage_cf");
    }
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x3df06703, Offset: 0x20a8
// Size: 0x24
function private function_4d6e95b6(entity) {
    entity function_d06af584();
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x10dcd843, Offset: 0x20d8
// Size: 0x84
function private function_43104218(entity) {
    destructserverutils::function_9885f550(entity, "left_hand", "tag_weapon_left");
    destructserverutils::function_9885f550(entity, "right_hand", "tag_weapon_right");
    destructserverutils::function_9885f550(entity, "right_arm_upper", "tag_inhand");
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x4
// Checksum 0xba1eee9e, Offset: 0x2168
// Size: 0xe
function private function_e0b648bb(*entity) {
    return false;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x2a9844df, Offset: 0x2180
// Size: 0x2e
function private function_d344063a(entity) {
    if (is_true(entity.var_d64b7af0)) {
        return true;
    }
    return false;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x22509411, Offset: 0x21b8
// Size: 0x16
function private function_47fdaf31(entity) {
    entity.var_d64b7af0 = 0;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x33cc06a9, Offset: 0x21d8
// Size: 0xc
function private gegeneesstunstart(*entity) {
    
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x4
// Checksum 0x166f4a17, Offset: 0x21f0
// Size: 0xc
function private function_3839537e(*entity) {
    
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x76d1543b, Offset: 0x2208
// Size: 0x100
function private function_75db4aba(entity) {
    var_98c55679 = 0;
    var_a4017acd = 0.1 * entity.maxhealth;
    if (isdefined(entity.shielddamage)) {
        if (entity.shielddamage > var_a4017acd) {
            var_98c55679 = 1;
        }
    }
    if (!var_98c55679) {
        return false;
    }
    if (isdefined(entity.enemy) && !entity haspath()) {
        return true;
    }
    if (function_697a9b7f(entity, 300, 1200) && function_180db9a7(entity) && function_d4f5b993(entity, "geg_shield_attack")) {
        return true;
    }
    return false;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0xd6215354, Offset: 0x2310
// Size: 0x2a
function private function_3133f922(entity) {
    entity.var_7b0667d9 = 1;
    entity.locked_enemy = entity.favoriteenemy;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x5730d696, Offset: 0x2348
// Size: 0x372
function private function_d82de95f(entity) {
    var_d7c9d429 = spawnstruct();
    var_d7c9d429.favoriteenemy = entity.locked_enemy;
    blackboard::addblackboardevent("geg_shield_attack", var_d7c9d429, randomintrange(2000, 3000));
    entity notify(#"gegenees_shield_blast");
    entity clientfield::increment("gegenees_shield_blast_effect");
    if (isdefined(entity.locked_enemy)) {
        hit_enemy = 1;
        blast_origin = entity gettagorigin("j_gegenees_shield");
        forward_angles = anglestoforward(entity.angles);
        if (isdefined(blast_origin) && isdefined(forward_angles)) {
            end_pos = blast_origin + forward_angles * 1200;
            test_origin = entity.locked_enemy getcentroid();
            radial_origin = pointonsegmentnearesttopoint(blast_origin, end_pos, test_origin);
            var_caf24228 = distancesquared(test_origin, radial_origin);
            if (var_caf24228 > 4096) {
                hit_enemy = 0;
            }
            hit_enemy = bullettracepassed(blast_origin, test_origin, 0, undefined);
            if (hit_enemy) {
                player = entity.locked_enemy;
                if (isplayer(player)) {
                    player status_effect::status_effect_apply(getstatuseffect(#"hash_706608d269d2fefc"), undefined, entity, undefined, 2000);
                    player thread function_60164697();
                    player clientfield::increment_to_player("gegenees_damage_cf");
                    if (level.doa.world_state != 0) {
                        player dodamage(75, player.origin);
                    }
                    vec = vectornormalize(player.origin - entity.origin) * 1500 + (0, 0, 100);
                    player setvelocity(vec);
                    player playrumbleonentity("zombietron_booster_rumble");
                } else {
                    player dodamage(1500, player.origin);
                }
            }
        }
    }
    entity.shielddamage = 0;
    entity.locked_enemy = undefined;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 0, eflags: 0x6 linked
// Checksum 0xc6c8d5cd, Offset: 0x26c8
// Size: 0x76
function private function_60164697() {
    self endon(#"death", #"disconnect");
    time = gettime() + 2000;
    while (true) {
        if (gettime() > time) {
            break;
        }
        self playrumbleonentity("damage_heavy");
        waitframe(1);
    }
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0xff09aed3, Offset: 0x2748
// Size: 0x16
function private function_564b9cf5(entity) {
    entity.var_7b0667d9 = 0;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 2, eflags: 0x6 linked
// Checksum 0xe1a396e2, Offset: 0x2768
// Size: 0xf0
function private function_2301c0a7(entity, asmstatename) {
    entity.track_enemy = 1;
    entity.var_1ec6ea5d = gettime() + int(entity ai::function_9139c839().var_3422adfd * 1000);
    entity.var_292d3a3b = gettime() + int(entity ai::function_9139c839().var_5d9f2696 * 1000);
    entity clientfield::set("gegenees_shield_guard_effect", 1);
    /#
        entity.var_89b5e1e = 0;
    #/
    animationstatenetworkutility::requeststate(entity, asmstatename);
    return 5;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 2, eflags: 0x6 linked
// Checksum 0x9c72b05e, Offset: 0x2860
// Size: 0x7c
function private function_c2155e05(entity, *asmstatename) {
    if (is_true(asmstatename.track_enemy)) {
        if (isdefined(asmstatename.var_292d3a3b)) {
            if (gettime() > asmstatename.var_292d3a3b) {
                asmstatename.track_enemy = 0;
            }
        }
    }
    if (isdefined(asmstatename.var_1ec6ea5d)) {
        if (gettime() < asmstatename.var_1ec6ea5d) {
            return 5;
        }
    }
    return 4;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 2, eflags: 0x6 linked
// Checksum 0xd693032, Offset: 0x28e8
// Size: 0x38
function private function_15502a5(entity, *asmstatename) {
    asmstatename clientfield::set("gegenees_shield_guard_effect", 0);
    return 4;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x46dd7e76, Offset: 0x2928
// Size: 0x5a
function private function_7505908b(entity) {
    entity.var_7b0667d9 = 1;
    entity clientfield::set("gegenees_spear_tip_tell_effect", 1);
    entity.tell_fx = 1;
    entity.tell_off = gettime() + 250;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x9350cfe, Offset: 0x2990
// Size: 0x64
function private function_9175e656(entity) {
    if (is_true(entity.tell_fx)) {
        if (gettime() > entity.tell_off) {
            entity.tell_fx = 0;
            entity clientfield::set("gegenees_spear_tip_tell_effect", 0);
        }
    }
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0xac846785, Offset: 0x2a00
// Size: 0x16
function private function_c81af561(entity) {
    entity.var_7b0667d9 = 0;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x6d9416e6, Offset: 0x2a20
// Size: 0x144
function private function_d5d3aa77(entity) {
    enemy = entity.favoriteenemy;
    if (isdefined(enemy) && isalive(enemy)) {
        if (entity.health / entity.maxhealth < 0.75) {
            entity setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
        } else {
            dist_sq = distancesquared(entity.origin, enemy.origin);
            if (dist_sq > 302500) {
                entity setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
            }
            if (dist_sq < 202500) {
                entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
            }
        }
        return;
    }
    entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x4126f17b, Offset: 0x2b70
// Size: 0x84
function private function_4334cc3b(*entity) {
    if (isdefined(self)) {
        if (!isdefined(self.var_c63e2811)) {
            self.var_c63e2811 = 0;
        }
        if (self.var_c63e2811 > gettime()) {
            self setblackboardattribute("_gegenees_shield", "shield_up");
            return;
        }
        self setblackboardattribute("_gegenees_shield", "shield_down");
    }
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x51f6a4a, Offset: 0x2c00
// Size: 0xf6
function private function_a953d80d(entity) {
    zombiesarray = getaiarchetypearray(#"zombie");
    zombiesarray = array::filter(zombiesarray, 0, &function_3d752709, entity);
    foreach (zombie in zombiesarray) {
        zombie namespace_250e9486::setup_zombie_knockdown(self);
        zombie.knockdown_type = "knockdown_shoved";
    }
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 2, eflags: 0x6 linked
// Checksum 0xfd036e7a, Offset: 0x2d00
// Size: 0x188
function private function_3d752709(enemy, target) {
    if (is_true(enemy.knockdown)) {
        return false;
    }
    if (gibserverutils::isgibbed(enemy, 384)) {
        return false;
    }
    if (distancesquared(enemy.origin, target.origin) > sqr(self ai::function_9139c839().var_ef908ac8)) {
        return false;
    }
    facingvec = anglestoforward(target.angles);
    enemyvec = enemy.origin - target.origin;
    var_3e3c8075 = (enemyvec[0], enemyvec[1], 0);
    var_c2ee8451 = (facingvec[0], facingvec[1], 0);
    var_3e3c8075 = vectornormalize(var_3e3c8075);
    var_c2ee8451 = vectornormalize(var_c2ee8451);
    enemydot = vectordot(var_c2ee8451, var_3e3c8075);
    if (enemydot < 0) {
        return false;
    }
    return true;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 5, eflags: 0x2 linked
// Checksum 0xf737545b, Offset: 0x2e90
// Size: 0xc4
function function_d645d2ec(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    if (isdefined(mocompduration.locked_enemy)) {
        to_enemy = mocompduration.locked_enemy.origin - mocompduration.origin;
        angles_to_enemy = vectortoangles(to_enemy);
        mocompduration orientmode("face angle", angles_to_enemy);
        return;
    }
    mocompduration orientmode("face current");
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 5, eflags: 0x2 linked
// Checksum 0xb3a67443, Offset: 0x2f60
// Size: 0xdc
function function_f6bb8a07(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    if (is_true(mocompduration.track_enemy)) {
        if (isdefined(mocompduration.locked_enemy)) {
            to_enemy = mocompduration.locked_enemy.origin - mocompduration.origin;
            angles_to_enemy = vectortoangles(to_enemy);
            mocompduration orientmode("face angle", angles_to_enemy);
        }
        return;
    }
    mocompduration orientmode("face current");
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 5, eflags: 0x2 linked
// Checksum 0xdedd0caa, Offset: 0x3048
// Size: 0x4c
function function_64c4573(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    mocompduration orientmode("face default");
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x54936d11, Offset: 0x30a0
// Size: 0x11c
function private function_c3c86ec1(entity) {
    hitent = entity melee();
    /#
        record3dtext("<unknown string>", self.origin, (1, 0, 0), "<unknown string>", entity);
    #/
    if (isdefined(hitent)) {
        if (isplayer(hitent) && hitent.birthtime < gettime()) {
            entity function_376a5549(hitent);
            hitent clientfield::increment_to_player("gegenees_damage_cf");
            return;
        }
        if (!is_true(hitent.boss)) {
            hitent dodamage(1000, hitent.origin);
        }
    }
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x5fc23bd7, Offset: 0x31c8
// Size: 0xa4
function private function_376a5549(enemy) {
    forward = anglestoforward(self.angles);
    velocity = enemy getvelocity();
    push_strength = 500;
    push_strength = 200 + randomint(push_strength - 200);
    enemy setvelocity(velocity + forward * push_strength);
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 0, eflags: 0x2 linked
// Checksum 0x3fcf383a, Offset: 0x3278
// Size: 0x76
function function_59e9f77b() {
    if (is_true(self.var_cc7959e1)) {
        self clientfield::set("gegenees_spear_tip_effect", 0);
        var_1a3b2274 = "c_t8_zmb_dlc2_gegenees_spear";
        self detach(var_1a3b2274, "tag_inhand");
        self.var_cc7959e1 = 0;
    }
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 0, eflags: 0x2 linked
// Checksum 0x926d9fdb, Offset: 0x32f8
// Size: 0x84
function function_d06af584() {
    if (!is_true(self.var_cc7959e1)) {
        var_1a3b2274 = "c_t8_zmb_dlc2_gegenees_spear";
        self attach(var_1a3b2274, "tag_inhand");
        self.var_cc7959e1 = 1;
        self clientfield::set("gegenees_spear_tip_effect", 1);
    }
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 13, eflags: 0x6 linked
// Checksum 0x72e40da7, Offset: 0x3388
// Size: 0x620
function private function_ca5688e3(inflictor, attacker, damage, idflags, meansofdeath, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex) {
    if (isdefined(boneindex)) {
        bonename = getpartname(self, boneindex);
        if (bonename === "j_gegenees_shield") {
            if (isdefined(dir) && isdefined(point)) {
                forward = dir * -1;
                dot = vectordot(forward, (0, 0, 1));
                if (!(dot > 0.95 || dot < -0.95)) {
                    playfx("impacts/fx8_bul_impact_metal_sm", point, dir * -1, (0, 0, 1));
                }
                if (isdefined(point)) {
                    if (namespace_ec06fe4a::function_a8975c67()) {
                        playsoundatposition(#"hash_72db6f3f0e602a33", point);
                    }
                }
            }
            self namespace_ec06fe4a::function_2f4b0f9(self.health);
            return 0;
        }
    }
    var_786d7e06 = namespace_250e9486::function_422fdfd4(self, attacker, weapon, boneindex, hitloc, point);
    var_dd54fdb1 = var_786d7e06.var_84ed9a13;
    var_88e794fb = var_786d7e06.registerzombie_bgb_used_reinforce;
    level.var_d7e2833c = var_786d7e06.damage_scale > 1;
    adjusted_damage = int(damage * var_786d7e06.damage_scale);
    if (isdefined(var_dd54fdb1)) {
        if (isdefined(var_dd54fdb1.var_8223b0cf) && var_dd54fdb1.var_8223b0cf > 0) {
            level.var_d7e2833c = var_786d7e06.damage_scale > 1 || var_dd54fdb1.var_8223b0cf > 1;
            adjusted_damage = int(damage * var_786d7e06.damage_scale * var_dd54fdb1.var_8223b0cf);
        }
        if (var_88e794fb) {
            namespace_81245006::function_ef87b7e8(var_dd54fdb1, adjusted_damage);
            if (namespace_81245006::function_f29756fe(var_dd54fdb1) === 3) {
                self destructserverutils::handledamage(inflictor, attacker, damage, idflags, meansofdeath, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex);
                if (var_dd54fdb1.hitloc === "helmet") {
                    var_465efe42 = namespace_81245006::function_37e3f011(self, "j_head", 2);
                    namespace_81245006::function_6c64ebd3(var_465efe42, 1);
                    self.var_d64b7af0 = 1;
                    if (self isattached("c_t8_zmb_dlc2_gegenees_helmet1", "j_head")) {
                        self detach("c_t8_zmb_dlc2_gegenees_helmet1", "j_head");
                    }
                    self clientfield::set("gegenees_helmet_explosion_cf", 1);
                }
                if (is_true(var_dd54fdb1.var_641ce20e)) {
                    namespace_81245006::function_6742b846(self, var_dd54fdb1);
                }
            }
            if (var_dd54fdb1.type === #"armor") {
                attacker util::show_hit_marker(!isalive(self));
                if (isdefined(dir) && isdefined(point)) {
                    playfx("impacts/fx8_bul_impact_metal_sm", point, dir * -1);
                }
                self namespace_ec06fe4a::function_2f4b0f9(self.health);
                return 0;
            } else if (is_true(var_dd54fdb1.activebydefault)) {
                if (isdefined(dir) && isdefined(point)) {
                    playfx("zm_ai/fx8_gegenees_weakpoint_impact", point, dir * -1);
                }
            }
        }
    }
    if (!isdefined(self.shielddamage)) {
        self.shielddamage = adjusted_damage;
    } else {
        self.shielddamage += adjusted_damage;
    }
    self.var_a9716e54 += adjusted_damage;
    if (self.var_a9716e54 >= 500) {
        self.var_a9716e54 = 0;
        self function_9a05389e();
    }
    var_799e18e5 = point;
    var_5f32808d = 1;
    if (adjusted_damage >= 1000) {
        var_5f32808d = 2;
    }
    self namespace_ec06fe4a::function_2f4b0f9(self.health - adjusted_damage, attacker, var_799e18e5, adjusted_damage, var_5f32808d);
    return adjusted_damage;
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 1, eflags: 0x6 linked
// Checksum 0x6949be97, Offset: 0x39b0
// Size: 0x5c
function private function_a231dd3b(*s_params) {
    if (!isdefined(self) || self.archetype !== #"gegenees") {
        return;
    }
    self val::set(#"gegenees_death", "takedamage", 0);
}

// Namespace namespace_514c8ebc/namespace_514c8ebc
// Params 0, eflags: 0x2 linked
// Checksum 0x8c0d5ee5, Offset: 0x3a18
// Size: 0x16
function function_9a05389e() {
    self.var_c63e2811 = gettime() + 4000;
}

