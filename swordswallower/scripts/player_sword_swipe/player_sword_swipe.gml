
var angle = get_player_mouse_angle()
var hitbox = instance_create_depth(player_obj.x,player_obj.y,0,swordslash_hitbox_obj)

hitbox.image_angle = angle

if grounded {
	hsp *= 0.3
	hsp += lengthdir_x(12,angle - 180)
} else {
	hsp *= 0
	vsp *= 0
	hsp += lengthdir_x(11,angle - 180)
	vsp += lengthdir_y(11,angle - 180)
	held_release_timer = 10
}