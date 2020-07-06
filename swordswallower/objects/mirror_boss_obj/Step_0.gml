/// @description Insert description here
// You can write your code in this editor
if alive>0 {
	

	if broken {
		if abs( player_obj.x - pieces_px[| piece_enemy])<30 {
			hit_enable = true	
		} else {
			hit_enable = false	
		}

		if point_distance(
		tail_obj.x,tail_obj.y,
		pieces_x[piece_enemy]+player_obj.x-pieces_px[| piece_enemy],
		pieces_y[piece_enemy]+70)<70 
		&& !met {
	
	
			xpos = x
			ypos = y
			x=pieces_x[piece_enemy]+player_obj.x-pieces_px[| piece_enemy]
			y=pieces_y[piece_enemy]+70
			sprite_index = mirror_eye_t
			just_blood(0,0,0.2,10,false,30,30)
			sprite_index = mirror_spr_frame_t
			x = xpos
			y = ypos
	
			pieces_dead[piece_enemy] = true
			piece_enemy = floor(random_range(0,39))
			alive--
			if alive> 0 {
				while pieces_dead[piece_enemy] ||
				abs( player_obj.x - pieces_px[| piece_enemy])<30 { 
					piece_enemy = floor(random_range(0,39)) 
				}
			}
			
			shuffle_pieces = true
			met = true
		}

		if player_obj.tail_carry// || player_obj.tail_planted 
		{
			met = false	
		}
	
	} else {
		if point_distance(
		tail_obj.x,tail_obj.y,
		x+473,y+204)<70 {
			xpos = x
			ypos = y
			x = x +473
			y = y +204
			sprite_index = mirror_eye_t
			just_blood(0,0,0.2,10,false,30,30)
			sprite_index = mirror_spr_frame_t
			x = xpos
			y = ypos
			
			player_obj.shake_d=10
			player_obj.camera_shake_d = true
			met = true
			broken = true	
		}
	}
}
