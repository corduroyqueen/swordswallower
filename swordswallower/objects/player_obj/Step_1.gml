/// @description Insert description here
// You can write your code in this editor

intro = checkpoint_manager.intro_start


if cool {
	tail_obj.x = x
	tail_obj.y = y
	
	
	if intro {
		tail_obj.x = sword_swallower.x
		tail_obj.y = sword_swallower.y
		tail_obj.image_angle = sword_swallower.image_angle
		tail_planted = true
		tail_carry = false
		//instance_activate_object(background)
	} else {
		x = checkpoint_manager.rx
		y = checkpoint_manager.ry-40
		xpreva2 = x
		ypreva2 = y
		xpreva = x
		ypreva = x
		audio_play_sound(firelit1,0,false)	
	}
	//camera_set_view_pos(view_camera[0],x-700,y-300)
	cool = false
}
check_zoom_collision = false