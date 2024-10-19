// Atian COD Tools GSC CW decompiler test
#namespace targetting_delay;

// Namespace targetting_delay/targetting_delay
// Params 1, eflags: 0x2 linked
// Checksum 0x45ff3b1a, Offset: 0x80
// Size: 0x3fa
function function_7e1a12ce(radius) {
    self endon(#"death");
    level endon(#"game_ended");
    if (!isdefined(radius)) {
        radius = 8000;
    }
    self.var_5ddd7c26 = {};
    info = self.var_5ddd7c26;
    info.var_d1e06a5f = [];
    info.var_2fae95e = [];
    update_interval = isdefined(self.var_ab84134) ? self.var_ab84134 : min(0.25, 1);
    var_dd3b2438 = int(update_interval * 1000);
    while (true) {
        enemy_players = self getenemiesinradius(self.origin, radius);
        foreach (enemy in enemy_players) {
            if (!isplayer(enemy)) {
                continue;
            }
            delay = int(max(enemy function_9bd25293(), 250));
            if (delay <= 0) {
                continue;
            }
            entnum = enemy getentitynumber();
            if (isdefined(info.var_d1e06a5f[entnum]) && (!isalive(enemy) || isdefined(enemy.lastspawntime) && enemy.lastspawntime > info.var_d1e06a5f[entnum])) {
                info.var_d1e06a5f[entnum] = undefined;
                info.var_2fae95e[entnum] = undefined;
            }
            if (!isalive(enemy)) {
                continue;
            }
            if (issentient(self) && self cansee(enemy)) {
                if (!isdefined(info.var_2fae95e[entnum])) {
                    info.var_2fae95e[entnum] = 0;
                }
                if (info.var_2fae95e[entnum] < delay) {
                    self setpersonalignore(enemy, update_interval);
                }
                info.var_d1e06a5f[entnum] = gettime();
                info.var_2fae95e[entnum] = info.var_2fae95e[entnum] + var_dd3b2438;
                continue;
            }
            if (isdefined(info.var_d1e06a5f[entnum])) {
                resettime = int(max(enemy function_348ab5dd(), 250));
                if (gettime() - info.var_d1e06a5f[entnum] > resettime) {
                    info.var_d1e06a5f[entnum] = undefined;
                    info.var_2fae95e[entnum] = undefined;
                }
            }
        }
        wait(update_interval);
    }
}

// Namespace targetting_delay/targetting_delay
// Params 2, eflags: 0x0
// Checksum 0x6343e309, Offset: 0x488
// Size: 0x312
function function_568d5de9(radius, var_2770319) {
    self endon(#"death");
    level endon(#"game_ended");
    if (!isdefined(radius)) {
        radius = 8000;
    }
    if (!isdefined(var_2770319)) {
        var_2770319 = 250;
    }
    self.var_5ddd7c26 = {};
    info = self.var_5ddd7c26;
    info.var_d1e06a5f = [];
    info.var_2fae95e = [];
    update_interval = isdefined(self.var_ab84134) ? self.var_ab84134 : min(0.25, 1);
    var_dd3b2438 = int(update_interval * 1000);
    while (true) {
        enemy_players = self getenemiesinradius(self.origin, radius);
        foreach (enemy in enemy_players) {
            if (isplayer(enemy)) {
                continue;
            }
            entnum = enemy getentitynumber();
            if (isdefined(info.var_d1e06a5f[entnum]) && (!isalive(enemy) || isdefined(enemy.lastspawntime) && enemy.lastspawntime > info.var_d1e06a5f[entnum])) {
                info.var_d1e06a5f[entnum] = undefined;
                info.var_2fae95e[entnum] = undefined;
            }
            if (!isalive(enemy)) {
                continue;
            }
            if (issentient(self)) {
                if (!isdefined(info.var_2fae95e[entnum])) {
                    info.var_2fae95e[entnum] = 0;
                }
                if (info.var_2fae95e[entnum] < var_2770319) {
                    self setpersonalignore(enemy, update_interval);
                }
                info.var_d1e06a5f[entnum] = gettime();
                info.var_2fae95e[entnum] = info.var_2fae95e[entnum] + var_dd3b2438;
            }
        }
        wait(update_interval);
    }
}

// Namespace targetting_delay/targetting_delay
// Params 2, eflags: 0x2 linked
// Checksum 0x2b837881, Offset: 0x7a8
// Size: 0x12a
function function_1c169b3a(enemy, defaultdelay = 250) {
    if (isplayer(enemy)) {
        delay = int(max(enemy function_9bd25293(), defaultdelay));
        if (delay <= 0) {
            return true;
        }
    } else {
        delay = defaultdelay;
    }
    info = self.var_5ddd7c26;
    if (!isdefined(info) || !isdefined(info.var_2fae95e)) {
        return false;
    }
    if ((isdefined(info.var_2fae95e[enemy getentitynumber()]) ? info.var_2fae95e[enemy getentitynumber()] : 0) < delay) {
        return false;
    }
    return true;
}

// Namespace targetting_delay/targetting_delay
// Params 2, eflags: 0x2 linked
// Checksum 0xfeebc27e, Offset: 0x8e0
// Size: 0x144
function function_a4d6d6d8(enemy, var_2770319) {
    if (isdefined(enemy)) {
        if (isplayer(enemy)) {
            delay = int(max(enemy function_9bd25293(), 250));
            if (delay <= 0) {
                return;
            }
            if (!isdefined(var_2770319)) {
                var_2770319 = delay;
            }
        } else if (!isdefined(var_2770319)) {
            var_2770319 = 250;
        }
        info = self.var_5ddd7c26;
        if (!isdefined(info) || !isdefined(info.var_2fae95e)) {
            return;
        }
        entnum = enemy getentitynumber();
        if (!isdefined(info.var_2fae95e[entnum])) {
            info.var_2fae95e[entnum] = 0;
        }
        info.var_2fae95e[entnum] = info.var_2fae95e[entnum] + var_2770319;
    }
}

