//fuck yes
if blood_num<1 {
	return
}

var dist
var laa
if level1_master.in_void {
	if level1_master.void_target==player_obj {
		laa = 0.1
		dist = 0
	} else {
		laa = 0.08
		dist = (1 - level1_master.void_target.range)*120
	}
}
		
for (var l=0;l<blood_num;l++) {
	surrounded = false
	var px = blood_px[| l]
	var py = blood_py[| l]
	var hsp = blood_phsp[| l]
	var vsp = blood_pvsp[| l]
	var scale = blood_ps[| l]
	var scalevar = blood_pbs[| l]
	var color = blood_pc[| l]
	
	var bounce_vel = blood_p_bounce[| l]
	var rval = blood_p_refs[| l]
	
	
	
	
	vsp+=0.8+scalevar/6
	//xpreva = x
	//ypreva = y
	
	if player_obj.held_position_start {
		var angle = point_direction(player_obj.x,player_obj.y,px,py) + random_range(-3,3)
		var dist = max(10,35-point_distance(player_obj.x,player_obj.y,px,py)/10)
		hsp+=cos(degtorad(angle)) * dist * random_range(0.8,1.2)
		vsp-=sin(degtorad(angle)) * dist * random_range(0.8,1.2)
	}
	if player_obj.death {
		hsp+=random_range(-10,10)
		vsp+=random_range(-10,10)
	}
	
	if level1_master.in_void {
		var bug_ang = point_direction(px,py,level1_master.void_target.x,level1_master.void_target.y)
		var tempsp = pythag(hsp,vsp)
		hsp+=random_range(-3,3)
		vsp+=random_range(-3,3)
		
		hsp = lerp(hsp,dcos(bug_ang)*30,laa)
		vsp = lerp(vsp,-dsin(bug_ang)*30,laa)
	}
	image_xscale = scalevar
	image_yscale = scalevar
	
	
	amt = hsp
	if player_obj.zoom_timer_bool {
		amt*=0.6
	}
	xRemainder = 0
	xRemainder += amt
	move = round(xRemainder)
	if move!=0 {
		xRemainder -= move
		move_dir = sign(move)
		while move != 0 {
			if !position_detect_solids(px+move_dir,py) {
				px += move_dir
				move -= move_dir
			} else {
				hsp=0
				vsp=0
				surrounded = true
				break;
			}
		}
	}
	
	amt = vsp
	if player_obj.zoom_timer_bool {
		amt*=0.6
	}
	yRemainder = 0
	yRemainder += amt
	move = round(yRemainder)
	if move!=0 {
		yRemainder -= move
		move_dir = sign(move)
		while move != 0 {
			if !position_detect_solids(px,py+move_dir) {
				py += move_dir
				move -= move_dir
			} else {
				hsp=0
				vsp=0
				surrounded = true
				break;
			}
		}
	}
	bounce_vel += (rval-scale)
	bounce_vel *= random_range(0.7,0.9)

	scale += bounce_vel
	
	//image_yscale = rval+(rval-image_xscale)
	
	
	blood_px[| l] = px
	blood_py[| l] = py
	
	
	blood_phsp[| l] = hsp
	blood_pvsp[| l] = vsp
	
	
	blood_ps[| l] = scale
	//blood_ps[| l] = 1
	
	blood_p_bounce[| l] = bounce_vel
	blood_p_refs[| l] = rval
	
	
	if level1_master.in_void {
		if point_distance(px,py,level1_master.void_target.x,level1_master.void_target.y)<5+dist {
			surrounded = true
			//level1_master.void_blood_ctr++
		}
	} else {
		blood_p_life[| l] --
		if blood_p_life[| l] <=0 {
			surrounded = true
		}
	}
	
	//move this to the tar.
	//if place_meeting(x,y,tar_obj) {
	//	var yo = instance_place(x,y,tar_obj)
	//	y = lerp(y,yo.y - yo.sprite_height/2,0.01)
	//	hsp *=0.97
	//	vsp=0
	
	//}
	
	if surrounded {
		ds_list_add(to_delete,l)
	}
}



var td_size = ds_list_size(to_delete)
if td_size<1 {
	return
}

//sdm("start")
//sdm(ds_list_size(blood_px))
//sdm(blood_num)
for(var i=0;i<td_size;i++) {
	var p = to_delete[| i] - i
	var px2 = blood_px[| p]
	var py2 = blood_py[| p]
	//sdm(p)
	//sdm(px2)
	//sdm(py2)
	var sxs = blood_p_refs[| p] * 2
	var spr = layer_sprite_create(layer_get_id("blood_splat"),px2,py2,choose(blood_splat_lel2,blood_splat_lel3))
	layer_sprite_angle(spr,random_range(0,360))
	layer_sprite_xscale(spr,sxs)
	layer_sprite_yscale(spr,sxs)
	layer_sprite_blend(spr,blood_pc[| p])
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
	
		
	ds_list_delete(blood_px,p)
	ds_list_delete(blood_py,p)
	ds_list_delete(blood_phsp,p)
	ds_list_delete(blood_pvsp,p)
	ds_list_delete(blood_ps,p)
	ds_list_delete(blood_pc,p)
	ds_list_delete(blood_pbs,p)
	ds_list_delete(blood_p_bounce,p)
	ds_list_delete(blood_p_refs,p)
	ds_list_delete(blood_p_life,p)
}
blood_num -= td_size
ds_list_clear(to_delete)