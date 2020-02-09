//put on clothes

for (var i=0; i<ds_list_size(h); i++)
{
	var _card = ds_list_find_value(h,i);
	if on[0,_card mod 4] == false
	{
		ds_stack_push(o,_card);
		ds_list_delete(h,i);
	}
}