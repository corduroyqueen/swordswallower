//fuck yes
//fuck yes
with rightarm {
	event_user(3)
}
gpu_set_colorwriteenable(true,true,true,false)
draw_self()
with head {
	//draw_self()
}
if state==state_attacking && (attack==attack_wall_hands || attack==attack_wall_hands_switch) {
	if ht>129 {
		if hands_ceiling_a {
			h1_lerp = lerp(h1_lerp,0,0.2)
		}
		if attack!=attack_wall_hands_switch || end_hand_switch {
			h2_lerp = lerp(h2_lerp,50,0.2)
		}
		if hands_wall_a {
			h3_lerp = lerp(h3_lerp,-30,0.2)
		}
	} else if ht>100 {
		if hands_ceiling_a {
			h1_lerp = lerp(h1_lerp,70,0.2)
		}
		h2_lerp = lerp(h2_lerp,-50,0.2)
		h3_lerp = lerp(h3_lerp,55,0.2)
	} else {
		if hands_ceiling_a {
			h1_lerp = lerp(h1_lerp,40,0.2)
		}
		if attack==attack_wall_hands || hand_switch_init {
			h2_lerp = lerp(h2_lerp,-20,0.2)
		}
		if hands_wall_a {
			h3_lerp = lerp(h3_lerp,25,0.2)
		}
	}
	//h1
	if hands_ceiling_a {
		draw_sprite_ext(sprite1062,0,h1_x,h1_y+h1_lerp,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1066,0,h1_x+45,h1_y+h1_lerp,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1067,0,h1_x+90,h1_y+h1_lerp,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1066,0,h1_x+90+45,h1_y+h1_lerp,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1066,0,h1_x+180,h1_y+h1_lerp-20,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1062,0,h1_x+180+45,h1_y+h1_lerp-20,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1066,0,h1_x+270,h1_y+h1_lerp-20,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1067,0,h1_x+270+45,h1_y+h1_lerp-20,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1062,0,h1_x+360,h1_y+h1_lerp,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1066,0,h1_x+360+45,h1_y+h1_lerp,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1067,0,h1_x+450,h1_y+h1_lerp,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1062,0,h1_x+450+45,h1_y+h1_lerp,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1062,0,h1_x+540,h1_y+h1_lerp-20,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1066,0,h1_x+540+45,h1_y+h1_lerp-20,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1067,0,h1_x+630,h1_y+h1_lerp,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1062,0,h1_x+630+45,h1_y+h1_lerp,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1066,0,h1_x+720,h1_y+h1_lerp,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1067,0,h1_x+720+45,h1_y+h1_lerp,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1062,0,h1_x+810,h1_y+h1_lerp-20,0.5,0.5,180,c_white,1)
		draw_sprite_ext(sprite1066,0,h1_x+810+45,h1_y+h1_lerp-20,0.5,0.5,180,c_white,1)
	}
	//h2
	
	var f = 50
	draw_sprite_ext(sprite1062,0,h2_x,h2_y+f+0+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1066,0,h2_x+45,h2_y+f+0+2.5+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1067,0,h2_x+90,h2_y+f+5+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1062,0,h2_x+90+45,h2_y+f+5+2.5+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1066,0,h2_x+180,h2_y+f+10+h2_lerp+40,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1067,0,h2_x+180+45,h2_y+f+10+2.5+h2_lerp+40,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1067,0,h2_x+270,h2_y+f+15+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1066,0,h2_x+270+45,h2_y+f+15+2.5+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1062,0,h2_x+360,h2_y+f+20+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1062,0,h2_x+360+45,h2_y+f+20+2.5+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1066,0,h2_x+450,h2_y+f+25+h2_lerp+40,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1066,0,h2_x+450+45,h2_y+f+25+2.5+h2_lerp+40,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1062,0,h2_x+540,h2_y+f+30+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1066,0,h2_x+540+45,h2_y+f+30+2.5+h2_lerp+40,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1066,0,h2_x+630,h2_y+f+35+h2_lerp+40,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1062,0,h2_x+630+45,h2_y+f+35+2.5+h2_lerp+40,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1062,0,h2_x+720,h2_y+f+40+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1067,0,h2_x+720+45,h2_y+f+40+2.5+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1067,0,h2_x+810,h2_y+f+45+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1066,0,h2_x+810+45,h2_y+f+45+2.5+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1062,0,h2_x+900,h2_y+f+50+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1066,0,h2_x+900+45,h2_y+f+50+2.5+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1062,0,h2_x+990,h2_y+f+55+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1067,0,h2_x+990+45,h2_y+f+55+2.5+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1067,0,h2_x+1080,h2_y+f+60+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1067,0,h2_x+1080+45,h2_y+f+60+2.5+h2_lerp,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1066,0,h2_x+1170,h2_y+f+65+h2_lerp+40,0.5,0.5,0,c_white,1)
	draw_sprite_ext(sprite1062,0,h2_x+1170+45,h2_y+f+65+2.5+h2_lerp+40,0.5,0.5,0,c_white,1)
	//h3
	
	if hands_wall_a {
		draw_sprite_ext(sprite1066,0,h3_x+h3_lerp,h3_y+45,0.5,0.5,-90,c_white,1)
		draw_sprite_ext(sprite1062,0,h3_x+h3_lerp,h3_y+90,0.5,0.5,-90,c_white,1)
		draw_sprite_ext(sprite1067,0,h3_x+h3_lerp,h3_y+f+135,0.5,0.5,-90,c_white,1)
		draw_sprite_ext(sprite1066,0,h3_x+h3_lerp,h3_y+f+180,0.5,0.5,-90,c_white,1)
		draw_sprite_ext(sprite1062,0,h3_x+h3_lerp,h3_y+f+225,0.5,0.5,-90,c_white,1)
		draw_sprite_ext(sprite1066,0,h3_x+h3_lerp,h3_y+f+270,0.5,0.5,-90,c_white,1)
		draw_sprite_ext(sprite1066,0,h3_x+h3_lerp,h3_y+f+315,0.5,0.5,-90,c_white,1)
		draw_sprite_ext(sprite1062,0,h3_x+h3_lerp,h3_y+f+360,0.5,0.5,-90,c_white,1)
		draw_sprite_ext(sprite1067,0,h3_x+h3_lerp,h3_y+f+405,0.5,0.5,-90,c_white,1)
		draw_sprite_ext(sprite1066,0,h3_x+h3_lerp,h3_y+f+450,0.5,0.5,-90,c_white,1)
		draw_sprite_ext(sprite1066,0,h3_x+h3_lerp,h3_y+f+495,0.5,0.5,-90,c_white,1)
		draw_sprite_ext(sprite1067,0,h3_x+h3_lerp,h3_y+f+540,0.5,0.5,-90,c_white,1)
		draw_sprite_ext(sprite1067,0,h3_x+h3_lerp,h3_y+f+585,0.5,0.5,-90,c_white,1)
		draw_sprite_ext(sprite1062,0,h3_x+h3_lerp,h3_y+f+630,0.5,0.5,-90,c_white,1)
	}
}
gpu_set_colorwriteenable(true,true,true,true)
with leftarm {
	event_user(3)
}