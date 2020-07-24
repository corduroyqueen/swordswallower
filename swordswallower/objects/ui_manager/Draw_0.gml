/// @description Insert description here
// You can write your code in this editor

camx = camera_get_view_x(view_camera[0])
camy = camera_get_view_y(view_camera[0])



if !player_obj.intro {
//draw_sprite_ext(healthbar,0,camx+10,camy+10,210,1,0,c_gray,1)
//draw_sprite_ext(healthbar,0,camx+15,camy+15,player_obj.hp*2,0.85,0,c_green,1)
}
//cool_list = ds_list_create()
//draw_surface(art_surface_setter.art_surface,player_obj.camx,player_obj.camy)
if player_obj.death {
	//draw_text(camera_get_view_x(view_camera[0])+560,camera_get_view_y(view_camera[0])+315,"Press T to respawn.")
	//draw_text(camera_get_view_x(view_camera[0])+550,camera_get_view_y(view_camera[0])+330,"Press T to start over.")
}

if speaking {
	if current_dialogue == "end" {
		speaking = false	
		printing = false
		current_dialogue = ""
		global.display_txt = ""
		global.tboxActive = false;
	    txt = global.txtCache;
	    global.txtCache = "";
		
		txt = global.placeholderTxt;
	    global.placeholderTxt = "";
	    global.temp_placeholderTxt = "";
	    global.txtIndex = 1;
	    global.maxPrintTimer = txtSpeed;
		printing = false
	} else {
		scr_textbox(current_dialogue, font1, ord("J"), 0.1)	
	}
}

	//draw_sprite(scary_skull,0,player_obj.camx+40,player_obj.camy+40)
