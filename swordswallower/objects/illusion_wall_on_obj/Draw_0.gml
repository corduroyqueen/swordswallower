/// @description Insert description here
// You can write your code in this editor
if level1_master.illusion>2 {
	draw_self()
} else {
	var uTime = shader_get_uniform(shader1,"Time");

    shader_set(shader1)
    shader_set_uniform_f(uTime,current_time/10000)
	
	draw_self()
	
	shader_reset()
}