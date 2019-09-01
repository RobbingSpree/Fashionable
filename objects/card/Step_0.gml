/// @description 

if holding == true
{
	x = mouse_x;
	y = mouse_y;
	image_angle = 0;
}

cycle -=1;
if cycle < 1 && holding != true
{
	cycle = cmax;
	//update pos on screen
	//find where the left most card should sit
	var left_edge = (deck.hand_size-1)*30; 
	//find point n card widths accross the screen
	var hand_x = mid_x - left_edge + (index * 64);
	//setup hand vertical fan effect
	var r = 60; //radius of circle cards are placed on the edge of
	ang = 0; //avoiding division by 0
	if index != 0
		ang = 360/((deck.hand_size-1)*2); //get the vertical offset for current card in hand as function of total hand size
	var hand_y = mid_y + lengthdir_y(r, index*ang);
	//same thinking as the x pos on screen, work out how angled the left most card should be and add proportional amount compaired to hand size
	var left_ang = (deck.hand_size-1)*6
	ang = left_ang - (index * 15);
	//lerp to position every cmax frames, high values will look best
	x = lerp(x,hand_x,0.5);
	y = lerp(y,hand_y,0.5);
	image_angle = lerp(image_angle,ang,0.5);
}
