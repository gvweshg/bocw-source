// Atian COD Tools GSC CW decompiler test
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_clone;

// Namespace zm_clone/zm_clone
// Params 4, eflags: 0x0
// Checksum 0xb958fd0a, Offset: 0x128
// Size: 0x4d6
function spawn_player_clone(player, origin = player.origin, forceweapon, forcemodel) {
    primaryweapons = player getweaponslistprimaries();
    if (isdefined(forceweapon)) {
        weapon = forceweapon;
    } else if (primaryweapons.size) {
        weapon = primaryweapons[0];
    } else {
        weapon = player getcurrentweapon();
    }
    weaponmodel = weapon.worldmodel;
    spawner = getent("fake_player_spawner", "targetname");
    if (isdefined(spawner)) {
        clone = spawner spawnfromspawner();
        clone.origin = origin;
        clone.isactor = 1;
    } else {
        clone = spawn("script_model", origin);
        clone.isactor = 0;
    }
    if (isdefined(forcemodel)) {
        clone setmodel(forcemodel);
    } else {
        if (player function_390cb543()) {
            var_1749f1e8 = player function_92ea4100();
            if (isdefined(var_1749f1e8)) {
                clone setmodel(var_1749f1e8);
            }
            headmodel = player startquantity();
            if (isdefined(headmodel)) {
                if (isdefined(clone.head)) {
                    clone detach(clone.head);
                }
                clone attach(headmodel);
            }
            if (isdefined(clone.legs)) {
                clone detach(clone.legs);
            }
            if (isdefined(clone.torso)) {
                clone detach(clone.torso);
            }
        } else {
            var_41206ae3 = player function_5d23af5b();
            if (isdefined(var_41206ae3)) {
                clone setmodel(var_41206ae3);
            }
            headmodel = player startquantity();
            if (isdefined(headmodel)) {
                if (isdefined(clone.head)) {
                    clone detach(clone.head);
                }
                clone attach(headmodel);
            }
            var_b4d88433 = player function_cde23658();
            if (isdefined(var_b4d88433)) {
                if (isdefined(clone.legs)) {
                    clone detach(clone.legs);
                }
                clone attach(var_b4d88433);
            }
            var_1749f1e8 = player function_92ea4100();
            if (isdefined(var_1749f1e8)) {
                if (isdefined(clone.torso)) {
                    clone detach(clone.torso);
                }
                clone attach(var_1749f1e8);
            }
        }
        clone function_1fac41e4(player function_19124308());
    }
    if (weaponmodel != "" && weaponmodel != "none") {
        clone attach(weaponmodel, "tag_weapon_right");
    }
    clone.team = player.team;
    clone.is_inert = 1;
    clone.zombie_move_speed = "walk";
    clone.script_noteworthy = "corpse_clone";
    clone.actor_damage_func = &clone_damage_func;
    return clone;
}

// Namespace zm_clone/zm_clone
// Params 11, eflags: 0x2 linked
// Checksum 0xcb8e4d3a, Offset: 0x608
// Size: 0xb2
function clone_damage_func(*einflictor, eattacker, idamage, *idflags, *smeansofdeath, weapon, *vpoint, *vdir, *shitloc, *psoffsettime, *boneindex) {
    psoffsettime = 0;
    if (boneindex.isballisticknife && zm_weapons::is_weapon_upgraded(boneindex)) {
        self notify(#"player_revived", {#reviver:shitloc});
    }
    return psoffsettime;
}

// Namespace zm_clone/zm_clone
// Params 1, eflags: 0x0
// Checksum 0xbbdf662f, Offset: 0x6c8
// Size: 0x64
function clone_give_weapon(weapon) {
    weaponmodel = weapon.worldmodel;
    if (weaponmodel != "" && weaponmodel != "none") {
        self attach(weaponmodel, "tag_weapon_right");
    }
}

// Namespace zm_clone/zm_clone
// Params 1, eflags: 0x0
// Checksum 0xff0b8b6, Offset: 0x738
// Size: 0x44
function clone_animate(animtype) {
    if (self.isactor) {
        self thread clone_actor_animate(animtype);
        return;
    }
    self thread clone_mover_animate(animtype);
}

// Namespace zm_clone/zm_clone
// Params 1, eflags: 0x2 linked
// Checksum 0x111725b9, Offset: 0x788
// Size: 0x9a
function clone_actor_animate(animtype) {
    wait(0.1);
    switch (animtype) {
    case #"laststand":
        self setanimstatefromasd("laststand");
        break;
    case #"idle":
    default:
        self setanimstatefromasd("idle");
        break;
    }
}

// Namespace zm_clone/zm_clone
// Params 1, eflags: 0x2 linked
// Checksum 0x8fdd1623, Offset: 0x830
// Size: 0x162
function clone_mover_animate(animtype) {
    self useanimtree("generic");
    switch (animtype) {
    case #"laststand":
        self setanim(#"pb_laststand_idle");
        break;
    case #"afterlife":
        self setanim(#"pb_afterlife_laststand_idle");
        break;
    case #"chair":
        self setanim(#"ai_actor_elec_chair_idle");
        break;
    case #"falling":
        self setanim(#"pb_falling_loop");
        break;
    case #"idle":
    default:
        self setanim(#"pb_stand_alert");
        break;
    }
}

