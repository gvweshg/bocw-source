// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\ai\systems\ai_interface.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\ai\archetype_human.gsc;

#namespace humaninterface;

// Namespace humaninterface/archetype_human_interface
// Params 0, eflags: 0x2 linked
// Checksum 0x4bdd268f, Offset: 0x198
// Size: 0x4ec
function registerhumaninterfaceattributes() {
    ai::registermatchedinterface(#"human", #"can_be_meleed", 1, array(1, 0), &aiutility::meleeattributescallback);
    ai::registermatchedinterface(#"human", #"can_melee", 1, array(1, 0), &aiutility::meleeattributescallback);
    ai::registermatchedinterface(#"human", #"can_initiateaivsaimelee", 1, array(1, 0));
    ai::registermatchedinterface(#"human", #"coveridleonly", 0, array(1, 0));
    ai::registermatchedinterface(#"human", #"useanimationoverride", 0, array(1, 0), &humansoldierserverutils::useanimationoverridecallback);
    ai::registermatchedinterface(#"human", #"disablearrivals", 0, array(1, 0), &aiutility::arrivalattributescallback);
    ai::registermatchedinterface(#"human", #"disablepeek", 0, array(1, 0), &aiutility::function_eef4346c);
    ai::registermatchedinterface(#"human", #"disablelean", 0, array(1, 0), &aiutility::function_1cd75f29);
    ai::registermatchedinterface(#"human", #"disablereload", 0, array(1, 0), &aiutility::function_a626b1a9);
    ai::registermatchedinterface(#"human", #"stealth", 0, array(1, 0));
    ai::registermatchedinterface(#"human", #"vignette_mode", "off", array("off", "slow", "fast"), &humansoldierserverutils::vignettemodecallback);
    ai::registermatchedinterface(#"human", #"usegrenades", 1, array(1, 0));
    ai::registermatchedinterface(#"human", #"demeanor", "combat", array("combat", "patrol", "cqb", "alert"), &humansoldierserverutils::function_20fdb709);
    ai::registermatchedinterface(#"human", #"hash_1e055d856280060c", "none", array("none", "ads", "up", "down"), &humansoldierserverutils::function_beabbc97);
}

#namespace humansoldierserverutils;

// Namespace humansoldierserverutils/archetype_human_interface
// Params 4, eflags: 0x2 linked
// Checksum 0x4cf5baea, Offset: 0x690
// Size: 0x64
function useanimationoverridecallback(entity, *attribute, *oldvalue, value) {
    if (value) {
        oldvalue asmchangeanimmappingtable(1);
        return;
    }
    oldvalue asmchangeanimmappingtable(0);
}

// Namespace humansoldierserverutils/archetype_human_interface
// Params 4, eflags: 0x2 linked
// Checksum 0x78aa2b95, Offset: 0x700
// Size: 0x19a
function vignettemodecallback(entity, *attribute, *oldvalue, value) {
    switch (value) {
    case #"off":
        oldvalue.pushable = 1;
        oldvalue collidewithactors(0);
        oldvalue pushplayer(0);
        oldvalue setavoidancemask("avoid all");
        break;
    case #"slow":
        oldvalue.pushable = 0;
        oldvalue collidewithactors(0);
        oldvalue pushplayer(1);
        oldvalue setavoidancemask("avoid ai");
        break;
    case #"fast":
        oldvalue.pushable = 0;
        oldvalue collidewithactors(1);
        oldvalue pushplayer(1);
        oldvalue setavoidancemask("avoid none");
        break;
    default:
        break;
    }
}

// Namespace humansoldierserverutils/archetype_human_interface
// Params 4, eflags: 0x2 linked
// Checksum 0x519075eb, Offset: 0x8a8
// Size: 0x17a
function function_20fdb709(entity, *attribute, oldvalue, value) {
    if (value === oldvalue) {
        return;
    }
    attribute setblackboardattribute("_human_prev_demeanor", oldvalue);
    switch (value) {
    case #"combat":
        attribute setblackboardattribute("_human_demeanor", "COMBAT");
        break;
    case #"patrol":
        attribute setblackboardattribute("_human_demeanor", "PATROL");
        break;
    case #"cqb":
        attribute setblackboardattribute("_human_demeanor", "CQB");
        break;
    case #"alert":
        attribute setblackboardattribute("_human_demeanor", "ALERT");
        break;
    default:
        attribute setblackboardattribute("_human_demeanor", "COMBAT");
        break;
    }
}

// Namespace humansoldierserverutils/archetype_human_interface
// Params 4, eflags: 0x2 linked
// Checksum 0x337fd005, Offset: 0xa30
// Size: 0x132
function function_beabbc97(entity, *attribute, oldvalue, value) {
    if (value === oldvalue) {
        return;
    }
    switch (value) {
    case #"ads":
        attribute setblackboardattribute("_aim_overlay", "ADS");
        break;
    case #"up":
        attribute setblackboardattribute("_aim_overlay", "UP");
        break;
    case #"down":
        attribute setblackboardattribute("_aim_overlay", "DOWN");
        break;
    case #"none":
    default:
        attribute setblackboardattribute("_aim_overlay", "NONE");
        break;
    }
}

