speedx = argument0
speedy = argument1
xad = argument2
yad = argument3
amount = argument4
vary_pos = argument5
width = argument6
height = argument7
//color = argument7

//blood_splat_script()

blood_splat_script()

for (i=0;i<80;i++){
	
	var scalevar = (power(((amount+40-i)/(amount+40)+1),1.15) - 1)/1.15
	scalevar = sqrt((amount+40-i)/(amount+40)+1) - 0.65
	var angle = point_direction(0,0,speedx,speedy)
	
	with blood_ctrl_obj {
		event_user(1)
		var n = blood_num-1
		blood_px[| n] = other.x
		blood_py[| n] = other.y
		blood_ps[| n] = scalevar
		blood_pbs[|n] = scalevar
		blood_p_refs[| n] = scalevar
		
		blood_p_bounce[|n] = 0.25
		
		
		if !variable_instance_exists(other.id,"blood_color") {
			other.blood_color = global.blood_color
		}
		blood_pc[| n] = other.blood_color
		blood_phsp[| n] = cos(degtorad(angle+random_range(-30,30))) * (other.amount+20)/(other.amount+41-other.i) * 10
		blood_pvsp[| n] = -sin(degtorad(angle+random_range(-30,30))) * (other.amount+20)/(other.amount+41-other.i) * 10 - 5 
		
	}
	
}