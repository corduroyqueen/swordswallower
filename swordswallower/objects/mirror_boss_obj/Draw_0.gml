/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(mirror_spr_frame_t,1,x,y,1,1,0,c_white,1)
if broken {
	if shuffle_pieces {
		ds_list_shuffle(pieces_px)
		shuffle_pieces = false
	}
	
	
	for(i=0;i<num_pieces;i++) {
		if pieces_dead[i] {
			
		} else {
			if(i<20) {
				if !surface_exists(pieces_surfaces[i]) {
					pieces_surfaces[i] = surface_create(4,4)	
				}

				surface_set_target(pieces_surfaces[i])
			} else {
				if !surface_exists(pieces_surfaces2[i-20]) {
					pieces_surfaces2[i] = surface_create(4,4)	
				}

				surface_set_target(pieces_surfaces2[i-20])
			}
			draw_clear_alpha(c_white,0)


			draw_set_color(c_white)
			draw_set_alpha(1)
			if i==piece_enemy  {
				draw_sprite_ext(mirror_spr_broken_sep_t,i,x-pieces_x[i],y-pieces_y[i],1,1,0,c_white,1)
			} else {
				draw_sprite_ext(mirror_spr_broken_sep_t,i,x-pieces_x[i],y-pieces_y[i],1,1,0,c_white,1)
			}
			
			gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
			gpu_set_alphatestenable(true);
			
			
			if i==piece_enemy  {
				draw_sprite_ext(
					mirror_eye_t,
					0,
					player_obj.x-pieces_px[| i],
					70,
					1,1,
					0,c_white,1)
				draw_set_color(c_red)
				xp = pieces_x[piece_enemy]+player_obj.x-pieces_px[| piece_enemy]
				yp = pieces_y[piece_enemy]+70
				ang = point_direction(xp,yp,player_obj.x,player_obj.y)
				draw_circle(
					player_obj.x-pieces_px[| i] + cos(degtorad(ang))*25 + random_range(-3,3),
					70 - sin(degtorad(ang))*25,
					20,false)
				draw_set_color(c_black)
				draw_circle(
					player_obj.x-pieces_px[| i] + cos(degtorad(ang))*27 + random_range(-3,3),
					70 - sin(degtorad(ang))*27,
					7,false)
					
				draw_set_color(c_white)
			} else {
				draw_sprite_ext(
					player_sprite_obj.sprite_index,
					player_sprite_obj.image_index,
					player_obj.x-pieces_px[| i],
					70,
					player_sprite_obj.image_xscale,player_sprite_obj.image_yscale,
					0,c_white,1)
			}
	
			gpu_set_alphatestenable(false);
			gpu_set_blendmode(bm_normal);
			
			
			surface_reset_target()
			if(i<20) {
				draw_surface(pieces_surfaces[i],pieces_x[i],pieces_y[i])
			} else {
				draw_surface(pieces_surfaces2[i-20],pieces_x[i],pieces_y[i])
			}

			
		}
	}
} else {
	draw_sprite_ext(mirror_spr_t,0,x,y,1,1,0,c_white,1)
	draw_sprite_ext(mirror_woman_t,0,x+473,y+204,1,1,0,c_white,1)
}

draw_sprite_ext(mirror_spr_frame_t,0,x,y,1,1,0,c_white,1)


//draw_sprite_ext(mirror_spr_frame_t,0,x,y,1,1,0,c_white,1)