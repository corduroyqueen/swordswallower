speedx = argument0
speedy = argument1
xad = argument2
yad = argument3
amount = argument4
vary_pos = argument5
width = argument6
height = argument7
//color = argument7

blood_splat_script()

for (i=0;i<(amount+40);i++){
	var scalevar = (amount+40-i)/(amount+40) * 1.1
	var angle = point_direction(0,0,tail_obj.throwxs,tail_obj.throwys)
	
	with blood_ctrl_obj {
		event_user(1)
		var n = blood_num-1
		blood_px[| n] = other.x
		blood_py[| n] = other.y
		blood_ps[| n] = scalevar
		blood_pbs[|n] = scalevar
		blood_p_bounce[|n] = scalevar * random_range(0.7,1.4)
		if !variable_instance_exists(id,"blood_color") {
			blood_color = global.blood_color
		}
		blood_pc[| n] = blood_color
		blood_phsp[| n] = cos(degtorad(angle+random_range(-30,30))) * (other.amount+20)/(other.amount+41-other.i) * 10
		blood_pvsp[| n] = -sin(degtorad(angle+random_range(-30,30))) * (other.amount+20)/(other.amount+41-other.i) * 10 - 5 
		
	}
	
}