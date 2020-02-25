/// @description move to discard pile

x = lerp(x,destination.x,0.1);
y = lerp(y,destination.y,0.1);

if floor(x) == floor(destination.x) && floor(y) == floor(destination.y)
{
	ds_stack_push(destination.pile,value); 
	instance_destroy(self);
}

ttl-=1;
if ttl <=0
{
	instance_destroy(self);
	ds_stack_push(destination.pile,value);
}