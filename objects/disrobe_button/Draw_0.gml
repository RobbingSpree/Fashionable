/// @description draw combat choice

if hide = false && ds_stack_size(play_area.o) > 0
{
	if state_controller.phase <= p.play
	{
		if menu == false
		{
			draw_sprite_ext(disrobe_spr,0,x-30,y,1,1,0,c_white,alpha);
			draw_sprite_ext(disrobe_button_spr,0,x,y,1,1,0,c_white,alpha);
			if used
				draw_sprite_ext(cant_disrobe_spr,0,x,y,1,1,0,c_white,alpha);
		} else {
			
			var max_item = ds_stack_size(play_area.o);
			draw_set_font(descrip);
			draw_set_halign(fa_center);
			draw_text_ext(dx,y-90,"Remove how many layers?",20,sprite_width);
			draw_set_font(defont);
			draw_set_halign(fa_left);
			
			if mouse_x > x-30 && mouse_x < x+sprite_width && mouse_y > y-50 && mouse_y < y+150 && mouse_check_button(mb_left) && used ==false
			{
				var ang = floor(point_direction(dx,dy,mouse_x,mouse_y));
				var scale = 1;				
				var spr = circle_choice_1_spr;
				if max_item > 1
				{
					//update sprite
					switch (max_item)
					{
						case 2: spr = circle_choice_2_spr; break;
						case 3: spr = circle_choice_3_spr; break;
						case 4: spr = circle_choice_4_spr; break;
					}
					for(var i=0;i<=max_item-1;i++)
					{
						if point_distance(dx,dy,mouse_x,mouse_y) > 35
						{
							scale = find_section(max_item,i,ang);
							draw_sprite_ext(spr,i,dx,dy,scale,scale,0,c_white,1);
							draw_disrobe_text(dx,dy,max_item,i,scale);
							if scale > 1
								focus = i;
						} else {
							draw_sprite_ext(spr,i,dx,dy,scale,scale,0,c_white,1);
							draw_disrobe_text(dx,dy,max_item,i,scale);
							scale = 1;
							focus = -1;
						}
					}
				} else {
					//just a circle
					if point_distance(dx,dy,mouse_x,mouse_y) > 35
					{
						scale = 1.5;
						focus = 0;
					} else {focus = -1;}
					draw_sprite_ext(spr,0,dx,dy,scale,scale,0,c_white,1);
					draw_disrobe_text(dx,dy,max_item,0,scale);
				}
				draw_text(20,60,ang);
				draw_text(20,80,point_distance(dx,dy,mouse_x,mouse_y));
			}
		}
	}
}
//mouse_y < y && mouse_y > y+sprite_width

