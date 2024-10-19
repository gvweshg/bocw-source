// Atian COD Tools GSC CW decompiler test
#using scripts\weapons\weaponobjects.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace grenades;

// Namespace grenades/grenades
// Params 0, eflags: 0x0
// Checksum 0x6fe7db73, Offset: 0xa0
// Size: 0xac
function init_shared() {
    weaponobjects::function_e6400478(#"eq_sticky_grenade", &creategrenadewatcher, 1);
    weaponobjects::function_e6400478(#"concussion_grenade", &creategrenadewatcher, 1);
    weaponobjects::function_e6400478(#"hash_5825488ac68418af", &creategrenadewatcher, 1);
}

// Namespace grenades/grenades
// Params 1, eflags: 0x0
// Checksum 0x34e40ef9, Offset: 0x158
// Size: 0x22
function creategrenadewatcher(watcher) {
    watcher.onspawn = &function_aa95d684;
}

// Namespace grenades/grenades
// Params 2, eflags: 0x0
// Checksum 0x7f5d35a2, Offset: 0x188
// Size: 0x4c
function function_aa95d684(*watcher, *player) {
    self clientfield::set("enemyequip", 1);
    self thread function_5f86757d();
}

// Namespace grenades/grenades
// Params 0, eflags: 0x0
// Checksum 0xb81bceb7, Offset: 0x1e0
// Size: 0x6c
function function_5f86757d() {
    level endon(#"game_ended");
    self waittill(#"explode", #"death");
    if (!isdefined(self)) {
        return;
    }
    self clientfield::set("enemyequip", 0);
}

