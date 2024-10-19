// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace hacker_tool;

// Namespace hacker_tool/hacker_tool
// Params 0, eflags: 0x0
// Checksum 0x4333fa9a, Offset: 0xf8
// Size: 0x94
function init_shared() {
    clientfield::register("toplayer", "hacker_tool", 1, 2, "int", &player_hacking, 0, 0);
    level.hackingsoundid = [];
    level.hackingsweetspotid = [];
    level.friendlyhackingsoundid = [];
    callback::on_localplayer_spawned(&on_localplayer_spawned);
}

// Namespace hacker_tool/hacker_tool
// Params 1, eflags: 0x0
// Checksum 0x9f644a79, Offset: 0x198
// Size: 0x10c
function on_localplayer_spawned(localclientnum) {
    if (!self function_21c0fa55()) {
        return;
    }
    player = self;
    if (isdefined(level.hackingsoundid[localclientnum])) {
        player stoploopsound(level.hackingsoundid[localclientnum]);
        level.hackingsoundid[localclientnum] = undefined;
    }
    if (isdefined(level.hackingsweetspotid[localclientnum])) {
        player stoploopsound(level.hackingsweetspotid[localclientnum]);
        level.hackingsweetspotid[localclientnum] = undefined;
    }
    if (isdefined(level.friendlyhackingsoundid[localclientnum])) {
        player stoploopsound(level.friendlyhackingsoundid[localclientnum]);
        level.friendlyhackingsoundid[localclientnum] = undefined;
    }
}

// Namespace hacker_tool/hacker_tool
// Params 7, eflags: 0x0
// Checksum 0x5befe1cc, Offset: 0x2b0
// Size: 0x464
function player_hacking(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    self notify(#"player_hacking_callback");
    player = self;
    if (isdefined(level.hackingsoundid[fieldname])) {
        player stoploopsound(level.hackingsoundid[fieldname]);
        level.hackingsoundid[fieldname] = undefined;
    }
    if (isdefined(level.hackingsweetspotid[fieldname])) {
        player stoploopsound(level.hackingsweetspotid[fieldname]);
        level.hackingsweetspotid[fieldname] = undefined;
    }
    if (isdefined(level.friendlyhackingsoundid[fieldname])) {
        player stoploopsound(level.friendlyhackingsoundid[fieldname]);
        level.friendlyhackingsoundid[fieldname] = undefined;
    }
    if (isdefined(player.targetent)) {
        player.targetent.isbreachingfirewall = 0;
        player.targetent = undefined;
    }
    if (bwastimejump == 2) {
        player thread watchhackspeed(fieldname, 0);
        setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "status"), 2);
        return;
    }
    if (bwastimejump == 3) {
        player thread watchhackspeed(fieldname, 1);
        setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "status"), 1);
        return;
    }
    if (bwastimejump == 1) {
        setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "status"), 0);
        setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "perc"), 0);
        setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "offsetShaderValue"), "0 0 0 0");
        self thread watchforemp(fieldname);
        return;
    }
    setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "status"), 0);
    setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "perc"), 0);
    setuimodelvalue(createuimodel(function_1df4c3b0(fieldname, #"blackhat"), "offsetShaderValue"), "0 0 0 0");
}

// Namespace hacker_tool/hacker_tool
// Params 2, eflags: 0x0
// Checksum 0x60bfd9e6, Offset: 0x720
// Size: 0xb4
function watchhackspeed(localclientnum, isbreachingfirewall) {
    self endon(#"death");
    self endon(#"player_hacking_callback");
    player = self;
    for (;;) {
        targetentarray = self gettargetlockentityarray();
        if (targetentarray.size > 0) {
            targetent = targetentarray[0];
            break;
        }
        wait(0.02);
    }
    targetent watchtargethack(localclientnum, player, isbreachingfirewall);
}

// Namespace hacker_tool/hacker_tool
// Params 3, eflags: 0x0
// Checksum 0xc58e17b4, Offset: 0x7e0
// Size: 0x428
function watchtargethack(localclientnum, player, isbreachingfirewall) {
    self endon(#"death");
    player endon(#"death");
    self endon(#"player_hacking_callback");
    targetent = self;
    player.targetent = targetent;
    if (isbreachingfirewall) {
        targetent.isbreachingfirewall = 1;
    }
    targetent thread watchhackerplayershutdown(localclientnum, player, targetent);
    for (;;) {
        distancefromcenter = targetent getdistancefromscreencenter(localclientnum);
        inverse = 40 - distancefromcenter;
        ratio = inverse / 40;
        heatval = getweaponhackratio(localclientnum);
        ratio = ratio * ratio * ratio * ratio;
        if (ratio > 1 || ratio < 0.001) {
            ratio = 0;
            horizontal = 0;
        } else {
            horizontal = targetent gethorizontaloffsetfromscreencenter(localclientnum, 40);
        }
        setuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"blackhat"), "offsetShaderValue"), horizontal + " " + ratio + " 0 0");
        setuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"blackhat"), "perc"), heatval);
        if (ratio > 0.8) {
            if (!isdefined(level.hackingsweetspotid[localclientnum])) {
                level.hackingsweetspotid[localclientnum] = player playloopsound(#"evt_hacker_hacking_sweet");
            }
        } else {
            if (isdefined(level.hackingsweetspotid[localclientnum])) {
                player stoploopsound(level.hackingsweetspotid[localclientnum]);
                level.hackingsweetspotid[localclientnum] = undefined;
            }
            if (!isdefined(level.hackingsoundid[localclientnum])) {
                level.hackingsoundid[localclientnum] = player playloopsound(#"evt_hacker_hacking_loop");
            }
            if (isdefined(level.hackingsoundid[localclientnum])) {
                setsoundpitch(level.hackingsoundid[localclientnum], ratio);
            }
        }
        if (!isbreachingfirewall) {
            friendlyhacking = weaponfriendlyhacking(localclientnum);
            if (friendlyhacking && !isdefined(level.friendlyhackingsoundid[localclientnum])) {
                level.friendlyhackingsoundid[localclientnum] = player playloopsound(#"evt_hacker_hacking_loop_mult");
            } else if (!friendlyhacking && isdefined(level.friendlyhackingsoundid[localclientnum])) {
                player stoploopsound(level.friendlyhackingsoundid[localclientnum]);
                level.friendlyhackingsoundid[localclientnum] = undefined;
            }
        }
        wait(0.1);
    }
}

// Namespace hacker_tool/hacker_tool
// Params 3, eflags: 0x0
// Checksum 0x7b88eafb, Offset: 0xc10
// Size: 0x82
function watchhackerplayershutdown(*localclientnum, hackerplayer, targetent) {
    self endon(#"death");
    killstreakentity = self;
    hackerplayer endon(#"player_hacking_callback");
    hackerplayer waittill(#"death");
    if (isdefined(targetent)) {
        targetent.isbreachingfirewall = 1;
    }
}

// Namespace hacker_tool/hacker_tool
// Params 1, eflags: 0x0
// Checksum 0x327183fb, Offset: 0xca0
// Size: 0xf8
function watchforemp(localclientnum) {
    self endon(#"death");
    self endon(#"player_hacking_callback");
    while (true) {
        if (self isempjammed()) {
            setuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"blackhat"), "status"), 3);
        } else {
            setuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"blackhat"), "status"), 0);
        }
        wait(0.1);
    }
}

