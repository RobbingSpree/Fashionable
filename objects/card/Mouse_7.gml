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
		if state_controller.phase == p.discard
			state_controller.phase=state_controller.phase_hold;
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
	card_effect(effect,t.player);
	instance_destroy(self);
}

//swap top effect
if collision_point(x,y,play_area,false,true) && state_controller.phase == p.swap
{
		//logic for if card is viable
		if value mod 4 == swap_icon.value mod 4
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
			card_effect(effect,t.player);
			//return phase to normal
			state_controller.phase = state_controller.phase_hold;
			instance_destroy(self);
		}
}

if holding == true
{
	holding = false;
	global.holding = noone;
	global.h_index = noone;
	combat_toggle.cooldown = combat_toggle.cool_max;
}