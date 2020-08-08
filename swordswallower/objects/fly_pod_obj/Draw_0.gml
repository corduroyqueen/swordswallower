
bounce_vel=(-vsp/30)

bounce_vel += (rval-sprite_scale_x)
bounce_vel *= 0.9

sprite_scale_x += bounce_vel
sprite_scale_y = rval+(rval-sprite_scale_x)

draw_sprite_ext(fly_pod,0,x,y,sprite_scale_x,sprite_scale_y,0,c_white,1)