/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

sniping_timer = 0
sniping_timer_m = 100

preparing_sniper = false

preparing_sniper_timer = 0
preparing_sniper_timer_m = 80

shoot = false

idle_speed = 2
go_home = true


ang = random_range(0,360)
idle_targetx = startx + cos(degtorad(ang))*70
idle_targety = starty + sin(degtorad(ang))*70

floatspeed_aiming = 1
floatspeed_reloading = 5