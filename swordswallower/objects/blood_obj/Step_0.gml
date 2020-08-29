/// @description Insert description here
// You can write your code in this editor

if go {
	
	if rval==0 {
		rval = image_xscale
		bounce_vel = rval * random_range(0.7,1.4)
	}

	if !surrounded {
		vsp+=0.8+scalevar/6
		//xpreva = x
		//ypreva = y
	
		if player_obj.held_position_start {
			var angle = point_direction(player_obj.x,player_obj.y,x,y) + random_range(-3,3)
			var dist = max(10,35-point_distance(player_obj.x,player_obj.y,x,y)/10)
			hsp+=cos(degtorad(angle)) * dist * random_range(0.8,1.2)
			vsp-=sin(degtorad(angle)) * dist * random_range(0.8,1.2)
		}
		moveParticlesX(hsp)
		moveParticlesY(vsp)
		
		//move this to the tar.
		//if place_meeting(x,y,tar_obj) {
		//	var yo = instance_place(x,y,tar_obj)
		//	y = lerp(y,yo.y - yo.sprite_height/2,0.01)
		//	hsp *=0.97
		//	vsp=0
	
		//}
	
	} else {
		if player_got {
			instance_destroy()
			return
		}
		var sxs = image_xscale
		var spr = layer_sprite_create(layer_get_id("blood_splat"),x,y,blood_splat_lel1)
		layer_sprite_angle(spr,random_range(0,360))
		layer_sprite_xscale(spr,sxs)
		layer_sprite_yscale(spr,sxs)
		//with art_surface_setter {
		//	ds_list_add(splat_list_x,other.x)
		//	ds_list_add(splat_list_y,other.y)	
		//	ds_list_add(splat_list_rot,random_range(0,360))	
		//	ds_list_add(splat_list_s,sxs)	
		//}
	
		var eh = gsound.s_blood_drips[floor(random_range(0,9))]
		audio_sound_pitch(eh,random_range(5,8))
		if random_range(0,100)>=75 {
			audio_sound_gain(eh,random_range(0.00,0.40),0)
		}
		audio_play_sound(eh,0,false)
	
		instance_destroy()
	}


	bounce_vel += (rval-image_xscale)
	bounce_vel *= rec_val

	image_xscale += bounce_vel
	image_yscale = rval+(rval-image_xscale)
}
go = true

