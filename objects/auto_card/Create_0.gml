/// @description Setup

value = -1;
pow = irandom_range(1,5);

mode = "Outfit Add";
phase = 0;
orig_x=x;
orig_y=y;
dest_x=0;
dest_y=0;
first_step = true;
emergency_stop=30;

//visuals
scale = 0.5;
mid_scale=1.3;
final_scale=1;
image_xscale=scale;
image_yscale=scale;

delay=room_speed/2;