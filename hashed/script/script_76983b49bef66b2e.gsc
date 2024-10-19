// Atian COD Tools GSC CW decompiler test
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_350cffecd05ef6cf;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_9038b9d9;

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 0, eflags: 0x2 linked
// Checksum 0x43d4df8d, Offset: 0x310
// Size: 0x24e
function function_6ec0595a() {
    self notify("504669bff9236601");
    self endon("504669bff9236601");
    if (isplayer(self)) {
        self endon(#"disconnect");
    }
    self endon(#"death");
    self endon(#"player_died");
    if (!isdefined(self.doa.tesla_org)) {
        org = namespace_ec06fe4a::spawnmodel(self.origin, "tag_origin");
        if (!isdefined(org)) {
            return;
        }
        org enablelinkto();
        org.targetname = "tesla_org";
        org.angles = (0, randomint(180), 0);
        self.doa.tesla_org = org;
        org.owner = self;
        org.objects = [];
        org linkto(self, undefined, (0, 0, 30));
        org thread namespace_ec06fe4a::function_f506b4c7(1);
        org thread function_3be74620(self);
        self thread function_8efc825c(org);
    }
    self function_dd76db7c(self.doa.tesla_org);
    timeout = self namespace_1c2a96f9::function_4808b985(30);
    while (!namespace_dfc652ee::function_f759a457()) {
        waitframe(1);
    }
    wait(timeout);
    if (isdefined(self.doa.tesla_org)) {
        self.doa.tesla_org notify(#"hash_44e59870e1833e7");
    }
    self notify(#"hash_5c369acbb01ea11");
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 0, eflags: 0x2 linked
// Checksum 0x8d8e1e1f, Offset: 0x568
// Size: 0x1c0
function function_9b8a196a() {
    ball = namespace_ec06fe4a::spawnmodel(self.origin, "zombietron_tesla_ball");
    if (!isdefined(ball)) {
        return;
    }
    ball setplayercollision(0);
    ball enablelinkto();
    ball.targetname = "teslaBall";
    ball thread function_453dcc55();
    trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", ball.origin, 1 | 512 | 8, 18, 50);
    if (!isdefined(trigger)) {
        ball delete();
        return;
    }
    trigger.targetname = "teslaTrigger";
    trigger enablelinkto();
    trigger linkto(ball);
    trigger thread function_49ee8def();
    trigger.ball = ball;
    ball.trigger = trigger;
    ball namespace_83eb6304::function_3ecfde67("tesla_trail");
    ball namespace_83eb6304::function_3ecfde67("tesla_ball");
    ball namespace_e32bb68::function_3a59ec34("evt_doa_pickup_teslaball_active_lp");
    return ball;
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 1, eflags: 0x2 linked
// Checksum 0x2f058232, Offset: 0x730
// Size: 0x2dc
function function_dd76db7c(org) {
    angle = randomint(360);
    var_eb19ca0d = rotatepointaroundaxis((60, 0, 0), (0, 0, 1), org.angles[1] + angle);
    var_19e02799 = rotatepointaroundaxis((60, 0, 0), (0, 0, 1), org.angles[1] + angle + 180);
    var_7ccfed7b = rotatepointaroundaxis((60, 0, 0), (0, 0, 1), org.angles[1] + angle + 90);
    var_6b8d4af6 = rotatepointaroundaxis((60, 0, 0), (0, 0, 1), org.angles[1] + angle - 90);
    ball = function_9b8a196a();
    if (isdefined(ball)) {
        ball.org = org;
        ball linkto(org, "tag_origin", var_eb19ca0d);
        org.objects[org.objects.size] = ball;
    }
    ball = function_9b8a196a();
    if (isdefined(ball)) {
        ball.org = org;
        ball linkto(org, "tag_origin", var_19e02799);
        org.objects[org.objects.size] = ball;
    }
    ball = function_9b8a196a();
    if (isdefined(ball)) {
        ball.org = org;
        ball linkto(org, "tag_origin", var_7ccfed7b);
        org.objects[org.objects.size] = ball;
    }
    ball = function_9b8a196a();
    if (isdefined(ball)) {
        ball.org = org;
        ball linkto(org, "tag_origin", var_6b8d4af6);
        org.objects[org.objects.size] = ball;
    }
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 0, eflags: 0x2 linked
// Checksum 0x195ca6d7, Offset: 0xa18
// Size: 0xec
function function_453dcc55() {
    self notify("36c3208bf48c30a6");
    self endon("36c3208bf48c30a6");
    self endon(#"death");
    self waittill(#"hash_44e59870e1833e7");
    if (isdefined(self.trigger)) {
        self.trigger delete();
    }
    self unlink();
    vel = self.org.origin - self.origin + (0, 0, 50);
    self thread function_f50d3546(self.org, vel);
    wait(5);
    self delete();
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 2, eflags: 0x2 linked
// Checksum 0xd4cee892, Offset: 0xb10
// Size: 0xc4
function function_f50d3546(org, vel) {
    self moveto(org.origin, 0.5);
    self waittilltimeout(1, #"movedone");
    vel *= 0.25;
    self namespace_83eb6304::function_3ecfde67("tesla_launch");
    self namespace_e32bb68::function_ae271c0b("evt_doa_pickup_teslaball_active_lp");
    self physicslaunch(self.origin, vel);
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 1, eflags: 0x2 linked
// Checksum 0xdb00de4e, Offset: 0xbe0
// Size: 0x13c
function function_3be74620(owner) {
    self notify("9a8fea8ce1c3c75");
    self endon("9a8fea8ce1c3c75");
    self endon(#"death");
    self endon(#"hash_5c369acbb01ea11");
    self waittill(#"hash_44e59870e1833e7");
    foreach (obj in self.objects) {
        if (isdefined(obj)) {
            obj notify(#"hash_44e59870e1833e7");
        }
    }
    if (isdefined(owner)) {
        owner namespace_e32bb68::function_3a59ec34("evt_doa_pickup_teslaball_active_end");
        owner.doa.tesla_org = undefined;
    }
    waitframe(1);
    self delete();
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 1, eflags: 0x2 linked
// Checksum 0xa7b28ada, Offset: 0xd28
// Size: 0xa8
function function_8efc825c(org) {
    self notify("7e89a0539e6e1ba2");
    self endon("7e89a0539e6e1ba2");
    self endon(#"hash_5c369acbb01ea11");
    self waittill(#"disconnect", #"entering_last_stand", #"death", #"player_died", #"clone_shutdown");
    if (isdefined(org)) {
        org notify(#"hash_44e59870e1833e7");
    }
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 0, eflags: 0x2 linked
// Checksum 0xb8614a1, Offset: 0xdd8
// Size: 0x100
function function_49ee8def() {
    self endon(#"death");
    while (true) {
        result = self waittill(#"trigger");
        guy = result.activator;
        if (isplayer(guy)) {
            continue;
        }
        if (is_true(guy.boss)) {
            continue;
        }
        result = level function_8d45f3be(guy, self.ball.org.owner);
        if (result) {
            self.ball delete();
            self delete();
        }
    }
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 2, eflags: 0x2 linked
// Checksum 0x15475473, Offset: 0xee0
// Size: 0xb4
function function_8d45f3be(guy, attacker) {
    if (!isdefined(guy)) {
        return;
    }
    if (isdefined(guy.damagedby) && guy.damagedby == "tesla" || is_true(guy.tesla_death)) {
        return 0;
    }
    if (function_5d21013(attacker)) {
        guy.damagedby = "tesla";
        guy thread function_957d23cc(attacker);
        return 1;
    }
    return 0;
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 1, eflags: 0x2 linked
// Checksum 0x32a57a5f, Offset: 0xfa0
// Size: 0x3a
function function_5d21013(player) {
    if (!isdefined(player.var_e253250e)) {
        return true;
    }
    if (player.var_e253250e == 0) {
        return false;
    }
    return true;
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 1, eflags: 0x2 linked
// Checksum 0x8eac59eb, Offset: 0xfe8
// Size: 0xd6
function function_957d23cc(player) {
    if (!isdefined(player)) {
        return;
    }
    if (isplayer(player)) {
        player endon(#"disconnect");
    }
    player endon(#"death");
    player.tesla_enemies = undefined;
    player.tesla_enemies_hit = 1;
    player.var_b740173a = 0;
    player notify(#"hash_45f6a84f01d669d5");
    self namespace_83eb6304::function_3ecfde67("tesla_shock");
    self function_d9c75d31(self, player, 0);
    player.tesla_enemies_hit = 0;
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 3, eflags: 0x2 linked
// Checksum 0xe94153f2, Offset: 0x10c8
// Size: 0x2a0
function function_d9c75d31(source_enemy, player, arc_num) {
    if (isplayer(player)) {
        player endon(#"disconnect");
    }
    player endon(#"death");
    function_c6988f55(self, 1);
    radius_decay = getdvarint(#"hash_3eb3a662a40de94a", 20) * arc_num;
    enemies = function_2513a3f2(self gettagorigin("j_head"), getdvarint(#"hash_28fd9a5b3176c120", 300) - radius_decay, player);
    function_c6988f55(enemies, 1);
    self thread function_9a98038e(source_enemy, arc_num, player);
    foreach (guy in enemies) {
        if (!isactor(guy)) {
            continue;
        }
        if (guy == self) {
            continue;
        }
        if (is_true(guy.var_d415ee14) || is_true(guy.boss)) {
            continue;
        }
        if (function_a34a58f4(arc_num + 1, player.tesla_enemies_hit)) {
            function_c6988f55(guy, 0);
            continue;
        }
        player.tesla_enemies_hit++;
        guy thread function_d9c75d31(self, player, arc_num + 1);
    }
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 2, eflags: 0x2 linked
// Checksum 0x67b6aec1, Offset: 0x1370
// Size: 0xe8
function function_a34a58f4(arc_num, enemies_hit_num) {
    if (arc_num >= getdvarint(#"hash_7ec1e8e3c113c497", 5)) {
        return true;
    }
    if (enemies_hit_num >= getdvarint(#"hash_29241bffeb128947", 20)) {
        return true;
    }
    radius_decay = getdvarint(#"hash_3eb3a662a40de94a", 20) * arc_num;
    if (getdvarint(#"hash_28fd9a5b3176c120", 300) - radius_decay <= 0) {
        return true;
    }
    return false;
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 3, eflags: 0x2 linked
// Checksum 0xff5fca37, Offset: 0x1460
// Size: 0x1e6
function function_2513a3f2(origin, distance, player) {
    if (!isdefined(origin)) {
        return [];
    }
    distance_squared = distance * distance;
    enemies = [];
    if (!isdefined(player.tesla_enemies)) {
        team = util::getotherteam(player.team);
        player.tesla_enemies = getaiteamarray(team);
        player.tesla_enemies = arraysortclosest(player.tesla_enemies, origin);
    }
    foreach (zombie in player.tesla_enemies) {
        if (!isdefined(zombie)) {
            continue;
        }
        if (!isactor(zombie)) {
            continue;
        }
        if (is_true(zombie.var_c17aa4a3)) {
            continue;
        }
        test_origin = zombie gettagorigin("j_head");
        if (distancesquared(origin, test_origin) > distance_squared) {
            continue;
        }
        if (!bullettracepassed(origin, test_origin, 0, undefined)) {
            continue;
        }
        enemies[enemies.size] = zombie;
    }
    return enemies;
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 2, eflags: 0x2 linked
// Checksum 0xb1a41cf3, Offset: 0x1650
// Size: 0x76
function function_c6988f55(enemy, hit) {
    if (!isdefined(enemy)) {
        return;
    }
    if (isarray(enemy)) {
        for (i = 0; i < enemy.size; i++) {
            enemy[i].var_c17aa4a3 = hit;
        }
        return;
    }
    enemy.var_c17aa4a3 = hit;
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 3, eflags: 0x2 linked
// Checksum 0x9be58684, Offset: 0x16d0
// Size: 0x1ec
function function_9a98038e(source_enemy, arc_num, player) {
    if (isplayer(player)) {
        player endon(#"disconnect");
    }
    timetowait = 0.2 * arc_num;
    if (timetowait > 0) {
        wait(timetowait);
    }
    if (!isdefined(self) || !isalive(self)) {
        return;
    }
    if (isdefined(source_enemy) && source_enemy != self) {
        source_enemy tesla_play_arc_fx(self);
    }
    if (!isdefined(self) || !isalive(self) || is_true(self.boss)) {
        return;
    }
    self.tesla_death = 1;
    self thread function_ba559b7b(arc_num);
    origin = player.origin;
    if (isdefined(source_enemy) && source_enemy != self) {
        origin = source_enemy.origin;
    }
    if (self.archetype == "zombie") {
        self namespace_ed80aead::function_c25b3c76(undefined, player);
        return;
    }
    if (self.archetype == "robot") {
        self namespace_ed80aead::function_586ef822();
        return;
    }
    self thread namespace_ec06fe4a::function_570729f0(0.1, player);
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 1, eflags: 0x2 linked
// Checksum 0x7bbef604, Offset: 0x18c8
// Size: 0x94
function function_ba559b7b(arc_num) {
    if (arc_num > 1) {
        self namespace_83eb6304::function_3ecfde67("tesla_shock_eyes");
    }
    self namespace_83eb6304::function_3ecfde67("tesla_shock");
    self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_teslaball_impact");
    level namespace_ed80aead::trygibbinghead(self, 100);
}

// Namespace namespace_9038b9d9/namespace_22bc97b1
// Params 1, eflags: 0x2 linked
// Checksum 0x55b8460, Offset: 0x1968
// Size: 0x24c
function tesla_play_arc_fx(target) {
    if (!isdefined(self) || !isdefined(target)) {
        wait(getdvarfloat(#"hash_d68c28b3c93b18f", 0.05));
        return;
    }
    tag = "J_SpineUpper";
    if (is_true(self.isdog)) {
        tag = "J_Spine1";
    }
    target_tag = "J_SpineUpper";
    if (is_true(target.isdog)) {
        target_tag = "J_Spine1";
    }
    origin = self gettagorigin(tag);
    target_origin = target gettagorigin(target_tag);
    distsq = distancesquared(origin, target_origin);
    var_1a24eda0 = distsq / sqr(128);
    timemove = var_1a24eda0 * getdvarfloat(#"hash_d68c28b3c93b18f", 0.05);
    if (timemove < 0.2) {
        timemove = 0.2;
    }
    fxorg = namespace_ec06fe4a::spawnmodel(origin, "tag_origin", undefined, "doa_tesla_fxOrg");
    if (isdefined(fxorg)) {
        fxorg namespace_83eb6304::function_3ecfde67("tesla_trail");
        fxorg moveto(target_origin, timemove);
        fxorg waittilltimeout(timemove + 1, #"movedone");
        fxorg delete();
    }
}

