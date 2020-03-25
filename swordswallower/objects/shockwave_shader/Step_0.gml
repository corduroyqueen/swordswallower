/// @description get clicks / wave age

// WAVE BIRTH
//-----------------------------------------------------------------------------
// create a wave on mouse-click
if (trigger) {
	var new_wave = ds_list_create();
	
	new_wave[|waveparam.xx]		= player_obj.x ;
	new_wave[|waveparam.yy]		= player_obj.y ;
	new_wave[|waveparam.age]	= 0;
	new_wave[|waveparam.scale]	= 0.15
	new_wave[|waveparam.alpha]	= 0.01

	ds_list_add(list_of_waves, new_wave);
	trigger = false
}

// WAVE AGE:
//-----------------------------------------------------------------------------
var wave_list_size = ds_list_size(list_of_waves);
if (wave_list_size > 0) {
	var w, this_wave;
	for (w = 0; w < wave_list_size; w++) {
		this_wave = list_of_waves[|w];
		this_wave[|waveparam.age]	+= 1
		
		if (this_wave[|waveparam.age] < wave_life) {
			this_wave[|waveparam.scale]	=  tween_cubic_out_simple(this_wave[|waveparam.age] / wave_life) * wave_scale_max;
			this_wave[|waveparam.alpha]	= 0.15 - (this_wave[|waveparam.age] / wave_life) * 0.15
		} else {
			ds_list_destroy(this_wave);
			ds_list_delete(list_of_waves, w);
			w--;
			wave_list_size--;
		}
	}
}