show_debug_message("STEP RUNNING");

var world = instance_find(Obj_worlds, 0);
var data = instance_find(Obj_gamedata, 0);

// movement
hsp = 0;

if (keyboard_check(ord("A"))) hsp = -spd;
if (keyboard_check(ord("D"))) hsp = spd;

// horizontal collision
if (place_meeting(x + hsp, y, Obj_floor) || place_meeting(x + hsp, y, Obj_wall))
{
    while (!place_meeting(x + sign(hsp), y, Obj_floor) 
        && !place_meeting(x + sign(hsp), y, Obj_wall))
    {
        x += sign(hsp);
    }
    hsp = 0;
}

x += hsp;

// gravity
vsp += grv;

// jump
if (place_meeting(x, y + 1, Obj_floor))
{
    can_double_jump = true;

    if (keyboard_check_pressed(vk_space))
        vsp = jmp;
}
else
{
    if (keyboard_check_pressed(vk_space) && can_double_jump)
    {
        vsp = jmp;
        can_double_jump = false;
    }
}

// vertical collision
if (place_meeting(x, y + vsp, Obj_floor) || place_meeting(x, y + vsp, Obj_wall))
{
    while (!place_meeting(x, y + sign(vsp), Obj_floor) 
        && !place_meeting(x, y + sign(vsp), Obj_wall))
    {
        y += sign(vsp);
    }
    vsp = 0;
}

y += vsp;

// hazards (SAFE FIX)
if (world != noone)
{
    if (!world.is_real_world && place_meeting(x, y, Obj_revealed))
    {
        room_goto(Room_GameOver);
    }

    if (world.is_real_world && place_meeting(x, y, Obj_real))
    {
        room_goto(Room_GameOver);
    }
}

// coins
if (world != noone && world.is_real_world)
{
    var c = instance_place(x, y, Obj_coin);
    if (c != noone)
    {
        score += 1;
        instance_destroy(c);
    }
}
else if (world != noone)
{
    var c2 = instance_place(x, y, Obj_coin_revealed);
    if (c2 != noone)
    {
        score += 2;
        instance_destroy(c2);
    }
}

// timer
time += 1;

// DOORS (only interact if active)

if (!finished)
{
    var win = instance_place(x, y, Obj_door_next);
    if (win != noone && win.active)
    {
        finished = true;
        room_goto(Room_win);
    }

    var fail = instance_place(x, y, Obj_door_fail);
    if (fail != noone && fail.active)
    {
        finished = true;
        room_goto(Room_GameOver);
    }
}

