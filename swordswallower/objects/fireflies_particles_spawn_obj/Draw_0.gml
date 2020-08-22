/// @description Insert description here
// You can write your code in this editor
gpu_set_colorwriteenable(true,true,true,false)
for (i=0;i<fireflies_ct;i++) {
	if in_camera_range_bigger(fireflies_x[| i],	fireflies_y[| i]) {
		var hsp = fireflies_hsp[|i]
		var vsp = fireflies_vsp[|i]
		if player_obj.held_position_start {
			fireflies_dir[| i] = point_direction(player_obj.x,player_obj.y,fireflies_x[| i],fireflies_y[| i]) + random_range(-3,3)
			var dist = max(0,1000-point_distance(player_obj.x,player_obj.y,fireflies_x[| i],fireflies_y[| i]))
			hsp+=dcos(fireflies_dir[| i]) * dist * dist * random_range(0.8,1.2) * 0.000008
			vsp-=dsin(fireflies_dir[| i]) * dist * dist * random_range(0.8,1.2) * 0.000008
		} else {
			fireflies_dir[| i]+=choose(-2,1,0,0,0,1,2,hsp,hsp,vsp,vsp)
			if pythag(hsp,vsp)>0.5 {
				fireflies_dir[| i] += choose(-60,-59,-61,60,61,59)
			}
			hsp += dcos(fireflies_dir[| i]) * 0.001 * random_range(0.6,1.4)
			vsp -= dsin(fireflies_dir[| i]) * 0.001 * random_range(0.6,1.4)
		
		}
		hsp = lerp(hsp,clamp(-0.1,hsp,0.1),0.05)
		vsp = lerp(vsp,clamp(-0.1,vsp,0.1),0.05)
		fireflies_x[| i]+=hsp
		fireflies_y[| i]+=vsp
		fireflies_hsp[|i] = hsp
		fireflies_vsp[|i] = vsp
		draw_sprite(blood_sprite_spr3,0,fireflies_x[| i],fireflies_y[| i])
	}
}
gpu_set_colorwriteenable(true,true,true,true)