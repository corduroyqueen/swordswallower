//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float Time;

void main()
{
	vec2 Coord = v_vTexcoord + vec2(0,cos(v_vTexcoord.x*15.0+Time*6.2831)/30.0);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, Coord );
}
