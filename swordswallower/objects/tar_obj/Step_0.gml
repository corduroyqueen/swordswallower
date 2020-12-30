/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,player_obj) && !player_obj.zoom_timer_bool {
	
	
	player_sprite_obj.spr_tarheight = (player_obj.y+32)  - (y-sprite_height/2)
	//player_obj.vsp=0.3
	player_obj.hsp/= 1.05 + max(player_sprite_obj.spr_tarheight,0)/25
	
	
	
	//sdm(player_sprite_obj.spr_tarheight)
	player_sprite_obj.spr_tarred_a = 0
	player_sprite_obj.spr_tarred = true
	
	
} else {
	//timer = 0	
}




if place_meeting(x,y,player_obj) {
	if !p_met {
		player_obj.y = (y - sprite_height/2) - (player_sprite_obj.sprite_height-40)
		player_obj.vsp = 0
	}
	p_met = true
} else {
	p_met = false
}

if player_obj.y - player_obj.sprite_height - 40 > y - sprite_height/2
&& place_meeting(x,y,player_obj) {
	damage_script(10,sign(player_obj.x-x),5,-1)
}
depth = -2303