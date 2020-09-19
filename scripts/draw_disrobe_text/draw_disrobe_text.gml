function draw_disrobe_text(argument0, argument1, argument2, argument3, argument4) {
	var cx = argument0; //center of the circle
	var cy = argument1; //center of the circle

	var mode = argument2; //how many sections to draw text in
	var sect = argument3; //current section
	var scale = argument4; //if == 1.5 this is the current selection

	//set the font 
	draw_set_font(ann_fnt);
	draw_set_font(defont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	var xoffset = 0;
	//1 layer of clothes
	if mode == 1
	{
		draw_sprite_ext(disrobe_count_spr,sect,cx+xoffset,cy,scale,scale,0,c_white,1);
	}

	//2 layers of clothes
	xoffset = 96;
	if mode == 2
	{
		if scale > 1
			xoffset = 0;
		switch(sect)
		{
			case 0: draw_sprite_ext(disrobe_count_spr,sect,cx+xoffset,cy,scale,scale,0,c_white,1); break;
			case 1: draw_sprite_ext(disrobe_count_spr,sect,cx-xoffset,cy,scale,scale,0,c_white,1); break;
		}
	}

	//3 layers of clothes
	var yoffset = 76;
	xoffset = 96;
	if mode == 3
	{
		if sect > 0
			xoffset = 64
		if scale > 1
		{
			xoffset = 0;
			yoffset = 0;
		}
		switch(sect)
		{
			case 0: draw_sprite_ext(disrobe_count_spr,sect,cx+xoffset,cy,scale,scale,0,c_white,1); break;
			case 1: draw_sprite_ext(disrobe_count_spr,sect,cx-xoffset,cy-yoffset,scale,scale,0,c_white,1); break;
			case 2: draw_sprite_ext(disrobe_count_spr,sect,cx-xoffset,cy+yoffset,scale,scale,0,c_white,1); break;
		}
	}

	//4 layers of clothes
	yoffset = 96;
	xoffset = 96;
	if mode == 4
	{
		if sect > 0
			xoffset = 64
		if scale > 1
		{
			xoffset = 0;
			yoffset = 0;
		}
		switch(sect)
		{
			case 0: draw_sprite_ext(disrobe_count_spr,sect,cx+xoffset,cy,scale,scale,0,c_white,1); break;
			case 1: draw_sprite_ext(disrobe_count_spr,sect,cx,cy-yoffset,scale,scale,0,c_white,1); break;
			case 2: draw_sprite_ext(disrobe_count_spr,sect,cx-xoffset,cy,scale,scale,0,c_white,1); break;
			case 3: draw_sprite_ext(disrobe_count_spr,sect,cx,cy+yoffset,scale,scale,0,c_white,1); break;
		}
	}

	//reset the font settings
	draw_set_font(defont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	draw_text(20,100,cx);
	draw_text(20,120,cy);


}
