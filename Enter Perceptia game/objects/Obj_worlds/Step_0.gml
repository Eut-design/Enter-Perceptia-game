if (keyboard_check_pressed(ord("T")))
{
    is_real_world = !is_real_world;
}

layer_set_visible("real", is_real_world);
layer_set_visible("revealed", !is_real_world);