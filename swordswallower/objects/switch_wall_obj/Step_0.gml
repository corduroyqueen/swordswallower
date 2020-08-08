/// @description Insert description here
// You can write your code in this editor
if length ==0 {
	length = point_distance(startx,starty,endx,endy)	
}

if startx<endx {
	x1 = startx
	x2 = endx
} else {
	x1 = endx
	x2 = startx
}
if starty<endy {
	y1 = starty
	y2 = endy
} else {
	y1 = endy
	y2 = starty
}
if master!=noone {
	enabled = master.enabled
} else if enemytoggle {
	enabled = !instance_exists(character)
}
if enabled {
	
		
	if point_distance(x,y,endx,endy)>1 {
		movespeed = (length/(point_distance(x,y,endx,endy)) + 0.1)*(length/(point_distance(x,y,endx,endy)) + 0.1) * 1.3
		//move_towards_point(endx,endy,15)
		sp_towards_target(endx,endy,15,1)
		
		
		
		if point_distance(x,y,endx,endy)<(1+15) && in_camera_range_bigger(x,y){
			player_obj.shake_d=6
			player_obj.camera_shake_d = true	
			audio_play_sound(metal_door,0,false)
			audio_play_sound(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false)
			audio_play_sound(hit_wall,0,false)
		}
		
		
		
	} else {
		x = endx
		y = endy
		movespeed = 0
		hsp = 0  
		vsp = 0
	}
	//if instance_place(x,y+vsp,all) {
	//	list = collision_list(x,y+vsp,all)
			
	//	for (i=0;i<ds_list_size(list);i++) {
	//		obj = ds_list_find_value(list,i)
				
	//		with(obj){
					
	//			if abs(x - other.x) > other.sprite_width/2 + 2 { return false }
					
	//			if !variable_instance_exists(id, "pers") {
					
	//			} else if pers==0 {
					
	//				if wall_checker(x,y+other.vsp) {
	//					//perform_player_damage(1000)
	//				} else {
	//					//vsp+=other.vsp
	//				}
	//			}else if pers==1 {
					
	//				if wall_checker(x,y+other.vsp) && !zoom_timer_bool {
	//					start_death = true
	//				} else {
	//					vsp=0
	//					y+=other.vsp
	//					hsp=0
	//				}
	//			}
	//		}
	//	}
	//}
} else {
	if point_distance(x,y,startx,starty)>1 {
		movespeed = (length/(point_distance(x,y,startx,starty)) + 0.1)*(length/(point_distance(x,y,startx,starty)) + 0.1) * 1.3
		//move_towards_point(startx,starty,10)
		sp_towards_target(startx,starty,10,1)
		if point_distance(x,y,endx,endy)<(1+10) && in_camera_range_bigger(x,y) {
			player_obj.shake_d=6
			player_obj.camera_shake_d = true	
			
			audio_play_sound(metal_door,0,false)
			audio_play_sound(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false)
			audio_play_sound(sword_thud_1,0,false)
		}
	} else {
		x = startx
		y = starty
		movespeed = 0
		hsp = 0  
		vsp = 0
	}
}

x = clamp(x,x1,x2)
y = clamp(y,y1,y2)

//if hsp>0 {
//	hsp = clamp(hsp,4,100)
//} else if hsp<0 {
//	hsp = clamp(hsp,-100,-4)
//}


//if vsp>0 {
//	vsp = clamp(vsp,4,100)
//} else if vsp<0 {
//	vsp = clamp(vsp,-100,-4)
//}

if in_camera_range_bigger(x,y) {
	moving_plat_move(hsp,vsp)
} else {
	moveZoomX(hsp)	
	moveZoomY(vsp)	
}