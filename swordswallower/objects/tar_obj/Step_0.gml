/// @description Insert description here
// You can write your code in this editor
if player_obj.death {
	if audio_is_playing(sound) {
			audio_stop_sound(sound)
		}
}
if place_meeting(x,y,player_obj) && !player_obj.zoom_timer_bool {
	
	if !p_met {
		if player_obj.y<y {
			player_obj.y = (y - sprite_height/2) - (player_sprite_obj.sprite_height-70)
		}
		player_obj.vsp = 0
		
		sound = audio_play_sound(s_tar_bubbling,0,true)
		audio_sound_set_track_position(sound,4)
	}
	p_met = true
	audio_sound_gain(sound,
	
	0.25 + ((80-abs((y - sprite_height/2)-(player_obj.y - player_obj.sprite_height - 70)))/80)/1.5,
	
	0)
	//sdm((80-abs((y - sprite_height/2)-(player_obj.y - player_obj.sprite_height - 40)))/80)
	
	player_sprite_obj.spr_tarheight = (player_obj.y+57)  - (y-sprite_height/2)
	//player_obj.vsp=0.3
	player_obj.hsp/= 1.05 + max(player_sprite_obj.spr_tarheight,0)/80
	
	
	
	//sdm(player_sprite_obj.spr_tarheight)
	player_sprite_obj.spr_tarred_a = 0
	player_sprite_obj.spr_tarred = true
	
	
} else {
	if p_met {
		if audio_is_playing(sound) {
			audio_stop_sound(sound)
		}
	}
	p_met = false
}




//if place_meeting(x,y,player_obj) {
	
//} else {
	
//}

if player_obj.y - player_obj.sprite_height - 40 > y - sprite_height/2
&& place_meeting(x,y,player_obj) {
	damage_script(10,sign(player_obj.x-x),5,-1)
	audio_stop_sound(s_tar_bubbling)
}
depth = -2303