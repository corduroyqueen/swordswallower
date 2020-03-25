varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 Fragcoord;

//texture samplers
uniform sampler2D u_texture; //diffuse map
uniform sampler2D u_normals; //normal map

//shader algorithm values
uniform vec2 Resolution;    //screen resolution
uniform vec3 LightPos;        //light postion, normalized
uniform vec4 LightColor;    //light RGBA -- alpha is intensity
uniform vec4 AmbientColor;    //Ambient RGBA -- alpha is intenisty
uniform vec3 Falloff;        //attenuation coefficients


void main()
{
    //vec3 LightPos = vec3(0.1, 0.8, 0.5);
    //RGBA of diffuse color
    vec4 DiffuseColor = texture2D(u_texture, v_vTexcoord);
    
    //RGB of normal map
    vec3 NormalMap = texture2D(u_normals, v_vTexcoord).rgb;
    NormalMap.g = 1.0 - NormalMap.g;
    
    //delta position of light
    //res and light poss need to be passed in
    vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);
    
    //Correct for aspect ratio
    LightDir.x *= Resolution.x / Resolution.y;
    
    //Determin distance (for attenuation) BEFORE normalizing LightDir vector
    float D = length(LightDir);
    
    //Normalize vectors
    vec3 N = normalize(NormalMap * 2.0 - 1.0);
    vec3 L = normalize(LightDir);
    
    //Pre-multiply light color with intensity
    //then perform "N dot L to determine our diffuse term
    vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N , L), 0.0);
    
    //pre-multiply ambient color with intensity
    vec3 Ambient = AmbientColor.rgb* AmbientColor.a;
    
    //Calculate attenuation
    float Attenuation = 1.0 / (Falloff.x + (Falloff.y*D) + (Falloff.z*D*D) );
    
    //Final color calculation
    vec3 Intensity = Ambient + Diffuse * Attenuation;
    vec3 FinalColor = DiffuseColor.rgb * Intensity;
        
    gl_FragColor = v_vColour * vec4(FinalColor, DiffuseColor.a);
}