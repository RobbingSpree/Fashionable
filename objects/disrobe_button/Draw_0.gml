/// @description draw combat choice

if hide = false && ds_stack_size(play_area.o) > 0
{
	if state_controller.phase <= p.play
	{
		draw_sprite_ext(disrobe_spr,0,x-200,y,1,1,0,c_white,alpha);
		draw_sprite_ext(disrobe_button_spr,0,x,y,1,1,0,c_white,alpha);
	}
}

//draw_text(20,20,alpha);