/// @description Insert description here
// You can write your code in this editor

if state_controller.turn == t.player
	if state_controller.phase >= p.play
	{
		hide = false;
	} else hide = true;

if hide == false && alpha < 1 && ds_stack_size(play_area.o) > 0
	alpha += 0.05;
else if alpha > 0
	alpha -= 0.1;