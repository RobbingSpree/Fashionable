/// @description 

randomize();

hand_size = 0;
global.holding = noone;
global.h_index = noone;

d = ds_stack_create();
for (var i=0; i<30; i++)
{
	ds_stack_push(d,i);
}
d=shuffle_deck(d);