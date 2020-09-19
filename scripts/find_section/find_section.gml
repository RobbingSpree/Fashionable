function find_section(argument0, argument1, argument2) {
	var mode = argument0; //how many sections to check
	var sect = argument1; //which section we're checking
	var ang = argument2; //current angle

	if mode == 2
	{
		if sect ==0 && (ang < 90 || ang > 270)
			return 1.5;
		if sect ==1 && (ang > 90 && ang < 270)
			return 1.5;
	}

	if mode == 3
	{
		if sect ==0 && (ang < 60 || ang > 300)
			return 1.5;
		if sect ==1 && (ang > 60 && ang < 180)
			return 1.5;
		if sect ==2 && (ang > 180 && ang < 300)
			return 1.5;
	}

	if mode == 4
	{
		if sect ==0 && (ang < 45 || ang > 315)
			return 1.5;
		if sect ==1 && (ang > 45 && ang < 135)
			return 1.5;
		if sect ==2 && (ang > 135 && ang < 225)
			return 1.5;
		if sect ==3 && (ang > 225 && ang < 315)
			return 1.5;
	}

	return 1;


}
