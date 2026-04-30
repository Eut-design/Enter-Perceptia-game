/// @description Insert description here
// You can write your code in this editor
if (room != Room_Level1) exit;

var txt = text;

// only glitch BEFORE reveal
var offset = 0;
if (!revealed)
{
    offset = random_range(-3, 3);
}

// make text bigger
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(-1); // default font (keep if you don’t have custom)

// scale up text
var scale = 2.5;

// draw with scaling
draw_text_transformed(
    room_width / 2 + offset,
    room_height / 3,
    txt,
    scale,
    scale,
    0
);