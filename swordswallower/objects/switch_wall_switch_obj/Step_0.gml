/// @description Insert description here
// You can write your code in this editor
if !hit  {
	if place_meeting(x,y,tail_obj)
	&& !player_obj.tail_carry {
		enabled = !enabled	
		hit = true
	}
}
if partner==noone {
	partner = self	
}
if enabled {
	partner.enabled = true
	sprite_index = switch_wall_switch_on
} else {
	partner.enabled = false
	sprite_index = switch_wall_switch_off
}

