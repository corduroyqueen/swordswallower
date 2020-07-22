//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying float v_alpha;

uniform float v_mult;

void main()
{
	vec4 c = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	//v_alpha = 
	vec3 color = vec3(1,0,0);
    gl_FragColor = vec4(color, floor(c.a * v_mult)); 
	
   // gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
