//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float Time;

void main()
{
	
	
	vec2 Coord = v_vTexcoord + vec2(cos(v_vTexcoord.y*15.0+Time*6.2831)/30.0,0);
	
	vec4 source = v_vColour * texture2D( gm_BaseTexture, Coord);
    float brightness = dot( vec3( 0.7000,0.7000,0.7000 ), source.rgb );
	vec4 new = vec4( vec3( brightness ), source.a );
	
	
    gl_FragColor = vec4( vec3( brightness ), source.a );;
}
