// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\vehicles\smart_bomb.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace rcxd;

// Namespace rcxd/rcxd
// Params 0, eflags: 0x5
// Checksum 0x4217fc03, Offset: 0xe8
// Size: 0x3c
function private autoexec __init__system__() {
    system::register(#"rcxd", &preinit, undefined, undefined, undefined);
}

// Namespace rcxd/rcxd
// Params 0, eflags: 0x6 linked
// Checksum 0xa7714acb, Offset: 0x130
// Size: 0x2c
function private preinit() {
    vehicle::add_main_callback("rcxd", &function_91ea9492);
}

// Namespace rcxd/rcxd
// Params 0, eflags: 0x2 linked
// Checksum 0x467511fb, Offset: 0x168
// Size: 0x8c
function function_91ea9492() {
    smart_bomb::function_c6f75619();
    self.detonate_sides_disabled = 1;
    self useanimtree("generic");
    self initsounds();
    if (isdefined(level.vehicle_initializer_cb)) {
        [[ level.vehicle_initializer_cb ]](self);
    }
    defaultrole();
}

// Namespace rcxd/rcxd
// Params 0, eflags: 0x2 linked
// Checksum 0xb9f08ba7, Offset: 0x200
// Size: 0x10c
function defaultrole() {
    self vehicle_ai::init_state_machine_for_role("default");
    self vehicle_ai::get_state_callbacks("combat").update_func = &smart_bomb::state_combat_update;
    self vehicle_ai::get_state_callbacks("driving").update_func = &smart_bomb::state_scripted_update;
    self vehicle_ai::get_state_callbacks("death").update_func = &smart_bomb::state_death_update;
    self vehicle_ai::get_state_callbacks("emped").update_func = &smart_bomb::state_emped_update;
    self vehicle_ai::call_custom_add_state_callbacks();
    vehicle_ai::startinitialstate("combat");
}

// Namespace rcxd/rcxd
// Params 0, eflags: 0x2 linked
// Checksum 0xc2461fe6, Offset: 0x318
// Size: 0x19c
function initsounds() {
    self.sndalias = [];
    self.sndalias[#"inair"] = #"hash_65ec2e5d43b62423";
    self.sndalias[#"land"] = #"hash_26fddc98c4b5aa5a";
    self.sndalias[#"spawn"] = #"hash_1b30b26c406054e2";
    self.sndalias[#"direction"] = #"hash_69f9a2b48dccef90";
    self.sndalias[#"jump_up"] = #"hash_43b08a05140c0ea9";
    self.sndalias[#"vehclose250"] = #"hash_7a70a6fa72ea121";
    self.sndalias[#"vehclose1500"] = #"hash_548fbad0d3c63e20";
    self.sndalias[#"vehtargeting"] = #"hash_29426008ddf3da16";
    self.sndalias[#"vehalarm"] = #"hash_4966894e7ae3a222";
    self.sndalias[#"vehcollision"] = #"veh_wasp_wall_imp";
}

