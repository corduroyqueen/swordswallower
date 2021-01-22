//fuck yes

blood_timer_m = 50

blood_timer_1 = blood_timer_m * 0
blood_timer_2 = blood_timer_m * 0.2
blood_timer_3 = blood_timer_m * 0.4
blood_timer_4 = blood_timer_m * 0.6
blood_timer_5 = blood_timer_m * 0.8

blood_color = make_color_rgb(217,4,70)

var ok = instance_create_depth(tail_obj.x,tail_obj.y,depth-10,sim_intestine_obj)
ok.num_rings = 10
//ok.pinned = false
//ok.run = true
with ok {
	init = false
	event_user(1)
	pinned = false
	run = true
		
	for (var e=0;e<num_rings;e++) { 
 
		rings_hsp[| e] = -15 * random_range(0.8,1.2)
		rings_vsp[| e] = -25 * random_range(0.8,1.2)

	}
}

ok = instance_create_depth(tail_obj.x,tail_obj.y,depth-10,sim_intestine_obj)
ok.num_rings = 15
//ok.pinned = false
//ok.run = true
with ok {
	init = false
	event_user(1)
	pinned = false
	run = true
		
	for (var e=0;e<num_rings;e++) { 
 
		rings_hsp[| e] = -15 * random_range(0.8,1.2)
		rings_vsp[| e] = -30 * random_range(0.8,1.2)

	}
}

ok = instance_create_depth(tail_obj.x,tail_obj.y,depth-10,sim_intestine_obj)
ok.num_rings = 8
//ok.pinned = false
//ok.run = true
with ok {
	init = false
	event_user(1)
	pinned = false
	run = true
		
	for (var e=0;e<num_rings;e++) { 
 
		rings_hsp[| e] = -25 * random_range(0.8,1.2)
		rings_vsp[| e] = -25 * random_range(0.8,1.2)

	}
}
	
	
	var hey = choose(s_squelch_01,s_squelch_03,s_squelch_05,s_squelch_06,s_squelch_07,s_squelch_08)//footstep144,footstep2,footstep3)
audio_sound_gain(hey,0.05,0)
audio_sound_pitch(hey,random_range(0.91,1.25))
audio_manager(hey,0,false,0)


var bruh = lettuce_chop
audio_sound_pitch(bruh,random_range(0.75,1.25))
audio_sound_gain(bruh,0.32,0)
audio_play_sound(bruh,0,false)
			
bruh = sword_crunch_1
audio_sound_pitch(bruh,random_range(2,3))
audio_sound_gain(bruh,random_range(0.3,0.6),0)
audio_play_sound(bruh,0,false)

	/*
ok = instance_create_depth(tail_obj.x,tail_obj.y,depth,sim_intestine_obj)
ok.num_rings = 15
//ok.pinned = false
//ok.run = true
var ww
with ok {
	init = false
	event_user(1)
	pinned = false
	run = true
		
	for (var e=0;e<num_rings;e++) { 
		rings_hsp[| e] = -5
		rings_vsp[| e] = -7
	}
}

ok = instance_create_depth(tail_obj.x,tail_obj.y,depth,sim_intestine_obj)
ok.num_rings = 8
//ok.pinned = false
//ok.run = true
var ww
with ok {
	init = false
	event_user(1)
	pinned = false
	run = true
		
	for (var e=0;e<num_rings;e++) { 
		rings_hsp[| e] = -7
		rings_vsp[| e] = -5
	}
}
	