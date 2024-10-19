// Atian COD Tools GSC CW decompiler test
#namespace flowgraph;

// Namespace flowgraph/flowgraph_core
// Params 3, eflags: 0x4
// Checksum 0xfcc5893d, Offset: 0x88
// Size: 0x6c2
function private call_func(func, arg_count, args) {
    switch (arg_count) {
    case 0:
        return self [[ func ]]();
    case 1:
        return self [[ func ]](args[0]);
    case 2:
        return self [[ func ]](args[0], args[1]);
    case 3:
        return self [[ func ]](args[0], args[1], args[2]);
    case 4:
        return self [[ func ]](args[0], args[1], args[2], args[3]);
    case 5:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4]);
    case 6:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5]);
    case 7:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6]);
    case 8:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]);
    case 9:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8]);
    case 10:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9]);
    case 11:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10]);
    case 12:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11]);
    case 13:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12]);
    case 14:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12], args[13]);
    case 15:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12], args[13], args[14]);
    case 16:
        return self [[ func ]](args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], args[10], args[11], args[12], args[13], args[14], args[15]);
    default:
        assertmsg("<unknown string>");
        break;
    }
}

// Namespace flowgraph/flowgraph_core
// Params 1, eflags: 0x4
// Checksum 0xcc8c06e5, Offset: 0x758
// Size: 0x3f6
function private evaluate_constant(input_def) {
    assert(isdefined(input_def.constvalue));
    val = input_def.constvalue;
    switch (input_def.type) {
    case #"fx":
    case #"float":
    case #"weapon":
    case #"int":
    case #"variant":
    case #"scriptbundle":
    case #"xmodel":
    case #"xanim":
    case #"bool":
    case #"soundalias":
    case #"vector":
    case #"string":
        return val;
    case #"entityarray":
        assert(isstruct(val));
        assert(isdefined(val.value));
        assert(isdefined(val.key));
        return getentarray(self.owner.localclientnum, val.value, val.key);
    case #"pathnode":
    case #"spawner":
    case #"ai":
    case #"entity":
    case #"vehicle":
        assert(isstruct(val) || isstring(val));
        if (isstruct(val)) {
            assert(isdefined(val.value));
            assert(isdefined(val.key));
            return getent(self.owner.localclientnum, val.value, val.key);
        } else {
            assert(val == "<unknown string>" || val == "<unknown string>");
            if (val == "self") {
                return self.target;
            } else {
                return self.target.target;
            }
        }
    case #"struct":
    case #"array":
    case #"class":
    case #"null":
    case #"exec":
        assertmsg("<unknown string>");
        return undefined;
    }
    assertmsg("<unknown string>" + input_def.type + "<unknown string>");
    return undefined;
}

// Namespace flowgraph/flowgraph_core
// Params 2, eflags: 0x4
// Checksum 0xbe28ffb7, Offset: 0xb58
// Size: 0x80
function private get_node_output_param_index(node_def, param_name) {
    for (i = 0; i < node_def.outputs.size; i++) {
        if (node_def.outputs[i].name == param_name) {
            return i;
        }
    }
    assertmsg("<unknown string>");
    return -1;
}

// Namespace flowgraph/flowgraph_core
// Params 2, eflags: 0x4
// Checksum 0x48ae6f9e, Offset: 0xbe0
// Size: 0x80
function private get_node_input_param_index(node_def, param_name) {
    for (i = 0; i < node_def.inputs.size; i++) {
        if (node_def.inputs[i].name == param_name) {
            return i;
        }
    }
    assertmsg("<unknown string>");
    return -1;
}

// Namespace flowgraph/flowgraph_core
// Params 1, eflags: 0x4
// Checksum 0x48b46684, Offset: 0xc68
// Size: 0xfc
function private is_auto_exec_node(node_def) {
    if (node_def.nodeclass == #"event") {
        foreach (input_def in node_def.inputs) {
            if (input_def.type == #"exec") {
                if (isdefined(input_def.connections) && input_def.connections.size > 0) {
                    return false;
                }
                continue;
            }
            if (!isdefined(input_def.constvalue)) {
                return false;
            }
        }
        return true;
    }
    return false;
}

// Namespace flowgraph/flowgraph_core
// Params 2, eflags: 0x4
// Checksum 0xbcfa6db2, Offset: 0xd70
// Size: 0x430
function private get_graph_def(graph_name, force_refresh = 0) {
    if (!isdefined(level.flowgraphdefs)) {
        level.flowgraphdefs = [];
    }
    if (isdefined(level.flowgraphdefs[graph_name]) && !force_refresh) {
        return level.flowgraphdefs[graph_name];
    }
    graph_def = getflowgraphdef(graph_name);
    indexed_nodes = [];
    foreach (node in graph_def.nodes) {
        indexed_nodes[node.uuid] = node;
    }
    graph_def.nodes = indexed_nodes;
    foreach (wire_def in graph_def.wires) {
        output_node = graph_def.nodes[wire_def.outputnodeuuid];
        assert(isdefined(output_node), "<unknown string>" + graph_name + "<unknown string>");
        input_node = graph_def.nodes[wire_def.inputnodeuuid];
        assert(isdefined(input_node), "<unknown string>" + graph_name + "<unknown string>");
        output_param_index = get_node_output_param_index(output_node, wire_def.outputparamname);
        input_param_index = get_node_input_param_index(input_node, wire_def.inputparamname);
        output_param = output_node.outputs[output_param_index];
        input_param = input_node.inputs[input_param_index];
        if (!isdefined(output_param.connections)) {
            output_param.connections = [];
        }
        if (!isdefined(input_param.connections)) {
            input_param.connections = [];
        }
        output_link = spawnstruct();
        output_link.node = input_node;
        output_link.paramindex = input_param_index;
        output_param.connections[output_param.connections.size] = output_link;
        input_link = spawnstruct();
        input_link.node = output_node;
        input_link.paramindex = output_param_index;
        input_param.connections[input_param.connections.size] = input_link;
    }
    graph_def.wires = undefined;
    foreach (node in graph_def.nodes) {
        node.is_auto_exec = is_auto_exec_node(node);
    }
    level.flowgraphdefs[graph_name] = graph_def;
    return graph_def;
}

