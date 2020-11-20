var move = 0;
move -= max(keyboard_check_pressed(vk_up),0);
move += max(keyboard_check_pressed(vk_down),0);

if (move != 0)
{
	mpos += move;
	if (mpos < 0) mpos = array_length_1d(menu) - 1;
	if (mpos> array_length_1d(menu) - 1) mpos = 0;
}

var push;
push = max(keyboard_check_released(vk_enter),0);
if (push == 1) scrDeathScreen();
