if (room == Room_Level1)
{
    // reset alignment (important)
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_colour(c_white);

    var seconds = floor(time / 60);

    draw_text(20, 20, "Score: " + string(score));
    draw_text(20, 50, "Time: " + string(seconds) + "s");
}