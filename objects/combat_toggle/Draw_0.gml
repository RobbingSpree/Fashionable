/// @description draw combat choice

if hide = false && ds_stack_size(play_area.o) > 0 
{
	if state_controller.phase <= p.play
	{
		draw_sprite_ext(reveal_spr,0,x-room_width/3,y,1,1,0,c_white,alpha);
		draw_sprite_ext(endturn_spr,0,x+room_width/3,y,1,1,0,c_white,alpha);
		draw_sprite_ext(combat_words_spr,0,x,y,1,1,0,c_white,alpha);
		
		if mouse_y > y-sprite_height/2 && mouse_y < y+sprite_height/2 && global.holding == noone
		{
			if mouse_x < x
				draw_sprite_ext(combat_spr,1,x,y,1,1,0,c_white,alpha);
			else 
				draw_sprite_ext(combat_spr,1,x,y,-1,1,0,c_white,alpha);
		}
	}
}

//draw_text(20,20,alpha);