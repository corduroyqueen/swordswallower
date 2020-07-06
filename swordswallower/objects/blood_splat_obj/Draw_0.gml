/// @description Insert description here
// You can write your code in this editor
//gpu_set_colorwriteenable(true, true, true, false);
gpu_set_tex_filter(false)
draw_self()
//gpu_set_colorwriteenable(true, true, true, true);
gpu_set_tex_filter(true)
if !in_camera_range_bigger(x,y) {
	instance_destroy()	
}