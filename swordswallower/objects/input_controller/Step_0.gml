/// @description Insert description here
// You can write your code in this editor

//if room!=subtemple01 {
//	return
//}

if controllers_disabled { controller = controller_keyboard }
if controller = controller_ds4 {
	//display_mouse_set(
	
	
	gamepad_set_axis_deadzone(0, 0.2)
	
	if point_distance(0,0,gamepad_axis_value(0,gp_axisrh),
	gamepad_axis_value(0,gp_axisrv))>0.1 {
		mang = point_direction(0,0,
			gamepad_axis_value(0,gp_axisrh),
			gamepad_axis_value(0,gp_axisrv))
	} else {
		if point_distance(0,0,gamepad_axis_value(0,gp_axislh),
		gamepad_axis_value(0,gp_axislv))>0.5 {
			mang = point_direction(0,0,
				gamepad_axis_value(0,gp_axislh),
				gamepad_axis_value(0,gp_axislv))
		}
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
	
	
	player_obj.k_fire = gamepad_button_check(0,gp_shoulderrb)
	player_obj.k_fire_p = gamepad_button_check_pressed(0,gp_shoulderrb)
	player_obj.k_fire_r = gamepad_button_check_released(0,gp_shoulderrb)
	
	
	
	player_obj.k_dash = gamepad_button_check(0,gp_shoulderlb)
	player_obj.k_dash_p = gamepad_button_check_pressed(0,gp_shoulderlb)
	player_obj.k_dash_r = gamepad_button_check_released(0,gp_shoulderlb)
	
	player_obj.k_ckpt = gamepad_button_check(0,gp_face1)
	player_obj.k_ckpt_p = gamepad_button_check_pressed(0,gp_face1)
	player_obj.k_ckpt_r = gamepad_button_check_released(0,gp_face1)
	
	player_obj.k_map = gamepad_button_check(0,gp_face2)
	player_obj.k_map_p = gamepad_button_check_pressed(0,gp_face2)
	player_obj.k_map_r = gamepad_button_check_released(0,gp_face2)
	
	player_obj.k_speak = gamepad_button_check(0,gp_face3)
	player_obj.k_speak_p = gamepad_button_check_pressed(0,gp_face3)
	player_obj.k_speak_r = gamepad_button_check_released(0,gp_face3)
	
	if point_distance(mouse_x,mouse_y,mouse_x_last,mouse_y_last)>100 {
		controller = controller_keyboard
	}
	
} else if controller = controller_keyboard {
//	display_mouse_set(mouse_x-player_obj.camx,mouse_y-player_obj.camy)
	//display_mouse_set(
	//	player_obj.camx+display_mouse_get_x()-(player_obj.camx-player_obj.cam_width_h),
	//	player_obj.camy+display_mouse_get_y()-(player_obj.camy-player_obj.cam_height_h))
	
	//global.mousepx = player_obj.camx+display_mouse_get_x()/(1920/display_get_width())
	//global.mousepy = player_obj.camy+display_mouse_get_y()/(1080/display_get_height())
	
	//global.mousepx = mouse_x
	//global.mousepy = mouse_y
	//sdm(mouse_x)
	//sdm(mouse_y)
	//global.mousepx = floor(global.mousepx + (mouse_x - player_obj.camx))
	//global.mousepy = floor(global.mousepy + (mouse_y - player_obj.camy))
	global.mousepx = floor(global.mousepx + (window_mouse_get_x()-960) + player_obj.camxdiff)
	global.mousepy = floor(global.mousepy + (window_mouse_get_y()-540) + player_obj.camydiff)
	
	//global.mousepx++
	//global.mousepy++
	
	//global.mousepx=floor(global.mousepx +mouse_x-player_obj.camx)
	//global.mousepy= floor(global.mousepy + mouse_y-player_obj.camy)
	
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
		
		k_map = keyboard_check(vk_control)
		k_map_p = keyboard_check_pressed(vk_control)
		k_map_r = keyboard_check_released(vk_control)
		
		k_speak = keyboard_check(ord("E"))
		k_speak_p = keyboard_check_pressed(ord("E"))
		k_speak_r = keyboard_check_released(ord("E"))
	}
	
	if controller_present && point_distance(0,0,
			gamepad_axis_value(0,gp_axisrh),
			gamepad_axis_value(0,gp_axisrv))>0.3 {
		controller = controller_ds4
	}
	if global.mousepx<=player_obj.camx {
		global.mousepx = player_obj.camx+1
	}
	if global.mousepx>=player_obj.camx+1920 {
		global.mousepx = player_obj.camx+1919
	}
	if global.mousepy<=player_obj.camy {
		global.mousepy = player_obj.camy+1
	}
	if global.mousepy>=player_obj.camy+1080 {
		global.mousepy = player_obj.camy+1079
	}
	
	
	
	window_mouse_set(960,540)
	//sdm(mouse_x)
	//sdm(mouse_y)

}


if room==subtemple01 && skiff_obj.go && !skiff_obj.done {
	global.mousepx = skiff_obj.x-500
	global.mousepy = skiff_obj.y-500
}
mouse_x_last = mouse_x
mouse_y_last = mouse_y

//if global.mousepx<player_obj.camx{
//	window_mouse_set(player_obj.camx+5,global.mousepy)
//}
//if global.mousepx>player_obj.camx+1920{
//	window_mouse_set(player_obj.camx+1915,global.mousepy)
//}
//if global.mousepy<player_obj.camy{
//	window_mouse_set(global.mousepx,player_obj.camy+5)
//}
//if global.mousepy>player_obj.camy+1080{
//	window_mouse_set(global.mousepx,player_obj.camy+1075)
//}

