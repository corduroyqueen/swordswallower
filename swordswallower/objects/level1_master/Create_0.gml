/// @description Insert description here
// You can write your code in this editor

//draw_texture_flush();

wooden_walls = array_create(100)
wooden_walls[0] = false
big_bois = array_create(10)
big_bois[0] = false
stinky_piles = array_create(100)
stinky_piles[0] = false

wooden_walls_b = array_create(100)
wooden_walls_b[0] = false
wooden_walls_b[0] = false
big_bois_b = array_create(10)
big_bois_b[0] = false
stinky_piles_b = array_create(100)
stinky_piles_b[0] = false
lol = false

big_boi_bool = 0

initialize = false
firsttime = true
get_deaths = false

checkpoints = array_create(100)
available_checkpoints = 0
checkpoint_num = 1

death_num = 0
death_num_p = 0

num_fog = 1
fogs = array_create(num_fog)
fogs_b = array_create(num_fog)
		
speaking_button = ord("E")

level0map = false
level1map = true
level2map = true

dc_map_1 = false
if_map_1 = false

getmap = false
map = false

voidwalltoggle = false

hello = noone

shielded = false

recording = false
surface_resize(application_surface,1920,1080)


// 



screenshotnum = 30

keysave = undefined

audio_listener_set_position(0,0,0,-1)



walls_visible = false
black_walls_visible = false
spikes_visible = false
thin_floor_visible = false

dev = false
dev = true

if dev {
	show_debug_overlay(true)
	window_set_fullscreen(false)	
}

window_set_fullscreen(true)
randomize()


p_cgems = 0

waterbool = false
gpu_set_texfilter(true)



ability_dash = false

//global.blood_cr = 0.9
//global.blood_cg = 0.0
//global.blood_cb = 0.3
//global.blood_cr = 0.73
//global.blood_cg = 0.19
//global.blood_cb = 0.43

//global.blood_cr = 0.55
//global.blood_cg = 0.13
//global.blood_cb = 0.32


global.blood_cr = 0.7176
global.blood_cg = 0.23
global.blood_cb = 0.439

global.blood_color = make_color_rgb(255*global.blood_cr,255*global.blood_cg,255*global.blood_cb)

//global.magic_cr = 0.55
//global.magic_cg = 0.21
//global.magic_cb = 0.9

//global.magic_cr = 0.184
//global.magic_cg = 0.78
//global.magic_cb = 0.69

global.magic_cr = 0.29
global.magic_cg = 0.47
global.magic_cb = 0.46
global.magic_color = make_color_rgb(255*global.magic_cr,255*global.magic_cg,255*global.magic_cb)

//0.9, 0.0, 0.3 neon pink


//gpu_set_colorwriteenable(true, true, true, false);