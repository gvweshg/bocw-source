// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\sound_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\player\player_stats.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_8a3384f2;

// Namespace namespace_8a3384f2/namespace_8a3384f2
// Params 0, eflags: 0x2 linked
// Checksum 0xe6492820, Offset: 0xf0
// Size: 0x4c
function init_shared() {
    clientfield::register("toplayer", "in_tear_gas", 1, 2, "int", &function_9810ebc, 0, 0);
}

// Namespace namespace_8a3384f2/namespace_8a3384f2
// Params 7, eflags: 0x2 linked
// Checksum 0x11147709, Offset: 0x148
// Size: 0x1fe
function function_9810ebc(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    self notify(#"hash_75ccb6543bb805ed");
    self endon(#"death", #"hash_75ccb6543bb805ed");
    switch (bwastimejump) {
    case 1:
        targetvalue = 0.25;
        break;
    case 2:
        targetvalue = 0.5;
        break;
    case 3:
        targetvalue = 0.8;
        break;
    default:
        targetvalue = 0;
        break;
    }
    if (targetvalue != 0) {
        self notify(#"hash_59dc3b94303bbeac");
    } else {
        self notify(#"hash_71bef43cb9e9e9f4");
    }
    if (!isdefined(self.var_5316504e)) {
        self.var_5316504e = 0;
    }
    while (!self function_d2cb869e(#"hash_26ffc556c5b45ab7")) {
        waitframe(1);
    }
    self util::lerp_generic(fieldname, 1000, &function_3b08d399, self.var_5316504e, targetvalue, "Reveal Threshold", #"hash_26ffc556c5b45ab7");
    if (targetvalue == 0) {
        self codestoppostfxbundle(#"hash_26ffc556c5b45ab7");
        self.var_5316504e = undefined;
    }
}

// Namespace namespace_8a3384f2/namespace_8a3384f2
// Params 8, eflags: 0x2 linked
// Checksum 0x7a017367, Offset: 0x350
// Size: 0xa4
function function_3b08d399(*currenttime, elapsedtime, *localclientnum, duration, stagefrom, stageto, constant, postfx) {
    percent = localclientnum / duration;
    amount = stageto * percent + stagefrom * (1 - percent);
    self.var_5316504e = amount;
    self function_116b95e5(postfx, constant, amount);
}

