/// @description Insert description here
// You can write your code in this editor
if yeet==0 {
	gpu_set_blendmode(bm_add)
	var ok = random_range(0.8,0.9)
		
	draw_sprite_ext(Ellipse_2,0,x-5,y-100,ok*7,ok*7,0,c_white,0.125)
		
	draw_sprite_ext(Ellipse_2,0,x-5,y-100,ok*3,ok*3,0,c_white,1)
		
		
		
	gpu_set_blendmode(bm_normal)
	
	var uTime = shader_get_uniform(shader1,"Time");
	shader_set(shader1)
	shader_set_uniform_f(uTime,current_time/1000)
	
	draw_sprite_ext(sprite_index,0,x-5,y-100,image_xscale,image_yscale,0,c_white,1)
	
	shader_reset()
		
} 

if yeet==1 {
	var uTime = shader_get_uniform(shader_cow,"Time");

	shader_set(shader_cow)
	shader_set_uniform_f(uTime,current_time/400)
	draw_sprite_ext(sprite_index,0,x-5,y-100,image_xscale,image_yscale,0,c_white,1)	
	shader_reset()
}

if yeet==2 {
	var uTime = shader_get_uniform(shader_cow,"Time");

	shader_set(shader_cow)
	shader_set_uniform_f(uTime,current_time/400)
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,c_white,1)	
	shader_reset()
}