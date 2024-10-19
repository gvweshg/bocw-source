// Atian COD Tools GSC CW decompiler test
#using script_1dbd20131a363d8;
#using script_113dd7f0ea2a1d4f;
#using script_215d7818c548cb51;
#using script_12538a87a80a2978;
#using script_4163291d6e693552;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using scripts\zm_common\objective_manager.gsc;
#using script_27347f09888ad15;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using script_340a2e805e35f7a2;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\content_manager.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_24fd6413;

// Namespace namespace_24fd6413/level_init
// Params 1, eflags: 0x20
// Checksum 0x8bed4d67, Offset: 0x758
// Size: 0x284
function event_handler[level_init] main(*eventstruct) {
    clientfield::register("scriptmover", "" + #"hash_502be00d1af105e9", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_771abe419eda7442", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_76d1986dfad6a190", 1, 1, "counter");
    clientfield::register("scriptmover", "" + #"hash_11838968b17d8418", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_1043711497bf7a0b", 1, 1, "counter");
    clientfield::register("actor", "" + #"hash_5342c00e940ad12b", 1, 1, "int");
    clientfield::register("world", "" + #"hash_71f053fa597abb52", 1, 1, "int");
    callback::on_item_pickup(&function_a6ee18e5);
    level.sr_objective_secure_hud = sr_objective_secure_hud::register();
    objective_manager::register_script(#"secure", &init, &function_fb9dff2f, #"secure", #"hash_2764807c1ab1eabd", #"hash_bdf13864e52da12", 8, #"hash_582ab7cd393c5d47");
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x3d5c95ed, Offset: 0x9e8
// Size: 0x734
function init(instance) {
    instance.var_42dcbe3d = instance.contentgroups[#"hash_38e22f5ceb9065c"];
    instance.var_559503f1 = instance.contentgroups[#"spawn_pt"];
    if (isdefined(instance.contentgroups[#"base"][0])) {
        instance.mdl_base = content_manager::spawn_script_model(instance.contentgroups[#"base"][0], instance.contentgroups[#"base"][0].model, 1);
        if (isdefined(instance.mdl_base)) {
            instance.mdl_base setscale(1.55);
        }
    }
    foreach (model in instance.a_models) {
        if (model.model === #"hash_38cf6d433834d7c5") {
            instance.mdl_console = model;
        }
        if (model.model === #"hash_35683f67bd38dc11") {
            instance.var_2972bc14 = model;
        }
    }
    for (i = 0; i < instance.var_42dcbe3d.size; i++) {
        v_org = instance.var_42dcbe3d[i].origin;
        if (instance.var_42dcbe3d[i].script_int === 0) {
            v_offset = (0, 0, 1000);
        } else {
            v_offset = (0, 0, 0);
        }
        v_start = v_org;
        var_954ec1b6 = util::spawn_model(#"hash_91bd6c685ca0c64", v_start, instance.var_42dcbe3d[i].angles);
        var_954ec1b6.var_526e7ad6 = util::spawn_model(#"hash_2eb7d391abf00e32", v_start, instance.var_42dcbe3d[i].angles);
        var_954ec1b6.var_cef46557 = util::spawn_model(#"hash_18c5ca275bc790a1", v_start, instance.var_42dcbe3d[i].angles);
        instance.a_models[instance.a_models.size] = var_954ec1b6;
        var_954ec1b6 hide();
        var_954ec1b6.var_526e7ad6 hide();
        var_954ec1b6.var_cef46557 hide();
        var_954ec1b6 notsolid();
        var_954ec1b6.var_526e7ad6 notsolid();
        var_954ec1b6.var_cef46557 notsolid();
        var_954ec1b6.v_land = v_org;
        var_954ec1b6.var_cef46557.v_land = v_org;
        var_954ec1b6.n_id = instance.var_42dcbe3d[i].script_int;
        var_954ec1b6.targetname = "drop_pod";
        var_954ec1b6.var_559503f1 = [];
        var_954ec1b6.var_eff5bd11 = [];
        var_954ec1b6.n_active = 0;
        foreach (s_spawnpt in instance.var_559503f1) {
            if (s_spawnpt.script_int === var_954ec1b6.n_id) {
                var_954ec1b6.var_559503f1[var_954ec1b6.var_559503f1.size] = s_spawnpt;
            }
        }
        var_954ec1b6.n_total = 0;
        var_954ec1b6.n_kills = 0;
        var_954ec1b6 thread function_a55dd0a0(instance);
        var_954ec1b6 thread function_f919d221(instance);
        var_954ec1b6 thread function_b5a08eb6(instance);
        var_954ec1b6 thread function_a39f5f0(instance);
        var_954ec1b6 thread function_b076be86(instance);
        var_954ec1b6 thread function_5efbdd83(instance);
        var_954ec1b6 thread function_1ee78771(instance);
        var_954ec1b6 thread function_75eea0d2(instance);
        var_954ec1b6 thread function_b70e2a37();
        var_954ec1b6 thread function_7cfc417a(instance);
        var_954ec1b6 thread function_f62e3f66(instance);
        var_954ec1b6 thread function_c93067d3(instance);
        var_954ec1b6.var_86a21346 = &function_79417d24;
    }
    instance.var_7a9e6505 = 1;
    instance.var_5b071610 = 0;
    instance.var_4fff464f = 0;
    instance.var_f63c851c = 0;
    instance.var_bf189694 = getentarray("drop_pod", "targetname");
    instance thread function_1d405fe5();
    instance thread namespace_7589cf5c::vo_start("objectiveSecureAnnounce", "objectiveSecureAnnounceResponse");
    instance thread function_338034b3();
    instance thread function_1a2e6a13();
    instance thread function_738f5215();
    instance thread function_39f990f4();
    level.var_acd0f67e = 6;
    showmiscmodels("secure_corpses");
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 13, eflags: 0x2 linked
// Checksum 0x4ba3781e, Offset: 0x1128
// Size: 0x1ba
function function_79417d24(*einflictor, eattacker, idamage, *idflags, *smeansofdeath, *weapon, *var_fd90b0bb, *vpoint, *vdir, *shitloc, *psoffsettime, *iboneindex, *imodelindex) {
    if (isdefined(iboneindex) && isplayer(iboneindex)) {
        return 0;
    } else {
        self playsound(#"hash_1225352ba7939c9c");
        if (isdefined(self) && !is_true(self.is_damaged) && isdefined(level.contentmanager.activeobjective)) {
            self thread function_814c0e69(level.contentmanager.activeobjective);
        }
        if (isdefined(iboneindex) && iboneindex.aitype === #"hash_7a8b592728eec95d" && imodelindex > 100) {
            imodelindex = 100;
        } else if (imodelindex > 50) {
            imodelindex = 50;
        }
        self clientfield::increment("" + #"hash_1043711497bf7a0b");
    }
    return int(imodelindex);
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x5aa0744d, Offset: 0x12f0
// Size: 0x11c
function function_39f990f4() {
    self endon(#"objective_ended");
    var_812457c = 0;
    while (!var_812457c) {
        foreach (player in getplayers()) {
            if (distance2dsquared(player.origin, self.origin) <= 36000000) {
                level clientfield::set("" + #"hash_71f053fa597abb52", 1);
                var_812457c = 1;
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x146fd8d1, Offset: 0x1418
// Size: 0x1d4
function function_738f5215() {
    self endon(#"objective_ended");
    var_35dfb407 = 0;
    while (!var_35dfb407) {
        a_players = getplayers();
        foreach (player in a_players) {
            if (distance2dsquared(player.origin, self.mdl_console.origin) <= 2250000) {
                if (player util::is_looking_at(self.mdl_console, 0.7, 0) || player util::is_looking_at(self.origin, 0.7, 1) || distance2dsquared(player.origin, self.mdl_console.origin) <= 250000) {
                    var_35dfb407 = 1;
                    break;
                }
            }
        }
        wait(0.5);
    }
    level namespace_7589cf5c::play_vo("objectiveSecureApproach");
    wait(0.5);
    level namespace_7589cf5c::play_vo("objectiveSecureApproachResponse");
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0xfa43e7ef, Offset: 0x15f8
// Size: 0x6a
function function_17f1d0f3() {
    self.var_5e36739b = self namespace_7589cf5c::function_df911075();
    self.var_61c57c53 = self namespace_7589cf5c::function_1b53cdc7();
    self.var_5de17ec9 = self namespace_7589cf5c::function_56fa33d9();
    self.var_2133c784 = 0;
    self.var_b803db9c = 0;
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0xf4eca95f, Offset: 0x1670
// Size: 0x2dc
function function_1a2e6a13() {
    foreach (model in self.a_models) {
        if (model.model === #"hash_38cf6d433834d7c5") {
            mdl_console = model;
        }
    }
    var_b98dc7c6 = util::spawn_model("p9_sur_computer_console_hvt_01_screen_missile_in_act", mdl_console.origin, mdl_console.angles);
    var_b98dc7c6 playloopsound(#"hash_7f16b09413f4244");
    if (isdefined(var_b98dc7c6)) {
        if (!isdefined(self.a_models)) {
            self.a_models = [];
        } else if (!isarray(self.a_models)) {
            self.a_models = array(self.a_models);
        }
        self.a_models[self.a_models.size] = var_b98dc7c6;
    }
    var_6ee5c0f2 = util::spawn_model("p9_sur_computer_console_hvt_01_screen_missile_act", mdl_console.origin, mdl_console.angles);
    if (isdefined(var_6ee5c0f2)) {
        if (!isdefined(self.a_models)) {
            self.a_models = [];
        } else if (!isarray(self.a_models)) {
            self.a_models = array(self.a_models);
        }
        self.a_models[self.a_models.size] = var_6ee5c0f2;
        var_6ee5c0f2 hide();
    }
    self waittill(#"hash_20dcff0079f189f3");
    if (isdefined(var_b98dc7c6)) {
        var_b98dc7c6 delete();
    }
    if (isdefined(var_6ee5c0f2)) {
        var_6ee5c0f2 show();
    }
    var_6ee5c0f2 playsound(#"hash_47db5b5d66c610e3");
    var_6ee5c0f2 playloopsound(#"hash_7f16b09413f4244");
    self waittill(#"objective_ended");
    if (isdefined(var_6ee5c0f2)) {
        var_6ee5c0f2 delete();
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0xe445e18c, Offset: 0x1958
// Size: 0x19e
function function_8b062964() {
    self endon(#"objective_ended");
    wait(0.5);
    level namespace_7589cf5c::play_vo("objectiveSecureStart");
    if (isdefined(self.var_2972bc14)) {
        self.var_2972bc14 playsound(#"hash_2996ffe96f4102d9");
    }
    wait(0.5);
    level namespace_7589cf5c::play_vo("objectiveSecureStartSequence2");
    wait(0.25);
    level namespace_7589cf5c::play_vo("objectiveSecureStartSequence3");
    wait(0.25);
    level namespace_7589cf5c::play_vo("objectiveSecureStartSequence4");
    if (isdefined(self.var_2972bc14)) {
        self.var_2972bc14 playsound(#"hash_1dbfe54c1a1ccba9");
    }
    wait(2.5);
    if (isdefined(self.var_bf189694)) {
        self.var_bf189694[0] playsound(#"hash_308726c7289acfb3");
    }
    level thread namespace_7589cf5c::play_vo("objectiveSecureDescent");
    wait(3);
    self notify(#"summon");
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0xfcbf7476, Offset: 0x1b00
// Size: 0x1a8
function function_c93067d3(instance) {
    self endon(#"death");
    instance endon(#"hash_8202877a3aadac8");
    self waittill(#"cleared");
    self namespace_7589cf5c::play_vo(#"hash_27ee249325063d0d");
    self.var_8ccbea19 = 1;
    self namespace_7589cf5c::play_vo(#"hash_31677d777eaf5f36");
    wait(0.5);
    self namespace_7589cf5c::play_vo(#"hash_362e7fbf86ce0b41");
    wait(1);
    if (instance.var_f63c851c < 2) {
        foreach (player in getplayers()) {
            if (distance2dsquared(player.origin, self.origin) <= 810000) {
                player thread zm_vo::function_7622cb70("objectiveSecureEssenceConversionEndResponse", 0, 1);
            }
        }
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x50f0c22d, Offset: 0x1cb0
// Size: 0x74
function function_f62e3f66(instance) {
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    self endon(#"death");
    self waittill(#"perimeter");
    self thread function_dc79011b(instance);
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x28a4c1c7, Offset: 0x1d30
// Size: 0x224
function function_dc79011b(instance) {
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    self endon(#"death");
    while (true) {
        foreach (zombie in function_a38db454(self.origin, self.var_75833abc)) {
            if ((zombie.aitype === #"spawner_bo5_avogadro_sr" || zombie.archetype === #"zombie" || zombie.aitype === #"spawner_bo5_soa") && !isdefined(zombie.var_aa967222)) {
                zombie.e_marker = util::spawn_model("tag_origin", zombie gettagorigin("J_Spine4"));
                if (isdefined(zombie.e_marker)) {
                    zombie.e_marker linkto(zombie, "J_Spine4");
                    zombie.e_marker clientfield::set("" + #"hash_11838968b17d8418", 1);
                    zombie.var_aa967222 = 1;
                    zombie thread function_60b78908(instance);
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x16c9a56a, Offset: 0x1f60
// Size: 0x12c
function function_60b78908(instance) {
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    self endon(#"death");
    self.var_5ea363c = array::get_all_closest(self.origin, instance.var_bf189694)[0];
    while (true) {
        if (distance2dsquared(self.origin, self.var_5ea363c.origin) > sqr(self.var_5ea363c.var_75833abc) || is_true(self.var_5ea363c.var_71973b22)) {
            if (isdefined(self.e_marker)) {
                self.e_marker delete();
                self.var_aa967222 = undefined;
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0xc9358d22, Offset: 0x2098
// Size: 0x2dc
function function_a55dd0a0(instance) {
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    self endon(#"death", #"landed");
    self waittill(#"arriving");
    a_players = getplayers();
    while (true) {
        foreach (player in a_players) {
            if (zm_utility::is_player_valid(player)) {
                n_distsq = distance2dsquared(self.v_land, player.origin);
                if (n_distsq <= sqr(50) && is_true(self.var_e52440b6)) {
                    player dodamage(player.health + 999, self.v_land, undefined, undefined, undefined, "MOD_CRUSH");
                    player function_bc82f900("damage_heavy");
                } else if (n_distsq <= sqr(400)) {
                    player dodamage(2, self.v_land, undefined, undefined, undefined, "MOD_BURNED");
                    player function_bc82f900("damage_light");
                    player playsoundtoplayer(#"chr_burn_start", player);
                }
                if (n_distsq <= sqr(700)) {
                    if (!isdefined(player.var_aef8b7b4)) {
                        player.var_aef8b7b4 = 1;
                        player thread zm_vo::function_7622cb70("objectiveSecureDescentWarning", 0, 1);
                    }
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x41c9686, Offset: 0x2380
// Size: 0x190
function function_f11f6b22(instance) {
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    self endon(#"death", #"landed");
    while (true) {
        if (self.var_cef46557.origin[2] <= self.v_land[2] + 800 && !is_true(self.var_9fd4020b)) {
            self.var_9fd4020b = 1;
            self thread function_7ac4b826(instance);
            self thread clear_vehicles(instance);
            self notify(#"arriving");
        } else if (self.var_cef46557.origin[2] <= self.v_land[2] + 60 && !is_true(self.var_3c11dc55)) {
            self.var_3c11dc55 = 1;
            self thread function_d210b81a(instance);
            self thread function_f3a8336e(instance);
        }
        wait(0.1);
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x23fe172c, Offset: 0x2518
// Size: 0xbc
function function_7ac4b826(instance) {
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    self endon(#"death", #"landing");
    while (true) {
        if (self.var_cef46557.origin[2] <= self.v_land[2] + 82) {
            self.var_e52440b6 = 1;
            self notify(#"landing");
        }
        wait(0.1);
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0xe25568c6, Offset: 0x25e0
// Size: 0x22c
function function_338034b3() {
    self endon(#"objective_ended", #"hash_8202877a3aadac8");
    self.var_4272a188 triggerenable(0);
    var_1490cdb5 = spawn("trigger_radius_use", self.mdl_console.origin + (0, 0, 24), 0, 96, 96, 1);
    var_1490cdb5 triggerignoreteam();
    var_1490cdb5 setcursorhint("HINT_NOICON");
    var_1490cdb5 sethintstring(#"hash_263f26fcd49be105");
    var_1490cdb5 usetriggerrequirelookat(1);
    s_result = var_1490cdb5 waittill(#"trigger");
    var_1490cdb5 delete();
    objective_setvisibletoall(self.var_e55c8b4e);
    self.var_4272a188 triggerenable(1);
    self.var_4272a188 useby(s_result.activator);
    wait(0.5);
    self.var_2972bc14 playrumblelooponentity(#"sr_machinery_rumble");
    self.var_2972bc14 scene::play(#"p9_fxanim_zm_sv_hvt_dish_bundle", "Shot 1", self.var_2972bc14);
    self.var_2972bc14 stoprumble(#"sr_machinery_rumble");
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0xd59bfa72, Offset: 0x2818
// Size: 0x274
function function_f919d221(instance) {
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    self endon(#"death");
    self function_41b29ff0(#"hash_4de038bb5090f659");
    self.mdl_fx = util::spawn_model("tag_origin", self.var_cef46557.origin, self.var_cef46557.angles);
    wait(0.1);
    if (isdefined(self.mdl_fx)) {
        self.mdl_fx linkto(self.var_cef46557);
    }
    instance waittill(#"summon");
    self.var_cef46557 show();
    self.var_cef46557 solid();
    playrumbleonposition(#"sr_transmitter_impact", self.v_land);
    self thread function_4663acbd(instance);
    self.var_cef46557 thread scene::play(#"p9_sur_machine_rocket_all_descend_bundle", "Shot 1", self.var_cef46557);
    self.var_cef46557 waittilltimeout(20, #"touchdown");
    self notify(#"landed");
    self.var_cef46557 waittilltimeout(8, #"scenes_done");
    self show();
    self.var_526e7ad6 show();
    self solid();
    self.var_526e7ad6 solid();
    waitframe(1);
    self.var_cef46557 delete();
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x48972655, Offset: 0x2a98
// Size: 0x10c
function function_4663acbd(instance) {
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    self endon(#"death");
    if (isdefined(self.mdl_fx)) {
        self.mdl_fx clientfield::increment("" + #"hash_76d1986dfad6a190");
    }
    self.var_cef46557 playrumblelooponentity(#"sr_retrieval_rocket_takeoff");
    wait(5);
    self thread function_f11f6b22(instance);
    self waittill(#"landed");
    self.var_cef46557 stoprumble(#"sr_retrieval_rocket_takeoff");
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0xd177a201, Offset: 0x2bb0
// Size: 0x69a
function function_75eea0d2(instance) {
    self endon(#"secured", #"death", #"cleared");
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    self.var_2c27b95c = 0;
    instance.var_e514f2 = 0;
    self waittill(#"ready");
    self.var_c5391433 = self function_1172db0d();
    self.var_75833abc = 400;
    self.var_dc652bc6 = 0;
    self.var_bcaab03b = 0;
    self.var_116c0db1 = 0;
    self.var_db94b70a = 0;
    self.var_2493681a = 0;
    self.var_90627599 = 0;
    self.var_71973b22 = 0;
    self.b_start = 0;
    while (true) {
        self waittill(#"capture");
        self.var_2c27b95c = self.n_kills / self.var_c5391433;
        if (self.var_2c27b95c >= 0.85 && !self.var_90627599) {
            self.var_90627599 = 1;
            self.var_526e7ad6 scene::play(#"p9_sur_machine_rocket_01_legs_goo_bundle", "05_rise", self.var_526e7ad6);
            self.var_526e7ad6 thread scene::play(#"p9_sur_machine_rocket_01_legs_goo_bundle", "05_loop", self.var_526e7ad6);
        } else if (self.var_2c27b95c >= 0.75 && !self.var_dc652bc6) {
            self.var_dc652bc6 = 1;
            instance.var_e514f2++;
            if (instance.var_e514f2 > 1) {
                instance.var_237b170c = self.n_id;
                instance flag::set(#"hash_173a2c9f1b7ded67");
            }
            self thread namespace_7589cf5c::play_vo(#"hash_19f9b6f3e6d0208e");
            self.var_526e7ad6 scene::play(#"p9_sur_machine_rocket_01_legs_goo_bundle", "04_rise", self.var_526e7ad6);
            self.var_526e7ad6 thread scene::play(#"p9_sur_machine_rocket_01_legs_goo_bundle", "04_loop", self.var_526e7ad6);
        } else if (self.var_2c27b95c >= 0.5 && !self.var_bcaab03b) {
            self.var_bcaab03b = 1;
            if (!is_true(self.var_dc652bc6)) {
                self thread namespace_7589cf5c::play_vo(#"hash_76f74fa6577f4a21");
            }
            if (instance.var_e514f2 > 0) {
                instance.var_e514f2++;
                if (instance.var_e514f2 > 1) {
                    instance.var_237b170c = self.n_id;
                    instance flag::set(#"hash_173a2c9f1b7ded67");
                }
            }
            self.var_526e7ad6 scene::play(#"p9_sur_machine_rocket_01_legs_goo_bundle", "03_rise", self.var_526e7ad6);
            self.var_526e7ad6 thread scene::play(#"p9_sur_machine_rocket_01_legs_goo_bundle", "03_loop", self.var_526e7ad6);
        } else if (self.var_2c27b95c >= 0.25 && !self.var_2493681a) {
            self.var_2493681a = 1;
            if (!is_true(self.var_bcaab03b)) {
                self thread namespace_7589cf5c::play_vo(#"hash_318cb0d5fb2585c1");
            }
            self.var_526e7ad6 scene::play(#"p9_sur_machine_rocket_01_legs_goo_bundle", "02_rise", self.var_526e7ad6);
            self.var_526e7ad6 thread scene::play(#"p9_sur_machine_rocket_01_legs_goo_bundle", "02_loop", self.var_526e7ad6);
        } else if (self.var_2c27b95c >= 0.1 && !self.b_start) {
            self.b_start = 1;
            self.var_526e7ad6 scene::play(#"p9_sur_machine_rocket_01_legs_goo_bundle", "01_rise", self.var_526e7ad6);
            self.var_526e7ad6 thread scene::play(#"p9_sur_machine_rocket_01_legs_goo_bundle", "01_loop", self.var_526e7ad6);
        }
        if (self.var_2c27b95c >= 0.5 && !is_true(self.var_41763f62)) {
            instance notify(#"hash_3167f3403f1172ad");
            self.var_41763f62 = 1;
        }
        if (self.n_kills >= self.var_c5391433) {
            if (!is_true(self.var_41763f62)) {
                instance notify(#"hash_3167f3403f1172ad");
            }
            self clientfield::set("" + #"hash_771abe419eda7442", 0);
            self.var_71973b22 = 1;
            self notify(#"cleared");
        }
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0xd87b08a3, Offset: 0x3258
// Size: 0x148
function function_a39f5f0(instance) {
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    self endon(#"death");
    self waittill(#"ready");
    while (true) {
        self.var_210e22a1 = 0;
        foreach (player in getplayers()) {
            if (distance2dsquared(self.origin, player.origin) <= sqr(2000)) {
                self.var_210e22a1 = 1;
            }
        }
        wait(1);
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x4d24a7d, Offset: 0x33a8
// Size: 0x5c0
function function_b076be86(instance) {
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    self endon(#"death");
    self waittill(#"ready");
    while (true) {
        self.var_210e22a1 = 0;
        foreach (player in getplayers()) {
            if (distance2dsquared(self.origin, player.origin) <= sqr(1000)) {
                self.var_210e22a1 = 1;
            }
        }
        if (self.var_210e22a1 || is_true(self.b_forced)) {
            self thread function_4c664c70(instance);
            self clientfield::set("" + #"hash_771abe419eda7442", 1);
            if (!instance.var_5b071610) {
                instance.var_5b071610 = 1;
            }
            foreach (player in getplayers()) {
                if (distance2dsquared(self.origin, player.origin) <= sqr(1000) && isalive(player)) {
                    player thread zm_vo::function_c4303dda(#"hash_733d9e62eeb7efdb");
                }
            }
            wait(4);
            self notify(#"perimeter");
            foreach (player in getplayers()) {
                if (distance2dsquared(self.origin, player.origin) <= sqr(1000) && isalive(player)) {
                    player thread zm_vo::function_c4303dda(#"hash_21a2a9746be5c204");
                }
            }
            wait(3);
            foreach (player in getplayers()) {
                if (distance2dsquared(self.origin, player.origin) <= sqr(1000) && isalive(player)) {
                    player thread zm_vo::function_7622cb70("objectiveSecureActivatePerimeter3", 0, 1);
                }
            }
            wait(3.5);
            foreach (player in getplayers()) {
                if (distance2dsquared(self.origin, player.origin) <= sqr(1000) && isalive(player)) {
                    player thread zm_vo::function_7622cb70("objectiveSecureActivatePerimeter4", 0, 1);
                }
            }
            break;
        }
        wait(1);
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x9c81da87, Offset: 0x3970
// Size: 0x178
function function_1d405fe5() {
    self endon(#"objective_ended", #"hash_8202877a3aadac8");
    self waittill(#"hash_20dcff0079f189f3");
    self thread function_55ea0c81(self.n_timeout);
    var_bf189694 = array::randomize(self.var_bf189694);
    while (true) {
        self waittill(#"hash_3167f3403f1172ad");
        if (!is_true(var_bf189694[0].b_attacked) && !is_true(var_bf189694[0].var_210e22a1)) {
            var_bf189694[0].b_forced = 1;
        } else if (!is_true(var_bf189694[1].b_attacked) && !is_true(var_bf189694[1].var_210e22a1)) {
            var_bf189694[1].b_forced = 1;
        }
        self thread function_55ea0c81(self.n_timeout);
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x9afdb7b4, Offset: 0x3af0
// Size: 0x7e
function function_55ea0c81(n_time) {
    self notify("29a52b50b7e25ccd");
    self endon("29a52b50b7e25ccd");
    self endon(#"objective_ended", #"hash_3167f3403f1172ad", #"start_attack", #"hash_8202877a3aadac8");
    wait(n_time);
    self notify(#"hash_3167f3403f1172ad");
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x17dad46f, Offset: 0x3b78
// Size: 0x47c
function function_ddb668e6() {
    self endon(#"objective_ended", #"hash_8202877a3aadac8");
    self flag::wait_till(#"hash_173a2c9f1b7ded67");
    n_spawns = self function_4fbba5c();
    var_1fabc58c = [];
    var_559503f1 = self.contentgroups[#"hash_6d3ff59b5d73d444"];
    foreach (s_pt in var_559503f1) {
        if (s_pt.script_int === self.var_237b170c) {
            var_1fabc58c[var_1fabc58c.size] = s_pt;
        }
    }
    if (!isdefined(var_1fabc58c)) {
        var_1fabc58c = var_559503f1;
    }
    for (i = 0; i < n_spawns; i++) {
        var_6017f33e = function_2631fff1();
        var_7ecdee63 = var_6017f33e.var_990b33df;
        a_s_pts = namespace_85745671::function_e4791424(array::random(var_1fabc58c).origin, 8, 20, 300);
        if (!isdefined(a_s_pts) || a_s_pts.size === 0) {
            return;
        }
        v_pt = array::random(a_s_pts).origin;
        if (isdefined(v_pt)) {
            if (namespace_7589cf5c::function_82e262cf(var_7ecdee63)) {
                if (isdefined(self.var_38c710c3)) {
                    n_cooldown = namespace_7589cf5c::function_190c51a9();
                    var_be32c966 = float(gettime()) / 1000 - self.var_38c710c3;
                    if (var_be32c966 < n_cooldown) {
                        var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
                    } else {
                        self.var_38c710c3 = undefined;
                    }
                }
                if (self.var_2133c784 >= self.var_61c57c53 || self.var_b803db9c >= self.var_5de17ec9) {
                    var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
                }
            }
            ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, v_pt, self.angles, "droppod_zombie");
        }
        wait(0.1);
        if (isdefined(ai_spawned)) {
            ai_spawned.var_a950813d = 1;
            if (namespace_7589cf5c::function_82e262cf(ai_spawned.aitype)) {
                self.var_38c710c3 = float(gettime()) / 1000;
                self.var_2133c784++;
                self.var_b803db9c++;
                ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &function_c36cb7b1);
            } else {
                ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &on_ai_killed);
            }
            ai_spawned thread function_79f42a00();
            if (ai_spawned.aitype === #"hash_7a8b592728eec95d") {
                ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &on_dog_killed);
            }
        }
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0xc63a7c83, Offset: 0x4000
// Size: 0x298
function function_4c664c70(instance) {
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    self endon(#"death", #"cleared");
    instance notify(#"start_attack");
    self.b_attacked = 1;
    instance.var_155bbc44 = 0;
    self playsound(#"hash_56c3b316396ed04d");
    n_active = self function_53e21154();
    n_total = self function_37a785fb();
    while (true) {
        level flag::wait_till("spawn_zombies");
        if (self.n_active <= n_active) {
            ai_zombie = self function_88a7c00a(instance);
            wait(0.1);
            if (isdefined(ai_zombie)) {
                if (self.n_total >= n_total) {
                    ai_zombie zm_score::function_acaab828();
                }
                if (namespace_7589cf5c::function_82e262cf(ai_zombie.aitype)) {
                    instance.var_38c710c3 = float(gettime()) / 1000;
                    instance.var_2133c784++;
                    instance.var_b803db9c++;
                    ai_zombie callback::function_d8abfc3d(#"on_ai_killed", &function_c36cb7b1);
                } else {
                    ai_zombie callback::function_d8abfc3d(#"on_ai_killed", &on_ai_killed);
                }
                self.n_active++;
                self.n_total++;
                self thread zombie_death_watcher(instance, ai_zombie);
                ai_zombie.mdl_drop = self;
                ai_zombie thread function_bf606a73(instance);
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 2, eflags: 0x2 linked
// Checksum 0x3ffdc4c6, Offset: 0x42a0
// Size: 0x94
function zombie_death_watcher(instance, ai_zombie) {
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    ai_zombie waittill(#"death");
    if (self.n_active) {
        self.n_active--;
    }
    if (ai_zombie.aitype === #"spawner_bo5_avogadro_sr") {
        instance.var_155bbc44--;
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x106197d9, Offset: 0x4340
// Size: 0x2a0
function function_bf606a73(instance) {
    self endon(#"death");
    instance endon(#"objective_ended");
    if (isdefined(self.mdl_drop)) {
        self.mdl_drop endon(#"death");
    }
    self callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_fd68cae4);
    self thread function_c87aadb6(instance);
    while (true) {
        namespace_85745671::function_744beb04(self);
        player = awareness::function_d7fedde2(self);
        if (isdefined(self.mdl_drop) && isalive(player) && distance2dsquared(self.origin, player.origin) <= distance2dsquared(self.origin, self.mdl_drop.origin) && distance2dsquared(self.mdl_drop.origin, player.origin) <= sqr(1000)) {
            self.var_ff290a61 = player;
            awareness::function_c241ef9a(self, player, 6);
            wait(5);
        } else if (!isdefined(self.var_b238ef38) && isdefined(self.mdl_drop) && !is_true(self.mdl_drop.var_210e22a1) && isdefined(instance) && is_true(instance.var_f63c851c)) {
            self.var_ff290a61 = player;
            awareness::function_c241ef9a(self, player, 6);
            wait(5);
        } else {
            self.var_ff290a61 = undefined;
            namespace_85745671::function_744beb04(self);
        }
        wait(0.5);
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x22f5229f, Offset: 0x45e8
// Size: 0xd8
function function_c87aadb6(instance) {
    self endon(#"death");
    instance endon(#"objective_ended");
    while (true) {
        player = awareness::function_d7fedde2(self);
        if (isalive(player) && distance2dsquared(self.origin, player.origin) <= 250000) {
            self.var_ff290a61 = player;
            awareness::function_c241ef9a(self, player, 10);
        }
        wait(8);
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x23d55a41, Offset: 0x46c8
// Size: 0xe2
function function_79f42a00() {
    self endon(#"death");
    self callback::function_d8abfc3d(#"hash_4afe635f36531659", &function_fd68cae4);
    while (true) {
        namespace_85745671::function_744beb04(self);
        player = awareness::function_d7fedde2(self);
        if (isalive(player)) {
            self.var_ff290a61 = player;
            awareness::function_c241ef9a(self, player, 6);
        }
        wait(5);
        self.var_ff290a61 = undefined;
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0xb2bceda6, Offset: 0x47b8
// Size: 0xa4
function function_fd68cae4() {
    self endon(#"death");
    if (isdefined(self.mdl_drop)) {
        self.mdl_drop endon(#"death");
    }
    if (self.archetype == #"zombie") {
        if (level.var_b48509f9 > 4) {
            self namespace_85745671::function_9758722("super_sprint");
            return;
        }
        self namespace_85745671::function_9758722("sprint");
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0xad51b17a, Offset: 0x4868
// Size: 0x1e6
function function_2631fff1() {
    switch (level.var_b48509f9) {
    case 1:
        var_6017f33e = namespace_679a22ba::function_ca209564(#"objective_secure_ailist_1");
        break;
    case 2:
        var_6017f33e = namespace_679a22ba::function_ca209564(#"objective_secure_ailist_2");
        break;
    case 3:
        var_6017f33e = namespace_679a22ba::function_ca209564(#"objective_secure_ailist_3");
        break;
    case 4:
        var_6017f33e = namespace_679a22ba::function_ca209564(#"objective_secure_ailist_4");
        break;
    case 5:
        var_6017f33e = namespace_679a22ba::function_ca209564(#"objective_secure_ailist_5");
        break;
    case 6:
        var_6017f33e = namespace_679a22ba::function_ca209564(#"objective_secure_ailist_6");
        break;
    case 7:
        var_6017f33e = namespace_679a22ba::function_ca209564(#"objective_secure_ailist_7");
        break;
    default:
        var_6017f33e = namespace_679a22ba::function_ca209564(#"objective_secure_ailist_8");
        break;
    }
    return var_6017f33e;
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0xd99a5107, Offset: 0x4a58
// Size: 0x2b0
function function_88a7c00a(instance) {
    self endon(#"death", #"cleared");
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    var_6017f33e = function_2631fff1();
    var_7ecdee63 = var_6017f33e.var_990b33df;
    a_s_pts = namespace_85745671::function_e4791424(array::random(self.var_559503f1).origin, 8, 80, 300);
    if (!isdefined(a_s_pts) || a_s_pts.size === 0) {
        return;
    }
    v_pt = array::random(a_s_pts).origin;
    if (isdefined(v_pt)) {
        if (namespace_7589cf5c::function_82e262cf(var_7ecdee63)) {
            if (isdefined(instance.var_38c710c3)) {
                n_cooldown = namespace_7589cf5c::function_190c51a9();
                var_be32c966 = float(gettime()) / 1000 - instance.var_38c710c3;
                if (var_be32c966 < n_cooldown) {
                    var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
                } else {
                    instance.var_38c710c3 = undefined;
                }
            }
            if (instance.var_2133c784 >= instance.var_61c57c53 || instance.var_b803db9c >= instance.var_5de17ec9) {
                var_7ecdee63 = namespace_7589cf5c::function_b9e4c169();
            }
        }
        ai_spawned = namespace_85745671::function_9d3ad056(var_7ecdee63, v_pt, self.angles, "droppod_zombie");
    }
    wait(0.1);
    if (isdefined(ai_spawned)) {
        ai_spawned.var_a950813d = 1;
        if (ai_spawned.aitype === #"hash_7a8b592728eec95d") {
            ai_spawned callback::function_d8abfc3d(#"on_ai_killed", &on_dog_killed);
        }
        ai_spawned.b_ignore_cleanup = 1;
        return ai_spawned;
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x0
// Checksum 0xcecfeea3, Offset: 0x4d10
// Size: 0x12e
function function_c9277739(a_s_pts) {
    for (i = 0; i < a_s_pts.size; i++) {
        a_s_pts[i].b_cansee = 0;
        foreach (player in getplayers()) {
            if (player util::is_player_looking_at(a_s_pts[i].origin, 0.8, 1, player)) {
                a_s_pts[i].b_cansee = 1;
            }
        }
        if (!a_s_pts[i].b_cansee) {
            v_point = a_s_pts[i].origin;
            return v_point;
        }
    }
    return undefined;
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0xa2d0e88e, Offset: 0x4e48
// Size: 0xbe
function function_1172db0d() {
    switch (getplayers().size) {
    case 1:
        n_kills = 16;
        break;
    case 2:
        n_kills = 20;
        break;
    case 3:
        n_kills = 24;
        break;
    case 4:
        n_kills = 32;
        break;
    default:
        n_kills = 24;
        break;
    }
    return n_kills;
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x44263a4b, Offset: 0x4f10
// Size: 0xbe
function function_53e21154() {
    switch (getplayers().size) {
    case 1:
        n_spawns = 6;
        break;
    case 2:
        n_spawns = 10;
        break;
    case 3:
        n_spawns = 15;
        break;
    case 4:
        n_spawns = 18;
        break;
    default:
        n_spawns = 12;
        break;
    }
    return n_spawns;
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0xbc51f269, Offset: 0x4fd8
// Size: 0xbe
function function_4fbba5c() {
    switch (getplayers().size) {
    case 1:
        n_spawns = 8;
        break;
    case 2:
        n_spawns = 10;
        break;
    case 3:
        n_spawns = 13;
        break;
    case 4:
        n_spawns = 16;
        break;
    default:
        n_spawns = 12;
        break;
    }
    return n_spawns;
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0xc92f28cc, Offset: 0x50a0
// Size: 0xd6
function function_37a785fb() {
    self endon(#"death");
    switch (getplayers().size) {
    case 1:
        n_spawns = 48;
        break;
    case 2:
        n_spawns = 60;
        break;
    case 3:
        n_spawns = 72;
        break;
    case 4:
        n_spawns = 96;
        break;
    default:
        n_spawns = 72;
        break;
    }
    return n_spawns;
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x1d2178a0, Offset: 0x5180
// Size: 0xbe
function function_36585ff1() {
    switch (getplayers().size) {
    case 1:
        n_timeout = 75;
        break;
    case 2:
        n_timeout = 60;
        break;
    case 3:
        n_timeout = 45;
        break;
    case 4:
        n_timeout = 30;
        break;
    default:
        n_timeout = 60;
        break;
    }
    return n_timeout;
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x61f50a46, Offset: 0x5248
// Size: 0x44
function function_ddfa586() {
    namespace_7589cf5c::function_3899cfea();
    self thread function_d0494a5a();
    objective_manager::objective_ended(self, 1);
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x6b05fdd3, Offset: 0x5298
// Size: 0x7c
function function_d0494a5a() {
    self waittill(#"objective_ended");
    level namespace_7589cf5c::play_vo("objectiveSecureEndSuccess");
    wait(1);
    level namespace_7589cf5c::play_vo("objectiveSecureEndSuccessResponse");
    level flag::set(#"hash_1460b3afd614fb6c");
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0xf949a522, Offset: 0x5320
// Size: 0x764
function function_5efbdd83(instance) {
    self endon(#"death");
    instance endon(#"hash_8202877a3aadac8");
    self waittill(#"landed");
    if (!isdefined(instance.var_f059ae2a)) {
        instance.var_f059ae2a = 1;
        level namespace_7589cf5c::play_vo("objectiveSecureDescentEnd");
    }
    self thread function_b5770dda(instance, 4);
    self disconnectpaths();
    self.is_active = 1;
    self.var_8ccbea19 = 0;
    self notify(#"ready");
    self waittill(#"cleared");
    self thread function_be75ebf0();
    self.var_abe43927 = 1;
    wait(0.1);
    objective_setinvisibletoall(self.n_objective_id);
    objective_setinvisibletoall(self.var_3310aa30);
    self.var_fcd0c6d7 = 1;
    namespace_85745671::function_b70e2a37(self);
    self playrumblelooponentity("sr_payload_portal_rumble");
    while (!self.var_8ccbea19) {
        wait(0.1);
    }
    self clientfield::set("" + #"hash_502be00d1af105e9", 1);
    self.var_526e7ad6 thread scene::play(#"p9_sur_machine_rocket_01_legs_goo_bundle", "drain", self.var_526e7ad6);
    wait(2);
    self stoprumble("sr_payload_portal_rumble");
    wait(0.5);
    self playrumbleonentity("sr_transmitter_clear");
    waitframe(1);
    self function_c6f443c5();
    wait(0.5);
    level scoreevents::doscoreeventcallback("scoreEventSR", {#scoreevent:"secure_transmitter_secured_zm", #allplayers:1});
    if (isdefined(self.health) && isdefined(self.max_health) && self.health / self.max_health >= 0.8) {
        level scoreevents::doscoreeventcallback("scoreEventSR", {#scoreevent:"secure_pristine_zm", #nearbyplayers:1, #location:self.origin});
    }
    foreach (player in getplayers()) {
        if (!level.sr_objective_secure_hud sr_objective_secure_hud::is_open(player)) {
            level.sr_objective_secure_hud sr_objective_secure_hud::open(player);
        }
        switch (self.n_id) {
        case 0:
            level.sr_objective_secure_hud sr_objective_secure_hud::function_d2f341fe(player, 1);
            break;
        case 1:
            level.sr_objective_secure_hud sr_objective_secure_hud::function_e4a4e561(player, 1);
            break;
        }
    }
    dropstruct = {#origin:self.origin + (0, 0, 40), #angles:self.angles + (0, 90, 0), #var_738dfc81:1};
    if (math::cointoss(33)) {
        if (isdefined(dropstruct)) {
            item = self function_97379a52(dropstruct);
        }
    } else {
        items = dropstruct namespace_65181344::function_fd87c780(#"secure_bonus_drop_list", 1, 0);
        if (isdefined(items) && isdefined(items[0])) {
            item = items[0];
            items[0].var_dd21aec2 = 16;
            items[0] thread function_5ebfd8cc();
            item.var_99498378 = 1;
        }
    }
    instance.var_f63c851c++;
    if (instance.var_f63c851c > 1 && !instance.var_4fff464f) {
        instance.var_4fff464f = 1;
        namespace_cda50904::function_a92a93e9(self.origin, self.angles);
        instance thread function_ddfa586();
    }
    self.var_526e7ad6 thread scene::play(#"p9_sur_machine_rocket_01_legs_goo_bundle", "doors_open", self.var_526e7ad6);
    self thread scene::play(#"p9_sur_machine_rocket_01_dest_bundle", "doors_open", self);
    if (isdefined(item)) {
        util::wait_network_frame();
        if (isdefined(item) && instance.targetname === "objective_black_sea_secure") {
            if (self.n_id === 0) {
                item.origin += (3, -2, 0);
            }
            item.angles = self.angles;
        }
        while (isdefined(item)) {
            wait(0.5);
        }
    }
    self clientfield::set("" + #"hash_502be00d1af105e9", 0);
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x2725def4, Offset: 0x5a90
// Size: 0x7c
function function_a6ee18e5(params) {
    if (isdefined(params.item) && is_true(params.item.var_99498378) && isplayer(self)) {
        self zm_stats::increment_challenge_stat(#"hash_2a1239190cd1bb23");
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x903b763, Offset: 0x5b18
// Size: 0xd2
function function_97379a52(s_drop) {
    v_org = s_drop.origin + (0, 0, -30);
    item = zm_powerups::specific_powerup_drop(array("full_ammo", "bonus_points_team", "insta_kill", "double_points"), v_org, #"allies", undefined, undefined, 1);
    if (isdefined(item)) {
        item.var_99498378 = 1;
        item.var_5c6f6051 = 80;
        item thread function_d734bafd();
        return item;
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x536281cd, Offset: 0x5bf8
// Size: 0xea
function function_d734bafd() {
    if (!isdefined(self) || !isdefined(self.model)) {
        return;
    }
    switch (self.model) {
    case #"p7_zm_power_up_max_ammo":
    case #"p7_zm_power_up_double_points":
        self setscale(0.8);
        break;
    case #"p7_zm_power_up_insta_kill":
    case #"zombie_z_money_icon":
        self setscale(0.75);
        break;
    default:
        self setscale(0.75);
        break;
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0xc4e4285b, Offset: 0x5cf0
// Size: 0x1e2
function function_5ebfd8cc() {
    if (!isdefined(self.model)) {
        return;
    }
    switch (self.model) {
    case #"hash_4b80250fb5dabe8d":
        self.origin += (0, 0, 4);
        break;
    case #"hash_23a5f9a86747c06e":
        self.origin += (0, 0, 4);
        break;
    case #"hash_610103e5b898f507":
        self.origin += (0, 0, -2);
        break;
    case #"hash_15c8d8d59a771d41":
    case #"hash_3dabd96b7684e947":
    case #"hash_5ecac889d056f331":
    case #"hash_5fc7ee5c69212e50":
    case #"hash_796f6395f5856ff1":
        self.origin += (0, 0, -2);
        self.angles += (0, 90, 0);
        break;
    case #"hash_727faa4539faa0b7":
        self.origin -= vectornormalize(anglestoforward(self.angles)) * 10;
        break;
    case #"hash_4d42f402f7b6780f":
        self.origin += (0, 0, -4);
        break;
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x32bbfb9a, Offset: 0x5ee0
// Size: 0x8c
function function_be75ebf0() {
    self endon(#"death");
    self.var_526e7ad6 scene::play(#"p9_sur_machine_rocket_01_legs_goo_bundle", "06_rise", self.var_526e7ad6);
    self.var_526e7ad6 thread scene::play(#"p9_sur_machine_rocket_01_legs_goo_bundle", "06_loop", self.var_526e7ad6);
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x0
// Checksum 0x99e31c50, Offset: 0x5f78
// Size: 0x140
function function_71e7b72b() {
    foreach (player in getplayers()) {
        player thread namespace_77bd50da::function_cc8342e0(#"hash_763038398b0e6b59", 4);
    }
    wait(4.5);
    foreach (player in getplayers()) {
        player thread namespace_77bd50da::function_cc8342e0(#"hash_113ad5247404dc08", 3);
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 2, eflags: 0x2 linked
// Checksum 0x1f6c19e, Offset: 0x60c0
// Size: 0xd8
function function_b5770dda(instance, var_c2323ea4) {
    instance endon(#"objective_ended");
    slots = namespace_85745671::function_bdb2b85b(self, self.origin + (0, 0, 16), self.angles, 42, var_c2323ea4, 16);
    if (!isdefined(slots) || slots.size <= 0) {
        return;
    }
    self.var_b79a8ac7 = {#var_f019ea1a:2000, #slots:slots};
    level.attackables[level.attackables.size] = self;
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x8d84f3b0, Offset: 0x61a0
// Size: 0x1b4
function function_b5a08eb6(instance) {
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    instance waittill(#"summon");
    if (isdefined(self.var_cef46557)) {
        self.var_cef46557 function_619a5c20();
        self.var_2edbcbd0 = util::spawn_model("tag_origin", self.origin + (0, 0, 40));
        self.var_2edbcbd0 linkto(self.var_cef46557);
        self.var_e23c5c1d = util::spawn_model("tag_origin", self.origin + (0, 0, 40));
        self.var_e23c5c1d linkto(self.var_cef46557);
    }
    self function_841b1bf7();
    self.n_objective_id = zm_utility::function_f5a222a8(self.var_805ed574, self.var_2edbcbd0);
    self.var_3310aa30 = zm_utility::function_f5a222a8(self.var_40b668de, self.var_e23c5c1d);
    self function_619a5c20();
    objective_setinvisibletoall(self.var_3310aa30);
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x90782bb2, Offset: 0x6360
// Size: 0x184
function function_66e7dd13() {
    self notify("61fc7fb0a3818019");
    self endon("61fc7fb0a3818019");
    self endon(#"death");
    while (is_true(self.is_damaged)) {
        if (isdefined(self.n_objective_id) && isdefined(self.var_3310aa30)) {
            objective_setinvisibletoall(self.n_objective_id);
            objective_setvisibletoall(self.var_3310aa30);
        }
        if (is_true(self.var_8ccbea19)) {
            break;
        }
        wait(0.25);
        if (isdefined(self.n_objective_id) && isdefined(self.var_3310aa30)) {
            objective_setvisibletoall(self.n_objective_id);
            objective_setinvisibletoall(self.var_3310aa30);
        }
        if (is_true(self.var_8ccbea19)) {
            break;
        }
        wait(0.25);
    }
    if (isdefined(self.n_objective_id) && isdefined(self.var_3310aa30)) {
        objective_setvisibletoall(self.n_objective_id);
        objective_setinvisibletoall(self.var_3310aa30);
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x4951ee29, Offset: 0x64f0
// Size: 0xa2
function function_841b1bf7() {
    switch (self.n_id) {
    case 0:
        self.var_805ed574 = #"hash_123b41efdf89a905";
        self.var_40b668de = #"hash_10aad6396fb6a105";
        break;
    case 1:
        self.var_805ed574 = #"hash_123b3eefdf89a3ec";
        self.var_40b668de = #"hash_2431081cacf194b8";
        break;
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0xfbe8b895, Offset: 0x65a0
// Size: 0xa4
function function_b70e2a37() {
    self waittill(#"death", #"destroyed", #"secured");
    if (isdefined(self.n_objective_id)) {
        objective_delete(self.n_objective_id);
    }
    namespace_85745671::function_b70e2a37(self);
    if (isdefined(self.var_2edbcbd0)) {
        self.var_2edbcbd0 delete();
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x11872470, Offset: 0x6650
// Size: 0x8e
function function_7cfc417a(instance) {
    instance waittill(#"objective_ended");
    namespace_85745671::function_b70e2a37(self);
    if (!instance.success) {
        self notify(#"destroyed");
        self thread function_84ccd16c();
        return;
    }
    self notify(#"secured");
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0xfb2a371, Offset: 0x66e8
// Size: 0xf0
function function_f5087df2() {
    self waittill(#"objective_ended");
    foreach (player in getplayers()) {
        level.var_31028c5d prototype_hud::function_817e4d10(player, 0);
        if (level.sr_objective_secure_hud sr_objective_secure_hud::is_open(player)) {
            level.sr_objective_secure_hud sr_objective_secure_hud::close(player);
        }
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x7652009, Offset: 0x67e0
// Size: 0x74
function function_84ccd16c() {
    self playrumbleonentity("sr_prototype_generator_explosion");
    self playsound(#"hash_438a231b8ad66b41");
    wait(0.1);
    if (isdefined(self.mdl_fx)) {
        self.mdl_fx delete();
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 2, eflags: 0x2 linked
// Checksum 0x49024719, Offset: 0x6860
// Size: 0x186
function function_18caf292(n_id, var_c3a3ae13) {
    foreach (player in getplayers()) {
        if (!level.sr_objective_secure_hud sr_objective_secure_hud::is_open(player)) {
            level.sr_objective_secure_hud sr_objective_secure_hud::open(player);
        }
        switch (n_id) {
        case 0:
            level.sr_objective_secure_hud sr_objective_secure_hud::function_3b1f1b69(player, var_c3a3ae13);
            level.sr_objective_secure_hud sr_objective_secure_hud::function_d2f341fe(player, 0);
            break;
        case 1:
            level.sr_objective_secure_hud sr_objective_secure_hud::function_a1cd68d0(player, var_c3a3ae13);
            level.sr_objective_secure_hud sr_objective_secure_hud::function_e4a4e561(player, 0);
            break;
        }
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x8f3018fe, Offset: 0x69f0
// Size: 0x1fc
function function_1ee78771(instance) {
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    self endon(#"secured");
    self val::set("drop", "takedamage", 0);
    self waittill(#"landed");
    self val::reset("drop", "takedamage");
    self.is_damaged = 0;
    self.health = 3000;
    self.max_health = 3000;
    self.n_start_health = self.health;
    self val::set("droppod", "takedamage", 1);
    while (true) {
        s_result = self waittill(#"damage");
        if (isdefined(s_result.attacker) && !isplayer(s_result.attacker)) {
            var_c3a3ae13 = self.health / self.n_start_health;
            if (var_c3a3ae13 < 0) {
                var_c3a3ae13 = 0;
            }
            function_18caf292(self.n_id, var_c3a3ae13);
        }
        if (self.health <= 1) {
            break;
        }
    }
    self notify(#"destroyed");
    instance notify(#"destroyed");
    objective_manager::objective_ended(instance, 0);
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x9a6f9b8a, Offset: 0x6bf8
// Size: 0x104
function on_dog_killed(*params) {
    if (isdefined(self)) {
        v_org = self.origin;
        var_7ecdee63 = self.aitype;
    } else {
        return;
    }
    var_bf189694 = getentarray("drop_pod", "targetname");
    var_954ec1b6 = array::get_all_closest(v_org, var_bf189694)[0];
    if (var_7ecdee63 === #"hash_7a8b592728eec95d" && isdefined(var_954ec1b6)) {
        if (distance2dsquared(v_org, var_954ec1b6.origin) <= 40000) {
            var_954ec1b6 dodamage(100, var_954ec1b6.origin);
        }
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0xdb9cf8ca, Offset: 0x6d08
// Size: 0xce
function function_814c0e69(instance) {
    instance endon(#"objective_ended", #"hash_8202877a3aadac8");
    self endon(#"death");
    n_inc = 0;
    self.is_damaged = 1;
    self thread function_66e7dd13();
    while (n_inc < 3) {
        if (isdefined(self)) {
            self playsound(#"hash_40c9587f10b04801");
        }
        wait(0.5);
        n_inc++;
    }
    wait(3);
    self.is_damaged = 0;
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 2, eflags: 0x2 linked
// Checksum 0x5b1c6d8, Offset: 0x6de0
// Size: 0x3d8
function function_fb9dff2f(instance, activator) {
    if (isplayer(activator)) {
        instance.n_timeout = function_36585ff1();
        instance notify(#"hash_20dcff0079f189f3");
        instance thread function_782f0d1f();
        instance thread function_8b062964();
        instance thread function_f5087df2();
        instance thread function_17f1d0f3();
        instance thread function_ddb668e6();
        instance thread namespace_7589cf5c::function_f10301b0();
        foreach (player in getplayers()) {
            level.var_31028c5d prototype_hud::function_7491d6c5(player, #"hash_691ec119979cba95");
        }
        instance waittill(#"summon");
        foreach (player in getplayers()) {
            level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_691ec119979cba95");
            level.var_31028c5d prototype_hud::function_817e4d10(player, 2);
            if (!level.sr_objective_secure_hud sr_objective_secure_hud::is_open(player)) {
                level.sr_objective_secure_hud sr_objective_secure_hud::open(player);
            }
            level.sr_objective_secure_hud sr_objective_secure_hud::function_3b1f1b69(player, 1);
            level.sr_objective_secure_hud sr_objective_secure_hud::function_a1cd68d0(player, 1);
        }
        level clientfield::set("" + #"hash_71f053fa597abb52", 0);
        while (true) {
            if (is_true(instance.var_5b071610)) {
                break;
            }
            wait(1);
        }
        foreach (player in getplayers()) {
            level.var_31028c5d prototype_hud::set_active_objective_string(player, #"hash_1201ff20897597a2");
        }
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x43995f3c, Offset: 0x71c0
// Size: 0xd4
function function_782f0d1f() {
    var_cdce8e6f = self.contentgroups[#"hash_5819d8571ea7c838"][0];
    if (isdefined(var_cdce8e6f.script_noteworthy)) {
        self flag::set(#"hash_12988a5a3e6a65d6");
        level.var_97e461d4 = var_cdce8e6f.script_noteworthy;
    }
    self waittill(#"objective_ended");
    if (self flag::get(#"hash_12988a5a3e6a65d6")) {
        level.var_97e461d4 = undefined;
        self flag::clear(#"hash_12988a5a3e6a65d6");
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x66da8ae3, Offset: 0x72a0
// Size: 0x60
function function_c36cb7b1(*params) {
    if (isdefined(level.contentmanager.activeobjective) && level.contentmanager.activeobjective.var_b803db9c) {
        level.contentmanager.activeobjective.var_b803db9c--;
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x3f2a15b5, Offset: 0x7308
// Size: 0x218
function on_ai_killed(*params) {
    if (self.aitype !== #"hash_7a8b592728eec95d" && self.aitype !== #"hash_12a17ab3df5889eb" && self.team === level.zombie_team) {
        var_bf189694 = getentarray("drop_pod", "targetname");
        if (isdefined(var_bf189694)) {
            var_954ec1b6 = array::get_all_closest(self.origin, var_bf189694)[0];
            if (isdefined(var_954ec1b6) && isdefined(self)) {
                n_dist = distance2dsquared(self.origin, var_954ec1b6.origin);
            }
            if (isdefined(n_dist) && isdefined(self) && isdefined(var_954ec1b6) && !is_true(var_954ec1b6.var_fcd0c6d7) && n_dist <= 160000 && is_true(var_954ec1b6.is_active) && !is_true(var_954ec1b6.var_abe43927)) {
                var_954ec1b6.n_kills++;
                if (isdefined(self.e_marker)) {
                    self.e_marker delete();
                }
                if (isdefined(self)) {
                    self clientfield::set("" + #"hash_5342c00e940ad12b", 1);
                }
                wait(0.95);
                if (isdefined(var_954ec1b6)) {
                    var_954ec1b6 notify(#"capture");
                }
            }
        }
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x0
// Checksum 0xd0bee265, Offset: 0x7528
// Size: 0x32e
function function_b769e108(instance) {
    instance endon(#"objective_ended");
    self endon(#"death");
    a_zombies = function_a38db454(self.origin, 1000);
    foreach (zombie in a_zombies) {
        if (zombie.archetype === #"zombie") {
            zombie.knockdown = 1;
            zombie.knockdown_type = "knockdown_shoved";
            var_7d6a995e = self.origin - zombie.origin;
            var_1040735c = vectornormalize((var_7d6a995e[0], var_7d6a995e[1], 0));
            zombie_forward = anglestoforward(zombie.angles);
            zombie_forward_2d = vectornormalize((zombie_forward[0], zombie_forward[1], 0));
            zombie_right = anglestoright(zombie.angles);
            zombie_right_2d = vectornormalize((zombie_right[0], zombie_right[1], 0));
            dot = vectordot(var_1040735c, zombie_forward_2d);
            if (dot >= 0.5) {
                zombie.knockdown_direction = "front";
                zombie.getup_direction = "getup_back";
                continue;
            }
            if (dot < 0.5 && dot > -0.5) {
                dot = vectordot(var_1040735c, zombie_right_2d);
                if (dot > 0) {
                    zombie.knockdown_direction = "right";
                    if (math::cointoss()) {
                        zombie.getup_direction = "getup_back";
                    } else {
                        zombie.getup_direction = "getup_belly";
                    }
                } else {
                    zombie.knockdown_direction = "left";
                    zombie.getup_direction = "getup_belly";
                }
                continue;
            }
            zombie.knockdown_direction = "back";
            zombie.getup_direction = "getup_belly";
        }
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x2 linked
// Checksum 0x97235519, Offset: 0x7860
// Size: 0xd8
function function_c6f443c5() {
    self endon(#"death");
    a_zombies = function_a38db454(self.origin, 500);
    foreach (zombie in a_zombies) {
        if (isalive(zombie)) {
            self thread function_912eedf3(zombie);
        }
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x5dd333e8, Offset: 0x7940
// Size: 0x1c4
function function_912eedf3(zombie) {
    self endon(#"death");
    zombie endon(#"death");
    if (isdefined(zombie) && zombie.var_6f84b820 === #"normal") {
        v_dir = vectornormalize(zombie.origin - self.origin);
        v_launch = v_dir * randomintrange(100, 150) + (0, 0, 150);
        zombie.allowdeath = 1;
        if (isalive(zombie) && !zombie isragdoll()) {
            if (zm_utility::is_magic_bullet_shield_enabled(zombie)) {
                zombie util::stop_magic_bullet_shield();
            }
            zombie zm_utility::start_ragdoll();
            waitframe(2);
            zombie launchragdoll(v_launch);
            if (isalive(zombie)) {
                if (zm_utility::is_magic_bullet_shield_enabled(zombie)) {
                    zombie util::stop_magic_bullet_shield();
                }
                zombie kill();
            }
        }
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x71d90f12, Offset: 0x7b10
// Size: 0x1f8
function function_d210b81a(instance) {
    instance endon(#"objective_ended");
    self endon(#"death");
    a_players = getplayers(undefined, self.origin, 100);
    a_s_pts = namespace_85745671::function_e4791424(self.origin, 20, 100, 250, 200);
    foreach (player in a_players) {
        if (isdefined(a_s_pts) && isdefined(player)) {
            while (true) {
                s_pt = array::random(a_s_pts);
                if (!positionwouldtelefrag(s_pt.origin)) {
                    player setorigin(s_pt.origin);
                    break;
                }
                waitframe(1);
            }
            continue;
        }
        v_pos = self.origin + (randomintrangeinclusive(50, 100), randomintrangeinclusive(50, 100), 100);
        if (isdefined(v_pos)) {
            player setorigin(v_pos);
        }
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0xfd74505d, Offset: 0x7d10
// Size: 0x150
function function_f3a8336e(instance) {
    instance endon(#"objective_ended");
    self endon(#"death");
    a_turrets = getentarray("dynamic_spawn_ai", "targetname");
    foreach (turret in a_turrets) {
        if (isdefined(turret) && distance2dsquared(self.origin, turret.origin) <= 40000) {
            turret val::set("rocket_landing", "takedamage", 1);
            turret dodamage(5000, self.origin);
        }
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0x211be2ee, Offset: 0x7e68
// Size: 0x112
function clear_vehicles(instance) {
    instance endon(#"objective_ended");
    self endon(#"death");
    var_453e0a89 = getvehiclearray();
    var_453e0a89 = array::get_all_closest(self.origin, var_453e0a89);
    a_ents = getentitiesinradius(self.origin, 200);
    for (i = 0; i < var_453e0a89.size; i++) {
        if (distance2dsquared(self.origin, var_453e0a89[i].origin) <= 160000) {
            var_453e0a89[i] thread function_81d3631c(self);
            waitframe(1);
        }
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 1, eflags: 0x2 linked
// Checksum 0xcdfee7a9, Offset: 0x7f88
// Size: 0x1ac
function function_81d3631c(*mdl_console) {
    self endon(#"death");
    self playrumbleonentity("sr_transmitter_clear");
    self makevehicleunusable();
    a_occupants = self getvehoccupants();
    foreach (occupant in a_occupants) {
        if (isdefined(occupant)) {
            occupant unlink();
        }
    }
    if (isdefined(self)) {
        self clientfield::increment("" + #"vehicle_teleport");
        wait(1.9);
        if (isdefined(self.v_org)) {
            self.origin = self.v_org;
            if (isdefined(self.v_ang)) {
                self.angles = self.v_ang;
            }
            waitframe(1);
            if (isdefined(self)) {
                self makevehicleusable();
            }
            return;
        }
        self delete();
    }
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x0
// Checksum 0xe875ac66, Offset: 0x8140
// Size: 0x3c
function zombie_count() {
    self waittill(#"objective_ended");
    iprintlnbold("Zombies Spawned: " + level.var_da90ed03);
}

// Namespace namespace_24fd6413/namespace_24fd6413
// Params 0, eflags: 0x0
// Checksum 0xb50f6a80, Offset: 0x8188
// Size: 0x10
function function_9574beec() {
    level.var_da90ed03++;
}

