/// @description Insert description here
// You can write your code in this editor
if player_obj.tail_pulling || player_obj.zoom_timer_bool {
	outline_start(3,global.magic_color)
}

draw_self()

if player_obj.tail_pulling || player_obj.zoom_timer_bool {
	outline_end()
}