// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\statemachine_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_77b8863;

// Namespace namespace_77b8863/namespace_77b8863
// Params 0, eflags: 0x5
// Checksum 0x266f03d0, Offset: 0x190
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"hash_60e9e594b4389b03", &preinit, undefined, undefined, undefined);
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 0, eflags: 0x6 linked
// Checksum 0xd4852f0a, Offset: 0x1d8
// Size: 0x8c
function private preinit() {
    vehicle::add_main_callback(#"dust_ball", &function_c346ef73);
    clientfield::register("scriptmover", "towers_boss_dust_ball_fx", 1, getminbitcountfornum(4), "int");
    /#
        level thread update_dvars();
    #/
}

/#

    // Namespace namespace_77b8863/namespace_77b8863
    // Params 0, eflags: 0x0
    // Checksum 0x761b7b7c, Offset: 0x270
    // Size: 0x8
    function update_dvars() {
        
    }

#/

// Namespace namespace_77b8863/namespace_77b8863
// Params 0, eflags: 0x2 linked
// Checksum 0xfe37fc74, Offset: 0x280
// Size: 0xa4
function function_c346ef73() {
    self.settings = getscriptbundle(self.scriptbundlesettings);
    self.var_1dab821a = 0;
    self useanimtree("generic");
    if (isdefined(self.owner)) {
        self setteam(self.owner.team);
    }
    self setneargoalnotifydist(60);
    defaultrole();
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 0, eflags: 0x2 linked
// Checksum 0x7e0abce2, Offset: 0x330
// Size: 0x1d4
function defaultrole() {
    statemachine = self vehicle_ai::init_state_machine_for_role("default");
    statemachine statemachine::add_state("seek", &function_9ddc7275, &function_3e16dec3, &function_64f7393f);
    statemachine statemachine::add_state("soul", &function_3f83eb6, &function_e452a40c, &function_22828012);
    self vehicle_ai::get_state_callbacks("death").update_func = &state_death_update;
    self val::set(#"dust_ball", "takedamage", 0);
    self.takedamage = 0;
    self vehicle_ai::call_custom_add_state_callbacks();
    self.fxent = spawn("script_model", self.origin);
    self.fxent setmodel("tag_origin");
    self.fxent linkto(self);
    self.fxent clientfield::set("towers_boss_dust_ball_fx", 1);
    vehicle_ai::startinitialstate("seek");
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 0, eflags: 0x2 linked
// Checksum 0x4b0e1362, Offset: 0x510
// Size: 0x1a
function function_d3a9800e() {
    return self.origin + (0, 0, 30);
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 1, eflags: 0x2 linked
// Checksum 0x5dc5fa68, Offset: 0x538
// Size: 0x56
function waittill_pathing_done(maxtime = 15) {
    self endon(#"death");
    self endon(#"change_state");
    self waittilltimeout(maxtime, #"near_goal");
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 0, eflags: 0x2 linked
// Checksum 0xa74e453, Offset: 0x598
// Size: 0x8c
function function_f2fd92d1() {
    if (isdefined(self.favoriteenemy)) {
        target_pos = self.favoriteenemy.origin;
    }
    if (isdefined(target_pos)) {
        target_pos_onnavmesh = getclosestpointonnavmesh(target_pos, 20, self.radius, 4194287);
    }
    if (isdefined(target_pos_onnavmesh)) {
        return target_pos_onnavmesh;
    }
    if (isdefined(self.current_pathto_pos)) {
        return self.current_pathto_pos;
    }
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 1, eflags: 0x2 linked
// Checksum 0x88ef9e63, Offset: 0x630
// Size: 0x7c
function function_3f83eb6(*params) {
    self.fxent unlink();
    self.fxent linkto(self, "tag_origin", (0, 0, 50));
    self.fxent clientfield::set("towers_boss_dust_ball_fx", 3);
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 1, eflags: 0x2 linked
// Checksum 0xfb6d14a6, Offset: 0x6b8
// Size: 0x128
function function_e452a40c(*params) {
    self endon(#"death");
    self setneargoalnotifydist(40);
    while (true) {
        if (!isdefined(self.ai.var_a38db64f)) {
            waitframe(1);
            continue;
        }
        self setspeed(self.settings.var_9eff22ee);
        self setbrake(0);
        self function_a57c34b7(self.ai.var_a38db64f, 1, 1);
        self waittilltimeout(30, #"near_goal");
        if (isdefined(self.fxent)) {
            self.fxent delete();
        }
        self delete();
    }
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 1, eflags: 0x2 linked
// Checksum 0xa303e6af, Offset: 0x7e8
// Size: 0xc
function function_22828012(*params) {
    
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 1, eflags: 0x2 linked
// Checksum 0xd85dcce3, Offset: 0x800
// Size: 0xbc
function function_9ddc7275(*params) {
    self.var_33506050 = undefined;
    self.favoriteenemy = undefined;
    duration = 2;
    self.var_373d5c91 = gettime() + int(duration * 1000);
    self thread function_ef0bfb9d();
    self thread function_419f8ccb();
    if (isdefined(self.settings.var_d76543dd)) {
        self playloopsound(self.settings.var_d76543dd);
    }
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 1, eflags: 0x2 linked
// Checksum 0xc2839251, Offset: 0x8c8
// Size: 0x24
function function_64f7393f(*params) {
    self stoploopsound();
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 0, eflags: 0x2 linked
// Checksum 0x4ec56ecd, Offset: 0x8f8
// Size: 0x1a
function function_78b6454d() {
    if (gettime() > self.var_373d5c91) {
        return true;
    }
    return false;
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 1, eflags: 0x2 linked
// Checksum 0xf83f264f, Offset: 0x920
// Size: 0x146
function function_3e16dec3(*params) {
    self endon(#"death");
    self endon(#"change_state");
    for (;;) {
        if (isdefined(self.favoriteenemy)) {
            if (isdefined(self.settings.var_cfe1cc83)) {
                self playloopsound(self.settings.var_cfe1cc83);
            }
            self.current_pathto_pos = self function_f2fd92d1();
            if (isdefined(self.current_pathto_pos)) {
                self setspeed(self.settings.var_9eff22ee);
                self setbrake(0);
                self function_a57c34b7(self.current_pathto_pos, 1, 1);
                self waittill_pathing_done(1);
                continue;
            }
        } else {
            self function_55be8453();
        }
        waitframe(1);
    }
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 0, eflags: 0x2 linked
// Checksum 0xceb1e768, Offset: 0xa70
// Size: 0x296
function function_ef0bfb9d() {
    self endon(#"death");
    self endon(#"change_state");
    wait(0.5);
    while (true) {
        enemies = function_f6f34851(self.team);
        alltargets = arraysort(enemies, self function_d3a9800e(), 1);
        zombiesarray = getaiarchetypearray(#"zombie");
        zombiesarray = arraycombine(zombiesarray, getaiarchetypearray(#"catalyst"), 0, 0);
        alltargets = arraycombine(zombiesarray, alltargets, 0, 0);
        foreach (target in alltargets) {
            distsqtotarget = distancesquared(target.origin, self function_d3a9800e());
            if (distsqtotarget <= sqr(self.settings.damage_radius)) {
                if (isdefined(target.archetype)) {
                    target zombie_utility::setup_zombie_knockdown(self);
                    target.knockdown_type = "knockdown_shoved";
                    continue;
                }
                target dodamage(self.settings.var_274be2d6, self.origin, self, self, "", "MOD_IMPACT", 0);
            }
        }
        physicsexplosionsphere(self.origin, 200, 100, 2);
        waitframe(1);
    }
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 1, eflags: 0x2 linked
// Checksum 0x4fc650ae, Offset: 0xd10
// Size: 0xcc
function function_413aacb3(target) {
    var_7588d977 = getaiarchetypearray(#"dust_ball");
    foreach (dustball in var_7588d977) {
        if (dustball == self) {
            continue;
        }
        if (dustball.favoriteenemy === target) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 0, eflags: 0x2 linked
// Checksum 0xeec51ede, Offset: 0xde8
// Size: 0x2ce
function function_55be8453() {
    self endon(#"death");
    self endon(#"change_state");
    wait(0.5);
    if (isdefined(self.favoriteenemy)) {
        if (util::within_fov(self.origin, self.angles, self.favoriteenemy.origin, 0.939)) {
            distsqtotarget = distancesquared(self.favoriteenemy.origin, self function_d3a9800e());
            if (distsqtotarget <= 10000) {
                return;
            }
        }
    }
    enemies = function_f6f34851(self.team);
    alltargets = arraysort(enemies, self function_d3a9800e(), 1);
    foreach (target in alltargets) {
        angles = self.angles;
        if (self function_413aacb3(target)) {
            continue;
        }
        if (util::within_fov(self.origin, angles, target.origin, 0)) {
            self.favoriteenemy = target;
            return;
        }
    }
    foreach (target in alltargets) {
        distsqtotarget = distancesquared(target.origin, self function_d3a9800e());
        if (distsqtotarget <= 10000) {
            self.favoriteenemy = target;
            return;
        }
    }
    if (alltargets.size && isdefined(alltargets[0])) {
        self.favoriteenemy = alltargets[0];
    }
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 0, eflags: 0x2 linked
// Checksum 0xfdb1fb53, Offset: 0x10c0
// Size: 0x166
function function_419f8ccb() {
    self endon(#"death");
    self endon(#"change_state");
    for (;;) {
        if (self function_78b6454d()) {
            self vehicle_ai::set_state("death");
        }
        if (isdefined(self.favoriteenemy)) {
            distfromplayer = distancesquared(self.origin, self.favoriteenemy.origin);
            if (distfromplayer < sqr(self.settings.var_2c001f55) && !is_true(self.var_8d5279eb)) {
                self.fxent clientfield::set("towers_boss_dust_ball_fx", 2);
                self.var_8d5279eb = 1;
            }
            if (distfromplayer < sqr(self.settings.var_7e3165c1)) {
                self vehicle_ai::set_state("death");
            }
        }
        waitframe(1);
    }
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 1, eflags: 0x2 linked
// Checksum 0x17faaf3b, Offset: 0x1230
// Size: 0x2c
function function_469f1e03(fxent) {
    wait(0.1);
    fxent delete();
}

// Namespace namespace_77b8863/namespace_77b8863
// Params 1, eflags: 0x2 linked
// Checksum 0x50b49629, Offset: 0x1268
// Size: 0xbc
function state_death_update(params) {
    self.fxent clientfield::set("towers_boss_dust_ball_fx", 0);
    if (isdefined(level.var_c6001986)) {
        [[ level.var_c6001986 ]](self);
    }
    fxent = self.fxent;
    vehicle_ai::defaultstate_death_update(params);
    wait(2);
    if (isdefined(fxent)) {
        level thread function_469f1e03(fxent);
    }
    if (isdefined(self)) {
        self delete();
    }
}

