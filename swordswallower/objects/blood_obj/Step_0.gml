/// @description Insert description here
// You can write your code in this editor


//if place_meeting(x+hwidth,y+hheight,wall_obj) && place_meeting(x+hwidth,y-hheight,wall_obj) 
//&& place_meeting(x-hwidth,y+hheight,wall_obj) && place_meeting(x-hwidth,y-hheight,wall_obj) {
if rval==0 {
	rval = image_xscale
	bounce_vel = rval * random_range(0.4,1.4)
}

if place_meeting(x,y,tar_obj) {
	var yo = instance_place(x,y,tar_obj)
	y = lerp(y,yo.y - yo.sprite_height/2,0.01)
	hspeed *=0.97
	vspeed=0
	
} else if !surrounded {
	vspeed+=.6
	if wall_checker(x,y) || place_meeting(x,y,tar_obj) {
		x = xpreva + hspeed*0.3
		y = ypreva + vspeed*0.3
		hs = hspeed
		vs = vspeed
		hspeed=0
		vspeed=0
		depth = -1000
		
		surrounded = true
	}
	xpreva = x
	ypreva = y
} else {
	if player_got {
		return
	}
	var sxs = image_xscale
	var sys = image_yscale
	
	//if !place_meeting(x,y,blood_splat_obj) {
		ok = instance_create_depth(x,y,-3000,blood_splat_obj)
		image_xscale = 3
		image_yscale = 3
	
		if place_meeting(x,y,wall_obj) {
			wall = instance_place(x,y,wall_obj)	
			ok.x = clamp(x,wall.x-wall.sprite_width/2,wall.x+wall.sprite_width/2)
			ok.y = clamp(y,wall.y-wall.sprite_height/2,wall.y+wall.sprite_height/2)
		
			ok.image_xscale = sxs * 2
			ok.image_yscale = sys * 2
			blood_sprite_return(ok,wall)
		
		
		} else if place_meeting(x,y,black_wall_obj) {
			wall = instance_place(x,y,black_wall_obj)	
			ok.x = clamp(x,wall.x-wall.sprite_width/2,wall.x+wall.sprite_width/2)
			ok.y = clamp(y,wall.y-wall.sprite_height/2,wall.y+wall.sprite_height/2)
		
			ok.image_xscale = sxs * 2
			ok.image_yscale = sys * 2
			blood_sprite_return(ok,wall)
		} else {
			ok.x = 0
			ok.y = 0
		}
	//}
	instance_destroy()
	lifect++
	
	if lifect >500 {
		image_alpha-=0.02
	}
	if image_alpha<=0 {
		instance_destroy()	
	}
	if locked {
		if instance_exists(obj) {
			x = obj.x + xoff
			y = obj.y + yoff
		} else {
			surrounded = false	
			locked = false
		}
	}
}


bounce_vel += (rval-image_xscale)
bounce_vel *= rec_val

image_xscale += bounce_vel
image_yscale = rval+(rval-image_yscale)