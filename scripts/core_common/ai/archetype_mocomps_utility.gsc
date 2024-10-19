// Atian COD Tools GSC CW decompiler test
#using scripts\core_common\ai\archetype_utility.gsc;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp.gsc;
#using scripts\core_common\math_shared.gsc;

#namespace archetype_mocomps_utility;

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 0, eflags: 0x1
// Checksum 0x97c6b7f1, Offset: 0x4e8
// Size: 0x3fc
function autoexec registerdefaultanimationmocomps() {
    animationstatenetwork::registeranimationmocomp("adjust_to_cover", &mocompadjusttocoverinit, &mocompadjusttocoverupdate, &mocompadjusttocoverterminate);
    animationstatenetwork::registeranimationmocomp("locomotion_explosion_death", &mocomplocoexplosioninit, undefined, undefined);
    animationstatenetwork::registeranimationmocomp("mocomp_traversal_procedural", &mocomptraversalproceduralinit, &mocomptraversalproceduralpivotupdate, &mocomptraversalproceduralpivotterminate);
    animationstatenetwork::registeranimationmocomp("mocomp_traversal_procedural_pivot", &mocomptraversalproceduralpivotinit, &mocomptraversalproceduralpivotupdate, &mocomptraversalproceduralpivotterminate);
    animationstatenetwork::registeranimationmocomp("mocomp_traversal_procedural_no_time_scale", &function_5f0e6de2, &mocomptraversalproceduralpivotupdate, &mocomptraversalproceduralpivotterminate);
    animationstatenetwork::registeranimationmocomp("mocomp_traversal_procedural_pivot_no_time_scale", &function_41323d2, &mocomptraversalproceduralpivotupdate, &mocomptraversalproceduralpivotterminate);
    animationstatenetwork::registeranimationmocomp("mocomp_traversal_procedural_pivot_zeus_human", &function_f8a10630, &function_74ff11d0, &function_56a2bbe4);
    animationstatenetwork::registeranimationmocomp("mocomp_traversal_teleport", &function_82b9d7b7, undefined, &function_372bf819);
    animationstatenetwork::registeranimationmocomp("mocomp_react_stealth", &function_7ea5e21f, &function_8def77d1, undefined);
    animationstatenetwork::registeranimationmocomp("mocomp_react_stealth_move", &function_9b568914, &function_8def77d1, undefined);
    animationstatenetwork::registeranimationmocomp("mocomp_force_face_enemy_zombie", &function_37dd625c, &function_f79866a1, undefined);
    animationstatenetwork::registeranimationmocomp("mocomp_force_face_enemy_zombie_notetracks", &function_116f8e5, &function_6fd3b59, undefined);
    animationstatenetwork::registeranimationmocomp("mocomp_vehicle_impact_zombie_intro", &function_fe81623b, &function_62e758f2, undefined);
    animationstatenetwork::registeranimationmocomp("mocomp_vehicle_impact_zombie_loop", &function_ca49e713, &function_c95a9f41, undefined);
    animationstatenetwork::registeranimationmocomp("mocomp_pain_ignore_pain", &function_59fe75e2, &function_8559a6cd, &function_4b95cde);
    animationstatenetwork::registeranimationmocomp("mocomp_ignore_pain_face_enemy", &mocompignorepainfaceenemyinit, &mocompignorepainfaceenemyupdate, &mocompignorepainfaceenemyterminate);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 6, eflags: 0x4
// Checksum 0xcaff1f95, Offset: 0x8f0
// Size: 0x404
function private drawtraversal(traversal, entity, animation, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    if (getdvarint(#"ai_debugvolumetool", 0) <= 1) {
        return;
    }
    /#
        recordsphere(mocompanimblendouttime.startposition, 2, (1, 0.5, 0), "<unknown string>", mocompanimflag);
        recordsphere(mocompanimblendouttime.endposition, 2, (1, 0.5, 0), "<unknown string>", mocompanimflag);
    #/
    animlength = getanimlength(mocompduration);
    currentposition = mocompanimblendouttime.startposition;
    nextposition = currentposition;
    segments = 0;
    for (segmenttime = 0; segmenttime <= animlength; segmenttime += float(function_60d95f53()) / 1000) {
        nexttime = segmenttime + float(function_60d95f53()) / 1000;
        if (nexttime > animlength) {
            nexttime = animlength;
        }
        movedelta = getmovedelta(mocompduration, segmenttime / animlength, nexttime / animlength);
        nextposition = currentposition + rotatepoint(movedelta, mocompanimblendouttime.startangles);
        /#
            recordline(currentposition, nextposition, (1, 0.5, 0), "<unknown string>", mocompanimflag);
        #/
        currentposition = nextposition;
    }
    /#
        recordsphere(nextposition, 2, (1, 0, 0), "<unknown string>", mocompanimflag);
    #/
    if (isdefined(mocompanimblendouttime.mantlenode)) {
        edgepoints = getnodeedge(mocompanimblendouttime.mantlenode);
        for (index = 1; index < edgepoints.size; index++) {
            /#
                recordline(edgepoints[index - 1], edgepoints[index], (1, 0, 0), "<unknown string>", mocompanimflag);
            #/
        }
    }
    if (!mocompanimflag function_3c566724()) {
        edgepoints = getnodeedge(mocompanimblendouttime.startnode);
        for (index = 1; index < edgepoints.size; index++) {
            /#
                recordline(edgepoints[index - 1], edgepoints[index], (1, 0, 0), "<unknown string>", mocompanimflag);
            #/
        }
        edgepoints = getnodeedge(mocompanimblendouttime.endnode);
        for (index = 1; index < edgepoints.size; index++) {
            /#
                recordline(edgepoints[index - 1], edgepoints[index], (1, 0, 0), "<unknown string>", mocompanimflag);
            #/
        }
    }
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 6, eflags: 0x4
// Checksum 0xc2b49545, Offset: 0xd00
// Size: 0x3b6
function private drawtraversalsection(section, entity, animation, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    if (getdvarint(#"ai_debugvolumetool", 0) <= 1) {
        return;
    }
    /#
        recordsphere(mocompanimblendouttime.startposition, 2, (1, 0.5, 0), "<unknown string>", mocompanimflag);
        recordsphere(mocompanimblendouttime.endposition, 2, (1, 0.5, 0), "<unknown string>", mocompanimflag);
        recordsphere(mocompanimblendouttime.mocompstartposition, 2, (0, 1, 0), "<unknown string>", mocompanimflag);
        recordsphere(mocompanimblendouttime.adjustedmocompendposition, 2, (0, 1, 0), "<unknown string>", mocompanimflag);
    #/
    animlength = getanimlength(mocompduration);
    currentposition = mocompanimblendouttime.startposition;
    nextposition = currentposition;
    segments = 0;
    deltatoendtotal = (0, 0, 0);
    for (segmenttime = mocompanimblendouttime.starttime; segmenttime <= mocompanimblendouttime.endtime; segmenttime += float(function_60d95f53()) / 1000) {
        nexttime = segmenttime + float(function_60d95f53()) / 1000;
        if (nexttime > mocompanimblendouttime.endtime) {
            nexttime = mocompanimblendouttime.endtime;
        }
        movedelta = getmovedelta(mocompduration, segmenttime / animlength, nexttime / animlength);
        nextposition = currentposition + rotatepoint(movedelta, mocompanimblendouttime.startangles);
        if (nexttime >= mocompanimblendouttime.mocompstarttime && lengthsquared(deltatoendtotal) < lengthsquared(mocompanimblendouttime.deltatoendposition)) {
            adjusteddeltaperframe = mocompanimblendouttime.adjusteddeltaperframe;
            deltatoendtotal += adjusteddeltaperframe;
            if (lengthsquared(deltatoendtotal) > lengthsquared(mocompanimblendouttime.deltatoendposition)) {
                adjusteddeltaperframe -= deltatoendtotal - mocompanimblendouttime.deltatoendposition;
            }
            nextposition += adjusteddeltaperframe;
            /#
                recordline(currentposition, nextposition, (0, 1, 0), "<unknown string>", mocompanimflag);
            #/
        } else {
            /#
                recordline(currentposition, nextposition, (1, 0.5, 0), "<unknown string>", mocompanimflag);
            #/
        }
        currentposition = nextposition;
    }
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 10, eflags: 0x6 linked
// Checksum 0xe2f12936, Offset: 0x10c0
// Size: 0x662
function private function_54b5f203(*entity, *traversal, animation, starttime, endtime, startposition, endposition, startangles, timescale = 1, animlength) {
    assert(endtime >= starttime);
    section = spawnstruct();
    section.starttime = starttime;
    section.starttimenormalized = section.starttime / animlength;
    section.endtime = endtime;
    section.length = section.endtime - section.starttime;
    section.startangles = startangles;
    section.startposition = startposition;
    section.endposition = endposition;
    section.mocompstarttime = starttime;
    starttimes = getnotetracktimes(animation, "start_procedural");
    if (isdefined(starttimes) && starttimes.size > 0) {
        for (index = 0; index < starttimes.size; index++) {
            mocomptime = starttimes[index] * animlength;
            if (mocomptime >= starttime && mocomptime <= endtime) {
                section.mocompstarttime = mocomptime;
            }
        }
    }
    section.mocompendtime = endtime;
    endtimes = getnotetracktimes(animation, "stop_procedural");
    if (isdefined(endtimes) && endtimes.size > 0) {
        for (index = 0; index < endtimes.size; index++) {
            mocomptime = endtimes[index] * animlength;
            if (mocomptime >= starttime && mocomptime <= endtime) {
                section.mocompendtime = mocomptime;
            }
        }
    }
    section.mocomptimelength = section.mocompendtime - section.mocompstarttime;
    section.mocomptimeinframes = floor(section.mocomptimelength / float(function_60d95f53()) / 1000);
    if (section.mocomptimeinframes <= 0) {
        section.mocomptimeinframes = 1;
    }
    endtime = 1;
    if (animlength > 0) {
        endtime = section.mocompstarttime / animlength;
    }
    endtime = math::clamp(endtime, 0, 1);
    movedelta = getmovedelta(animation, section.starttimenormalized, endtime);
    section.mocompstartposition = section.startposition + rotatepoint(movedelta, section.startangles);
    endtime = 1;
    if (animlength > 0) {
        endtime = section.mocompendtime / animlength;
    }
    endtime = math::clamp(endtime, 0, 1);
    movedelta = getmovedelta(animation, section.starttimenormalized, endtime);
    section.mocompendposition = section.startposition + rotatepoint(movedelta, section.startangles);
    endtime = 1;
    if (animlength > 0) {
        endtime = section.endtime / animlength;
    }
    endtime = math::clamp(endtime, 0, 1);
    section.animationendposition = section.startposition + rotatepoint(getmovedelta(animation, section.starttimenormalized, endtime), section.startangles);
    section.deltatoendposition = section.endposition - section.animationendposition;
    section.deltatoendmocompposition = section.mocompendposition - section.mocompstartposition;
    section.adjustedmocompendposition = section.mocompendposition + section.deltatoendposition;
    section.adjusteddeltaperframe = section.deltatoendposition / section.mocomptimeinframes;
    section.deltatoendmocomplength = length(section.deltatoendmocompposition);
    section.deltatoendmocomplengthdesired = length(section.deltatoendposition + section.deltatoendmocompposition);
    section.deltatoendmocompmultiplier = 1;
    if (timescale && section.deltatoendmocomplength > 0 && section.deltatoendmocomplengthdesired > 0) {
        if (section.deltatoendmocomplengthdesired > section.deltatoendmocomplength) {
            section.deltatoendmocompmultiplier = section.deltatoendmocomplengthdesired / section.deltatoendmocomplength;
            section.deltatoendmocompmultiplier = max(0.01, float(int(section.deltatoendmocompmultiplier * 10)) / 10);
        } else {
            section.deltatoendmocompmultiplier = 1;
        }
    } else {
        section.deltatoendmocompmultiplier = 1;
    }
    section.deltatoendtotal = (0, 0, 0);
    return section;
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 9, eflags: 0x6 linked
// Checksum 0x4241196c, Offset: 0x1730
// Size: 0x74a
function private calculatetraveralsection(*entity, traversal, animation, starttime, endtime, startposition, endposition, startangles, timescale = 1) {
    assert(endtime >= starttime);
    animlength = getanimlength(animation);
    section = spawnstruct();
    section.starttime = starttime;
    section.starttimenormalized = section.starttime / animlength;
    section.endtime = endtime;
    section.length = section.endtime - section.starttime;
    section.startangles = startangles;
    section.startposition = startposition;
    section.endposition = endposition;
    section.mocompstarttime = starttime;
    starttimes = getnotetracktimes(animation, "start_procedural");
    if (isdefined(starttimes) && starttimes.size > 0) {
        for (index = 0; index < starttimes.size; index++) {
            mocomptime = starttimes[index] * animlength;
            if (mocomptime >= starttime && mocomptime <= endtime) {
                section.mocompstarttime = mocomptime;
            }
        }
    }
    section.mocompendtime = endtime;
    endtimes = getnotetracktimes(animation, "stop_procedural");
    if (isdefined(endtimes) && endtimes.size > 0) {
        for (index = 0; index < endtimes.size; index++) {
            mocomptime = endtimes[index] * animlength;
            if (mocomptime >= starttime && mocomptime <= endtime) {
                section.mocompendtime = mocomptime;
                if (index == 1) {
                    section.endtime = mocomptime;
                }
            }
        }
    }
    section.mocomptimelength = section.mocompendtime - section.mocompstarttime;
    section.mocomptimeinframes = floor(section.mocomptimelength / float(function_60d95f53()) / 1000);
    if (section.mocomptimeinframes <= 0) {
        section.mocomptimeinframes = 1;
    }
    endtime = 1;
    if (animlength > 0) {
        endtime = section.mocompstarttime / animlength;
    }
    endtime = math::clamp(endtime, 0, 1);
    movedelta = getmovedelta(animation, section.starttimenormalized, endtime);
    section.mocompstartposition = section.startposition + rotatepoint(movedelta, section.startangles);
    endtime = 1;
    if (animlength > 0) {
        endtime = section.mocompendtime / animlength;
    }
    endtime = math::clamp(endtime, 0, 1);
    movedelta = getmovedelta(animation, section.starttimenormalized, endtime);
    section.mocompendposition = section.startposition + rotatepoint(movedelta, section.startangles);
    endtime = 1;
    if (animlength > 0) {
        endtime = section.endtime / animlength;
    }
    endtime = math::clamp(endtime, 0, 1);
    section.animationendposition = section.startposition + rotatepoint(getmovedelta(animation, section.starttimenormalized, endtime), section.startangles);
    section.deltatoendposition = section.endposition - section.animationendposition;
    section.deltatoendmocompposition = section.mocompendposition - section.mocompstartposition;
    section.adjustedmocompendposition = section.mocompendposition + section.deltatoendposition;
    section.adjusteddeltaperframe = section.deltatoendposition / section.mocomptimeinframes;
    section.deltatoendmocomplength = length(section.deltatoendmocompposition);
    section.deltatoendmocomplengthdesired = length(section.deltatoendposition + section.deltatoendmocompposition);
    section.deltatoendmocompmultiplier = 1;
    if (timescale && section.deltatoendmocomplength > 0 && section.deltatoendmocomplengthdesired > 0) {
        section.deltatoendmocompmultiplier = section.deltatoendmocomplength / section.deltatoendmocomplengthdesired;
        section.deltatoendmocompmultiplier = max(0.01, float(int(section.deltatoendmocompmultiplier * 10)) / 10);
    }
    section.deltatoendtotal = (0, 0, 0);
    if (isdefined(traversal.pivotorigin) && isdefined(traversal.pivottime)) {
        startposition = section.startposition;
        endposition = section.endposition;
        if (section.starttime < traversal.pivottime) {
            endposition = traversal.pivotorigin;
        } else {
            startposition = traversal.pivotorigin;
        }
        if ((endposition - startposition)[2] <= 0 && section.deltatoendmocompmultiplier < 1) {
            section.deltatoendmocompmultiplier = 1;
        }
    } else if ((section.endposition - section.startposition)[2] <= 0 && section.deltatoendmocompmultiplier < 1) {
        section.deltatoendmocompmultiplier = 1;
    }
    return section;
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 2, eflags: 0x6 linked
// Checksum 0xaf289fd8, Offset: 0x1e88
// Size: 0x3b8
function private function_39c2a42c(entity, traversalstart) {
    mantlepoints = entity function_1382c7a1();
    assert(mantlepoints.size >= 2);
    mantlestart = mantlepoints[0];
    mantleend = mantlepoints[mantlepoints.size - 1];
    mantlestartproj = mantlestart;
    mantleendproj = (mantleend[0], mantleend[1], mantlestartproj[2]);
    traversalstartproj = (traversalstart[0], traversalstart[1], mantlestartproj[2]);
    tomantleendproj = mantleendproj - mantlestartproj;
    totraversalproj = traversalstartproj - mantlestartproj;
    mantleoriginproj = mantlestartproj + vectorprojection(totraversalproj, tomantleendproj);
    mantleedgelength = length(mantleendproj - mantlestartproj);
    time = length(mantleoriginproj - mantlestartproj) / mantleedgelength;
    time = math::clamp(time, 0, 1);
    mantleorigin = mantlepoints[0];
    for (index = 1; index < mantlepoints.size; index++) {
        endpoint = mantlepoints[index];
        endpointproj = (endpoint[0], endpoint[1], mantlestartproj[2]);
        endpointtime = length(endpointproj - mantlestartproj) / mantleedgelength;
        if (endpointtime >= time) {
            startpoint = mantlepoints[index - 1];
            startpointproj = (startpoint[0], startpoint[1], mantlestartproj[2]);
            startpointtime = length(startpointproj - mantlestartproj) / mantleedgelength;
            timedelta = time - startpointtime;
            mantleorigin = startpoint + (endpoint - startpoint) * timedelta / (endpointtime - startpointtime);
            break;
        }
    }
    if (index == mantlepoints.size) {
        mantleorigin = mantleend;
    }
    /#
        recordline(mantleoriginproj, mantleendproj, (0, 0, 1), "<unknown string>", entity);
        recordline(mantlestartproj, traversalstartproj, (0, 0, 1), "<unknown string>", entity);
        recordline(traversalstartproj, mantleoriginproj, (0, 0, 1), "<unknown string>", entity);
        recordline(mantlestart, mantleend, (1, 0, 0), "<unknown string>", entity);
        recordline(mantlestart, mantleoriginproj, (1, 0, 0), "<unknown string>", entity);
        recordline(mantleoriginproj, mantleorigin, (1, 0, 0), "<unknown string>", entity);
    #/
    return mantleorigin;
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 3, eflags: 0x2 linked
// Checksum 0xcef5c089, Offset: 0x2248
// Size: 0x548
function calculatepivotoriginfromedge(entity, mantlenode, traversalstart) {
    assert(isvec(traversalstart));
    if (entity function_dd4f686e()) {
        return function_39c2a42c(entity, traversalstart);
    }
    assert(isdefined(mantlenode));
    mantlepoints = [];
    if (isdefined(mantlenode) && ispathnode(mantlenode)) {
        mantlepoints = getnodeedge(mantlenode);
    }
    mantlestart = undefined;
    mantleend = undefined;
    if (mantlepoints.size > 0) {
        assert(isarray(mantlepoints));
        assert(mantlepoints.size >= 2);
        mantlestart = mantlepoints[0];
        mantleend = mantlepoints[mantlepoints.size - 1];
    } else {
        right = anglestoright(mantlenode.angles);
        extents = mantlenode.aabb_extents;
        mantlestart = mantlenode.origin - right * extents[1];
        mantleend = mantlenode.origin + right * extents[1];
    }
    mantlestartproj = mantlestart;
    mantleendproj = (mantleend[0], mantleend[1], mantlestartproj[2]);
    traversalstartproj = (traversalstart[0], traversalstart[1], mantlestartproj[2]);
    tomantleendproj = mantleendproj - mantlestartproj;
    totraversalproj = traversalstartproj - mantlestartproj;
    mantleoriginproj = mantlestartproj + vectorprojection(totraversalproj, tomantleendproj);
    if (mantlepoints.size > 0) {
        mantleedgelength = length(mantleendproj - mantlestartproj);
        time = length(mantleoriginproj - mantlestartproj) / mantleedgelength;
        mantleorigin = mantlepoints[0];
        for (index = 1; index < mantlepoints.size; index++) {
            endpoint = mantlepoints[index];
            endpointproj = (endpoint[0], endpoint[1], mantlestartproj[2]);
            endpointtime = length(endpointproj - mantlestartproj) / mantleedgelength;
            if (endpointtime > time) {
                startpoint = mantlepoints[index - 1];
                startpointproj = (startpoint[0], startpoint[1], mantlestartproj[2]);
                startpointtime = length(startpointproj - mantlestartproj) / mantleedgelength;
                timedelta = time - startpointtime;
                mantleorigin = startpoint + (endpoint - startpoint) * timedelta / (endpointtime - startpointtime);
                break;
            }
        }
    } else {
        mantleorigin = physicstraceex(mantleoriginproj + (0, 0, mantlenode.aabb_extents[2]), mantleoriginproj - (0, 0, mantlenode.aabb_extents[2]), (0, 0, 0), (0, 0, 0), entity)[#"position"];
    }
    /#
        recordline(mantleoriginproj, mantleendproj, (0, 0, 1), "<unknown string>", entity);
        recordline(mantlestartproj, traversalstartproj, (0, 0, 1), "<unknown string>", entity);
        recordline(traversalstartproj, mantleoriginproj, (0, 0, 1), "<unknown string>", entity);
        recordline(mantlestart, mantleend, (1, 0, 0), "<unknown string>", entity);
        recordline(mantlestart, mantleoriginproj, (1, 0, 0), "<unknown string>", entity);
        recordline(mantleoriginproj, mantleorigin, (1, 0, 0), "<unknown string>", entity);
    #/
    return mantleorigin;
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0xbc21e92a, Offset: 0x2798
// Size: 0x4c
function function_5f0e6de2(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    mocomptraversalproceduralinit(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration, 0);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 6, eflags: 0x2 linked
// Checksum 0x2e7a6986, Offset: 0x27f0
// Size: 0x49c
function mocomptraversalproceduralinit(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration, timescale = 1) {
    traversal = spawnstruct();
    traversal.startnode = entity.traversestartnode;
    traversal.endnode = entity.traverseendnode;
    traversal.initialanimationrate = isactor(entity) ? isdefined(entity function_ebbebf56()) ? entity function_ebbebf56() : 1 : 1;
    traversal.animlength = getanimlength(mocompanim);
    traversal.actualanimlength = traversal.animlength - mocompanimblendouttime;
    traversal.var_98d8ca66 = (0, 0, 0);
    traversal.startposition = entity.origin;
    traversal.adjustedendposition = isdefined(entity.var_e4615d76) ? entity.var_e4615d76 : entity.traversalendpos;
    traversal.traversalforward = traversal.adjustedendposition - traversal.startposition;
    traversal.traversalforward = (traversal.traversalforward[0], traversal.traversalforward[1], 0);
    traversal.startangles = vectortoangles(traversal.traversalforward);
    end_time = math::clamp(traversal.actualanimlength / traversal.animlength, 0, 1);
    traversal.endposition = traversal.startposition + rotatepoint(getmovedelta(mocompanim, 0, end_time), traversal.startangles);
    if (isdefined(traversal.endnode) && isdefined(traversal.endnode.script_linkname)) {
        traversal.endnodeparent = getent(traversal.endnode.script_linkname, "targetname");
        if (isdefined(traversal.endnodeparent)) {
            traversal.origincontents = entity setcontents(8192);
            traversal.lastendnodeparentorigin = traversal.endnodeparent.origin;
            traversal.adjustedendposition = physicstraceex(entity.traversalendpos + (0, 0, 24), entity.traversalendpos - (0, 0, 24), (0, 0, 0), (0, 0, 0), entity)[#"position"];
        }
    }
    traversal.sections = [];
    traversal.sections[traversal.sections.size] = calculatetraveralsection(entity, traversal, mocompanim, 0, traversal.actualanimlength, traversal.startposition, traversal.adjustedendposition, traversal.startangles, timescale);
    traversal.lastanimtime = 0;
    entity.traversal = traversal;
    entity.blockingpain = 1;
    entity.usegoalanimweight = 1;
    entity.lasttraversalanimation = mocompanim;
    entity.lasttraversalblendout = mocompanimblendouttime;
    entity.lasttraversalstartpos = traversal.startposition;
    entity.lasttraversalendpos = traversal.adjustedendposition;
    entity.lasttraversalpivot = undefined;
    if (isactor(entity)) {
        entity setrepairpaths(0);
        entity orientmode("face angle", traversal.startangles[1]);
        entity animmode("angle deltas noclip", 0);
    }
    mocomptraversalproceduralpivotupdate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0xcd00f913, Offset: 0x2c98
// Size: 0x4c
function function_41323d2(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    mocomptraversalproceduralpivotinit(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration, 0);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 6, eflags: 0x2 linked
// Checksum 0xadccb9ca, Offset: 0x2cf0
// Size: 0x814
function mocomptraversalproceduralpivotinit(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration, timescale = 1) {
    traversal = spawnstruct();
    traversal.startnode = entity.traversestartnode;
    traversal.endnode = entity.traverseendnode;
    traversal.mantlenode = entity.traversemantlenode;
    traversal.initialanimationrate = isactor(entity) ? isdefined(entity function_ebbebf56()) ? entity function_ebbebf56() : 1 : 1;
    traversal.animlength = getanimlength(mocompanim);
    traversal.actualanimlength = traversal.animlength - mocompanimblendouttime;
    traversal.var_98d8ca66 = (0, 0, 0);
    traversal.startposition = entity.origin;
    traversal.adjustedendposition = isdefined(entity.var_e4615d76) ? entity.var_e4615d76 : entity.traversalendpos;
    traversal.traversalforward = traversal.adjustedendposition - traversal.startposition;
    traversal.traversalforward = (traversal.traversalforward[0], traversal.traversalforward[1], 0);
    traversal.startangles = vectortoangles(traversal.traversalforward);
    end_time = math::clamp(traversal.actualanimlength / traversal.animlength, 0, 1);
    traversal.endposition = traversal.startposition + rotatepoint(getmovedelta(mocompanim, 0, end_time), traversal.startangles);
    if (isdefined(traversal.endnode) && isdefined(traversal.endnode.script_linkname)) {
        traversal.endnodeparent = getent(traversal.endnode.script_linkname, "targetname");
        if (isdefined(traversal.endnodeparent)) {
            traversal.origincontents = entity setcontents(8192);
            traversal.lastendnodeparentorigin = traversal.endnodeparent.origin;
            traversal.adjustedendposition = physicstraceex(entity.traversalendpos + (0, 0, 24), entity.traversalendpos - (0, 0, 24), (0, 0, 0), (0, 0, 0), entity)[#"position"];
        }
    }
    pivottimes = getnotetracktimes(mocompanim, "pivot_procedural");
    traversal.pivottime = traversal.actualanimlength / 2;
    if (isdefined(pivottimes) && pivottimes.size > 0) {
        traversal.pivottime = pivottimes[0] * traversal.animlength;
    }
    traversal.pivottime = floor(traversal.pivottime / float(function_60d95f53()) / 1000) * float(function_60d95f53()) / 1000;
    traversal.pivotorigin = calculatepivotoriginfromedge(entity, traversal.mantlenode, traversal.startposition);
    pivottagorigin = getanimtagorigin(mocompanim, 0, "tag_sync");
    animpivotorigin = traversal.pivotorigin;
    if (lengthsquared(pivottagorigin) > 0) {
        animpivotorigin = rotatepoint(pivottagorigin, traversal.startangles) + traversal.startposition;
    }
    pivotoffset = traversal.pivotorigin - animpivotorigin;
    animlen = 1;
    if (traversal.animlength > 0) {
        animlen = math::clamp(traversal.pivottime / traversal.animlength, 0, 1);
    }
    pivotorigin = traversal.startposition + rotatepoint(getmovedelta(mocompanim, 0, animlen), traversal.startangles) + pivotoffset;
    /#
        if (getdvarint(#"ai_debugvolumetool", 0) > 1) {
            recordsphere(animpivotorigin, 2, (0, 0, 1), "<unknown string>", entity);
            recordline(traversal.pivotorigin, animpivotorigin, (1, 0, 0), "<unknown string>", entity);
            recordsphere(traversal.pivotorigin, 2, (1, 0, 0), "<unknown string>", entity);
        }
    #/
    traversal.sections = [];
    traversal.sections[traversal.sections.size] = calculatetraveralsection(entity, traversal, mocompanim, 0, traversal.pivottime, traversal.startposition, pivotorigin, traversal.startangles, timescale);
    traversal.sections[traversal.sections.size] = calculatetraveralsection(entity, traversal, mocompanim, traversal.pivottime, traversal.actualanimlength, pivotorigin, traversal.adjustedendposition, traversal.startangles, timescale);
    if (traversal.sections[0].deltatoendmocompmultiplier != 1) {
        traversal.sections[1].deltatoendmocompmultiplier = 1;
    }
    traversal.lastanimtime = 0;
    entity.traversal = traversal;
    entity.blockingpain = 1;
    entity.usegoalanimweight = 1;
    entity.lasttraversalanimation = mocompanim;
    entity.lasttraversalblendout = mocompanimblendouttime;
    entity.lasttraversalstartpos = traversal.startposition;
    entity.lasttraversalendpos = traversal.adjustedendposition;
    entity.lasttraversalpivot = traversal.pivotorigin;
    if (isactor(entity)) {
        entity setrepairpaths(0);
        entity animmode("angle deltas noclip", 0);
    }
    mocomptraversalproceduralpivotupdate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0x1f12ee6a, Offset: 0x3510
// Size: 0x5ac
function mocomptraversalproceduralpivotupdate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    if (!isalive(entity)) {
        return;
    }
    traversal = entity.traversal;
    /#
        drawtraversal(traversal, entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration);
        for (index = 0; index < traversal.sections.size; index++) {
            drawtraversalsection(traversal.sections[index], entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration);
        }
    #/
    traversal = entity.traversal;
    assert(isdefined(traversal));
    animationrate = traversal.initialanimationrate;
    adjusteddeltaperframe = (0, 0, 0);
    animationnextsteptime = entity getanimtime(mocompanim) * traversal.animlength;
    movedelta = getmovedelta(mocompanim, 0, animationnextsteptime / traversal.animlength);
    assert(traversal.sections.size > 0);
    section = traversal.sections[0];
    for (index = 0; index < traversal.sections.size; index++) {
        section = traversal.sections[index];
        if (section.starttime <= animationnextsteptime && section.endtime > animationnextsteptime) {
            break;
        }
    }
    if (traversal.lastanimtime >= section.mocompstarttime && lengthsquared(section.deltatoendtotal) < lengthsquared(section.deltatoendposition)) {
        animationtimedelta = (animationnextsteptime - traversal.lastanimtime) / float(function_60d95f53()) / 1000;
        adjusteddeltaperframe = section.adjusteddeltaperframe * animationtimedelta;
        section.deltatoendtotal += adjusteddeltaperframe;
        if (traversal.lastanimtime <= section.mocompendtime && section.deltatoendmocompmultiplier < 1 && !is_true(level.var_881e464e)) {
            animationrate = traversal.initialanimationrate * section.deltatoendmocompmultiplier;
        }
        if (lengthsquared(section.deltatoendtotal) > lengthsquared(section.deltatoendposition)) {
            adjusteddeltaperframe -= section.deltatoendtotal - section.deltatoendposition;
        }
    }
    traversal.lastanimtime = animationnextsteptime;
    traversal.var_98d8ca66 += adjusteddeltaperframe;
    newentityorigin = traversal.startposition + rotatepoint(movedelta, traversal.startangles) + traversal.var_98d8ca66;
    if (isdefined(traversal.endnodeparent)) {
        parentdelta = traversal.endnodeparent.origin - traversal.lastendnodeparentorigin;
        traversal.lastendnodeparentorigin = traversal.endnodeparent.origin;
        newentityorigin += parentdelta;
    }
    if (isactor(entity)) {
        if (!is_true(entity.ai.var_8a9efbb6)) {
            entity asmsetanimationrate(animationrate);
        }
        var_563d78bb = traversal.startangles;
        if (isdefined(entity.ai.var_24b39f1f)) {
            new_yaw = math::function_e673fc92(entity.angles[1], traversal.startangles[1], entity.ai.var_24b39f1f);
            var_563d78bb = (var_563d78bb[0], new_yaw, var_563d78bb[2]);
        }
        entity forceteleport(newentityorigin, var_563d78bb, 0, 0);
        return;
    }
    if (isplayer(entity)) {
        entity lerporigin(newentityorigin);
        entity setplayerangles(traversal.startangles);
    }
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0x766a5959, Offset: 0x3ac8
// Size: 0x18c
function mocomptraversalproceduralpivotterminate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    traversal = entity.traversal;
    if (isdefined(traversal)) {
        mocomptraversalproceduralpivotupdate(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration);
        if (isdefined(traversal.origincontents)) {
            entity setcontents(traversal.origincontents);
        }
        if (isactor(entity)) {
            entity asmsetanimationrate(traversal.initialanimationrate);
        }
    }
    entity.blockingpain = 0;
    entity.usegoalanimweight = 0;
    entity.traversal = undefined;
    if (isactor(entity)) {
        entity animmode("normal", 0);
        entity orientmode("face motion");
        entity function_af554597(mocompanim);
        entity finishtraversal();
        entity setrepairpaths(1);
    }
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 6, eflags: 0x2 linked
// Checksum 0x48e1bc58, Offset: 0x3c60
// Size: 0x87c
function function_f8a10630(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration, *timescale) {
    assert(isactor(mocompanim));
    traversal = spawnstruct();
    traversal.startnode = mocompanim.traversestartnode;
    traversal.endnode = mocompanim.traverseendnode;
    traversal.mantlenode = mocompanim.traversemantlenode;
    traversal.initialanimationrate = isactor(mocompanim) ? isdefined(mocompanim function_ebbebf56()) ? mocompanim function_ebbebf56() : 1 : 1;
    traversal.animlength = getanimlength(mocompanimblendouttime);
    var_4843d198 = traversal.animlength - mocompanimflag;
    endtimes = getnotetracktimes(mocompanimblendouttime, "stop_procedural");
    if (isdefined(endtimes) && endtimes.size > 1) {
        var_4843d198 = endtimes[1] * traversal.animlength;
    }
    traversal.actualanimlength = var_4843d198;
    traversal.var_98d8ca66 = (0, 0, 0);
    traversal.startposition = mocompanim.origin;
    traversal.adjustedendposition = mocompanim.traversalendpos;
    traversal.traversalforward = traversal.adjustedendposition - traversal.startposition;
    traversal.traversalforward = (traversal.traversalforward[0], traversal.traversalforward[1], 0);
    traversal.startangles = vectortoangles(traversal.traversalforward);
    end_time = math::clamp(traversal.actualanimlength / traversal.animlength, 0, 1);
    traversal.endposition = traversal.startposition + rotatepoint(getmovedelta(mocompanimblendouttime, 0, end_time), traversal.startangles);
    if (isdefined(traversal.endnode) && isdefined(traversal.endnode.script_linkname)) {
        traversal.endnodeparent = getent(traversal.endnode.script_linkname, "targetname");
        if (isdefined(traversal.endnodeparent)) {
            traversal.origincontents = mocompanim setcontents(8192);
            traversal.lastendnodeparentorigin = traversal.endnodeparent.origin;
            traversal.adjustedendposition = physicstraceex(mocompanim.traversalendpos + (0, 0, 24), mocompanim.traversalendpos - (0, 0, 24), (0, 0, 0), (0, 0, 0), mocompanim)[#"position"];
        }
    }
    pivottimes = getnotetracktimes(mocompanimblendouttime, "pivot_procedural");
    traversal.pivottime = traversal.actualanimlength / 2;
    if (isdefined(pivottimes) && pivottimes.size > 0) {
        traversal.pivottime = pivottimes[0] * traversal.animlength;
    }
    traversal.pivottime = floor(traversal.pivottime / float(function_60d95f53()) / 1000) * float(function_60d95f53()) / 1000;
    traversal.pivotorigin = calculatepivotoriginfromedge(mocompanim, traversal.mantlenode, traversal.startposition);
    pivottagorigin = getanimtagorigin(mocompanimblendouttime, 0, "tag_sync");
    animpivotorigin = traversal.pivotorigin;
    if (lengthsquared(pivottagorigin) > 0) {
        animpivotorigin = rotatepoint(pivottagorigin, traversal.startangles) + traversal.startposition;
    }
    pivotoffset = traversal.pivotorigin - animpivotorigin;
    animlen = 1;
    if (traversal.animlength > 0) {
        animlen = math::clamp(traversal.pivottime / traversal.animlength, 0, 1);
    }
    pivotorigin = traversal.startposition + rotatepoint(getmovedelta(mocompanimblendouttime, 0, animlen), traversal.startangles) + pivotoffset;
    /#
        if (getdvarint(#"ai_debugvolumetool", 0) > 1) {
            recordsphere(animpivotorigin, 2, (0, 0, 1), "<unknown string>", mocompanim);
            recordline(traversal.pivotorigin, animpivotorigin, (1, 0, 0), "<unknown string>", mocompanim);
            recordsphere(traversal.pivotorigin, 2, (1, 0, 0), "<unknown string>", mocompanim);
        }
    #/
    traversal.sections = [];
    traversal.sections[traversal.sections.size] = function_54b5f203(mocompanim, traversal, mocompanimblendouttime, 0, traversal.pivottime, traversal.startposition, pivotorigin, traversal.startangles, 0, traversal.animlength);
    traversal.sections[traversal.sections.size] = function_54b5f203(mocompanim, traversal, mocompanimblendouttime, traversal.pivottime, traversal.actualanimlength, pivotorigin, traversal.adjustedendposition, traversal.startangles, 1, traversal.animlength);
    if (traversal.sections[0].deltatoendmocompmultiplier != 1) {
        traversal.sections[1].deltatoendmocompmultiplier = 1;
    }
    traversal.lastanimtime = 0;
    mocompanim.traversal = traversal;
    mocompanim.blockingpain = 1;
    mocompanim.usegoalanimweight = 1;
    mocompanim.lasttraversalanimation = mocompanimblendouttime;
    mocompanim.lasttraversalblendout = mocompanimflag;
    mocompanim.lasttraversalstartpos = traversal.startposition;
    mocompanim.lasttraversalendpos = traversal.adjustedendposition;
    mocompanim.lasttraversalpivot = traversal.pivotorigin;
    mocompanim setrepairpaths(0);
    mocompanim animmode("angle deltas noclip", 0);
    function_74ff11d0(mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration, timescale);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0x7c3f34d8, Offset: 0x44e8
// Size: 0x414
function function_74ff11d0(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    if (!isalive(entity)) {
        return;
    }
    traversal = entity.traversal;
    /#
        drawtraversal(traversal, entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration);
        for (index = 0; index < traversal.sections.size; index++) {
            drawtraversalsection(traversal.sections[index], entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration);
        }
    #/
    traversal = entity.traversal;
    assert(isdefined(traversal));
    adjusteddeltaperframe = (0, 0, 0);
    animationnextsteptime = entity getanimtime(mocompanim) * traversal.animlength;
    movedelta = getmovedelta(mocompanim, 0, animationnextsteptime / traversal.animlength);
    assert(traversal.sections.size > 0);
    section = traversal.sections[0];
    for (index = 0; index < traversal.sections.size; index++) {
        section = traversal.sections[index];
        if (section.starttime <= animationnextsteptime && (section.endtime > animationnextsteptime || section.endtime == animationnextsteptime)) {
            break;
        }
    }
    if (!isdefined(section.var_9bcea3fe)) {
        section.var_9bcea3fe = 0;
    }
    if (traversal.lastanimtime >= section.mocompstarttime && section.var_9bcea3fe <= section.mocomptimeinframes) {
        animationtimedelta = (animationnextsteptime - traversal.lastanimtime) / float(function_60d95f53()) / 1000;
        adjusteddeltaperframe = section.adjusteddeltaperframe * animationtimedelta;
        section.deltatoendtotal += adjusteddeltaperframe;
        section.var_9bcea3fe++;
        if (lengthsquared(section.deltatoendtotal) > lengthsquared(section.deltatoendposition)) {
            adjusteddeltaperframe -= section.deltatoendtotal - section.deltatoendposition;
        }
    }
    traversal.lastanimtime = animationnextsteptime;
    traversal.var_98d8ca66 += adjusteddeltaperframe;
    newentityorigin = traversal.startposition + rotatepoint(movedelta, traversal.startangles) + traversal.var_98d8ca66;
    if (isdefined(traversal.endnodeparent)) {
        parentdelta = traversal.endnodeparent.origin - traversal.lastendnodeparentorigin;
        traversal.lastendnodeparentorigin = traversal.endnodeparent.origin;
        newentityorigin += parentdelta;
    }
    entity forceteleport(newentityorigin, traversal.startangles, 0, 0);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0x583cc8aa, Offset: 0x4908
// Size: 0x134
function function_56a2bbe4(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    traversal = entity.traversal;
    if (isdefined(traversal)) {
        function_74ff11d0(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration);
        if (isdefined(traversal.origincontents)) {
            entity setcontents(traversal.origincontents);
        }
    }
    entity.blockingpain = 0;
    entity.usegoalanimweight = 0;
    entity function_af554597(mocompanim);
    entity finishtraversal();
    entity setrepairpaths(1);
    entity animmode("normal", 0);
    entity orientmode("face motion");
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 0, eflags: 0x1
// Checksum 0x3fdbbd11, Offset: 0x4a48
// Size: 0x694
function autoexec initadjusttocoverparams() {
    _addadjusttocover("human", "cover_any", "stance_any", 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.9, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8);
    _addadjusttocover("human", "cover_stand", "stance_any", 0.4, 0.8, 0.6, 0.4, 0.6, 0.3, 0.3, 0.6, 0.9, 0.6, 0.3, 0.4, 0.7, 0.6, 0.6, 0.6);
    _addadjusttocover("human", "cover_crouch", "stance_any", 0.4, 0.4, 0.4, 0.4, 0.8, 0.5, 0.2, 0.7, 0.9, 0.4, 0.2, 0.4, 0.5, 0.5, 0.5, 0.5);
    _addadjusttocover("human", "cover_left", "stand", 0.8, 0.4, 0.4, 0.4, 0.4, 0.7, 0.3, 0.5, 0.8, 0.8, 0.8, 0.9, 0.6, 0.6, 0.4, 0.4);
    _addadjusttocover("human", "cover_left", "crouch", 0.8, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.8, 0.8, 0.7, 0.6, 0.6, 0.4, 0.4);
    _addadjusttocover("human", "cover_right", "stand", 0.8, 0.4, 0.3, 0.4, 0.6, 0.8, 0.4, 0.4, 0.4, 0.4, 0.3, 0.4, 0.6, 0.6, 0.5, 0.4);
    _addadjusttocover("human", "cover_right", "crouch", 0.8, 0.4, 0.2, 0.4, 0.4, 0.7, 0.2, 0.3, 0.3, 0.5, 0.5, 0.7, 0.6, 0.6, 0.5, 0.4);
    _addadjusttocover("human", "cover_pillar", "stance_any", 0.8, 0.7, 0.6, 0.7, 0.6, 0.5, 0.4, 0.4, 0.4, 0.6, 0.4, 0.3, 0.7, 0.5, 0.1, 0.7);
    _addadjusttocover("robot", "cover_any", "stance_any", 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.6, 0.7, 0.5, 0.5, 0.5, 0.5, 0.4, 0.4, 0.4);
    _addadjusttocover("robot", "cover_exposed", "stance_any", 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.9, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 19, eflags: 0x6 linked
// Checksum 0x791915fb, Offset: 0x50e8
// Size: 0x210
function private _addadjusttocover(archetype, node, stance, rot2, rot32, rot3, rot36, rot6, rot69, rot9, rot98, rot8, rot87, rot7, rot47, rot4, rot14, rot1, rot21) {
    if (!isdefined(level.adjusttocover)) {
        level.adjusttocover = [];
    }
    if (!isdefined(level.adjusttocover[archetype])) {
        level.adjusttocover[archetype] = [];
    }
    if (!isdefined(level.adjusttocover[archetype][node])) {
        level.adjusttocover[archetype][node] = [];
    }
    directions = [];
    directions[2] = rot2;
    directions[32] = rot32;
    directions[3] = rot3;
    directions[63] = rot36;
    directions[6] = rot6;
    directions[96] = rot69;
    directions[9] = rot9;
    directions[89] = rot98;
    directions[8] = rot8;
    directions[78] = rot87;
    directions[7] = rot7;
    directions[47] = rot47;
    directions[4] = rot4;
    directions[14] = rot14;
    directions[1] = rot1;
    directions[21] = rot21;
    level.adjusttocover[archetype][node][stance] = directions;
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 4, eflags: 0x6 linked
// Checksum 0xc1e8a1c8, Offset: 0x5300
// Size: 0x396
function private _getadjusttocoverrotation(archetype, node, stance, angletonode) {
    assert(isarray(level.adjusttocover[archetype]));
    if (!isdefined(level.adjusttocover[archetype][node])) {
        node = "cover_any";
    }
    assert(isarray(level.adjusttocover[archetype][node]));
    if (!isdefined(level.adjusttocover[archetype][node][stance])) {
        stance = "stance_any";
    }
    assert(isarray(level.adjusttocover[archetype][node][stance]));
    assert(angletonode >= 0 && angletonode < 360);
    direction = undefined;
    if (angletonode < 11.25) {
        direction = 2;
    } else if (angletonode < 33.75) {
        direction = 32;
    } else if (angletonode < 56.25) {
        direction = 3;
    } else if (angletonode < 78.75) {
        direction = 63;
    } else if (angletonode < 101.25) {
        direction = 6;
    } else if (angletonode < 123.75) {
        direction = 96;
    } else if (angletonode < 146.25) {
        direction = 9;
    } else if (angletonode < 168.75) {
        direction = 89;
    } else if (angletonode < 191.25) {
        direction = 8;
    } else if (angletonode < 213.75) {
        direction = 78;
    } else if (angletonode < 236.25) {
        direction = 7;
    } else if (angletonode < 258.75) {
        direction = 47;
    } else if (angletonode < 281.25) {
        direction = 4;
    } else if (angletonode < 303.75) {
        direction = 14;
    } else if (angletonode < 326.25) {
        direction = 1;
    } else if (angletonode < 348.75) {
        direction = 21;
    } else {
        direction = 2;
    }
    assert(isdefined(level.adjusttocover[archetype][node][stance][direction]));
    adjusttime = level.adjusttocover[archetype][node][stance][direction];
    if (isdefined(adjusttime)) {
        return adjusttime;
    }
    return 0.8;
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 1, eflags: 0x4
// Checksum 0xc139950b, Offset: 0x56a0
// Size: 0x156
function private debuglocoexplosion(entity) {
    entity endon(#"death");
    /#
        startorigin = entity.origin;
        startyawforward = anglestoforward((0, entity.angles[1], 0));
        damageyawforward = anglestoforward((0, entity.damageyaw - entity.angles[1], 0));
        starttime = gettime();
        while (gettime() - starttime < 10000) {
            recordsphere(startorigin, 5, (1, 0, 0), "<unknown string>", entity);
            recordline(startorigin, startorigin + startyawforward * 100, (0, 0, 1), "<unknown string>", entity);
            recordline(startorigin, startorigin + damageyawforward * 100, (1, 0, 0), "<unknown string>", entity);
            waitframe(1);
        }
    #/
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x6 linked
// Checksum 0xf907e80e, Offset: 0x5800
// Size: 0xac
function private mocomplocoexplosioninit(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    mocompduration animmode("nogravity", 0);
    mocompduration orientmode("face current");
    /#
        if (getdvarint(#"ai_debuglocoexplosionmocomp", 0)) {
            mocompduration thread debuglocoexplosion(mocompduration);
        }
    #/
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x6 linked
// Checksum 0x594bf545, Offset: 0x58b8
// Size: 0x31e
function private mocompadjusttocoverinit(entity, mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    mocompanimflag orientmode("face current");
    mocompanimflag animmode("angle deltas", 0);
    mocompanimflag.blockingpain = 1;
    if (isdefined(mocompanimflag.node)) {
        mocompanimflag.adjustnode = mocompanimflag.node;
        mocompanimflag.nodeoffsetorigin = mocompanimflag getnodeoffsetposition(mocompanimflag.node);
        mocompanimflag.nodeoffsetangles = mocompanimflag getnodeoffsetangles(mocompanimflag.node);
        mocompanimflag.nodeoffsetforward = anglestoforward(mocompanimflag.nodeoffsetangles);
        mocompanimflag.nodeforward = anglestoforward(mocompanimflag.node.angles);
        mocompanimflag.nodefinalstance = mocompanimflag getblackboardattribute("_desired_stance");
        covertype = mocompanimflag getblackboardattribute("_cover_type");
        if (!isdefined(mocompanimflag.nodefinalstance)) {
            mocompanimflag.nodefinalstance = mocompanimflag aiutility::gethighestnodestance(mocompanimflag.adjustnode);
        }
        angledifference = floor(absangleclamp360(mocompanimflag.angles[1] - mocompanimflag.node.angles[1]));
        var_c9145b1d = mocompanimflag.archetype;
        if (var_c9145b1d == #"civilian") {
            var_c9145b1d = #"human";
        }
        mocompanimflag.mocompanglestarttime = _getadjusttocoverrotation(var_c9145b1d, covertype, mocompanimflag.nodefinalstance, angledifference);
        var_ad846680 = distance(mocompanimflag.nodeoffsetorigin, mocompanimflag.origin);
        slidetime = mocompanimflag.mocompanglestarttime * getanimlength(mocompduration);
        var_cf67af1 = max(1, floor(slidetime / float(function_60d95f53()) / 1000));
        mocompanimflag.var_26b7e15a = var_ad846680 / var_cf67af1;
    }
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x6 linked
// Checksum 0x2d46503b, Offset: 0x5be0
// Size: 0x3bc
function private mocompadjusttocoverupdate(entity, mocompanim, mocompanimblendouttime, *mocompanimflag, mocompduration) {
    if (!isdefined(mocompanim.adjustnode)) {
        return;
    }
    movevector = mocompanim.nodeoffsetorigin - mocompanim.origin;
    var_9efa995e = lengthsquared(movevector);
    if (var_9efa995e > sqr(65)) {
        /#
            record3dtext("<unknown string>" + sqrt(var_9efa995e), mocompanim.origin + (0, 0, 5), (0, 1, 0), "<unknown string>");
        #/
        return;
    }
    if (var_9efa995e > mocompanim.var_26b7e15a * mocompanim.var_26b7e15a) {
        movevector = vectornormalize(movevector) * mocompanim.var_26b7e15a;
    }
    mocompanim forceteleport(mocompanim.origin + movevector, mocompanim.angles, 0);
    normalizedtime = (mocompanim getanimtime(mocompanimblendouttime) * getanimlength(mocompanimblendouttime) + mocompanimflag) / mocompduration;
    if (normalizedtime > mocompanim.mocompanglestarttime) {
        mocompanim orientmode("face angle", mocompanim.nodeoffsetangles);
        mocompanim animmode("normal", 0);
    }
    /#
        if (getdvarint(#"ai_debugadjustmocomp", 0)) {
            record3dtext(mocompanim.mocompanglestarttime, mocompanim.origin + (0, 0, 5), (0, 1, 0), "<unknown string>");
            hiptagorigin = mocompanim gettagorigin("<unknown string>");
            recordline(mocompanim.nodeoffsetorigin, mocompanim.nodeoffsetorigin + mocompanim.nodeoffsetforward * 30, (1, 0.5, 0), "<unknown string>", mocompanim);
            recordline(mocompanim.adjustnode.origin, mocompanim.adjustnode.origin + mocompanim.nodeforward * 20, (0, 1, 0), "<unknown string>", mocompanim);
            recordline(mocompanim.origin, mocompanim.origin + anglestoforward(mocompanim.angles) * 10, (1, 0, 0), "<unknown string>", mocompanim);
            recordline(hiptagorigin, (hiptagorigin[0], hiptagorigin[1], mocompanim.origin[2]), (0, 0, 1), "<unknown string>", mocompanim);
        }
    #/
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x6 linked
// Checksum 0xe09d5604, Offset: 0x5fa8
// Size: 0x20a
function private mocompadjusttocoverterminate(entity, mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    mocompanimflag.blockingpain = 0;
    mocompanimflag.nodeoffsetangle = undefined;
    mocompanimflag.nodeoffsetforward = undefined;
    mocompanimflag.nodeforward = undefined;
    mocompanimflag.nodefinalstance = undefined;
    mocompanimflag.var_26b7e15a = undefined;
    if (mocompanimflag.adjustnode !== mocompanimflag.node) {
        mocompanimflag.nodeoffsetorigin = undefined;
        mocompanimflag.nodeoffsetangles = undefined;
        mocompanimflag.adjustnode = undefined;
        return;
    }
    if (mocompduration != #"") {
        animtime = mocompanimflag getanimtime(mocompduration);
        if (animtime > mocompanimflag.mocompanglestarttime) {
            movevector = mocompanimflag.nodeoffsetorigin - mocompanimflag.origin;
            var_9efa995e = lengthsquared(movevector);
            if (var_9efa995e <= sqr(65)) {
                mocompanimflag forceteleport(mocompanimflag.nodeoffsetorigin, mocompanimflag.nodeoffsetangles, 0);
            } else {
                /#
                    record3dtext("<unknown string>" + sqrt(var_9efa995e), mocompanimflag.origin + (0, 0, 5), (0, 1, 0), "<unknown string>");
                #/
            }
        }
    }
    mocompanimflag.mocompanglestarttime = undefined;
    mocompanimflag.nodeoffsetorigin = undefined;
    mocompanimflag.nodeoffsetangles = undefined;
    mocompanimflag.adjustnode = undefined;
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x6 linked
// Checksum 0xfdc2c56f, Offset: 0x61c0
// Size: 0x16c
function private function_82b9d7b7(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    mocompduration orientmode("face current");
    mocompduration animmode("normal");
    if (isdefined(mocompduration.traverseendnode)) {
        /#
            print3d(mocompduration.traversestartnode.origin, "<unknown string>", (1, 0, 0), 1, 1, 60);
            print3d(mocompduration.traverseendnode.origin, "<unknown string>", (0, 1, 0), 1, 1, 60);
            line(mocompduration.traversestartnode.origin, mocompduration.traverseendnode.origin, (0, 1, 0), 1, 0, 60);
        #/
        mocompduration forceteleport(mocompduration.traverseendnode.origin, mocompduration.traverseendnode.angles, 0);
    }
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x6 linked
// Checksum 0x375f53ea, Offset: 0x6338
// Size: 0x64
function private function_372bf819(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    mocompduration.traversal = undefined;
    if (isactor(mocompduration)) {
        mocompduration finishtraversal();
    }
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0x61bff4f8, Offset: 0x63a8
// Size: 0x6c
function function_9b568914(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    mocompduration orientmode("face motion");
    mocompduration animmode("zonly_physics", 1);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0x4fd4d268, Offset: 0x6420
// Size: 0xa6
function function_7ea5e21f(entity, mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    mocompanimflag animmode("gravity", 1);
    mocompanimflag.var_82d6d030 = 0.5;
    notetrack_times = getnotetracktimes(mocompduration, "face_react");
    if (isdefined(notetrack_times) && notetrack_times.size > 0) {
        mocompanimflag.var_82d6d030 = notetrack_times[0];
    }
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0x7813ed26, Offset: 0x64d0
// Size: 0xa4
function function_8def77d1(entity, mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    if (mocompanimflag getanimtime(mocompduration) >= mocompanimflag.var_82d6d030) {
        mocompanimflag orientmode("face angle", self getblackboardattribute("_react_yaw_world"));
        mocompanimflag animmode("pos deltas", 0);
    }
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0xcee2b6ff, Offset: 0x6580
// Size: 0x104
function function_37dd625c(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    enemy = isdefined(mocompduration.attackable) ? mocompduration.attackable : mocompduration.enemy;
    if (isdefined(enemy)) {
        toenemy = enemy.origin - mocompduration.origin;
        var_8e08536c = vectortoangles(toenemy);
        mocompduration orientmode("face angle", var_8e08536c);
    } else {
        mocompduration orientmode("face enemy");
    }
    mocompduration animmode("zonly_physics");
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0x2e071358, Offset: 0x6690
// Size: 0x12c
function function_f79866a1(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    enemy = isdefined(mocompduration.attackable) ? mocompduration.attackable : mocompduration.enemy;
    if (isdefined(enemy) && isdefined(enemy.health) && enemy.health > 0 && mocompduration function_ebbebf56() > 0.5) {
        var_1b0f41cd = isdefined(self.var_6c5c29fb) ? self.var_6c5c29fb : enemy.origin;
        toenemy = var_1b0f41cd - mocompduration.origin;
        var_8e08536c = vectortoangles(toenemy);
        mocompduration orientmode("face angle", var_8e08536c);
    }
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0x6342c071, Offset: 0x67c8
// Size: 0x14e
function function_116f8e5(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    var_701b7ace = getnotetracktimes(mocompanim, "start_turning");
    if (!isdefined(var_701b7ace[0])) {
        function_37dd625c(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration);
    } else {
        entity orientmode("face default");
        entity animmode("zonly_physics");
    }
    entity.var_beed19f5 = {#var_df5d6edc:getnotetracktimes(mocompanim, "start_turning"), #var_ac20d725:getnotetracktimes(mocompanim, "stop_turning"), #anim_length:getanimlength(mocompanim)};
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0x95ab31ed, Offset: 0x6920
// Size: 0x114
function function_6fd3b59(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration) {
    if (isdefined(entity.var_beed19f5)) {
        var_85838c4e = entity getanimtime(mocompanim);
        if (isdefined(entity.var_beed19f5.var_df5d6edc[0])) {
            if (var_85838c4e < entity.var_beed19f5.var_df5d6edc[0]) {
                return;
            }
        }
        if (isdefined(entity.var_beed19f5.var_ac20d725[0])) {
            if (var_85838c4e > entity.var_beed19f5.var_ac20d725[0]) {
                entity orientmode("face default");
                return;
            }
        }
    }
    function_f79866a1(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0x3d6d73a6, Offset: 0x6a40
// Size: 0x2e4
function function_fe81623b(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    if (!isdefined(mocompduration.var_24594a06)) {
        mocompduration.var_24594a06 = 400;
    }
    if (!isdefined(mocompduration.var_d8481de)) {
        mocompduration.var_d8481de = 1;
    }
    if (!isdefined(mocompduration.var_9f536dbe)) {
        mocompduration.var_9f536dbe = 1;
    }
    if (!isdefined(mocompduration.var_331c8e1b)) {
        mocompduration.var_331c8e1b = 1;
    }
    if (!isdefined(mocompduration.var_b98d64dc)) {
        mocompduration.var_b98d64dc = 0;
    }
    resistance = mocompduration.var_9f536dbe;
    /#
        if (getdvarfloat(#"hash_47f178a6f202647", -1) >= 0) {
            resistance = getdvarfloat(#"hash_47f178a6f202647", -1);
        }
    #/
    mocompduration.var_a94d73fa = mocompduration.var_24594a06 * mocompduration.var_d8481de * 1 / resistance;
    mocompduration.var_faf3d7c1 = anglestoforward(mocompduration.angles) * -1 * mocompduration.var_a94d73fa;
    if (!is_true(mocompduration.var_d667c9b7)) {
        var_9efb1605 = mocompduration.var_b98d64dc;
        var_9efb1605 += min(getdvarfloat(#"hash_554109ca6ea62d2a", 250), mocompduration.var_24594a06 * mocompduration.var_d8481de * 1 / resistance * getdvarfloat(#"hash_1b2914f9c8ff0bca", 0.5)) * mocompduration.var_331c8e1b;
        var_9efb1605 = max(var_9efb1605, getdvarfloat(#"hash_555bf3ca6ebccf80", 40));
        mocompduration.var_efe6f3a3 = (0, 0, 1) * var_9efb1605;
        mocompduration.var_d667c9b7 = 1;
    }
    mocompduration animmode(getdvarstring(#"hash_6e6346c189807dc8", "normal_nogravity"), 0);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0xee46e8a4, Offset: 0x6d30
// Size: 0x44
function function_62e758f2(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    function_c0c49b7f(mocompduration);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0xb0dcf3ca, Offset: 0x6d80
// Size: 0x6c
function function_ca49e713(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    mocompduration animmode(getdvarstring(#"hash_6e6346c189807dc8", "normal_nogravity"), 0);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0xa0d8e9a0, Offset: 0x6df8
// Size: 0x44
function function_c95a9f41(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    function_c0c49b7f(mocompduration);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 1, eflags: 0x6 linked
// Checksum 0xf66be52b, Offset: 0x6e48
// Size: 0x4a4
function private function_c0c49b7f(entity) {
    if (!isdefined(entity.var_d4da163b)) {
        entity.var_d4da163b = 1;
    }
    var_2a59a682 = 0;
    var_64a2a5c = 10;
    var_f7e89156 = -40;
    if (is_true(entity.var_d4da163b)) {
        entity.var_d4da163b = 0;
        if (is_true(entity.var_d667c9b7) && entity.var_efe6f3a3[2] < var_f7e89156 && abs(entity.origin[2] - entity.var_9600fb93[2]) < var_64a2a5c) {
            var_2a59a682 = 1;
            trace = physicstraceex(entity.origin, entity.origin + (0, 0, var_64a2a5c * -1), (-15, -15, 0), (15, 15, 72), entity);
            if (trace[#"fraction"] !== 1) {
                entity.var_d667c9b7 = 0;
            }
        }
    }
    if (!is_true(entity.var_d667c9b7)) {
        return;
    }
    velocity_norm = vectornormalize(entity.var_faf3d7c1);
    if (!is_true(entity.var_d4da163b) && !is_true(var_2a59a682)) {
        entity.var_d4da163b = 1;
        var_cb67bd59 = lengthsquared(entity.var_faf3d7c1);
        var_97d0d061 = entity getpathfindingradius() * 2;
        if (var_cb67bd59 > sqr(var_97d0d061)) {
            z_offset = (0, 0, 30);
            trace = physicstrace(entity.origin + z_offset, entity.origin + z_offset + velocity_norm * sqrt(var_cb67bd59), (0, 0, 0), (0, 0, 0), entity);
            if (trace[#"fraction"] !== 1) {
                velocity_norm = (0, 0, 0);
            }
        }
    }
    delta_time = float(function_60d95f53()) / 1000;
    var_9efb1605 = max(getdvarfloat(#"hash_76bec38f9a9d6b0d", -400), entity.var_efe6f3a3[2] - getdvarfloat(#"hash_d6605b567299ef9", 800) * delta_time);
    entity.var_efe6f3a3 = (0, 0, var_9efb1605);
    entity.var_faf3d7c1 = velocity_norm * max(0, length(entity.var_faf3d7c1) - getdvarfloat(#"hash_4d1ccba5efdca6f0", 50) * delta_time);
    delta_velocity = (entity.var_faf3d7c1 + entity.var_efe6f3a3) * delta_time;
    entity.var_9600fb93 = entity.origin;
    entity forceteleport(entity.origin + delta_velocity, entity.angles, 0, 0);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0xc911c990, Offset: 0x72f8
// Size: 0x74
function function_59fe75e2(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    mocompduration.blockingpain = 1;
    mocompduration orientmode("face current");
    mocompduration animmode("zonly_physics", 1);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0x86186090, Offset: 0x7378
// Size: 0x74
function function_8559a6cd(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    mocompduration.blockingpain = 1;
    mocompduration orientmode("face current");
    mocompduration animmode("zonly_physics", 1);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x2 linked
// Checksum 0x64d96ef3, Offset: 0x73f8
// Size: 0x74
function function_4b95cde(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    mocompduration.blockingpain = 0;
    mocompduration orientmode("face current");
    mocompduration animmode("normal", 0);
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x6 linked
// Checksum 0x7c445d5a, Offset: 0x7478
// Size: 0xa4
function private mocompignorepainfaceenemyinit(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    mocompduration.blockingpain = 1;
    if (isdefined(mocompduration.enemy)) {
        mocompduration orientmode("face enemy");
    } else {
        mocompduration orientmode("face current");
    }
    mocompduration animmode("pos deltas");
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x6 linked
// Checksum 0xd0cd830f, Offset: 0x7528
// Size: 0x9c
function private mocompignorepainfaceenemyupdate(entity, mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    if (isdefined(mocompanimflag.enemy) && mocompanimflag getanimtime(mocompduration) < 0.5) {
        mocompanimflag orientmode("face enemy");
        return;
    }
    mocompanimflag orientmode("face current");
}

// Namespace archetype_mocomps_utility/archetype_mocomps_utility
// Params 5, eflags: 0x6 linked
// Checksum 0x52f8b4f9, Offset: 0x75d0
// Size: 0x36
function private mocompignorepainfaceenemyterminate(entity, *mocompanim, *mocompanimblendouttime, *mocompanimflag, *mocompduration) {
    mocompduration.blockingpain = 0;
}

