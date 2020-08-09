/// @description Insert description here
// You can write your code in this editor
if sword_present {
	
	tail_obj.current_obj = self
	tail_obj.moving_platform_bool = true
}

if held {
	with (mr_rope) {
		if place_meeting(x,y,player_obj) && player_obj.zoom_timer_bool {
			death = true	
		}
		if death {
			other.held = false
			instance_destroy()
		}
	}
} else {
	if wall_detect(x,y+1) {
		grounded = true
	} else {
		grounded = false
	}
	
	
	
	if !grounded {
		if instance_place(x,y+1,all) {
			list = collision_list(x,y+1,all)
			
			for (i=0;i<ds_list_size(list);i++) {
				obj = ds_list_find_value(list,i)
				with(obj){
				
					if abs(x - other.x) > other.sprite_width/2 + 2 { return false }
					
					if !variable_instance_exists(id, "pers") {
					
					} else if pers==0 {
					
						if wall_detect(x,y+1) {
							perform_player_damage(1000)
						} else {
							vsp+=other.vsp
						}
					}else if pers==1 {
					
						if wall_detect(x,y+1) {
							death = true
						} else {
							vsp=0
							y+=other.vsp
							hsp=0
						}
					}
				}
			}
		}
		vsp+=grav
	} else {
		vsp = 0	
	}
	
}