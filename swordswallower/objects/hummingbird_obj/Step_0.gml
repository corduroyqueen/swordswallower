/// @description Insert description here
// You can write your code in this editor

if player_obj.tail_carry {
	met = false	
}

if sword_present {
	hspeed=0
	vspeed=0
	
	image_blend = c_red
	player_obj.inside_flier = true
	player_obj.tail_dest_x = x
	player_obj.tail_dest_y = y
	if mouse_check_button_pressed(mb_left) || player_obj.tail_pulling {
		sword_present = false	
	}
	if place_meeting(x,y,player_obj) && player_obj.tail_zooming {
		sword_present = false
		player_obj.tail_planted = false
		player_obj.tail_pulling = true
	}
} else {
	wait_timer--
	image_blend = c_white
	if wait_timer>0 {
		hspeed=0
		vspeed=0
		x = nodes[current_node].x
		y = nodes[current_node].y
		if current_node>node_count-1 {
			current_node = 0	
		}
	} else {
		move_towards_point(nodes[current_node+1].x,nodes[current_node+1].y,gospeed*30)	
		if point_distance(nodes[current_node+1].x,nodes[current_node+1].y,x,y)<speed {
			current_node++
			wait_timer = base_timer/gospeed
			
		}
	}
}