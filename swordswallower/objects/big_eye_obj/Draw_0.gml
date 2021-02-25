//fuck yes


gpu_set_colorwriteenable(1,1,1,0)
draw_sprite_ext(spr_eyeballwhite,1,x,y,1,1,clamp((player_obj.x-x)/20,-45,45)+random_range(-1.0,1.0),c_white,1)
draw_sprite_ext(spr_pupil,1,x,y,1,1,clamp((player_obj.x-x)/20,-45,45)+random_range(-1.0,1.0),c_white,1)

if place_meeting(x,y,tail_obj) {
	si++
	si = min(si,4)
} else {
	si--
	si = max(si,0)
}

draw_sprite(spr_blink,si,x,y)
gpu_set_colorwriteenable(1,1,1,1)