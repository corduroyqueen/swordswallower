/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
vspeed=0

image_xscale = 1


if death {
	just_blood(tail_obj.hspeed,tail_obj.vspeed,0.2,80,true,sprite_width/4,sprite_height)
		audio_play_sound(Knife_Pull_140,0,false)
		var ok = sword_thud_1
		audio_sound_gain(ok,random_range(0.18,0.26),0)
		audio_sound_pitch(ok,random_range(0.9,1.1))
		audio_play_sound(ok,0,false)
		audio_manager(false,0,false,3)
	var bruh = lettuce_chop
	audio_sound_pitch(bruh,random_range(0.75,1.25))
	audio_play_sound(bruh,0,false)
	instance_destroy()	
}