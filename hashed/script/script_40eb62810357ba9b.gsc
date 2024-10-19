// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\ai\archetype_brutus.gsc;
#using script_2a5bf5b4a00cee0d;
#using script_164a456ce05c3483;
#using script_5f20d3b434d24884;
#using script_47851dbeea22fe66;
#using script_1ee011cd0961afd7;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\ai\systems\blackboard.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_df4fbf0;

// Namespace namespace_df4fbf0/namespace_df4fbf0
// Params 0, eflags: 0x2 linked
// Checksum 0x99aee676, Offset: 0x250
// Size: 0xbe
function init() {
    namespace_250e9486::function_252dff4d("brutus", 2, &function_8b038048, undefined, 49, &function_c610e461);
    clientfield::register("toplayer", "brutus_shock_attack_player", 1, 1, "counter");
    clientfield::register("actor", "brutus_shock_attack", 1, 1, "counter");
    registerbehaviorscriptfunctions();
    level.doa.var_36fba6 = [];
}

// Namespace namespace_df4fbf0/namespace_df4fbf0
// Params 0, eflags: 0x2 linked
// Checksum 0x8578748b, Offset: 0x318
// Size: 0x234
function registerbehaviorscriptfunctions() {
    assert(isscriptfunctionptr(&namespace_250e9486::function_abb6c18a));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_67cf14163bf00d16", &namespace_250e9486::function_abb6c18a);
    assert(isscriptfunctionptr(&namespace_250e9486::function_99ed5179));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_14f093af5e75dca1", &namespace_250e9486::function_99ed5179);
    assert(isscriptfunctionptr(&namespace_250e9486::function_50547dae));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_23de4beb58b2ce65", &namespace_250e9486::function_50547dae);
    assert(isscriptfunctionptr(&function_3bda3c55));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_43c922ea035ca163", &function_3bda3c55);
    assert(isscriptfunctionptr(&function_f4a61e6a));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7cdf61f23f735254", &function_f4a61e6a);
    animationstatenetwork::registernotetrackhandlerfunction("hit_ground", &function_85e8940a);
}

// Namespace namespace_df4fbf0/namespace_df4fbf0
// Params 0, eflags: 0x2 linked
// Checksum 0x58a07b6e, Offset: 0x558
// Size: 0x5c
function function_c610e461() {
    function_1eaaceab(level.doa.var_36fba6);
    if (level.doa.world_state == 0) {
        return (level.doa.var_36fba6.size < 16);
    }
    return true;
}

