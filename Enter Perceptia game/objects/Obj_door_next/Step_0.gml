/// @description Insert description here
// You can write your code in this editor
var world = instance_find(Obj_worlds, 0);

if (world != noone) {
    // This door is ONLY active in the Revealed World (NOT real world)
    if (world.is_real_world == false) {
        active = true;
        visible = true;
    } else {
        active = false;
        visible = false;
    }
}