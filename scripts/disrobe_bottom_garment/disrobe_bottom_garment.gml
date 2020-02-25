var target = argument0;

if target == t.player
{
	var temp = ds_stack_create();
	ds_stack_copy(temp,play_area.o);
	var hannoi = ds_stack_create();
	var val = 0;
	for (var i=0; i< ds_stack_size(temp); i++)
	{
		val = ds_stack_pop(temp);
		ds_stack_push(hannoi,val);
	}
	val = ds_stack_pop(temp);
	ds_stack_destroy(temp);
	ds_stack_destroy(hannoi);
	play_area.on[0,val%4] = false;
	play_area.on[1,val%4] = 0;
	var dis = instance_create_layer(play_area.x,play_area.y,"UI",discard_card);
	dis.value = val;
	dis.destination=discard;
}

if target == t.opponent
{
	var temp = ds_stack_create();
	ds_stack_copy(temp,opponent.o);
	var hannoi = ds_stack_create();
	var val = 0;
	for (var i=0; i< ds_stack_size(temp); i++)
	{
		val = ds_stack_pop(temp);
		ds_stack_push(hannoi,val);
	}
	val = ds_stack_pop(temp);
	ds_stack_destroy(temp);
	ds_stack_destroy(hannoi);
	opponent.on[0,val%4] = false;
	opponent.on[1,val%4] = 0;
	var dis = instance_create_layer(opponent.x,opponent.y,"UI",discard_card);
	dis.value = val;
	dis.destination = opp_discard;
}