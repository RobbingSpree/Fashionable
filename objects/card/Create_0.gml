/// @description Setup

holding = false;

cycle = 0;
cmax = 4;

index = 0;

mid_x = room_width/2;
mid_y = deck.y;
ang = 0;

value = 0;
pow = irandom_range(1,5);
//effect setup
effect = irandom(e.swap_top_other+5);
effect -=5;
if effect <0
	effect = 0;

delay=100;
flip=true;

//shader variables
Res = shader_get_uniform(rbw_shd,"iResolution"); 
Time = shader_get_uniform(rbw_shd,"iGlobalTime"); 
