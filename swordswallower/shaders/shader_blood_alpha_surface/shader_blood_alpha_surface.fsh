//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying float v_alpha;

uniform float v_mult;

uniform sampler2D artTexture;

void main()
{
	vec4 c = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 d = v_vColour * texture2D(artTexture, v_vTexcoord);
	//v_alpha = 
	vec3 color = vec3(0.9,0,0.3);
    gl_FragColor = vec4(color, floor(c.a * 4.0 * d.a)); 
	
   // gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
