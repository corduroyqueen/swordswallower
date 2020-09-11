death = true
sword_death_script()
hsp = 0
vsp = 0
start_death = false
duck_audio_script(0,2000)
audio_play_sound(death_scream,0,false)
	
audio_sound_gain(sword_thud_1,0.3,0)
audio_sound_pitch(sword_thud_1,1)
audio_play_sound(sword_thud_1,0,false)
	
audio_sound_gain(sword_crunch_1,0.46,0)
audio_sound_pitch(sword_crunch_1,1)
audio_play_sound(sword_crunch_1,0,false)
	
shockwave_shader.trigger = true
shockwave_shader.strength_input = 0.2
	
	
//instance_deactivate_object(background)
//layer_destroy(layertwo)
	
instance_deactivate_layer(layer_get_id("background_layer"))
//layerbk1 = layer_get_id("bkd")
//layerbk2 = layer_get_id("bkd2")
//layer_set_visible(layerbk1,false)
//layer_set_visible(layerbk2,false)
	
	
if room==subtemple01 {
	layerbk = layer_get_id("bkd_m")
	layer_set_visible(layerbk,false)
	
	layerbk = layer_get_id("p3bkd1")
	layer_set_visible(layerbk,false)
	layerbk = layer_get_id("p3bkd2")
	layer_set_visible(layerbk,false)
	layerbk = layer_get_id("p3bkd3")
	layer_set_visible(layerbk,false)
	
	layerbk = layer_get_id("bkd1p2")
	layer_set_visible(layerbk,false)
	layerbk = layer_get_id("bkdp22")
	layer_set_visible(layerbk,false)
	layerbk = layer_get_id("bkdp23")
	layer_set_visible(layerbk,false)
	layerbk = layer_get_id("Assets_3")
	layer_set_visible(layerbk,false)
	
	layerbk = layer_get_id("bkd")
	layer_set_visible(layerbk,false)
	layerbk = layer_get_id("bkd2")
	layer_set_visible(layerbk,false)
	layerbk = layer_get_id("bkd3")
	layer_set_visible(layerbk,false)
	
	px = layer_get_id("parallax_layers")
	layer_set_visible(px,false)
	
	//px = layer_get_id("px_sky")
	//layer_set_visible(px,false)
}
	
audio_manager(false,0,false,3)
just_blood_death(0,0,hspreva*0.2,vspreva* 0.25-10,100,false,sprite_width,sprite_height)
sprite_index = sprite310
//shatter_script()
sprite_index = -1