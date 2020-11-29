/// @description Insert description here
// You can write your code in this editor
//application_surface_draw_enable(true);
if (surface_exists(srf_ping)) surface_free(srf_ping);
if (surface_exists(srf_pong)) surface_free(srf_pong);
if (surface_exists(GUI)) surface_free(GUI);
if (surface_exists(blood_surface)) surface_free(blood_surface);
if (surface_exists(srf_waves)) surface_free(srf_waves);
if (surface_exists(gif_surface)) surface_free(gif_surface);
if (surface_exists(srf_water)) surface_free(srf_water);

if (ds_exists(list_of_waves, ds_type_list)) {
	for (var w = 0; w < ds_list_size(list_of_waves); w++) {
		if (ds_exists(list_of_waves[|w], ds_type_list)) {
			ds_list_destroy(list_of_waves[|w]);
		}
	}
}