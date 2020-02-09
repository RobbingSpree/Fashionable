//create the outfit data structure
o = ds_stack_create();
show_extra = 0;

//logic for if item is already on paper doll
on = [];
on[0,0] = false;
on[0,1] = false;
on[0,2] = false;
on[0,3] = false;
//storage for clothes power
on[1,0] = 0;
on[1,1] = 0;
on[1,2] = 0;
on[1,3] = 0;

total_power = 0;