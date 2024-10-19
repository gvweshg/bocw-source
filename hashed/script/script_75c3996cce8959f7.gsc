// Atian COD Tools GSC CW decompiler test
#using script_76abb7986de59601;
#using script_67049b48b589d81;
#using script_64e5d3ad71ce8140;
#using script_7bf1bd99605135bf;
#using script_6b71c9befed901f2;
#using script_75c3996cce8959f7;
#using script_71603a58e2da0698;
#using script_30c7fb449869910;
#using script_1b2f6ef7778cf920;
#using script_4adf64e112e9afec;
#using script_771f5bff431d8d57;
#using script_42cbbdcd1e160063;
#using script_3314b730521b9666;
#using script_77163d5a569e2071;
#using script_38635d174016f682;
#using script_18910f59cc847b42;
#using scripts\core_common\struct.csc;
#using scripts\core_common\spawning_shared.csc;
#using scripts\core_common\spawner_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\serverfield_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_7f5aeb59;

// Namespace namespace_7f5aeb59/namespace_7f5aeb59
// Params 1, eflags: 0x2 linked
// Checksum 0x7c20dff6, Offset: 0x240
// Size: 0x61c
function function_f3143608(localclientnum) {
    self endon(#"disconnect");
    self.doa = spawnstruct();
    self.topdowncamera = 1;
    self.doa.cameramode = 1;
    self.doa.var_71122e79 = 0;
    self.doa.var_903d75b1 = undefined;
    self namespace_ac2a80f5::function_278f20a3((75, 0, 0), namespace_ac2a80f5::function_ccf8a968(self.doa.cameramode));
    self.doa.var_25f4de97 = 0;
    self.skits = undefined;
    self.doa.infps = 0;
    self.entnum = self getentitynumber();
    self.var_88a2ff29 = level.var_30df1fad;
    self cameraforcedisablescriptcam(0);
    if (getlocalplayers().size > 1) {
        namespace_4dae815d::function_e1887b0f(1);
    }
    namespace_6e90e490::function_9c238883(self getentitynumber(), self getlocalclientnumber(), 0);
    self camerasetupdatecallback(&namespace_ac2a80f5::function_14f1aa2b);
    self function_4d692cc4(localclientnum, self.var_88a2ff29);
    self.fxorigin = namespace_ec06fe4a::spawnmodel(localclientnum, self.origin, undefined, undefined, "playerfxOrigin");
    if (isdefined(self.fxorigin)) {
        self.fxorigin thread namespace_ec06fe4a::function_d55f042c(self, "disconnect");
        self.fxorigin thread namespace_ec06fe4a::function_73d79e7d(self, (0, 0, 6));
    }
    self util::waittill_dobj(localclientnum);
    if (!isdefined(self)) {
        return;
    }
    self.entnum = self getentitynumber();
    if (islocalplayer(self)) {
        localclientnum = self getlocalclientnumber();
        if (isdefined(localclientnum)) {
            self setcontrollerlightbarcolor(localclientnum, function_144f26b2(self.entnum));
        }
    }
    name = self getplayername();
    switch (self getentitynumber()) {
    case 0:
        setuimodelvalue(getuimodel(getuimodel(function_5f72e972(#"doa_world"), "player1"), "playerName"), name);
        break;
    case 1:
        setuimodelvalue(getuimodel(getuimodel(function_5f72e972(#"doa_world"), "player2"), "playerName"), name);
        break;
    case 2:
        setuimodelvalue(getuimodel(getuimodel(function_5f72e972(#"doa_world"), "player3"), "playerName"), name);
        break;
    case 3:
        setuimodelvalue(getuimodel(getuimodel(function_5f72e972(#"doa_world"), "player4"), "playerName"), name);
        break;
    }
    name = "player_trail_" + function_7b9bc9ff(self.entnum);
    self thread namespace_83eb6304::function_e76f738(localclientnum, name, "tag_origin", 1);
    self thread namespace_ac2a80f5::function_57ce3201(localclientnum);
    if (islocalplayer(self) && is_true(level.doa.var_318aa67a)) {
        doa_player::function_f32984d0(localclientnum, 0, 1);
    }
    self thread function_4fa1ee4f(localclientnum);
    self thread function_ce6420c(localclientnum);
}

// Namespace namespace_7f5aeb59/namespace_7f5aeb59
// Params 1, eflags: 0x2 linked
// Checksum 0x4282d9e, Offset: 0x868
// Size: 0x218
function function_ce6420c(localclientnum) {
    self endon(#"disconnect", #"kicked");
    wait(45);
    if (!isdefined(self)) {
        return;
    }
    var_f3e30707 = 0.25;
    if (!isdefined(self.doa.var_4aa817ed)) {
        self.doa.var_4aa817ed = (0, 0, 0);
    }
    lastyaw = 0;
    yaw = 0;
    var_183aaf3c = 0;
    latch = 1;
    while (true) {
        wait(var_f3e30707);
        if (!isdefined(self)) {
            return;
        }
        self.doa.var_4aa817ed = util::function_11f127f0(localclientnum, 0);
        if (self.doa.var_4aa817ed.length > 0) {
            lastyaw = yaw;
            yaw = self.doa.var_4aa817ed.degrees;
            var_9756b1d4 = abs(yaw - lastyaw);
            if (var_9756b1d4 <= 1) {
                var_183aaf3c += var_f3e30707;
            } else {
                var_183aaf3c = 0;
                self serverfield::set("rstick_input_inc", 0);
            }
            if (var_183aaf3c > 1) {
                var_183aaf3c -= 1;
                self serverfield::set("rstick_input_inc", latch);
                latch = latch == 1 ? 2 : 1;
            }
            continue;
        }
        var_183aaf3c = 0;
        self serverfield::set("rstick_input_inc", 0);
    }
}

// Namespace namespace_7f5aeb59/namespace_7f5aeb59
// Params 1, eflags: 0x2 linked
// Checksum 0xc592140f, Offset: 0xa88
// Size: 0x218
function function_4fa1ee4f(localclientnum) {
    self endon(#"disconnect", #"kicked");
    wait(45);
    if (!isdefined(self)) {
        return;
    }
    var_f3e30707 = 0.25;
    if (!isdefined(self.doa.var_c8b6bcb0)) {
        self.doa.var_c8b6bcb0 = (0, 0, 0);
    }
    lastyaw = 0;
    yaw = 0;
    var_183aaf3c = 0;
    latch = 1;
    while (true) {
        wait(var_f3e30707);
        if (!isdefined(self)) {
            return;
        }
        self.doa.var_c8b6bcb0 = util::function_17bf631a(localclientnum, 0);
        if (self.doa.var_c8b6bcb0.length > 0) {
            lastyaw = yaw;
            yaw = self.doa.var_c8b6bcb0.degrees;
            var_9756b1d4 = abs(yaw - lastyaw);
            if (var_9756b1d4 <= 1) {
                var_183aaf3c += var_f3e30707;
            } else {
                var_183aaf3c = 0;
                self serverfield::set("lstick_input_inc", 0);
            }
            if (var_183aaf3c > 1) {
                var_183aaf3c -= 1;
                self serverfield::set("lstick_input_inc", latch);
                latch = latch == 1 ? 2 : 1;
            }
            continue;
        }
        var_183aaf3c = 0;
        self serverfield::set("lstick_input_inc", 0);
    }
}

// Namespace namespace_7f5aeb59/namespace_7f5aeb59
// Params 1, eflags: 0x2 linked
// Checksum 0x2c8a7330, Offset: 0xca8
// Size: 0x9a
function function_144f26b2(entnum) {
    if (!isdefined(entnum)) {
        return (1, 1, 1);
    }
    switch (entnum) {
    case 0:
        return (0, 1, 0);
    case 1:
        return (0, 0, 1);
    case 2:
        return (1, 0, 0);
    case 3:
        return (1, 1, 0);
    default:
        return (1, 1, 1);
    }
}

// Namespace namespace_7f5aeb59/namespace_7f5aeb59
// Params 1, eflags: 0x2 linked
// Checksum 0xc24105b9, Offset: 0xd50
// Size: 0xaa
function function_7b9bc9ff(entnum) {
    if (!isdefined(entnum)) {
        return (1, 1, 1);
    }
    switch (entnum) {
    case 0:
        return "green";
    case 1:
        return "blue";
    case 2:
        return "red";
    case 3:
        return "yellow";
    default:
        return "unk";
    }
}

// Namespace namespace_7f5aeb59/namespace_7f5aeb59
// Params 1, eflags: 0x2 linked
// Checksum 0x1db3b1cd, Offset: 0xe08
// Size: 0x14c
function function_fcc90081(localclientnum) {
    if (!isdefined(self) || !isdefined(self.doa)) {
        return;
    }
    if (!isdefined(self.fxorigin)) {
        self.fxorigin = namespace_ec06fe4a::spawnmodel(localclientnum, self.origin, undefined, undefined, "playerfxOrigin");
        if (isdefined(self.fxorigin)) {
            self.fxorigin thread namespace_ec06fe4a::function_d55f042c(self, "disconnect");
            self.fxorigin thread namespace_ec06fe4a::function_73d79e7d(self, (0, 0, 6));
        }
    }
    self.skits = undefined;
    self.doa.cameramode = 1;
    self.doa.var_71122e79 = 0;
    self.doa.var_903d75b1 = undefined;
    self.var_88a2ff29 = level.var_30df1fad;
    namespace_6e90e490::function_9c238883(self getentitynumber(), self getlocalclientnumber(), 0);
}

// Namespace namespace_7f5aeb59/namespace_7f5aeb59
// Params 2, eflags: 0x2 linked
// Checksum 0xa8217417, Offset: 0xf60
// Size: 0x14c
function function_4d692cc4(localclientnum, mapping = "zombietron") {
    /#
        namespace_1e25ad94::debugmsg("<unknown string>" + (isdefined(self.name) ? self.name : "<unknown string>") + "<unknown string>" + mapping + "<unknown string>" + (islocalplayer(self) ? "<unknown string>" : "<unknown string>"));
    #/
    if (is_true(level.doa.var_318aa67a)) {
        mapping = "default";
    }
    if (islocalplayer(self)) {
        /#
            namespace_1e25ad94::debugmsg("<unknown string>" + localclientnum);
        #/
        forcegamemodemappings(localclientnum, mapping);
        return;
    }
    /#
        namespace_1e25ad94::debugmsg("<unknown string>");
    #/
}

// Namespace namespace_7f5aeb59/namespace_7f5aeb59
// Params 1, eflags: 0x2 linked
// Checksum 0xda863456, Offset: 0x10b8
// Size: 0x52
function islocalplayer(player) {
    assert(isdefined(player), "<unknown string>");
    return isinarray(getlocalplayers(), player);
}

