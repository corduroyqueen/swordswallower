/// @description Insert description here
// You can write your code in this editor
arm1.pinx = x-100
arm1.piny = y-100

if arm1_state = armstate_guarding {
	arm1_timer++
	with arm1 {
		hand_tar_x = pinx - side * 150
		hand_tar_y = parent.y+250
		sp = 10
	}
	if arm1_timer>100 {
		arm1_timer=0
		arm1_state++
	}
} else if arm1_state = armstate_winding {
	arm1_timer++
	with arm1 {
		hand_tar_x = pinx - side * 150
		hand_tar_y = parent.y-250	
		sp = 6
	}
	if arm1_timer>100 {
		arm1_timer = 0
		arm1_state++
		with arm1.sword_lel {
			state = state_throwing
		}
	}
}  else if arm1_state = armstate_throwing {
	arm1_timer++
	with arm1 {
		hand_tar_x = pinx - side
		hand_tar_y = parent.y+1000	
		sp = 50
	}
	if arm1_timer>100 {
		arm1_timer = 0
		arm1_state++
	}
} else if arm1_state = armstate_swordout {
	arm1_timer++
	with arm1 {
		hand_tar_x = pinx - side
		hand_tar_y = parent.y+200	
		sp = 5
	}
	if arm1_timer>100 {
		arm1_timer = 0
		arm1_state++
		with arm1.sword_lel {
			state = state_pulling
		}
	}
	
} else if arm1_state = armstate_pulling {
	arm1_timer++
	with arm1 {
		hand_tar_x = pinx - side*25
		hand_tar_y = parent.y+100
		sp = 10
	}
	if arm1_timer>100 {
		arm1_timer = 0
		arm1_state = 0
	}
} 


arm2.pinx = x+100
arm2.piny = y-100