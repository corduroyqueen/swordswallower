/// @description Insert description here
// You can write your code in this editor

if player_obj.k_speak_p 
&& point_distance(x,y,player_obj.x,player_obj.y)<200 {
	level1_master.firsttime = true
	level1_master.initialize = true
	room_goto_next()
}

/*

if level1_master.death_num_p>=10 
&& player_obj.k_speak_p 
&& point_distance(x,y,player_obj.x,player_obj.y)<100 {
	level1_master.death_num_p-=10
	player_obj.x = 45000
	player_obj.y = 10000
}