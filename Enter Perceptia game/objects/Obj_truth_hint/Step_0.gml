/// @description Insert description here
// You can write your code in this editor
if (room != Room_Level1) exit;

// when player presses T, complete the word once
if (!revealed && keyboard_check_pressed(ord("T")))
{
    text = "TRUTH HIDDEN";
    revealed = true;
    timer = 120; // stays for 2 seconds
}

// countdown to disappear
if (revealed && timer > 0)
{
    timer -= 1;
}

// destroy after showing full text
if (revealed && timer <= 0)
{
    instance_destroy();
}

