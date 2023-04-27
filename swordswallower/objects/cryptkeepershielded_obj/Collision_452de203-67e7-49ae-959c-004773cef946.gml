//fuck yes
if sword_reject {
	sword_reject = false
} 
else 
{
	event_user(0)
	var angle = get_player_point_angle(x,y)
	blood_death_override_velocity_x = lengthdir_x(20,angle)
	blood_death_override_velocity_y = lengthdir_y(20,angle)
}