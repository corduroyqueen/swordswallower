//fuck yes
if dormant {
	timer=0
	for(var i=0;i<l;i++) {
		var kek = array_members[|i]
		kek.active= false
		kek.dormant = true
		//kek.x=0
		//kek.y=5000
		//kek.y=10000
	}
} else {
	//timer++
	for(var i=0;i<l;i++) {
		var kek = array_members[|i]
		kek.active= true
		kek.dormant = false
		//kek.x=kek.startx
		//kek.y=kek.starty
	}
	if on {
		if timer>on_time {
			for(var i=0;i<l;i++) {
				array_members[|i].active= false
			}
			timer=0
			on = false
		}
	} else {
		
		if timer>off_time {
			for(var i=0;i<l;i++) {
				array_members[|i].active= true
			}
			timer=0
			on = true
		}
	}
}
for(var i=0;i<l;i++) {
	array_members[|i].active= on
	array_members[|i].dormant = dormant
}