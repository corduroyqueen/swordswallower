/// @description Insert description here
// You can write your code in this editor
//These are calculated in script - changing them here will do nothing.
cameraSpacePosX = 0.0;
cameraSpacePosY = 0.0;


//Currently sprites appear to be located at z = 0.5. Making the light's z
//position higher will move it towards the camera and away from the object,
//making shadows shorter, falloff less dramatic, etc.
zPosition = 1.0;

//Simply the colour of the light. Reduce all three to make the light less
//bright.
colourRed = 0.4;
colourGreen = 0.4;
colourBlue = 0.4;

if self=instance_find(light_source_obj,0) {
	followtail = true
} else {
	followtail = false	
}