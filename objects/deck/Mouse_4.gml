/// @description draw a card

//draw a card
var card_temp = noone
card_temp = instance_create_layer(x,y,"Instances",card);
//flag card as being held
card_temp.holding = true;
//set index for the hand
card_temp.index = hand_size;
//update hand controller variables
global.holding = card_temp;
global.h_index = hand_size;
hand_size +=1;
//pass the new card what value was on top of the deck
card_temp.value = ds_stack_pop(d);
