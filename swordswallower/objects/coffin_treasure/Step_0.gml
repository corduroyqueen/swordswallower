/// @description Insert description here
// You can write your code in this editor
if level1_master.ability_dash {
	closed=false
	sprite_index = coffin_open
	image_index = 2
}
if closed {
	sprite_index = coffin_closed
	image_speed = 1
	//if tail_obj.current_obj==self {
	if place_meeting(x,y,tail_obj) && (player_obj.tail_throwing || player_obj.tail_pulling) {
		closed = false
		sprite_index = coffin_open
		image_speed = 0.5
		
		part_emitter_region(part_system, part_emitter, x-30, x+30, y-50, y+50, ps_shape_ellipse,ps_distr_gaussian);
		part_emitter_burst(part_system, part_emitter, part_type, 100);
		instance_create_depth(x,y+20,depth-1,treasure)
	}
}