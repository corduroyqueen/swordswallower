particle_obj = argument0

if player_obj.tail_pulling || player_obj.tail_throwing {
	fire_timer++
	if fire_timer>2 {
		boop = instance_create_depth(x,y,101,particle_obj)	
		boop2 = instance_create_depth(mean(x,x,xpreva),mean(y,y,ypreva),101,particle_obj)	
		boop3 = instance_create_depth(mean(x,xpreva,xpreva),mean(y,ypreva,ypreva),101,particle_obj)
		boop.deprate = 0.2
		boop2.deprate = 0.2
		boop3.deprate = 0.2
	}
	
} else {
	fire_timer++
	var xmax = 40 * sin(degtorad(image_angle))
	var ymax = 40 * cos(degtorad(image_angle))
	var function_val = ymax/xmax
	if fire_timer>5 {
		var rx = irandom_range(-xmax,xmax)
		var ry = function_val*rx
		
		
			boop = instance_create_depth(x+rx,y+ry,-1,particle_obj)
			boop.deprate = 0.01
			boop.vspeed = -1
			fire_timer = 0
		
	}
	
}