if intro {
	if !checkpoint_manager.text_bool {
		camx = mean(player_obj.x,sword_swallower.x)-480
		camy = mean(player_obj.y,sword_swallower.y)-300
	} else {
		camx = lerp(camx,player_obj.x-480,0.08)
		camy = lerp(camy,player_obj.y-270,0.08)
	}
	
	camera_set_view_size(view_camera[0],960,540)
	
	
	
} else if tail_planted {
	
	
	var xspeed = player_obj.x+(hspeed*20)
	var yspeed = player_obj.y+(vspeed*20)
	
	//if tail_obj.outside {
	//	camx = lerp(camx,mean(xspeed,xspeed,xspeed,xspeed,xspeed,tail_obj.x,mouse_x)-cam_width_h,0.05)
	//	camy = lerp(camy,mean(yspeed,yspeed,yspeed,yspeed,yspeed,tail_obj.y,mouse_y)-cam_height_h,0.05)	
	//} else {
	//	camx = lerp(camx,mean(xspeed,xspeed,xspeed,tail_obj.x,tail_obj.x,mouse_x)-cam_width_h,0.05)
	//	camy = lerp(camy,mean(yspeed,yspeed,yspeed,tail_obj.y,tail_obj.y,mouse_y)-cam_height_h,0.05)	
	//}
	
	camx = lerp(camx,mean(xspeed,xspeed,tail_obj.x,mouse_x)-cam_width_h,0.05)
	camy = lerp(camy,mean(yspeed,yspeed,tail_obj.y,mouse_y)-cam_height_h,0.05)
	
} else if tail_zooming {
	
	camx = lerp(camx,mean(xspeed,xspeed,xspeed,mouse_x)-cam_width_h,0.05)
	camy = lerp(camy,mean(yspeed,yspeed,yspeed,mouse_y)-cam_height_h,0.05)
	
	
} else if tail_throwing {
	
	var xspeed = player_obj.x+(hspeed*20)
	var yspeed = player_obj.y+(vspeed*20)
	
	camx = lerp(camx,mean(xspeed,xspeed,mouse_x,tail_obj.x+tail_obj.hspeed*8,tail_obj.x+tail_obj.hspeed*8)-cam_width_h,0.03)
	camy = lerp(camy,mean(yspeed,yspeed,mouse_y,tail_obj.y+tail_obj.vspeed*8,tail_obj.y+tail_obj.vspeed*8)-cam_height_h,0.03)	
	
	camx = lerp(camx,clamp(camx,player_obj.x-270-cam_width_h,player_obj.x+270-cam_width_h),0.2)
	camy = lerp(camy,clamp(camy,player_obj.y-230-cam_height_h,player_obj.y+230-cam_height_h),0.2)
	
	
} else {
	
	
	var xspeed = player_obj.x+(hspeed*20)
	var yspeed = player_obj.y+(vspeed*20)
	
	
	camx = lerp(camx,mean(xspeed,mouse_x)-cam_width_h,0.05)
	camy = lerp(camy,mean(yspeed,mouse_y)-cam_height_h,0.05)	
	
	camx = lerp(camx,clamp(camx,player_obj.x-270-cam_width_h,player_obj.x+270-cam_width_h),0.2)
	camy = lerp(camy,clamp(camy,player_obj.y-230-cam_height_h,player_obj.y+230-cam_height_h),0.2)
}

if camera_shake {
	camx += random_range(-10,10)
	camy += random_range(-10,10)
	if inv_count>1 {
		camera_shake = false	
	}
}


if camera_shake_direc {
	shake_dir-=10
	camx += cos(cam_ang) * shake_dir
	camy += -sin(cam_ang) * shake_dir
	if shake_dir<1 {
		camera_shake_direc = false	
		shake_dir=0
	}	
}


if camera_shake_d {
	shake_d-=0.5
	camx += random_range(-shake_d,shake_d)
	camy += random_range(-shake_d,shake_d)
	if shake_d<0 {
		camera_shake_d = false	
	}
}

if zoom_timer_bool {
	tempadd = 5-(zoom_timer/2)
	tempadd = clamp(tempadd,0,5)
	camx += random_range(-3+tempadd,3+tempadd)
	camy += random_range(-3+tempadd,3+tempadd)
}

if c_slingtimer>0 {
	c_slingtimer-=0.2
	camx += random_range(-c_slingtimer,c_slingtimer)
	camx += random_range(-c_slingtimer,c_slingtimer)
}
camx = floor(camx)
camy = floor(camy)

camera_set_view_pos(view_camera[0],camx,camy)