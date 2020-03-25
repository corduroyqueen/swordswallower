/// @description Insert description here
// You can write your code in this editor
if other.zoom_timer_bool {
	death = true
} else if !other.dmg_flashing {
	damage_script(10,sign(player_obj.x-x),5,-1)
}