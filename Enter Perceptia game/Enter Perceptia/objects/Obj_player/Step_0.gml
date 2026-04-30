/// @description Move the player

if keyboard_check(ord("W"))
{
	y += -4;
}


if keyboard_check(ord("S"))
{
	y += +4;
}


if keyboard_check(ord("A"))
{
	x += -4;
}

if keyboard_check(ord("D"))
{
	x += +4;
}