obj = argument0
if !obj.death {
	if zoom_hitbox_active {
		//obj takes hit
		player_obj.camera_shake_direc = true
		player_obj.cam_ang = degtorad(point_direction(0,0,player_obj.hsp,player_obj.vsp))
		player_obj.shake_dir = 15
		
		with obj {
			event_user(0)
		}
	} else if !dmg_flashing {
		//player takes hit
		damage_script(1,sign(x-obj.x),5,-1)
	}
}