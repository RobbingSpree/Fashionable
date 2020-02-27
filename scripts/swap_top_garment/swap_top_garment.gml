var target = argument0;

if target == t.player
{
	state_controller.phase=p.swap;
	var ann = instance_create_layer(x,play_area.y,"UI",announce);
	ann.str = "Swap Top Garment";
	ann.ttl=70;
	
	var swap = instance_create_layer(x,y,"Cards",swap_icon);
	swap.owner=target;
}

if target == t.opponent
{
	var swap = instance_create_layer(x,y,"Cards",swap_icon);
	swap.owner=target;
}