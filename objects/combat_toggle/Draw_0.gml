/// @description draw combat choice

if hide = false && ds_stack_size(play_area.o) > 0
{
	draw_sprite_ext(reveal_spr,0,x-room_width/3,y,1,1,0,c_white,alpha);
	draw_sprite_ext(endturn_spr,0,x+room_width/3,y,1,1,0,c_white,alpha);
	draw_sprite_ext(combat_words_spr,0,x,y,1,1,0,c_white,alpha);
}

//draw_text(20,20,alpha);