// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace dynent_use;

// Namespace dynent_use/dynent_use
// Params 0, eflags: 0x5
// Checksum 0x5af52b67, Offset: 0x128
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"dynent_use", &preinit, undefined, undefined, undefined);
}

// Namespace dynent_use/dynent_use
// Params 0, eflags: 0x6 linked
// Checksum 0x57938ab1, Offset: 0x170
// Size: 0x174
function private preinit() {
    if (util::is_frontend_map() || currentsessionmode() == 4 || !(isdefined(getgametypesetting(#"usabledynents")) ? getgametypesetting(#"usabledynents") : 0)) {
        return;
    }
    clientfield::register_clientuimodel("hudItems.dynentUseHoldProgress", 13000, 5, "float", 0);
    /#
        level thread devgui_loop();
    #/
    level thread update_loop();
    callback::on_connect(&on_player_connect);
    callback::on_disconnect(&on_player_disconnect);
    callback::on_player_killed(&on_player_killed);
    level.var_29e3cd8 = &function_7f2040e8;
    level.var_7d3131e8 = &function_662eb91e;
}

// Namespace dynent_use/dynent_use
// Params 0, eflags: 0x6 linked
// Checksum 0xb23ab8e3, Offset: 0x2f0
// Size: 0x74
function private on_player_connect() {
    usetrigger = create_use_trigger();
    self clientclaimtrigger(usetrigger);
    self.var_8a022726 = usetrigger;
    /#
        if (self ishost()) {
            self thread function_6b66543a();
        }
    #/
}

// Namespace dynent_use/dynent_use
// Params 0, eflags: 0x6 linked
// Checksum 0xdbd58f05, Offset: 0x370
// Size: 0x2c
function private on_player_disconnect() {
    if (isdefined(self.var_8a022726)) {
        self.var_8a022726 delete();
    }
}

// Namespace dynent_use/dynent_use
// Params 1, eflags: 0x6 linked
// Checksum 0x53768fed, Offset: 0x3a8
// Size: 0x2c
function private on_player_killed(*params) {
    self clientfield::set_player_uimodel("hudItems.dynentUseHoldProgress", 0);
}

// Namespace dynent_use/dynent_use
// Params 0, eflags: 0x6 linked
// Checksum 0x7faa1f34, Offset: 0x3e0
// Size: 0x1a0
function private create_use_trigger() {
    usetrigger = spawn("trigger_radius_use", (0, 0, -10000), 0, 128, 64, 1);
    usetrigger.targetname = "dynent_use";
    usetrigger triggerignoreteam();
    usetrigger setinvisibletoall();
    usetrigger setvisibletoplayer(self);
    usetrigger setteamfortrigger(#"none");
    usetrigger setcursorhint("HINT_NOICON");
    usetrigger triggerenable(0);
    usetrigger usetriggerignoreuseholdtime();
    usetrigger function_4bf6de9a(0);
    usetrigger function_c96c67a5(0);
    usetrigger function_89fca53b(1);
    usetrigger function_49462027(1, 1 | 16 | 1024);
    usetrigger callback::on_trigger_once(&function_46502841);
    return usetrigger;
}

// Namespace dynent_use/dynent_use
// Params 0, eflags: 0x6 linked
// Checksum 0x27192ce, Offset: 0x588
// Size: 0x196
function private update_loop() {
    level endon(#"game_ended");
    updatepass = 0;
    while (true) {
        foreach (i, player in getplayers()) {
            if (i % 5 == updatepass) {
                if (!isdefined(player.var_8a022726)) {
                    continue;
                }
                if (player.sessionstate != "playing" || !isalive(player) || player isinvehicle() || isdefined(level.var_3dfbaf65) && player [[ level.var_3dfbaf65 ]]()) {
                    player.var_8a022726 triggerenable(0);
                    continue;
                }
                player function_2f394f36();
            }
        }
        updatepass = (updatepass + 1) % 5;
        waitframe(1);
    }
}

// Namespace dynent_use/dynent_use
// Params 0, eflags: 0x6 linked
// Checksum 0x6cfd8430, Offset: 0x728
// Size: 0x69c
function private function_2f394f36() {
    height = self getmaxs()[2];
    bounds = (50, 50, height / 2);
    boundsorigin = self getcentroid();
    /#
        debug = self ishost() && getdvarint(#"hash_23e7101285284738", 0);
        if (debug) {
            box(boundsorigin, (0, 0, 0) - bounds, bounds, 0, (0, 0, 1), 1, 0, 5);
        }
    #/
    viewheight = self getplayerviewheight();
    vieworigin = self.origin + (0, 0, viewheight);
    viewangles = self getplayerangles();
    viewforward = anglestoforward(viewangles);
    var_e86a4d9 = function_db4bc717(boundsorigin, bounds);
    var_c61b7280 = undefined;
    var_97684497 = undefined;
    bestdot = -1;
    foreach (dynent in var_e86a4d9) {
        centroid = function_c5689a6a(dynent);
        var_966ddbb9 = centroid - vieworigin;
        var_966ddbb9 = vectornormalize((var_966ddbb9[0], var_966ddbb9[1], 0));
        var_755fcbbd = vectordot(viewforward, var_966ddbb9);
        /#
            if (debug) {
                sphere(dynent.origin, 9, (0, 0, 1), 1, 0, 8, 5);
            }
        #/
        if (var_755fcbbd < 0) {
            continue;
        }
        if (isdefined(dynent.var_a548ec11) && gettime() <= dynent.var_a548ec11) {
            /#
                if (debug) {
                    print3d(dynent.origin, "<unknown string>", (1, 1, 1), 1, 0.5, 5);
                }
            #/
            continue;
        }
        stateindex = function_ffdbe8c2(dynent);
        bundle = function_489009c1(dynent);
        if (isdefined(bundle) && isdefined(bundle.dynentstates) && isdefined(bundle.dynentstates[stateindex]) && (is_true(bundle.dynentstates[stateindex].var_efabe801) || level.inprematchperiod && !is_true(bundle.dynentstates[stateindex].var_4a78f198))) {
            /#
                if (debug) {
                    print3d(dynent.origin, "<unknown string>", (1, 1, 1), 1, 0.5, 5);
                }
            #/
            continue;
        }
        if (isdefined(dynent.canuse) && !dynent [[ dynent.canuse ]](self)) {
            continue;
        }
        if (self function_662eb91e(dynent, vieworigin, viewforward, 5)) {
            var_c61b7280 = undefined;
            break;
        }
        if (var_755fcbbd > bestdot) {
            bestdot = var_755fcbbd;
            var_c61b7280 = dynent;
        }
    }
    if (!isdefined(var_c61b7280)) {
        self.var_8a022726 triggerenable(0);
        return;
    }
    trigger = self.var_8a022726;
    state = function_ffdbe8c2(var_c61b7280);
    if (trigger.var_a9309589 === var_c61b7280 && trigger.dynentstate === state) {
        trigger triggerenable(1);
        return;
    }
    trigger.var_a9309589 = var_c61b7280;
    trigger.dynentstate = state;
    bundle = function_489009c1(var_c61b7280);
    v_offset = (isdefined(bundle.var_aa0fba03) ? bundle.var_aa0fba03 : 0, isdefined(bundle.var_f8525687) ? bundle.var_f8525687 : 0, isdefined(bundle.var_54b28eee) ? bundle.var_54b28eee : 0);
    v_offset = rotatepoint(v_offset, var_c61b7280.angles);
    trigger.origin = var_c61b7280.origin + v_offset;
    trigger.usetime = isdefined(bundle.use_time) ? bundle.use_time : 0;
    trigger function_836af3b3(bundle, state);
    trigger triggerenable(1);
}

// Namespace dynent_use/dynent_use
// Params 4, eflags: 0x2 linked
// Checksum 0x886475c4, Offset: 0xdd0
// Size: 0x2f8
function function_662eb91e(dynent, vieworigin, viewforward, drawframes = 1) {
    if (!isdefined(dynent.var_667629e9) || dynent.var_667629e9.size <= 0) {
        return false;
    }
    foreach (var_806e6091 in dynent.var_667629e9) {
        if (!isdefined(var_806e6091.owner) || var_806e6091.owner != self || !isdefined(var_806e6091.pickuptrigger)) {
            continue;
        }
        var_75b2d824 = var_806e6091 getboundsmidpoint();
        var_ed0847f8 = var_806e6091.origin + rotatepoint(var_75b2d824, var_806e6091.angles);
        var_7113bae6 = var_ed0847f8 - vieworigin;
        var_5a188b65 = vectornormalize(var_7113bae6);
        var_99957205 = vectordot(viewforward, var_5a188b65);
        if (var_99957205 <= 0.7 || !bullettracepassed(vieworigin, var_ed0847f8, 0, self, var_806e6091)) {
            continue;
        }
        var_bfe39478 = var_806e6091 getboundshalfsize();
        var_594916e6 = length(var_bfe39478);
        var_fcdb3664 = sqrt(1 - var_99957205 * var_99957205);
        lookingat = var_fcdb3664 * length(var_7113bae6) / var_99957205 < var_594916e6;
        /#
            if (getdvarint(#"hash_23e7101285284738", 0)) {
                var_d8959d2a = lookingat ? (1, 0, 0) : (0, 1, 0);
                sphere(var_ed0847f8, var_594916e6, var_d8959d2a, 0.75, 0, 10, drawframes);
            }
        #/
        if (lookingat) {
            return true;
        }
    }
    return false;
}

// Namespace dynent_use/dynent_use
// Params 2, eflags: 0x2 linked
// Checksum 0x12b62d8f, Offset: 0x10d0
// Size: 0xa4
function function_836af3b3(bundle, state) {
    hintstring = #"";
    if (isdefined(bundle) && isdefined(bundle.dynentstates) && isdefined(bundle.dynentstates[state]) && isdefined(bundle.dynentstates[state].hintstring)) {
        hintstring = bundle.dynentstates[state].hintstring;
    }
    self sethintstring(hintstring);
}

// Namespace dynent_use/dynent_use
// Params 1, eflags: 0x6 linked
// Checksum 0x7fb86ce9, Offset: 0x1180
// Size: 0x11a
function private function_46502841(trigger_struct) {
    if (is_true(level.gameended)) {
        return;
    }
    activator = trigger_struct.activator;
    dynent = self.var_a9309589;
    for (success = activator function_2b9e2224(self); success && isdefined(dynent) && self.var_a9309589 === dynent && is_true(dynent.var_e7823894); success = activator function_2b9e2224(self)) {
        if (isdefined(dynent.canuse) && !dynent [[ dynent.canuse ]](activator)) {
            break;
        }
        self triggerenable(1);
    }
}

// Namespace dynent_use/dynent_use
// Params 1, eflags: 0x6 linked
// Checksum 0xb1a353ce, Offset: 0x12a8
// Size: 0x2f8
function private function_2b9e2224(trigger) {
    self endon(#"disconnect");
    dynent = trigger.var_a9309589;
    success = 0;
    var_957a77d9 = !(isdefined(dynent.var_a548ec11) && dynent.var_a548ec11 > gettime());
    if (isdefined(dynent) && var_957a77d9) {
        begintime = gettime();
        usetime = int(trigger.usetime * 1000);
        endtime = begintime + usetime;
        if (isdefined(dynent.onbeginuse)) {
            dynent thread [[ dynent.onbeginuse ]](self);
        }
        if (isdefined(dynent.var_263c4ded)) {
            var_36c3259 = trigger.usetime;
            usetime = int(dynent thread [[ dynent.var_263c4ded ]](self) * 1000);
            endtime = begintime + usetime;
        }
        while (self function_58fa8833(trigger, dynent)) {
            if (is_true(level.gameended)) {
                trigger triggerenable(0);
                break;
            }
            if (gettime() >= endtime) {
                success = 1;
                var_a852a7dd = trigger use_dynent(dynent, self);
                dynent.var_a548ec11 = gettime() + var_a852a7dd * 1000;
                trigger triggerenable(0);
                break;
            }
            if (usetime > 0) {
                progress = (gettime() - begintime) / usetime;
                progress = max(progress, 0.01);
                self clientfield::set_player_uimodel("hudItems.dynentUseHoldProgress", progress);
            }
            waitframe(1);
        }
        if (isdefined(dynent.onusecancel) && !success) {
            dynent thread [[ dynent.onusecancel ]](self);
        }
    }
    self clientfield::set_player_uimodel("hudItems.dynentUseHoldProgress", 0);
    self thread function_e882de59(trigger);
    return success;
}

// Namespace dynent_use/dynent_use
// Params 2, eflags: 0x2 linked
// Checksum 0x1b40a3ba, Offset: 0x15a8
// Size: 0xc0
function function_58fa8833(trigger, dynent) {
    if (!isalive(self)) {
        return false;
    }
    if (self inlaststand()) {
        return false;
    }
    if (!self usebuttonpressed()) {
        return false;
    }
    if (!trigger istriggerenabled()) {
        return false;
    }
    if (!self istouching(trigger)) {
        return false;
    }
    if (!isdefined(dynent)) {
        return false;
    }
    if (trigger.var_a9309589 !== dynent) {
        return false;
    }
    return true;
}

// Namespace dynent_use/dynent_use
// Params 1, eflags: 0x6 linked
// Checksum 0x1abce993, Offset: 0x1670
// Size: 0xcc
function private function_e882de59(trigger) {
    if (is_true(level.gameended)) {
        return;
    }
    self notify("53031475d82108a7");
    self endon("53031475d82108a7");
    level endon(#"game_ended");
    self endon(#"disconnect");
    while (isalive(self) && self usebuttonpressed()) {
        waitframe(1);
    }
    trigger callback::on_trigger_once(&function_46502841);
}

// Namespace dynent_use/dynent_use
// Params 0, eflags: 0x2 linked
// Checksum 0xe870c277, Offset: 0x1748
// Size: 0x5c
function function_7f2040e8() {
    if (!isdefined(self.var_8a022726)) {
        return;
    }
    self.var_8a022726 callback::remove_on_trigger_once(&function_46502841);
    self thread function_e882de59(self.var_8a022726);
}

// Namespace dynent_use/dynent_use
// Params 5, eflags: 0x2 linked
// Checksum 0xcd8768fa, Offset: 0x17b0
// Size: 0x340
function use_dynent(dynent, activator, overridestate, disablegesture = 0, var_c78a0afc = 0) {
    stateindex = function_ffdbe8c2(dynent);
    bundle = function_489009c1(dynent);
    var_9bdcfcd8 = undefined;
    if (isdefined(bundle) && isdefined(bundle.dynentstates) && isdefined(bundle.dynentstates[stateindex])) {
        state = bundle.dynentstates[stateindex];
        var_9bdcfcd8 = isdefined(state.var_8a7fcb87) ? state.var_8a7fcb87 : isdefined(overridestate) ? overridestate : 0;
        if (!isdefined(overridestate) && isdefined(activator)) {
            var_b4b3af4c = anglestoforward(dynent.angles);
            playerdir = self.origin - activator.origin;
            playerdir = vectornormalize((playerdir[0], playerdir[1], 0));
            dot = vectordot(var_b4b3af4c, playerdir);
            if (dot >= 0) {
                var_9bdcfcd8 = isdefined(state.var_8a7fcb87) ? state.var_8a7fcb87 : 0;
            } else {
                var_9bdcfcd8 = isdefined(state.var_afc94db1) ? state.var_afc94db1 : 0;
            }
        }
        if (!disablegesture && isplayer(activator) && isdefined(state.var_20630681)) {
            activator gestures::function_56e00fbf(state.var_20630681, undefined, 0);
        }
        if (isdefined(dynent.onuse)) {
            succeeded = dynent [[ dynent.onuse ]](activator, stateindex, var_9bdcfcd8);
        }
        if (!isdefined(succeeded) || succeeded == 1) {
            dynent.var_c78a0afc = var_c78a0afc ? 1 : undefined;
            function_e2a06860(dynent, var_9bdcfcd8);
            dynent.var_c78a0afc = undefined;
        }
        dynent callback::callback(#"hash_4248afa7a68c391b", {#activator:activator});
        return (isdefined(bundle.var_a852a7dd) ? bundle.var_a852a7dd : 0);
    }
    return 0;
}

/#

    // Namespace dynent_use/dynent_use
    // Params 0, eflags: 0x4
    // Checksum 0xcb0ff404, Offset: 0x1af8
    // Size: 0x6c
    function private devgui_loop() {
        level endon(#"game_ended");
        while (!canadddebugcommand()) {
            waitframe(1);
        }
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
    }

    // Namespace dynent_use/dynent_use
    // Params 0, eflags: 0x4
    // Checksum 0xf9039352, Offset: 0x1b70
    // Size: 0x288
    function private function_6b66543a() {
        self endon(#"disconnect");
        while (true) {
            waitframe(1);
            waittillframeend();
            if (!getdvarint(#"hash_23e7101285284738", 0)) {
                continue;
            }
            trigger = self.var_8a022726;
            if (isdefined(trigger)) {
                dynent = trigger.var_a9309589;
                if (isdefined(dynent)) {
                    sphere(function_c5689a6a(dynent), 8, (0, 1, 1));
                    sphere(dynent.origin, 7, (1, 0.5, 0));
                    print3d(dynent.origin, function_ffdbe8c2(dynent), (1, 1, 1), 1, 0.5);
                }
                color = trigger istriggerenabled() ? (1, 0, 1) : (1, 0, 0);
                maxs = trigger getmaxs();
                mins = trigger getmins();
                origin = trigger.origin;
                top = origin + (0, 0, maxs[2]);
                bottom = origin + (0, 0, mins[2]);
                line(bottom, top, color);
                sphere(origin, 2, color);
                circle(bottom, maxs[0], color, 0, 1);
                circle(top, maxs[0], color, 0, 1);
            }
        }
    }

#/
