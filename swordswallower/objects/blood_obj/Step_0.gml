/// @description Insert description here
// You can write your code in this editor


//if place_meeting(x+hwidth,y+hheight,wall_obj) && place_meeting(x+hwidth,y-hheight,wall_obj) 
//&& place_meeting(x-hwidth,y+hheight,wall_obj) && place_meeting(x-hwidth,y-hheight,wall_obj) {

if go {
	
	if place_meeting(x,y,player_obj) {
		if !player_obj.start_death && !player_obj.death && player_sprite_obj.spr_bloodied_a<0.5 {
			player_got = true
			hsp=0
			vsp=0
			surrounded = true
			obj = player_obj				
			locked = true
			lockedobj = obj

			xoff = x-obj.x
			yoff = y-obj.y

			x=150+xoff
			y=150+yoff
	
			instance_destroy()
	
			player_sprite_obj.spr_bloodied = true
			player_sprite_obj.spr_bloodied_a = 1
		}
	}
if rval==0 {
	rval = image_xscale
	bounce_vel = rval * random_range(0.4,1.4)
}

if place_meeting(x,y,tar_obj) {
	var yo = instance_place(x,y,tar_obj)
	y = lerp(y,yo.y - yo.sprite_height/2,0.01)
	hsp *=0.97
	vsp=0
	
} else if !surrounded {
	vsp+=0.8+scalevar/6
	//xpreva = x
	//ypreva = y
	
	if player_obj.held_position_start {
		var angle = point_direction(player_obj.x,player_obj.y,x,y) + random_range(-3,3)
		var dist = max(10,35-point_distance(player_obj.x,player_obj.y,x,y)/10)
		hsp+=cos(degtorad(angle)) * dist * random_range(0.8,1.2)
		vsp-=sin(degtorad(angle)) * dist * random_range(0.8,1.2)
	}
	moveActivateX(hsp)
	moveActivateY(vsp)
	if on_wall {
		hs = hsp
		vs = vsp
		hsp=0
		vsp=0
		depth = -1000
		
		surrounded = true
	}

	
} else {
	if player_got {
		return
	}
	var sxs = image_xscale
	
	
	with art_surface_setter {
		ds_list_add(splat_list_x,other.x)
		ds_list_add(splat_list_y,other.y)	
		ds_list_add(splat_list_rot,random_range(0,360))	
		ds_list_add(splat_list_s,sxs)	
	}
	
	var eh = gsound.s_blood_drips[floor(random_range(0,9))]
	audio_sound_pitch(eh,random_range(5,8))
	if random_range(0,100)>=75 {
		audio_sound_gain(eh,random_range(0.00,0.40),0)
	}
	audio_play_sound(eh,0,false)
	
	instance_destroy()
	//lifect++
	
	//if lifect >500 {
	//	image_alpha-=0.02
	//}
	//if image_alpha<=0 {
	//	instance_destroy()	
	//}
	//if locked {
	//	if instance_exists(obj) {
	//		x = obj.x + xoff
	//		y = obj.y + yoff
	//	} else {
	//		surrounded = false	
	//		locked = false
	//	}
	//}
}


bounce_vel += (rval-image_xscale)
bounce_vel *= rec_val

image_xscale += bounce_vel
image_yscale = rval+(rval-image_yscale)
}
go = true

