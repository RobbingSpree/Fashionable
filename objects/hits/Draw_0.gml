/// @description show remaining hits
if state_controller.turn != t.victory
{
	draw_set_font(descrip);
	draw_set_halign(fa_center);
	draw_text(x,y,"Remaining Hits to win: "+string(3-h));
	draw_text(x,y-20,"Opponent Hits till you lose: "+string(3-opponent.hit));
}

#region //--combat UI
if show_vs 
{
	draw_sprite(vs_spr,0,room_width/2,320);
	draw_text(224,400,opponent.total_power);
	draw_text(576,400,play_area.total_power);
}

if combat_win != "no" && state_controller.turn != t.victory
{
	var ppx = play_area.px;
	var ppy = play_area.py;
	var opx = opponent.px;
	var opy = opponent.py;
	var offset = 100;
	if combat_win == "player"
	{
		draw_sprite(combat_hit_sign_spr,0,ppx,ppy); //player sprite
		draw_sprite(combat_hit_sign_spr,1,opx,opy); //opponent sprite
		draw_text(opx,opy+offset,"MISS"); //opponent text
		draw_text(ppx,ppy+offset,"HIT"); //player text
	}
	if combat_win == "opponent"
	{
		draw_sprite(combat_hit_sign_spr,1,ppx,ppy); //player sprite
		draw_sprite(combat_hit_sign_spr,0,opx,opy); //opponent sprite
		draw_text(opx,opy+offset,"HIT"); //opponent text
		draw_text(ppx,ppy+offset,"MISS"); //player text
	}
	if combat_win == "draw"
	{
		draw_sprite(combat_hit_sign_spr,2,ppx,ppy); //player sprite
		draw_sprite(combat_hit_sign_spr,2,opx,opy); //opponent sprite
		draw_text(opx,opy+offset,"EVEN"); //opponent text
		draw_text(ppx,ppy+offset,"EVEN"); //player text
	}
}
#endregion

draw_set_font(defont);
draw_set_halign(fa_left);
