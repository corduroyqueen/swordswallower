obj = argument0
if !obj.death  {
	if zoom_hitbox_active {
		//obj takes hit
		player_obj.camera_shake_direc = true
		player_obj.cam_ang = degtorad(point_direction(0,0,player_obj.hsp,player_obj.vsp))
		player_obj.shake_dir = 10
		
		with obj {
			event_user(0)
		}
	} 
}