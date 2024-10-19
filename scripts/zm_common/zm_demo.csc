// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_demo;

// Namespace zm_demo/zm_demo
// Params 0, eflags: 0x5
// Checksum 0x1587160e, Offset: 0xe8
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"zm_demo", &preinit, undefined, undefined, undefined);
}

// Namespace zm_demo/zm_demo
// Params 0, eflags: 0x6 linked
// Checksum 0xf12c2de1, Offset: 0x130
// Size: 0x54
function private preinit() {
    if (isdemoplaying()) {
        if (!isdefined(level.demolocalclients)) {
            level.demolocalclients = [];
        }
        callback::on_localclient_connect(&player_on_connect);
    }
}

// Namespace zm_demo/zm_demo
// Params 1, eflags: 0x2 linked
// Checksum 0x35966292, Offset: 0x190
// Size: 0x24
function player_on_connect(localclientnum) {
    level thread watch_predicted_player_changes(localclientnum);
}

// Namespace zm_demo/zm_demo
// Params 1, eflags: 0x2 linked
// Checksum 0xdcc83561, Offset: 0x1c0
// Size: 0x278
function watch_predicted_player_changes(localclientnum) {
    level.demolocalclients[localclientnum] = spawnstruct();
    level.demolocalclients[localclientnum].nonpredicted_local_player = function_27673a7(localclientnum);
    level.demolocalclients[localclientnum].predicted_local_player = function_5c10bd79(localclientnum);
    while (true) {
        nonpredicted_local_player = function_27673a7(localclientnum);
        predicted_local_player = function_5c10bd79(localclientnum);
        if (nonpredicted_local_player !== level.demolocalclients[localclientnum].nonpredicted_local_player) {
            level notify(#"demo_nplplayer_change", localclientnum);
            level notify("demo_nplplayer_change" + localclientnum, {#old_player:level.demolocalclients[localclientnum].nonpredicted_local_player, #new_player:nonpredicted_local_player});
            level.demolocalclients[localclientnum].nonpredicted_local_player = nonpredicted_local_player;
        }
        if (predicted_local_player !== level.demolocalclients[localclientnum].predicted_local_player) {
            level notify(#"demo_plplayer_change", {#localclientnum:localclientnum, #old_player:level.demolocalclients[localclientnum].predicted_local_player, #new_player:predicted_local_player});
            level notify("demo_plplayer_change" + localclientnum, {#old_player:level.demolocalclients[localclientnum].predicted_local_player, #new_player:predicted_local_player});
            level.demolocalclients[localclientnum].predicted_local_player = predicted_local_player;
        }
        waitframe(1);
    }
}

