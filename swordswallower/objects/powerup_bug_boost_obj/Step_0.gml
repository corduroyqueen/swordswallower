//fuck yes
//fuck yes
if hp<=0 {
	shockwave_shader.white_flash_screen = true
	level1_master.ability_dash = true	
	
	//just_blood(tail_obj.hsp,tail_obj.vsp-100,0.3,10,false,sprite_width/4,sprite_height)
	
	//level1_master.in_void = false
	
	tail_obj.x=x
	tail_obj.y=y
	var tut = instance_create_depth(16234,20867,-300,tutorial_text_obj)
	tut.layer = layer_get_id("Instances_4");
	with tut {
		text = text_rightclick
		text_a[0] = txt_clicktodash
		text_a[1] = txt_leftshouldertodash

		text_a[0] = "When sword is planted \n  Right Click to dash"
		text_a[1] = "When sword is planted \nLeft Trigger to dash"

		tx = 16100
		ty = 20661
		
		image_xscale = 23
		image_yscale = 9.75
	}
	
	blood_color = global.dash_color
	
	
	just_blood_speed_input(-2,-8,0.2,25,true,x,y)
	just_blood_speed_input(-8,-8,0,25,true,x,y)
	just_blood_speed_input(-8,-2,0.2,25,true,x,y)
	
	just_blood_speed_input(8,-4,0,25,true,x,y)
	just_blood_speed_input(-2.25,-2.25,0.2,25,true,x,y)
	just_blood_speed_input(-4,8,0.2,25,true,x,y)
		
	level1_master.void_target = player_obj
	
	instance_destroy(id)
}