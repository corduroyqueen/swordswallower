/// @description Insert description here
// You can write your code in this editor
if !other.intangible {
	
	
	if other!=tail_obj.current_wall && !tail_obj.moving_platform_bool {
		held_position_ready = false	
		held_position = false
		
	}
	
	tail_obj.current_obj = false
	
	
	boosting_collision_check = false
	
	
	
	if !check_zoom_collision {
		
		default_collision(other)
	}
	
	check_zoom_collision = false
	
} else {
	
	
	
}