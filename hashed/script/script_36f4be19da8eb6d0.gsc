// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_eye_glow.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using script_24c32478acf44108;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_b376a999;

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x5
// Checksum 0x3a7fe198, Offset: 0x2f0
// Size: 0x4c
function private autoexec __init__system__() {
    system::register(#"hash_36cdf1547e49b57a", &preinit, &postinit, undefined, "zm_weapons");
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x6 linked
// Checksum 0x265eba04, Offset: 0x348
// Size: 0x15e0
function private preinit() {
    callback::on_connect(&on_player_connect);
    callback::on_ai_damage(&function_33fb41f6);
    callback::on_ai_killed(&function_d72b9d03);
    callback::add_callback(#"on_vehicle_enter", &on_vehicle_enter);
    if (zm_utility::is_survival()) {
        level.var_1a4cc228[#"hash_7cba8a05511ceedf"] = [#"hash_49adea61f71924bf", #"hash_1798ecca7f98873d", #"hash_26f6708ef92a0eae", #"hash_1c8805fec5806efe", #"hash_4d95f42b33499eba", #"hash_6799427e5e6c417c", #"hash_11e4908180a964c", #"hash_1340313347e93335"];
        level.var_1a4cc228[#"hash_29771ab26cb78d9b"] = [#"hash_69143c727337ba1a", #"hash_299e8cfa6d75ffd4", #"hash_7d223eb036f4a31b", #"hash_11d7f39f088f3822", #"hash_5e074c09a3a31d97", #"hash_1c437f787033a2e5", #"hash_34d9e63476111b5d", #"hash_779daa809936d578"];
        level.var_1a4cc228[#"hash_46c917a1b5ed91e7"] = [#"hash_4729aed4cfa43476"];
        level.var_1a4cc228[#"hash_338eb4103e0ed797"] = [#"hash_59e40ffcdcfbffa6"];
        level.var_1a4cc228[#"hash_124b582ce08d78c0"] = [#"hash_149fa86a9c5d858c", #"hash_63e9d6f275dc720", #"hash_94674cb554826a9", #"hash_6b9e4c8e8e955c71", #"hash_75cfd69ce1d6f3dd", #"hash_33c0e923173d2b48", #"hash_53dbc62471a61f88", #"hash_4ece13caf46c00c7"];
        level.var_1a4cc228[#"hash_30e4941b102093c4"] = [#"hash_5c0dcc3f9d9e1ea5", #"hash_e8b647bb58521c1", #"hash_23492308d6911444", #"hash_5616978b668f07dc", #"hash_31713e12a88def10", #"hash_3e647996c0a4d6b9", #"hash_b35b3dcb7417075", #"hash_53dbc62471a61f88"];
        level.var_1a4cc228[#"hash_78215fa79f5557dc"] = [#"hash_4814b7b3c67568e3"];
        level.var_1a4cc228[#"hash_12a17ab3df5889eb"] = level.var_1a4cc228[#"hash_78215fa79f5557dc"];
        level.var_1a4cc228[#"hash_7a8b592728eec95d"] = [#"hash_2cb37314243526ec"];
        level.var_1a4cc228[#"spawner_zm_steiner_split_radiation_bomb"] = [#"hash_614e3d7d0b75a944"];
        level.var_1a4cc228[#"spawner_zm_steiner_split_radiation_blast"] = [#"hash_53c08317d48a0e49"];
        level.var_1a4cc228[#"hash_6904f5c7bef64405"] = [#"hash_5eafd160d077670d"];
        level.var_1a4cc228[#"hash_7f957e36b4f6160f"] = [#"hash_61df3be05096e9e2"];
        level.var_1a4cc228[#"hash_729b116cf9d044"] = [#"hash_78238b400ae08c28"];
    } else if (util::get_map_name() == "zm_silver") {
        level.var_1a4cc228[#"hash_5214ebcccbd95a36"] = [#"hash_6137ec0a60179183", #"hash_725982139f7312b6", #"hash_161f9bdf4e9e092f", #"hash_2de8c613f642c492", #"hash_5c0877f0bdec3739", #"hash_3b3eb000bcfc5389", #"hash_c71860858c9efd0"];
        level.var_1a4cc228[#"hash_bc5dffd7824c28f"] = level.var_1a4cc228[#"hash_5214ebcccbd95a36"];
        level.var_1a4cc228[#"hash_78215fa79f5557dc"] = [#"hash_4814b7b3c67568e3"];
        level.var_1a4cc228[#"hash_12a17ab3df5889eb"] = level.var_1a4cc228[#"hash_78215fa79f5557dc"];
        level.var_1a4cc228[#"spawner_zm_steiner_split_radiation_bomb"] = [#"hash_614e3d7d0b75a944"];
        level.var_1a4cc228[#"spawner_zm_steiner_split_radiation_blast"] = [#"hash_53c08317d48a0e49"];
        level.var_1a4cc228[#"hash_19ef16d1ba01a5"] = [#"hash_4729aed4cfa43476"];
    }
    level.var_652bc5ed = getweapon(#"ww_ieu_shockwave_t9");
    level.var_b6956429 = getweapon(#"ww_ieu_shockwave_t9_upgraded");
    weaponobjects::function_e6400478(#"ww_ieu_shockwave_t9", &function_d48a01a5, 1);
    weaponobjects::function_e6400478(#"ww_ieu_shockwave_t9_upgraded", &function_d48a01a5, 1);
    level.var_810eda2b = getweapon(#"ww_ieu_acid_t9");
    level.var_a7de843a = getweapon(#"ww_ieu_acid_t9_upgraded");
    zm::function_84d343d(#"ww_ieu_acid_t9", &function_ca6c6727);
    zm::function_84d343d(#"ww_ieu_acid_t9_upgraded", &function_ca6c6727);
    zm_weapons::function_90953640(level.var_810eda2b, 3, float(function_60d95f53()) / 1000);
    zm_weapons::function_90953640(level.var_a7de843a, 3, float(function_60d95f53()) / 1000);
    level.var_fb37bf51 = getweapon(#"ww_ieu_gas_t9");
    level.var_970f9313 = getweapon(#"ww_ieu_gas_t9_upgraded");
    weaponobjects::function_e6400478(#"ww_ieu_gas_t9", &function_47c38bc8, 1);
    weaponobjects::function_e6400478(#"ww_ieu_gas_t9_upgraded", &function_47c38bc8, 1);
    zombie_utility::add_zombie_gib_weapon_callback(#"ww_ieu_gas_t9", &function_7a7d85a4, &function_7a7d85a4);
    zombie_utility::add_zombie_gib_weapon_callback(#"ww_ieu_gas_t9_upgraded", &function_7a7d85a4, &function_7a7d85a4);
    callback::add_weapon_fired(level.var_fb37bf51, &function_c8adf16f);
    callback::add_weapon_fired(level.var_970f9313, &function_c8adf16f);
    zm_weapons::function_90953640(level.var_fb37bf51, 5, float(function_60d95f53()) / 1000);
    zm_weapons::function_90953640(level.var_970f9313, 5, float(function_60d95f53()) / 1000);
    level.var_12b450dc = getweapon(#"ww_ieu_plasma_t9");
    level.var_6b41a8a1 = getweapon(#"ww_ieu_plasma_t9_upgraded");
    weaponobjects::function_e6400478(#"ww_ieu_plasma_t9", &function_3c39516d, 1);
    weaponobjects::function_e6400478(#"ww_ieu_plasma_t9_upgraded", &function_3c39516d, 1);
    zm::function_84d343d(level.var_12b450dc.name, &function_fd195372);
    zm::function_84d343d(level.var_6b41a8a1.name, &function_fd195372);
    callback::add_weapon_fired(level.var_12b450dc, &function_d6ae76f5);
    callback::add_weapon_fired(level.var_6b41a8a1, &function_d6ae76f5);
    clientfield::register("actor", "" + #"hash_77e641a4db48ad0f", 1, 2, "int");
    clientfield::register("allplayers", "" + #"hash_492f4817c4296ddf", 1, 1, "counter");
    clientfield::register("allplayers", "" + #"hash_89386ef1bb99cdf", 1, 2, "int");
    clientfield::register("actor", "" + #"hash_380d2d329a41c90e", 1, 1, "int");
    clientfield::register("allplayers", "" + #"hash_392d4dd36fe37ce7", 1, 1, "counter");
    clientfield::register("actor", "" + #"hash_7e9eb1c31cf618f0", 1, 1, "int");
    clientfield::register("allplayers", "" + #"hash_40635c43f5d87929", 1, 3, "int");
    clientfield::register("actor", "" + #"hash_306339376ad218f0", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_4061bf5adf6ebd2", 1, 3, "int");
    clientfield::register("allplayers", "" + #"hash_7c865b5dcfbe46c0", 1, 1, "int");
    clientfield::register("missile", "" + #"hash_685e6cfaf658518e", 1, 1, "int");
    level.var_e0be56c0 = getweapon(#"ww_ieu_electric_t9");
    level.var_e80744aa = getweapon(#"ww_ieu_electric_t9_upgraded");
    function_efcce3c1();
    callback::add_weapon_fired(level.var_e0be56c0, &function_5a9a8abc);
    callback::add_weapon_fired(level.var_e80744aa, &function_5a9a8abc);
    clientfield::register("allplayers", "" + #"hash_2eb1021a0e4110d1", 1, 2, "int");
    namespace_9ff9f642::register_slowdown(#"hash_659e542bc102c218", 0.8, 0.5);
    namespace_9ff9f642::register_slowdown(#"hash_e5fddce96190022", 1, 0);
    namespace_9ff9f642::register_slowdown(#"hash_37ca44613f9ed8bc", 1, 0);
    namespace_9ff9f642::register_slowdown(#"hash_1262748e23d5dff8", 1, 0);
    namespace_9ff9f642::register_slowdown(#"hash_a40f7d48ac714db", 1, 0);
    namespace_9ff9f642::register_slowdown(#"hash_40ca16d063cdb34f", 0.5, 5);
    clientfield::register("actor", "" + #"hash_6dca42b5563953ef", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_2a7b72235f0b387e", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_1709a7bbfac5e1e0", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_3a35110e6ccc5486", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_48257c0dba76b140", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_97d03a2a0786ba6", 1, 2, "int");
    clientfield::register("allplayers", "" + #"hash_3c92af57fde1f8f7", 1, 4, "int");
    level.var_58e6238 = &function_caac60f2;
    level.var_f975b6ae = &function_301812b0;
    level.var_2f81d430 = &function_a93a6096;
    level.var_9ea358cc = 0;
    if (!isdefined(level.var_faabb06f)) {
        level.var_faabb06f = [];
    } else if (!isarray(level.var_faabb06f)) {
        level.var_faabb06f = array(level.var_faabb06f);
    }
    if (!isinarray(level.var_faabb06f, #"ww_ieu_electric_t9")) {
        level.var_faabb06f[level.var_faabb06f.size] = #"ww_ieu_electric_t9";
    }
    if (!isdefined(level.var_faabb06f)) {
        level.var_faabb06f = [];
    } else if (!isarray(level.var_faabb06f)) {
        level.var_faabb06f = array(level.var_faabb06f);
    }
    if (!isinarray(level.var_faabb06f, #"ww_ieu_electric_t9_upgraded")) {
        level.var_faabb06f[level.var_faabb06f.size] = #"ww_ieu_electric_t9_upgraded";
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0xb778a8c7, Offset: 0x1930
// Size: 0x4b4
function postinit() {
    zm_weapons::function_8389c033(#"ww_ieu_shockwave_t9", #"ww_ieu_shockwave_t9");
    zm_weapons::function_8389c033(#"ww_ieu_shockwave_t9", #"ww_ieu_plasma_t9");
    zm_weapons::function_8389c033(#"ww_ieu_shockwave_t9", #"ww_ieu_gas_t9");
    zm_weapons::function_8389c033(#"ww_ieu_shockwave_t9", #"ww_ieu_electric_t9");
    zm_weapons::function_8389c033(#"ww_ieu_shockwave_t9", #"ww_ieu_acid_t9");
    zm_weapons::function_8389c033(#"ww_ieu_plasma_t9", #"ww_ieu_shockwave_t9");
    zm_weapons::function_8389c033(#"ww_ieu_plasma_t9", #"ww_ieu_plasma_t9");
    zm_weapons::function_8389c033(#"ww_ieu_plasma_t9", #"ww_ieu_gas_t9");
    zm_weapons::function_8389c033(#"ww_ieu_plasma_t9", #"ww_ieu_electric_t9");
    zm_weapons::function_8389c033(#"ww_ieu_plasma_t9", #"ww_ieu_acid_t9");
    zm_weapons::function_8389c033(#"ww_ieu_gas_t9", #"ww_ieu_shockwave_t9");
    zm_weapons::function_8389c033(#"ww_ieu_gas_t9", #"ww_ieu_plasma_t9");
    zm_weapons::function_8389c033(#"ww_ieu_gas_t9", #"ww_ieu_gas_t9");
    zm_weapons::function_8389c033(#"ww_ieu_gas_t9", #"ww_ieu_electric_t9");
    zm_weapons::function_8389c033(#"ww_ieu_gas_t9", #"ww_ieu_acid_t9");
    zm_weapons::function_8389c033(#"ww_ieu_electric_t9", #"ww_ieu_shockwave_t9");
    zm_weapons::function_8389c033(#"ww_ieu_electric_t9", #"ww_ieu_plasma_t9");
    zm_weapons::function_8389c033(#"ww_ieu_electric_t9", #"ww_ieu_gas_t9");
    zm_weapons::function_8389c033(#"ww_ieu_electric_t9", #"ww_ieu_electric_t9");
    zm_weapons::function_8389c033(#"ww_ieu_electric_t9", #"ww_ieu_acid_t9");
    zm_weapons::function_8389c033(#"ww_ieu_acid_t9", #"ww_ieu_shockwave_t9");
    zm_weapons::function_8389c033(#"ww_ieu_acid_t9", #"ww_ieu_plasma_t9");
    zm_weapons::function_8389c033(#"ww_ieu_acid_t9", #"ww_ieu_gas_t9");
    zm_weapons::function_8389c033(#"ww_ieu_acid_t9", #"ww_ieu_electric_t9");
    zm_weapons::function_8389c033(#"ww_ieu_acid_t9", #"ww_ieu_acid_t9");
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x6 linked
// Checksum 0xfa175c9e, Offset: 0x1df0
// Size: 0x2c
function private function_1475944a() {
    level.var_9ea358cc++;
    self waittill(#"death");
    level.var_9ea358cc--;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x6 linked
// Checksum 0xfe50aaa8, Offset: 0x1e28
// Size: 0x34
function private on_player_connect() {
    self thread watch_weapon_changes();
    self thread function_18fbdeee();
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0x9e76a986, Offset: 0x1e68
// Size: 0x238
function function_18fbdeee() {
    self endon(#"disconnect");
    while (true) {
        waitresult = self waittill(#"hash_3abc816f9601bdd3");
        weapon = waitresult.weapon;
        if (!function_5fef4201(weapon) || self isfiring()) {
            continue;
        }
        max_ammo = self getweaponammoclipsize(weapon);
        var_379c9ca1 = self getweaponammoclip(weapon);
        if (var_379c9ca1 < max_ammo && !isdefined(self.crystal)) {
            self val::reset(#"hash_1b614432d036c713", "allow_ads");
            self val::set(#"hash_38d5012e2e2ee1d3", "disable_weapon_fire", 1);
            self function_a0a2d8ee(1);
            var_242262dc = self function_c3b3603d(weapon, 1);
            self thread function_f0c18475(weapon, var_242262dc);
            self thread function_427f113c(weapon, var_242262dc);
            self thread function_4f7dc212();
            continue;
        }
        if (!is_true(self.var_508be317)) {
            self playsound(#"hash_6a39443b1d6cbd15");
            self.var_508be317 = 1;
            self thread function_6e1aa0a9();
        }
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x6 linked
// Checksum 0x7e72572d, Offset: 0x20a8
// Size: 0x8a
function private function_6e1aa0a9() {
    self notify("3ebbeae649d31445");
    self endon("3ebbeae649d31445");
    self endon(#"disconnect");
    while (self throwbuttonpressed() && function_5fef4201(self getcurrentweapon())) {
        waitframe(1);
    }
    if (isdefined(self)) {
        self.var_508be317 = undefined;
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0x4686a945, Offset: 0x2140
// Size: 0x21a
function watch_weapon_changes() {
    self endon(#"disconnect");
    while (true) {
        waitresult = self waittill(#"weapon_change");
        weapon = waitresult.weapon;
        if (function_5fef4201(weapon)) {
            if (function_f1c015e1(weapon)) {
                if (!isdefined(self.var_343d2604)) {
                    self.var_343d2604 = 0;
                }
            } else if (function_f17bb85a(weapon)) {
                if (!isdefined(self.var_8e1667b6)) {
                    self.var_8e1667b6 = 0;
                }
            }
            function_96db9f3(weapon, 0);
            self val::set(#"hash_1b614432d036c713", "allow_ads", 0);
        } else {
            self val::reset(#"hash_1b614432d036c713", "allow_ads");
            self val::reset(#"hash_38d5012e2e2ee1d3", "disable_weapon_fire");
        }
        if (function_c988c217(weapon)) {
            self.var_3f74bd46 = 0;
            self.var_c627b034 = 1;
        }
        if (function_f1c015e1(waitresult.last_weapon)) {
            self function_53e5275c(9);
            self.var_343d2604 = 0;
        }
        if (function_f17bb85a(waitresult.last_weapon)) {
            self function_de1f133e(2);
            self.var_8e1667b6 = 0;
        }
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x5a78bbda, Offset: 0x2368
// Size: 0xe
function function_7a7d85a4(*damage_percent) {
    return false;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x78ac8b70, Offset: 0x2380
// Size: 0xf4
function function_5fef4201(weapon) {
    if (isdefined(weapon)) {
        w_root = zm_weapons::function_386dacbc(weapon);
        switch (w_root.name) {
        case #"ww_ieu_gas_t9_upgraded":
        case #"ww_ieu_plasma_t9_upgraded":
        case #"ww_ieu_acid_t9_upgraded":
        case #"ww_ieu_shockwave_t9_upgraded":
        case #"ww_ieu_shockwave_t9":
        case #"ww_ieu_electric_t9_upgraded":
        case #"ww_ieu_electric_t9":
        case #"ww_ieu_acid_t9":
        case #"ww_ieu_gas_t9":
        case #"ww_ieu_plasma_t9":
            return true;
        }
    }
    return false;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xbcef388d, Offset: 0x2480
// Size: 0xa4
function function_7d5e7c71(weapon) {
    if (isdefined(weapon)) {
        w_root = zm_weapons::function_386dacbc(weapon);
        switch (w_root.name) {
        case #"ww_ieu_gas_t9_upgraded":
        case #"ww_ieu_plasma_t9_upgraded":
        case #"ww_ieu_acid_t9_upgraded":
        case #"ww_ieu_shockwave_t9_upgraded":
        case #"ww_ieu_electric_t9_upgraded":
            return true;
        }
    }
    return false;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xdccf24f4, Offset: 0x2530
// Size: 0xba
function function_a93a6096(player) {
    var_57b1ae9e = player getweaponslist();
    foreach (player_weapon in var_57b1ae9e) {
        if (function_5fef4201(player_weapon)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xca85a950, Offset: 0x25f8
// Size: 0x58
function function_7c292369(weapon) {
    return isdefined(weapon) && (zm_weapons::function_386dacbc(weapon) == level.var_652bc5ed || zm_weapons::function_386dacbc(weapon) == level.var_b6956429);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x7d28cdcc, Offset: 0x2658
// Size: 0x58
function function_c988c217(weapon) {
    return isdefined(weapon) && (zm_weapons::function_386dacbc(weapon) == level.var_e0be56c0 || zm_weapons::function_386dacbc(weapon) == level.var_e80744aa);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x5e3b634b, Offset: 0x26b8
// Size: 0x58
function function_f1c015e1(weapon) {
    return isdefined(weapon) && (zm_weapons::function_386dacbc(weapon) == level.var_fb37bf51 || zm_weapons::function_386dacbc(weapon) == level.var_970f9313);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x45ae7e57, Offset: 0x2718
// Size: 0x58
function function_8fbb3409(weapon) {
    return isdefined(weapon) && (zm_weapons::function_386dacbc(weapon) == level.var_810eda2b || zm_weapons::function_386dacbc(weapon) == level.var_a7de843a);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x4ea43f31, Offset: 0x2778
// Size: 0x58
function function_f17bb85a(weapon) {
    return isdefined(weapon) && (zm_weapons::function_386dacbc(weapon) == level.var_12b450dc || zm_weapons::function_386dacbc(weapon) == level.var_6b41a8a1);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 2, eflags: 0x2 linked
// Checksum 0x4e698154, Offset: 0x27d8
// Size: 0x46
function function_760c0d2d(weapon, means_of_death) {
    return function_5fef4201(weapon) && isdefined(means_of_death) && means_of_death == "MOD_DOT";
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 2, eflags: 0x2 linked
// Checksum 0xcead101f, Offset: 0x2828
// Size: 0x16a
function function_51986fd2(weapon, means_of_death) {
    if (means_of_death == "MOD_DOT") {
        return #"hash_659e542bc102c218";
    }
    w_root = zm_weapons::function_386dacbc(weapon);
    switch (w_root.name) {
    case #"ww_ieu_shockwave_t9_upgraded":
    case #"ww_ieu_shockwave_t9":
        return #"hash_e5fddce96190022";
    case #"ww_ieu_acid_t9_upgraded":
    case #"ww_ieu_acid_t9":
        return #"hash_40ca16d063cdb34f";
    case #"ww_ieu_electric_t9_upgraded":
    case #"ww_ieu_electric_t9":
        return #"hash_1262748e23d5dff8";
    case #"ww_ieu_gas_t9_upgraded":
    case #"ww_ieu_gas_t9":
        return #"hash_37ca44613f9ed8bc";
    case #"ww_ieu_plasma_t9_upgraded":
    case #"ww_ieu_plasma_t9":
        return #"hash_a40f7d48ac714db";
    }
    return #"";
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 2, eflags: 0x2 linked
// Checksum 0x8c6392b4, Offset: 0x29a0
// Size: 0x134
function function_3f1cb8ec(weapon, means_of_death) {
    if (means_of_death == "MOD_DOT") {
        return 0.5;
    }
    w_root = zm_weapons::function_386dacbc(weapon);
    switch (w_root.name) {
    case #"ww_ieu_shockwave_t9_upgraded":
    case #"ww_ieu_shockwave_t9":
        return 0;
    case #"ww_ieu_acid_t9_upgraded":
    case #"ww_ieu_acid_t9":
        return 5;
    case #"ww_ieu_electric_t9_upgraded":
    case #"ww_ieu_electric_t9":
        return 0;
    case #"ww_ieu_gas_t9_upgraded":
    case #"ww_ieu_gas_t9":
        return 0;
    case #"ww_ieu_plasma_t9_upgraded":
    case #"ww_ieu_plasma_t9":
        return 0;
    }
    return 0;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xa4560c9a, Offset: 0x2ae0
// Size: 0x25e
function function_33fb41f6(params) {
    player = params.eattacker;
    if (!isplayer(player) || params.idamage == 0) {
        return;
    }
    if (!isalive(self)) {
        return;
    }
    if (function_5fef4201(params.weapon)) {
        function_4adc16f(params);
        if (function_760c0d2d(params.weapon, params.smeansofdeath) && isdefined(self.var_6f84b820)) {
            switch (self.var_6f84b820) {
            case #"normal":
                var_ab6fadb1 = 0;
                break;
            case #"special":
                var_ab6fadb1 = 0;
                break;
            case #"elite":
                var_ab6fadb1 = 0;
                break;
            case #"boss":
                var_ab6fadb1 = 0;
                break;
            default:
                var_ab6fadb1 = 0;
                break;
            }
            player function_96db9f3(params.weapon, var_ab6fadb1);
            return;
        }
        if (function_8fbb3409(params.weapon)) {
            if (!isdefined(self.var_423a9ef2)) {
                self callback::callback(#"hash_7f690ab86160d4f6");
                if (isactor(self) && self.var_6f84b820 !== #"boss") {
                    self clientfield::set("" + #"hash_48257c0dba76b140", 1);
                }
                self thread function_71c72692();
            }
            self.var_423a9ef2 = gettime();
        }
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0xc5389317, Offset: 0x2d48
// Size: 0xce
function function_71c72692() {
    if (isvehicle(self)) {
        return;
    }
    self endon(#"death");
    var_e6d88abc = float(5) / 2;
    while (true) {
        wait(var_e6d88abc);
        if (gettime() - self.var_423a9ef2 > int(var_e6d88abc * 1000)) {
            self clientfield::set("" + #"hash_48257c0dba76b140", 0);
            self.var_423a9ef2 = undefined;
            break;
        }
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x63adcbb5, Offset: 0x2e20
// Size: 0x10c
function function_4adc16f(params) {
    var_bdbde2d2 = function_51986fd2(params.weapon, params.smeansofdeath);
    var_11c67a51 = function_3f1cb8ec(params.weapon, params.smeansofdeath);
    if (var_bdbde2d2 == #"" || var_11c67a51 == 0) {
        return;
    }
    if (var_bdbde2d2 == #"hash_659e542bc102c218" && isdefined(self.archetype) && self.archetype != #"hash_7c0d83ac1e845ac2") {
        return;
    }
    self thread namespace_9ff9f642::slowdown(var_bdbde2d2);
    if (isdefined(self.var_b077b73d)) {
        self thread [[ self.var_b077b73d ]](var_11c67a51);
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x9185be54, Offset: 0x2f38
// Size: 0x3b4
function function_d72b9d03(params) {
    if (params.smeansofdeath == "MOD_MELEE") {
        return;
    }
    if (function_760c0d2d(params.weapon, params.smeansofdeath)) {
        self.var_270befd2 = 1;
        player = params.eattacker;
        if (self function_ac1ff86e()) {
            self thread function_7e071045(player);
            self thread function_5a2447b1(1.2);
        }
        if (!isplayer(player) || !isalive(player)) {
            return;
        }
        if (isdefined(self.var_6f84b820)) {
            switch (self.var_6f84b820) {
            case #"normal":
                var_ab6fadb1 = 5;
                break;
            case #"special":
                var_ab6fadb1 = 15;
                break;
            case #"elite":
                var_ab6fadb1 = 30;
                break;
            case #"boss":
                var_ab6fadb1 = 100;
                break;
            default:
                var_ab6fadb1 = 0;
                break;
            }
            var_6ec34556 = player getweaponammoclipsize(params.weapon);
            var_ab6fadb1 = int(var_6ec34556 * var_ab6fadb1 / 100);
            player function_96db9f3(params.weapon, var_ab6fadb1);
        }
        return;
    }
    if (function_7c292369(params.weapon)) {
        self.var_ebd66e27 = 1;
        self function_f2262f33(params);
        if (self function_ac1ff86e()) {
            self clientfield::set("" + #"hash_77e641a4db48ad0f", 2);
            self thread function_5a2447b1(2.2);
        }
        return;
    }
    if (function_8fbb3409(params.weapon)) {
        self thread function_fb58c072(params);
        return;
    }
    if (function_f1c015e1(params.weapon)) {
        self thread function_c9ccbd54();
        return;
    }
    if (function_f17bb85a(params.weapon)) {
        if (self function_ac1ff86e()) {
            self clientfield::set("" + #"hash_77e641a4db48ad0f", 1);
            self thread function_5a2447b1(1.2);
        }
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xaec26c99, Offset: 0x32f8
// Size: 0x94
function function_5a2447b1(time) {
    result = self waittilltimeout(time, #"actor_corpse", #"death");
    waittillframeend();
    if (isdefined(result.corpse)) {
        result.corpse deletedelay();
        return;
    }
    if (isdefined(self)) {
        self deletedelay();
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0xbe0a329f, Offset: 0x3398
// Size: 0xb8
function function_ac1ff86e() {
    if (!isdefined(level.var_1a4cc228[self.aitype])) {
        return false;
    }
    self function_f9b43587();
    entitynum = self getentitynumber();
    var_6f4262ed = level.var_1a4cc228[self.aitype];
    self setmodel(var_6f4262ed[entitynum % var_6f4262ed.size]);
    if (isdefined(self.gib_state)) {
        gibserverutils::function_96bedd91(self);
    }
    return true;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xf1f6a6eb, Offset: 0x3458
// Size: 0x3de
function function_13da7675(var_75bb3d80) {
    targets = [];
    view_pos = self getweaponmuzzlepoint();
    forward_view_angles = self getweaponforwarddir();
    var_4e75811e = var_75bb3d80 ? 3 : 2;
    a_targets = getentitiesinradius(view_pos, 400, 15);
    a_targets = arraycombine(a_targets, zm_utility::function_d34f6296(self.origin, 400), 0, 0);
    if (!isdefined(a_targets)) {
        return;
    }
    a_targets = arraysortclosest(a_targets, view_pos);
    end_pos = view_pos + vectorscale(forward_view_angles, 400);
    /#
        if (2 == getdvarint(#"hash_528e35e5faa6eb75", 0)) {
            near_circle_pos = view_pos + vectorscale(forward_view_angles, 2);
            line(near_circle_pos, end_pos, (0, 0, 1), 1, 0, 100);
            sphericalcone(view_pos, view_pos + forward_view_angles * 400, 30, 20, (1, 0, 0), 0.5, 0, 100);
        }
    #/
    foreach (ai in a_targets) {
        target = spawnstruct();
        if (!isdefined(ai) || ai getteam() !== level.zombie_team && isactor(ai) || !isalive(ai)) {
            continue;
        }
        test_origin = ai getcentroid();
        test_range_squared = distancesquared(view_pos, test_origin);
        var_a931ea0a = 160000;
        if (test_range_squared > var_a931ea0a) {
            /#
                ai function_77d36cb8("<unknown string>", (1, 0, 0));
            #/
            break;
        }
        if (function_bd61e5e5(ai, view_pos, forward_view_angles)) {
            target.ai = ai;
            target.distance = distance2d(view_pos, test_origin);
            if (!isdefined(targets)) {
                targets = [];
            } else if (!isarray(targets)) {
                targets = array(targets);
            }
            targets[targets.size] = target;
        }
        if (targets.size >= var_4e75811e) {
            break;
        }
    }
    return targets;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 2, eflags: 0x2 linked
// Checksum 0x8fdd6f7b, Offset: 0x3840
// Size: 0x3cc
function function_427f113c(weapon, var_242262dc = 1) {
    self notify(#"hash_3271846e2b85db1c");
    self endon(#"death", #"hash_3271846e2b85db1c");
    while (self throwbuttonpressed()) {
        view_pos = self getweaponmuzzlepoint();
        forward_view_angles = self getweaponforwarddir();
        var_6a77cda0 = getentarray("trigger_damage", "classname");
        arrayremovevalue(var_6a77cda0, undefined);
        if (!var_6a77cda0.size) {
            return;
        }
        var_6a77cda0 = arraysortclosest(var_6a77cda0, view_pos, undefined, undefined, 400);
        var_df3c0672 = [];
        foreach (trigger in var_6a77cda0) {
            if (function_bd61e5e5(trigger, view_pos, forward_view_angles)) {
                var_1c3abda3 = distance2d(trigger.origin, view_pos);
                trigger notify(#"damage", {#attacker:self, #weapon:weapon, #amount:function_a712364b(var_1c3abda3, trigger) * var_242262dc, #var_98e101b0:1});
                if (isdefined(trigger.var_22cea3da)) {
                    if (!isdefined(var_df3c0672)) {
                        var_df3c0672 = [];
                    } else if (!isarray(var_df3c0672)) {
                        var_df3c0672 = array(var_df3c0672);
                    }
                    if (!isinarray(var_df3c0672, trigger)) {
                        var_df3c0672[var_df3c0672.size] = trigger;
                    }
                }
            }
        }
        foreach (trigger in var_df3c0672) {
            /#
                function_64cd8a8f("<unknown string>" + trigger getentitynumber());
            #/
            if (!isdefined(trigger.var_42859232)) {
                trigger.var_42859232 = [];
            }
            if (!isdefined(trigger.var_42859232[self getentitynumber()])) {
                trigger.var_42859232[self getentitynumber()] = gettime();
                self thread function_c8f96d23(trigger);
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x8d0e4868, Offset: 0x3c18
// Size: 0x23c
function function_c8f96d23(trigger) {
    self endon(#"death");
    trigger endon(#"death");
    if (isdefined(trigger.var_37d2c8f6)) {
        trigger [[ trigger.var_37d2c8f6 ]](self, trigger.var_42859232[self getentitynumber()]);
    }
    while (true) {
        view_pos = self getweaponmuzzlepoint();
        forward_view_angles = self getweaponforwarddir();
        if (!isdefined(trigger) || !isdefined(trigger.var_22cea3da)) {
            break;
        }
        if (distance(trigger.origin, view_pos) > 400 || !function_bd61e5e5(trigger, view_pos, forward_view_angles) || !self throwbuttonpressed() || !function_5fef4201(self getcurrentweapon())) {
            break;
        }
        /#
            function_64cd8a8f(gettime() - trigger.var_42859232[self getentitynumber()] + "<unknown string>" + trigger getentitynumber());
        #/
        trigger [[ trigger.var_22cea3da ]](self, gettime() - trigger.var_42859232[self getentitynumber()]);
        waitframe(1);
    }
    if (isdefined(trigger.var_4ffc53f)) {
        trigger [[ trigger.var_4ffc53f ]](self);
    }
    trigger.var_42859232[self getentitynumber()] = undefined;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 3, eflags: 0x2 linked
// Checksum 0x8e600aef, Offset: 0x3e60
// Size: 0x10c
function function_bd61e5e5(target, view_pos, forward_view_angles) {
    test_origin = target getcentroid();
    normal = vectornormalize(test_origin - view_pos);
    dot = vectordot(forward_view_angles, normal);
    if (0 > dot) {
        /#
            target function_77d36cb8("<unknown string>", (1, 0, 0));
        #/
        return false;
    }
    if (0 == target damageconetrace(view_pos, self, forward_view_angles, 30)) {
        /#
            target function_77d36cb8("<unknown string>", (1, 0, 0));
        #/
        return false;
    }
    return true;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 2, eflags: 0x2 linked
// Checksum 0xee2d3afa, Offset: 0x3f78
// Size: 0x186
function function_a712364b(distance, victim) {
    var_24c9e588 = 200;
    if (isdefined(victim.var_6f84b820)) {
        switch (victim.var_6f84b820) {
        case #"normal":
            var_db379d0e = 0.13;
            break;
        case #"special":
            var_db379d0e = 0.05;
            break;
        case #"elite":
            var_db379d0e = 0.02;
            break;
        case #"boss":
            var_db379d0e = 0.01;
            break;
        default:
            var_db379d0e = undefined;
            break;
        }
        if (isdefined(var_db379d0e)) {
            var_24c9e588 = max(var_24c9e588, int(victim.maxhealth * var_db379d0e));
        }
    }
    var_75fe9465 = var_24c9e588 * 0.5;
    if (distance > 250) {
        return int(var_75fe9465 + (var_24c9e588 - var_75fe9465) * (400 - distance) / 150);
    }
    return var_24c9e588;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0xeb1086be, Offset: 0x4108
// Size: 0xc8
function function_e2ac951d() {
    self.var_7ddf110e = [];
    self waittill(#"death", #"hash_30694ebb96507aa4", #"disconnect");
    foreach (ai in self.var_7ddf110e) {
        ai function_da9c3239(self);
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xfa32c9fd, Offset: 0x41d8
// Size: 0x6c
function function_6dd73f34(player) {
    if (!isdefined(self.var_335a665c)) {
        self.var_335a665c = [];
    }
    if (self.var_335a665c.size == 0) {
        self thread function_13acb37c();
    }
    array::add(self.var_335a665c, player, 0);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xbcc6108f, Offset: 0x4250
// Size: 0x56
function function_da9c3239(player) {
    if (!isdefined(self.var_335a665c)) {
        return;
    }
    arrayremovevalue(self.var_335a665c, player);
    if (self.var_335a665c.size == 0) {
        self notify(#"hash_384ffc276b7de7");
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0xf169d9e2, Offset: 0x42b0
// Size: 0x94
function function_13acb37c() {
    self clientfield::set("" + #"hash_7e9eb1c31cf618f0", 1);
    self waittill(#"death", #"hash_384ffc276b7de7");
    self.var_335a665c = [];
    self clientfield::set("" + #"hash_7e9eb1c31cf618f0", 0);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 2, eflags: 0x2 linked
// Checksum 0x2b018d93, Offset: 0x4350
// Size: 0x60e
function function_f0c18475(weapon, var_d3c8f6cd = 1) {
    self notify(#"hash_30694ebb96507aa4");
    self endon(#"death", #"hash_30694ebb96507aa4");
    self function_42402593(1);
    self thread function_e2ac951d();
    if (isdefined(self.var_172600a6)) {
        var_6a6a3262 = self.var_172600a6 + 333;
        current_time = gettime();
        if (var_6a6a3262 > current_time) {
            wait((var_6a6a3262 - current_time) / 1000);
        }
    }
    current_weapon = self getcurrentweapon();
    var_75bb3d80 = 0;
    while (self throwbuttonpressed() && function_5fef4201(current_weapon) && self getweaponammoclip(current_weapon) < self getweaponammoclipsize(current_weapon)) {
        var_75bb3d80 = function_7d5e7c71(current_weapon);
        targets = self function_13da7675(var_75bb3d80);
        count = 0;
        var_a11964c = [];
        foreach (target in targets) {
            if (isalive(target.ai)) {
                if (isactor(target.ai)) {
                    target.ai function_6dd73f34(self);
                    var_a11964c[var_a11964c.size] = target.ai;
                    damage_location = target.ai.origin + vectornormalize(self.origin - target.ai.origin) * 10 + (0, 0, 60);
                    target.ai dodamage(function_a712364b(target.distance, target.ai) * var_d3c8f6cd, damage_location, self, undefined, "none", "MOD_DOT", 0, weapon);
                    target.ai thread function_6dbf1bb3(self, 2);
                } else {
                    damage_location = target.ai.origin + vectornormalize(self.origin - target.ai.origin) * 10 + (0, 0, 60);
                    target.ai dodamage(function_a712364b(target.distance, target.ai) * var_d3c8f6cd, damage_location, self, undefined, "none", "MOD_DOT", 0, weapon);
                }
                count += 1;
            }
        }
        foreach (ai in self.var_7ddf110e) {
            if (!isinarray(var_a11964c, ai)) {
                ai function_da9c3239(self);
            }
        }
        self function_42402593(math::clamp(1 + count, 1, 7));
        self.var_7ddf110e = var_a11964c;
        self.var_172600a6 = gettime();
        wait(0.333);
        current_weapon = self getcurrentweapon();
    }
    self val::reset(#"hash_38d5012e2e2ee1d3", "disable_weapon_fire");
    if (function_5fef4201(self getcurrentweapon())) {
        self val::set(#"hash_1b614432d036c713", "allow_ads", 0);
    }
    self function_a0a2d8ee(0);
    self function_42402593(0);
    self notify(#"hash_30694ebb96507aa4");
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0x5fa574a4, Offset: 0x4968
// Size: 0x1c
function on_vehicle_enter() {
    self thread function_71b3af73();
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0xf456d3e, Offset: 0x4990
// Size: 0x18e
function function_71b3af73() {
    self notify("5c66fef944a78307");
    self endon("5c66fef944a78307");
    self endon(#"death");
    while (true) {
        if (self isinvehicle()) {
            vehicle = self getvehicleoccupied();
            seatindex = vehicle getoccupantseat(self);
            if (isdefined(vehicle.var_260e3593) && seatindex === vehicle.var_260e3593) {
                self.var_f5ddf859 = 1;
            } else if (is_true(self.var_f5ddf859)) {
                self val::reset(#"hash_38d5012e2e2ee1d3", "disable_weapon_fire");
                self val::reset(#"hash_1b614432d036c713", "allow_ads");
                self function_a0a2d8ee(0);
                self function_42402593(0);
                self notify(#"hash_30694ebb96507aa4");
                self notify(#"hash_3271846e2b85db1c");
                self.var_f5ddf859 = undefined;
            }
        } else {
            return;
        }
        waitframe(1);
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0x6f6163a5, Offset: 0x4b28
// Size: 0x106
function function_4f7dc212() {
    self endon(#"death", #"hash_30694ebb96507aa4", #"hash_3271846e2b85db1c");
    level endon(#"end_game");
    self waittill(#"weapon_switch_started");
    self val::reset(#"hash_38d5012e2e2ee1d3", "disable_weapon_fire");
    self val::reset(#"hash_1b614432d036c713", "allow_ads");
    self function_a0a2d8ee(0);
    self function_42402593(0);
    self notify(#"hash_30694ebb96507aa4");
    self notify(#"hash_3271846e2b85db1c");
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xc4797901, Offset: 0x4c38
// Size: 0x1ac
function function_7e071045(player) {
    player endon(#"death", #"weapon_switch_started");
    self.skip_death_notetracks = 1;
    self.nodeathragdoll = 1;
    self.var_49fdad6a = 1;
    self clientfield::set("" + #"hash_77e641a4db48ad0f", 1);
    waittime = 0.5;
    self clientfield::set("" + #"hash_306339376ad218f0", 1);
    while (waittime > 0 && isdefined(self)) {
        if (!mayspawnentity()) {
            break;
        }
        self thread function_6dbf1bb3(player);
        if (randomint(10) > 5) {
            self thread function_6dbf1bb3(player);
        }
        waittime -= 0.05;
        wait(0.05);
    }
    wait(0.5);
    if (isplayer(player)) {
        player clientfield::increment("" + #"hash_392d4dd36fe37ce7");
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 3, eflags: 0x2 linked
// Checksum 0x85702609, Offset: 0x4df0
// Size: 0x224
function function_6dbf1bb3(player, var_77c89bbd = 1, start_pos = undefined) {
    level endon(#"end_game");
    if (!isdefined(start_pos)) {
        var_c848a436 = array("j_elbow_le", "j_elbow_ri", "j_shoulder_le", "j_shoulder_ri", "j_spine4", "j_head");
        if (self.archetype == #"zombie_dog") {
            var_c848a436 = array("j_spine2", "j_spine3", "j_spine4", "j_neck", "j_head");
        }
        tag = array::random(var_c848a436);
        start_pos = self gettagorigin(tag);
        if (!isdefined(start_pos)) {
            return;
        }
    }
    var_d58aca35 = spawn("script_model", start_pos);
    var_d58aca35 setmodel(#"tag_origin");
    var_d58aca35 linkto(player);
    var_d58aca35 clientfield::set("" + #"hash_4061bf5adf6ebd2", var_77c89bbd);
    wait(2);
    var_d58aca35 clientfield::set("" + #"hash_4061bf5adf6ebd2", 0);
    wait(0.5);
    var_d58aca35 delete();
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 2, eflags: 0x2 linked
// Checksum 0x6e8dd81f, Offset: 0x5020
// Size: 0x230
function function_96db9f3(weapon, delta) {
    var_ac1c1bdc = self getweaponammoclip(weapon) + delta;
    max_ammo = self getweaponammoclipsize(weapon);
    if (var_ac1c1bdc < 0) {
        var_ac1c1bdc = 0;
    } else if (var_ac1c1bdc > max_ammo) {
        var_ac1c1bdc = max_ammo;
    }
    if (var_ac1c1bdc >= max_ammo) {
        self val::set(#"hash_1b614432d036c713", "allow_ads", 0);
        self val::reset(#"hash_38d5012e2e2ee1d3", "disable_weapon_fire");
        self notify(#"hash_30694ebb96507aa4");
        self notify(#"hash_3271846e2b85db1c");
        self function_a0a2d8ee(0);
        self function_42402593(0);
    }
    self setweaponammoclip(weapon, var_ac1c1bdc);
    if (function_f1c015e1(weapon)) {
        var_f6cb1ce6 = int(var_ac1c1bdc / max_ammo * 8);
        if (self.var_343d2604 !== var_f6cb1ce6) {
            self.var_343d2604 = var_f6cb1ce6;
            self function_53e5275c(var_f6cb1ce6);
        }
    } else if (function_f17bb85a(weapon)) {
        var_8e1667b6 = var_ac1c1bdc < 0 ? 0 : 1;
        if (self.var_8e1667b6 !== var_8e1667b6) {
            self.var_8e1667b6 = var_8e1667b6;
            self function_de1f133e(var_8e1667b6);
        }
    }
    return var_ac1c1bdc;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x84e23919, Offset: 0x5258
// Size: 0x74
function function_a0a2d8ee(turnon) {
    if (turnon) {
        self clientfield::set("" + #"hash_7c865b5dcfbe46c0", 1);
        return;
    }
    self clientfield::set("" + #"hash_7c865b5dcfbe46c0", 0);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x885f7b0, Offset: 0x52d8
// Size: 0x34
function function_42402593(value) {
    self clientfield::set("" + #"hash_40635c43f5d87929", value);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xf1584734, Offset: 0x5318
// Size: 0x22
function function_d48a01a5(watcher) {
    watcher.onspawn = &function_cdb97cd1;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 2, eflags: 0x2 linked
// Checksum 0xaab1cab2, Offset: 0x5348
// Size: 0xa4
function function_cdb97cd1(*watcher, player) {
    if (isdefined(player)) {
        var_deaac196 = player getcurrentweapon();
        var_d3c8f6cd = player function_c3b3603d(var_deaac196, 0);
        self clientfield::set("" + #"hash_685e6cfaf658518e", 1);
        self thread function_8811e4ff(player, var_d3c8f6cd);
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 2, eflags: 0x2 linked
// Checksum 0xe7c3c084, Offset: 0x53f8
// Size: 0x42c
function function_8811e4ff(owner, var_d3c8f6cd = 1) {
    self endon(#"death");
    ai_damaged = [];
    var_ef1d7300 = [];
    while (true) {
        var_98c4a170 = 0;
        a_targets = getentitiesinradius(self.origin, 150, 15);
        a_targets = arraycombine(a_targets, getentitiesinradius(self.origin, 150, 12));
        a_targets = arraycombine(a_targets, zm_utility::function_d34f6296(self.origin, 150), 0, 0);
        foreach (ai in a_targets) {
            if (!isalive(ai) || ai getteam() !== level.zombie_team && (isactor(ai) || isvehicle(ai)) || isinarray(ai_damaged, ai)) {
                continue;
            }
            ai dodamage(15000 * var_d3c8f6cd, self.origin, owner, undefined, undefined, "MOD_PROJECTILE", 0, level.var_652bc5ed);
            if (!isdefined(ai_damaged)) {
                ai_damaged = [];
            } else if (!isarray(ai_damaged)) {
                ai_damaged = array(ai_damaged);
            }
            ai_damaged[ai_damaged.size] = ai;
            var_98c4a170++;
            if (var_98c4a170 >= 3) {
                break;
            }
        }
        var_6a77cda0 = getentarray("trigger_damage", "classname");
        arrayremovevalue(var_6a77cda0, undefined);
        var_6a77cda0 = arraysortclosest(var_6a77cda0, self.origin, undefined, undefined, 80);
        foreach (trigger in var_6a77cda0) {
            if (isinarray(var_ef1d7300, trigger)) {
                continue;
            }
            trigger notify(#"damage", {#attacker:owner, #weapon:level.var_652bc5ed});
            if (!isdefined(var_ef1d7300)) {
                var_ef1d7300 = [];
            } else if (!isarray(var_ef1d7300)) {
                var_ef1d7300 = array(var_ef1d7300);
            }
            var_ef1d7300[var_ef1d7300.size] = trigger;
        }
        wait(0.1);
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xdbe6d139, Offset: 0x5830
// Size: 0x15c
function function_f2262f33(params) {
    if (params.smeansofdeath !== "MOD_PROJECTILE") {
        return 0;
    }
    if (!isactor(self)) {
        return 0;
    }
    if (level.var_9ea358cc >= 8) {
        return 0;
    }
    if (self.health <= params.idamage) {
        v_z_offset = (0, 0, randomfloatrange(0.6, 1)) * randomintrange(150, 300);
        v_launch = vectornormalize(params.vdir) * randomintrange(100, 175) + v_z_offset;
        self zm_utility::start_ragdoll(1);
        zm_utility::function_ffc279(v_launch, params.eattacker, self.health, level.var_652bc5ed);
        self thread function_1475944a();
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 13, eflags: 0x2 linked
// Checksum 0x4e285da7, Offset: 0x5998
// Size: 0xf6
function function_ca6c6727(*einflictor, eattacker, idamage, *flags, meansofdeath, weapon, *var_fd90b0bb, *vpoint, *vdir, *shitloc, *psoffsettime, *boneindex, *surfacetype) {
    if (!isalive(self)) {
        return 0;
    }
    var_d3c8f6cd = 1;
    if (isplayer(shitloc)) {
        if (!(isdefined(boneindex) && boneindex == "MOD_DOT")) {
            var_d3c8f6cd = shitloc function_c3b3603d(surfacetype, 0);
        }
    }
    return psoffsettime * var_d3c8f6cd;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0x2bc9de22, Offset: 0x5a98
// Size: 0x1c
function function_21b7e322() {
    self zombie_eye_glow::function_95cae3e3();
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xfc6f515, Offset: 0x5ac0
// Size: 0x6e
function function_fb58c072(params) {
    if (self.archetype === #"zombie_dog") {
        self function_21b7e322();
        return;
    }
    self.freezegun_death = 1;
    self.skip_death_notetracks = 1;
    self.nodeathragdoll = 1;
    self.var_39184114 = params;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0xbd80b80e, Offset: 0x5b38
// Size: 0x254
function function_caac60f2() {
    if (is_true(self.var_49fdad6a)) {
        return;
    }
    self.var_5fe6212f = 1;
    if (!(getdvarint(#"splitscreen_playercount", 1) > 2)) {
        self thread function_4942e7b9();
        self thread function_f94aa073();
    }
    shatter_trigger = spawn("trigger_damage", self.origin, 0, 15, 72);
    flag = function_27f2ef17(shatter_trigger);
    function_4e3bb793(shatter_trigger, flag & ~512);
    shatter_trigger.var_af6e27ba = 0;
    shatter_trigger enablelinkto();
    shatter_trigger linkto(self);
    shatter_trigger thread function_e31780b1();
    shatter_trigger thread function_ff9195ba();
    spawnflags = 512 | 1 | 512 | 2 | 512 | 4 | 16;
    crumple_trigger = spawn("trigger_radius", self.origin, spawnflags, 0, 0);
    crumple_trigger enablelinkto();
    crumple_trigger linkto(self);
    crumple_trigger thread function_e31780b1();
    self thread function_ee76afdc(self.var_39184114, shatter_trigger, crumple_trigger);
    self thread function_2e74e3c2(self.var_39184114, shatter_trigger, crumple_trigger);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0xf15c476c, Offset: 0x5d98
// Size: 0x46
function function_ff9195ba() {
    level endon(#"end_game");
    self endon(#"death");
    wait(0.25);
    self.var_9591a331 = 1;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0xc240a07e, Offset: 0x5de8
// Size: 0x124
function function_301812b0() {
    if (!is_true(self.freezegun_death)) {
        return;
    }
    if (is_true(self.var_49fdad6a)) {
        return;
    }
    if (is_true(self.var_da9b93fa)) {
        return;
    }
    if (isdefined(self.shatter_trigger) && isdefined(self.crumple_trigger)) {
        self function_1a915299(self.var_39184114, self.shatter_trigger, self.crumple_trigger);
        return;
    }
    if (isdefined(self)) {
        if (!(getdvarint(#"splitscreen_playercount", 1) > 2)) {
            self function_97bcf56f();
            self function_8af9f027();
        }
        self zm_utility::start_ragdoll();
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0x3b56e1d, Offset: 0x5f18
// Size: 0x54
function function_e31780b1() {
    level endon(#"end_game");
    self endon(#"death");
    wait(10);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 3, eflags: 0x2 linked
// Checksum 0xc498c9b1, Offset: 0x5f78
// Size: 0x1a8
function function_ee76afdc(params, shatter_trigger, crumple_trigger) {
    shatter_trigger endon(#"death", #"hash_4b43502d3b6d5a0");
    self endon(#"death");
    wait(0.1);
    orig_attacker = params.eattacker;
    while (true) {
        s_notify = shatter_trigger waittill(#"damage");
        if (!is_true(shatter_trigger.var_9591a331) && function_8fbb3409(s_notify.weapon) && !is_true(s_notify.var_98e101b0)) {
            continue;
        }
        if (isdefined(s_notify.amount)) {
            shatter_trigger.var_af6e27ba += s_notify.amount;
            if (shatter_trigger.var_af6e27ba >= 100) {
                if (!is_true(s_notify.var_98e101b0)) {
                    self thread function_1a915299(params, shatter_trigger, crumple_trigger);
                    continue;
                }
                self thread function_b439fd9b(params, shatter_trigger, crumple_trigger);
            }
        }
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 3, eflags: 0x2 linked
// Checksum 0x7f4abb65, Offset: 0x6128
// Size: 0x8c
function function_2e74e3c2(params, shatter_trigger, crumple_trigger) {
    crumple_trigger endon(#"death", #"hash_4b43502d3b6d5a0");
    self endon(#"death");
    wait(0.75);
    crumple_trigger waittill(#"trigger");
    self thread function_1a915299(params, shatter_trigger, crumple_trigger);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 3, eflags: 0x2 linked
// Checksum 0xc8463e65, Offset: 0x61c0
// Size: 0xb4
function function_1a915299(*params, shatter_trigger, crumple_trigger) {
    /#
        self function_77d36cb8("<unknown string>");
    #/
    self thread function_60a1b1de(shatter_trigger, crumple_trigger);
    self zombie_eye_glow::function_95cae3e3();
    self function_ae87eaf();
    self function_7a835127();
    self thread function_5a2447b1(1);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 3, eflags: 0x2 linked
// Checksum 0x681907e9, Offset: 0x6280
// Size: 0xcc
function function_b439fd9b(params, shatter_trigger, crumple_trigger) {
    /#
        self function_77d36cb8("<unknown string>");
    #/
    self thread function_60a1b1de(shatter_trigger, crumple_trigger);
    self thread function_88d1f10d(params);
    self zombie_eye_glow::function_95cae3e3();
    self function_2a7980e();
    self function_7a835127();
    self thread function_5a2447b1(1);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0x5d851aed, Offset: 0x6358
// Size: 0xe4
function function_7a835127() {
    if (is_true(self.no_gib)) {
        return;
    }
    if (!gibserverutils::isgibbed(self, 128)) {
        gibserverutils::gibrightleg(self, 0);
    }
    if (!gibserverutils::isgibbed(self, 256)) {
        gibserverutils::gibleftleg(self, 0);
    }
    if (!gibserverutils::isgibbed(self, 16)) {
        gibserverutils::gibrightarm(self, 0);
    }
    if (!gibserverutils::isgibbed(self, 32)) {
        gibserverutils::gibleftarm(self, 0);
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x154202f6, Offset: 0x6448
// Size: 0x260
function function_88d1f10d(params) {
    level endon(#"end_game");
    centroid = self getcentroid();
    a_targets = getentitiesinradius(centroid, 64, 15);
    foreach (ai in a_targets) {
        if (!isdefined(ai) || ai.archetype !== #"zombie" && ai.archetype !== #"zombie_dog" && ai.archetype !== #"nova_crawler" || ai getteam() !== level.zombie_team) {
            continue;
        }
        n_damage = 10000;
        if (isentity(ai) && isalive(ai)) {
            if (isdefined(ai.maxhealth) && ai.maxhealth > 10000) {
                n_damage = ai.maxhealth;
            }
            ai dodamage(n_damage, ai.origin, params.eattacker, undefined, undefined, "MOD_EXPLOSIVE", 0, undefined);
            continue;
        }
        if (isdefined(ai.shatter_trigger)) {
            ai.shatter_trigger dodamage(10000, ai.origin, params.eattacker, undefined, undefined, "MOD_EXPLOSIVE");
        }
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 2, eflags: 0x2 linked
// Checksum 0xc67548d9, Offset: 0x66b0
// Size: 0xb4
function function_60a1b1de(shatter_trigger, crumple_trigger) {
    self endon(#"death");
    self.var_da9b93fa = 1;
    self notify(#"hash_4b43502d3b6d5a0");
    shatter_trigger notify(#"hash_4b43502d3b6d5a0");
    crumple_trigger notify(#"hash_4b43502d3b6d5a0");
    wait(1);
    if (isdefined(shatter_trigger)) {
        shatter_trigger delete();
    }
    if (isdefined(crumple_trigger)) {
        crumple_trigger delete();
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0xe269718, Offset: 0x6770
// Size: 0x4c
function function_4942e7b9() {
    if (isvehicle(self)) {
        return;
    }
    self clientfield::set("" + #"hash_3a35110e6ccc5486", 1);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0xc3783955, Offset: 0x67c8
// Size: 0x4c
function function_97bcf56f() {
    if (isvehicle(self)) {
        return;
    }
    self clientfield::set("" + #"hash_3a35110e6ccc5486", 0);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0x81b1965e, Offset: 0x6820
// Size: 0x4c
function function_f94aa073() {
    if (isvehicle(self)) {
        return;
    }
    self clientfield::set("" + #"hash_1709a7bbfac5e1e0", 1);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0x529d5a66, Offset: 0x6878
// Size: 0x4c
function function_8af9f027() {
    if (isvehicle(self)) {
        return;
    }
    self clientfield::set("" + #"hash_1709a7bbfac5e1e0", 0);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0x236dfbaa, Offset: 0x68d0
// Size: 0x4c
function function_ae87eaf() {
    if (isvehicle(self)) {
        return;
    }
    self clientfield::set("" + #"hash_6dca42b5563953ef", 1);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0x98711fa7, Offset: 0x6928
// Size: 0x4c
function function_2a7980e() {
    if (isvehicle(self)) {
        return;
    }
    self clientfield::set("" + #"hash_2a7b72235f0b387e", 1);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xa4af9315, Offset: 0x6980
// Size: 0x22
function function_47c38bc8(watcher) {
    watcher.onspawn = &function_4af61eed;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 2, eflags: 0x2 linked
// Checksum 0x98082030, Offset: 0x69b0
// Size: 0xac
function function_4af61eed(*watcher, player) {
    player endon(#"death");
    level endon(#"end_game");
    self.var_d3c8f6cd = 1;
    if (isdefined(player)) {
        var_deaac196 = player getcurrentweapon();
        self.var_d3c8f6cd = player function_c3b3603d(var_deaac196, 0);
    }
    self thread function_6793b4dc(player);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xe7edb494, Offset: 0x6a68
// Size: 0xac
function function_6793b4dc(owner) {
    self endon(#"hash_3d4b5f79f21a96b0");
    self thread function_3bf9052d();
    waitresult = self waittill(#"projectile_impact_explode", #"explode");
    if (waitresult._notify == "projectile_impact_explode") {
        function_302616d5(owner, waitresult.position, waitresult.normal);
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0x1223218a, Offset: 0x6b20
// Size: 0x2e
function function_3bf9052d() {
    self waittill(#"death");
    waittillframeend();
    self notify(#"hash_3d4b5f79f21a96b0");
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 3, eflags: 0x2 linked
// Checksum 0xbd117e3b, Offset: 0x6b58
// Size: 0x10c
function function_302616d5(owner, position, normal) {
    dir_up = (0, 0, 1);
    ent = spawntimedfx(getweapon(#"hash_43f15ab903e2e35"), position, dir_up, int(10));
    if (isdefined(owner)) {
        ent setteam(owner.team);
        if (isplayer(owner)) {
            ent setowner(owner);
        }
    }
    thread function_f9ebf407(owner, position, normal, 70, int(gettime() + 10000));
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 5, eflags: 0x2 linked
// Checksum 0x228c420e, Offset: 0x6c70
// Size: 0x2d6
function function_f9ebf407(owner, position, *normal, radius, damageendtime) {
    level endon(#"end_game");
    radius = 10;
    var_d3c8f6cd = isdefined(self.var_d3c8f6cd) ? self.var_d3c8f6cd : 1;
    while (gettime() < damageendtime) {
        a_ai_targets = getentitiesinradius(normal, radius, 15);
        a_ai_targets = arraycombine(a_ai_targets, getentitiesinradius(normal, radius, 12));
        var_b063467a = zm_utility::function_d34f6296(normal, radius);
        all_targets = arraycombine(a_ai_targets, var_b063467a, 0, 0);
        foreach (target in all_targets) {
            if (isalive(target) && target getteam() == level.zombie_team || isinarray(var_b063467a, target)) {
                target dodamage(1500 * var_d3c8f6cd, target.origin, position, self, "none", "MOD_UNKNOWN", 0, getweapon(#"ww_ieu_gas_t9"));
                if (1500 < target.health && !is_true(target.var_65ebe4ec) && isactor(target)) {
                    target.var_65ebe4ec = 1;
                    target thread function_48c9861b(gettime());
                }
            }
        }
        wait(0.33);
        radius += 5;
        if (radius > 70) {
            radius = 70;
        }
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x6 linked
// Checksum 0xad1263a4, Offset: 0x6f50
// Size: 0xce
function private function_48c9861b(var_66284057) {
    level endon(#"end_game");
    self.var_ca98503 = var_66284057 + 0.4;
    function_74be4c3e(1);
    for (time_now = gettime(); time_now < self.var_ca98503; time_now = gettime()) {
        wait(self.var_ca98503 - time_now);
        if (!isdefined(self)) {
            return;
        }
    }
    if (isalive(self)) {
        function_41ac088f();
        self.var_65ebe4ec = 0;
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0x518ecaf9, Offset: 0x7028
// Size: 0x134
function function_c9ccbd54() {
    level endon(#"end_game");
    if (isvehicle(self)) {
        return;
    }
    if (self function_ac1ff86e()) {
        self clientfield::set("" + #"hash_77e641a4db48ad0f", 3);
        self thread function_5a2447b1(2);
        return;
    }
    function_74be4c3e(2);
    result = self waittill(#"actor_corpse");
    if (isdefined(result.corpse)) {
        result.corpse function_74be4c3e(2);
        wait(15);
        if (isdefined(result.corpse)) {
            result.corpse thread util::delayed_delete(0.5);
        }
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x115d372d, Offset: 0x7168
// Size: 0x8c
function function_c8adf16f(*weapon) {
    if (isint(self.var_343d2604)) {
        self.var_343d2604--;
    } else {
        self.var_343d2604 = 0;
    }
    if (self.var_343d2604 < 0) {
        self.var_343d2604 = 0;
    } else if (self.var_343d2604 > 8) {
        self.var_343d2604 = 8;
    }
    function_53e5275c(self.var_343d2604);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xf75a588a, Offset: 0x7200
// Size: 0x6c
function function_74be4c3e(stage) {
    if (isactor(self) || isactorcorpse(self)) {
        self clientfield::set("" + #"hash_97d03a2a0786ba6", stage);
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0x799728ec, Offset: 0x7278
// Size: 0x64
function function_41ac088f() {
    if (isactor(self) || isactorcorpse(self)) {
        self clientfield::set("" + #"hash_97d03a2a0786ba6", 0);
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x86eed576, Offset: 0x72e8
// Size: 0x34
function function_53e5275c(ammo_count) {
    self clientfield::set("" + #"hash_3c92af57fde1f8f7", ammo_count);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xce78bd6d, Offset: 0x7328
// Size: 0x22
function function_3c39516d(watcher) {
    watcher.onspawn = &function_83869cdb;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x2ce9a0fc, Offset: 0x7358
// Size: 0x5c
function function_d6ae76f5(weapon) {
    if (self getweaponammoclip(weapon) === 0 && self.var_8e1667b6 !== 0) {
        self.var_8e1667b6 = 0;
        self function_de1f133e(0);
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 2, eflags: 0x2 linked
// Checksum 0xc60f8fb8, Offset: 0x73c0
// Size: 0x7c
function function_83869cdb(*watcher, player) {
    self.var_d3c8f6cd = 1;
    if (isdefined(player)) {
        var_deaac196 = player getcurrentweapon();
        self.var_d3c8f6cd = player function_c3b3603d(var_deaac196, 0);
    }
    self thread function_615ff5e9(player);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x6aafe171, Offset: 0x7448
// Size: 0x176
function function_615ff5e9(owner) {
    self endon(#"death");
    while (true) {
        var_6a77cda0 = getentarray("trigger_damage", "classname");
        arrayremovevalue(var_6a77cda0, undefined);
        var_6a77cda0 = arraysortclosest(var_6a77cda0, self.origin, undefined, undefined, 100);
        foreach (trigger in var_6a77cda0) {
            if (self istouching(trigger, (10, 10, 10))) {
                trigger notify(#"damage", {#attacker:owner, #weapon:level.var_12b450dc});
            }
        }
        waitframe(1);
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 13, eflags: 0x2 linked
// Checksum 0xb483bc15, Offset: 0x75c8
// Size: 0x210
function function_fd195372(inflictor, attacker, damage, *flags, meansofdeath, *weapon, *var_fd90b0bb, *vpoint, *vdir, *shitloc, *psoffsettime, *boneindex, *surfacetype) {
    if (isdefined(shitloc) && shitloc != self && surfacetype != "MOD_DOT" && surfacetype != "MOD_MELEE") {
        var_d3c8f6cd = isdefined(shitloc.var_d3c8f6cd) ? shitloc.var_d3c8f6cd : 1;
        if (!isdefined(shitloc.var_4bc2bb56)) {
            shitloc.var_4bc2bb56 = 150000 * var_d3c8f6cd;
        }
        boneindex = min(self.health, shitloc.var_4bc2bb56);
        boneindex = min(boneindex, 50000 * var_d3c8f6cd);
        shitloc.var_4bc2bb56 -= boneindex;
        if (isplayer(psoffsettime)) {
            psoffsettime clientfield::increment("" + #"hash_492f4817c4296ddf");
        }
        if (shitloc.var_4bc2bb56 == 0) {
            shitloc deletedelay();
        }
        if (isactor(self)) {
            self clientfield::set("" + #"hash_380d2d329a41c90e", 1);
        }
    }
    return boneindex;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x144b2e21, Offset: 0x77e0
// Size: 0x34
function function_de1f133e(ammo_state) {
    self clientfield::set("" + #"hash_89386ef1bb99cdf", ammo_state);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 0, eflags: 0x2 linked
// Checksum 0x98284a79, Offset: 0x7820
// Size: 0x172
function function_efcce3c1() {
    level.var_284e25d2 = [];
    level.var_284e25d2[1] = spawnstruct();
    level.var_284e25d2[1].damage = 1000;
    level.var_284e25d2[1].var_dfd1c927 = 1;
    level.var_284e25d2[1].var_4a0c6d55 = 1000;
    level.var_284e25d2[2] = spawnstruct();
    level.var_284e25d2[2].damage = 3000;
    level.var_284e25d2[2].var_dfd1c927 = 2;
    level.var_284e25d2[2].var_4a0c6d55 = 2000;
    level.var_284e25d2[3] = spawnstruct();
    level.var_284e25d2[3].damage = 7500;
    level.var_284e25d2[3].var_dfd1c927 = 3;
    level.var_284e25d2[3].var_4a0c6d55 = undefined;
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x1182373c, Offset: 0x79a0
// Size: 0x1c4
function function_5a9a8abc(weapon) {
    if (!is_true(self.var_3f74bd46)) {
        self.var_3f74bd46 = 1;
        self.var_7c223de7 = gettime();
        self.var_9cb64422 = 0;
        self.var_c627b034 = 1;
        self clientfield::set("" + #"hash_2eb1021a0e4110d1", self.var_c627b034);
        thread function_4a074bb5(weapon);
        thread function_a8733e49(weapon);
    } else {
        time_now = gettime();
        self.var_9cb64422 += time_now - self.var_7c223de7;
        self.var_7c223de7 = time_now;
        if (isdefined(level.var_284e25d2[self.var_c627b034].var_4a0c6d55) && self.var_9cb64422 > level.var_284e25d2[self.var_c627b034].var_4a0c6d55) {
            self.var_c627b034 += 1;
            self clientfield::set("" + #"hash_2eb1021a0e4110d1", self.var_c627b034);
        }
    }
    self function_96db9f3(self getcurrentweapon(), level.var_284e25d2[self.var_c627b034].var_dfd1c927 * -1);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x6 linked
// Checksum 0x5a8b8633, Offset: 0x7b70
// Size: 0x1ba
function private get_closest_tag(v_pos) {
    if (!isdefined(level.gib_tags)) {
        zombie_utility::init_gib_tags();
    }
    tag_closest = undefined;
    var_9aabd9de = arraycopy(level.gib_tags);
    if (!isdefined(var_9aabd9de)) {
        var_9aabd9de = [];
    } else if (!isarray(var_9aabd9de)) {
        var_9aabd9de = array(var_9aabd9de);
    }
    if (!isinarray(var_9aabd9de, "j_head")) {
        var_9aabd9de[var_9aabd9de.size] = "j_head";
    }
    for (i = 0; i < var_9aabd9de.size; i++) {
        if (!isdefined(tag_closest)) {
            tag_closest = var_9aabd9de[i];
            continue;
        }
        var_abe265db = self gettagorigin(var_9aabd9de[i]);
        var_2cd7818f = self gettagorigin(tag_closest);
        if (!isdefined(var_abe265db) || !isdefined(var_2cd7818f)) {
            continue;
        }
        if (distancesquared(v_pos, var_abe265db) < distancesquared(v_pos, var_2cd7818f)) {
            tag_closest = var_9aabd9de[i];
        }
    }
    return tolower(tag_closest);
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 3, eflags: 0x2 linked
// Checksum 0x1fb3df9f, Offset: 0x7d38
// Size: 0x15c
function function_3a84d307(e_target, v_target_pos, weapon) {
    var_d3c8f6cd = self function_c3b3603d(weapon, 0);
    if (e_target.archetype === #"zombie") {
        str_hitloc = "torso_lower";
        str_tag = e_target get_closest_tag(v_target_pos);
        if (str_tag === "j_head") {
            str_hitloc = "head";
        }
    } else {
        str_hitloc = "head";
    }
    n_damage = 0;
    if (isdefined(level.var_284e25d2[self.var_c627b034].damage)) {
        n_damage = int(level.var_284e25d2[self.var_c627b034].damage);
    }
    if (isalive(e_target)) {
        e_target dodamage(n_damage * var_d3c8f6cd, v_target_pos, self, undefined, str_hitloc, "MOD_UNKNOWN", 0, weapon);
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x65e1443, Offset: 0x7ea0
// Size: 0x300
function function_4a074bb5(weapon) {
    self endon(#"death", #"stop_damage");
    while (true) {
        v_position = self getplayercamerapos();
        v_forward = anglestoforward(self getplayerangles());
        a_trace = beamtrace(v_position, v_position + v_forward * 1000, 1, self);
        var_1c218ece = a_trace[#"position"];
        if (isdefined(a_trace[#"entity"])) {
            e_last_target = a_trace[#"entity"];
            if ((isvehicle(e_last_target) && e_last_target getteam() === level.zombie_team || isdefined(e_last_target.var_6f84b820)) && e_last_target.team !== #"allies" || isinarray(zm_utility::function_d34f6296(), e_last_target)) {
                self thread function_3a84d307(e_last_target, var_1c218ece, weapon);
            }
            triggers = getentarray("trigger_damage", "classname");
            arrayremovevalue(triggers, undefined);
            triggers = arraysortclosest(triggers, self.origin, undefined, undefined, 1000);
            foreach (trigger in triggers) {
                if (istouching(var_1c218ece, trigger)) {
                    trigger notify(#"damage", {#attacker:self, #weapon:level.var_e0be56c0});
                }
            }
        }
        e_last_target = undefined;
        wait(0.1);
    }
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0xfce25eb2, Offset: 0x81a8
// Size: 0x10c
function function_a8733e49(weapon) {
    self endoncallback(&function_1f8640bc, #"death", #"weapon_change");
    level endon(#"end_game");
    while (zm_utility::is_player_valid(self, 0, 1) && self isfiring() && self getweaponammoclip(weapon) > level.var_284e25d2[self.var_c627b034].var_dfd1c927 + 3 && !self ismeleeing() && !self isswitchingweapons()) {
        waitframe(1);
    }
    function_1f8640bc();
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 1, eflags: 0x2 linked
// Checksum 0x286d6327, Offset: 0x82c0
// Size: 0x5e
function function_1f8640bc(*s_notify) {
    self.var_3f74bd46 = undefined;
    self.var_c627b034 = 1;
    self clientfield::set("" + #"hash_2eb1021a0e4110d1", 0);
    self notify(#"stop_damage");
}

// Namespace namespace_b376a999/namespace_b376a999
// Params 2, eflags: 0x2 linked
// Checksum 0xeb0e8f50, Offset: 0x8328
// Size: 0x336
function function_c3b3603d(weapon, var_98e101b0) {
    var_55687712 = self item_inventory::function_230ceec4(weapon);
    if (isdefined(var_55687712.paplv)) {
        if (is_true(var_98e101b0)) {
            switch (var_55687712.paplv) {
            case 1:
                return 1.05;
            case 2:
                return 1.1;
            case 3:
                return 1.15;
            }
        } else {
            switch (weapon.name) {
            case #"ww_ieu_shockwave_t9_upgraded":
                switch (var_55687712.paplv) {
                case 1:
                    return 1.5;
                case 2:
                    return 1.75;
                case 3:
                    return 2;
                }
                break;
            case #"ww_ieu_acid_t9_upgraded":
                switch (var_55687712.paplv) {
                case 1:
                    return 1.5;
                case 2:
                    return 1.75;
                case 3:
                    return 2;
                }
                break;
            case #"ww_ieu_plasma_t9_upgraded":
                switch (var_55687712.paplv) {
                case 1:
                    return 1.5;
                case 2:
                    return 1.75;
                case 3:
                    return 2;
                }
                break;
            case #"ww_ieu_gas_t9_upgraded":
                switch (var_55687712.paplv) {
                case 1:
                    return 2;
                case 2:
                    return 2.5;
                case 3:
                    return 3;
                }
                break;
            case #"ww_ieu_electric_t9_upgraded":
                switch (var_55687712.paplv) {
                case 1:
                    return 1.5;
                case 2:
                    return 1.75;
                case 3:
                    return 2;
                }
                break;
            }
        }
    }
    return 1;
}

/#

    // Namespace namespace_b376a999/namespace_b376a999
    // Params 2, eflags: 0x0
    // Checksum 0x7a376429, Offset: 0x8668
    // Size: 0x8c
    function function_77d36cb8(msg, color) {
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        if (!getdvarint(#"hash_528e35e5faa6eb75", 0)) {
            return;
        }
        print3d(self.origin + (0, 0, 60), msg, color, 1, 1, 40);
    }

    // Namespace namespace_b376a999/namespace_b376a999
    // Params 1, eflags: 0x0
    // Checksum 0xe446ca08, Offset: 0x8700
    // Size: 0x4c
    function function_64cd8a8f(string) {
        if (!getdvarint(#"hash_528e35e5faa6eb75", 0)) {
            return;
        }
        println(string);
    }

#/
