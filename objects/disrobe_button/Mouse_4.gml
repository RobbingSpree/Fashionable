/// @description detect click

if state_controller.turn == t.player && state_controller.phase == p.play && alpha > 0.8 
{
	//show the disrobe menu
	if used == false
		menu = true;
}