/// @description Insert description here
// You can write your code in this editor
with skiff_obj {
	draw_sprite_ext(skiffright,0,

	(x)+cos(degtorad(leg1_ang+270)) * leg1out,
	(y+10)-sin(degtorad(leg1_ang+270)) * leg1out,

	1.5,1.5,leg1_ang,c_white,1)
}