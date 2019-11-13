/// @description detect click

if state_controller.turn == t.player && state_controller.phase == p.play && alpha > 0.8 
{
	//show the disrobe menu
	menu = false;
	var actions = ds_stack_size(play_area.o);
	switch (focus)
	{
		case 0: repeat(actions) disrobe_garment(t.player); break;
		case 1: disrobe_garment(t.player); break;
		case 2: repeat(2) disrobe_garment(t.player); break;
		case 3: repeat(3) disrobe_garment(t.player); break;
	}
	used = true;
}