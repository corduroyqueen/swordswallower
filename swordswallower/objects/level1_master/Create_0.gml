/// @description Insert description here
// You can write your code in this editor

draw_texture_flush();
audio_channel_num(300)
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


st_map_1 = false
st_map_2 = false

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
//dev = true

if dev {
	//show_debug_overlay(true)
	
	//window_set_fullscreen(false)	
}

window_set_fullscreen(true)
//window_set_fullscreen(false)
randomize()

zone4 = false

p_cgems = 0
piercebool = false
pierce_bridge_pulled = false
waterbool = false
gpu_set_texfilter(true)



ability_dash = false

st_coffin_boss_1_opened = false
st_coffin_boss_1_beaten = false
st_bridge_moment = false

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



global.dash_color = make_color_rgb(122,153,151)

enemy_blood_reds = ds_list_create()

//ds_list_add(enemy_blood_reds,make_color_rgb(121,11,59))
//ds_list_add(enemy_blood_reds,make_color_rgb(121,11,44))
//ds_list_add(enemy_blood_reds,make_color_rgb(174,39,61))
//ds_list_add(enemy_blood_reds,make_color_rgb(153,14,14))
//ds_list_add(enemy_blood_reds,make_color_rgb(217,4,0))
//ds_list_add(enemy_blood_reds,make_color_rgb(193,28,25))
//ds_list_add(enemy_blood_reds,make_color_rgb(95,12,11))
//ds_list_add(enemy_blood_reds,make_color_rgb(94,33,21))
//ds_list_add(enemy_blood_reds,make_color_rgb(60,15,9))
//ds_list_add(enemy_blood_reds,make_color_rgb(175,10,10))
//ds_list_add(enemy_blood_reds,make_color_rgb(232,73,73))
//ds_list_add(enemy_blood_reds,make_color_rgb(194,49,49))
//ds_list_add(enemy_blood_reds,make_color_rgb(133,19,19))

//ds_list_add(enemy_blood_reds,make_color_rgb(121,11,59))
//ds_list_add(enemy_blood_reds,make_color_rgb(121,11,44))
ds_list_add(enemy_blood_reds,make_color_rgb(190,39,61)) 
//ds_list_add(enemy_blood_reds,make_color_rgb(153,14,14))
ds_list_add(enemy_blood_reds,make_color_rgb(195,14,14))
ds_list_add(enemy_blood_reds,make_color_rgb(217,4,70))
ds_list_add(enemy_blood_reds,make_color_rgb(203,38,35))
//ds_list_add(enemy_blood_reds,make_color_rgb(95,12,11))
//ds_list_add(enemy_blood_reds,make_color_rgb(94,33,21))
//ds_list_add(enemy_blood_reds,make_color_rgb(60,15,9))
ds_list_add(enemy_blood_reds,make_color_rgb(234,10,80))
ds_list_add(enemy_blood_reds,make_color_rgb(232,73,73))
ds_list_add(enemy_blood_reds,make_color_rgb(220,49,49))

ds_list_add(enemy_blood_reds,make_color_rgb(229,0,76))
//ds_list_add(enemy_blood_reds,make_color_rgb(133,19,19))



wind_strength = 0

in_void = false
void_target = noone
void_blood_ctr = 0
void_blood_ctr_max = 0
powerup_bug = noone
bloom_on = true
//0.9, 0.0, 0.3 neon pink

cosmetic_hood = false
cosmetic_santa_hat = false

hats_list = ds_list_create()
ds_list_add(hats_list,0)
head_spr_i=0

//gpu_set_colorwriteenable(true, true, true, false);