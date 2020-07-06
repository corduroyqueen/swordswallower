/// @description Insert description here
// You can write your code in this editor
if start {
	
	pn = 0
	xt = 0 - sprite_width/2
	yt = 0 - sprite_height/2
	for(i = 0;i<hand_points_w_num;i++) {
		ds_list_add(points_x,xt+i*sep)
		ds_list_add(points_y,yt)
		ds_list_add(points_ang,90)
		pn++
	}
	yt = 0+sprite_height/2
	for(i = 0;i<hand_points_w_num;i++) {
		ds_list_add(points_x,xt+i*sep)
		ds_list_add(points_y,yt)
		ds_list_add(points_ang,270)
		pn++
	}

	xt = 0 - sprite_width/2
	yt = 0 - sprite_height/2
	for(i = 0;i<hand_points_h_num;i++) {

		ds_list_add(points_x,xt)
		ds_list_add(points_y,yt+i*sep)
		ds_list_add(points_ang,0)
		pn++
	}

	xt = 0 + sprite_width/2
	for(i = 0;i<hand_points_h_num;i++) {

		ds_list_add(points_x,xt)
		ds_list_add(points_y,yt+i*sep)
		ds_list_add(points_ang,180)
		pn++
	}

	nx = ds_list_create()
	ny = ds_list_create()
	na = ds_list_create()

	for(i=0;i<pn_total;i++) {
		xn = points_x[| i] * cos(degtorad(-image_angle)) - points_y[| i] * sin(degtorad(-image_angle)) + x
		yn = points_x[| i] * sin(degtorad(-image_angle)) + points_y[| i] * cos(degtorad(-image_angle)) + y
		if !position_meeting(xn,yn,wall_obj) && !position_meeting(xn,yn,black_wall_obj) {
			ds_list_add(nx,xn)	
			ds_list_add(ny,yn)	
			ds_list_add(na,points_ang[| i])
		}
	}

	points_x = nx
	points_y = ny
	points_ang = na
	pn_total = ds_list_size(points_x)


	points_ang_p = array_create(pn_total)
	points_length = array_create(pn_total)
	points_hand_anim = array_create(pn_total)

	for(i=0;i<pn_total;i++) {
		points_ang[| i] = points_ang[| i]-image_angle
		points_ang_p[i] = points_ang[| i]
		points_length[i] = random_range(40,100)
		points_hand_anim[i] = floor(random_range(0,6))
	}
	start = false
}