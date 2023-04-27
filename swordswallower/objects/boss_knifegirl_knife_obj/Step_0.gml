//fuck yes
if hsp+vsp>0 {
	hitbox_on = true
} else {
	hitbox_on = false
}

if current_obj == noone {
	moveSwordX(hsp)
	moveSwordY(vsp)
}

if laser {
	laser_obj.x = x
	laser_obj.y = y
	laser_obj.image_angle = shoot_angle
	laser_obj.image_xscale = 30
} else {
	laser_obj.x = 0
	laser_obj.y = 0
	laser_obj.image_xscale = 0
}