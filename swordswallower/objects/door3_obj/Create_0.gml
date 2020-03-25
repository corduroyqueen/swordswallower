/// @description Insert description here
// You can write your code in this editor

broken = false

met = false
pers=0
intangible = false
friendo = self
if place_meeting(x,y,wall_obj) {
	if distance_to_object(instance_nearest(x,y,wall_obj))<5 {
		friendo = instance_nearest(x,y,wall_obj)
		if image_xscale<=image_yscale {
			friendo.y = y
			friendo.image_xscale = image_xscale + 0.2
			friendo.image_yscale = image_yscale 
			if friendo.x>x {
				friendo.x += 30 * image_xscale
			} else {
				friendo.x -= 30 * image_xscale
			}
		} else {
			friendo.x = x
			friendo.image_xscale = image_xscale
			friendo.image_yscale = image_yscale + 0.2
			if friendo.y>y {
				friendo.y += 30 * image_yscale
			} else {
				friendo.y -= 30 * image_yscale
			}
		}
	}
} 
die = false