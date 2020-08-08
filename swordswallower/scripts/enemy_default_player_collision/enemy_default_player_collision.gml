obj = argument0
if !obj.death {
	if zoom_hitbox_active {
		//obj takes hit
		with obj {
			event_user(0)
		}
	} else if !dmg_flashing {
		//player takes hit
		damage_script(1,sign(x-obj.x),5,-1)
	}
}