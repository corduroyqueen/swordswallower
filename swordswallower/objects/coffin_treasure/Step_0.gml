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
		with tail_obj {
			//sword_reject_script()
		}
		
		part_emitter_region(part_system, part_emitter, x-30, x+30, y-50, y+50, ps_shape_ellipse,ps_distr_gaussian);
		part_emitter_burst(part_system, part_emitter, part_type, 100);
		
		blood_color = global.dash_color
		just_blood_speed_input(1,-2,0.2,50,true,x,y)
		just_blood_speed_input(2.5,0,0.2,50,true,x,y)
		just_blood_speed_input(3,2,0.2,50,true,x,y)
		
		
		
		instance_create_depth(x-10000,y+20,depth-1,treasure)
		
		level1_master.in_void = true
		level1_master.powerup_bug = instance_create_depth(x+50,y-400,depth,powerup_bug_boost_obj)
		level1_master.void_target = level1_master.powerup_bug
		level1_master.powerup_bug.mask_index = blank_collision
	}
}