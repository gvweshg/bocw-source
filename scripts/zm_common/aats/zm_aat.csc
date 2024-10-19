// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\aats\ammomods\ammomod_shatterblast.csc;
#using scripts\zm_common\aats\ammomods\ammomod_electriccherry.csc;
#using scripts\zm_common\aats\ammomods\ammomod_deadwire.csc;
#using scripts\zm_common\aats\ammomods\ammomod_brainrot.csc;
#using scripts\zm_common\aats\ammomods\ammomod_napalmburst.csc;
#using scripts\zm_common\aats\ammomods\ammomod_cryofreeze.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\aat_shared.csc;

#namespace zm_aat;

// Namespace zm_aat/zm_aat
// Params 0, eflags: 0x5
// Checksum 0xc00b0dc6, Offset: 0x378
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"zm_aat", &preinit, undefined, undefined, undefined);
}

// Namespace zm_aat/zm_aat
// Params 0, eflags: 0x6 linked
// Checksum 0x18c79513, Offset: 0x3c0
// Size: 0x2fc
function private preinit() {
    if (!is_true(level.aat_in_use)) {
        return;
    }
    level.aat_initializing = 1;
    level aat::function_571fceb("ammomod_brainrot", &ammomod_brainrot::init_brainrot);
    level aat::function_571fceb("ammomod_cryofreeze", &ammomod_cryofreeze::init_cryofreeze);
    level aat::function_571fceb("ammomod_deadwire", &ammomod_deadwire::init_deadwire);
    level aat::function_571fceb("ammomod_napalmburst", &ammomod_napalmburst::init_napalmburst);
    level aat::function_571fceb("ammomod_electriccherry", &ammomod_electriccherry::init_electriccherry);
    level aat::function_571fceb("ammomod_shatterblast", &ammomod_shatterblast::init_shatterblast);
    clientfield::register("toplayer", "" + #"hash_10f9eacd143d57ae", 1, 1, "int", &function_6ab142a9, 1, 0);
    clientfield::register("toplayer", "ammomod_play_rob_tier", 15000, 3, "int", &function_cc40e7e2, 1, 0);
    clientfield::register("toplayer", "ammomod_cryofreeze_idle", 1, 1, "int", &function_c62bfdf2, 1, 0);
    clientfield::register("toplayer", "ammomod_napalmburst_idle", 1, 1, "int", &function_f745370f, 1, 0);
    clientfield::register("toplayer", "ammomod_brainrot_idle", 1, 1, "int", &function_7c325bd9, 1, 0);
    clientfield::register("toplayer", "ammomod_deadwire_idle", 1, 1, "int", &function_5cc517e6, 1, 0);
    level aat::function_2b3bcce0();
}

// Namespace zm_aat/zm_aat
// Params 1, eflags: 0x2 linked
// Checksum 0xa4dd6d99, Offset: 0x6c8
// Size: 0xd2
function function_74b823de(tier = 1) {
    switch (tier) {
    case 1:
    case 2:
        return "rob_ammo_mod_level_1";
    case 3:
        return "rob_ammo_mod_level_2";
    case 4:
        return "rob_ammo_mod_level_3";
    case 5:
        return "rob_ammo_mod_level_4";
    case 6:
        return "rob_ammo_mod_level_5";
    }
    return "rob_ammo_mod_level_1";
}

// Namespace zm_aat/zm_aat
// Params 0, eflags: 0x2 linked
// Checksum 0x1a82184, Offset: 0x7a8
// Size: 0xbc
function function_ac9a87aa() {
    if (isplayer(self)) {
        self stoprenderoverridebundle("rob_ammo_mod_level_1");
        self stoprenderoverridebundle("rob_ammo_mod_level_2");
        self stoprenderoverridebundle("rob_ammo_mod_level_3");
        self stoprenderoverridebundle("rob_ammo_mod_level_4");
        self stoprenderoverridebundle("rob_ammo_mod_level_5");
    }
}

// Namespace zm_aat/zm_aat
// Params 2, eflags: 0x2 linked
// Checksum 0xfa886d6b, Offset: 0x870
// Size: 0x82
function function_c059fde4(localclientnum, fx) {
    self util::waittill_dobj(localclientnum);
    if (isplayer(self) && self hasdobj(localclientnum)) {
        self.var_8502e221 = playviewmodelfx(localclientnum, fx, "tag_fx1", 0);
    }
}

// Namespace zm_aat/zm_aat
// Params 7, eflags: 0x2 linked
// Checksum 0xc038317f, Offset: 0x900
// Size: 0x84
function function_cc40e7e2(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    self function_ac9a87aa();
    if (bwastimejump > 1) {
        self playrenderoverridebundle(function_74b823de(bwastimejump));
    }
}

// Namespace zm_aat/zm_aat
// Params 7, eflags: 0x2 linked
// Checksum 0xe1cc2a00, Offset: 0x990
// Size: 0xf4
function function_c62bfdf2(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump > 0) {
        self endon(#"death");
        waitframe(1);
        if (isdefined(self.var_8502e221)) {
            killfx(fieldname, self.var_8502e221);
        }
        self function_c059fde4(fieldname, "zm_weapons/fx9_aat_cryofreeze_attachment_amb_1p");
        return;
    }
    if (isdefined(self.var_8502e221)) {
        killfx(fieldname, self.var_8502e221);
    }
    self function_ac9a87aa();
}

// Namespace zm_aat/zm_aat
// Params 7, eflags: 0x2 linked
// Checksum 0x5e2de2c8, Offset: 0xa90
// Size: 0xf4
function function_f745370f(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump > 0) {
        self endon(#"death");
        waitframe(1);
        if (isdefined(self.var_8502e221)) {
            killfx(fieldname, self.var_8502e221);
        }
        self function_c059fde4(fieldname, "zm_weapons/fx9_aat_burnination_attachment_amb_1p");
        return;
    }
    if (isdefined(self.var_8502e221)) {
        killfx(fieldname, self.var_8502e221);
    }
    self function_ac9a87aa();
}

// Namespace zm_aat/zm_aat
// Params 7, eflags: 0x2 linked
// Checksum 0x18f42fe3, Offset: 0xb90
// Size: 0xf4
function function_7c325bd9(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump > 0) {
        self endon(#"death");
        waitframe(1);
        if (isdefined(self.var_8502e221)) {
            killfx(fieldname, self.var_8502e221);
        }
        self function_c059fde4(fieldname, "zm_weapons/fx9_aat_brain_rot_attachment_amb_1p");
        return;
    }
    if (isdefined(self.var_8502e221)) {
        killfx(fieldname, self.var_8502e221);
    }
    self function_ac9a87aa();
}

// Namespace zm_aat/zm_aat
// Params 7, eflags: 0x2 linked
// Checksum 0x7d207952, Offset: 0xc90
// Size: 0xf4
function function_5cc517e6(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump > 0) {
        self endon(#"death");
        waitframe(1);
        if (isdefined(self.var_8502e221)) {
            killfx(fieldname, self.var_8502e221);
        }
        self function_c059fde4(fieldname, "zm_weapons/fx9_aat_dead_wire_attachment_amb_1p");
        return;
    }
    if (isdefined(self.var_8502e221)) {
        killfx(fieldname, self.var_8502e221);
    }
    self function_ac9a87aa();
}

// Namespace zm_aat/zm_aat
// Params 7, eflags: 0x2 linked
// Checksum 0x6af7ff0d, Offset: 0xd90
// Size: 0xf4
function function_6ab142a9(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump > 0) {
        self endon(#"death");
        waitframe(1);
        if (isdefined(self.var_8502e221)) {
            killfx(fieldname, self.var_8502e221);
        }
        self function_c059fde4(fieldname, "zm_weapons/fx9_aat_shatterblast_attachment_amb_1p");
        return;
    }
    if (isdefined(self.var_8502e221)) {
        killfx(fieldname, self.var_8502e221);
    }
    self function_ac9a87aa();
}

