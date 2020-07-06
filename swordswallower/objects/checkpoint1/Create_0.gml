/// @description Insert description here
// You can write your code in this editor
wooden_walls = array_create(100)
wooden_walls[0] = false
big_bois = array_create(10)
big_bois[0] = false
stinky_piles = array_create(100)
stinky_piles[0] = false

wooden_walls_b = array_create(100)
wooden_walls_b[0] = false
big_bois_b = array_create(10)
big_bois_b[0] = false
stinky_piles_b = array_create(100)
stinky_piles_b[0] = false


	
big_boi_bool = 0

initialize = false
firsttime = true
get_deaths = false

ready = false

setpoint = false

refreshtext = true
refreshpos = 0

number = 0

thrown = false
starting_bool = false

fire_sound = firecrackle1
audio_sound_gain(fire_sound,0,0)

s_fire_emitter = audio_emitter_create()
audio_play_sound_on(s_fire_emitter,fire_sound,true,0)
audio_emitter_gain(s_fire_emitter,0)
