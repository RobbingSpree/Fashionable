/// @description detect click

if state_controller.turn == t.player && state_controller.phase >= p.play && alpha > 0.8
{
	if mouse_x > room_width/2
	{
		next_turn();
	} else {
		if state_controller.phase < p.combat
			next_phase();
		else 
			next_turn();
	}
}