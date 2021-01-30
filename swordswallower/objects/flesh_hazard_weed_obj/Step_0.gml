//if x>59273 && x<60000 {
//	sdm(hitbox_on)
//}
if dormant {
	image_index-=random_range(0.8,1.0)
	image_index = max(image_index,0)
	if image_index>9 {
		image_index=0
	}
	hitbox_on = false
	x = player_obj.camx+500
		y = player_obj.camy+10
	//mask_index = nothing1
} else {
	if active {
		image_index+=random_range(0.6,0.8)
		image_index = min(image_index,11)
		x = startx
		y = starty
		hitbox_on = true
	//mask_index=sprite_index
	} else {
		
		x = player_obj.x+500
		y = player_obj.y+10
		//x=33361
		//y=2850
		
		if master.timer>master.off_time-50 {
			image_index+=0.00000001
		} else {
			image_index-=random_range(0.8,1.0)
		}
		image_index = max(image_index,0)
		hitbox_on = false	
		//mask_index = nothing1
	}

	//image_index = clamp(image_index,0,4)
}
