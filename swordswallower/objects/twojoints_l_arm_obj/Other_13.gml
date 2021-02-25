//fuck yes
/// @description Insert description here
// You can write your code in this editor
//draw_set_color(c_white)
if destroy_arm {
	
	return
}

gpu_set_colorwriteenable(true,true,true,false)

arm_w = 50
draw_set_color(color)
draw_set_alpha(image_alpha)

//draw_line_width(x,y,seg_x[0],seg_y[0],arm_w)
//draw_line_width(seg_x[0],seg_y[0],seg_x[1],seg_y[1],arm_w)
//draw_line_width(seg_x[1],seg_y[1],seg_x[2],seg_y[2],arm_w)

draw_sprite_ext(boss_arm1,0,x,y,1,1,point_direction(x,y,seg_x[0],seg_y[0]),c_white,1)
draw_sprite_ext(boss_arm2,0,seg_x[0],seg_y[0],1,1,point_direction(seg_x[0],seg_y[0],seg_x[1],seg_y[1]),c_white,1)
draw_sprite_ext(boss_arm3,0,seg_x[1],seg_y[1],1,1,point_direction(seg_x[1],seg_y[1],seg_x[2],seg_y[2]),c_white,1)
//draw_sprite_ext(two_jointed_arm_t1,0,seg_x[2],seg_y[2],1,1,0,c_green,image_alpha)
//sdm("ine")
//sdm(point_distance(x,y,seg_x[0],seg_y[0]))
//sdm("2")
//sdm(point_distance(seg_x[0],seg_y[0],seg_x[1],seg_y[1]))
//sdm("3")
//sdm(point_distance(seg_x[1],seg_y[1],seg_x[2],seg_y[2]))
draw_set_color(c_white)
draw_set_alpha(1)

with hand {
	draw_self()
}

//draw_text(x-200,y,timer)
//draw_text(x-200,y+100,state)

gpu_set_colorwriteenable(true,true,true,true)



/*arm_draw()
/*
draw_circle(seg_x[0],seg_y[0],30,false)
draw_circle(seg_x[1],seg_y[1],20,false)
draw_circle(seg_x[2],seg_y[2],10,false)