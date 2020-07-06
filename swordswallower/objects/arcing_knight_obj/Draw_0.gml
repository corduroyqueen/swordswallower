/// @description Insert description here
// You can write your code in this editor


if state==state_idle {
	draw_sprite_ext(arcing_knight_t,0,x,y,xs,1,0,c_white,1)
} else if state==state_tossing {
	draw_sprite_ext(arcing_knight_t,0,x,y,xs,1,0,c_white,1)
} else if state==state_melee {
	draw_sprite_ext(arcing_knight_t,0,x,y,xs,1,0,c_white,1)
} else if state==state_defense {
	draw_sprite_ext(arcing_knight_up_t,0,x,y,xs,1,0,c_white,1)
} else if state==state_harpoon {
	draw_sprite_ext(arcing_knight_up_t,0,x,y,xs,1,0,c_white,1)
}