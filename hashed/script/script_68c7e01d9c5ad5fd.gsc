// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\ai\zombie_eye_glow.csc;
#using scripts\core_common\ai\systems\fx_character.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_146875e;

// Namespace namespace_146875e/namespace_146875e
// Params 0, eflags: 0x2 linked
// Checksum 0x9ea344ed, Offset: 0x1e8
// Size: 0x114
function init() {
    function_cae618b4("spawner_zombietron_gladiator_destroyer");
    function_cae618b4("spawner_zombietron_gladiator_marauder");
    level._effect[#"fx8_destroyer_arm_spurt"] = "zm_ai/fx8_destroyer_arm_spurt";
    footsteps::registeraitypefootstepcb(#"gladiator", &function_918ce680);
    clientfield::register("toplayer", "gladiator_melee_effect", 1, 1, "counter", &function_5dae94f, 0, 0);
    clientfield::register("actor", "gladiator_arm_effect", 1, 2, "int", &function_f5a07d57, 0, 0);
}

// Namespace namespace_146875e/namespace_146875e
// Params 5, eflags: 0x6 linked
// Checksum 0xf3896793, Offset: 0x308
// Size: 0x1b4
function private function_918ce680(localclientnum, pos, *surface, *notetrack, *bone) {
    e_player = function_5c10bd79(notetrack);
    n_dist = distancesquared(bone, e_player.origin);
    var_dfce5acd = 1000000;
    if (var_dfce5acd > 0) {
        n_scale = (var_dfce5acd - n_dist) / var_dfce5acd;
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

// Namespace namespace_146875e/namespace_146875e
// Params 7, eflags: 0x6 linked
// Checksum 0xe58d5a14, Offset: 0x4c8
// Size: 0x8c
function private function_5dae94f(localclientnum, *oldval, *newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    earthquake(bwastimejump, 0.3, 1.2, self.origin, 64);
    function_36e4ebd4(bwastimejump, "damage_light");
}

// Namespace namespace_146875e/namespace_146875e
// Params 7, eflags: 0x6 linked
// Checksum 0x1783da3c, Offset: 0x560
// Size: 0xcc
function private function_f5a07d57(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    if (bwastimejump == 1) {
        util::playfxontag(fieldname, level._effect[#"fx8_destroyer_arm_spurt"], self, "j_shouldertwist_le");
        return;
    }
    if (bwastimejump == 2) {
        util::playfxontag(fieldname, level._effect[#"fx8_destroyer_arm_spurt"], self, "tag_shoulder_ri_fx");
    }
}

