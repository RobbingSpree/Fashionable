/// @description show remaining hits

draw_set_font(descrip);
draw_set_halign(fa_center);
draw_text(x,y,"Remaining Hits: "+string(3-h));

if show_vs 
{
	draw_sprite(vs_spr,0,room_width/2,320);
	draw_text(224,400,opponent.total_power);
	draw_text(576,400,play_area.total_power);
}

draw_set_font(defont);
draw_set_halign(fa_left);