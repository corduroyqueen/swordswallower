//// @description Insert description here
// You can write your code in this editor
if death {
	instance_destroy()	
}

move_towards_point(x+xoff,y+yoff,mspeed)

if wall_detect(x+hsp,y+vsp) {
	death = true	
}

if point_distance(x,y,player_obj.x,player_obj.y)<50 {
	if player_obj.zoom_timer_bool {
		damage_script(10,sign(player_obj.x-x),5,-1)
	} else if !player_obj.dmg_flashing {
		damage_script(10,sign(player_obj.x-x),5,-1)
	}	
}