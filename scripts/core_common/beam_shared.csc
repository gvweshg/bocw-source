// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\util_shared.csc;

#namespace beam;

// Namespace beam/beam_shared
// Params 6, eflags: 0x0
// Checksum 0xf9ac3a48, Offset: 0x98
// Size: 0x1c0
function launch(ent_1, str_tag1, ent_2, str_tag2, str_beam_type, var_ee0708f0) {
    s_beam = _get_beam(ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
    if (!isdefined(s_beam)) {
        s_beam = _new_beam(ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
    }
    if (self == level) {
        if (isdefined(level.localplayers)) {
            foreach (player in level.localplayers) {
                if (isdefined(player)) {
                    beam_id = player launch(ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
                    if (!is_true(var_ee0708f0)) {
                        return beam_id;
                    }
                }
            }
        }
        return;
    }
    if (isdefined(s_beam)) {
        s_beam.beam_id = beamlaunch(self.localclientnum, ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
        self thread _kill_on_ent_death(self.localclientnum, s_beam, ent_1, ent_2);
        return s_beam.beam_id;
    }
}

// Namespace beam/beam_shared
// Params 6, eflags: 0x0
// Checksum 0xd9a190b, Offset: 0x260
// Size: 0xe4
function function_cfb2f62a(localclientnum, ent_1, str_tag1, ent_2, str_tag2, str_beam_type) {
    s_beam = _get_beam(ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
    if (!isdefined(s_beam)) {
        s_beam = _new_beam(ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
    }
    if (isdefined(s_beam)) {
        s_beam.beam_id = beamlaunch(localclientnum, ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
        self thread _kill_on_ent_death(localclientnum, s_beam, ent_1, ent_2);
        return s_beam.beam_id;
    }
    return -1;
}

// Namespace beam/beam_shared
// Params 5, eflags: 0x0
// Checksum 0x20f1b916, Offset: 0x350
// Size: 0x174
function kill(ent_1, str_tag1, ent_2, str_tag2, str_beam_type) {
    if (isdefined(self.active_beams)) {
        s_beam = _get_beam(ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
        arrayremovevalue(self.active_beams, s_beam, 0);
    }
    if (self == level) {
        if (isdefined(level.localplayers)) {
            foreach (player in level.localplayers) {
                if (isdefined(player)) {
                    player kill(ent_1, str_tag1, ent_2, str_tag2, str_beam_type);
                }
            }
        }
        return;
    }
    if (isdefined(s_beam)) {
        s_beam notify(#"kill");
        beamkill(self.localclientnum, s_beam.beam_id);
    }
}

// Namespace beam/beam_shared
// Params 3, eflags: 0x0
// Checksum 0x7255f366, Offset: 0x4d0
// Size: 0xb4
function function_47deed80(localclientnum, beam_id, var_33b99e6 = level) {
    if (isdefined(var_33b99e6.active_beams)) {
        s_beam = function_1c0feeb0(beam_id, var_33b99e6);
        arrayremovevalue(var_33b99e6.active_beams, s_beam, 0);
    }
    if (isdefined(s_beam)) {
        s_beam notify(#"kill");
        beamkill(localclientnum, s_beam.beam_id);
    }
}

// Namespace beam/beam_shared
// Params 5, eflags: 0x4
// Checksum 0x4d471582, Offset: 0x590
// Size: 0x108
function private _new_beam(ent_1, str_tag1, ent_2, str_tag2, str_beam_type) {
    if (!isdefined(self.active_beams)) {
        self.active_beams = [];
    }
    s_beam = spawnstruct();
    s_beam.ent_1 = ent_1;
    s_beam.str_tag1 = str_tag1;
    s_beam.ent_2 = ent_2;
    s_beam.str_tag2 = str_tag2;
    s_beam.str_beam_type = str_beam_type;
    if (!isdefined(self.active_beams)) {
        self.active_beams = [];
    } else if (!isarray(self.active_beams)) {
        self.active_beams = array(self.active_beams);
    }
    self.active_beams[self.active_beams.size] = s_beam;
    return s_beam;
}

// Namespace beam/beam_shared
// Params 5, eflags: 0x4
// Checksum 0xf762226b, Offset: 0x6a0
// Size: 0x110
function private _get_beam(ent_1, str_tag1, ent_2, str_tag2, str_beam_type) {
    if (isdefined(self.active_beams)) {
        foreach (s_beam in self.active_beams) {
            if (s_beam.ent_1 === ent_1 && s_beam.str_tag1 === str_tag1 && s_beam.ent_2 === ent_2 && s_beam.str_tag2 === str_tag2 && s_beam.str_beam_type === str_beam_type) {
                return s_beam;
            }
        }
    }
}

// Namespace beam/beam_shared
// Params 2, eflags: 0x4
// Checksum 0x65d483ed, Offset: 0x7b8
// Size: 0xbe
function private function_1c0feeb0(beam_id, var_33b99e6 = level) {
    if (isdefined(var_33b99e6.active_beams)) {
        foreach (s_beam in var_33b99e6.active_beams) {
            if (s_beam.beam_id === beam_id) {
                return s_beam;
            }
        }
    }
}

// Namespace beam/beam_shared
// Params 4, eflags: 0x4
// Checksum 0x92adfc0e, Offset: 0x880
// Size: 0xac
function private _kill_on_ent_death(localclientnum, s_beam, ent_1, ent_2) {
    s_beam endon(#"kill");
    util::waittill_any_ents(ent_1, "death", ent_2, "death");
    if (isdefined(self)) {
        arrayremovevalue(self.active_beams, s_beam, 0);
        beamkill(localclientnum, s_beam.beam_id);
    }
}

