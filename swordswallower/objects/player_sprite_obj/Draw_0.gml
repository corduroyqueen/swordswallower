/// @description Insert description here
// You can write your code in this editor
gpu_set_colorwriteenable(true,true,true,true);
if player_obj.death {
	return	
}


if !surface_exists(player_surface) {
	player_surface = surface_create(300,300)	
}

surface_set_target(player_surface)
draw_clear_alpha(c_white,0)
if player_obj.shielded {
	draw_sprite(shield_spr,0,x,y)	
}


//gpu_set_colorwriteenable(true,true,true,true);
draw_set_color(c_white)
draw_set_alpha(1)
draw_self()

if !player_obj.zoom_timer_bool {
	gpu_set_blendenable(false)
	gpu_set_colorwriteenable(false,false,false,true);
	draw_set_alpha(0);
	draw_rectangle(0,0, 300, 300, false);


	draw_set_alpha(1);
	draw_self()
	
	
	
	gpu_set_blendenable(true);
	gpu_set_colorwriteenable(true,true,true,true);


	gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_src_alpha);
	gpu_set_alphatestenable(true);


	if spr_tarred {
		
		spr_tarred_a+=0.002
		draw_set_alpha(spr_tarred_a)
		draw_set_color(c_gray)
		draw_rectangle(0,182-spr_tarheight,300,300,false)
		
		if spr_tarred_a>=0 {
			spr_tarred = false
		}
		draw_set_alpha(1)
		draw_set_color(c_white)
	}
	gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_src_alpha);
	
	if spr_bloodied {
		
		spr_bloodied_a-=0.002
		//0.003925
		if spr_bloodied_a<=0 {
			spr_bloodied_a=0
			spr_bloodied = false
		}
		//horizontal : 134 to 166
		//vertical   : 118 to 182
		
		draw_sprite_ext(blood,0, 140,140,1.0,1.0,1,c_white,spr_bloodied_a);
		draw_sprite_ext(blood,0, 150,150,0.5,0.5,1,c_white,spr_bloodied_a);
		draw_sprite_ext(blood,0, 153,160,0.5,0.6,0,c_white,spr_bloodied_a);
		draw_sprite_ext(blood,0, 150,160,0.7,0.7,0,c_white,spr_bloodied_a);
		draw_sprite_ext(blood,0, 170,115,1.3,1.3,0,c_white,spr_bloodied_a);
		draw_sprite_ext(blood,0, 163,140,1.3,1.3,0,c_white,spr_bloodied_a);
	}
	
	gpu_set_alphatestenable(false);
	gpu_set_blendmode(bm_normal);
	arm_pin_x = x
	arm_pin_y = y-27
	player_arm_draw()

}
//gpu_set_colorwriteenable(true,true,true,false);
surface_reset_target()
//gpu_set_colorwriteenable(true,true,true,true);


draw_surface(player_surface,player_obj.x-150,player_obj.y-150)

x=player_obj.x
y=player_obj.y
if player_obj.tail_carry && player_obj.out_of_dash_t>=00 && !player_obj.held_position {
	player_sword_calc()
}
x=150
y=150


//gpu_set_colorwriteenable(true,true,true,false)

//gpu_set_blendmode_ext(bm_one,bm_dest_alpha)


