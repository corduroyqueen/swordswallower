local_obj = argument0



if object_get_parent(local_obj.object_index)==wall_rejecting_parent_obj {
	sword_reject_script()
	return
} else if object_get_parent(local_obj.object_index)==wall_destructible_parent_obj {
	with local_obj {
		event_user(0)	
	}
} else if object_get_parent(local_obj.object_index)==key_wall_parent_obj {
	
	if ds_list_size(player_obj.keylist)>=local_obj.lock && !lockcheck && local_obj.closed {
		var yikes = ds_list_size(player_obj.keylist)
		 
		
		
		for(i=0;i<local_obj.lock;i++) {
			player_obj.keylist[| i].unlocking = true
			player_obj.keylist[| i].target = local_obj
		}
		var k = 0
		templist = ds_list_create()
		while k<yikes-local_obj.lock {
			ds_list_add(templist,player_obj.keylist[|k+local_obj.lock])
			k++
		}
		player_obj.keylist = templist
			
		//local_obj.closed = false
		hitpause = true
		lockcheck=true
		audio_play_sound(door_unlock_2,0,false)
		sword_reject_script()
		return
		//ok = sword_reject_1
		//audio_sound_gain(ok,0.15,0)
		//audio_play_sound(ok,0,false)
	} else {
		ok = sword_reject_1
		audio_sound_gain(ok,0.15,0)
		audio_play_sound(ok,0,false)
	}
}

sword_plant(local_obj)