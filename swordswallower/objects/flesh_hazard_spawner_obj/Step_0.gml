//fuck yes
if dormant {
	timer=0
} else {
	timer++
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