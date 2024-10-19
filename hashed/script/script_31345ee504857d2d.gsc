// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\ai\systems\behavior_tree_utility.gsc;
#using scripts\core_common\ai\systems\behavior_state_machine.gsc;

#namespace aiinteractables;

// Namespace aiinteractables/ai_interactables
// Params 0, eflags: 0x5
// Checksum 0xc682091b, Offset: 0xb8
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"ai_interactables", &preinit, undefined, undefined, undefined);
}

// Namespace aiinteractables/ai_interactables
// Params 0, eflags: 0x6 linked
// Checksum 0xfbb6b468, Offset: 0x100
// Size: 0x14c
function private preinit() {
    assert(isscriptfunctionptr(&function_64d25a18));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_57181cf80bd4059f", &function_64d25a18);
    assert(isscriptfunctionptr(&function_64d25a18));
    behaviorstatemachine::registerbsmscriptapiinternal(#"hash_57181cf80bd4059f", &function_64d25a18);
    assert(isscriptfunctionptr(&function_b4bc7751));
    behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6ef372b4649a577e", &function_b4bc7751);
    thread function_2f0f1b62();
}

// Namespace aiinteractables/ai_interactables
// Params 0, eflags: 0x6 linked
// Checksum 0x73b1426a, Offset: 0x258
// Size: 0x120
function private function_2f0f1b62() {
    nodes = getallnodes();
    foreach (node in nodes) {
        if (is_true(node.interact_node) && isdefined(node.target)) {
            if (is_true(node.var_71c87324)) {
                continue;
            }
            var_54d06303 = struct::get(node.target);
            if (isdefined(var_54d06303)) {
                var_54d06303 scene::init();
            }
        }
    }
}

// Namespace aiinteractables/ai_interactables
// Params 1, eflags: 0x2 linked
// Checksum 0x4adaf794, Offset: 0x380
// Size: 0xc0
function function_64d25a18(entity) {
    if (entity.archetype !== #"human") {
        return false;
    }
    if (!isdefined(entity.node)) {
        return false;
    }
    if (!iscovernode(entity.node)) {
        return false;
    }
    if (!entity isatcovernode()) {
        return false;
    }
    if (!is_true(entity.node.interact_node)) {
        return false;
    }
    if (isdefined(entity.node.var_31c05612)) {
        return false;
    }
    return true;
}

// Namespace aiinteractables/ai_interactables
// Params 1, eflags: 0x6 linked
// Checksum 0x87baae47, Offset: 0x448
// Size: 0x158
function private function_b4bc7751(entity) {
    assert(!is_true(entity.node.var_31c05612));
    if (isdefined(entity.node.target)) {
        entity pathmode("move delayed", 8);
        entity.node.var_31c05612 = 1;
        var_54d06303 = struct::get(entity.node.target);
        var_54d06303 scene::play(entity);
        var_54d06303 notify(#"hash_4d2293524fe1c94c", {#ai_interactable:entity});
        if (isalive(entity)) {
            entity notify(#"hash_4d2293524fe1c94c", {#var_bad0e17c:var_54d06303, #var_c17a3b30:entity.node});
        }
    }
}

