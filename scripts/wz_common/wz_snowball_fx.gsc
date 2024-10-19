// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace wz_snowball_fx;

// Namespace wz_snowball_fx/wz_snowball_fx
// Params 0, eflags: 0x5
// Checksum 0xb6889834, Offset: 0xf0
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"wz_snowball_fx", &preinit, undefined, undefined, undefined);
}

// Namespace wz_snowball_fx/wz_snowball_fx
// Params 0, eflags: 0x6 linked
// Checksum 0xd0e08ffd, Offset: 0x138
// Size: 0x84
function private preinit() {
    clientfield::register("toplayer", "player_hit_freezing_snowball", 9000, 1, "int");
    clientfield::register("toplayer", "player_hit_snowball_direction", 9000, 4, "int");
    callback::on_player_damage(&function_c9509a9c);
}

// Namespace wz_snowball_fx/wz_snowball_fx
// Params 1, eflags: 0x2 linked
// Checksum 0x3032411e, Offset: 0x1c8
// Size: 0x434
function function_c9509a9c(params) {
    if (isalive(self) && isplayer(self)) {
        if (params.weapon.name === #"snowball") {
            var_feafe576 = 0;
            var_cb01806c = 0;
            bleft = 0;
            bright = 0;
            var_4e1c6c81 = 1;
            var_9ed2938d = 1;
            attacker = params.eattacker;
            height_diff = attacker.origin[2] - self.origin[2];
            if (height_diff < -16) {
                var_feafe576 = 1;
                var_4e1c6c81 = 0;
            }
            if (height_diff > 16) {
                var_cb01806c = 1;
                var_4e1c6c81 = 0;
            }
            var_1f579e1d = attacker.origin - self.origin;
            var_1f579e1d = (var_1f579e1d[0], var_1f579e1d[1], 0);
            vec_right = anglestoright(self.angles);
            vec_right = vectornormalize(vec_right);
            vec_right = (vec_right[0], vec_right[1], 0);
            var_1f579e1d = vectornormalize(var_1f579e1d);
            vec_dot = vectordot(var_1f579e1d, vec_right);
            if (vec_dot > 0.2) {
                bright = 1;
                var_9ed2938d = 0;
            } else if (vec_dot < -0.2) {
                bleft = 1;
                var_9ed2938d = 0;
            }
            if (var_4e1c6c81 && var_9ed2938d) {
                self clientfield::set_to_player("player_hit_snowball_direction", 1);
            } else if (var_4e1c6c81 && bleft) {
                self clientfield::set_to_player("player_hit_snowball_direction", 2);
            } else if (var_4e1c6c81 && bright) {
                self clientfield::set_to_player("player_hit_snowball_direction", 3);
            } else if (var_cb01806c && var_9ed2938d) {
                self clientfield::set_to_player("player_hit_snowball_direction", 5);
            } else if (var_feafe576 && var_9ed2938d) {
                self clientfield::set_to_player("player_hit_snowball_direction", 4);
            } else if (var_feafe576 && bleft) {
                self clientfield::set_to_player("player_hit_snowball_direction", 6);
            } else if (var_feafe576 && bright) {
                self clientfield::set_to_player("player_hit_snowball_direction", 8);
            } else if (var_cb01806c && bleft) {
                self clientfield::set_to_player("player_hit_snowball_direction", 9);
            } else if (var_cb01806c && bright) {
                self clientfield::set_to_player("player_hit_snowball_direction", 10);
            }
            self thread function_4df181ef();
        }
    }
}

// Namespace wz_snowball_fx/wz_snowball_fx
// Params 0, eflags: 0x2 linked
// Checksum 0x2d348a4c, Offset: 0x608
// Size: 0x84
function function_4df181ef() {
    self endoncallback(&function_8407e8ae, #"death", #"game_ended");
    self clientfield::set_to_player("player_hit_freezing_snowball", 1);
    wait(2);
    self clientfield::set_to_player("player_hit_freezing_snowball", 0);
}

// Namespace wz_snowball_fx/wz_snowball_fx
// Params 1, eflags: 0x2 linked
// Checksum 0xe4d727ec, Offset: 0x698
// Size: 0x2c
function function_8407e8ae(*notifyhash) {
    self clientfield::set_to_player("player_hit_freezing_snowball", 0);
}

