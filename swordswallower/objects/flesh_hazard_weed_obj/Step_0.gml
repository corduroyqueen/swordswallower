
if dormant {
	image_index = 0
	hitbox_on = false
	mask_index = nothing1
} else {
	if active {
		image_index++
		hitbox_on = true
	mask_index=sprite_index
	} else {
		image_index--
		hitbox_on = false	
		mask_index = nothing1
	}

	image_index = clamp(image_index,0,4)
}
