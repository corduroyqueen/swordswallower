/// @description Insert description here
// You can write your code in this editor
if hanging {
	vsp = 0 	
	if point_distance(x,y,player_obj.x,player_obj.y)<700 && in_camera_range(x,y) {
		if (abs(player_obj.x-x)<130 && (player_obj.y-y)>=0)
		|| (abs(tail_obj.x-x)<60 && (tail_obj.y-y)>=0) {
			if check2 {
				if wall_raycast_checker(player_obj) || wall_raycast_checker(tail_obj) {
					hanging = false	
				} 
			} else {
				hanging = false	
			}
		}
	}
	
} else {
	vsp+=0.4
	
	if wall_detect_solids(x,y+1) {
		death = true	
		spawn = true
		player_obj.shake_d=6
		player_obj.camera_shake_d = true
	}
}

if death {
	if spawn {
		for (i=0;i<40;i++ ){
			particle = instance_create_depth(x+(i-20),y+(i-20),-1,blood_obj)
			particle.sprite_index = fly_pod_particle
			var scalevar = random_range(0.1,1)
			particle.image_xscale = scalevar
			particle.image_yscale = scalevar
			particle.hsp = random_range(-2,2)
			particle.vsp = -5 + random_range(-3.5,3.5)
		}
		
		if place_meeting(x,y,player_obj) {
			startx = x
			starty = x
			endx = player_obj.x
			endy = player_obj.y
			flyrange = -5
		} else {
			startx = x
			starty = y
			endx = x + hsp
			endy = y + vsp + 3
			flyrange = -10
		}
	
		ang = arctan((starty-endy)/(startx-endx))
		tempx = cos(ang) * sign(endx-startx)
		tempy = sin(ang)  * sign(startx-endx)
	
		fly_num = choose(2,3,3,3,4,4,6)
		for (i=0;i<fly_num;i++){
			fly = instance_create_depth(x,y-30,depth,flyfree_obj)
	
			fly.hsp = tempy * random_range(5,10) * choose(-1,1)
			fly.vsp = tempx * random_range(5,10) * -1
			
			fly.hsp = random_range(-flyrange,flyrange)
			fly.vsp = random_range(-flyrange,-2)
				
			
			fly.inv_timer=20
			fly.state = 1
			fly.spawn = true
		}
	
	} else {
		for (i=0;i<40;i++ ){
			particle = instance_create_depth(x+(i-20),y+(i-20),2,blood_obj)
			particle.sprite_index = fly_pod_particle
			var scalevar = random_range(0.1,1)
			particle.image_xscale = scalevar
			particle.image_yscale = scalevar
			particle.hsp = tail_obj.hsp*0.24 + random_range(-3.5,3.5)
			particle.vsp = tail_obj.vsp*0.24 + random_range(-3.5,3.5)
		}
		just_blood(tail_obj.hsp,tail_obj.vsp,0.2,30,false,sprite_width,sprite_height)
	}
	instance_destroy()	
}