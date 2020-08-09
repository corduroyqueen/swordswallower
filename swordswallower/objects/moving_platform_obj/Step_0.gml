/// @description Insert description here
// You can write your code in this editor

if sword_present {
	
	//tail_obj.x = x + swordx
	//tail_obj.y = y + swordy
	
	
	tail_obj.current_obj = self
	tail_obj.current_obj = self
	tail_obj.moving_platform_bool = true
	//if player_obj.tail_pulling {
	//	sword_present = false
	//	if !mouse_check_button(mb_right) {
	//		tail_obj.moving_platform_bool = false
	//	}
	//}
}

if horizontal == true {
	if onedirec {
		hsp = lerp(hsp,speedv,0.2)
		if x >= startx + dist2 {
			onedirec = false
		}
	} else {
		hsp = lerp(hsp,-speedv,0.2)
		if x <= startx + dist1 {
			onedirec = true
		}	
	}
}

if vertical == true {
	if onedirec {
		vsp = lerp(vsp,speedv,0.2)
		vsp = speedv
		if y >= starty + dist2 {
			onedirec = false
		}
	} else {
		vsp = lerp(vsp,-speedv,0.2)
		vsp = -speedv
		if y <= starty + dist1 {
			onedirec = true
		}	
	}	
}