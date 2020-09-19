function disrobe_garment(argument0) {
	var target = argument0;

	if target == t.player
	{
		var temp = ds_stack_top(play_area.o);
		play_area.on[0,temp%4] = false;
		var dis = instance_create_layer(play_area.x,play_area.y,"UI",discard_card);
		dis.value = ds_stack_pop(play_area.o);
		dis.destination=discard;
		dis.pow = play_area.on[1,temp%4]
		play_area.on[1,temp%4] = 0;
	}

	if target == t.opponent
	{
		var temp = ds_stack_top(opponent.o);
		opponent.on[0,temp%4] = false;
		var dis = instance_create_layer(opponent.x,opponent.y,"UI",discard_card);
		dis.value = ds_stack_pop(opponent.o);
		dis.destination = opp_discard;
		dis.pow = opponent.on[1,temp%4]
		opponent.total_power -= dis.pow;
		opponent.on[1,temp%4] = 0;
	}


}
