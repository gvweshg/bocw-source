// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\animation_shared.gsc;

#namespace teleport;

// Namespace teleport/teleport_shared
// Params 3, eflags: 0x2 linked
// Checksum 0xf8cb8a69, Offset: 0x108
// Size: 0x340
function team(kvp, var_dad37549, var_b095575e = 0) {
    level function_1d2a3300();
    var_bac46abd = self function_166effac(kvp, var_dad37549);
    if (!isdefined(var_bac46abd)) {
        return 0;
    }
    if (var_bac46abd.a_s_players.size < level.players.size) {
        assertmsg("<unknown string>");
        return undefined;
    }
    foreach (e_player in level.players) {
        foreach (s_teleport in var_bac46abd.a_s_players) {
            if (!is_true(s_teleport.b_used)) {
                e_player function_29305761(s_teleport, var_bac46abd.var_dad37549, var_b095575e);
                break;
            }
        }
    }
    if (isdefined(level.heroes)) {
        foreach (ai_hero in level.heroes) {
            foreach (s_teleport in var_bac46abd.a_s_heroes) {
                if (isdefined(s_teleport.script_hero_name) && s_teleport.script_hero_name != ai_hero.targetname) {
                    continue;
                }
                if (!is_true(s_teleport.b_used)) {
                    ai_hero function_df1911b9(s_teleport, var_bac46abd.var_dad37549);
                    break;
                }
            }
        }
    }
    function_ff8a7a3(kvp);
    return 1;
}

// Namespace teleport/teleport_shared
// Params 4, eflags: 0x2 linked
// Checksum 0x4f5d6895, Offset: 0x450
// Size: 0x178
function player(e_player, kvp, var_dad37549, var_b095575e = 0) {
    if (!isalive(e_player)) {
        return;
    }
    level function_1d2a3300();
    var_20212d26 = self function_e6615993(kvp, var_dad37549);
    str_key = var_20212d26.str_key;
    str_value = var_20212d26.str_value;
    foreach (s_teleport in level.a_s_teleport_players) {
        if (s_teleport.(str_key) === str_value && !is_true(s_teleport.b_used)) {
            e_player function_29305761(s_teleport, var_20212d26.var_dad37549, var_b095575e);
            return 1;
        }
    }
    return 0;
}

// Namespace teleport/teleport_shared
// Params 3, eflags: 0x2 linked
// Checksum 0x3bc7789d, Offset: 0x5d0
// Size: 0x178
function hero(ai_hero, kvp, var_dad37549) {
    level function_1d2a3300();
    var_20212d26 = self function_e6615993(kvp, var_dad37549);
    str_key = var_20212d26.str_key;
    str_value = var_20212d26.str_value;
    foreach (s_teleport in level.var_c89d2304) {
        if (isdefined(s_teleport.script_hero_name) && s_teleport.script_hero_name != ai_hero.targetname) {
            continue;
        }
        if (s_teleport.(str_key) === str_value && !is_true(s_teleport.b_used)) {
            ai_hero function_df1911b9(s_teleport, var_20212d26.var_dad37549);
            return true;
        }
    }
    return false;
}

// Namespace teleport/teleport_shared
// Params 1, eflags: 0x2 linked
// Checksum 0xd173d532, Offset: 0x750
// Size: 0xc6
function function_ff8a7a3(kvp) {
    var_20212d26 = self function_e6615993(kvp);
    foreach (s_teleport in struct::get_array(var_20212d26.str_value, var_20212d26.str_key)) {
        s_teleport.b_used = undefined;
    }
}

// Namespace teleport/teleport_shared
// Params 0, eflags: 0x6 linked
// Checksum 0x33730141, Offset: 0x820
// Size: 0x84
function private function_1d2a3300() {
    if (!isdefined(level.a_s_teleport_players)) {
        if (!isdefined(level.a_s_teleport_players)) {
            level.a_s_teleport_players = struct::get_array("teleport_player", "variantname");
        }
        if (!isdefined(level.var_c89d2304)) {
            level.var_c89d2304 = struct::get_array("teleport_hero", "variantname");
        }
    }
}

