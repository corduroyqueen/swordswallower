/// @description Insert description here
// You can write your code in this editor

intro = checkpoint_manager.intro_start
if held_position_start {
	held_position_start = false	
}

if cool {
	tail_obj.x = x
	tail_obj.y = y
	
	//wall_obj.visible = !wall_obj.visible
	//black_wall_obj.visible = !black_wall_obj.visible
	//spike.visible = !spike.visible
	//thin_floor_obj.visible = !thin_floor_obj.visible
	
	//wall_obj.visible = true
	//black_wall_obj.visible = true
	//spike.visible = true
	//thin_floor_obj.visible = true
	layer_set_visible(layer_get_id("background_layer"),true)
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