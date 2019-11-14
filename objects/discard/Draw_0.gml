draw_self();
var top = ds_stack_top(pile);

if ds_stack_size(pile) > 0
{
	draw_sprite(clothes_generics,top mod 4,x,y);
}
