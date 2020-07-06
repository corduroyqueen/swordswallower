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
	
	draw_sprite_ext(sworfd,0,640,550,1,1,180,c_white,alpha)
	shader_reset()

	draw_set_font(fontl)
	draw_set_color(c_white)
	draw_text_ext_color(20,10,
	//camy+360,
	"SWORDSWALLOWER",0,0,c_white,c_white,c_white,c_white,1)

	//draw_sprite_ext(titlescreentitle,0,camx,camy,1,1,0,c_white,alpha)
	
	draw_sprite_ext(swsw3,0,camx+640,camy+360,0.907,0.907,0,c_white,alpha)

	

	draw_set_color(c_white)
	draw_set_font(font2)
	timer1+=0.05
	timer2+=0.05
	timer3+=0.05
	
	draw_set_alpha(clamp(0,timer1,1))
	var playc = make_color_hsv(229,15,86)
	if global.mousepx>60 && global.mousepx<150 && global.mousepy>450 && global.mousepy<500 {
		draw_set_color(c_white)
		
		if mouse_check_button_pressed(mb_left) {
			room_goto_next()
		}
	} else {
		draw_set_color(playc)	
	}
	
	draw_text(60,450,"Play")
	
	draw_set_alpha(clamp(0,timer2,1))
	var fulscc = make_color_hsv(233,23,59)
	if global.mousepx>60 && global.mousepx<270 && global.mousepy>510 && global.mousepy<560 {
		draw_set_color(c_white)
		if  mouse_check_button_pressed(mb_left) {
			window_set_fullscreen( !window_get_fullscreen()  )
		}
	}else {
		draw_set_color(fulscc)	
	}
	draw_text(60,510,"Fullscreen")
	
	draw_set_alpha(clamp(0,timer3,1))
	var creditc = make_color_hsv(131,17,46)
	if global.mousepx>60 && global.mousepx<240 && global.mousepy>570 && global.mousepy<620 {
		draw_set_color(c_white)
		
		if mouse_check_button_pressed(mb_left) {
			screenstate=1
		}
	} else {
		draw_set_color(creditc)	
	}
	
	draw_text(60,570,"Credits")
	
	
	//if global.mousepx>600 && global.mousepx<800 && global.mousepy>400 && global.mousepy<500 {
		
	//	draw_sprite_ext(titlescreenplay,0,camx,camy,1,1,0,c_red,alpha - random_range(0.00,0.10))
	//	//audio_stop_sound(titlescreenmusic)
	//} else {
	//	draw_sprite_ext(titlescreenplay,0,camx,camy,1,1,0,c_white,alpha)	
	//}
	
	
	
	if global.mousepx>1200 && global.mousepx<1280 && global.mousepy>680 && global.mousepy<720
	&& mouse_check_button_pressed(mb_left) {
		screenstate=1
	}
	
	if global.mousepx>1200 && global.mousepx<1280 && global.mousepy>600 && global.mousepy<680
	&& mouse_check_button_pressed(mb_left) {
		window_set_fullscreen( !window_get_fullscreen()  )
	}
	
} else if screenstate==1 {
	
	draw_set_color(make_color_hsv(229,15,86))
	draw_set_font(font2)
	
	
	//var uTime = shader_get_uniform(shader1,"Time");

	//shader_set(shader1)
	//shader_set_uniform_f(uTime,current_time/10000)
	
	
	
	//draw_text(550,200,"Uti Azulay")
	
	
	//draw_text(420,250,"Design, Code, and Sound")
	
	////draw_text(600,300,"and")
	//draw_text(500,400,"Julia Del Matto")
	//draw_text(610,450,"Art")
	
	draw_sprite_ext(credits,0,camx+640,camy+360,2/3,2/3,0,c_white,1)
	
	//shader_reset()
	
	
	
	var creditc = make_color_hsv(131,17,46)
	if global.mousepx>60 && global.mousepx<240 && global.mousepy>570 && global.mousepy<620 {
		draw_set_color(c_white)
		
		if mouse_check_button_pressed(mb_left) {
			screenstate=0
		}
	} else {
		draw_set_color(creditc)	
	}
	
	draw_text(60,570,"Back")
	
}

draw_set_color(c_white)
draw_circle(global.mousepx,global.mousepy,6,false)

