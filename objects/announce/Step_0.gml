/// @description Insert description here
// You can write your code in this editor
ttl -=1;
if ttl <=0
{
	image_speed=spd*-1;
	xtarget = 0-room_width;
}
	
if image_index <1 && ttl <= 0
	instance_destroy(self);
	
if (image_index > image_number - 1) && ttl > 0
{
	image_speed = 0;
}

if floor(xslide) != floor(xtarget)
	xslide = lerp(xslide,xtarget,0.1);
