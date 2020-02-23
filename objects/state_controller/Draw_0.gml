/// @description Debug values

#region //victory UI
if turn == t.victory
{
	draw_set_font(ann_fnt);
	draw_text_outline(room_width/2,room_height/3,"SOMEONE WON",c_yellow,c_black);
	if hits.combat_win == "player"
	{
		draw_text_outline(room_width/2,room_height/3*2,"AND IT WAS YOU!!",c_blue,c_black);
	}
	if hits.combat_win == "opponent"
	{
		draw_text_outline(room_width/2,room_height/3*2,"IT WAS SOMEONE ELSE...",c_red,c_black);
	}
	draw_set_font(descrip);
	draw_text_outline(room_width/2,room_height/5*4,"Click/Tap to start new battle",c_white,c_black);
}
#endregion

/*
draw_text(20,20,"Current Turn: "+string(turn));
draw_text(20,40,"Current Phase: "+string(phase));
draw_text(20,60,"Change Turn? "+string(change_turn));
draw_text(20,80,"Change Phase? "+string(change_phase));
draw_text(20,100,"opp point "+string(opponent.py));
draw_text(20,120,"char point "+string(play_area.py));
/*
//if ani !=0 
	draw_text(20,100,"Phase changing in: "+string(ani)+" frames");
