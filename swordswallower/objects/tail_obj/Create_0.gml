/// @description Insert description here
// You can write your code in this editor
cca = 5
tspeed = 69
pspeed = 69

planted = false

speedx = 0
speedy = 0

throw_timer = 0 
throw_count = 0
temptemptemp = true
inside_flier = false

throwxs = 0
throwys = 0

stinky_when_thrown = false
current_obj = false

wiggle_timer = 0
held_image_angle = 0

x = player_obj.x
y = player_obj.y

xpreva = x
ypreva = y

pull_timer = 0
pull_wall_t = 5

insert_hs = 0
insert_vs = 0

planted_wall = false

current_wall = false
current_wallx = 0
current_wally = 0
ang=0
outside=false

stinky = false


sword_particle_spawn = 30
image_speed = 1

moving_platform_bool = false

platform_movingout = false

pickup_timer=0

charger_bool = false

hitpause = false
hitpause_timer = 0

scrape_s = scrape
audio_sound_pitch(scrape_s,0.5)

s_whoosh_emitter = audio_emitter_create()
audio_play_sound_on(s_whoosh_emitter,gsound.s_sword_whoosh,true,0)
audio_emitter_gain(s_whoosh_emitter,0)

held_pos_x= 0
held_pos_y= 0
held_pos_ang = 0

thrown_ang = 0