// Namespace teleport/teleport_shared
// Params 2, eflags: 0x6 linked
// Checksum 0x21836785, Offset: 0x8b0
// Size: 0x134
function private function_e6615993(kvp, var_dad37549) {
    if (isdefined(self.script_teleport_location)) {
        str_value = self.script_teleport_location;
        str_key = "script_teleport_location";
        if (!isdefined(var_dad37549) && isdefined(self.script_regroup_distance)) {
            var_dad37549 = self.script_regroup_distance;
        }
    } else if (isdefined(kvp) && isarray(kvp)) {
        str_value = kvp[0];
        str_key = kvp[1];
    } else {
        str_value = kvp;
        str_key = "script_teleport_location";
    }
    if (!isdefined(var_dad37549)) {
        var_dad37549 = 0;
    }
    if (!isdefined(str_value) || !isdefined(str_key)) {
        assertmsg("<unknown string>");
        return undefined;
    }
    return {#str_value:str_value, #str_key:str_key, #var_dad37549:var_dad37549};
}

// Namespace teleport/teleport_shared
// Params 2, eflags: 0x6 linked
// Checksum 0x27ae1fa8, Offset: 0x9f0
// Size: 0x2e4
function private function_166effac(kvp, var_dad37549) {
    var_20212d26 = self function_e6615993(kvp, var_dad37549);
    if (!isdefined(var_20212d26)) {
        return undefined;
    }
    str_key = var_20212d26.str_key;
    str_value = var_20212d26.str_value;
    a_s_players = [];
    foreach (s_teleport_player in level.a_s_teleport_players) {
        if (s_teleport_player.(str_key) === str_value) {
            if (!isdefined(a_s_players)) {
                a_s_players = [];
            } else if (!isarray(a_s_players)) {
                a_s_players = array(a_s_players);
            }
            if (!isinarray(a_s_players, s_teleport_player)) {
                a_s_players[a_s_players.size] = s_teleport_player;
            }
        }
    }
    a_s_heroes = [];
    if (isdefined(level.heroes)) {
        foreach (s_teleport_hero in level.var_c89d2304) {
            if (s_teleport_hero.(str_key) === str_value) {
                if (!isdefined(a_s_heroes)) {
                    a_s_heroes = [];
                } else if (!isarray(a_s_heroes)) {
                    a_s_heroes = array(a_s_heroes);
                }
                if (!isinarray(a_s_heroes, s_teleport_hero)) {
                    a_s_heroes[a_s_heroes.size] = s_teleport_hero;
                }
            }
        }
        if (a_s_heroes.size < level.heroes.size) {
            assertmsg("<unknown string>");
            return undefined;
        }
    }
    return {#a_s_players:a_s_players, #a_s_heroes:a_s_heroes, #var_dad37549:var_20212d26.var_dad37549};
}

// Namespace teleport/teleport_shared
// Params 3, eflags: 0x6 linked
// Checksum 0x897aded4, Offset: 0xce0
// Size: 0x216
function private function_29305761(s_teleport, var_dad37549, var_b095575e = 0) {
    self endon(#"death");
    if (distancesquared(s_teleport.origin, self.origin) < var_dad37549 * var_dad37549) {
        return;
    }
    s_teleport.b_used = 1;
    if (!var_b095575e) {
        self thread lui::screen_flash(0, 0.3, 0.3);
    }
    if (self isinvehicle()) {
        vehicle = self getvehicleoccupied();
        if (is_true(s_teleport.script_allow_vehicle)) {
            vehicle.origin = s_teleport.origin;
            vehicle.angles = s_teleport.angles;
            self notify(#"teleported");
            vehicle notify(#"teleported");
            return;
        }
        vehicle makevehicleunusable();
    }
    if (isdefined(self._scene_object)) {
        [[ self._scene_object ]]->stop();
    } else if (self isplayinganimscripted()) {
        self animation::stop();
    }
    self setorigin(s_teleport.origin);
    self setplayerangles(s_teleport.angles);
    if (isdefined(vehicle)) {
        vehicle thread util::auto_delete();
    }
    self notify(#"teleported");
}

// Namespace teleport/teleport_shared
// Params 2, eflags: 0x2 linked
// Checksum 0x7214cb13, Offset: 0xf00
// Size: 0x116
function function_df1911b9(s_teleport, var_dad37549) {
    if (distancesquared(s_teleport.origin, self.origin) < var_dad37549 * var_dad37549) {
        return;
    }
    s_teleport.b_used = 1;
    self forceteleport(s_teleport.origin, s_teleport.angles);
    if (isdefined(s_teleport.target)) {
        e_target = struct::get(s_teleport.target);
        if (!isdefined(e_target)) {
            e_target = getnode(s_teleport.target, "targetname");
        }
        self thread spawner::go_to_node(e_target);
    } else {
        self setgoal(s_teleport.origin);
    }
    self notify(#"teleported");
}

