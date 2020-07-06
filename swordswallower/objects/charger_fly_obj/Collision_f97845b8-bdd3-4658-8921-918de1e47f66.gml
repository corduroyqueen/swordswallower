/// @description Insert description here
// You can write your code in this editor
if !other.pickedup {
	carryingcrab = true
	crabfriend = other
	other.pickedup = true
	other.heldbymonster = true
	other.fallingoverride = true
	crabfriend.falling = true
	crabfriend.writhing = true
}