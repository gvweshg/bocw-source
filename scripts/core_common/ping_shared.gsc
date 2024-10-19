// Atian COD Tools GSC CW decompiler test
#namespace ping;

// Namespace ping/ping_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x97207b44, Offset: 0x80
// Size: 0x9c
function function_fed6948(type) {
    switch (type) {
    case 3:
    case 6:
    case 7:
    case 11:
        return -1;
    case 1:
    case 2:
    case 10:
        return -2;
    }
    return undefined;
}

// Namespace ping/ping_shared
// Params 1, eflags: 0x2 linked
// Checksum 0x5afd7302, Offset: 0x128
// Size: 0x42
function function_5947d757(type) {
    return isdefined(function_fed6948(type)) ? function_fed6948(type) : type;
}

// Namespace ping/ping_shared
// Params 1, eflags: 0x2 linked
// Checksum 0xf3f2e725, Offset: 0x178
// Size: 0x208
function function_44806bba(type) {
    pool = function_5947d757(type);
    if (pool == -1) {
        return getdvarint(#"hash_135ab15dc980084b", 2);
    } else if (pool == -2) {
        return getdvarint(#"hash_5ef51cd5a0446de9", 2);
    } else if (pool == 0) {
        return getdvarint(#"hash_4b0a67e50aeacdee", 1);
    } else if (pool == 4) {
        return getdvarint(#"hash_4685d89a104a6860", 1);
    } else if (pool == 5) {
        return getdvarint(#"hash_60e62eecbe40e4ee", 1);
    } else if (pool == 8 || pool == 9) {
        return getdvarint(#"hash_37085d816592dbe3", 2);
    } else if (pool == 12) {
        return getdvarint(#"hash_37085d816592dbe3", 2);
    } else {
        assertmsg("<unknown string>" + type + "<unknown string>" + pool + "<unknown string>");
    }
    return 1;
}

