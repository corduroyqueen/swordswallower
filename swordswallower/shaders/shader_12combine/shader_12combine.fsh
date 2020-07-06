//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float Time;
uniform float xScale;
uniform float yScale;

void main()
{
	vec2 Coord = v_vTexcoord + vec2(0,cos(v_vTexcoord.x*xScale+Time*6.2831)/(100.0*yScale));
	vec2 Coord2 = Coord + vec2(cos(v_vTexcoord.y*yScale*5.0-Time*6.2831)/(30.0*xScale),0);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, Coord2 );
}
