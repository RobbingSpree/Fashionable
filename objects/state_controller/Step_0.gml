/// @description Update the turn order and cycle through the game phases

if ani !=0 
	ani -=1;

//setup the game
if turn == t.setup && ani == 0
{ 
	if deck.hand_size <5
	{
		draw_card(t.player);
		draw_card(t.opponent);
	}
	else 
	{
		turn = t.player;
		phase = p.setup;
	}
	ani = 10;
}

//swap to next turn
if change_turn && ani == 0
{
	if turn == t.player
		turn = t.opponent;
	else turn = t.player;
	phase = p.setup;
	change_turn=false;
}

//check if at end of turn and start next turn
if change_phase && ani <= 0
{
	if phase >= p.tidy
	{
		if turn == t.player
			turn = t.opponent;
		else 
			turn = t.player;
		phase = p.setup;
		change_turn=false;
	} else phase += 1;
	change_phase=false;
}

#region //-- Player's turn
if turn == t.player && change_phase == false
{
	//run the player turn
	
	//setup
	if phase==p.setup
	{
		var ann = instance_create_layer(x,play_area.y,"UI",announce);
		ann.str = "Your turn";
		//end phase
		if change_phase==false
		{
			change_phase=true
			ani=ani_max;
		}
	}
	//draw
	if phase==p.draw
	{
		draw_card(t.player);
		//end phase
		if change_phase==false
		{
			change_phase=true
			ani=ani_max;
		}
	}
	//main
	if phase==p.play
	{
		//wait for trigger to go into combat
		prep = true;
	}
	//combat
	if phase==p.combat
	{
		if prep == true //move actors to middle of screen
		{
			var chgne = 0.1;
			play_area.px = lerp(play_area.px,576,chgne); //move to right side
			play_area.py = lerp(play_area.py,320,chgne); //move to right side
			opponent.px = lerp(opponent.px,224,chgne); //move to right side
			opponent.py = lerp(opponent.py,320,chgne); //move to right side
			opponent.scale = lerp(opponent.scale,1,chgne); //scale up opponent sprite
			if abs(opponent.py - play_area.py) < 2
				prep += 1;
			ani=ani_max;
		}
		
		if prep == true + 1 //show the combat UI
		{
			hits.show_vs = true;
			if ani <=0
			{
				ani=ani_max;
				prep +=1;
				if play_area.total_power > opponent.total_power
				{
					hits.h+=1;
					if ds_stack_size(opponent.o) >0
						disrobe_garment(t.opponent);
				}
				if play_area.total_power < opponent.total_power
				{
					opponent.hit +=1;
					if ds_stack_size(play_area.o) >0
						disrobe_garment(t.player);
				}
				if hits.h >=3 || opponent.hit >= 3
				{
					turn=t.victory;
					ani=ani_max;
					change_phase=true;
					var ann = instance_create_layer(x,play_area.y,"UI",announce);
					ann.str = "GAME!!";
				}
			}
		}
		
		if prep == true + 2 //calculate damage
		{
			if play_area.total_power > opponent.total_power
				hits.combat_win="player";
			if play_area.total_power < opponent.total_power
				hits.combat_win="opponent";
			if play_area.total_power == opponent.total_power
				hits.combat_win="draw";
			
			if ani <=0
				prep += 1;
		}
		
		if prep == true + 3 //reset actors
		{
			play_area.px = lerp(play_area.px,play_area.x,0.1);
			play_area.py = lerp(play_area.py,play_area.y,0.1);
			opponent.px = lerp(opponent.px,opponent.x,0.1);
			opponent.py = lerp(opponent.py,opponent.y,0.1);
			hits.show_vs = false;
			if abs(play_area.px-play_area.x) < 2
			{
				change_phase = true;
			}
		}
		
		//end phase
		if change_phase==true
		{
			play_area.px=play_area.x;
			play_area.py=play_area.y;
			opponent.px=opponent.x;
			opponent.py=opponent.y;
			hits.combat_win="no";
			hits.show_vs = false;
			change_phase=true
			ani=ani_max;
		}
	}
	//tiny up board
	if phase==p.tidy
	{
		//end phase
		if change_phase==false
		{
			change_phase=true
			ani=ani_max;
		}
	}
}
#endregion

