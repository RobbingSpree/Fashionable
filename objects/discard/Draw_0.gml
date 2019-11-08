draw_self();
var top = ds_stack_top(pile);
if ds_stack_top(pile) > 0
	//draw_text(x,y,ds_stack_top(pile));
	draw_sprite(clothes_generics,top%4,x,y);
