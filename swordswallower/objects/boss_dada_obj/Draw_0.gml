//fuck yes
//draw_sprite(dada_guard_sword_hitbox,0,x,y)
var subimg_trans = floor(subimg)
draw_sprite_ext(sprite,subimg_trans,x,y,facing,1,0,image_blend,1)

if arm_visible {
	draw_sprite_ext(arm_sprite,arm_sprite_i,x+arm_off_x*facing,y+arm_off_y,1,1,arm_angle,c_white,1)
}