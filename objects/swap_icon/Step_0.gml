/// @description move and enforce

//effect needs to auto solve if there's no good replacement
if phase == "create"
{
	if owner == t.player
	{
		dx=play_area.x+120;
		dy=play_area.y-40;
		value = ds_stack_pop(play_area.o);
		play_area.on[0,value mod 4] = false;
		pow = play_area.on[1,value mod 4];
		play_area.on[1,value mod 4] = 0;
	}
	if owner == t.opponent
	{
		dx=opponent.x-120;
		dy=opponent.y;
		value = ds_stack_pop(opponent.o);
		opponent.on[0,value mod 4] = false;
		pow = opponent.on[1,value mod 4];
		opponent.on[1,value mod 4] = 0;
		//opponent needs to go looking for replacement card
	}
	phase = "move";
}

if phase== "move"
{
	x=lerp(x,dx,0.1);
	y=lerp(y,dy,0.1);
	
	if abs(y-dy) < 2 && abs(x-dx) < 2
	{
		x=dx;
		y=dy;
		phase="wait";
	}
}

if phase == "wait" && state_controller.phase != p.swap
{
	if owner == t.player
	{
		//make a card
		var card_temp = noone
		card_temp = instance_create_layer(x,y,"Cards",card);
		card_temp.index = deck.hand_size;
		//update hand controller variables
		deck.hand_size +=1;
		//pass the new card what value was on top of the deck
		card_temp.value = value;
		card_temp.pow=pow;
	}
	
	if owner == t.opponent
	{
		//fake putting card back in hand by drawing it instead
		var card_temp=draw_card(t.opponent);
		ds_list_set(opponent.h,opponent.hand_size,value);
	}
	
	//restore game phase
	state_controller.phase=state_controller.phase_hold;
	instance_destroy(self);
}