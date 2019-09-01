/// @description drop card in hand or on object

if holding == false && global.holding == noone
{
	holding = true;
	global.holding = self;
	global.h_index = index;
	ang = 0;
}