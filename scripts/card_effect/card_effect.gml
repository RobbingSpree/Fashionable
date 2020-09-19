function card_effect(effect, player) {

	if effect == e.none
	{
		return;
	}

	if effect == e.draw
	{
		draw_card(player);
		announcement(room_height/2,"Draw Card");
	}

	if effect == e.draw_other
	{
		if player == t.player
		{
			draw_card(t.opponent);
			announcement(opponent.y,"Draw Card");
		}
		if player == t.opponent
		{
			draw_card(t.player);
			announcement(room_height/2,"Draw Card");
		}
	}

	if effect == e.discard
	{
		discard_from_hand(player);
		announcement(room_height/2,"Discard");
	}

	if effect == e.discard_other
	{
		if player == t.player
			discard_from_hand(t.opponent);
		if player == t.opponent
			discard_from_hand(t.player);
		announcement(room_height/2,"Discard");
	}

	if effect == e.rem_bottom
	{
		if player == t.player
		{
			if ds_stack_size(play_area.o)-1 <1 //if less than 1 card already in outfit
			{
				announcement(room_height/2,"Effect Failed");
				return;
			} else 
				disrobe_bottom_garment(player);
		}
		if player == t.opponent
		{
			if ds_stack_size(opponent.o)-1 < 1 //if less than 1 card already in outfit
			{
				announcement(room_height/2,"Effect Failed");
				return;
			}
			disrobe_bottom_garment(player);
		}
		announcement(room_height/2,"Lose Bottom Layer");
	}

	if effect == e.rem_bottom_other
	{
		if player == t.player
		{
			if ds_stack_size(opponent.o)-1 < 1 //if less than 1 card already in outfit
			{
				announcement(room_height/2,"Effect Failed");
				return;
			}
			disrobe_bottom_garment(t.opponent);
		}
		if player == t.opponent
		{
			if ds_stack_size(play_area.o)-1 < 1 //if less than 1 card already in outfit
			{
				announcement(room_height/2,"Effect Failed");
				return;
			}
			disrobe_bottom_garment(t.player);
		}
		announcement(room_height/2,"Lose Bottom Layer");
	}

	if effect == e.swap_top_other
	{
		if player == t.player
		{
			if ds_stack_size(opponent.o)-1 < 1 //if less than 1 card already in outfit
			{
				announcement(room_height/2,"Effect Failed");
				return;
			}
			swap_top_garment(t.opponent);
			announcement(room_height/2,"Swap Top Layer");
		}
		if player == t.opponent
		{
			if ds_stack_size(play_area.o)-1 < 1 //if less than 1 card already in outfit
			{
				announcement(room_height/2,"Effect Failed");
				return;
			}
			swap_top_garment(t.player)
			announcement(room_height/2,"Lose Top Layer");
		}
	}

	if effect == e.rem_top_other
	{
		if player == t.player
		{
			if ds_stack_size(opponent.o)-1 < 1 //if less than 1 card already in outfit
			{
				announcement(room_height/2,"Effect Failed");
				return;
			}
			disrobe_garment(t.opponent);
			announcement(room_height/2,"Lose Top Layer");
		}
		if player == t.opponent
		{
			if ds_stack_size(play_area.o)-1 < 1 //if less than 1 card already in outfit
			{
				announcement(room_height/2,"Effect Failed");
				return;
			}
			disrobe_garment(t.player);
			announcement(room_height/2,"Lose Top Layer");
		}
	}


}
