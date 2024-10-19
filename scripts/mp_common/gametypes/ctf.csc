// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\util_shared.csc;
#using script_13da4e6b98ca81a1;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace ctf;

// Namespace ctf/gametype_init
// Params 1, eflags: 0x20
// Checksum 0x1526fd70, Offset: 0x218
// Size: 0x42c
function event_handler[gametype_init] main(*eventstruct) {
    callback::on_localclient_connect(&on_localclient_connect);
    clientfield::register("scriptmover", "ctf_flag_away", 17000, 1, "int", &setctfaway, 0, 0);
    clientfield::register("scriptmover", "entityModelsNum", 1, 10, "int", &function_e116df6c, 0, 0);
    clientfield::register("scriptmover", "ctf_flag_objid", 17000, 3, "int", &function_93e52efc, 0, 0);
    clientfield::register("allplayers", "ctf_flag_carried", 17000, 1, "int", &function_4db33d0, 0, 1);
    clientfield::function_5b7d846d("CTFLevelInfo.bestTimeAllies", #"hash_2e6d7a783938b052", #"besttimeallies", 17000, 9, "int", undefined, 0, 0);
    clientfield::function_5b7d846d("CTFLevelInfo.bestTimeAxis", #"hash_2e6d7a783938b052", #"besttimeaxis", 17000, 9, "int", undefined, 0, 0);
    clientfield::function_5b7d846d("CTFLevelInfo.flagCarrierAllies", #"hash_2e6d7a783938b052", #"flagcarrierallies", 17000, 7, "int", undefined, 0, 0);
    clientfield::function_5b7d846d("CTFLevelInfo.flagCarrierAxis", #"hash_2e6d7a783938b052", #"flagcarrieraxis", 17000, 7, "int", undefined, 0, 0);
    clientfield::function_5b7d846d("CTFLevelInfo.flagStateAllies", #"hash_2e6d7a783938b052", #"flagstateallies", 17000, 2, "int", undefined, 0, 0);
    clientfield::function_5b7d846d("CTFLevelInfo.flagStateAxis", #"hash_2e6d7a783938b052", #"flagstateaxis", 17000, 2, "int", undefined, 0, 0);
    clientfield::function_5b7d846d("ctf_reset_score", #"hash_2e6d7a783938b052", #"ctf_reset_score", 17000, 1, "int", &ctf_reset_score, 0, 0);
    forcestreamxmodel(#"hash_1f046ad8773b6c3", 8, -1);
    forcestreamxmodel(#"hash_4409a354dd61569e", 8, -1);
    forcestreamxmodel(#"hash_104d7846da83e67e", 8, -1);
    forcestreamxmodel(#"hash_34ce58df766f54dd", 8, -1);
}

// Namespace ctf/ctf
// Params 7, eflags: 0x0
// Checksum 0xed659fb8, Offset: 0x650
// Size: 0xe4
function ctf_reset_score(localclientnum, *oldval, *newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    gamescoremodel = function_1df4c3b0(bwastimejump, #"hash_18f98623d8947fda");
    playerscoremodel = getuimodel(gamescoremodel, "playerScore");
    enemyscoremodel = getuimodel(gamescoremodel, "enemyScore");
    setuimodelvalue(playerscoremodel, 0);
    setuimodelvalue(enemyscoremodel, 0);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x45345659, Offset: 0x740
// Size: 0xac
function on_localclient_connect(localclientnum) {
    level.var_8b7ba196[localclientnum] = util::getnextobjid(localclientnum);
    objective_add(localclientnum, level.var_8b7ba196[localclientnum], "invisible", #"flag_taken", (0, 0, 0), util::get_other_team(function_9b3f0ed1(localclientnum)));
    level thread function_27ecd662(localclientnum);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x9945c53c, Offset: 0x7f8
// Size: 0x21e
function function_27ecd662(localclientnum) {
    player = function_27673a7(localclientnum);
    player endon(#"disconnect");
    while (true) {
        enemies = getplayers(localclientnum);
        player = function_27673a7(localclientnum);
        var_3b68ee3f = undefined;
        foreach (enemy in enemies) {
            if (enemy.team == player.team) {
                continue;
            }
            if (is_true(enemy.var_b0256c7b)) {
                var_3b68ee3f = enemy.origin;
                break;
            }
        }
        if (isdefined(var_3b68ee3f)) {
            var_b13a6419 = gettime();
            objective_setstate(localclientnum, level.var_8b7ba196[localclientnum], "active");
            objective_setposition(localclientnum, level.var_8b7ba196[localclientnum], var_3b68ee3f);
            while (var_b13a6419 + 2000 > gettime() && isdefined(enemy) && enemy.var_b0256c7b) {
                waitframe(1);
            }
            continue;
        }
        objective_setstate(localclientnum, level.var_8b7ba196[localclientnum], "invisible");
        waitframe(1);
    }
}

// Namespace ctf/ctf
// Params 7, eflags: 0x0
// Checksum 0xcc486d7a, Offset: 0xa20
// Size: 0x7c
function setctfaway(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    team = self.team;
    setflagasaway(fieldname, team, bwastimejump);
    self thread clearctfaway(fieldname, team);
}

// Namespace ctf/ctf
// Params 2, eflags: 0x0
// Checksum 0x695320be, Offset: 0xaa8
// Size: 0x44
function clearctfaway(localclientnum, team) {
    self waittill(#"death");
    setflagasaway(localclientnum, team, 0);
}

// Namespace ctf/ctf
// Params 7, eflags: 0x0
// Checksum 0x64bf951b, Offset: 0xaf8
// Size: 0x4a
function function_4db33d0(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    self.var_b0256c7b = bwastimejump;
}

// Namespace ctf/ctf
// Params 7, eflags: 0x0
// Checksum 0x57e5292b, Offset: 0xb50
// Size: 0x104
function function_e116df6c(localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    var_ad3145bb = bwastimejump;
    var_c6523334 = getentbynum(fieldname, var_ad3145bb);
    if (isdefined(var_c6523334)) {
        if (var_c6523334 codcaster::is_friendly(fieldname)) {
            var_c6523334 codcaster::function_89106df8(fieldname, #"hash_2476e7ae62469f70", #"hash_39109749d54991e4", self.team);
            return;
        }
        var_c6523334 codcaster::function_89106df8(fieldname, #"hash_2476eaae6246a489", #"hash_39109a49d54996fd", self.team);
    }
}

// Namespace ctf/ctf
// Params 7, eflags: 0x0
// Checksum 0x702f445b, Offset: 0xc60
// Size: 0x4a
function function_93e52efc(*localclientnum, *oldval, newval, *bnewent, *binitialsnap, *fieldname, *bwastimejump) {
    self.var_3a0b3eac = bwastimejump;
}

