/// @description Insert description here
// You can write your code in this editor

if sword_present {
	
	//tail_obj.x = x + swordx
	//tail_obj.y = y + swordy
	
	
	tail_obj.current_obj = self
	tail_obj.current_wall = self
	tail_obj.moving_platform_bool = true
	//if player_obj.tail_pulling {
	//	sword_present = false
	//	if !mouse_check_button(mb_right) {
	//		tail_obj.moving_platform_bool = false
	//	}
	//}
}


if place_meeting(x,y-player_obj.vsp-7,player_obj) && player_obj.vsp>=0 {
	onedirec = true	
	//player_obj.vsp+=vsp
} else if !place_meeting(x,y-64,player_obj) {
	onedirec = false	
}

with player_obj {
	if place_meeting(x,y,tar_obj) {
		with other {
			if place_meeting(x,y-128,player_obj) {
				onedirec = true	
			}
		}
	}
}

if onedirec {
	//vsp = lerp(vsp,speedv,0.2)
	if point_distance(x,y,x,starty+dist2)>speedv {
		vsp = speedv
	} else {
		vsp=0	
	}
} else {
	//vsp = lerp(vsp,-speedv,0.2)
	if !place_meeting(x,y-speedv,player_obj) 
	&& point_distance(x,y,x,starty)>speedv+1 {
		vsp = -speedv
	} else {
		vsp=0	
	}
	
}	

if y>starty+dist2 {
	onedirec = false	
}
y = clamp(y,starty,starty+dist2)
ypreva = y
