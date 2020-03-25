available_checkpoints = 2
room_set_persistent(room,false)
hello = instance_create_depth(player_obj.x,player_obj.y,0,checkpoint1)	
checkpoint_manager.checkpoint = hello
checkpoints[0] = hello
hello.number = 0
hello.setpoint = true

firsttime = false
