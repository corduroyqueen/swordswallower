num = argument0


checkpoints[player_obj.checkpoint_num]=checkpoints[player_obj.checkpoint_num-1]
for(i=num;i<checkpoint_num;i++) {
	checkpoints[i] = checkpoints[i+1]	
}

checkpoints[player_obj.checkpoint_num-1] = checkpoint_manager.checkpoint


for(i=0;i<checkpoint_num;i++) {
	checkpoints[i].number = i
}

checkpoints[player_obj.checkpoint_num]=noone