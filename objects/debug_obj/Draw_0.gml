/// @description Insert description here
// You can write your code in this editor

var cunk = 6;
for (var i=10; i<124; i+=cunk)
{
	//sprite is only visible from y10 to y124
	//takes about 28 loops
	if i+rainbow < 255
		var col = make_color_hsv(rainbow+i,200,255);
	else 
		var col = make_color_hsv(rainbow+i-255,200,255);
	draw_sprite_part_ext(paper_doll,0,0,i,64,cunk,x-32,y+i-64,1,1,col,1);
}
