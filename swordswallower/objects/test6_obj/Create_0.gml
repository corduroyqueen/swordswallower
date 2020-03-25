//This script goes on the 'create' event of objects that need Sprite Lamp's
//lighting effects.
//The uniform variable stuff shouldn't really change, but down the bottom are
//the bits where you set your desired values for stuff.


/********************************************************************************/
//A whole bunch of shader variables - the 'u_' prefix means 'uniform variable'.
//These are just hooks to communicate with the shader.

//Maps. Note that we don't have to do the diffuse map - that's included as the
//base texture (gm_BaseTexture) automatically.
u_NormalDepthMap = shader_get_sampler_index(SpriteLampShader, "sl_NormalDepthMap");
u_SpecGlossMap = shader_get_sampler_index(SpriteLampShader, "sl_SpecGlossMap");
u_AOMap = shader_get_sampler_index(SpriteLampShader, "sl_AOMap");
u_EmissiveMap = shader_get_sampler_index(SpriteLampShader, "sl_EmissiveMap");

//Sprite Lamp variables that are handled by scripts
u_LightPos = shader_get_uniform(SpriteLampShader, "sl_LightPos");
u_SpriteAngle = shader_get_uniform(SpriteLampShader, "sl_SpriteAngle");
u_TextureRes = shader_get_uniform(SpriteLampShader, "sl_TextureRes");
u_LightColour = shader_get_uniform(SpriteLampShader, "sl_LightColour");

//Sprite Lamp variables that are set by the user
u_CelLevel = shader_get_uniform(SpriteLampShader, "sl_CelLevel");
u_Shininess = shader_get_uniform(SpriteLampShader, "sl_Shininess");
u_WrapAroundLevel = shader_get_uniform(SpriteLampShader, "sl_WrapAroundLevel");
u_AOStrength = shader_get_uniform(SpriteLampShader, "sl_AOStrength");
u_EmissiveStrength = shader_get_uniform(SpriteLampShader, "sl_EmissiveStrength");
u_AmplifyDepth = shader_get_uniform(SpriteLampShader, "sl_AmplifyDepth");

u_UpperAmbientColour = shader_get_uniform(SpriteLampShader, "sl_UpperAmbientColour");
u_LowerAmbientColour = shader_get_uniform(SpriteLampShader, "sl_LowerAmbientColour");
/********************************************************************************/



/********************************************************************************/
//Set your different maps here! Note that your diffuse map isn't done this way - 
//diffuse comes from whatever image is assigned to the object in the usual fashion.
normalDepthTexture = sprite_get_texture(pipage3_n, 0);
specGlossMap = sprite_get_texture(pipage, 0);
aoMap = sprite_get_texture(pipage, 0);
emissiveMap = sprite_get_texture(pipage, 0);
//(note - this example doesn't have an emissive map so I'm using the diffuse map as
//a dummy and turning the emissive strength variable to zero. Eventually I'll have
//a couple of versions of the shader, so if you're not using certain features you
//done have to screw around with this kind of thing)


//Set shader variables here. Note that they get sent every frame,
//so feel free to change these values in script during play.
celLevel = 0.0;
shininess = 0.0;
wrapAroundLevel = 0.0;
aoStrength = 0.0;
emissiveStrength = 0.0;
amplifyDepth = 0.0;


//Set texture resolution - needed for self-shadows. Presumably there is some way
//to automate this process - if you know how, tell me!
textureWidth = 58;
textureHeight = 160;


//Ambient colour components.
upperAmbient_Red = 0.4;
upperAmbient_Green = 0.4;
upperAmbient_Blue = 0.4;

lowerAmbient_Red = 0.4;
lowerAmbient_Green = 0.4;
lowerAmbient_Blue = 0.4;


//The nearest lightsource.
lightSource = instance_nearest(x,y,light_source_obj);
