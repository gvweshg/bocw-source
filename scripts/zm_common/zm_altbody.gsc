// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_altbody;

// Namespace zm_altbody/zm_altbody
// Params 0, eflags: 0x5
// Checksum 0x5170e509, Offset: 0x250
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"zm_altbody", &preinit, undefined, undefined, undefined);
}

// Namespace zm_altbody/zm_altbody
// Params 0, eflags: 0x4
// Checksum 0x9704af44, Offset: 0x298
// Size: 0xdc
function private preinit() {
    if (!isdefined(level.var_28f2d2b1)) {
        level.var_28f2d2b1 = [];
    }
    clientfield::register_clientuimodel("player_lives", 1, 2, "int");
    clientfield::register("toplayer", "player_in_afterlife", 1, 1, "int");
    clientfield::register("toplayer", "player_mana", 1, 8, "float");
    clientfield::register("allplayers", "player_altbody", 1, 1, "int");
}

// Namespace zm_altbody/zm_altbody
// Params 12, eflags: 0x0
// Checksum 0xc5239602, Offset: 0x380
// Size: 0x1ec
function init(name, kiosk_name, trigger_hint, visionset_name, visionset_priority, loadout, character_index, enter_callback, exit_callback, allow_callback, notrigger_hint, var_64d51f6) {
    if (!isdefined(level.altbody_enter_callbacks)) {
        level.altbody_enter_callbacks = [];
    }
    if (!isdefined(level.altbody_exit_callbacks)) {
        level.altbody_exit_callbacks = [];
    }
    if (!isdefined(level.altbody_allow_callbacks)) {
        level.altbody_allow_callbacks = [];
    }
    if (!isdefined(level.altbody_loadouts)) {
        level.altbody_loadouts = [];
    }
    if (!isdefined(level.altbody_visionsets)) {
        level.altbody_visionsets = [];
    }
    if (!isdefined(level.altbody_charindexes)) {
        level.altbody_charindexes = [];
    }
    if (isdefined(visionset_name)) {
        level.altbody_visionsets[name] = visionset_name;
        visionset_mgr::register_info("visionset", visionset_name, 1, visionset_priority, 1, 1);
    }
    function_87585132(name, kiosk_name, trigger_hint, notrigger_hint);
    level.altbody_enter_callbacks[name] = enter_callback;
    level.altbody_exit_callbacks[name] = exit_callback;
    level.altbody_allow_callbacks[name] = allow_callback;
    level.altbody_loadouts[name] = loadout;
    level.altbody_charindexes[name] = character_index;
    level.var_28f2d2b1[name] = var_64d51f6;
    level thread function_6991025d();
}

