/// @description Insert description here
// You can write your code in this editor
if go {
	if loop1<0.5 {
		loop1+=0.004
	} else if loop1<0.6 {
		loop1 = lerp(loop1,1.07,0.0052)	
	} else {
		loop1 = lerp(loop1,1.1,0.02)	
	}
}
if loop1>1 {
	loop1 = 0	
}
if loop1<0.04 {
	leg1out +=10
} else if loop1<0.6 {
	
} else if loop1<0.9 {
	leg1out-=5
}
//loop1out = cos((loop1+0.0)*3.1415/2)
leg1_ang = cos(0+loop1*6.2831)*22

if go {
	if loop2<0.5 {
		loop2+=0.004
		//leg2out = sin(loop2*6.2831)*50
	} else if loop2<0.6 {
		loop2 = lerp(loop2,1.07,0.0052)	
		//leg2out = sin(loop2*6.2831)*0
	}  else {
		loop2 = lerp(loop2,1.1,0.02)
		//leg2out = sin(loop2*6.2831)*25
	}
}

if loop2>1 {
	loop2 = 0	
}

if loop2<0.04 {
	leg2out +=10
} else if loop2<0.6 {
	
} else if loop2<0.9 {
	leg2out-=5
}

leg1out = clamp(leg1out,-10,60)
leg2out = clamp(leg2out,-10,60)

//loop2out = cos((loop2+0.0)*3.1415/2)
leg2_ang = cos(0+loop2*6.2831)*22


draw_sprite_ext(leg_spr2,0,
(x)+cos(degtorad(leg2_ang+270)) * leg2out,
(y-10)-sin(degtorad(leg2_ang+270)) * leg2out,
1,1,leg2_ang,c_white,1)
draw_self()
