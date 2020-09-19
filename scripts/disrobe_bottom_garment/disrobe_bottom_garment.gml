function disrobe_bottom_garment(argument0) {
	var target = argument0;

	if target == t.player
	{
		var temp = ds_stack_create(); //copy of outfit stack
		ds_stack_copy(temp,play_area.o);
		var hannoi = ds_stack_create(); //to be an upside down copy of outfit minus the bottom layer
		var val = 0;
		//flip temp onto hannoi
		for (var i=0; i< ds_stack_size(temp); i++)
		{
			val = ds_stack_pop(temp);
			ds_stack_push(hannoi,val);
		}
		val = ds_stack_pop(temp); //found the bottom value
		//tidy metadata values
		play_area.on[0,val%4] = false;
		play_area.on[1,val%4] = 0;
		//make discard card
		var dis = instance_create_layer(play_area.x,play_area.y,"UI",discard_card);
		dis.value = val;
		dis.destination=discard;
	
		//flip the hannoi stack
		for (var i=0; i< ds_stack_size(hannoi); i++)
		{
			val = ds_stack_pop(hannoi);
			ds_stack_push(temp,val);
		}
		//outfit copy onto modified outfit
		ds_stack_copy(play_area.o,temp);
		//clean up
		ds_stack_destroy(temp);
		ds_stack_destroy(hannoi);
	
	}

	if target == t.opponent
	{
		var temp = ds_stack_create(); //copy of outfit stack
		ds_stack_copy(temp,opponent.o);
		var hannoi = ds_stack_create(); //to be an upside down copy of outfit minus the bottom layer
		var val = 0;
		//flip temp onto hannoi
		for (var i=0; i< ds_stack_size(temp); i++)
		{
			val = ds_stack_pop(temp);
			ds_stack_push(hannoi,val);
		}
		val = ds_stack_pop(temp); //found the bottom value
		//tidy metadata values
		opponent.on[0,val%4] = false;
		opponent.total_power -= opponent.on[1,val%4];
		opponent.on[1,val%4] = 0;
		//make discard card
		var dis = instance_create_layer(opponent.x,opponent.y,"UI",discard_card);
		dis.value = val;
		dis.destination=opp_discard;
	
		//flip the hannoi stack
		for (var i=0; i< ds_stack_size(hannoi); i++)
		{
			val = ds_stack_pop(hannoi);
			ds_stack_push(temp,val);
		}
		//outfit copy onto modified outfit
		ds_stack_copy(opponent.o,temp);
		//clean up
		ds_stack_destroy(temp);
		ds_stack_destroy(hannoi);
	}


}
