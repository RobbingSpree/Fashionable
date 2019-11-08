/// @description move to discard pile

x = lerp(x,discard.x,0.1);
y = lerp(y,discard.y,0.1);

if floor(x) == floor(discard.x) && floor(y) == floor(discard.y)
{
	ds_stack_push(discard.pile,value); 
	instance_destroy(self);
}