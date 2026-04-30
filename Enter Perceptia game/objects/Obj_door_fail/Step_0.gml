/// @description Insert description here
// You can write your code in this editor
var world = instance_find(Obj_worlds, 0);

if (world != noone) {
  
  // This door is ONLY active in the Real World
    if (world.is_real_world == true) {
        active = true;
        visible = true;
    } else {
        active = false;
        visible = false;
    }
}