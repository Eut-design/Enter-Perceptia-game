var data = instance_find(Obj_gamedata, 0);

var seconds = 0;
var score_val = 0;
var stars_val = 0;

if (data != noone)
{
    seconds = floor(data.final_time / 60);
    score_val = data.final_score;
    stars_val = data.stars;
}

draw_text(300, 200, "YOU WIN!");
draw_text(300, 240, "Score: " + string(score_val));
draw_text(300, 280, "Time: " + string(seconds) + "s");

var star_string = "";

for (var i = 0; i < stars_val; i++)
{
    star_string += "*";
}

draw_text(300, 320, star_string);