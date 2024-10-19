// Atian COD Tools GSC CW decompiler test
#using script_74e3c3cd261ec799;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using script_359683f0ff3b3fbb;

#namespace objective_manager;

// Namespace objective_manager/objective_manager
// Params 0, eflags: 0x5
// Checksum 0xccf4b45f, Offset: 0x198
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"objective_manager", &preinit, undefined, undefined, undefined);
}

// Namespace objective_manager/objective_manager
// Params 0, eflags: 0x6 linked
// Checksum 0xb1a99ace, Offset: 0x1e0
// Size: 0x264
function private preinit() {
    clientfield::register("actor", "objective_cf_callout_rob", 1, 2, "int", &function_b8c3e9f4, 0, 0);
    clientfield::register("toplayer", "sr_defend_timer", 18000, getminbitcountfornum(900), "int", &function_bb753058, 0, 1);
    clientfield::register("scriptmover", "objective_cf_callout_rob", 1, 2, "int", &function_b8c3e9f4, 0, 0);
    clientfield::register("scriptmover", "" + #"hash_23325b5fc8ed9f5a", 1, 1, "int", &function_63e45e6, 0, 0);
    clientfield::register("vehicle", "objective_cf_callout_rob", 1, 2, "int", &function_b8c3e9f4, 0, 0);
    clientfield::function_5b7d846d("hudItems.warzone.objectiveTotal", #"hash_593f03dd48d5bc1f", #"objectivetotal", 1, 5, "int", undefined, 0, 0);
    clientfield::function_5b7d846d("hudItems.warzone.objectivesCompleted", #"hash_593f03dd48d5bc1f", #"hash_46ad7187ceb8287e", 1, 5, "int", undefined, 0, 0);
    callback::on_localclient_connect(&on_localplayer_connect);
    level.var_4f12f6d0 = sr_objective_timer::register();
}

// Namespace objective_manager/objective_manager
// Params 7, eflags: 0x2 linked
// Checksum 0xa446ac1e, Offset: 0x450
// Size: 0xde
function function_63e45e6(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump == 1) {
        self.var_40433812 = playfx(fieldname, "zm_ai/fx9_orda_spawn_portal_c", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
        return;
    }
    if (isdefined(self.var_40433812)) {
        stopfx(fieldname, self.var_40433812);
        self.var_40433812 = undefined;
    }
}

// Namespace objective_manager/objective_manager
// Params 7, eflags: 0x6 linked
// Checksum 0x17709ee8, Offset: 0x538
// Size: 0xf4
function private function_b8c3e9f4(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump == 1) {
        self function_dd2493cc(#"hash_67ab6fd22ae1e4ac", #"rob_sonar_set_friendly_zm_ls");
        return;
    }
    if (bwastimejump == 2) {
        self function_dd2493cc(#"rob_sonar_set_friendly_zm_ls", #"hash_67ab6fd22ae1e4ac");
        return;
    }
    self function_dd2493cc(undefined, #"hash_67ab6fd22ae1e4ac", #"rob_sonar_set_friendly_zm_ls");
}

// Namespace objective_manager/objective_manager
// Params 2, eflags: 0x46 linked
// Checksum 0xf0eb058b, Offset: 0x638
// Size: 0xf0
function private function_dd2493cc(var_c5dfdae0, ...) {
    if (isdefined(var_c5dfdae0) && !self function_d2503806(var_c5dfdae0)) {
        self playrenderoverridebundle(var_c5dfdae0);
    }
    foreach (rob in vararg) {
        if (self function_d2503806(rob)) {
            self stoprenderoverridebundle(rob);
        }
    }
}

// Namespace objective_manager/objective_manager
// Params 7, eflags: 0x6 linked
// Checksum 0xabf04611, Offset: 0x730
// Size: 0xc4
function private function_bb753058(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (!function_65b9eb0f(fieldname)) {
        timer_model = function_c8b7588d(fieldname);
        duration_msec = bwastimejump * 1000;
        setuimodelvalue(timer_model, getservertime(fieldname, 1) + duration_msec);
    }
}

// Namespace objective_manager/objective_manager
// Params 1, eflags: 0x6 linked
// Checksum 0x2b209f3a, Offset: 0x800
// Size: 0x44
function private on_localplayer_connect(localclientnum) {
    timer_model = function_c8b7588d(localclientnum);
    setuimodelvalue(timer_model, 0);
}

// Namespace objective_manager/objective_manager
// Params 1, eflags: 0x6 linked
// Checksum 0xf194b1a5, Offset: 0x850
// Size: 0x52
function private function_c8b7588d(*localclientnum) {
    var_4fa1ce7b = getuimodel(function_5f72e972(#"hash_593f03dd48d5bc1f"), "srProtoTimer");
    return var_4fa1ce7b;
}

