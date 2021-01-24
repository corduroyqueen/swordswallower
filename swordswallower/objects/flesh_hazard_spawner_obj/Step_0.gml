//fuck yes

timer++
if on {
	for(var i=0;i<l;i++) {
		array_members[|i].active= true
		array_members[|i].hitbox_on = true
	}
	if timer>on_time {
		timer=0
		on = false
	}
} else {
	for(var i=0;i<l;i++) {
		array_members[|i].active= false
		array_members[|i].hitbox_on = false
	}
	if timer>off_time {
		timer=0
		on = true
	}
}
