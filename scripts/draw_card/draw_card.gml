var target = argument0;

if target == t.player
{
	//draw a card
	var card_temp = noone
	card_temp = instance_create_layer(deck.x,deck.y,"Cards",card);
	card_temp.index = deck.hand_size;
	//update hand controller variables
	deck.hand_size +=1;
	//pass the new card what value was on top of the deck
	card_temp.value = ds_stack_pop(deck.d);
	
	return card_temp;
}

if target == t.opponent
{
	with (opponent)
	{
		var card_temp = ds_stack_pop(d);
		ds_list_add(h,card_temp);
		hand_size+=1;
		return card_temp;
	}
}