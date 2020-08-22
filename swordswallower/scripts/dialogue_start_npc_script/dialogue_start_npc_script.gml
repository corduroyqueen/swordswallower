if point_distance(x,y,player_obj.x,player_obj.y)<500 && !ui_manager.speaking {
	ealpha = lerp(ealpha,1,0.05)
} else {
	ealpha = lerp(ealpha,0,0.1)	
}

draw_set_alpha(ealpha)
var yt = y - sprite_height/2 - 60


draw_set_color(c_white)
draw_rectangle(x-10.5,yt-30,x+35,yt-30+55,true)
draw_set_color(c_dkgray)
draw_rectangle(x-7.5,yt-27,x+32,yt-30+52,true)

draw_set_color(c_white)
draw_text(x,yt - 30,"E")

draw_set_alpha(1)