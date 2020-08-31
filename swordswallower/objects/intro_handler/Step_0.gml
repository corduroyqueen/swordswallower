
with blood_obj {
	blood_step_code()
}




if !player_obj.death {
	if room==subtemple01 {
		
		
		if (player_obj.x>23000 && player_obj.y<10000) || player_obj.y>19500 {
			if layer_1_tog {
				instance_deactivate_layer(layer_obj_1)
				layer_1_tog = false
			}
		} else {
			if !layer_1_tog {
				instance_activate_layer(layer_obj_1)
				layer_1_tog = true
			}
		}
		
		
		if (player_obj.x>20000 && player_obj.y<16500) ||
		(player_obj.x<18200 && player_obj.y<19000) ||
		(player_obj.x>=18200 && player_obj.x<=20000 && player_obj.y<17500) {
			if layer_1p5_tog {
				instance_deactivate_layer(layer_obj_1p5)
				layer_1p5_tog = false
			}
		} else {
			if !layer_1p5_tog {
				instance_activate_layer(layer_obj_1p5)
				layer_1p5_tog = true
			}
		}
		
		
		if player_obj.x<23000 || player_obj.y>12000 || (player_obj.y<4300 && player_obj.x>28000) {
			if layer_2_tog {
				instance_deactivate_layer(layer_obj_2)
				layer_2_tog = false
			}
		} else {
			if !layer_2_tog {
				instance_activate_layer(layer_obj_2)
				layer_2_tog = true 
			}
		}
		
		if player_obj.y>5200 {
			if layer_3_tog {
				instance_deactivate_layer(layer_obj_3)
				layer_3_tog = false
			}
		} else {
			if !layer_3_tog {
				instance_activate_layer(layer_obj_3)
				layer_3_tog = true
			}
		}
		//sdm("wah")
		//sdm(layer_1_tog)
		//sdm(layer_1p5_tog)
		//sdm(layer_2_tog)
		//sdm(layer_3_tog)
		if player_obj.x>23000 && player_obj.y<10000 {
			if layer_get_visible(level1artm) {
				layer_set_visible(level1artm,false)
				layer_set_visible(level1art1,false)
				layer_set_visible(level1art2,false)
				layer_set_visible(level1art3,false)
				layer_set_visible(level1art4,false)
				layer_set_visible(level1art5,false)
			
				layer_set_visible(level1bgm,false)
				layer_set_visible(level1bg1,false)
				layer_set_visible(level1bg2,false)
				layer_set_visible(level1bg3,false)
			}
		} else {
			if !layer_get_visible(level1artm) {
				layer_set_visible(level1artm,true)
				layer_set_visible(level1art1,true)
				layer_set_visible(level1art2,true)
				layer_set_visible(level1art3,true)
				layer_set_visible(level1art4,true)
				layer_set_visible(level1art5,true)
			
				layer_set_visible(level1bgm,true)
				layer_set_visible(level1bg1,true)
				layer_set_visible(level1bg2,true)
				layer_set_visible(level1bg3,true)
			}
		}
		
		if player_obj.y>5200 {
			
			if layer_get_visible(level3artm) {
				
			
				layer_set_visible(level3artm,false)
				layer_set_visible(level3art1,false)
				layer_set_visible(level3art2,false)
				layer_set_visible(level3art3,false)
				layer_set_visible(level3art4,false)
			
				layer_set_visible(level3bgm,false)
				layer_set_visible(level3bg1,false)
				layer_set_visible(level3bg2,false)
				layer_set_visible(level3bg3,false)
			}
		} else {
			if !layer_get_visible(level3artm) {
				layer_set_visible(level3artm,true)
				layer_set_visible(level3art1,true)
				layer_set_visible(level3art2,true)
				layer_set_visible(level3art3,true)
				layer_set_visible(level3art4,true)
			
				layer_set_visible(level3bgm,true)
				layer_set_visible(level3bg1,true)
				layer_set_visible(level3bg2,true)
				layer_set_visible(level3bg3,true)
			}
		}
		
		if player_obj.x<23000 || (player_obj.y<4300 && player_obj.x>28000) {
			if layer_get_visible(level2artm) {
				layer_set_visible(level2artm,false)
				
				layer_set_visible(level2art1,false)
				layer_set_visible(level2art2,false)
				layer_set_visible(level2art3,false)
				layer_set_visible(level2art4,false)
				layer_set_visible(level2art5,false)
			
				layer_set_visible(level2bgm,false)
				layer_set_visible(level2bg1,false)
				layer_set_visible(level2bg2,false)
				layer_set_visible(level2bg3,false)
				layer_set_visible(level2bg4,false)
			}
		} else {
			if !layer_get_visible(level2artm) {
				layer_set_visible(level2artm,true)
				
				layer_set_visible(level2art1,true)
				layer_set_visible(level2art2,true)
				layer_set_visible(level2art3,true)
				layer_set_visible(level2art4,true)
				layer_set_visible(level2art5,true)
			
				layer_set_visible(level2bgm,true)
				layer_set_visible(level2bg1,true)
				layer_set_visible(level2bg2,true)
				layer_set_visible(level2bg3,true)
				layer_set_visible(level2bg4,true)
			}
		}
	}
}