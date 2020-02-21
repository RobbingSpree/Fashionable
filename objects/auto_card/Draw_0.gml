/// @description draw card

//draw card boarder
shader_set(rbw_shd);
shader_set_uniform_f(Res,255,255,0); 
shader_set_uniform_f(Time,current_time/1000);
draw_self();
shader_reset();

//draw card contents
draw_sprite_ext(clothes_generics,value mod 4,x,y,scale,scale,0,c_white,1);
draw_sprite_ext(card_power_spr,pow,x,y,scale,scale,0,c_white,1);

/*
draw_text(x,y-40,round(x));
draw_text(x,y-60,dest_x);