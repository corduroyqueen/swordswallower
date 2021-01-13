//fuck yes
blood_timer_1++
blood_timer_2++
blood_timer_3++
blood_timer_4++
blood_timer_5++
y+=0.1
if blood_timer_1>blood_timer_m {
	just_blood_speed_input(-2,-2,0.2,25,true,x-50,y)
	blood_timer_1 = 0
}
if blood_timer_2>blood_timer_m {
	just_blood_speed_input(-1.5,-1,0.2,25,true,x-60,y+400)
	blood_timer_2 = 0
}
if blood_timer_3>blood_timer_m {
	just_blood_speed_input(-2,-2,0.2,25,true,x-40,y+130)
	blood_timer_3 = 0
}
if blood_timer_4>blood_timer_m {
	just_blood_speed_input(-1.5,-1.5,0.2,25,true,x-60,y+210)
	blood_timer_4 = 0
}
if blood_timer_5>blood_timer_m {
	just_blood_speed_input(-1.5,-2,0.2,25,true,x-40,y+300)
	blood_timer_5 = 0
}