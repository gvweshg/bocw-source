// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\aats\ammomods\ammomod_deadwire.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace ammomod_electriccherry;

// Namespace ammomod_electriccherry/ammomod_electriccherry
// Params 0, eflags: 0x2 linked
// Checksum 0xed25e85e, Offset: 0x130
// Size: 0xec
function init_electriccherry() {
    if (!is_true(level.aat_in_use)) {
        return;
    }
    if (!is_true(getgametypesetting(#"hash_87dd6c14b668b1d"))) {
        level.var_6563ffa = 1;
    }
    aat::register("ammomod_electriccherry", 0.1, 0, 5, 5, 1, &result, "t7_hud_zm_aat_deadwire", "wpn_aat_dead_wire_plr", undefined, #"electrical");
    clientfield::register("allplayers", "ammomod_electric_cherry_explode", 1, 1, "counter");
}

// Namespace ammomod_electriccherry/ammomod_electriccherry
// Params 8, eflags: 0x2 linked
// Checksum 0x6cb62f74, Offset: 0x228
// Size: 0x60
function result(*death, *attacker, *mod, *weapon, *var_fd90b0bb, *vpoint, *shitloc, *boneindex) {
    if (is_true(level.var_6563ffa)) {
        return;
    }
}

// Namespace ammomod_electriccherry/reload
// Params 1, eflags: 0x20
// Checksum 0x1c86da15, Offset: 0x290
// Size: 0x9c
function event_handler[reload] function_b4174270(*eventstruct) {
    if (!is_true(level.var_6563ffa)) {
        return;
    }
    weapon = self getcurrentweapon();
    item = item_inventory::function_230ceec4(weapon);
    if (item.itementry.ammomodname === #"ammomod_electriccherry") {
        self function_aa4171b9();
    }
}

// Namespace ammomod_electriccherry/ammomod_electriccherry
// Params 0, eflags: 0x2 linked
// Checksum 0x58b2531c, Offset: 0x338
// Size: 0x14c
function function_aa4171b9() {
    self clientfield::increment("ammomod_electric_cherry_explode", 1);
    s_params = level.var_7659ca85;
    a_zombies = getentitiesinradius(self.origin, 256, 15);
    count = 0;
    foreach (e_zombie in a_zombies) {
        if (count >= 30) {
            return;
        }
        if (e_zombie == self) {
            continue;
        }
        if (e_zombie.var_6f84b820 === #"elite") {
            continue;
        }
        e_zombie ammomod_deadwire::function_de99f2ad(self, e_zombie, s_params, 5);
        count++;
    }
}

