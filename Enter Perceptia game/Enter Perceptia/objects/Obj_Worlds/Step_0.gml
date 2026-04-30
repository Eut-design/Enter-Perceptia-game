/// @description change worlds
// You can write your code in this editor

if keyboard_check_pressed(ord("T"))
{
	is_real_world = !is_real_world;
	show_debug_message("Is Real World: " + string(is_real_world));
	
	layer_set_visible("real", is_real_world);
	layer_set_visible("revealed", !is_real_world);
}