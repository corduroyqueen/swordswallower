/// @description Insert description here
// You can write your code in this editor
if master!=noone {
	if master.enabled {
		ended = true	
	}
} else if boss!=noone {
	if !instance_exists(boss) {
		ended = true	
	} else {
		ended = false
	}
}