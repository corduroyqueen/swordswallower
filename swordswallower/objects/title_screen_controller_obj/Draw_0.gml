/// @description Insert description here
// You can write your code in this editor


if screenstate==0 {
	
	
	
	timer++
	if timer<9000  && alpha<=1 {
		alpha+=0.005
	} 

	camx = camera_get_view_x(view_camera[0])
	camy = camera_get_view_y(view_camera[0])
	//draw_sprite_ext(bgforuti,0,camx,camy,2/3,2/3,0,c_white,0.5)


	var uTime = shader_get_uniform(shader1,"Time");

	shader_set(shader1)
	shader_set_uniform_f(uTime,current_time/10000)
	


	//draw_sprite_ext(titlescreenline,0,camx,camy,1,1,0,c_white,1)
	//draw_sprite_ext(sword515,0,640,360,1,-1,30,c_white,alpha/2)
	
	draw_sprite_ext(s1w,0,160,0,1,1,0,c_white,alpha)
	
	shader_reset()
	
	draw_sprite_ext(s2w,0,600,100,1,1,0,c_white,alpha)
	draw_sprite_ext(s3w,0,1040,200,1,1,0,c_white,alpha)
	draw_sprite_ext(s4w,0,1480,300,1,1,0,c_white,alpha)
	
	draw_set_font(fontl)
	draw_set_color(c_white)
	
	//draw_text_ext_color(20,10,
	////camy+360,
	//"SWORDSWALLOWER",0,0,c_white,c_white,c_white,c_white,1)

	//draw_sprite_ext(titlescreentitle,0,camx,camy,1,1,0,c_white,alpha)
	
	draw_sprite_ext(logo3,0,camx+640*1.5,camy+360*1.5,1.1,1.1,0,c_white,alpha)

	

	draw_set_color(c_white)
	draw_set_font(font2)
	timer1+=0.05
	timer2+=0.05
	timer3+=0.05
	var c
	var wa = 350
	draw_set_alpha(clamp(0,timer1,1))
	var playc = make_color_hsv(229,15,86)
	if mouse_x>wa*1.5 && mouse_x<(wa+90)*1.5 && mouse_y>440*1.5 && mouse_y<500*1.5 {
		c = c_white
		
		if mouse_check_button_pressed(mb_left) {
			room_goto_next()
		}
	} else {
		c = playc	
	}
	
	draw_sprite_ext(play_btn,0,wa*1.5,450*1.5,1,1,0,c,1)
	
	draw_set_alpha(clamp(0,timer2,1))
	var fulscc = make_color_hsv(233,23,59)
	if mouse_x>wa*1.5 && mouse_x<(wa+90)*1.5 && mouse_y>510*1.5 && mouse_y<560*1.5 {
		c = c_white
		if  mouse_check_button_pressed(mb_left) {
			window_set_fullscreen( !window_get_fullscreen()  )
		}
	}else {
		c =fulscc
	}
	draw_sprite_ext(fullscreen_btn,0,wa*1.5,510*1.5,1,1,0,c,1)
	
	draw_set_alpha(clamp(0,timer3,1))
	var creditc = make_color_hsv(131,17,46)
	if mouse_x>wa*1.5 && mouse_x<(wa+90)*1.5 && mouse_y>570*1.5 && mouse_y<620*1.5 {
		c=c_white
		
		if mouse_check_button_pressed(mb_left) {
			game_end()
		}
	} else {
		c=creditc	
	}
	
	draw_sprite_ext(quit_btn,0,wa*1.5,570*1.5,1,1,0,c,1)
	
	
	//if mouse_x>600 && mouse_x<800 && mouse_y>400 && mouse_y<500 {
		
	//	draw_sprite_ext(titlescreenplay,0,camx,camy,1,1,0,c_red,alpha - random_range(0.00,0.10))
	//	//audio_stop_sound(titlescreenmusic)
	//} else {
	//	draw_sprite_ext(titlescreenplay,0,camx,camy,1,1,0,c_white,alpha)	
	//}
	
	
	
	//if mouse_x>1200 && mouse_x<1280 && mouse_y>680 && mouse_y<720
	//&& mouse_check_button_pressed(mb_left) {
	//	screenstate=1
	//}
	
	if mouse_x>1200*1.5 && mouse_x<1280*1.5 && mouse_y>600*1.5 && mouse_y<680*1.5
	&& mouse_check_button_pressed(mb_left) {
		window_set_fullscreen( !window_get_fullscreen()  )
	}
	
} 
//else if screenstate==1 {
	
//	draw_set_color(make_color_hsv(229,15,86))
//	draw_set_font(font2)
	
	
//	//var uTime = shader_get_uniform(shader1,"Time");

//	//shader_set(shader1)
//	//shader_set_uniform_f(uTime,current_time/10000)
	
	
	
//	//draw_text(550,200,"Uti Azulay")
	
	
//	//draw_text(420,250,"Design, Code, and Sound")
	
//	////draw_text(600,300,"and")
//	//draw_text(500,400,"Julia Del Matto")
//	//draw_text(610,450,"Art")
	
//	draw_sprite_ext(credits,0,camx+640,camy+360,2/3,2/3,0,c_white,1)
	
//	//shader_reset()
	
	
	
//	var creditc = make_color_hsv(131,17,46)
//	if mouse_x>60 && mouse_x<240 && mouse_y>570 && mouse_y<620 {
//		draw_set_color(c_white)
		
//		if mouse_check_button_pressed(mb_left) {
//			screenstate=0
//		}
//	} else {
//		draw_set_color(creditc)	
//	}
	
//	draw_text(60,570,"Back")
	
//}

draw_set_color(c_white)
draw_circle(mouse_x,mouse_y,6,false)

