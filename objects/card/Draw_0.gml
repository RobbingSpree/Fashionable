/// @description Insert description here
// You can write your code in this editor
draw_self();
var scale = 1;
if image_xscale < 0
	draw_sprite_ext(card_power_spr,pow,x,y,image_xscale*-1,scale,ang,c_white,1);
draw_sprite_ext(clothes_generics,value mod 4,x,y,image_xscale*-1,scale,ang,c_white,1);
//debug
/*
var str = string(index+1) + "/" + string(deck.hand_size);
draw_text(x,y-20,str);
draw_text(x,y+20,value);
*/