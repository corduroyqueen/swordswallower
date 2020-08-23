if (!surface_exists(blood_splat_surface)) {
	blood_splat_surface = surface_create(1920,1080)
}

if instance_number(blood_splat_obj)==0 {
		
} else {

surface_set_target(blood_splat_surface);
//surface_set_target(blood_surface)
//draw_clear_alpha($FF7F7F, 1);
//gpu_set_colofrwriteenable(true,true,true,false)
//draw_sprite(scary_skull,0,50,50)

gpu_set_blendenable(false)
gpu_set_colorwriteenable(false,false,false,true);
draw_set_alpha(0);
draw_sprite_stretched(rect,0,0,0,1920,1080)

draw_set_alpha(1);
draw_surface(art_surface_setter.art_surface,0,0)
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);


	
//shader_set(shader_blood_alpha)
//gpu_set_colofrwriteenable(true,true,true,true)
////draw_sprite(blood_sprite_spr,0,250,250)
//draw_sprite(blood_sprite_spr,0,600,250)

gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
gpu_set_alphatestenable(true);

var blood_n = instance_number(blood_splat_obj)
var cx =player_obj.camx
var cy =player_obj.camy
//gpu_set_colorwriteenable(true,true,true,false)
for (i=0;i<blood_n;i++) {
	var o = instance_find(blood_splat_obj,i)
	draw_sprite_ext(blood_sprite_spr,0,o.x-cx,o.y-cy,1,1,0,c_white,0.6)
}

gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);
//shader_reset()
//gpu_set_colorwriteenable(true,true,true,true)
surface_reset_target()

}