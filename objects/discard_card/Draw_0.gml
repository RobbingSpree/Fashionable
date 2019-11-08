/// @description draw card features
draw_self();
var scale = 1;
draw_sprite_ext(card_power_spr,pow,x,y,image_xscale*-1,scale,ang,c_white,1);
draw_sprite_ext(clothes_generics,value mod 4,x,y,image_xscale*-1,scale,ang,c_white,1);