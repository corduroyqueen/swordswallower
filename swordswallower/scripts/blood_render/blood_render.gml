if (!surface_exists(blood_surface)) {
	blood_surface = surface_create(1920,1080)
}
	
surface_set_target(blood_surface);
//surface_set_target(blood_surface)
//draw_clear_alpha($FF7F7F, 1);
//gpu_set_colofrwriteenable(true,true,true,false)
//draw_sprite(scary_skull,0,50,50)
if !player_obj.death || player_obj.respawn_timer>58 {
	draw_clear_alpha(c_black,0)
	
}
var cx =player_obj.camx
var cy =player_obj.camy



gpu_set_blendmode(bm_add)
with blood_obj {
	draw_sprite_ext(blood_sprite_new1,0,x-cx,y-cy,image_xscale*0.95,image_yscale*0.95,rot,image_blend,0.55)
}

gpu_set_blendmode(bm_normal);
gpu_set_colorwriteenable(1,1,1,0);
with blood_obj {
	draw_sprite_ext(blood_sprite_new1,0,x-cx,y-cy,image_xscale*0.95,image_yscale*0.95,rot,image_blend,0.55)
}

gpu_set_colorwriteenable(1,1,1,1)
//shader_set(shader_blood_alpha)
//gpu_set_colofrwriteenable(true,true,true,true)
////draw_sprite(blood_sprite_spr,0,250,250)
//draw_sprite(blood_sprite_spr,0,600,250)
//var blood_n = instance_number(blood_obj)

//gpu_set_colorwriteenable(true,true,true,false)
//for (i=0;i<blood_n;i++) {
//	var o = instance_find(blood_obj,i)
//	draw_sprite_ext(blood_sprite_new1,0,o.x-cx,o.y-cy,o.image_xscale*0.95,o.image_yscale*0.95,o.rot,c_white,0.55)
//}

//gpu_set_blendmode_ext(bm_max
//gpu_set_blendmode(bm_max)
//gpu_set_blendenable(true)

//gpu_set_blendenable(true)

//gpu_set_blendmode(bm_normal)

//shader_reset()
//gpu_set_colorwriteenable(true,true,true,true)
surface_reset_target()