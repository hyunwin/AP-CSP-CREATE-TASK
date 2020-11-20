

// going places
keyLeft = keyboard_check (vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check (vk_right) || keyboard_check(ord("D"));
keyJump = keyboard_check (vk_up) || keyboard_check(ord("W"));

// movement
var move = keyRight - keyLeft

hsp = move * walksp;
vsp = vsp + grv;


if (place_meeting(x,y+1,oWall)) && (keyJump)
{
	vsp = -6;
}
//  h collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting (x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp) ;
	}
	hsp = 0;
}
x = x + hsp;

//  v collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting (x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp) ;
	}
	vsp = 0;
}
y = y + vsp;




// Animation
if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sOldManJump;
	image_speed = 0;
	if (sign(vsp) > 0) image_index= 0; else image_index = 1;
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sOldMan;
	}
	else
	{
		sprite_index = sOldManRun
	}	
}

if (hsp != 0) image_xscale = sign(hsp);

