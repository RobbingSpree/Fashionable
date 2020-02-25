/// @description Insert description here
// You can write your code in this editor
if copy != pile
{
	var value = ds_stack_pop(pile);
	ds_stack_push(opponent.pile,value); 
}

x=opponent.x+opponent.sprite_width+opponent.scale;
y=opponent.y-opponent.sprite_height*opponent.scale;