// Namespace namespace_df4fbf0/namespace_df4fbf0
// Params 0, eflags: 0x2 linked
// Checksum 0x122aa02a, Offset: 0x5c0
// Size: 0x26c
function function_8b038048() {
    namespace_250e9486::function_25b2c8a9();
    self.var_9329a57c = 0;
    self.health = 50000;
    self.var_f979e699 = 350;
    self.doa.var_74e4ded8 = 1;
    self.var_c7121c91 = 1;
    self.var_4dcf6637 = 1;
    self.var_1c8b76d3 = 1;
    self.no_gib = 1;
    self.var_32c5c724 = 1;
    self.zombie_move_speed = "walk";
    self.maxhealth = self.health;
    self.shock_status_effect = getstatuseffect(#"hash_19533caf858a9f3b");
    self thread damagewatch();
    self thread function_79445831();
    if (level.doa.world_state == 0) {
        if (!isdefined(level.doa.var_36fba6)) {
            level.doa.var_36fba6 = [];
        } else if (!isarray(level.doa.var_36fba6)) {
            level.doa.var_36fba6 = array(level.doa.var_36fba6);
        }
        level.doa.var_36fba6[level.doa.var_36fba6.size] = self;
        var_e7ef13a3 = undefined;
        if (isdefined(level.doa.var_dce49f12)) {
            spot = [[ level.doa.var_dce49f12 ]]();
            if (isdefined(spot)) {
                var_e7ef13a3 = spot.origin;
            }
        }
        self thread namespace_250e9486::function_e10af211(var_e7ef13a3, "gem_trail_red", "turret_impact", 1);
        self.var_e020e658 = 1;
    }
    self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_brutus_spawn");
}

// Namespace namespace_df4fbf0/namespace_df4fbf0
// Params 0, eflags: 0x2 linked
// Checksum 0x85fa7322, Offset: 0x838
// Size: 0xdc
function damagewatch() {
    self notify("644a96dd6868c931");
    self endon("644a96dd6868c931");
    self endon(#"death");
    result = self waittill(#"damage", #"nuked");
    self.goalradius = 42;
    if (self.zombie_move_speed == "walk") {
        self.var_8766b29b = 1;
    }
    self.zombie_move_speed = "run";
    if (result._notify === "nuked") {
        self dodamage(1000, self.origin);
    }
}

// Namespace namespace_df4fbf0/namespace_df4fbf0
// Params 0, eflags: 0x2 linked
// Checksum 0x6628421, Offset: 0x920
// Size: 0x54
function function_79445831() {
    self notify("4ce673b7273d3482");
    self endon("4ce673b7273d3482");
    self waittill(#"death");
    if (isdefined(self)) {
        self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_brutus_death");
    }
}

// Namespace namespace_df4fbf0/namespace_df4fbf0
// Params 1, eflags: 0x6 linked
// Checksum 0x4c9d9ea8, Offset: 0x980
// Size: 0x13e
function private function_3bda3c55(entity) {
    if (!isdefined(entity)) {
        return false;
    }
    if (is_true(entity.var_e020e658)) {
        return false;
    }
    if (is_true(entity.var_8766b29b)) {
        entity.var_8766b29b = undefined;
        return true;
    }
    if (!isdefined(entity.var_9329a57c)) {
        entity.var_9329a57c = 0;
    }
    if (entity.var_9329a57c > gettime()) {
        return false;
    }
    if (!isdefined(entity.favoriteenemy)) {
        return false;
    }
    if (abs(entity.origin[2] - entity.favoriteenemy.origin[2]) > 72) {
        return false;
    }
    if (distance2dsquared(entity.origin, entity.favoriteenemy.origin) > sqr(200)) {
        return false;
    }
    return true;
}

// Namespace namespace_df4fbf0/namespace_df4fbf0
// Params 1, eflags: 0x6 linked
// Checksum 0xd61ff217, Offset: 0xac8
// Size: 0x4e
function private function_f4a61e6a(entity) {
    entity.var_9329a57c = gettime() + int(entity ai::function_9139c839().var_d5427206 * 1000);
}

// Namespace namespace_df4fbf0/namespace_df4fbf0
// Params 1, eflags: 0x6 linked
// Checksum 0x8b29877c, Offset: 0xb20
// Size: 0x2e8
function private function_85e8940a(entity) {
    var_aa6baab8 = entity ai::function_9139c839().var_1709a39;
    players = getplayers(#"all", entity.origin, var_aa6baab8);
    entity clientfield::increment("brutus_shock_attack", 1);
    foreach (player in players) {
        if (!namespace_7f5aeb59::isplayervalid(player)) {
            continue;
        }
        if (player.origin[2] - entity.origin[2] < -32) {
            continue;
        }
        if (player.origin[2] - entity.origin[2] > 200) {
            continue;
        }
        var_ed9fd11e = player gettagorigin("j_spine4");
        if (!isdefined(var_ed9fd11e) || !bullettracepassed(entity.origin, var_ed9fd11e, 0, entity, player)) {
            continue;
        }
        damage = mapfloat(entity getpathfindingradius() + 15, entity ai::function_9139c839().var_1709a39, 90, 20, distance(entity.origin, player.origin));
        damage = int(max(20, damage));
        player dodamage(damage, entity.origin, entity, entity, "none", "MOD_PROJECTILE_SPLASH");
        player thread status_effect::status_effect_apply(self.shock_status_effect, undefined, self, 0);
        player clientfield::increment_to_player("brutus_shock_attack_player", 1);
    }
}

