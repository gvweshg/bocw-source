// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\callings\zm_callings.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace zm_callings_devgui;

/#

    // Namespace zm_callings_devgui/zm_callings_devgui
    // Params 0, eflags: 0x0
    // Checksum 0x2e9d8ec6, Offset: 0x98
    // Size: 0x1c4
    function function_9f47471() {
        level flag::wait_till("<unknown string>");
        zm_devgui::add_custom_devgui_callback(&function_6cbc14bb);
        if (!isdefined(level.var_314051a1)) {
            return;
        }
        var_94237d8 = array(#"hash_20deab97abbf7b12", #"hash_764a5fc3ba8820d2", #"hash_647ebc7d24425fee", #"tcmgoal");
        i = 0;
        foreach (var_acbd7392 in var_94237d8) {
            var_31e48984 = "<unknown string>" + function_9e72a96(var_acbd7392);
            adddebugcommand("<unknown string>" + function_9e72a96(var_acbd7392) + "<unknown string>" + i + "<unknown string>" + var_31e48984 + "<unknown string>");
            i += 1;
        }
        adddebugcommand("<unknown string>");
    }

    // Namespace zm_callings_devgui/zm_callings_devgui
    // Params 1, eflags: 0x0
    // Checksum 0x6faeaf64, Offset: 0x268
    // Size: 0x57c
    function function_1d4f22e4(cmd) {
        if (strstartswith(cmd, "<unknown string>")) {
            str = strreplace(cmd, "<unknown string>", "<unknown string>");
            arr = strtok(str, "<unknown string>");
            taskid = arr[0];
            taskid = int(taskid);
            setdvar(#"zm_active_daily_calling", taskid);
            setdvar(#"zm_active_event_calling", 0);
            setdvar(#"hash_acdd08b365cb62f", 1);
            return;
        }
        if (strstartswith(cmd, "<unknown string>")) {
            str = strreplace(cmd, "<unknown string>", "<unknown string>");
            var_762ca590 = hash(str);
            if (!getdvarint(#"hash_11da02ca40639de5", 0)) {
                iprintln("<unknown string>" + self.name);
            } else if (!getdvarint(#"hash_66c8247d6d84d328", 0) || !getdvarint(#"hash_5341de25cb0d6f66", 0) || !getdvarint(#"hash_47067c5d4fe9075e", 0)) {
                iprintln("<unknown string>");
            } else if (!isdefined(self.var_96d6f6d1)) {
                iprintln(self.name + "<unknown string>");
            } else {
                var_fe8112e6 = 0;
                foreach (var_d1017f27 in self.var_96d6f6d1) {
                    if (var_d1017f27.var_30c47a21 == var_762ca590) {
                        self zm_callings::function_4368582a(var_d1017f27, var_d1017f27.var_e226ec4f);
                        var_fe8112e6 = 1;
                    }
                }
                if (!is_true(var_fe8112e6)) {
                    iprintln(self.name + "<unknown string>" + function_9e72a96(var_762ca590) + "<unknown string>");
                }
            }
            return;
        }
        if (strstartswith(cmd, "<unknown string>")) {
            str = strreplace(cmd, "<unknown string>", "<unknown string>");
            arr = strtok(str, "<unknown string>");
            interval = arr[0];
            interval = int(interval);
            if (!getdvarint(#"hash_11da02ca40639de5", 0)) {
                iprintln("<unknown string>" + self.name);
                return;
            }
            if (!getdvarint(#"hash_66c8247d6d84d328", 0) || !getdvarint(#"hash_5341de25cb0d6f66", 0) || !getdvarint(#"hash_47067c5d4fe9075e", 0)) {
                iprintln("<unknown string>");
                return;
            }
            if (!isdefined(self.var_96d6f6d1)) {
                iprintln(self.name + "<unknown string>");
                return;
            }
            self thread function_8a37e046(interval);
        }
    }

    // Namespace zm_callings_devgui/zm_callings_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xd80a3e5, Offset: 0x7f0
    // Size: 0x11e
    function function_8a37e046(n_interval) {
        foreach (var_d1017f27 in self.var_96d6f6d1) {
            progress = self zm_callings::function_4368582a(var_d1017f27, 0);
            if (isdefined(progress)) {
                target = var_d1017f27.var_e226ec4f;
                iprintln(self.name + "<unknown string>" + function_9e72a96(var_d1017f27.var_ad971622) + "<unknown string>" + progress + "<unknown string>" + target);
            }
            wait(n_interval);
        }
    }

    // Namespace zm_callings_devgui/zm_callings_devgui
    // Params 1, eflags: 0x0
    // Checksum 0xbc866258, Offset: 0x918
    // Size: 0xc0
    function function_6cbc14bb(cmd) {
        foreach (p in level.players) {
            if (!isdefined(p)) {
                continue;
            }
            if (isbot(p)) {
                continue;
            }
            p function_1d4f22e4(cmd);
        }
    }

#/
