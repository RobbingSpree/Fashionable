var effect = argument0; //which effect
var player = argument1; //which player used the card

if effect == e.none
{
	return;
}

if effect == e.draw
{
	draw_card(player);
}

if effect == e.draw_other
{
	draw_card(player);//other player change needed
}

if effect == e.discard
{
	return;
}

if effect == e.discard_other
{
	return;
}

if effect == e.rem_bottom
{
	disrobe_bottom_garment(player);
}

if effect == e.rem_bottom_other
{
	disrobe_bottom_garment(player);//other player change needed
}

if effect == e.swap_top_other
{
	return;
}

if effect == e.rem_top_other
{
	disrobe_garment(player);//other player change needed
}