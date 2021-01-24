//if x>59273 && x<60000 {
//	sdm(hitbox_on)
//}
if dormant {
	image_index = 0
	hitbox_on = false
	//mask_index = nothing1
} else {
	if active {
		image_index++
		image_index = 4
		x = startx
		y = starty
		hitbox_on = true
	//mask_index=sprite_index
	} else {
		x = player_obj.camx
		y = player_obj.camy
		image_index--
		image_index = 0
		hitbox_on = false	
		//mask_index = nothing1
	}

	image_index = clamp(image_index,0,4)
}
