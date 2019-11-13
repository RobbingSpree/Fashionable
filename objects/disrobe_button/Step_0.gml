/// @description Insert description here
// You can write your code in this editor

if state_controller.turn == t.player
	if state_controller.phase >= p.play
	{
		hide = false;
	} else hide = true;

if hide == false && alpha < 1 && ds_stack_size(play_area.o) > 0
	alpha += 0.05;

if state_controller.turn != t.player || state_controller.phase >= p.combat
	if alpha > 0
		alpha -=0.1;
	
if state_controller.turn == t.opponent
	used = false;