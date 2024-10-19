// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_c1466447;

// Namespace namespace_c1466447/namespace_a6aea2c6
// Params 0, eflags: 0x5
// Checksum 0x92e99a72, Offset: 0x180
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"hash_2c983afcd92a9970", &preinit, undefined, undefined, undefined);
}

// Namespace namespace_c1466447/namespace_a6aea2c6
// Params 0, eflags: 0x4
// Checksum 0x22d5f400, Offset: 0x1c8
// Size: 0x11c
function private preinit() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    clientfield::register("toplayer", "" + #"hash_b905d796914b710", 14000, 1, "int");
    clientfield::register("toplayer", "" + #"hash_1b9477ddcf30191f", 16000, 1, "int");
    clientfield::register("toplayer", "" + #"hash_52347bec3f1339fd", 16000, 4, "int");
    zm_trial::register_challenge(#"hash_6c768f3c15d55377", &on_begin, &on_end);
}

// Namespace namespace_c1466447/namespace_a6aea2c6
// Params 1, eflags: 0x4
// Checksum 0xf8722765, Offset: 0x2f0
// Size: 0x29c
function private on_begin(var_2a0af02f) {
    level.var_4ecf5754 = isdefined(var_2a0af02f) ? var_2a0af02f : #"silent_film";
    switch (level.var_4ecf5754) {
    case #"silent_film":
        level thread function_40c7a8fd();
        break;
    case #"hash_5a202c5d6f53d672":
        foreach (player in getplayers()) {
            player thread function_69fa75f8();
        }
        break;
    case #"perk_drunk":
        foreach (player in getplayers()) {
            player thread function_6d8cf829();
        }
        break;
    case #"random_blindness":
        callback::add_callback(#"on_host_migration_end", &function_604ff1eb);
        foreach (player in getplayers()) {
            player thread function_ad641569();
        }
        break;
    }
    callback::on_spawned(&on_player_spawned);
}

// Namespace namespace_c1466447/namespace_a6aea2c6
// Params 1, eflags: 0x4
// Checksum 0x3feb442c, Offset: 0x598
// Size: 0x334
function private on_end(round_reset) {
    switch (level.var_4ecf5754) {
    case #"silent_film":
        foreach (player in getplayers()) {
            player thread clientfield::set_to_player("" + #"hash_b905d796914b710", 0);
        }
        setslowmotion(1.25, 1);
        if (isdefined(level.var_79514f31)) {
            level.var_79514f31 delete();
        }
        break;
    case #"hash_5a202c5d6f53d672":
        if (!round_reset) {
            foreach (player in getplayers()) {
                player function_e0c7d69(1);
                player clientfield::set_to_player("" + #"hash_1b9477ddcf30191f", 0);
            }
        }
        break;
    case #"perk_drunk":
        foreach (player in getplayers()) {
            player clientfield::set_to_player("" + #"hash_52347bec3f1339fd", 0);
        }
        break;
    case #"random_blindness":
        callback::remove_callback(#"on_host_migration_end", &function_604ff1eb);
        break;
    }
    level.var_4ecf5754 = undefined;
    callback::remove_on_spawned(&on_player_spawned);
}

// Namespace namespace_c1466447/namespace_a6aea2c6
// Params 0, eflags: 0x4
// Checksum 0x547fbdfb, Offset: 0x8d8
// Size: 0x4c
function private on_player_spawned() {
    if (level.var_4ecf5754 === #"silent_film") {
        self clientfield::set_to_player("" + #"hash_b905d796914b710", 1);
    }
}

// Namespace namespace_c1466447/namespace_a6aea2c6
// Params 0, eflags: 0x0
// Checksum 0x5a7243c, Offset: 0x930
// Size: 0x154
function function_40c7a8fd() {
    level endon(#"hash_7646638df88a3656", #"end_game");
    wait(3.5);
    foreach (player in getplayers()) {
        player clientfield::set_to_player("" + #"hash_b905d796914b710", 1);
    }
    wait(2);
    setslowmotion(1, 1.25);
    level.var_79514f31 = spawn("script_origin", (0, 0, 0));
    level.var_79514f31 playloopsound(#"hash_1eafdf46ffbf2308");
}

// Namespace namespace_c1466447/namespace_a6aea2c6
// Params 0, eflags: 0x4
// Checksum 0xb1c29752, Offset: 0xa90
// Size: 0x144
function private function_69fa75f8() {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656");
    while (true) {
        self clientfield::set_to_player("" + #"hash_1b9477ddcf30191f", 1);
        self function_e0c7d69(0);
        while (true) {
            s_waitresult = self waittilltimeout(1, #"weapon_fired", #"hash_3e0895cd0cc16d2d", #"lightning_ball_created", #"hash_4d733389a8e35a7c");
            if (s_waitresult._notify != "timeout") {
                self clientfield::set_to_player("" + #"hash_1b9477ddcf30191f", 0);
                self function_e0c7d69(1);
                continue;
            }
            break;
        }
    }
}

// Namespace namespace_c1466447/namespace_a6aea2c6
// Params 0, eflags: 0x0
// Checksum 0x83a4c3ae, Offset: 0xbe0
// Size: 0x96
function function_6d8cf829() {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656", #"end_game");
    while (true) {
        n_perks = self.var_67ba1237.size + self.var_466b927f.size;
        self clientfield::set_to_player("" + #"hash_52347bec3f1339fd", n_perks);
        wait(1);
    }
}

// Namespace namespace_c1466447/namespace_a6aea2c6
// Params 0, eflags: 0x4
// Checksum 0xa96d0756, Offset: 0xc80
// Size: 0x200
function private function_ad641569() {
    self notify("3d0a827cbf03ae74");
    self endon("3d0a827cbf03ae74");
    self endon(#"disconnect");
    level endoncallback(&function_1a109202, #"hash_7646638df88a3656", #"host_migration_begin");
    while (true) {
        wait(randomintrangeinclusive(5, 15));
        var_6eabfd9d = getstatuseffect("blind_zm_catalyst");
        n_duration = randomintrangeinclusive(5000, 7500);
        self status_effect::status_effect_apply(var_6eabfd9d, undefined, self, 0, n_duration);
        wait(float(n_duration) / 1000);
        var_3caa2c0f = getstatuseffect("deaf_electricity_catalyst");
        self status_effect::status_effect_apply(var_3caa2c0f, undefined, self, 0, n_duration);
        wait(float(n_duration) / 1000);
        if (self status_effect::function_4617032e(var_6eabfd9d.setype)) {
            self status_effect::function_408158ef(var_6eabfd9d.setype, var_6eabfd9d.var_18d16a6b);
        }
        if (self status_effect::function_4617032e(var_3caa2c0f.setype)) {
            self status_effect::function_408158ef(var_3caa2c0f.setype, var_3caa2c0f.var_18d16a6b);
        }
    }
}

// Namespace namespace_c1466447/namespace_a6aea2c6
// Params 1, eflags: 0x0
// Checksum 0x55d95280, Offset: 0xe88
// Size: 0x168
function function_1a109202(str_notify) {
    if (str_notify === "host_migration_begin") {
        var_6eabfd9d = getstatuseffect("blind_zm_catalyst");
        var_3caa2c0f = getstatuseffect("deaf_electricity_catalyst");
        foreach (player in getplayers()) {
            if (player status_effect::function_4617032e(var_6eabfd9d.setype)) {
                player status_effect::function_408158ef(var_6eabfd9d.setype, var_6eabfd9d.var_18d16a6b);
            }
            if (player status_effect::function_4617032e(var_3caa2c0f.setype)) {
                player status_effect::function_408158ef(var_3caa2c0f.setype, var_3caa2c0f.var_18d16a6b);
            }
        }
    }
}

// Namespace namespace_c1466447/namespace_a6aea2c6
// Params 0, eflags: 0x4
// Checksum 0x83460902, Offset: 0xff8
// Size: 0xc0
function private function_604ff1eb() {
    level endon(#"hash_7646638df88a3656", #"end_game");
    wait(5);
    foreach (player in getplayers()) {
        player thread function_ad641569();
    }
}

