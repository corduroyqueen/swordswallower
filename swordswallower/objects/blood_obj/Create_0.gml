/// @description Insert description here
// You can write your code in this editor

surrounded = false
locked = false

lockedobj = noone
xoff = 0
yoff = 0
width = image_xscale*sprite_width
height = image_yscale*sprite_height



hwidth = width/2
hheight = height/2

lifect = 0

xpreva = x
ypreva = y

hs = 0
vs = 0

player_got = false

rval = 0
bounce_vel = 0

image_angle = random_range(0,360)
rec_val = random_range(0.6,0.9)
go = false
spr = blood_sprite_new1
scalevar = 0.5
rot = 50

on_wall = false