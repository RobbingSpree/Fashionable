/// @description 

if ds_list_size(action_queue) > 0 && instance_number(auto_card)==0
{
	var auto_ = instance_create_layer(mid_x,mid_y,"Cards",auto_card); //make auto card
	var val = ds_list_find_value(action_queue,0); //get the hand index to take out
	auto_.value = ds_list_find_value(h,val); //pass the value of the card
	ds_list_delete(h,val); //remove from hand
	ds_list_delete(action_queue,0); //remove from action queue	
}