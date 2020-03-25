/// @description Insert description here
// You can write your code in this editor
sdm(y+sprite_height/2)
sdm(other.y-other.sprite_height/2)
if !other.intangible && 
(y+sprite_height)<(other.y-other.sprite_height/2) && !keyboard_check(ord("S"))
&&vspeed>0
&& !zoom_timer_bool {
	
	
	if other!=tail_obj.current_wall && !tail_obj.moving_platform_bool {
		held_position_ready = false	
		held_position = false
		
	}
	
	tail_obj.current_obj = false
	
	
	boosting_collision_check = false
	
	
	
	if !check_zoom_collision {
		
		default_collision(other)
		thin_floor_bool = true
	} else {
		thin_floor_bool = false	
	}
	
	check_zoom_collision = false
	
} else {
	
	
	
}