// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\zm_utility.csc;
#using script_d67878983e3d7c;
#using script_4e53735256f112ac;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_9111e6ab;

// Namespace namespace_9111e6ab/namespace_9111e6ab
// Params 0, eflags: 0x5
// Checksum 0x8ec15bf2, Offset: 0x178
// Size: 0x44
function private autoexec __init__system__() {
    system::register(#"hash_6c156e681484d01a", &preinit, undefined, undefined, #"hash_13a43d760497b54d");
}

// Namespace namespace_9111e6ab/namespace_9111e6ab
// Params 0, eflags: 0x6 linked
// Checksum 0xcb009d53, Offset: 0x1c8
// Size: 0xd4
function private preinit() {
    clientfield::register("allplayers", "" + #"hash_1668fcf85f7c231", 1, 2, "int", &function_1e0fa475, 0, 0);
    clientfield::register("actor", "" + #"hash_70a85ea8b0e1b09c", 1, 2, "int", &function_9db3514d, 0, 0);
    callback::on_spawned(&on_spawned);
}

// Namespace namespace_9111e6ab/namespace_9111e6ab
// Params 7, eflags: 0x2 linked
// Checksum 0xc261de5c, Offset: 0x2a8
// Size: 0x7e4
function function_1e0fa475(localclientnum, oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    self endon(#"death");
    self util::waittill_dobj(binitialsnap);
    if (!isdefined(level.var_9ec7691e)) {
        level.var_9ec7691e = [];
    }
    if (!isdefined(level.var_9ec7691e)) {
        level.var_9ec7691e = [binitialsnap];
    }
    var_47c85523 = self getentitynumber();
    if (!isdefined(level.var_9ec7691e[binitialsnap][var_47c85523])) {
        level.var_9ec7691e[binitialsnap][var_47c85523] = spawnstruct();
    }
    if (bwastimejump) {
        if (bwastimejump == 1) {
            if (is_true(self.var_60b31640) && fieldname == 3) {
                self function_15de0a8a(binitialsnap);
            }
            self.var_60b31640 = 1;
        } else if (bwastimejump == 2 || bwastimejump == 3) {
            self.var_23fa23a9 = 1;
        }
        if (zm_utility::function_f8796df3(binitialsnap)) {
            if (!isdefined(level.var_9ec7691e[binitialsnap][var_47c85523].var_6476182a) && self function_da43934d()) {
                level.var_9ec7691e[binitialsnap][var_47c85523].var_6476182a = playfxoncamera(binitialsnap, #"hash_1ff29a0f4b4d68d", (0, 0, 0), (1, 0, 0), (0, 0, 1));
                level.var_9ec7691e[binitialsnap][var_47c85523].var_b8492ef8 = util::playfxontag(binitialsnap, #"hash_654db3650b20ca65", self, "j_spine4");
            }
        } else {
            if (!isdefined(level.var_9ec7691e[binitialsnap][var_47c85523].var_23899ee1)) {
                level.var_9ec7691e[binitialsnap][var_47c85523].var_23899ee1 = util::playfxontag(binitialsnap, #"hash_7ac55bdd9d21f779", self, "j_head");
            }
            if (!isdefined(level.var_9ec7691e[binitialsnap][var_47c85523].var_9a99751c)) {
                level.var_9ec7691e[binitialsnap][var_47c85523].var_9a99751c = util::playfxontag(binitialsnap, #"hash_a54ef74ae1528ab", self, "j_spine4");
            }
        }
        if (!isdefined(level.var_9ec7691e[binitialsnap][var_47c85523].var_f3844d4d)) {
            self playsound(binitialsnap, #"hash_4ae03761643454de", self.origin + (0, 0, 75));
            level.var_9ec7691e[binitialsnap][var_47c85523].var_f3844d4d = self playloopsound(#"hash_29e3629ab48d4062", undefined, (0, 0, 75));
        }
        if (is_true(self.var_23fa23a9)) {
            a_players = getplayers(binitialsnap, self.team, self.origin, 400);
            foreach (player_source in a_players) {
                if (player_source === self) {
                    continue;
                }
                if (is_true(player_source.var_60b31640)) {
                    if (zm_utility::function_f8796df3(binitialsnap)) {
                        var_606b3e1 = self.origin;
                        var_a31b967a = self.angles;
                        var_a6939bee = 1;
                    } else if (self haspart(binitialsnap, "j_spineupper")) {
                        var_98dfaf9d = "j_spineupper";
                        var_606b3e1 = self gettagorigin("j_spineupper");
                        var_a31b967a = self gettagangles("j_spineupper");
                    }
                    if (player_source haspart(binitialsnap, "j_spineupper")) {
                        var_9d127d90 = "j_spineupper";
                    }
                    if ((is_true(var_a6939bee) || isdefined(var_98dfaf9d)) && isdefined(var_9d127d90)) {
                        if (!isdefined(self.var_a2820ebf)) {
                            self.var_a2820ebf = util::spawn_model(binitialsnap, "tag_origin", var_606b3e1, var_a31b967a);
                            self.var_a2820ebf notsolid();
                            if (is_true(var_a6939bee)) {
                                self.var_a2820ebf linktocamera(4, (16, 0, -10), (0, 0, 0), 1);
                                self.var_a2820ebf.var_a6939bee = 1;
                            } else {
                                self.var_a2820ebf linkto(self, var_98dfaf9d);
                            }
                        }
                        if (!isdefined(self.var_ae02f041[binitialsnap][var_47c85523]) && !function_65b9eb0f(binitialsnap)) {
                            self playsound(binitialsnap, #"hash_2924768fc653f982", self.origin + (0, 0, 75));
                            self.var_ae02f041[binitialsnap][var_47c85523] = beam::function_cfb2f62a(binitialsnap, self.var_a2820ebf, "tag_origin", player_source, var_9d127d90, "beam9_zm_tesla_storm");
                        }
                        if (!isdefined(self.var_512656d8[binitialsnap][var_47c85523]) && !function_65b9eb0f(binitialsnap)) {
                            self.var_512656d8[binitialsnap][var_47c85523] = beam::function_cfb2f62a(binitialsnap, self.var_a2820ebf, "tag_origin", player_source, var_9d127d90, "beam9_zm_tesla_storm_elec");
                        }
                    }
                }
            }
        }
        return;
    }
    self function_15de0a8a(binitialsnap);
}

// Namespace namespace_9111e6ab/namespace_9111e6ab
// Params 1, eflags: 0x2 linked
// Checksum 0x2b8a4e12, Offset: 0xa98
// Size: 0x24
function on_spawned(localclientnum) {
    self function_15de0a8a(localclientnum);
}

// Namespace namespace_9111e6ab/namespace_9111e6ab
// Params 1, eflags: 0x2 linked
// Checksum 0x4f3515ac, Offset: 0xac8
// Size: 0x434
function function_15de0a8a(localclientnum) {
    var_47c85523 = self getentitynumber();
    self.var_60b31640 = undefined;
    self.var_23fa23a9 = undefined;
    self notify(#"hash_1b8c8f7116f233f2");
    if (self postfx::function_556665f2(#"hash_58e9d4772527f71a") && self function_21c0fa55()) {
        self postfx::exitpostfxbundle(#"hash_58e9d4772527f71a");
    }
    if (isdefined(level.var_9ec7691e[localclientnum][var_47c85523].var_6476182a)) {
        stopfx(localclientnum, level.var_9ec7691e[localclientnum][var_47c85523].var_6476182a);
        level.var_9ec7691e[localclientnum][var_47c85523].var_6476182a = undefined;
    }
    if (isdefined(level.var_9ec7691e[localclientnum][var_47c85523].var_b8492ef8)) {
        stopfx(localclientnum, level.var_9ec7691e[localclientnum][var_47c85523].var_b8492ef8);
        level.var_9ec7691e[localclientnum][var_47c85523].var_b8492ef8 = undefined;
    }
    if (isdefined(level.var_9ec7691e[localclientnum][var_47c85523].var_23899ee1)) {
        stopfx(localclientnum, level.var_9ec7691e[localclientnum][var_47c85523].var_23899ee1);
        level.var_9ec7691e[localclientnum][var_47c85523].var_23899ee1 = undefined;
    }
    if (isdefined(level.var_9ec7691e[localclientnum][var_47c85523].var_9a99751c)) {
        stopfx(localclientnum, level.var_9ec7691e[localclientnum][var_47c85523].var_9a99751c);
        level.var_9ec7691e[localclientnum][var_47c85523].var_9a99751c = undefined;
    }
    if (isdefined(level.var_9ec7691e[localclientnum][var_47c85523].var_f3844d4d)) {
        self playsound(localclientnum, #"hash_a4211e0f9977ecb", self.origin + (0, 0, 75));
        self stoploopsound(level.var_9ec7691e[localclientnum][var_47c85523].var_f3844d4d);
        level.var_9ec7691e[localclientnum][var_47c85523].var_f3844d4d = undefined;
    }
    if (isdefined(self.var_ae02f041[localclientnum][var_47c85523])) {
        self playsound(localclientnum, #"hash_26cf0ef2cb60a802", self.origin + (0, 0, 75));
        beam::function_47deed80(localclientnum, self.var_ae02f041[localclientnum][var_47c85523], self);
        self.var_ae02f041[localclientnum][var_47c85523] = undefined;
    }
    if (isdefined(self.var_512656d8[localclientnum][var_47c85523])) {
        beam::function_47deed80(localclientnum, self.var_512656d8[localclientnum][var_47c85523], self);
        self.var_512656d8[localclientnum][var_47c85523] = undefined;
    }
    if (isdefined(self.var_a2820ebf)) {
        if (is_true(self.var_a2820ebf.var_a6939bee)) {
            self.var_a2820ebf function_a052b638();
        }
        self.var_a2820ebf delete();
    }
}

// Namespace namespace_9111e6ab/namespace_9111e6ab
// Params 7, eflags: 0x2 linked
// Checksum 0xf202a7f8, Offset: 0xf08
// Size: 0x2be
function function_9db3514d(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        var_9879245b = #"hash_1b7434074de37b57";
        if (isdefined(self.archetype)) {
            switch (self.archetype) {
            case #"hash_7c0d83ac1e845ac2":
                var_9879245b = #"hash_1bdd3e074e3c755e";
                break;
            case #"mechz":
                var_9879245b = #"hash_685b3b698ec70340";
                break;
            case #"raz":
                var_9879245b = #"hash_1bda5f074e3a779a";
                break;
            case #"mimic":
                var_9879245b = #"hash_32f09fc1f3674574";
                break;
            case #"zombie_dog":
            case #"zombie":
            case #"avogadro":
            default:
                var_9879245b = #"hash_1b7434074de37b57";
                break;
            }
        }
        str_fx_tag = isdefined(self gettagorigin("j_spine4")) ? "j_spine4" : "tag_origin";
        self.var_d6f26e4 = util::playfxontag(fieldname, var_9879245b, self, str_fx_tag);
        if (!isdefined(self.var_7c085d47)) {
            self playsound(0, #"hash_20d0ecdd50323b09", self.origin + (0, 0, 50));
            self.var_7c085d47 = self playloopsound("zmb_ammomod_deadwire_stunned_lp");
        }
        return;
    }
    if (isdefined(self.var_d6f26e4)) {
        stopfx(fieldname, self.var_d6f26e4);
        self.var_d6f26e4 = undefined;
    }
    if (isdefined(self.var_7c085d47)) {
        self stoploopsound(self.var_7c085d47);
        self.var_7c085d47 = undefined;
    }
}

