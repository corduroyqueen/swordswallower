/// @description Insert description here
// You can write your code in this editor
if parent.state==parent.state_hitting {
	if (current_time % 4) <= 1 {
		image_index = 4
	} else {
		image_index = 1
	}
	
} else if parent.state==parent.state_attacking {
	image_index = 0
	
	
	
} else if parent.state==parent.state_searching {
	
	//\left(\frac{50}{\left(x\right)}\right)\cdot\sin\left(x+2\right)-\left(x\cdot0.01\right)+3
	if parent.atk_timer<0 {
		image_index = 5
		addt = current_time	
	} else if parent.atk_timer<parent.atk_timer_max-30 {
		var t = floor((current_time-addt) * 0.01)
	
		image_index = 5-round(
		(25/(t*2+6))  *sin(t+8)   +1.5    -(t*0.016) )
	} else {
		image_index = 5
		addt = current_time	
	}
	
} else if parent.state==parent.state_idle || 
parent.state==parent.state_retracting  {
	image_index = 5
}

if parent.state!=parent.state_searching {
	addt = current_time	
}

met = parent.met
mask_index = snake_head

moveX(hsp)
moveY(vsp)