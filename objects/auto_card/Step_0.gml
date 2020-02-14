/// @description handle moving the card around

image_xscale=scale;
image_yscale=scale;

if first_step
{
	phase =1;
	dest_x=opponent.x-opponent.sprite_width;
	dest_y=opponent.y
	orig_x=x;
	orig_y=y;
	first_step=false;
}

if phase == 1
{
	x=lerp(x,dest_x,0.2);
	y=lerp(y,dest_y,0.2);
	scale=lerp(scale,mid_scale,0.1);
	if round(x) == round(dest_x) && round(y) == round(dest_y)
	{
		phase=2;
		dest_x=opponent.x;
		orig_x=x;
		orig_y=y;
	}
	//emergency_stop--;
	if emergency_stop<=0
	{
		phase=2;
		dest_x=opponent.x;
		orig_x=x;
		orig_y=y;
	}
}

if phase==2 //pause for a second
{
	delay--;
	scale=lerp(scale,mid_scale,0.1);
	if delay <= 0
		phase=3;
}

if phase == 3
{
	x=lerp(x,dest_x,0.2);
	scale=lerp(scale,final_scale,0.2);
	if round(x) ==round(dest_x)
	{
		ds_stack_push(opponent.o,value);
		instance_destroy(self);
	}
}