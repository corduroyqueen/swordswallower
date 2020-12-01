//fuck yes
parent.destroy_arm = true
twojoints_obj.phase_n_i = 1000
var em = instance_create_depth(parent.hand.x,parent.hand.y,depth,dead_twojoint_arm_obj)
em.hand_x = parent.hand.x
em.hand_y = parent.hand.y
em.hand_ang = parent.hand.image_angle
em.forearm_ang = 360
em.cutarm_ang = 400

x = tail_obj.x
y = tail_obj.y
just_blood(tail_obj.hsp,tail_obj.vsp,0.2,10,false,x,y)	
player_obj.shake_d=10
player_obj.camera_shake_d = true	
		
var d
with parent {
	d = point_distance(seg_x[1],seg_y[1],tail_obj.x,tail_obj.y)
}

em.cut_length = d