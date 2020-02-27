var target = argument0;

if target == t.player
{
	state_controller.phase=p.discard;
}

if target == t.opponent
{
	var i = irandom(opponent.hand_size);
	var dis = instance_create_layer(opponent.mid_x,opponent.mid_y,"UI",discard);
	dis.destination=t.opponent;
	dis.value= ds_list_find_value(opponent.h,i);
	ds_list_delete(opponent.h,i);
	opponent.hand_size--;
}