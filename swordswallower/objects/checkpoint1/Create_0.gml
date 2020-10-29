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



sprites = array_create(10)
sprites[0] = statue1
sprites[1] = statue
sprites[2] = statue4788
sprites[3] = statue2
sprites[4] = statue3787

sprites_x = array_create(10)
sprites_x[0] = -66
sprites_x[1] = 50
sprites_x[2] = 0
sprites_x[3] = -15
sprites_x[4] = -47

sprites_y = array_create(10)
sprites_y[0] = -148
sprites_y[1] = -45
sprites_y[2] = -120
sprites_y[3] = -65
sprites_y[4] = -145

sv = floor(x) % 5

s_sprite = sprites[sv]
s_x = sprites_x[sv]
s_y = sprites_y[sv]

light_strength_bkd = 0.3
light_strength_walls = 0.55
light_radius = 0.5