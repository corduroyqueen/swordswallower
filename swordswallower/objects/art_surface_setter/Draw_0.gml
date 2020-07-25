/// @description Insert description here
// You can write your code in this editor


//
//if event_type == ev_draw
//   {
//   if event_number == 0
//      {
//		surface_set_target(art_surface)
//      }
//   }
   
//
if (!surface_exists(blood_splat_surface)) {
	blood_splat_surface = surface_create(1920,1080)
}


surface_set_target(blood_splat_surface);
//surface_set_target(blood_surface)
//draw_clear_alpha($FF7F7F, 1);
//gpu_set_colofrwriteenable(true,true,true,false)
//draw_sprite(scary_skull,0,50,50)

//draw_clear_alpha(c_white,0)

//gpu_set_blendenable(false)
//gpu_set_colorwriteenable(false,false,false,true);
//draw_set_alpha(0);
//draw_rectangle(0,0, 1920,1080, false);

//draw_set_alpha(1);
//draw_surface(art_surface,0,0)
//gpu_set_blendenable(true);
//gpu_set_colorwriteenable(true,true,true,true);

draw_clear_alpha(c_white,0)
	
//shader_set(shader_blood_alpha)
//gpu_set_colofrwriteenable(true,true,true,true)
////draw_sprite(blood_sprite_spr,0,250,250)
//draw_sprite(blood_sprite_spr,0,600,250)

//gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
//gpu_set_alphatestenable(true);

var cx =player_obj.camx
var cy =player_obj.camy
//gpu_set_colorwriteenable(true,true,true,false)
for (i=0;i<ds_list_size(splat_list_x);i++) {
	draw_sprite_ext(blood_splat_lel,0,
	splat_list_x[| i]-cx,splat_list_y[| i]-cy,
	splat_list_s[| i]*0.07,splat_list_s[| i]*0.07,splat_list_rot[| i],c_white,1)
}

//gpu_set_alphatestenable(false);
//gpu_set_blendmode(bm_normal);
//shader_reset()
//gpu_set_colorwriteenable(true,true,true,true)
surface_reset_target()


tex_art = surface_get_texture(art_surface)
texture_set_stage(shader_art_surface, tex_art);

gpu_set_colorwriteenable(true, true, true, false);
draw_surface(art_surface,player_obj.camx,player_obj.camy)

shader_set(shader_blood_alpha_surface)
draw_surface(blood_splat_surface,player_obj.camx,player_obj.camy)
shader_reset()



gpu_set_colorwriteenable(true, true, true, true)




surface_set_target(art_surface)
draw_clear_alpha(c_white,0)
surface_reset_target()

	
//draw_surface(art_surface,player_obj.camx,player_obj.camy)