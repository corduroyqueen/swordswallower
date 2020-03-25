if dir_ground {
 }

if dir_ceiling {
if tail_obj.y<(y+20) && tail_obj.vspeed>0 && !met {
	death = true
} else if tail_obj.vspeed<0 {
	sword_present = true
	sword_hold_x = (tail_obj.x-x)
	sword_hold_y = (tail_obj.y-y)
	audio_manager(gsound.s_sword_hit_shell,0,false,0)
	player_obj.tail_throwing = false
	player_obj.tail_pulling = false
	player_obj.tail_planted = true
} }

if dir_lwall {
if tail_obj.x<(x+20) && tail_obj.hspeed>0 && !met {
	death = true
} else if tail_obj.hspeed<0 {
	sword_present = true
	sword_hold_x = (tail_obj.x-x)
	sword_hold_y = (tail_obj.y-y)
	audio_manager(gsound.s_sword_hit_shell,0,false,0)
	player_obj.tail_throwing = false
	player_obj.tail_pulling = false
	player_obj.tail_planted = true
} }

if dir_rwall {
if tail_obj.x>(x-20) && tail_obj.hspeed<0 && !met {
	death = true
} else if tail_obj.hspeed>0 {
	sword_present = true
	sword_hold_x = (tail_obj.x-x)
	sword_hold_y = (tail_obj.y-y)
	audio_manager(gsound.s_sword_hit_shell,0,false,0)
	player_obj.tail_throwing = false
	player_obj.tail_pulling = false
	player_obj.tail_planted = true
} }