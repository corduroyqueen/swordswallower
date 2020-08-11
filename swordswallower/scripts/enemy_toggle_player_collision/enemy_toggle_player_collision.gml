obj = argument0
if !obj.death && !obj.hitbox_on {
	if zoom_hitbox_active {
		//obj takes hit
		damage_script(1,sign(x-obj.x),5,-1)
	} else if !dmg_flashing {
		//player takes hit
		damage_script(1,sign(x-obj.x),5,-1)
	}
}
instance_deactivate_object(obj)