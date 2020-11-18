speedx = argument0
speedy = argument1
reduction = argument2
amount = argument3
vary_pos = argument4
width = argument5
height = argument6
//color = argument7

blood_splat_script()

amount/=2
for (i=0;i<(amount+40);i++){
	
	var scalevar = (amount+40-i)/(amount+40) * 1.1
	var angle = point_direction(0,0,speedx,speedy)
	
	with blood_ctrl_obj {
		event_user(1)
		var n = blood_num-1
		blood_px[| n] = other.x
		blood_py[| n] = other.y
		blood_ps[| n] = scalevar
		blood_pbs[|n] = scalevar
		blood_p_bounce[|n] = scalevar * random_range(0.7,1.4)
		if !variable_instance_exists(other.id,"blood_color") {
			other.blood_color = global.blood_color
		}
		blood_pc[| n] = other.blood_color
		blood_phsp[| n] = cos(degtorad(angle+random_range(-30,30))) * (other.amount+20)/(other.amount+41-other.i) * 10
		blood_pvsp[| n] = -sin(degtorad(angle+random_range(-30,30))) * (other.amount+20)/(other.amount+41-other.i) * 10 - 5 
		
	}
	
}