/// @description Insert description here
// You can write your code in this editor
if (player_obj.x>23000 && player_obj.y<10000) || player_obj.y>19500 {
			
				instance_deactivate_layer(layer_obj_1)
				layer_1_tog = false
			
		} else {
			
				instance_activate_layer(layer_obj_1)
				layer_1_tog = true
			
		}
		
		
		if (player_obj.x>20000 && player_obj.y<16500) ||
		(player_obj.x<18200 && player_obj.y<19000) ||
		(player_obj.x>=18200 && player_obj.x<=20000 && player_obj.y<17500) {
			
				instance_deactivate_layer(layer_obj_1p5)
				layer_1p5_tog = false
			
		} else {
			
				instance_activate_layer(layer_obj_1p5)
				layer_1p5_tog = true
			
		}
		
		
		if player_obj.x<23000 || player_obj.y>12000 || (player_obj.y<4300 && player_obj.x>28000) {
			
				instance_deactivate_layer(layer_obj_2)
				layer_2_tog = false
			
		} else {
			
				instance_activate_layer(layer_obj_2)
				layer_2_tog = true 
			
		}
		
		if player_obj.y>5200 {
			
				instance_deactivate_layer(layer_obj_3)
				layer_3_tog = false
			
		} else {
			
				instance_activate_layer(layer_obj_3)
				layer_3_tog = true
			
		}