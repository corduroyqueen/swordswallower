//fuck yes

// Inherit the parent event
event_inherited();



STATE_DEFAULT = 0
STATE_IDLE = 1
STATE_THROWING_BOOMERANG = 2

_state = 1

obj_boomerang = instance_create_layer(0,0,layer,boss_boom_projectile_obj)

throw_timer=0

room_center_x = x
room_center_y = y

x = room_center_x - 600
y = room_center_y + 200


timer_throw_boomerang_t = 0

