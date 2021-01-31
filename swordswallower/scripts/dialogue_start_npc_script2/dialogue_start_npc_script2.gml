xinput = argument0
yinput = argument1
if point_distance(x,y,player_obj.x,player_obj.y)<500 && !ui_manager.speaking {
	ealpha = lerp(ealpha,1,0.05)
} else {
	ealpha = lerp(ealpha,0,0.1)	
}

//draw_set_alpha(ealpha)
//draw_set_font(ui_manager.font3lato)
//var yt = y - sprite_height/2 - 90


//draw_set_color(c_white)
//draw_rectangle(x-22.75,yt-30,x+22.75,yt-30+55,true)
//draw_set_color(c_dkgray)
//draw_rectangle(x-19.75,yt-27,x+19.75,yt-30+52,true)

//draw_set_color(c_white)
//draw_text(x-string_width("E")/2,yt - 30,"E")

//draw_set_alpha(1)

if input_controller.controller=input_controller.controller_keyboard {
	draw_sprite_ext(ui_icon_e,0,xinput,yinput,0.75,0.75,0,c_white,ealpha)
} else {
	draw_sprite_ext(ui_icon_square,0,xinput,yinput,0.75,0.75,0,c_white,ealpha)
}