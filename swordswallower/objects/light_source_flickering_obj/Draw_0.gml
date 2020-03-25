if followtail {
	x = tail_obj.x
	y = tail_obj.y
	}
	
if flickering { 
	lol = choose(0.4,0.4,0.4,0.5,0.3,0.01,0.02,0.7,0.4,0.3,0.45,0.35)
	colourBlue = lol
	colourRed = lol
	colourGreen = lol
}
//In shader code, the vertex position appears to be in camera space. So it only has
//to happen once per light, rather than once per object, we'll fix this by
//calculating the light's position in camera space.

//Note - for the moment, I'm not going to handle rotating views, but
//adding that later shouldn't be super challenging.

//The first part of that takes the current view's extremes.
leftExtreme = __view_get( e__VW.XView, view_current );
upperExtreme = __view_get( e__VW.YView, view_current );
rightExtreme = leftExtreme + __view_get( e__VW.WView, view_current );
lowerExtreme = upperExtreme + __view_get( e__VW.HView, view_current );

cameraSpacePosX = x - leftExtreme;
cameraSpacePosY = (y - lowerExtreme) * -1;

cameraSpacePosX /= __view_get( e__VW.WView, view_current );
cameraSpacePosY /= __view_get( e__VW.HView, view_current );

cameraSpacePosX = cameraSpacePosX * 2.0 - 1.0;
cameraSpacePosY = cameraSpacePosY * 2.0 - 1.0;

