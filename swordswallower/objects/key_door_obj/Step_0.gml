/// @description Insert description here
// You can write your code in this editor
if closed {
	if place_meeting(x,y,tail_obj) {
		if ds_list_size(player_obj.keys)>=lock {
			var yikes = ds_list_size(player_obj.keys)
			for(i=0;i<lock;i++) {
				instance_destroy(player_obj.keys[| i])
			}
			var k = 0
			templist = ds_list_create()
			while k<yikes-lock {
				ds_list_add(templist,player_obj.keys[|k+lock])
				k++
			}
			player_obj.keys = templist
			
			closed = false
		}
	}
} else {
	mask_index = noone
	sprite_index = noone
}