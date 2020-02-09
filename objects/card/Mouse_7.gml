/// @description drop card in hand or on object

if collision_point(x,y,discard,false,true) && state_controller.phase == p.play && state_controller.turn == t.player
{
	if index != deck.hand_size-1
	{
		with(card)
		{
			if index > global.h_index
				index -=1;
		}
	}
	deck.hand_size -=1;
	ds_stack_push(discard.pile,value); 
	instance_destroy(self);
}

if collision_point(x,y,play_area,false,true) && play_area.on[0,value mod 4] == false && state_controller.phase == p.play && state_controller.turn == t.player
{
	if index != deck.hand_size-1
	{
		with(card)
		{
			if index > global.h_index
				index -=1;
		}
	}
	play_area.on[0,value mod 4] = true;
	play_area.on[1,value mod 4] = pow;
	deck.hand_size -=1;
	ds_stack_push(play_area.o,value);
	instance_destroy(self);
}

if holding == true
{
	holding = false;
	global.holding = noone;
	global.h_index = noone;
	combat_toggle.cooldown = combat_toggle.cool_max;
}