// Namespace flowgraph/flowgraph_core
// Params 0, eflags: 0x4
// Checksum 0x4960d3ff, Offset: 0x11a8
// Size: 0x7a
function private collect_outputs() {
    if (self.def.nodeclass == #"data" && self.evaluation_key != self.owner.evaluation_key) {
        self exec();
        self.evaluation_key = self.owner.evaluation_key;
    }
    return self.outputs;
}

// Namespace flowgraph/flowgraph_core
// Params 0, eflags: 0x4
// Checksum 0xab574017, Offset: 0x1230
// Size: 0xe4
function private exec() {
    /#
        level endon(#"flowgraph_mychanges");
    #/
    if (self.def.nodeclass != #"thread") {
        self notify(#"kill_previous_exec");
        self endon(#"kill_previous_exec");
    }
    inputs = self collect_inputs();
    outputs = self call_func(self.def.func, self.def.inputs.size, inputs);
    if (isdefined(outputs)) {
        self kick(outputs);
    }
}

/#

    // Namespace flowgraph/flowgraph_core
    // Params 0, eflags: 0x4
    // Checksum 0x3553748e, Offset: 0x1320
    // Size: 0xd4
    function private mychanges_watcher() {
        if (self.target != level) {
            self.target endon(#"death");
            self.target endon(#"delete");
        }
        level waittill(#"flowgraph_mychanges");
        get_graph_def(self.def.name, 1);
        self.target run({#localclientnum:self.localclientnum, #flowgraph_asset:self.def.name});
    }

#/

// Namespace flowgraph/flowgraph_core
// Params 2, eflags: 0x0
// Checksum 0x71d027d3, Offset: 0x1400
// Size: 0x2a0
function kick(outputs = [], block = 0) {
    if (!isarray(outputs)) {
        outputs = array(outputs);
    }
    assert(isarray(outputs), "<unknown string>" + self.def.uuid + "<unknown string>");
    assert(outputs.size == self.def.outputs.size, "<unknown string>" + self.def.uuid + "<unknown string>" + self.def.outputs.size + "<unknown string>");
    self.outputs = outputs;
    for (i = 0; i < self.def.outputs.size; i++) {
        output_def = self.def.outputs[i];
        if (output_def.type == #"exec" && self.outputs[i] && isdefined(output_def.connections)) {
            foreach (connection_def in output_def.connections) {
                self.owner.evaluation_key++;
                node_inst = self.owner.nodes[connection_def.node.uuid];
                if (block) {
                    node_inst exec();
                    continue;
                }
                node_inst thread exec();
            }
        }
    }
}

// Namespace flowgraph/flowgraph_core
// Params 0, eflags: 0x0
// Checksum 0x26c785a, Offset: 0x16a8
// Size: 0x2ec
function collect_inputs() {
    inputs = [];
    input_index = 0;
    foreach (input_def in self.def.inputs) {
        if (isdefined(input_def.constvalue)) {
            inputs[input_index] = self evaluate_constant(input_def);
        } else if (isdefined(input_def.connections)) {
            if (input_def.type == #"exec") {
                result = 0;
                foreach (connection_def in input_def.connections) {
                    node_inst = self.owner.nodes[connection_def.node.uuid];
                    outputs = node_inst collect_outputs();
                    result = result || outputs[connection_def.paramindex];
                }
                inputs[input_index] = result;
            } else {
                assert(input_def.connections.size == 1, "<unknown string>" + input_def.name + "<unknown string>");
                connection_def = input_def.connections[0];
                node_inst = self.owner.nodes[connection_def.node.uuid];
                outputs = node_inst collect_outputs();
                result = outputs[connection_def.paramindex];
                inputs[input_index] = result;
            }
        } else if (input_def.type == #"exec" && self.def.is_auto_exec) {
            inputs[input_index] = 1;
        } else {
            inputs[input_index] = undefined;
        }
        input_index++;
    }
    return inputs;
}

// Namespace flowgraph/flowgraph_run
// Params 1, eflags: 0x20
// Checksum 0xc7517600, Offset: 0x19a0
// Size: 0x278
function event_handler[flowgraph_run] run(eventstruct) {
    graph_def = get_graph_def(eventstruct.flowgraph_asset);
    assert(isdefined(graph_def), "<unknown string>" + eventstruct.flowgraph_asset + "<unknown string>");
    graph_inst = spawnstruct();
    graph_inst.localclientnum = eventstruct.localclientnum;
    graph_inst.def = graph_def;
    graph_inst.nodes = [];
    if (isdefined(self)) {
        graph_inst.target = self;
    } else {
        graph_inst.target = level;
    }
    graph_inst.evaluation_key = 0;
    foreach (node_def in graph_def.nodes) {
        node_inst = spawnstruct();
        node_inst.owner = graph_inst;
        node_inst.def = node_def;
        node_inst.target = graph_inst.target;
        node_inst.evaluation_key = 0;
        graph_inst.nodes[node_inst.def.uuid] = node_inst;
    }
    foreach (node_inst in graph_inst.nodes) {
        if (node_inst.def.is_auto_exec) {
            node_inst thread exec();
        }
    }
    /#
        graph_inst thread mychanges_watcher();
    #/
    graph_inst notify(#"flowgraph_run");
}

