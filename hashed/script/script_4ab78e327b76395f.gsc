// Atian COD Tools GSC CW decompiler test
#using scripts\cp_common\bb.gsc;
#using script_2d443451ce681a;
#using script_7d0013bbc05623b9;
#using script_9bfd3d8a6a89e5e;
#using script_5431e074c1428743;
#using script_52da18c20f45c56a;
#using script_3626f1b2cf51a99c;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_5f6e61d9;

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 0, eflags: 0x5
// Checksum 0xf38128ee, Offset: 0x358
// Size: 0x44
function private autoexec __init__system__() {
    system::register(#"hash_32009cf32baa31d1", &preinit, undefined, undefined, #"hash_7e93e9089f28804f");
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 0, eflags: 0x6 linked
// Checksum 0xffe66c80, Offset: 0x3a8
// Size: 0x184
function private preinit() {
    animation::add_global_notetrack_handler("hide_victim", &function_8f7ba6c3, 0);
    animation::add_global_notetrack_handler("pickup", &function_ebce8b6, 0);
    animation::add_global_notetrack_handler("bodycarry_drop", &function_ff5c9214, 0);
    animation::add_global_notetrack_handler("start_bodyshield_gesture", &start_bodyshield_gesture, 0);
    setsaveddvar(#"ai_corpsesynch", 1);
    actions::function_9ddfe2d("body_carry", &function_c3475251, "takedown");
    actions::function_9ddfe2d("body_pickup", &function_b9c74598, undefined, "_never_");
    actions::function_b1543a9d("body_carry", "td_anims_body_carry");
    level callback::function_30c3f95d(&function_30c3f95d);
    level.var_3ba48663 = &ai::set_corpse_entity;
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x6 linked
// Checksum 0x45a10b6b, Offset: 0x538
// Size: 0x94
function private function_30c3f95d(var_352058a) {
    corpse = self;
    if (isdefined(var_352058a.original.var_b9c0ade5)) {
        corpse.var_b9c0ade5 = var_352058a.original.var_b9c0ade5;
    }
    corpse setcontents(0);
    corpse.var_a08ba405 = var_352058a.original.var_a08ba405;
    corpse thread function_c74e98cb();
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 0, eflags: 0x2 linked
// Checksum 0x725ea3b7, Offset: 0x5d8
// Size: 0x82
function player_init() {
    assert(isplayer(self));
    if (!isdefined(self.var_9ebbaa46)) {
        self.var_9ebbaa46 = spawnstruct();
        self.var_9ebbaa46.victim = undefined;
        self.var_9ebbaa46.active = undefined;
        self.var_9ebbaa46.var_87788f85 = undefined;
    }
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x2 linked
// Checksum 0x9bac2208, Offset: 0x668
// Size: 0xc4
function function_c3475251(action) {
    assert(isplayer(self));
    self endon(action.ender);
    self player_init();
    if (is_true(self actions::function_83bde308(action, "use", #"carry_body"))) {
        self thread function_b8268bd6(action, self.var_edbc8698);
        return true;
    }
    return false;
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x2 linked
// Checksum 0x5a4af75c, Offset: 0x738
// Size: 0x76
function function_b9c74598(action) {
    assert(isplayer(self));
    self endon(action.ender);
    self player_init();
    self waittill(#"body_pickup");
    return true;
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 2, eflags: 0x2 linked
// Checksum 0x55faf85f, Offset: 0x7b8
// Size: 0x276
function function_c74e98cb(var_4aed6923 = 0, tag) {
    self endon(#"death", #"entitydeleted");
    util::wait_network_frame();
    if (!isdefined(tag) && (is_true(var_4aed6923) || isdefined(self.var_a08ba405))) {
        tag = "j_spinelower";
    }
    button = #"use";
    var_70ddc449 = 18;
    if (is_true(self.var_b9c0ade5)) {
        var_70ddc449 = 100;
    }
    self prompts::create(button, undefined, undefined, undefined, undefined, undefined, tag);
    self prompts::function_263320e2(button, #"hash_2112f5e24ce2de54");
    self prompts::function_5fe46a16(button, 50 + var_70ddc449);
    self prompts::function_68782902(button, 68);
    self prompts::function_b95d71cd(button, 20);
    self prompts::function_2bd2431a(button, 0);
    self prompts::function_a4a9acfc(button, &function_ffb1d92f);
    self prompts::function_75d5e526(button, &function_9ccb0bfc);
    self prompts::function_44d7831a(button, 0);
    self prompts::function_92127496(1, !is_true(self.var_b9c0ade5));
    self prompts::function_dcf99fad(button, 0, self.var_a08ba405);
    self notify(#"hash_3da14a3508f6e057");
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 0, eflags: 0x2 linked
// Checksum 0x9cf98568, Offset: 0xa38
// Size: 0x138
function function_c4fe1ef2() {
    player = self;
    if (!isplayer(player)) {
        player = getplayers()[0];
    }
    player.var_ca6b6423 = undefined;
    setdvar(#"scr_door_player_gestures", 1);
    if (!is_true(player flag::get("body_carry"))) {
        return false;
    }
    if (is_true(player.var_f467e5b0.var_36a4a92c)) {
        return false;
    }
    if (!isdefined(player)) {
        return false;
    }
    if (is_true(player.var_9ebbaa46.var_87788f85)) {
        return false;
    }
    player.var_ca6b6423 = 1;
    setdvar(#"scr_door_player_gestures", 0);
    return true;
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 0, eflags: 0x2 linked
// Checksum 0xe69774d7, Offset: 0xb78
// Size: 0x176
function function_ffb1d92f() {
    player = getplayers()[0];
    if (!isdefined(player)) {
        return false;
    }
    if (level flag::get("no_corpse_pickup") || isdefined(player getlinkedent())) {
        return false;
    }
    if (player action_utility::function_a06867b0(player getcurrentweapon())) {
        return false;
    }
    if (is_true(player flag::get("body_carry"))) {
        return false;
    }
    if (is_true(player flag::get("body_pickup"))) {
        return false;
    }
    if (!level flag::get("stealth_enabled") || level flag::get("stealth_spotted")) {
        return false;
    }
    if (player isswitchingweapons()) {
        return false;
    }
    return true;
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x2 linked
// Checksum 0x2696f79c, Offset: 0xcf8
// Size: 0x34
function function_9ccb0bfc(var_248cbbcf) {
    var_248cbbcf.player thread function_b8268bd6("body_pickup", self, undefined, 1);
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x2 linked
// Checksum 0x5f8dff18, Offset: 0xd38
// Size: 0x2b6
function function_5654f611(body) {
    assert(isplayer(self));
    assert(isentity(body));
    var_46abe989 = body.origin;
    if (!isai(body)) {
        var_46abe989 = body getcorpsephysicsorigin();
    }
    result = {};
    if (isdefined(body.var_3e95b88f.prompts[#"use"]) && isdefined(body.var_3e95b88f.prompts[#"use"].tag)) {
        var_46abe989 = body gettagorigin(body.var_3e95b88f.prompts[#"use"].tag);
    }
    result.var_ef504ed6 = var_46abe989;
    result.origin = vectorlerp(self.origin, var_46abe989, 0.5);
    result.origin = (result.origin[0], result.origin[1], self.origin[2]);
    result.angles = (0, vectortoyaw(result.origin - self.origin), 0);
    traceorigin = playerphysicstrace(self.origin, result.origin);
    /#
        if (distancesquared(traceorigin, result.origin) > 0.0001) {
            delta = traceorigin - result.origin;
            iprintlnbold("<unknown string>" + delta[0] + "<unknown string>" + delta[1] + "<unknown string>" + delta[2] + "<unknown string>");
        }
    #/
    result.origin = traceorigin;
    return result;
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 4, eflags: 0x2 linked
// Checksum 0x778871a7, Offset: 0xff8
// Size: 0x474
function function_b8268bd6(action, victim, var_7318f7f0, var_65ff9d5a) {
    self notify("421a6bca2547c56f");
    self endon("421a6bca2547c56f");
    self endoncallback(&function_39f2df3d, action.ender, #"hash_750a24acc68f40a1");
    bb::function_cd497743("body_pickup", self);
    self flag::set("body_pickup");
    self flag::set("in_action");
    self.var_9ebbaa46.active = 1;
    self.var_9ebbaa46.victim = victim;
    var_17813638 = spawnstruct();
    if (is_true(var_65ff9d5a)) {
        bodymodel = self function_32d8a3e0(self.var_9ebbaa46.victim);
        var_6fbe856d = self function_5654f611(self.var_9ebbaa46.victim);
        self.takedown.body = bodymodel;
        scene = "bodycarry_pickup";
        if (var_6fbe856d.var_ef504ed6[2] - self.origin[2] > 20) {
            scene = "bodycarry_pickup_high";
        }
        var_17813638.origin = var_6fbe856d.origin;
        var_17813638.angles = var_6fbe856d.angles;
        if (isdefined(self.var_9ebbaa46.var_e0a97ac8)) {
            var_17813638 = self.var_9ebbaa46.var_e0a97ac8;
        }
        if (isdefined(var_7318f7f0)) {
            scene = var_7318f7f0;
        }
        override = self actions::function_abaa32c(action);
        if (isdefined(self.var_9ebbaa46.var_2e2edc53)) {
            scene = self.var_9ebbaa46.var_2e2edc53;
            self.takedown.body.var_41c4e6d6 = 1;
            self val::set(#"hash_61125ef3dde6089f", "disable_weapons", 1);
        } else {
            self.takedown.body hide();
            self action_utility::gesture_play("ges_body_carry_pickup_finish", undefined, 1, 0);
        }
        var_17813638 action_utility::scene_play(isdefined(override.scene) ? override.scene : scene, self, self.takedown.body);
        return;
    }
    self action_utility::function_464d0412(undefined, undefined, undefined, 2);
    self.takedown.body = self.var_9ebbaa46.victim;
    self.takedown.body function_d374e33d();
    if (isdefined(self.takedown.body)) {
        self.takedown.body thread action_utility::function_3f4de57b("body_carry" + "_enter");
    }
    if (isdefined(self.var_6639d45b)) {
        self.var_6639d45b action_utility::function_3f4de57b("body_carry" + "_enter");
    }
    self thread function_ebce8b6([#"player":self, #"victim":self.takedown.body]);
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x2 linked
// Checksum 0xee687095, Offset: 0x1478
// Size: 0x44
function function_8f7ba6c3(*a_ents) {
    if (isdefined(self.var_9ebbaa46.victim)) {
        self.var_9ebbaa46.victim hide();
    }
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x2 linked
// Checksum 0x80e521ef, Offset: 0x14c8
// Size: 0x3d6
function function_ebce8b6(*a_ents) {
    player = getplayers()[0];
    if (is_true(player.takedown.body.var_41c4e6d6)) {
        player val::reset_all(#"hash_61125ef3dde6089f");
        waitframe(1);
        player start_bodyshield_gesture();
    }
    override = player actions::function_abaa32c("body_carry");
    anim_name = isdefined(override.anim_name) ? override.anim_name : "body_carry";
    if (isdefined(player.var_9ebbaa46.victim) && player.var_9ebbaa46.victim !== player.takedown.body) {
        player.var_9ebbaa46.victim delete();
    }
    player.takedown.body show();
    player.takedown.body action_utility::function_b82cae8f(2);
    player action_utility::function_464d0412(undefined, undefined, undefined, 2);
    player action_utility::function_2795d678(1, 1, 0, 0, ["cinematicmotion_body_carry", "cinematicmotion_body_carry_ads"]);
    player thread function_9abb3f03(player.takedown.body);
    player playrumbleonentity(#"reload_medium");
    player util::delay(0.55, undefined, &playrumbleonentity, #"reload_large");
    if (!is_true(player.takedown.body.var_41c4e6d6)) {
        if (isdefined(player.takedown.body)) {
            player.takedown.body thread action_utility::function_3f4de57b(anim_name + "_pickup_finish");
        }
        if (isdefined(player.var_6639d45b)) {
            player.var_6639d45b action_utility::function_3f4de57b(anim_name + "_pickup_finish");
        }
    }
    player flag::set("body_carry");
    player flag::clear("body_pickup");
    player thread function_e3789852(player.takedown.body);
    player thread function_f1aa7603(player.takedown.body);
    player.takedown.body.var_41c4e6d6 = undefined;
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x6 linked
// Checksum 0x79065048, Offset: 0x18a8
// Size: 0xc6
function private function_e3789852(*victim) {
    self notify("61ce5061c1e4aeb3");
    self endon("61ce5061c1e4aeb3");
    assert(isplayer(self));
    self endon(#"death", #"hash_7c3b085512be9978");
    util::waittill_any_ents(level, "no_corpse_pickup", level, "drop_corpse", level, "prompts_disabled", self, "prompts_disabled");
    self notify(#"hash_4dff86580406a1af");
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x6 linked
// Checksum 0x3dde32e6, Offset: 0x1978
// Size: 0xcc
function private function_f1aa7603(*victim) {
    self notify("12028de136f92897");
    self endon("12028de136f92897");
    assert(isplayer(self));
    self endon(#"hash_7c3b085512be9978");
    self waittill(#"death", #"hash_2b62b2990144ebf6");
    if (isentity(self.takedown.body)) {
        self.takedown.body hide();
    }
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x2 linked
// Checksum 0xdbeae9e2, Offset: 0x1a50
// Size: 0x1a0
function function_32d8a3e0(victim) {
    bodymodel = util::spawn_model(victim.aitype, victim.origin, victim.angles);
    bodymodel setmodel(victim.model);
    bodymodel.modelname = victim.model;
    bodymodel.ai_type = victim.aitype;
    bodymodel.var_b9c0ade5 = victim.var_b9c0ade5;
    bodymodel.animname = "generic";
    bodymodel.var_5b22d53 = 0;
    bodymodel detachall();
    for (i = 0; i < victim getattachsize(); i++) {
        bodymodel.var_cf230c0[i] = victim getattachmodelname(i);
        bodymodel.attach_tag[i] = victim getattachtagname(i);
        bodymodel attach(bodymodel.var_cf230c0[i], bodymodel.attach_tag[i]);
    }
    bodymodel function_d374e33d();
    bodymodel notsolid();
    return bodymodel;
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x2 linked
// Checksum 0xe75a3eb1, Offset: 0x1bf8
// Size: 0x19c
function function_9abb3f03(victim) {
    button = #"stance";
    self prompts::create(button);
    self prompts::function_263320e2(button, #"hash_137214393a59c3a");
    self prompts::function_cd2391cb(button, "body_drop");
    self prompts::function_a4a9acfc(button, &function_c4fe1ef2);
    self prompts::function_8f5eb0a6(button, 0);
    self prompts::function_d03d79d6(button, 0);
    self prompts::function_3171730f(button, #"actions");
    while (true) {
        waitresult = self waittill(#"body_drop", #"hash_4dff86580406a1af");
        if (!self function_c4fe1ef2() && waitresult._notify === "body_drop") {
            continue;
        }
        break;
    }
    self body_drop(victim);
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x2 linked
// Checksum 0xdab0e4e8, Offset: 0x1da0
// Size: 0x484
function body_drop(victim) {
    self notify(#"hash_7c3b085512be9978");
    self prompts::remove(#"stance");
    self notify(#"hash_6e2a24679f8eca8e");
    bb::function_cd497743("body_drop", self);
    self action_utility::gesture_play("ges_body_carry_exit");
    override = self actions::function_abaa32c("body_carry");
    anim_name = isdefined(override.anim_name) ? override.anim_name : "body_carry";
    if (isdefined(self.var_9ebbaa46.var_ea195798)) {
        self val::set(#"hash_61125ef3dde6089f", "disable_weapons", 1);
        var_6407b282 = util::spawn_model(victim.model, victim.origin, victim.angles);
        for (i = 0; i < victim getattachsize(); i++) {
            var_6407b282 attach(victim getattachmodelname(i), victim getattachtagname(i), 1);
        }
        victim util::delay(0.1, undefined, &delete);
        victim = var_6407b282;
        self.var_9ebbaa46.var_d4f8dcdf action_utility::scene_play(self.var_9ebbaa46.var_ea195798, self, victim);
        self val::reset_all(#"hash_61125ef3dde6089f");
    } else {
        self playrumbleonentity(#"reload_small");
        self util::delay(0.55, undefined, &playrumbleonentity, #"reload_medium");
        playerpitch = self getplayerangles()[0];
        if (playerpitch <= -15 && !self action_utility::function_fdff1cf3()) {
            self val::set(#"hash_bfef6b25e738297", "freezecontrols_allowlook", 1);
            self function_305446bc(-20);
        } else if (playerpitch >= 60 && !self action_utility::function_fdff1cf3(-30)) {
            self val::set(#"hash_bfef6b25e738297", "freezecontrols_allowlook", 1);
            self function_305446bc(30);
        }
        if (isdefined(victim)) {
            victim thread action_utility::function_3f4de57b(anim_name + "_drop");
        }
        if (isdefined(self.var_6639d45b)) {
            self.var_6639d45b show();
            self.var_6639d45b action_utility::function_3f4de57b(anim_name + "_drop");
        }
        self val::reset_all(#"hash_bfef6b25e738297");
    }
    self thread function_ff5c9214([#"player":self, #"victim":victim]);
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x6 linked
// Checksum 0x77344d8e, Offset: 0x2230
// Size: 0xec
function private function_305446bc(forward = 20) {
    assert(isplayer(self));
    offset = (0, 0, 8);
    new_origin = playerphysicstrace(self.origin + offset, self.origin + anglestoforward(self.angles) * forward + offset);
    new_origin = playerphysicstrace(new_origin, new_origin - offset);
    self setorigin(new_origin);
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x2 linked
// Checksum 0xe85f8936, Offset: 0x2328
// Size: 0x144
function function_ff5c9214(a_ents) {
    self actions::function_942d9213();
    player = getplayers()[0];
    victim = a_ents[#"victim"];
    player action_utility::function_2795d678(0);
    if (isdefined(victim) && !iscorpse(victim)) {
        victim action_utility::become_corpse();
    }
    player.var_9ebbaa46.active = undefined;
    player notify(#"hash_51c6ae96a7e40432");
    player flag::clear("body_carry");
    player flag::clear("body_pickup");
    player flag::clear("in_action");
    prompts::function_398ab9eb();
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x2 linked
// Checksum 0x48e5f8e9, Offset: 0x2478
// Size: 0x64
function start_bodyshield_gesture(*a_ents) {
    getplayers()[0] thread namespace_6cecf2d8::function_756e29bb(level.var_f467e5b0.actions[#"body_carry"], "body_carry", undefined, undefined, undefined, 0);
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x2 linked
// Checksum 0x4c5d6f21, Offset: 0x24e8
// Size: 0x44
function function_39f2df3d(*notifyhash) {
    self action_utility::function_2795d678(0);
    self.var_9ebbaa46.active = undefined;
    self actions::function_942d9213();
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 1, eflags: 0x0
// Checksum 0xd5469843, Offset: 0x2538
// Size: 0x3e
function function_145a8b5a(b_disable = 1) {
    self.var_9ebbaa46.var_87788f85 = b_disable ? 1 : undefined;
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 0, eflags: 0x0
// Checksum 0x57b55bb, Offset: 0x2580
// Size: 0x2e
function function_cad84e26() {
    if (is_true(self.var_9ebbaa46.active)) {
        return true;
    }
    return false;
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 2, eflags: 0x0
// Checksum 0xe0c07543, Offset: 0x25b8
// Size: 0x7c
function function_694887dc(var_2e2edc53, var_e0a97ac8 = level) {
    if (isdefined(var_2e2edc53)) {
        self.var_9ebbaa46.var_2e2edc53 = var_2e2edc53;
        self.var_9ebbaa46.var_e0a97ac8 = var_e0a97ac8;
        scene::add_scene_func(var_2e2edc53, &function_ebce8b6, "done");
    }
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 0, eflags: 0x0
// Checksum 0x2899148, Offset: 0x2640
// Size: 0x36
function function_461dbe2a() {
    if (isdefined(self.var_9ebbaa46.var_2e2edc53)) {
        self.var_9ebbaa46.var_2e2edc53 = undefined;
        self.var_9ebbaa46.var_e0a97ac8 = undefined;
    }
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 2, eflags: 0x0
// Checksum 0x2e5eb5db, Offset: 0x2680
// Size: 0x52
function function_d0cb2574(var_ea195798, var_d4f8dcdf = level) {
    if (isdefined(var_ea195798)) {
        self.var_9ebbaa46.var_ea195798 = var_ea195798;
        self.var_9ebbaa46.var_d4f8dcdf = var_d4f8dcdf;
    }
}

// Namespace namespace_5f6e61d9/namespace_5f6e61d9
// Params 0, eflags: 0x0
// Checksum 0x9ad116a6, Offset: 0x26e0
// Size: 0x36
function function_b5b485f1() {
    if (isdefined(self.var_9ebbaa46.var_ea195798)) {
        self.var_9ebbaa46.var_ea195798 = undefined;
        self.var_9ebbaa46.var_d4f8dcdf = undefined;
    }
}

