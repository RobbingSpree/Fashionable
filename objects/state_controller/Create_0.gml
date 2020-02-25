/// @description Insert description here
// You can write your code in this editor

enum p
{
	setup,
	draw,
	play,
	combat,
	tidy
}

enum t
{
	setup,
	player,
	opponent,
	victory
}

enum e
{
	none,
	draw,
	draw_other,
	discard,
	discard_other,
	rem_bottom,
	rem_bottom_other,
	swap_top_other,
	rem_top_other
}

phase = 0;
prep = false;
turn = 0;
change_phase=false;
change_turn=false;

ani=0; //timer for how long to wait before changing phases
ani_max=40; //timer to reference to changing phases
//is animations are set to off set this to 5