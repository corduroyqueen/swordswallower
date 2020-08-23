/// @description Insert description here
// You can write your code in this editor
instance_deactivate_object(enemy_parent_obj)

var cx = player_obj.camx
var cy = player_obj.camy
instance_activate_region(cx,cy,cx+1920,cy+1080,true)
alarm[0] = 2