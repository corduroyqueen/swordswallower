/// @description Insert description here
// You can write your code in this editor
//if !level1_master.map  {
//	level1_master.getmap = true
//}

if player_obj.k_speak_p 
&& !level1_master.map 
&& point_distance(x,y,player_obj.x,player_obj.y)<100 {
	level1_master.getmap = true	
	//player_obj.gems--
}

//if player_obj.gems>0 
//&& player_obj.k_speak_p 
//&& !level1_master.map 
//&& point_distance(x,y,player_obj.x,player_obj.y)<100 {
//	level1_master.getmap = true	
//	player_obj.gems--
//}