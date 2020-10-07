//fuck yes
var num = ds_list_size(particles_x)
to_delete=0
for(i=0;i<num;i++) {
	var tx = particles_x[| i]
	var ty = particles_y[| i]
	tx += particles_hsp[| i]
	ty += particles_vsp[| i]
	if position_meeting(tx,ty,wall_parent_obj) {
		ds_list_add(delete_list,i)
		to_delete++
	} else {
		draw_sprite(eyebat_flying_parts,particles_i[| i],tx,ty)
		particles_x[|i] = tx
		particles_y[|i] = ty
		
		particles_hsp[| i] -= sign(particles_hsp[| i]) * 0.1
		particles_vsp[| i] += grav
	}
}

for (var p=0;p<to_delete;p++) {
	var lel = delete_list[| p]
	var spr = layer_sprite_create(layer_get_id("particles"),x,y,eyebat_flying_parts)
	layer_sprite_index(spr,0)//particles_i[| lel])
	ds_list_delete(particles_x,lel)
	ds_list_delete(particles_y,lel)
	ds_list_delete(particles_hsp,lel)
	ds_list_delete(particles_vsp,lel)
	ds_list_delete(particles_i,lel)
}