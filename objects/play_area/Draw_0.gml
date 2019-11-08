draw_self();

draw_sprite(paper_doll,0,x,y);

if ds_stack_top(o) >0
{
	var draw_stack = ds_stack_create();
	ds_stack_copy(draw_stack,o);
	var height_ = ds_stack_size(draw_stack);
	var ang = 0;
	var scale = 1;
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
//debug
/*
if ds_stack_top(p) >0
	draw_text(x,y,ds_stack_top(p));
*/