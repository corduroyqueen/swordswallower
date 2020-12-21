//fuck yes
if input_controller.controller=input_controller.controller_keyboard {
	text = text_a[0]
} else {
	text = text_a[1]
}

if enabled && !player_obj.intro {
	a = lerp(a,1,0.1)
	draw_set_alpha(a)
	draw_set_font(ui_manager.font2bigger)
	draw_text(tx,ty,text)
//	draw_sprite_ext(text,0,tx,ty,1,1,0,c_white,a)
	draw_set_alpha(1)
}