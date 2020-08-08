obj = argument0
if !obj.death  {
	if zoom_hitbox_active {
		//obj takes hit
		with obj {
			event_user(0)
		}
	} 
}