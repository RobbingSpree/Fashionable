/// @description Update the turn order and cycle through the game phases

if ani !=0 
	ani -=1;

if turn == t.setup && ani == 0
{
	//setup the game 
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
		change_turn=true;
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
	}
	//combat
	if phase==p.combat
	{
		//end phase
		if change_phase==false
		{
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
if turn == t.opponent
{
	//run the opponent turn
	
	//setup
	if phase==p.setup
	{
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
		//end phase
		if change_phase==false
		{
			change_phase=true
			ani=ani_max;
		}
	}
	//combat
	if phase==p.combat
	{
		//end phase
		if change_phase==false
		{
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