/// @description remove card from outfit

if ds_stack_top(o)>0 && state_controller.phase == p.play && state_controller.turn == t.player
{
	var temp = ds_stack_top(o);
	on[0,temp%4] = false;
	on[1,temp%4] = 0;
	var dis = instance_create_layer(x,y,"UI",discard_card);
	dis.value = ds_stack_pop(o);
}