/// @description Insert description here
// You can write your code in this editor
if wave {
	 var uTime = shader_get_uniform(shader1,"Time");

    shader_set(shader1)
    shader_set_uniform_f(uTime,current_time/1000)
}

if shader_water_active {
	var uTime = shader_get_uniform(shader_water,"Time");
	
	shader_set(shader_water)
    shader_set_uniform_f(uTime,current_time/1000)
}

if shader_mask_active {
	
	/*
	shader_set(shader_mask); //We won't call this again
	var u_Mask = shader_get_sampler_index(shader_mask, "u_Mask");
	var u_MaskUV = shader_get_uniform(shader_mask, "u_MaskUV");
	var u_SpriteUV = shader_get_uniform(shader_mask, "u_SpriteUV");

	var maskTex = sprite_get_texture(sprite, image_index)
	var maskUVs = sprite_get_uvs(sprite, image_index)
	texture_set_stage(u_Mask, maskTex);
	shader_set_uniform_f(u_MaskUV, maskUVs[0], maskUVs[1], maskUVs[2], maskUVs[3]);

	var spriteUVs = sprite_get_uvs(mask_source, mask_image);
	shader_set_uniform_f(u_SpriteUV, spriteUVs[0], spriteUVs[1], spriteUVs[2], spriteUVs[3]);*/
	
	//gpu_set_blendmode_ext( bm_dest_color,bm_src_alpha)
	
	
	var colorIn = shader_get_uniform(shader_color_replace,"colorIn")           //color to replace (vec4)
	var colorOut = shader_get_uniform(shader_color_replace,"colorOut")           //color to replace (vec4)
	var colorTolerance = shader_get_uniform(shader_color_replace,"colorTolerance")           //color to replace (vec4)
	var blend = shader_get_uniform(shader_color_replace,"blend")           //color to replace (vec4)
//      colorOut            replacement color (vec4)
//      colorTolerance      HSVA tolerances (vec4)
//      blend               1.0 preserves shading of original, 

	//gpu_set_blendmode_ext( bm_dest_color,bm_src_color)
	
	shader_set(shader_color_replace)
	shader_set_uniform_f(colorIn,229/255,49/255,52/255)
	shader_set_uniform_f(colorOut,0,0.32,0.5)
	shader_set_uniform_f(colorTolerance,0.1,0.1,0.1,0.1)
	shader_set_uniform_f(blend,1.0)
	
	//gpu_set_blendmode_ext( bm_dest_alpha,bm_src_alpha_sat)
	
	
/*
	surface_set_target(surf);
	shader_set(shader_mask);
	texture_set_stage(samp_mask_tex , bg_Mask_Tex );*/

	
}
	
x = vBaseX + ((player_obj.camx+960)/parallax_num);
if ycheck {
	y = vBaseY + (player_obj.camy/parallax_num);
}


if player_obj.mapout {
	x = vBaseX
	y = vBaseY
}


if abs(player_obj.x-x)<distance && !perm {
	
	//draw_sprite_ext(sprite43,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(sprite,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,1)
}
if perm {
	draw_sprite_ext(sprite,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,1)	
}


gpu_set_fog(false, 0,0,0);
gpu_set_blendmode( bm_normal)
shader_reset()