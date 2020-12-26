/// @description Insert description here
// You can write your code in this editor
//mask_index = -1
gpu_set_colorwriteenable(1,1,1,0)


if closed {
	draw_self()
	image_index = 0
	if in_camera_range_bigger(x,y) {
		with chain1 {
			event_user(3)
		}
		with chain2 {
			event_user(3)
		}
	}
	//ask_index = sprite_index
	//if round(image_angle) == 0 {
	//	draw_sprite_ext(spr_lock,0,x,y,1.275,1.275,0,c_white,1)
	//} else {
	//	draw_sprite_ext(spr_lock,0,x-32,y-12,1.275,1.275,0,c_white,1)	
	//}
	var inty = 9
	inty -= round(abs(image_angle)/45)
	lockx = mean(chain1.rings_x[|inty],chain2.rings_x[|inty] )
	locky = mean(chain1.rings_y[|inty],chain2.rings_y[|inty] )
	
	
	
	
	draw_sprite_ext(spr_lock,0,lockx,locky,1,1,0,c_white,1)
	
	if !surface_exists(lock_surf) {
		lock_surf = surface_create(40,46)
	}
	//shine_script(spr_lock,lockx,locky,lock_surf)
	
	//draw_set_color(c_black)
	//draw_text(x,y,string(lock))
} else {
	image_speed = 2
	mask_index = nothing
	
	if sprite_index!=-4 {
		draw_self()	
	}
}

gpu_set_colorwriteenable(1,1,1,1)

//var posx, posy

//var angle = image_angle
//var eee = 105
//var distd = 130
//angle += eee
//posx = x+dcos(angle)*distd
//posy = y-dsin(angle)*distd
//draw_circle(posx,posy,5,false)

//posx = x-dcos(angle)*distd
//posy = y-dsin(angle)*distd
//draw_circle(posx,posy,5,false)

//posx = x+dcos(angle)*distd
//posy = y+dsin(angle)*distd
//draw_circle(posx,posy,5,false)

//posx = x-dcos(angle)*distd
//posy = y+dsin(angle)*distd
//draw_circle(posx,posy,5,false)