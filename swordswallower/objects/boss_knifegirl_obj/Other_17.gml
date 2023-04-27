//fuck yes
death = true

just_blood_input(cos(degtorad(90))*30,sin(degtorad(90))*100,
				
	player_obj.hsp * random_range(-0.08,0.05),
	random_range(-10,1),
				
	200,
	true,x,y)

_state = _state_dummy

sword_present = false
player_obj.tail_planted = false
player_obj.tail_pulling = true
tail_obj.current_obj = noone

ui_manager.health_bar_active = false