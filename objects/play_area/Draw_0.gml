draw_self();

//var cunk = 6
if global.holding != noone
{
	shader_set(rbw_shd);
	shader_set_uniform_f(Res,255,255,0); 
	shader_set_uniform_f(Time,current_time/1000); 
}
draw_sprite(paper_doll,0,px,py);
shader_reset();

//draw outfit
if ds_stack_top(o) >0
{
	var draw_stack = ds_stack_create();
	ds_stack_copy(draw_stack,o);
	var height_ = ds_stack_size(draw_stack);
	var ang = 0;
	var scale = 1;
	var ys = y +60 - 20*height_;	
	for (var i = 0; i<height_; i++)
	{
		var top = ds_stack_top(draw_stack);
		draw_sprite_ext(clothes_generics,top mod 4,px,py,scale,scale,ang,c_white,1);	
		if show_extra > 0
		draw_sprite_ext(stack_spr2,top mod 4,x+150,ys+20*i,scale,scale,ang,c_white,1);	
		ds_stack_pop(draw_stack);
	}
	ds_stack_destroy(draw_stack);
	
	total_power = 0;
	total_power += on[1,0];
	total_power += on[1,1];
	total_power += on[1,2];
	total_power += on[1,3];
	
	if state_controller.turn!=t.victory
	{
		draw_set_font(ann_fnt);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_text_ext(x+200,y-20,"Outfit Power: "+string(total_power),40,64);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_set_font(defont);
	}
}
//debug
/*
if ds_stack_top(p) >0
	draw_text(x,y,ds_stack_top(p));
*/