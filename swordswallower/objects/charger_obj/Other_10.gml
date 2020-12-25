/// @description Insert description here
// You can write your code in this editor
var ang = point_direction(x,y,tail_obj.x,tail_obj.y)
hp--
if hp>10 {
	var go = instance_create_depth(x,y,0,snakeheaddead_obj)
	go.sprite_index = spr_hooves_top_smol
	go.image_xscale = image_xscale
	go.hsp = -dcos(ang)* 7
	go.vsp = -13
	go.spinspeed = 20 * sign(image_xscale)
} else if hp>0 {
	var go = instance_create_depth(x,y,0,snakeheaddead_obj)
	go.sprite_index = spr_hooves_side_smol
	go.image_xscale = image_xscale
	go.hsp = -dcos(ang) * 7
	go.vsp = -13
	go.spinspeed = 20 * sign(image_xscale)
}
if hp<=0 {
	death = true	
}