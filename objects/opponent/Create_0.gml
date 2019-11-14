/// @description all in one object opponent

//setup opponent deck
d = ds_stack_create();
for (var i=0; i<30; i++)
{
	ds_stack_push(d,i);
}
d=shuffle_deck(d);

//setup discard pile
pile = ds_stack_create();

//setup opponent hand
h = ds_list_create();
hand_size =0;

//create the oponent outfit data structure
o = ds_stack_create();
show_extra = 0;
total_power=0;
h=0;

on = [];
on[0,0] = false;
on[0,1] = false;
on[0,2] = false;
on[0,3] = false;

//visual settings
scale=0.7;
card_scale = 0.5;
card_wid = 64*card_scale;
image_xscale=scale;
image_yscale=scale;
x=room_width/2;
image_alpha=0.25;
mid_x = room_width/2;
mid_y = y-(sprite_height*scale);