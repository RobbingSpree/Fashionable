var target = argument0;

if target == t.player
{
	var temp = ds_stack_top(play_area.o);
	play_area.on[0,temp%4] = false;
	play_area.on[1,temp%4] = 0;
	var dis = instance_create_layer(play_area.x,play_area.y,"UI",discard_card);
	dis.value = ds_stack_pop(play_area.o);
}

if target == t.opponent
{
	
	
}