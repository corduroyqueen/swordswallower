/// @description Insert description here
// You can write your code in this editor

if master!=noone && !enter {
	if !master.closed {
		enter = true
		with master {
			player_present = true
			event_user(3)	
		}
	} else {
		enter = true
		with master {
			player_present = true
		}
	}
} else if boss!=noone {
	enter = true
}