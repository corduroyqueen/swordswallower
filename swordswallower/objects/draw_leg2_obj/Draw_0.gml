/// @description Insert description here
// You can write your code in this editor
gpu_set_colorwriteenable(1,1,1,0)
with skiff_obj {
	draw_sprite_ext(skiffleft,0,
(x)+cos(degtorad(leg2_ang+270)) * leg2out,
(y-10)-sin(degtorad(leg2_ang+270)) * leg2out,
1.5,1.5,leg2_ang,c_white,1)
}
gpu_set_colorwriteenable(1,1,1,1)