// Namespace zm_altbody/zm_altbody
// Params 0, eflags: 0x0
// Checksum 0xa47dfee8, Offset: 0x578
// Size: 0x6a
function function_6991025d() {
    level waittill(#"end_game");
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        players[i] notify(#"altbody_end");
    }
}

/#

    // Namespace zm_altbody/zm_altbody
    // Params 1, eflags: 0x0
    // Checksum 0x6e0f57ca, Offset: 0x5f0
    // Size: 0x24
    function devgui_start_altbody(name) {
        self player_altbody(name);
    }

#/

// Namespace zm_altbody/zm_altbody
// Params 2, eflags: 0x4
// Checksum 0x63077d1, Offset: 0x620
// Size: 0x100
function private function_17d98816(trigger, name) {
    if (self zm_utility::is_drinking() && !is_true(self.trigger_kiosks_in_altbody)) {
        return false;
    }
    if (self zm_utility::in_revive_trigger()) {
        return false;
    }
    if (self laststand::player_is_in_laststand()) {
        return false;
    }
    if (self isthrowinggrenade()) {
        return false;
    }
    if (self function_1193c448(name)) {
        return false;
    }
    callback = level.altbody_allow_callbacks[name];
    if (isdefined(callback)) {
        if (!self [[ callback ]](name, trigger.kiosk)) {
            return false;
        }
    }
    return true;
}

// Namespace zm_altbody/zm_altbody
// Params 2, eflags: 0x4
// Checksum 0xab8c3290, Offset: 0x728
// Size: 0x112
function private player_can_altbody(kiosk, name) {
    if (is_true(self.altbody)) {
        return false;
    }
    if (self zm_utility::is_drinking() && !is_true(self.trigger_kiosks_in_altbody)) {
        return false;
    }
    if (self zm_utility::in_revive_trigger()) {
        return false;
    }
    if (self laststand::player_is_in_laststand()) {
        return false;
    }
    if (self isthrowinggrenade()) {
        return false;
    }
    if (self function_1193c448(name)) {
        return false;
    }
    callback = level.altbody_allow_callbacks[name];
    if (isdefined(callback)) {
        if (!self [[ callback ]](name, kiosk)) {
            return false;
        }
    }
    return true;
}

// Namespace zm_altbody/zm_altbody
// Params 1, eflags: 0x0
// Checksum 0x21bb2c5d, Offset: 0x848
// Size: 0xea
function function_1193c448(name) {
    if (!isdefined(level.var_28f2d2b1)) {
        level.var_28f2d2b1 = [];
    }
    if (!isdefined(level.var_28f2d2b1[name])) {
        level.var_28f2d2b1[name] = [];
    }
    foreach (str_bgb in level.var_28f2d2b1[name]) {
        if (self bgb::is_enabled(str_bgb)) {
            return true;
        }
    }
    return false;
}

// Namespace zm_altbody/zm_altbody
// Params 2, eflags: 0x4
// Checksum 0xf194aae5, Offset: 0x940
// Size: 0x9c
function private player_try_altbody(trigger, name) {
    self endon(#"disconnect");
    if (self player_can_altbody(trigger, name)) {
        level notify(#"kiosk_used", {#kiosk:trigger.stub.kiosk});
        self player_altbody(name, trigger);
    }
}

// Namespace zm_altbody/zm_altbody
// Params 2, eflags: 0x4
// Checksum 0x2732864e, Offset: 0x9e8
// Size: 0x9e
function private player_altbody(name, trigger) {
    self.altbody = 1;
    self thread val::set_for_time(1, "altbody", "takedamage", 0);
    self player_enter_altbody(name, trigger);
    self waittill(#"altbody_end");
    self player_exit_altbody(name, trigger);
    self.altbody = 0;
}

// Namespace zm_altbody/zm_altbody
// Params 1, eflags: 0x0
// Checksum 0xdb7158e7, Offset: 0xa90
// Size: 0x10
function get_altbody_weapon_limit(*player) {
    return 16;
}

// Namespace zm_altbody/zm_altbody
// Params 2, eflags: 0x4
// Checksum 0x7257800e, Offset: 0xaa8
// Size: 0x144
function private player_enter_altbody(name, trigger) {
    charindex = level.altbody_charindexes[name];
    self.var_fdbe134c = self.origin;
    self.var_55433be5 = self.angles;
    self setperk("specialty_playeriszombie");
    self thread function_d709966a(1);
    self setcharacterbodytype(charindex);
    clientfield::set_to_player("player_in_afterlife", 1);
    self player_apply_loadout(name);
    self thread player_apply_visionset(name);
    callback = level.altbody_enter_callbacks[name];
    if (isdefined(callback)) {
        self [[ callback ]](name, trigger);
    }
    clientfield::set("player_altbody", 1);
}

// Namespace zm_altbody/zm_altbody
// Params 1, eflags: 0x4
// Checksum 0xc2b46d69, Offset: 0xbf8
// Size: 0xe0
function private player_apply_visionset(name) {
    if (!isdefined(self.altbody_visionset)) {
        self.altbody_visionset = [];
    }
    visionset = level.altbody_visionsets[name];
    if (isdefined(visionset)) {
        if (is_true(self.altbody_visionset[name])) {
            visionset_mgr::deactivate("visionset", visionset, self);
            util::wait_network_frame();
            util::wait_network_frame();
            if (!isdefined(self)) {
                return;
            }
        }
        visionset_mgr::activate("visionset", visionset, self);
        self.altbody_visionset[name] = 1;
    }
}

// Namespace zm_altbody/zm_altbody
// Params 1, eflags: 0x4
// Checksum 0xa7c6e658, Offset: 0xce0
// Size: 0x15c
function private player_apply_loadout(name) {
    self bgb::suspend_weapon_cycling();
    loadout = level.altbody_loadouts[name];
    if (isdefined(loadout)) {
        self disableweaponcycling();
        assert(!isdefined(self.get_player_weapon_limit));
        self.get_player_weapon_limit = &get_altbody_weapon_limit;
        self.altbody_loadout[name] = zm_weapons::player_get_loadout();
        self zm_weapons::player_give_loadout(loadout, 0, 1);
        if (!isdefined(self.altbody_loadout_ever_had)) {
            self.altbody_loadout_ever_had = [];
        }
        if (is_true(self.altbody_loadout_ever_had[name])) {
            self seteverhadweaponall(1);
        }
        self.altbody_loadout_ever_had[name] = 1;
        self waittilltimeout(1, #"weapon_change_complete");
        self resetanimations();
    }
}

// Namespace zm_altbody/zm_altbody
// Params 2, eflags: 0x4
// Checksum 0xcfc087dd, Offset: 0xe48
// Size: 0x15c
function private player_exit_altbody(name, trigger) {
    clientfield::set("player_altbody", 0);
    clientfield::set_to_player("player_in_afterlife", 0);
    callback = level.altbody_exit_callbacks[name];
    if (isdefined(callback)) {
        self [[ callback ]](name, trigger);
    }
    if (!isdefined(self.altbody_visionset)) {
        self.altbody_visionset = [];
    }
    visionset = level.altbody_visionsets[name];
    if (isdefined(visionset)) {
        visionset_mgr::deactivate("visionset", visionset, self);
        self.altbody_visionset[name] = 0;
    }
    self thread player_restore_loadout(name);
    self unsetperk("specialty_playeriszombie");
    self detachall();
    self thread function_d709966a(0);
    zm_characters::set_character();
}

// Namespace zm_altbody/zm_altbody
// Params 2, eflags: 0x4
// Checksum 0x7284a576, Offset: 0xfb0
// Size: 0x134
function private player_restore_loadout(name, *trigger) {
    loadout = level.altbody_loadouts[trigger];
    if (isdefined(loadout)) {
        if (isdefined(self.altbody_loadout[trigger])) {
            self zm_weapons::switch_back_primary_weapon(self.altbody_loadout[trigger].current, 1);
            self.altbody_loadout[trigger] = undefined;
            self waittilltimeout(1, #"weapon_change_complete");
        }
        self zm_weapons::player_take_loadout(loadout);
        assert(self.get_player_weapon_limit == &get_altbody_weapon_limit);
        self.get_player_weapon_limit = undefined;
        self resetanimations();
        self enableweaponcycling();
    }
    self bgb::resume_weapon_cycling();
}

// Namespace zm_altbody/zm_altbody
// Params 1, eflags: 0x0
// Checksum 0x7f57bb9d, Offset: 0x10f0
// Size: 0xc4
function function_d709966a(washuman) {
    if (washuman) {
        playfx(level._effect[#"human_disappears"], self.origin);
        return;
    }
    playfx(level._effect[#"zombie_disappears"], self.origin);
    playsoundatposition(#"zmb_player_disapparate", self.origin);
    self playlocalsound(#"zmb_player_disapparate_2d");
}

// Namespace zm_altbody/zm_altbody
// Params 4, eflags: 0x0
// Checksum 0xd4495498, Offset: 0x11c0
// Size: 0x118
function function_87585132(name, kiosk_name, trigger_hint, notrigger_hint) {
    if (!isdefined(level.altbody_kiosks)) {
        level.altbody_kiosks = [];
    }
    level.altbody_kiosks[name] = struct::get_array(kiosk_name, "targetname");
    foreach (kiosk in level.altbody_kiosks[name]) {
        function_f5e5eac2(kiosk, name, trigger_hint, notrigger_hint);
    }
    level notify(#"hash_3cf24457a0015f72", name);
}

// Namespace zm_altbody/zm_altbody
// Params 4, eflags: 0x0
// Checksum 0x395cc27a, Offset: 0x12e0
// Size: 0x13c
function function_f5e5eac2(kiosk, name, trigger_hint, notrigger_hint) {
    width = 128;
    height = 128;
    length = 128;
    unitrigger_stub = spawnstruct();
    unitrigger_stub.origin = kiosk.origin + (0, 0, 32);
    unitrigger_stub.angles = kiosk.angles;
    unitrigger_stub.script_unitrigger_type = "unitrigger_radius_use";
    unitrigger_stub.cursor_hint = "HINT_NOICON";
    unitrigger_stub.radius = 64;
    unitrigger_stub.require_look_at = 0;
    unitrigger_stub.kiosk = kiosk;
    unitrigger_stub.altbody_name = name;
    unitrigger_stub.trigger_hint = trigger_hint;
    unitrigger_stub.notrigger_hint = notrigger_hint;
    unitrigger_stub.prompt_and_visibility_func = &kiosk_trigger_visibility;
    zm_unitrigger::register_static_unitrigger(unitrigger_stub, &kiosk_trigger_think);
}

// Namespace zm_altbody/zm_altbody
// Params 1, eflags: 0x0
// Checksum 0x38f459e4, Offset: 0x1428
// Size: 0x140
function kiosk_trigger_visibility(player) {
    if (!isdefined(player)) {
        return 0;
    }
    visible = !is_true(player.altbody) || is_true(player.see_kiosks_in_altbody);
    self.stub.usable = player player_can_altbody(self.stub.kiosk, self.stub.altbody_name);
    if (self.stub.usable) {
        self.stub.hint_string = self.stub.trigger_hint;
    } else {
        self.stub.hint_string = self.stub.notrigger_hint;
    }
    self sethintstring(self.stub.hint_string);
    self setinvisibletoplayer(player, !visible);
    return visible;
}

// Namespace zm_altbody/zm_altbody
// Params 0, eflags: 0x0
// Checksum 0x34f49d0, Offset: 0x1570
// Size: 0xe0
function kiosk_trigger_think() {
    while (true) {
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (is_true(self.stub.usable)) {
            self.stub.usable = 0;
            name = self.stub.altbody_name;
            if (isdefined(player.custom_altbody_callback)) {
                player thread [[ player.custom_altbody_callback ]](self, name);
                continue;
            }
            player thread player_try_altbody(self, name);
        }
    }
}

// Namespace zm_altbody/zm_altbody
// Params 4, eflags: 0x4
// Checksum 0x1882122f, Offset: 0x1658
// Size: 0xa4
function private watch_kiosk_triggers(name, trigger_name, trigger_hint, whenvisible) {
    triggers = getentarray(trigger_name, "targetname");
    if (!triggers.size) {
        triggers = getentarray(trigger_name, "script_noteworthy");
    }
    array::thread_all(triggers, &trigger_watch_kiosk, name, trigger_name, trigger_hint, whenvisible);
}

// Namespace zm_altbody/zm_altbody
// Params 4, eflags: 0x4
// Checksum 0xc49d2842, Offset: 0x1708
// Size: 0x170
function private trigger_watch_kiosk(name, *trigger_name, trigger_hint, whenvisible) {
    self endon(#"death");
    self sethintstring(trigger_hint);
    self setcursorhint("HINT_NOICON");
    self setvisibletoall();
    self thread trigger_monitor_visibility(trigger_name, whenvisible);
    if (whenvisible) {
        if (isdefined(self.target)) {
            target = getent(self.target, "targetname");
            self.kiosk = target;
        }
        while (isdefined(self)) {
            waitresult = self waittill(#"trigger");
            player = waitresult.activator;
            if (isdefined(player.custom_altbody_callback)) {
                player thread [[ player.custom_altbody_callback ]](self, trigger_name);
                continue;
            }
            player thread player_try_altbody(self, trigger_name);
        }
    }
}

// Namespace zm_altbody/zm_altbody
// Params 2, eflags: 0x0
// Checksum 0x6ebf6ba7, Offset: 0x1880
// Size: 0x1c0
function trigger_monitor_visibility(name, whenvisible) {
    self endon(#"death");
    self setinvisibletoall();
    level flag::wait_till("start_zombie_round_logic");
    self setvisibletoall();
    pid = 0;
    self.is_unlocked = 1;
    while (isdefined(self)) {
        players = level.players;
        if (pid >= players.size) {
            pid = 0;
        }
        player = players[pid];
        pid++;
        if (isdefined(player)) {
            visible = 1;
            visible = player player_can_altbody(self, name);
            if (visible == whenvisible && (!is_true(player.altbody) || is_true(player.see_kiosks_in_altbody)) && is_true(self.is_unlocked)) {
                self setvisibletoplayer(player);
            } else {
                self setinvisibletoplayer(player);
            }
        }
        wait(randomfloatrange(0.2, 0.5));
    }
}

