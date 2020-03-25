/// @description Insert description here
// You can write your code in this editor


if instance_exists(parent) {
	if parent.visible {
		x = parent.x
		y = parent.y
	} else {
		alpha = lerp(alpha,0,0.5)	
		if alpha<=0.2 {
			instance_destroy()	
		}
	}
}

if distance_to_object(player_obj)<600 {
	alpha = lerp(alpha,1,0.05)	
} else {
	alpha = lerp(alpha,0,0.1)	
}