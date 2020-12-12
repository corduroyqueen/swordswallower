sprite = argument0
xin = argument1
yin = argument2
surf = argument3


surface_set_target(surf)
draw_clear_alpha(c_white,0)
gpu_set_blendenable(false)
gpu_set_colorwriteenable(false,false,false,true);
draw_set_alpha(0);
//draw_set_color(c_white)

var xo,yo,wo,ho
xo = sprite_get_xoffset(sprite)
yo = sprite_get_yoffset(sprite)
wo = sprite_get_width(sprite)
ho = sprite_get_height(sprite)
//draw_rectangle(xin-xo-100,yin-yo-100,xin+wo-xo+100,yin+ho-yo+100, false);
draw_rectangle(0,0,wo,yo, false);
//draw_sprite_stretched(rect,0,xin-xo-100,yin-yo-100,wo+200,ho+200)
draw_set_alpha(1);
draw_sprite(sprite,0, xo,yo);
//draw_sprite(sprite,0, 8,8);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);

var sx = min(((current_time+room_width-x)%4000)/5,120)

gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
gpu_set_alphatestenable(true);
//draw_sprite(shine_sprite,0, xin-xo-30+sx,yin);
//draw_sprite(shine_sprite,0, xo-30+sx,yo);
//draw_sprite(shine_sprite,0, xo,yo);
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);

surface_reset_target()

draw_surface(surf,xin-xo,yin-yo)