/// @description Insert description here
// You can write your code in this editor


if hit {
	intangible = true
	traveling = false
	seeking = true
	divs = 12
	if seek_dir==1 {
		seek_dir=-1	
	} else {
		seek_dir=1
	}
	if !notears {
		spawn_projectiles = true
	}
	intang_max = 50 + random_range(0,50)
	hit = false
	notears= false
} else if intangible {
	mspeed=2
	divs = 8
	intang_timer++
	if intang_timer>90 {
		intang_proj_timer++
		if intang_proj_timer > intang_max/4 {
			intang_proj_timer=0
			spawn_projectiles = true
		}
		if intang_timer>90+intang_max {
			intang_timer=0
			intang_proj_timer=0
			intangible = false
			divs = 12
			spawn_projectiles = true
		}
	}
} else {
	mspeed = 4
	divs = 12
	tear_timer++
	if tear_timer>tear_timer_spawn {
		tear_timer=0
		//instance_create_depth(x,y+32,depth+1,tear_obj)
		spawn_projectiles = true
	}
}


if seeking { 
	targetx = x+(600+random_range(-100,100))*seek_dir
	targety = y+random_range(-100,100)
	if !collision_line(x,y,targetx,targety,all,0,true) {
		traveling = true
	} else {
		ok =collision_line_first(x,y,targetx,targety,all,0,true)
		targetx = ok[1]
		targety = ok[2]
	}
	seeking= false
	traveling = true
}

if traveling {
	move_towards_point(targetx,targety,mspeed)
	if point_distance(x,y,targetx,targety)<20 {
		traveling = false
		seeking = true
		if seek_dir==1 {
			seek_dir=-1	
		} else {
			seek_dir=1
		}
	}
}


if spawn_projectiles {
	
	for (i=1;i<=divs;i++) {
		var ang = i * 360/divs
		hallo = instance_create_depth(
		x+cos(degtorad(ang))*5,
		y+sin(degtorad(ang))*5,
		depth+1,
		tear_nograv_obj)
		hallo.xoff = cos(degtorad(ang))
		hallo.yoff = sin(degtorad(ang))
		hallo.mspeed = 5
		hallo.image_angle = point_direction(x,y,x+hallo.xoff,y+hallo.yoff) + 90
	}
	spawn_projectiles = false
}

