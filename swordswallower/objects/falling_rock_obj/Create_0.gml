/// @description Insert description here
// You can write your code in this editor
held=true
grav = 0.25
intangible = false
sword_present = false
vertical = true
horizontal = false
pers=0
mr_rope = instance_create_depth(x,y-32,depth,falling_rock_rope_obj)
mr_rope.dad = instance_id
with(mr_rope) {
	while !place_meeting(x,y,wall_obj) {
		image_yscale+=1
	}
}