/// @description Debug values

draw_text(20,20,"Current Turn: "+string(turn));
draw_text(20,40,"Current Phase: "+string(phase));
draw_text(20,60,"Change Turn? "+string(change_turn));
draw_text(20,80,"Change Phase? "+string(change_phase));
draw_text(20,100,"opp point "+string(opponent.py));
draw_text(20,120,"char point "+string(play_area.py));
/*
//if ani !=0 
	draw_text(20,100,"Phase changing in: "+string(ani)+" frames");
