/// @description show hint for next card

draw_self();

draw_sprite(clothes_generics,ds_stack_top(d) mod 4,x,y);
/*
draw_set_color(c_black);
draw_text(x,y-20,ds_stack_top(d));
draw_set_color(c_white);