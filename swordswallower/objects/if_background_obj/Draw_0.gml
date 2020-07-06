/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if level1_master.illusion==2 {
	var uTime = shader_get_uniform(if_bkd_shader,"Time");
	var uAmp = shader_get_uniform(if_bkd_shader,"Amp");

    shader_set(if_bkd_shader)
    shader_set_uniform_f(uTime,current_time/10000)
    shader_set_uniform_f(uAmp,400)
} else if level1_master.illusion==1 {
	var uTime = shader_get_uniform(if_bkd_shader,"Time");
	var uAmp = shader_get_uniform(if_bkd_shader,"Amp");

    shader_set(if_bkd_shader)
    shader_set_uniform_f(uTime,current_time/5000)
	shader_set_uniform_f(uAmp,300)
} else if level1_master.illusion==0 {
	var uTime = shader_get_uniform(if_bkd_shader,"Time");
	var uAmp = shader_get_uniform(if_bkd_shader,"Amp");

    shader_set(if_bkd_shader)
    shader_set_uniform_f(uTime,current_time/2500)
	shader_set_uniform_f(uAmp,200)
} else {
		
}
	
x = vBaseX + ((player_obj.camx+960)/parallax_num);


if player_obj.mapout {
	x = vBaseX
	y = vBaseY
}


if abs(player_obj.x-x)<distance && !perm {
	
	//draw_sprite_ext(sprite43,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(sprite_index,image_index,x,y,6,6,0,c_white,0.6)
}



shader_reset()