/// @description Insert description here
// You can write your code in this editor


if screenstate==0 {
	
	
	
	timer++
	if timer<9000  && alpha<=1 {
		alpha+=0.0025
	} 

	camx = camera_get_view_x(view_camera[0])
	camy = camera_get_view_y(view_camera[0])
	//draw_sprite_ext(bgforuti,0,camx,camy,2/3,2/3,0,c_white,0.5)


	var uTime = shader_get_uniform(shader1,"Time");

	shader_set(shader1)
	shader_set_uniform_f(uTime,current_time/10000)
	


	//draw_sprite_ext(titlescreenline,0,camx,camy,1,1,0,c_white,1)
	//draw_sprite_ext(sword515,0,640,360,1,-1,30,c_white,alpha/2)
	
	//draw_sprite_ext(s1w,0,160,0,1,1,0,c_white,alpha)
	
	shader_reset()
	
	//draw_sprite_ext(s2w,0,600,100,1,1,0,c_white,alpha)
	//draw_sprite_ext(s3w,0,1040,200,1,1,0,c_white,alpha)
	//draw_sprite_ext(s4w,0,1480,300,1,1,0,c_white,alpha)
	
	draw_set_font(fontl)
	draw_set_color(c_white)
	
	//draw_text_ext_color(20,10,
	////camy+360,
	//"SWORDSWALLOWER",0,0,c_white,c_white,c_white,c_white,1)

	//draw_sprite_ext(titlescreentitle,0,camx,camy,1,1,0,c_white,alpha)
	
	//draw_sprite_ext(logo3,0,camx+640,camy+360,1.1,1.1,0,c_white,alpha)

	draw_sprite_ext(spr_titlewiggle,image_index,0,0,1,1,0,c_white,alpha)
	
	anim_t++ if anim_t>12 {anim_t=0}
	draw_sprite_ext(spr_swordglimmeranim,anim_t,0,0,1,1,0,c_white,alpha)
	
	
	
	
	var ang = point_direction(ex1,ey1,mouse_x,mouse_y)
	var dist = min(point_distance(ex1,ey1,mouse_x,mouse_y)/20,75)
	draw_sprite_ext(spr_leftestpupil,0,ex1 + dcos(ang)*dist,ey1- dsin(ang)*dist,1-dist/100,1,ang,0,alpha)
	ang = point_direction(ex2,ey2,mouse_x,mouse_y)
	dist = min(point_distance(ex2,ey2,mouse_x,mouse_y)/20,60)
	draw_sprite_ext(spr_middlemiddlepupil,0,ex2 + dcos(ang)*dist,ey2- dsin(ang)*dist,1-dist/75,1,ang,0,alpha)
	ang = point_direction(ex3,ey3,mouse_x,mouse_y)
	dist = min(point_distance(ex3,ey3,mouse_x,mouse_y)/20,100)
	draw_sprite_ext(spr_rightestpulil,0,ex3 + dcos(ang)*dist,ey3- dsin(ang)*dist,1-dist/125,1,ang,0,alpha)
	
	//draw_circle(ex1,ey1,10,false)
	//draw_circle(ex2,ey2,10,false)
	//draw_circle(ex3,ey3,10,false)
	
	if alpha<0.8 { return }
	draw_set_color(c_white)
	draw_set_font(font2)
	timer1+=0.05
	timer2+=0.05
	timer3+=0.05
	var c
	var wa = 1150
	timer1=clamp(timer1,0,1)
	//var playc = make_color_hsv(229,15,86)
	if mouse_x>wa && mouse_x<(wa+180) && mouse_y>440 && mouse_y<630 {
		c = redc
		
		if mouse_check_button_pressed(mb_left) {
			room_goto_next()
		}
	} else {
		c = c_white	
	}
	
	draw_sprite_ext(spr_playbutton,0,0,0,1,1,0,c,timer1)
	
	timer2=clamp(timer2,0,1)
	//var fulscc = make_color_hsv(233,23,59)
	if mouse_x>wa && mouse_x<(wa+360) && mouse_y>630 && mouse_y<760 {
		c = redc
		if  mouse_check_button_pressed(mb_left) {
			window_set_fullscreen( !window_get_fullscreen()  )
		}
	}else {
		c =c_white
	}
	draw_sprite_ext(spr_fullscreenbutton,0,0,0,1,1,0,c,timer2)
	
	timer3=clamp(timer3,0,1)
	//var creditc = make_color_hsv(131,17,46)
	if mouse_x>wa+100 && mouse_x<(wa+300) && mouse_y>760 && mouse_y<1000 {
		c=redc
		
		if mouse_check_button_pressed(mb_left) {
			game_end()
		}
	} else {
		c=c_white	
	}
	
	draw_sprite_ext(spr_quitbutton,0,0,0,1,1,0,c,timer3)
	
	
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
	
	//if mouse_x>1200 && mouse_x<1280 && mouse_y>600 && mouse_y<680
	//&& mouse_check_button_pressed(mb_left) {
	//	window_set_fullscreen( !window_get_fullscreen()  )
	//}
	
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

