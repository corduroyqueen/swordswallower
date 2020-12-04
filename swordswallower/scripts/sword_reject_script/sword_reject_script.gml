var spark = instance_create_depth(tail_obj.x,tail_obj.y,depth+1,spark_particle_effect_obj)
spark.angle = point_direction(0,0,-temp_hs,-temp_vs)

player_obj.tail_pulling = true

player_obj.tail_planted = false
player_obj.tail_throwing = false

player_obj.shake_d=5
player_obj.camera_shake_d = true
	
tail_obj.x = tail_obj.xpreva
tail_obj.y = tail_obj.ypreva

var s = sword_reject_1
audio_sound_pitch(s,random_range(0.95,1.05))

var cx = player_obj.cam_midx
var cy = player_obj.cam_midy

	
audio_play_sound_at(s,
	mean(cx,cx,cx,cx,cx,cx,tail_obj.x),
	mean(cy,cy,cy,cy,cy,cy,tail_obj.y),0,0,0,0,false,0)