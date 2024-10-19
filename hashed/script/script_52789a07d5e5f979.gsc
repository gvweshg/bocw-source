// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\ai\systems\fx_character.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace namespace_6e561646;

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 0, eflags: 0x2 linked
// Checksum 0x110edb45, Offset: 0x640
// Size: 0x504
function init() {
    function_cae618b4("spawner_zombietron_blight_father");
    level._effect[#"fx8_blightfather_weakspot_sack_amb"] = "zm_ai/fx8_blightfather_weakspot_sack_amb";
    level._effect[#"fx8_blightfather_weakspot_elbow_amb"] = "zm_ai/fx8_blightfather_weakspot_elbow_amb";
    level._effect[#"fx8_blightfather_weakspot_jaw_amb"] = "zm_ai/fx8_blightfather_weakspot_jaw_amb";
    level._effect[#"fx8_blightfather_vomit"] = "zm_ai/fx8_blightfather_vomit";
    level._effect[#"fx8_blightfather_vomit_object"] = "zm_ai/fx8_blightfather_vomit_object";
    level._effect[#"fx8_blightfather_maggot_spawn_burst"] = "zm_ai/fx8_blightfather_maggot_spawn_burst";
    level._effect[#"fx8_blightfather_chaos_missle"] = "zm_ai/fx8_blightfather_chaos_missle";
    level._effect[#"fx8_blightfather_maggot_death_exp"] = "zm_ai/fx8_blightfather_maggot_death_exp";
    level.grappler_beam = "zod_blight_father_grapple_beam";
    footsteps::registeraitypefootstepcb(#"blight_father", &function_958ba8d1);
    clientfield::register("actor", "blight_father_amb_sac_clientfield", 1, 1, "int", &function_192c82f8, 0, 0);
    clientfield::register("actor", "blight_father_weakpoint_l_elbow_fx", 1, 1, "int", &function_c6aa29ea, 0, 0);
    clientfield::register("actor", "blight_father_weakpoint_r_elbow_fx", 1, 1, "int", &function_caf74103, 0, 0);
    clientfield::register("actor", "blight_father_weakpoint_l_maggot_sac_fx", 1, 1, "int", &function_bc64a2a, 0, 0);
    clientfield::register("actor", "blight_father_weakpoint_r_maggot_sac_fx", 1, 1, "int", &function_c4fff539, 0, 0);
    clientfield::register("actor", "blight_father_weakpoint_jaw_fx", 1, 1, "int", &function_de0a50df, 0, 0);
    clientfield::register("actor", "blight_father_vomit_fx", 1, 2, "int", &function_59f8f265, 0, 0);
    clientfield::register("actor", "blight_father_spawn_maggot_fx_left", 1, 1, "counter", &function_67ad42f3, 0, 0);
    clientfield::register("actor", "blight_father_spawn_maggot_fx_right", 1, 1, "counter", &function_f102952d, 0, 0);
    clientfield::register("scriptmover", "blight_father_maggot_trail_fx", 1, 1, "int", &function_e47c2324, 0, 0);
    clientfield::register("scriptmover", "blight_father_chaos_missile_explosion_clientfield", 1, 1, "int", &function_f02b0934, 0, 0);
    clientfield::register("toplayer", "blight_father_chaos_missile_rumble_clientfield", 1, 1, "counter", &function_7d5e27f4, 0, 0);
    clientfield::register("scriptmover", "blight_father_gib_explosion", 1, 1, "int", &function_7d5fa1ae, 0, 0);
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x6 linked
// Checksum 0xdcfd287c, Offset: 0xb50
// Size: 0xbc
function private function_7d5fa1ae(localclientnum, *oldval, *newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    self util::waittill_dobj(bwastimejump);
    if (isdefined(self)) {
        origin = self gettagorigin("J_Spine4");
        if (!isdefined(origin)) {
            origin = self.origin;
        }
        physicsexplosionsphere(bwastimejump, origin, 200, 0, 2);
    }
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x6 linked
// Checksum 0x41925ed1, Offset: 0xc18
// Size: 0xbe
function private function_c6aa29ea(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        self.var_cc8c05d5 = util::playfxontag(fieldname, level._effect[#"fx8_blightfather_weakspot_elbow_amb"], self, "tag_elbow_weakspot_le");
        return;
    }
    if (isdefined(self.var_cc8c05d5)) {
        stopfx(fieldname, self.var_cc8c05d5);
        self.var_cc8c05d5 = undefined;
    }
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x6 linked
// Checksum 0xa9a4e508, Offset: 0xce0
// Size: 0xbe
function private function_caf74103(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        self.var_e844c6a2 = util::playfxontag(fieldname, level._effect[#"fx8_blightfather_weakspot_elbow_amb"], self, "tag_elbow_weakspot_ri");
        return;
    }
    if (isdefined(self.var_e844c6a2)) {
        stopfx(fieldname, self.var_e844c6a2);
        self.var_e844c6a2 = undefined;
    }
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x6 linked
// Checksum 0xdcd1e4df, Offset: 0xda8
// Size: 0xbe
function private function_bc64a2a(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        self.var_81531422 = util::playfxontag(fieldname, level._effect[#"fx8_blightfather_weakspot_sack_amb"], self, "tag_eggsack_weakspot_le_fx");
        return;
    }
    if (isdefined(self.var_81531422)) {
        stopfx(fieldname, self.var_81531422);
        self.var_81531422 = undefined;
    }
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x6 linked
// Checksum 0xa4023848, Offset: 0xe70
// Size: 0xbe
function private function_c4fff539(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        self.var_40cb39ba = util::playfxontag(fieldname, level._effect[#"fx8_blightfather_weakspot_sack_amb"], self, "tag_eggsack_weakspot_ri_fx");
        return;
    }
    if (isdefined(self.var_40cb39ba)) {
        stopfx(fieldname, self.var_40cb39ba);
        self.var_40cb39ba = undefined;
    }
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x6 linked
// Checksum 0xc47d56bc, Offset: 0xf38
// Size: 0xbe
function private function_de0a50df(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        self.var_2beadf7 = util::playfxontag(fieldname, level._effect[#"fx8_blightfather_weakspot_jaw_amb"], self, "tag_jaw");
        return;
    }
    if (isdefined(self.var_2beadf7)) {
        stopfx(fieldname, self.var_2beadf7);
        self.var_2beadf7 = undefined;
    }
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x4
// Checksum 0xb2c39f4, Offset: 0x1000
// Size: 0x1da
function private function_2c098ccc(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    switch (bwastimejump) {
    case 1:
        self.var_32caa02 = util::playfxontag(fieldname, level._effect[#"fx8_blightfather_vomit_purchase"], self, "tag_origin");
        break;
    case 2:
        self.var_32caa02 = util::playfxontag(fieldname, level._effect[#"fx8_blightfather_vomit_statue_purchase"], self, "tag_origin");
        break;
    case 3:
        self.var_32caa02 = util::playfxontag(fieldname, level._effect[#"fx8_blightfather_vomit_box_purchase"], self, "tag_origin");
        break;
    case 4:
        self.var_32caa02 = util::playfxontag(fieldname, level._effect[#"fx8_blightfather_vomit_craft_purchase"], self, "tag_origin");
        break;
    default:
        if (isdefined(self.var_32caa02)) {
            stopfx(fieldname, self.var_32caa02);
            self.var_32caa02 = undefined;
        }
        break;
    }
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x4
// Checksum 0xf63bd47e, Offset: 0x11e8
// Size: 0x84
function private tonguegrabpostfx(*localclientnum, *oldvalue, newvalue, *bnewent, *binitialsnap, *fieldname, *wasdemojump) {
    if (wasdemojump) {
        self thread postfx::playpostfxbundle(#"pstfx_zm_tongue_grab");
        return;
    }
    self postfx::stoppostfxbundle("pstfx_zm_tongue_grab");
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x4
// Checksum 0x76b18dc, Offset: 0x1278
// Size: 0x114
function private tonguegrabrumble(localclientnum, *oldvalue, newvalue, *bnewent, *binitialsnap, *fieldname, *wasdemojump) {
    if (wasdemojump) {
        if (self function_21c0fa55()) {
            function_36e4ebd4(fieldname, "grapple_collision");
            function_fe0ad36e(fieldname, "grapple_reel");
        }
        return;
    }
    if (self function_21c0fa55()) {
        function_36e4ebd4(fieldname, "grapple_detach");
        self stoprumble(fieldname, "grapple_collision");
        self stoprumble(fieldname, "grapple_reel");
    }
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x6 linked
// Checksum 0x5ea4522b, Offset: 0x1398
// Size: 0x116
function private function_59f8f265(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump == 1) {
        self.var_b0d99f6 = util::playfxontag(fieldname, level._effect[#"fx8_blightfather_vomit"], self, "tag_jaw");
        return;
    }
    if (bwastimejump == 2) {
        self.var_b0d99f6 = util::playfxontag(fieldname, level._effect[#"fx8_blightfather_vomit_object"], self, "tag_jaw");
        return;
    }
    if (isdefined(self.var_b0d99f6)) {
        stopfx(fieldname, self.var_b0d99f6);
        self.var_b0d99f6 = undefined;
    }
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x6 linked
// Checksum 0xe23c00db, Offset: 0x14b8
// Size: 0x74
function private function_67ad42f3(localclientnum, *oldval, *newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    util::playfxontag(bwastimejump, level._effect[#"fx8_blightfather_maggot_spawn_burst"], self, "tag_sac_fx_le");
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x6 linked
// Checksum 0xc3f61495, Offset: 0x1538
// Size: 0x74
function private function_f102952d(localclientnum, *oldval, *newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    util::playfxontag(bwastimejump, level._effect[#"fx8_blightfather_maggot_spawn_burst"], self, "tag_sac_fx_ri");
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x6 linked
// Checksum 0x77232752, Offset: 0x15b8
// Size: 0xcc
function private function_192c82f8(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    self util::waittill_dobj(fieldname);
    if (isdefined(self)) {
        if (bwastimejump) {
            self setanim(#"ai_t8_zm_zod_bltfthr_backsacs_add", 1, 0.1, 1);
            return;
        }
        self clearanim(#"ai_t8_zm_zod_bltfthr_backsacs_add", 0.2);
    }
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x6 linked
// Checksum 0x46cae3ea, Offset: 0x1690
// Size: 0xb4
function private function_e47c2324(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        self.var_f2668f6d = util::playfxontag(fieldname, level._effect[#"fx8_blightfather_chaos_missle"], self, "tag_origin");
        return;
    }
    if (isdefined(self.var_f2668f6d)) {
        stopfx(fieldname, self.var_f2668f6d);
    }
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x6 linked
// Checksum 0x854bb4fb, Offset: 0x1750
// Size: 0xfc
function private function_f02b0934(localclientnum, *oldvalue, *newvalue, *bnewent, *binitialsnap, *fieldname, *wasdemojump) {
    position = self.origin;
    angles = self.angles;
    if (isdefined(position) && isdefined(angles)) {
        playfx(wasdemojump, level._effect[#"fx8_blightfather_maggot_death_exp"], position, anglestoforward(angles), anglestoup(angles));
    }
    earthquake(wasdemojump, 0.4, 0.8, self.origin, 300);
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x6 linked
// Checksum 0x8174fb3, Offset: 0x1858
// Size: 0x5c
function private function_7d5e27f4(localclientnum, *oldvalue, *newvalue, *bnewent, *binitialsnap, *fieldname, *wasdemojump) {
    function_36e4ebd4(wasdemojump, "damage_heavy");
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 7, eflags: 0x4
// Checksum 0xa5ea4f95, Offset: 0x18c0
// Size: 0x74
function private function_75be2854(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump) {
        self mapshaderconstant(fieldname, 0, "scriptVector2", 0, 1, 0, 0);
    }
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 5, eflags: 0x2 linked
// Checksum 0xac85e7ab, Offset: 0x1940
// Size: 0x1b4
function function_958ba8d1(localclientnum, pos, *surface, *notetrack, *bone) {
    e_player = function_5c10bd79(notetrack);
    n_dist = distancesquared(bone, e_player.origin);
    var_166f3552 = 1000000;
    if (var_166f3552 > 0) {
        n_scale = (var_166f3552 - n_dist) / var_166f3552;
    } else {
        return;
    }
    if (n_scale > 1 || n_scale < 0) {
        return;
    }
    n_scale *= 0.25;
    if (n_scale <= 0.01) {
        return;
    }
    earthquake(notetrack, n_scale, 0.1, bone, n_dist);
    if (n_scale <= 0.25 && n_scale > 0.2) {
        function_36e4ebd4(notetrack, "anim_med");
        return;
    }
    if (n_scale <= 0.2 && n_scale > 0.1) {
        function_36e4ebd4(notetrack, "damage_light");
        return;
    }
    function_36e4ebd4(notetrack, "damage_light");
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 0, eflags: 0x0
// Checksum 0xf493e74, Offset: 0x1b00
// Size: 0x8c
function function_1a4f64a() {
    self notify("47774bd9aa58965b");
    self endon("47774bd9aa58965b");
    self endoncallback(&function_43ec7ca3, #"death");
    self.var_7fd3b200 = 0;
    self thread function_cf88b888();
    self waittill(#"hash_3af6fe8d4a8fac02");
    wait(1);
    self thread function_1ca2497b();
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 0, eflags: 0x2 linked
// Checksum 0x34c9354e, Offset: 0x1b98
// Size: 0x134
function function_cf88b888() {
    self notify("7915320a3d7bf5e0");
    self endon("7915320a3d7bf5e0");
    self endoncallback(&function_43ec7ca3, #"death", #"hash_3af6fe8d4a8fac02");
    var_893a571 = 0;
    self playrenderoverridebundle("rob_zm_viewarm_vomit");
    while (!var_893a571) {
        var_37159c8c = self.var_7fd3b200;
        var_72840ba5 = min(var_37159c8c + 0.05, 1);
        self.var_7fd3b200 = var_72840ba5;
        self function_78233d29("rob_zm_viewarm_vomit", "", "Threshold", var_72840ba5);
        if (var_72840ba5 >= 1) {
            var_893a571 = 1;
            break;
        }
        wait(0.1);
    }
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 0, eflags: 0x2 linked
// Checksum 0xbf5778da, Offset: 0x1cd8
// Size: 0x12c
function function_1ca2497b() {
    self notify("3e0482d461e40463");
    self endon("3e0482d461e40463");
    self endoncallback(&function_43ec7ca3, #"death", #"hash_6bc06e9af30f987");
    var_e935ecce = 0;
    while (!var_e935ecce) {
        var_37159c8c = self.var_7fd3b200;
        var_72840ba5 = max(var_37159c8c - 0.025, 0);
        self.var_7fd3b200 = var_72840ba5;
        self function_78233d29("rob_zm_viewarm_vomit", "", "Threshold", var_72840ba5);
        if (var_72840ba5 <= 0) {
            self stoprenderoverridebundle("rob_zm_viewarm_vomit");
            var_e935ecce = 1;
            break;
        }
        wait(0.1);
    }
}

// Namespace namespace_6e561646/namespace_33cf6d06
// Params 1, eflags: 0x2 linked
// Checksum 0x86dae890, Offset: 0x1e10
// Size: 0xfc
function function_43ec7ca3(str_notify) {
    if (isdefined(self) && str_notify === "death") {
        if (self function_d2503806("rob_zm_viewarm_vomit")) {
            self function_f6e99a8d("rob_zm_viewarm_vomit");
        }
        localclientnum = self getlocalclientnumber();
        if (isdefined(self.var_185f551) && isdefined(localclientnum)) {
            killfx(localclientnum, self.var_185f551);
            self.var_185f551 = undefined;
        }
        if (postfx::function_556665f2("pstfx_zm_caustic_glob")) {
            self postfx::stoppostfxbundle("pstfx_zm_caustic_glob");
        }
    }
}

