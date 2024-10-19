// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\bots\bot_action.gsc;
#using scripts\core_common\bots\bot.gsc;

#namespace bot_actions;

// Namespace bot_actions/bot_actions
// Params 0, eflags: 0x2 linked
// Checksum 0xe370327e, Offset: 0xb8
// Size: 0x5a
function preinit() {
    if (!isdefined(level.gametype)) {
        return;
    }
    switch (level.gametype) {
    default:
        function_9cefb01();
        break;
    }
}

// Namespace bot_actions/bot_actions
// Params 0, eflags: 0x6 linked
// Checksum 0xbf6254a6, Offset: 0x120
// Size: 0x27c
function private function_9cefb01() {
    bot_action::register_action(#"melee", &function_97bc2873, &melee);
    bot_action::register_action(#"reload", &function_bebdaa6b, &reload);
    bot_action::register_action(#"hash_3d30e77358b222bb", &function_6ba9f861, &function_22e246dd);
    bot_action::register_action(#"hash_7a087406b369e0b2", &function_9575b14a, &function_5be2fa6e);
    bot_action::register_action(#"hash_f2de979f0460355", &function_9f7ee32b, &function_f60b48cd);
    bot_action::register_action(#"hash_760170d9e327711f", &function_d31a5b9a, &function_3aab44a3);
    bot_action::register_action(#"hash_432f1b491c530184", &function_96340252, &function_c49cdd53);
    if ((isdefined(getgametypesetting(#"allowlaststandforactiveclients")) ? getgametypesetting(#"allowlaststandforactiveclients") : 0) || getdvarint(#"g_allowlaststandforactiveclients", 0)) {
        bot_action::register_action(#"revive", &function_5040c5b8, &revive);
    }
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0x1ba62362, Offset: 0x3a8
// Size: 0x460
function private function_bebdaa6b(actionparams) {
    weapon = self getcurrentweapon();
    /#
        actionparams.debug[actionparams.debug.size] = getweaponname(weapon);
    #/
    if (weapon.clipsize <= 0) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_6cc185a34e14aed8";
        #/
        return undefined;
    }
    if (weapon.iscliponly) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_4e551057548eeffb";
        #/
        return undefined;
    }
    clipammo = self getweaponammoclip(weapon);
    stockammo = self getweaponammostock(weapon);
    /#
        actionparams.debug[actionparams.debug.size] = #"hash_649eec90cdc06cdd" + clipammo + "<unknown string>" + weapon.clipsize + "<unknown string>" + stockammo;
    #/
    if (clipammo >= weapon.clipsize) {
        return undefined;
    }
    var_1cc50542 = clipammo / weapon.clipsize;
    var_7b03547c = clipammo < 10 && var_1cc50542 < 0.4;
    if (var_7b03547c) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_3e095e0ff2b45cd";
        #/
    }
    if (self isreloading()) {
        /#
            actionparams.debug[actionparams.debug.size] = #"in progress";
        #/
        if (var_7b03547c) {
            return 95;
        }
    }
    if (stockammo <= 0) {
        return undefined;
    }
    if (clipammo > 0 && self.combatstate != #"combat_state_idle") {
        if (self bot_action::in_combat(actionparams) || !var_7b03547c) {
            return undefined;
        }
    }
    if (self bot_action::function_a43bc7e2(actionparams) || self bot_action::function_ebb8205b(actionparams) || self bot_action::flashed(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams)) {
        return undefined;
    }
    /#
        if (getdvarint(#"bot_forcefire", 0)) {
            /#
                actionparams.debug[actionparams.debug.size] = #"hash_3e0a83260046323b";
            #/
            return undefined;
        }
        if (getdvarint(#"hash_7140b31f7170f18b", 0)) {
            /#
                actionparams.debug[actionparams.debug.size] = function_9e72a96(#"hash_7140b31f7170f18b") + "<unknown string>";
            #/
            return undefined;
        }
        if (is_true(self.bot.var_458ddbc0[0])) {
            /#
                actionparams.debug[actionparams.debug.size] = #"hash_3eae9d22b23d42b0";
            #/
            return undefined;
        }
    #/
    return 95;
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0xf78bd2c7, Offset: 0x810
// Size: 0x8e
function private reload(*actionparams) {
    self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
    while (true) {
        if (!self isreloading()) {
            self bottapbutton(4);
        }
        self waittill(#"hash_77f2882ff9140e86");
    }
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0xee6fae91, Offset: 0x8a8
// Size: 0x1c8
function private function_6ba9f861(actionparams) {
    /#
        actionparams.debug[actionparams.debug.size] = #"hash_51e16bdecd933178" + self function_e8e1d88e();
    #/
    if (!isdefined(self.bot.var_538135ed)) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_72064563ae580ae7";
        #/
        return undefined;
    }
    /#
        actionparams.debug[actionparams.debug.size] = #"hash_4d12c107453cb454";
    #/
    if (self bot_action::function_a43bc7e2(actionparams) || self bot_action::function_ebb8205b(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams) || self bot_action::function_ed7b2f42(actionparams)) {
        return undefined;
    }
    object = self.bot.var_538135ed.gameobject;
    trigger = object.trigger;
    if (!isdefined(trigger) || !self function_e02bffcd(trigger)) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_56cc687e292770eb";
        #/
        return undefined;
    }
    return 100;
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0xa45adf, Offset: 0xa78
// Size: 0xfc
function private function_22e246dd(*actionparams) {
    self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
    object = self.bot.var_538135ed.gameobject;
    self.bot.var_9d03fb75 = gettime() + int(2.5 * 1000);
    self.bot.var_fad934a1 = gettime() + int(12 * 1000);
    self use_gameobject(self.bot.var_538135ed.gameobject);
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0x3aba25d0, Offset: 0xb80
// Size: 0x28e
function private function_9575b14a(actionparams) {
    if (!isdefined(level.var_578f7c6d)) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_7e0fd1a337ef84d4";
        #/
        return undefined;
    }
    if (self bot_action::function_a43bc7e2(actionparams) || self bot_action::function_ebb8205b(actionparams) || self bot_action::flashed(actionparams) || self bot_action::in_combat(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams) || self bot_action::function_ed7b2f42(actionparams)) {
        return undefined;
    }
    ents = getentitiesinradius(self.origin, 96, 4);
    weapon = level.var_578f7c6d.weapon;
    jammer = undefined;
    foreach (ent in ents) {
        if (ent.team == self.team || ent.item != weapon) {
            continue;
        }
        jammer = ent;
        break;
    }
    if (!isdefined(jammer) || !isdefined(jammer.enemytrigger) || !self istouching(jammer.enemytrigger)) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_5c3f03b58ee2c60d";
        #/
        return undefined;
    }
    actionparams.jammer = jammer;
    return 100;
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0x4584e1d2, Offset: 0xe18
// Size: 0xa6
function private function_5be2fa6e(actionparams) {
    self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
    while (true) {
        jammer = actionparams.jammer;
        if (isdefined(jammer.enemytrigger)) {
            self use_trigger(jammer.enemytrigger);
        }
        self waittill(#"hash_77f2882ff9140e86");
    }
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0x100d5180, Offset: 0xec8
// Size: 0x1a8
function private function_5040c5b8(actionparams) {
    revivetarget = self bot::get_revive_target();
    if (!isdefined(revivetarget)) {
        /#
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    if (self bot_action::function_ebb8205b(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams) || self bot_action::function_ed7b2f42(actionparams)) {
        return 0;
    }
    actionparams.revivetarget = revivetarget;
    /#
        actionparams.debug[actionparams.debug.size] = #"hash_7c7cb9edd6407d3a" + revivetarget.name;
    #/
    if (!isdefined(revivetarget.revivetrigger)) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_5045506c17e1ba97";
        #/
        return undefined;
    }
    if (!self istouching(revivetarget.revivetrigger)) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_bd44498ec7dd434";
        #/
        return undefined;
    }
    return 100;
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0x2685b710, Offset: 0x1078
// Size: 0x130
function private revive(actionparams) {
    self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
    self.bot.var_6bea1d82 = 1;
    if (!isdefined(self.bot.difficulty) || is_true(self.bot.difficulty.allowcrouch)) {
        self.bot.var_ce28855b = 1;
    }
    revivee = actionparams.revivetarget;
    while (true) {
        self.bot.var_87751145 = revivee.origin;
        self waittill(#"hash_77f2882ff9140e86");
        if (self botgetlookdot() > 0.8) {
            self bottapbutton(3);
        }
    }
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0xeed6a878, Offset: 0x11b0
// Size: 0x5e2
function private function_97bc2873(actionparams) {
    weapon = self getcurrentweapon();
    /#
        actionparams.debug[actionparams.debug.size] = getweaponname(weapon);
    #/
    if (self ismeleeing()) {
        /#
            actionparams.debug[actionparams.debug.size] = #"in progress";
        #/
        return 100;
    }
    if (!weapon.ismeleeweapon && weapon.type != #"melee") {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_5a434ba5ce81ed4b";
        #/
        return undefined;
    }
    if (self bot_action::flashed(actionparams) || self bot_action::function_ebb8205b(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams)) {
        return undefined;
    }
    if (self bot_action::function_ed7b2f42(actionparams) && self.bot.traversal.type != #"drop") {
        return undefined;
    }
    if (isdefined(self.bot.glasstouch)) {
        point = self.bot.glasstouch;
        point = (point[0], point[1], self.origin[2] + self getplayerviewheight());
        actionparams.var_bd773dde = point;
        return 96;
    }
    actionparams.var_bd773dde = undefined;
    if (!(!isdefined(self.bot.difficulty) || is_true(self.bot.difficulty.allowmelee))) {
        if (level.gametype != "gun" || weapon.type != #"melee") {
            /#
                actionparams.debug[actionparams.debug.size] = #"hash_6b201a2b19d09fd";
            #/
            return undefined;
        }
    }
    if (!(!isdefined(self.bot.var_9376be2e) || self.bot.var_9376be2e <= gettime())) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_499c1441b9e70c21";
        #/
        return undefined;
    }
    if (!self.bot.enemyvisible) {
        /#
            actionparams.debug[actionparams.debug.size] = #"no enemy";
        #/
        return undefined;
    }
    if (isvehicle(self.enemy)) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_18edaf9b6eee19a1";
        #/
        return undefined;
    }
    if (isplayer(self.enemy) && self.enemy isinvehicle() && !self.enemy isremotecontrolling()) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_28145be29cdebb73";
        #/
    }
    if (self.bot.enemydist > weapon.var_bfbec33f * 0.95) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_1d62b754bc2de90";
        #/
        return undefined;
    }
    fwd = anglestoforward(self getplayerangles());
    enemydir = vectornormalize(self.enemy.origin - self.origin);
    enemydot = vectordot(fwd, enemydir);
    if (enemydot < 0.7) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_47cdd5472dea843c";
        #/
        return undefined;
    }
    if (randomfloat(1) > 0.75) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_202a436ac21976ce";
        #/
        self.bot.var_9376be2e = gettime() + int(3 * 1000);
        return undefined;
    }
    return 96;
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0x619552f7, Offset: 0x17a0
// Size: 0x15e
function private melee(actionparams) {
    self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
    while (true) {
        var_bd773dde = actionparams.var_bd773dde;
        self.bot.var_87751145 = var_bd773dde;
        if (!self ismeleeing()) {
            self bottapbutton(2);
            self waittill(#"hash_77f2882ff9140e86");
        }
        while (self ismeleeing()) {
            self bottapbutton(2);
            if (isdefined(var_bd773dde) && distance2dsquared(self.origin, var_bd773dde < 15)) {
                self.bot.var_87751145 = undefined;
            }
            self waittill(#"hash_77f2882ff9140e86");
        }
        self.bot.var_9376be2e = gettime() + int(3 * 1000);
    }
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0xba02010d, Offset: 0x1908
// Size: 0xd0
function private function_d31a5b9a(actionparams) {
    if (!isdefined(self.bot.var_ad331541)) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_72617b03a99ed6a3";
        #/
        return undefined;
    }
    if (self bot_action::function_a43bc7e2(actionparams) || self bot_action::function_ebb8205b(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams)) {
        return undefined;
    }
    return 100;
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0x8ffbabd7, Offset: 0x19e0
// Size: 0x1b0
function private function_3aab44a3(*actionparams) {
    self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
    center = self.bot.var_ad331541 getcentroid();
    weapon = self getcurrentweapon();
    meleeweapon = weapon.ismeleeweapon || weapon.type == #"melee";
    if (!meleeweapon || isdefined(self.bot.traversal)) {
        self.bot.var_ad331541 dodamage(10000, center, self, undefined, "MOD_MELEE_WEAPON_BUTT");
        return;
    }
    while (true) {
        self.bot.var_87751145 = center;
        self waittill(#"hash_77f2882ff9140e86");
        if (!self ismeleeing() && self botgetlookdot() >= 0.7) {
            self bottapbutton(2);
        }
    }
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0x8d44b363, Offset: 0x1b98
// Size: 0x138
function private function_96340252(actionparams) {
    if (isdefined(self.bot.var_87a04600) && self.bot.var_87a04600 isusable()) {
        /#
            actionparams.debug[actionparams.debug.size] = #"capturing";
        #/
        return 100;
    }
    if (!isdefined(self.bot.var_510b1057)) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_45918de363b9f172";
        #/
        return undefined;
    }
    if (self bot_action::function_a43bc7e2(actionparams) || self bot_action::function_ebb8205b(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams)) {
        return undefined;
    }
    return 100;
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0xb36509b2, Offset: 0x1cd8
// Size: 0x1a8
function private function_c49cdd53(*actionparams) {
    self endoncallback(&function_84f889a2, #"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
    crate = undefined;
    while (true) {
        var_7485904b = self.bot.var_510b1057;
        if (isdefined(var_7485904b) && var_7485904b !== crate) {
            crate = var_7485904b;
            self.bot.var_87a04600 = crate;
            self.bot.var_87751145 = crate getcentroid();
        }
        self waittill(#"hash_77f2882ff9140e86");
        if (!isdefined(crate) || !crate isusable()) {
            continue;
        }
        if (!self botgetlookdot() >= 0.5) {
            continue;
        }
        self bottapbutton(3);
        if (self usebuttonpressed() && !isdefined(crate.useent.capturingplayer)) {
            crate useby(self);
        }
    }
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0xb59c3d1, Offset: 0x1e88
// Size: 0x26
function private function_84f889a2(*notifyhash) {
    if (isdefined(self.bot)) {
        self.bot.var_87a04600 = undefined;
    }
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0x9e16cfca, Offset: 0x1eb8
// Size: 0x1a8
function private function_9f7ee32b(actionparams) {
    target = self.bot.objective.info.target;
    if (!isdefined(target) || !isdefined(target.triggertype) || target.triggertype != #"use" || !target gameobjects::can_interact_with(self)) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_7c6d555093009c78";
        #/
        return undefined;
    }
    if (self bot_action::function_a43bc7e2(actionparams) || self bot_action::function_ebb8205b(actionparams) || self bot_action::function_a0b0f487(actionparams) || self bot_action::function_2c3ea0c6(actionparams) || self bot_action::in_vehicle(actionparams)) {
        return undefined;
    }
    if (!isdefined(target.trigger) || !self function_e02bffcd(target.trigger)) {
        /#
            actionparams.debug[actionparams.debug.size] = #"hash_56cc687e292770eb";
        #/
        return undefined;
    }
    return 100;
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0xdc4e0c10, Offset: 0x2068
// Size: 0x90
function private function_f60b48cd(*actionparams) {
    self endon(#"hash_1ae115949cd752c8", #"death", #"hash_3525e39d3694d0a9");
    while (true) {
        object = self.bot.objective.info.target;
        self use_gameobject(object);
    }
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0x5cf41de2, Offset: 0x2100
// Size: 0x118
function private use_trigger(trigger) {
    lookat = trigger triggerrequireslookat();
    while (true) {
        if (lookat) {
            center = trigger getcentroid();
            self.bot.var_87751145 = center;
        }
        self waittill(#"hash_77f2882ff9140e86");
        if (!isdefined(trigger)) {
            return;
        }
        if (lookat && !!self botgetlookdot() >= 0.5) {
            continue;
        }
        self bottapbutton(3);
        if (self usebuttonpressed()) {
            trigger useby(self);
        }
    }
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0x5be0ce15, Offset: 0x2220
// Size: 0x9a
function private function_e02bffcd(trigger) {
    if (!self istouching(trigger)) {
        return false;
    }
    if (trigger.classname != #"trigger_radius_use") {
        return true;
    }
    radius = trigger getmaxs()[0] + -32;
    return distance2dsquared(trigger.origin, self.origin) < radius * radius;
}

// Namespace bot_actions/bot_actions
// Params 1, eflags: 0x6 linked
// Checksum 0xead329cc, Offset: 0x22c8
// Size: 0x178
function private use_gameobject(object) {
    trigger = object.trigger;
    lookat = trigger triggerrequireslookat();
    while (true) {
        if (lookat) {
            center = trigger getcentroid();
            self.bot.var_87751145 = center;
        }
        self waittill(#"hash_77f2882ff9140e86");
        if (!isdefined(object) || !isdefined(trigger)) {
            return;
        }
        if (lookat && !!self botgetlookdot() >= 0.5) {
            continue;
        }
        self bottapbutton(3);
        if (self usebuttonpressed() && !is_true(object.inuse)) {
            if (!isdefined(self.claimtrigger) || self.claimtrigger != trigger) {
                trigger useby(self);
            }
        }
    }
}

