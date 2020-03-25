/// @description Insert description here
// You can write your code in this editor
//var uTime = shader_get_uniform(wind_shader,"Time");

var uTime = shader_get_uniform(shader1,"Time");

shader_set(shader1)
shader_set_uniform_f(uTime,current_time/1000)
draw_self()
shader_reset()