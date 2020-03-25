/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

/*
shader_set(SpriteLampShader);

shader_set_uniform_f(u_SpriteAngle, image_angle * pi / 180.0);
shader_set_uniform_f(u_TextureRes, textureWidth, textureHeight);
shader_set_uniform_f(u_LightPos,
        lightSource.cameraSpacePosX, lightSource.cameraSpacePosY,
        lightSource.zPosition);
shader_set_uniform_f(u_LightColour,
        lightSource.colourRed, lightSource.colourGreen, lightSource.colourBlue);
         
         
texture_set_stage(u_NormalDepthMap, normalDepthTexture);
texture_set_stage(u_SpecGlossMap, specGlossMap);
texture_set_stage(u_AOMap, aoMap);
texture_set_stage(u_EmissiveMap, emissiveMap);

shader_set_uniform_f(u_CelLevel, celLevel);
shader_set_uniform_f(u_Shininess, shininess);
shader_set_uniform_f(u_WrapAroundLevel, wrapAroundLevel);
shader_set_uniform_f(u_AOStrength, aoStrength);
shader_set_uniform_f(u_EmissiveStrength, emissiveStrength);
shader_set_uniform_f(u_AmplifyDepth, amplifyDepth);

shader_set_uniform_f(u_UpperAmbientColour, 
        upperAmbient_Red, upperAmbient_Green, upperAmbient_Blue);
shader_set_uniform_f(u_LowerAmbientColour,
        lowerAmbient_Red, lowerAmbient_Green, lowerAmbient_Blue);

*/
draw_self();
/*
shader_reset();
