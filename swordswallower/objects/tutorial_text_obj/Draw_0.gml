//fuck yes
if input_controller.controller=input_controller.controller_keyboard {
	text = text_a[0]
} else {
	text = text_a[1]
}

if enabled {
	a = lerp(a,1,0.1)
	draw_sprite_ext(text,0,tx,ty,1,1,0,c_white,a)
}