//fuck yes

var num = ds_list_size(particles_x)
to_delete=0
for(i=0;i<num;i++) {
	var tx = particles_x[| i] + particles_hsp[| i]
	var ty = particles_y[| i] + particles_vsp[| i]
	
	if position_meeting(tx,ty,wall_parent_obj) {
		ds_list_add(delete_list,i)
		to_delete++
	} else {
		gpu_set_colorwriteenable(true,true,true,false)
		draw_sprite(new_ghoul_piece,particles_i[| i],tx,ty)
		gpu_set_colorwriteenable(true,true,true,true)
		
		particles_hsp[| i] -= sign(particles_hsp[| i]) * 0.1
		particles_vsp[| i] += grav
	}
	particles_x[| i] = tx
	particles_y[| i] = ty
}
//sdm(to_delete)
//sdm(ds_list_size(delete_list))
for (var p=0;p<to_delete;p++) {
	var lel = delete_list[| p] - p
	//sdm(lel)
	//sdm(particles_x[| lel])
	//sdm(particles_y[| lel])
	var spr = layer_sprite_create(layer_get_id("particles"),particles_x[| lel],particles_y[| lel],new_ghoul_piece)
	layer_sprite_index(spr,0)//particles_i[| lel])
	ds_list_delete(particles_x,lel)
	ds_list_delete(particles_y,lel)
	ds_list_delete(particles_hsp,lel)
	ds_list_delete(particles_vsp,lel)
	ds_list_delete(particles_i,lel)
}
ds_list_clear(delete_list)