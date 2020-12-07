
draw_set_color(c_white)
draw_set_alpha(1)
var s = random_range(1.45,1.5)

var xc = player_obj.camx
var yc = player_obj.camy
var bc = global.blood_color
bc = make_color_rgb(255*2,255*0.6,255*0.8)
//bc = c_white
with candle_obj {
	if !destroy {
		//draw_sprite_ext(blood_sprite_spr1,0,x-xc,y-yc,s,s,0,bc,0.7)
		//draw_sprite_ext(blood_sprite_spr1,0,x-xc,y-yc,s*0.1,s*0.1,0,bc,0.7)
		var l = make_color_rgb(255*0.9,255*0.0,255*0.3)
		//l = make_color_rgb(255*1.0,255*0.0,255*0.3)
		draw_sprite_ext(blood_sprite_spr11,0,x-xc,y-yc,s*10,s*10,0,l,light_strength_walls)
		
		draw_set_color(l)
		draw_set_alpha(light_strength_walls*0.05)
		draw_circle(x-xc,y-yc,50*s*10*light_radius,false)
		draw_set_color(c_white)
		draw_set_alpha(1)
	}
	//draw_sprite_ext(scary_skull,0,x,y,20,20,0,c_white,1)
		
}

//bc = global.blood_color
with checkpoint1 {
	if checkpoint_manager.checkpoint == self && !starting_bool {
		//draw_sprite_ext(blood_sprite_spr1,0,x+s_x-xc,y+s_y-yc,s,s,0,bc,0.7)
		//draw_sprite_ext(blood_sprite_spr1,0,x+s_x-xc,y+s_y-yc,s*0.1,s*0.1,0,bc,0.7)
		
		draw_sprite_ext(blood_sprite_spr11,0,x+s_x-xc,y+s_y-yc,s*10,s*10,0,bc,light_strength_walls)
		
		draw_set_color(bc)
		draw_set_alpha(light_strength_walls*0.05)
		draw_circle(x+s_x-xc,y+s_y-yc,50*s*10*light_radius,false)
		draw_set_color(c_white)
		draw_set_alpha(1)
	}
	//draw_sprite_ext(scary_skull,0,x,y,20,20,0,c_white,1)
		
}
//gpu_set_blendmode(bm_normal)
	