// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\player\player_stats.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\beam_shared.csc;

#namespace namespace_cdc318b3;

// Namespace namespace_cdc318b3/namespace_cdc318b3
// Params 0, eflags: 0x5
// Checksum 0xff04e98, Offset: 0x1c8
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"hash_37fb21afea61a92a", &preinit, undefined, undefined, undefined);
}

// Namespace namespace_cdc318b3/namespace_cdc318b3
// Params 0, eflags: 0x6 linked
// Checksum 0x7439de07, Offset: 0x210
// Size: 0x194
function private preinit() {
    if (!is_true(getgametypesetting(#"hash_3a1bcecdeb68529a")) && !getdvarint(#"hash_5df55c4b5dbbc9c4", 0)) {
        return;
    }
    s_altar = struct::get(#"hash_2e7b29d6d6d6b66f", "content_key");
    if (!isdefined(s_altar)) {
        return;
    }
    clientfield::register("toplayer", "" + #"hash_2373d19d48ebba87", 1, 1, "counter", &function_8452bba2, 0, 0);
    clientfield::register("toplayer", "" + #"hash_3d5368e76a98fadb", 1, 1, "counter", &function_f7aa12ff, 0, 0);
    level.var_b6218854 = [];
    level.var_eb731edb = [];
    level.var_d75ff406 = [];
    callback::on_localplayer_spawned(&function_5e5224f3);
}

// Namespace namespace_cdc318b3/namespace_cdc318b3
// Params 1, eflags: 0x2 linked
// Checksum 0x1b80d885, Offset: 0x3b0
// Size: 0x58c
function function_5e5224f3(localclientnum) {
    if (function_65b9eb0f(localclientnum)) {
        return;
    }
    player = function_5c10bd79(localclientnum);
    if (!isplayer(player)) {
        return;
    }
    player util::waittill_dobj(localclientnum);
    if (!isdefined(player) || player flag::get(#"hash_39fafabacdc6b40f")) {
        return;
    }
    s_altar = struct::get(#"hash_2e7b29d6d6d6b66f", "content_key");
    if (!isdefined(s_altar)) {
        return;
    }
    if (!isdefined(level.var_b6218854[localclientnum])) {
        level.var_b6218854[localclientnum] = util::spawn_model(localclientnum, #"hash_10fbb1986e99145", s_altar.origin, s_altar.angles);
    }
    player.var_213dd9cc = 0;
    var_b6b9cd4b = struct::get_array(#"hash_1d95bf4cdc9a1431", "content_key");
    if (!isdefined(level.var_eb731edb[localclientnum])) {
        level.var_eb731edb[localclientnum] = [];
        foreach (s_struct in var_b6b9cd4b) {
            var_8fe85086 = structcopy(s_struct);
            level.var_eb731edb[localclientnum][var_8fe85086.script_noteworthy] = var_8fe85086;
            var_8fe85086.var_a6ac630 = util::spawn_model(localclientnum, #"hash_242af0c4149dedf3", var_8fe85086.origin, var_8fe85086.angles);
        }
    }
    foreach (var_8fe85086 in level.var_eb731edb[localclientnum]) {
        if (!isdefined(var_8fe85086.var_a6ac630)) {
            var_8fe85086.var_a6ac630 = util::spawn_model(localclientnum, #"hash_242af0c4149dedf3", var_8fe85086.origin, var_8fe85086.angles);
        }
        if (!isdefined(var_8fe85086.b_complete)) {
            str_map = hash(var_8fe85086.script_noteworthy);
            if (str_map === #"wz_forest") {
                var_8fe85086.b_complete = player stats::get_stat(localclientnum, #"playerstatslist", #"hash_172d82afa5eb40a8", #"statvalue");
            } else if (str_map === #"wz_sanatorium") {
                var_8fe85086.b_complete = player stats::get_stat(localclientnum, #"playerstatslist", #"hash_774b3a384fb5ad", #"statvalue");
            } else {
                var_8fe85086.b_complete = player stats::get_stat(localclientnum, #"playerstatsbymap", str_map, #"stats", #"main_quest_completed", #"statvalue");
                if (str_map === #"zm_silver" && !is_true(var_8fe85086.b_complete)) {
                    var_8fe85086.b_complete = player stats::get_stat(localclientnum, #"playerstatslist", #"hash_45419091cdb5f154", #"statvalue");
                }
            }
        }
        if (is_true(var_8fe85086.b_complete)) {
            var_8fe85086 thread function_bf305894(localclientnum);
            player.var_213dd9cc++;
        }
    }
    player thread function_7b3ef3da(localclientnum);
    player flag::set(#"hash_39fafabacdc6b40f");
}

// Namespace namespace_cdc318b3/namespace_cdc318b3
// Params 1, eflags: 0x6 linked
// Checksum 0x6c495296, Offset: 0x948
// Size: 0x3ae
function private function_7b3ef3da(localclientnum) {
    mdl_altar = level.var_b6218854[localclientnum];
    if (!isdefined(mdl_altar)) {
        return;
    }
    if (function_65b9eb0f(localclientnum) || isdefined(self.var_213dd9cc) && self.var_213dd9cc > 1) {
        if (!function_65b9eb0f(localclientnum) && isdefined(self.var_213dd9cc)) {
            var_2b13c8ad = self stats::get_stat(localclientnum, #"hash_2dd2a2b3580dd409", #"rarity_upgrade");
            if (self.var_213dd9cc > 5 && var_2b13c8ad < 3 || self.var_213dd9cc > 3 && var_2b13c8ad < 2 || self.var_213dd9cc > 1 && var_2b13c8ad < 1) {
                var_6370e63e = 1;
                self flag::clear(#"hash_40c349e8efedd336");
                arrayremovevalue(level.var_d75ff406, localclientnum);
            } else if (var_2b13c8ad >= 1) {
                var_6370e63e = 1;
                self flag::set(#"hash_40c349e8efedd336");
                if (!isdefined(level.var_d75ff406)) {
                    level.var_d75ff406 = [];
                } else if (!isarray(level.var_d75ff406)) {
                    level.var_d75ff406 = array(level.var_d75ff406);
                }
                level.var_d75ff406[level.var_d75ff406.size] = localclientnum;
            }
        }
        mdl_altar util::waittill_dobj(localclientnum);
        if (isdefined(mdl_altar)) {
            if (is_true(var_6370e63e)) {
                mdl_altar playrenderoverridebundle(#"hash_89b37e4bb54b8d1");
                mdl_altar.n_fx_id = function_239993de(localclientnum, #"hash_67bbee1c7a6b2504", mdl_altar, "tag_obelisk_altar_out");
                mdl_altar.var_b3673abf = mdl_altar playloopsound(#"hash_44af3369b1a0a4d0");
                self flag::set(#"hash_32ccab010478fd7e");
                return;
            }
            mdl_altar stoprenderoverridebundle(#"hash_89b37e4bb54b8d1");
            if (isdefined(mdl_altar.n_fx_id)) {
                stopfx(localclientnum, mdl_altar.n_fx_id);
                mdl_altar.n_fx_id = undefined;
            }
            if (isdefined(mdl_altar.var_b3673abf)) {
                mdl_altar stoploopsound(mdl_altar.var_b3673abf);
                mdl_altar.var_b3673abf = undefined;
            }
        }
    }
}

// Namespace namespace_cdc318b3/namespace_cdc318b3
// Params 1, eflags: 0x6 linked
// Checksum 0x5eaa6745, Offset: 0xd00
// Size: 0x9a
function private function_bf305894(localclientnum) {
    if (!isdefined(self.var_a6ac630)) {
        return;
    }
    self.var_a6ac630 util::waittill_dobj(localclientnum);
    if (!isdefined(self.var_a6ac630)) {
        return;
    }
    self.var_a6ac630 playrenderoverridebundle(#"hash_8fcdfebeba9cb4c");
    self.var_582af179 = self.var_a6ac630 playloopsound(#"hash_7571657f84ccdfd3");
}

// Namespace namespace_cdc318b3/namespace_cdc318b3
// Params 7, eflags: 0x2 linked
// Checksum 0xa9404a9b, Offset: 0xda8
// Size: 0x33c
function function_f7aa12ff(localclientnum, *oldval, *newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    player = function_5c10bd79(bwastimejump);
    var_cc6df305 = function_27673a7(bwastimejump);
    if (!(isdefined(player) && isdefined(var_cc6df305))) {
        return;
    }
    player endon(#"death");
    player util::waittill_dobj(bwastimejump);
    player playrumbleonentity(bwastimejump, #"buzz_high");
    mdl_altar = level.var_b6218854[bwastimejump];
    if (!isdefined(mdl_altar)) {
        return;
    }
    var_b6b9cd4b = level.var_eb731edb[bwastimejump];
    if (!isdefined(var_b6b9cd4b)) {
        return;
    }
    mdl_altar stoprenderoverridebundle(#"hash_89b37e4bb54b8d1");
    if (isdefined(mdl_altar.n_fx_id)) {
        stopfx(bwastimejump, mdl_altar.n_fx_id);
        mdl_altar.n_fx_id = undefined;
    }
    if (isdefined(mdl_altar.var_b3673abf)) {
        mdl_altar stoploopsound(mdl_altar.var_b3673abf);
        mdl_altar.var_b3673abf = undefined;
    }
    foreach (var_8fe85086 in var_b6b9cd4b) {
        if (isdefined(var_8fe85086.var_582af179)) {
            if (isdefined(var_8fe85086.var_a6ac630)) {
                var_8fe85086.var_a6ac630 stoploopsound(var_8fe85086.var_582af179);
                var_8fe85086.var_582af179 = undefined;
            }
        }
    }
    wait(5);
    foreach (var_8fe85086 in var_b6b9cd4b) {
        if (!isdefined(var_8fe85086.var_582af179)) {
            if (isdefined(var_8fe85086.var_a6ac630)) {
                var_8fe85086.var_582af179 = var_8fe85086.var_a6ac630 playloopsound(#"hash_7571657f84ccdfd3");
            }
        }
    }
    player function_7b3ef3da(bwastimejump);
}

// Namespace namespace_cdc318b3/namespace_cdc318b3
// Params 7, eflags: 0x2 linked
// Checksum 0x7aafeab3, Offset: 0x10f0
// Size: 0xd44
function function_8452bba2(localclientnum, *oldval, *newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    player = function_5c10bd79(bwastimejump);
    var_cc6df305 = function_27673a7(bwastimejump);
    if (!(isdefined(player) && isdefined(var_cc6df305))) {
        return;
    }
    player endon(#"death");
    player util::waittill_dobj(bwastimejump);
    player playrumbleonentity(bwastimejump, #"buzz_high");
    mdl_altar = level.var_b6218854[bwastimejump];
    if (!isdefined(mdl_altar)) {
        return;
    }
    var_b6b9cd4b = level.var_eb731edb[bwastimejump];
    if (!isdefined(var_b6b9cd4b)) {
        return;
    }
    igcactive(bwastimejump, 1);
    mdl_altar endon(#"death");
    var_cc6df305 endoncallback(&function_8a645569, #"death", #"spawned");
    var_cc6df305.var_a683b7d8 = [];
    foreach (var_8fe85086 in var_b6b9cd4b) {
        if (is_true(var_8fe85086.b_complete)) {
            if (!isdefined(var_cc6df305.var_a683b7d8)) {
                var_cc6df305.var_a683b7d8 = [];
            } else if (!isarray(var_cc6df305.var_a683b7d8)) {
                var_cc6df305.var_a683b7d8 = array(var_cc6df305.var_a683b7d8);
            }
            var_cc6df305.var_a683b7d8[var_cc6df305.var_a683b7d8.size] = playfx(bwastimejump, #"hash_777eac32de218666", var_8fe85086.origin, anglestoforward(var_8fe85086.angles), anglestoup(var_8fe85086.angles));
            if (isdefined(var_8fe85086.var_a6ac630)) {
                if (isdefined(var_8fe85086.var_582af179)) {
                    var_8fe85086.var_a6ac630 stoploopsound(var_8fe85086.var_582af179);
                    var_8fe85086.var_582af179 = undefined;
                }
                var_8fe85086.var_a6ac630 playsound(bwastimejump, #"hash_571768ce015cfddf");
            }
            wait(1.3);
            if (isdefined(var_8fe85086.var_a6ac630)) {
                var_8fe85086.var_a6ac630 util::waittill_dobj(bwastimejump);
                var_8fe85086.var_a6ac630 playsound(bwastimejump, #"hash_2caaffe78ba0dc1f");
                var_8fe85086.var_b3673abf = var_8fe85086.var_a6ac630 playloopsound(#"hash_380ce5cb9c80c45c");
                player playrumbleonentity(bwastimejump, #"damage_light");
                earthquake(bwastimejump, 0.5, 2, player.origin, 64, 1);
                var_cc6df305 beam::launch(var_8fe85086.var_a6ac630, "tag_obelisk_pillar_altar", mdl_altar, "tag_obelisk_altar_in", "beam9_zm_event_final_obelisk");
            }
        }
    }
    player playrumblelooponentity(bwastimejump, #"damage_light");
    earthquake(bwastimejump, 0.8, 3, player.origin, 64, 1);
    mdl_altar playrenderoverridebundle(#"hash_4c1c17331a0324ab");
    if (!isdefined(var_cc6df305.var_a683b7d8)) {
        var_cc6df305.var_a683b7d8 = [];
    } else if (!isarray(var_cc6df305.var_a683b7d8)) {
        var_cc6df305.var_a683b7d8 = array(var_cc6df305.var_a683b7d8);
    }
    var_cc6df305.var_a683b7d8[var_cc6df305.var_a683b7d8.size] = function_239993de(bwastimejump, #"hash_7fba016c873f0309", mdl_altar, "tag_obelisk_altar_out");
    wait(1.75);
    playsound(0, #"hash_3ccc5960f394a2d8", mdl_altar.origin);
    postfx::playpostfxbundle(#"hash_7b2435319c82a349");
    wait(2.5);
    var_cc6df305 beam::launch(mdl_altar, "tag_obelisk_altar_out", player, "j_spine4", "beam9_zm_event_final_alter");
    player stoprumble(bwastimejump, #"damage_light");
    player playrumblelooponentity(bwastimejump, #"damage_heavy");
    var_db799a42 = [];
    if (!isdefined(var_db799a42)) {
        var_db799a42 = [];
    } else if (!isarray(var_db799a42)) {
        var_db799a42 = array(var_db799a42);
    }
    var_db799a42[var_db799a42.size] = function_239993de(bwastimejump, #"hash_50990f2f4dfbb5a5", player, "tag_origin");
    if (!isdefined(var_db799a42)) {
        var_db799a42 = [];
    } else if (!isarray(var_db799a42)) {
        var_db799a42 = array(var_db799a42);
    }
    var_db799a42[var_db799a42.size] = function_239993de(bwastimejump, #"hash_3dec9881a320e7e5", player, "j_eyeball_le");
    if (!isdefined(var_db799a42)) {
        var_db799a42 = [];
    } else if (!isarray(var_db799a42)) {
        var_db799a42 = array(var_db799a42);
    }
    var_db799a42[var_db799a42.size] = function_239993de(bwastimejump, #"hash_740e67ff1ebc85fa", player, "j_wrist_le");
    if (!isdefined(var_db799a42)) {
        var_db799a42 = [];
    } else if (!isarray(var_db799a42)) {
        var_db799a42 = array(var_db799a42);
    }
    var_db799a42[var_db799a42.size] = function_239993de(bwastimejump, #"hash_740e49ff1ebc5300", player, "j_wrist_ri");
    wait(4.75);
    var_cc6df305 beam::kill(mdl_altar, "tag_obelisk_altar_out", player, "j_spine4", "beam9_zm_event_final_alter");
    if (isdefined(mdl_altar)) {
        function_239993de(bwastimejump, #"hash_327a08625b10921", mdl_altar, "tag_obelisk_altar_out");
    }
    foreach (n_fx_id in var_cc6df305.var_a683b7d8) {
        if (isdefined(n_fx_id)) {
            stopfx(bwastimejump, n_fx_id);
        }
    }
    foreach (var_8fe85086 in var_b6b9cd4b) {
        if (isdefined(var_8fe85086.var_b3673abf)) {
            if (isdefined(var_8fe85086.var_a6ac630)) {
                var_8fe85086.var_a6ac630 stoploopsound(var_8fe85086.var_b3673abf);
                var_8fe85086.var_b3673abf = undefined;
                var_8fe85086.var_a6ac630 playsound(bwastimejump, #"hash_78c3a540ce6261b5");
            }
        }
        var_cc6df305 beam::kill(var_8fe85086.var_a6ac630, "tag_obelisk_pillar_altar", mdl_altar, "tag_obelisk_altar_in", "beam9_zm_event_final_obelisk");
        if (is_true(var_8fe85086.b_complete)) {
            playfx(bwastimejump, #"hash_60fffe5c494a1e02", var_8fe85086.origin, anglestoforward(var_8fe85086.angles), anglestoup(var_8fe85086.angles));
        }
    }
    wait(0.25);
    postfx::playpostfxbundle(#"hash_7b2435319c82a349");
    foreach (n_fx in var_db799a42) {
        if (isdefined(n_fx)) {
            stopfx(bwastimejump, n_fx);
        }
    }
    mdl_altar stoprenderoverridebundle(#"hash_89b37e4bb54b8d1");
    mdl_altar stoprenderoverridebundle(#"hash_4c1c17331a0324ab");
    if (isdefined(mdl_altar.n_fx_id)) {
        stopfx(bwastimejump, mdl_altar.n_fx_id);
        mdl_altar.n_fx_id = undefined;
    }
    igcactive(bwastimejump, 0);
    player stoprumble(bwastimejump, #"damage_heavy");
    wait(0.25);
    player playrumbleonentity(bwastimejump, #"damage_light");
    wait(5);
    foreach (var_8fe85086 in var_b6b9cd4b) {
        if (!isdefined(var_8fe85086.var_582af179)) {
            if (isdefined(var_8fe85086.var_a6ac630)) {
                var_8fe85086.var_582af179 = var_8fe85086.var_a6ac630 playloopsound(#"hash_7571657f84ccdfd3");
            }
        }
    }
    player function_7b3ef3da(bwastimejump);
}

// Namespace namespace_cdc318b3/namespace_cdc318b3
// Params 0, eflags: 0x2 linked
// Checksum 0xc57dae48, Offset: 0x1e40
// Size: 0x1f4
function function_8a645569() {
    localclientnum = self getlocalclientnumber();
    if (isdefined(localclientnum)) {
        igcactive(localclientnum, 0);
    }
    if (isdefined(localclientnum) && isdefined(self.var_a683b7d8)) {
        foreach (n_fx_id in self.var_a683b7d8) {
            if (isdefined(n_fx_id)) {
                stopfx(localclientnum, n_fx_id);
            }
        }
    }
    if (isdefined(localclientnum) && isdefined(self.active_beams)) {
        foreach (beam in self.active_beams) {
            if (beam.str_beam_type === "beam9_zm_event_final_obelisk" || beam.str_beam_type === "beam9_zm_event_final_alter") {
                arrayremovevalue(self.active_beams, beam, 1);
                beamkill(localclientnum, beam.beam_id);
            }
        }
        arrayremovevalue(self.active_beams, undefined, 0);
    }
}

