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
	if player == t.player
		draw_card(t.opponent);
	if player == t.opponent
		draw_card(t.player);
}

if effect == e.discard
{
	return;
}

if effect == e.discard_other
{
	if player == t.player
		return;
	if player == t.opponent
		return;
}

if effect == e.rem_bottom
{
	disrobe_bottom_garment(player);
}

if effect == e.rem_bottom_other
{
	if player == t.player
		disrobe_bottom_garment(t.opponent);
	if player == t.opponent
		disrobe_bottom_garment(t.player);
}

if effect == e.swap_top_other
{
	return;
}

if effect == e.rem_top_other
{
	if player == t.player
		disrobe_garment(t.opponent);
	if player == t.opponent
		disrobe_garment(t.player);
}