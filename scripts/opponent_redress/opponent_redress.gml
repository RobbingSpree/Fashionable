function opponent_redress() {
	//put on clothes
	for (var i=0; i<ds_list_size(h); i++)
	{
		var _card = ds_list_find_value(h,i);
		if on[0,_card mod 4] == false //if not wearing this type of clothes
		{
			/* old method
			ds_stack_push(o,_card);
			hand_size--;
			ds_list_delete(h,i);
			*/
			/* second attempt
			var temp_card = instance_create_layer(x,y,"Cards",auto_card);
			temp_card.value = _card;
			temp_card.hand_index = i;
			*/
			ds_stack_push(action_queue,i);
			on[0,_card mod 4] = true;
		}
	}


}
