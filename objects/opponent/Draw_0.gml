/// @description draw opponent and their cards

draw_self();
//shader magic
if instance_number(auto_card)>0 //state_controller.turn=t.opponent && state_controller.phase=p.play
{
	shader_set(rbw_shd);
	shader_set_uniform_f(Res,255,255,0); 
	shader_set_uniform_f(Time,current_time/1000);
}
draw_sprite_ext(paper_doll,0,x,y,scale,scale,1,c_white,1);
shader_reset();
//draw outfit
if ds_stack_top(o) >0
{
	var draw_stack = ds_stack_create();
	ds_stack_copy(draw_stack,o);
	var height_ = ds_stack_size(draw_stack);
	var ang = 0;
	var ys = y +80 - 20*height_;	
	for (var i = 0; i<height_; i++)
	{
		var top = ds_stack_top(draw_stack);
		draw_sprite_ext(clothes_generics,top mod 4,x,y,scale,scale,ang,c_white,1);	
		if show_extra > 0
		draw_sprite_ext(stack_spr2,top mod 4,x+200,ys+20*i,scale,scale,ang,c_white,1);	
		ds_stack_pop(draw_stack);
	}
	ds_stack_destroy(draw_stack);
}
//draw opponent power
if state_controller.turn=t.opponent && state_controller.phase=p.play
{
	draw_set_font(descrip);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text_ext(x+100,y-20,"Opponent Outfit Power: "+string(total_power),40,64);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_set_font(defont);
}

//draw_hand
if hand_size > 0
{
	var r = 60;
	for(var k=0;k<hand_size;k++)
	{
		//set x pos
		var hx=mid_x - (hand_size-1)*30*card_scale + k*card_wid*(card_scale*2);
		//angle for arc offset
		var ang = 0; //avoiding division by 0
			if k != 0
		ang = 360/((hand_size-1)*2);
		//set y pos
		var hy = mid_y + (lengthdir_y(r, k*ang)*card_scale);
		//set angle for the card
		var card_ang = (hand_size-1)*6 - (k * 15);
		draw_sprite_ext(card_spr,0,hx,hy,card_scale,card_scale,card_ang,c_white,1);
		var _value = ds_list_find_value(h,k);
		draw_sprite_ext(clothes_generics,_value,hx,hy,card_scale,card_scale,card_ang,c_white,1);
	}
}
//draw deck
draw_sprite_ext(deck_spr,0,x-sprite_width*2*scale,y-sprite_height*scale,card_scale,card_scale,0,c_white,1);
var top_card = ds_stack_top(d);
draw_sprite_ext(clothes_generics,top_card,x-sprite_width*2*scale,y-sprite_height*scale,card_scale,card_scale,0,c_white,1);
//draw discard pile
draw_sprite_ext(discard_spr,0,x+sprite_width*2*scale,y-sprite_height*scale,card_scale,card_scale,0,c_white,1);
if ds_stack_size(pile) > 0
{
	var top_card = ds_stack_top(d);
	draw_sprite_ext(clothes_generics,top_card,x+sprite_width*2*scale,y-sprite_height*scale,card_scale,card_scale,0,c_white,1);
}