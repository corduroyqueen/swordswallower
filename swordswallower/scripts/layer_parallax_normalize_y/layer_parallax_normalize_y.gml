amt = argument0
layer_id = argument1


var lel = layer_get_all_elements(layer_id);
//sdm(array_length_1d(lel))
var length= array_length_1d(lel)
for (var i = 0; i < length; i++) {
	var inst = lel[i]
	var insty = layer_sprite_get_y(inst)
	layer_sprite_y(inst,insty - (insty/amt))
}