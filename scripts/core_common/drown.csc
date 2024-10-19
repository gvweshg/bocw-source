// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace drown;

// Namespace drown/drown
// Params 0, eflags: 0x5
// Checksum 0x70b952bb, Offset: 0xd8
// Size: 0x44
function private autoexec __init__system__() {
    system::register(#"drown", &preinit, undefined, undefined, #"visionset_mgr");
}

// Namespace drown/drown
// Params 0, eflags: 0x6 linked
// Checksum 0x31744ef7, Offset: 0x128
// Size: 0xbc
function private preinit() {
    clientfield::register("toplayer", "drown_stage", 1, 3, "int", &drown_stage_callback, 0, 0);
    callback::on_localplayer_spawned(&player_spawned);
    visionset_mgr::register_overlay_info_style_speed_blur("drown_blur", 1, 1, 0.04, 1, 1, 0, 0, 125, 125, 0);
    setup_radius_values();
}

// Namespace drown/drown
// Params 0, eflags: 0x2 linked
// Checksum 0xc9d627c, Offset: 0x1f0
// Size: 0x4b6
function setup_radius_values() {
    level.drown_radius[#"inner"][#"begin"][1] = 0.8;
    level.drown_radius[#"inner"][#"begin"][2] = 0.6;
    level.drown_radius[#"inner"][#"begin"][3] = 0.6;
    level.drown_radius[#"inner"][#"begin"][4] = 0.5;
    level.drown_radius[#"inner"][#"end"][1] = 0.5;
    level.drown_radius[#"inner"][#"end"][2] = 0.3;
    level.drown_radius[#"inner"][#"end"][3] = 0.3;
    level.drown_radius[#"inner"][#"end"][4] = 0.2;
    level.drown_radius[#"outer"][#"begin"][1] = 1;
    level.drown_radius[#"outer"][#"begin"][2] = 0.8;
    level.drown_radius[#"outer"][#"begin"][3] = 0.8;
    level.drown_radius[#"outer"][#"begin"][4] = 0.7;
    level.drown_radius[#"outer"][#"end"][1] = 0.8;
    level.drown_radius[#"outer"][#"end"][2] = 0.6;
    level.drown_radius[#"outer"][#"end"][3] = 0.6;
    level.drown_radius[#"outer"][#"end"][4] = 0.5;
    level.opacity[#"begin"][1] = 0.4;
    level.opacity[#"begin"][2] = 0.5;
    level.opacity[#"begin"][3] = 0.6;
    level.opacity[#"begin"][4] = 0.6;
    level.opacity[#"end"][1] = 0.5;
    level.opacity[#"end"][2] = 0.6;
    level.opacity[#"end"][3] = 0.7;
    level.opacity[#"end"][4] = 0.7;
}

// Namespace drown/drown
// Params 1, eflags: 0x2 linked
// Checksum 0xf2905a47, Offset: 0x6b0
// Size: 0x54
function player_spawned(localclientnum) {
    if (!self function_21c0fa55()) {
        return;
    }
    self player_init_drown_values();
    self thread player_watch_drown_shutdown(localclientnum);
}

// Namespace drown/drown
// Params 0, eflags: 0x2 linked
// Checksum 0x154e4cdf, Offset: 0x710
// Size: 0x3e
function player_init_drown_values() {
    if (!isdefined(self.drown_start_time)) {
        self.drown_start_time = 0;
        self.drown_outerradius = 0;
        self.drown_innerradius = 0;
        self.drown_opacity = 0;
    }
}

// Namespace drown/drown
// Params 1, eflags: 0x2 linked
// Checksum 0xf9867746, Offset: 0x758
// Size: 0x3c
function player_watch_drown_shutdown(localclientnum) {
    self waittill(#"death");
    self disable_drown(localclientnum);
}

// Namespace drown/drown
// Params 0, eflags: 0x2 linked
// Checksum 0xa1a15b66, Offset: 0x7a0
// Size: 0x7e
function function_1a9dc208() {
    playerrole = self getrolefields();
    assert(isdefined(playerrole));
    if (isdefined(playerrole)) {
        return int(playerrole.var_f0886300 * 1000);
    }
    return 2000;
}

// Namespace drown/drown
// Params 2, eflags: 0x2 linked
// Checksum 0xb4252d4f, Offset: 0x828
// Size: 0x7a
function enable_drown(localclientnum, stage) {
    self.drown_start_time = getservertime(localclientnum) - (stage - 1) * self function_1a9dc208();
    self.drown_outerradius = 0;
    self.drown_innerradius = 0;
    self.drown_opacity = 0;
}

// Namespace drown/drown
// Params 1, eflags: 0x2 linked
// Checksum 0xfbe6dc0e, Offset: 0x8b0
// Size: 0xc
function disable_drown(*localclientnum) {
    
}

// Namespace drown/drown
// Params 2, eflags: 0x2 linked
// Checksum 0x44ab4cea, Offset: 0x8c8
// Size: 0x2f4
function player_drown_fx(localclientnum, stage) {
    self endon(#"death");
    self endon(#"player_fade_out_drown_fx");
    self notify(#"player_drown_fx");
    self endon(#"player_drown_fx");
    self player_init_drown_values();
    var_f0886300 = self function_1a9dc208();
    lastoutwatertimestage = self.drown_start_time + (stage - 1) * var_f0886300;
    stageduration = var_f0886300;
    if (stage == 1) {
        stageduration = 2000;
    }
    while (true) {
        currenttime = getservertime(localclientnum);
        elapsedtime = currenttime - self.drown_start_time;
        stageratio = math::clamp((currenttime - lastoutwatertimestage) / stageduration, 0, 1);
        if (!isdefined(stage)) {
            stage = 1;
        }
        stage = math::clamp(stage, 1, 4);
        self.drown_outerradius = lerpfloat(level.drown_radius[#"outer"][#"begin"][stage], level.drown_radius[#"outer"][#"end"][stage], stageratio) * 1.41421;
        self.drown_innerradius = lerpfloat(level.drown_radius[#"inner"][#"begin"][stage], level.drown_radius[#"inner"][#"end"][stage], stageratio) * 1.41421;
        self.drown_opacity = lerpfloat(level.opacity[#"begin"][stage], level.opacity[#"end"][stage], stageratio);
        waitframe(1);
    }
}

// Namespace drown/drown
// Params 1, eflags: 0x2 linked
// Checksum 0x54e9e718, Offset: 0xbc8
// Size: 0x194
function player_fade_out_drown_fx(localclientnum) {
    self endon(#"death");
    self endon(#"player_drown_fx");
    self notify(#"player_fade_out_drown_fx");
    self endon(#"player_fade_out_drown_fx");
    self player_init_drown_values();
    fadestarttime = getservertime(localclientnum);
    for (currenttime = getservertime(localclientnum); currenttime - fadestarttime < 250; currenttime = getservertime(localclientnum)) {
        ratio = (currenttime - fadestarttime) / 250;
        outerradius = lerpfloat(self.drown_outerradius, 1.41421, ratio);
        innerradius = lerpfloat(self.drown_innerradius, 1.41421, ratio);
        opacity = lerpfloat(self.drown_opacity, 0, ratio);
        waitframe(1);
    }
    self disable_drown(localclientnum);
}

// Namespace drown/drown
// Params 7, eflags: 0x2 linked
// Checksum 0x8c4e4168, Offset: 0xd68
// Size: 0xb4
function drown_stage_callback(localclientnum, *oldval, newval, bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (fieldname > 0) {
        self enable_drown(binitialsnap, fieldname);
        self thread player_drown_fx(binitialsnap, fieldname);
        return;
    }
    if (!bwastimejump) {
        self thread player_fade_out_drown_fx(binitialsnap);
        return;
    }
    self disable_drown(binitialsnap);
}

