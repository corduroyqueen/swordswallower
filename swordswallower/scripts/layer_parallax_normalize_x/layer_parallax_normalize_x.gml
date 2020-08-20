amt = argument0
layer_id = argument1

var lel = layer_get_all_elements(layer_id);
sdm(array_length_1d(lel))
for (var i = 0; i < array_length_1d(lel); i++) {
	var inst = lel[i]
	var instx = layer_sprite_get_x(inst)
	layer_sprite_x(inst,instx - (instx/amt))
}