#region //--Opponent's turn
if turn == t.opponent && ani == 0
{
	//run the opponent turn
	
	//setup
	if phase==p.setup
	{
		var ann = instance_create_layer(x,opponent.y,"UI",announce);
		ann.str = "Opponent's turn";
		//end phase
		if change_phase==false
		{
			change_phase=true
			ani=ani_max;
		}
	}
	//draw
	if phase==p.draw
	{
		draw_card(t.opponent);
		//end phase
		if change_phase==false
		{
			change_phase=true
			ani=ani_max;
		}
	}
	//main
	if phase==p.play
	{
		//run script to update enemy outfit
		with(opponent)
		{
			if instance_number(auto_card) == 0 
				opponent_redress();
		}
		//end phase
		/*
		if change_phase==false
		{
			change_phase=true
			ani=ani_max;
		}
		*/
	}
	//combat
	if phase==p.combat
	{
		if prep == true //move actors to middle of screen
		{
			var chgne = 0.1;
			play_area.px = lerp(play_area.px,576,chgne); //move to right side
			play_area.py = lerp(play_area.py,320,chgne); //move to right side
			opponent.px = lerp(opponent.px,224,chgne); //move to right side
			opponent.py = lerp(opponent.py,320,chgne); //move to right side
			opponent.scale = lerp(opponent.scale,1,chgne); //scale up opponent sprite
			if abs(opponent.py - play_area.py) < 2
				prep += 1;
			ani=ani_max;
		}
		
		if prep == true + 1 //show the combat UI
		{
			hits.show_vs = true;
			if ani <=0
			{
				ani=ani_max;
				prep +=1;
				if play_area.total_power > opponent.total_power
					hits.h+=1;
				if play_area.total_power < opponent.total_power
					opponent.hit +=1;
				
				if hits.h >=3 || opponent.hit >= 3
				{
					turn=t.victory;
					ani=ani_max;
					change_phase=true;
					var ann = instance_create_layer(x,play_area.y,"UI",announce);
					ann.str = "GAME!!";
				}
			}
		}
		
		if prep == true + 2 //calculate damage
		{
			if play_area.total_power > opponent.total_power
				hits.combat_win="player";
			if play_area.total_power < opponent.total_power
				hits.combat_win="opponent";
			if play_area.total_power == opponent.total_power
				hits.combat_win="draw";
			
			if ani <=0
				prep += 1;
		}
		
		if prep == true + 3 //reset actors
		{
			play_area.px = lerp(play_area.px,play_area.x,0.1);
			play_area.py = lerp(play_area.py,play_area.y,0.1);
			opponent.px = lerp(opponent.px,opponent.x,0.1);
			opponent.py = lerp(opponent.py,opponent.y,0.1);
			hits.show_vs = false;
			if abs(play_area.px-play_area.x) < 2
			{
				change_phase = true;
			}
		}
		
		//end phase
		if change_phase==true
		{
			play_area.px=play_area.x;
			play_area.py=play_area.y;
			opponent.px=opponent.x;
			opponent.py=opponent.y;
			hits.combat_win="no";
			hits.show_vs = false;
			change_phase=true
			ani=ani_max;
		}
	}
	//tiny up board
	if phase==p.tidy
	{
		//end phase
		if change_phase==false
		{
			change_phase=true
			ani=ani_max;
		}
	}
}
#endregion

#region //--Victory state
if turn == t.victory && ani == 0
{
	if mouse_check_button_pressed(mb_left)
		room_restart();
}
if turn == t.victory //reset combat UI
{
	play_area.px = lerp(play_area.px,play_area.x,0.2);
	play_area.py = lerp(play_area.py,play_area.y,0.2);
	opponent.px = lerp(opponent.px,opponent.x,0.2);
	opponent.py = lerp(opponent.py,opponent.y,0.2);
	hits.show_vs = false;
}
#endregion