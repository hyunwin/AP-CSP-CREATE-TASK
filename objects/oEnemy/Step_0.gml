

 
//  h collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting (x+sign(hsp),y,oWall))
	{
		x += sign(hsp) ;
	}
	hsp = -hsp;
}
x += hsp;

//  v collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting (x,y+sign(vsp),oWall))
	{
		y += sign(vsp) ;
	}
	vsp = 0;
}
y += vsp;




// Animation
if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sEnemyJump;
	image_speed = 0;
	if (sign(vsp) > 0) image_index= 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sEnemyRun;
	}
}

if (hsp != 0) image_xscale = sign(hsp);


if (hp <= 0) instance_destroy();


//Enemy Collision
if (place_meeting(x,y,oOldMan))
{
	if (sOldMan.y < y - 16)
	{
		with (sOldMan)vsp = -hsp;
		instance_create_layer(x,y,layer, oEnemyDead)
		instance_destroy();
	}
	else
	{
		room_goto_next();
	}
}
