/// @description 

if ds_stack_size(action_queue) > 0 && instance_number(auto_card)==0
{
	var auto_ = instance_create_layer(mid_x,mid_y,"Cards",auto_card); //make auto card
	var val = ds_stack_pop(action_queue); //get the hand index to take out
	auto_.value = ds_list_find_value(h,val); //pass the value of the card
	ds_list_delete(h,val); //remove from hand
	hand_size--; //update handsize 
}

if state_controller.phase==p.setup
{
	px=x;
	py=y;
}

if state_controller.turn == t.opponent && state_controller.phase==p.play
	phase_change--;
if phase_change <=0 //emergency turn ender in case logic gets stuck
{
	state_controller.change_phase = true;
	state_controller.ani = 0;
	phase_change=80;
}

if state_controller.turn == t.opponent || state_controller.phase == p.combat
{
	if scale < 1
		scale +=0.01;
	if card_scale <0.7
		card_scale+=0.01;
} else {
	if scale > 0.7
		scale -= 0.01;
	if card_scale > 0.5
		card_scale-=0.01;
}