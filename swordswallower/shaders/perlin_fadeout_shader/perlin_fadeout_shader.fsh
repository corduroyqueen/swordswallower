


//varying vec2 v_vTexcoord;
//varying vec4 v_vColour;
	
//uniform float	range;
	
//uniform sampler2D perlin_tex;


//void main() {
//	//// distortion offset (red):
//	//vec3 perlin		= texture2D(perlin_tex, fract(v_vTexcoord * size + vec2(0.0, time))).rr;
//	//distort.x			-= 0.5; // to keep the flame horizontally centered

//	//// distortion strength factor (green):
//	//vec2 distort_str;
//	//distort_str.x		= texture2D(distort_tex, vec2(v_vTexcoord.x * 0.5,			v_vTexcoord.y)).g * strength.x;
//	//distort_str.y		= texture2D(distort_tex, vec2(v_vTexcoord.x * 0.5 + 0.5,	v_vTexcoord.y)).g * strength.y;
	
//	//// apply distrotion strength:
//	//distort				*= distort_str;
	
//	//// bend flame (blue):
//	//distort.x			+= texture2D(distort_tex, v_vTexcoord).b * bend; // -1 <= bend <= +1
	
//	vec4 perlin	= texture2D(perlin_tex, v_vTexcoord);
	
//	//float newa = perlin.r;
//	//if newa<range {
//	//	newa = 0.0;
//	//}
//	vec4 rgbs = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
//	vec3 rgbsa = vec3(rgbs.r,rgbs.g,rgbs.b);
//	// Output:	
//	gl_FragColor		= vec4(rgbsa,ceil(perlin.r-range-0.01));
//	//gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
//}

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D	perlin_tex;
uniform float		time;		// 0 < time < 1
uniform float		tolerance;	// 0 < tolerance < 1
uniform float		inverse;	// 0 or 1

void main() {

    // factor tolerance into time:
	float time_ext	= time + time * tolerance;
	
	// get samples:
	vec4 base_col	= v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float mask_val	= abs(inverse - texture2D( perlin_tex, v_vTexcoord ).r);
	
	// apply time & tolerance:
	mask_val		= smoothstep(mask_val, mask_val + tolerance, time_ext);
	
    gl_FragColor	= vec4(base_col.rgb, base_col.a * mask_val);
}
