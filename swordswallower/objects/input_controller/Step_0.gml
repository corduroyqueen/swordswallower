/// @description Insert description here
// You can write your code in this editor


if controller = controller_ds4 {
	//display_mouse_set(
	
	
	
	if point_distance(0,0,gamepad_axis_value(0,gp_axisrh),
	gamepad_axis_value(0,gp_axisrv))>0.01 {
		mang = point_direction(0,0,
			gamepad_axis_value(0,gp_axisrh),
			gamepad_axis_value(0,gp_axisrv))
	}
		
	
	
	global.mousepx = lerp(global.mousepx,player_obj.x+cos(degtorad(mang))*650,1)
	global.mousepy = lerp(global.mousepx,player_obj.y-sin(degtorad(mang))*650,1)
		
		
	player_obj.k_left_r = player_obj.k_left && gamepad_axis_value(0,gp_axislh)>=-0.5
	player_obj.k_left = gamepad_axis_value(0,gp_axislh)<-0.5
	player_obj.k_left_p = player_obj.k_left && !player_obj.k_left_p
	
	player_obj.k_right_r = player_obj.k_right && gamepad_axis_value(0,gp_axislh)<=0.5
	player_obj.k_right = gamepad_axis_value(0,gp_axislh)>0.5
	player_obj.k_right_p = player_obj.k_right && !player_obj.k_right_p
	
	player_obj.k_down_r = player_obj.k_down && gamepad_axis_value(0,gp_axislv)<=0.5
	player_obj.k_down = gamepad_axis_value(0,gp_axislv)>0.5
	player_obj.k_down_p = player_obj.k_down && !player_obj.k_down_p
	
	player_obj.k_up_r = player_obj.k_up && gamepad_axis_value(0,gp_axislv)>=-0.5
	player_obj.k_up = gamepad_axis_value(0,gp_axislv)<-0.5
	player_obj.k_up_p = player_obj.k_up && !player_obj.k_up_p
	
	
	player_obj.k_fire = gamepad_button_check(0,gp_shoulderr)
	player_obj.k_fire_p = gamepad_button_check_pressed(0,gp_shoulderr)
	player_obj.k_fire_r = gamepad_button_check_released(0,gp_shoulderr)
	
	player_obj.k_dash = gamepad_button_check(0,gp_shoulderl)
	player_obj.k_dash_p = gamepad_button_check_pressed(0,gp_shoulderl)
	player_obj.k_dash_r = gamepad_button_check_released(0,gp_shoulderl)
	
	player_obj.k_ckpt = gamepad_button_check(0,gp_face1)
	player_obj.k_ckpt_p = gamepad_button_check_pressed(0,gp_face1)
	player_obj.k_ckpt_r = gamepad_button_check_released(0,gp_face1)
	
	player_obj.k_map = gamepad_button_check(0,gp_face2)
	player_obj.k_map_p = gamepad_button_check_pressed(0,gp_face2)
	player_obj.k_map_r = gamepad_button_check_released(0,gp_face2)
	
	player_obj.k_speak = gamepad_button_check(0,gp_face3)
	player_obj.k_speak_p = gamepad_button_check_pressed(0,gp_face3)
	player_obj.k_speak_r = gamepad_button_check_released(0,gp_face3)
	
	
} else if controller = controller_keyboard {
//	display_mouse_set(mouse_x-player_obj.camx,mouse_y-player_obj.camy)
	//display_mouse_set(
	//	player_obj.camx+display_mouse_get_x()-(player_obj.camx-player_obj.cam_width_h),
	//	player_obj.camy+display_mouse_get_y()-(player_obj.camy-player_obj.cam_height_h))
	global.mousepx = player_obj.camx+display_mouse_get_x()/(1920/display_get_width())
	global.mousepy = player_obj.camy+display_mouse_get_y()/(1080/display_get_height())
	
	global.mousepx = mouse_x
	global.mousepy = mouse_y
	
	with player_obj {
		k_left = keyboard_check(ord("A"))
		k_left_p = keyboard_check_pressed(ord("A"))
		k_left_r = keyboard_check_released(ord("A"))
	
		k_right = keyboard_check(ord("D"))
		k_right_p = keyboard_check_pressed(ord("D"))
		k_right_r = keyboard_check_released(ord("D"))
	
		k_down = keyboard_check(ord("S"))
		k_down_p = keyboard_check_pressed(ord("S"))
		k_down_r = keyboard_check_released(ord("S"))

		k_up = keyboard_check(ord("W"))
		k_up_p = keyboard_check_pressed(ord("W"))
		k_up_r = keyboard_check_released(ord("W"))
		
		k_fire = mouse_check_button(mb_left)
		k_fire_p = mouse_check_button_pressed(mb_left)
		k_fire_r = mouse_check_button_released(mb_left)
	
		k_dash = mouse_check_button(mb_right)
		k_dash_p = mouse_check_button_pressed(mb_right)
		k_dash_r = mouse_check_button_released(mb_right)

		k_ckpt = keyboard_check(vk_space)
		k_ckpt_p = keyboard_check_pressed(vk_space)
		k_ckpt_r = keyboard_check_released(vk_space)
		
		k_map = keyboard_check(vk_shift)
		k_map_p = keyboard_check_pressed(vk_shift)
		k_map_r = keyboard_check_released(vk_shift)
		
		k_speak = keyboard_check(ord("E"))
		k_speak_p = keyboard_check_pressed(ord("E"))
		k_speak_r = keyboard_check_released(ord("E"))
	}
	

}
