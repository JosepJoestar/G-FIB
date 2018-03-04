#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float time;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(0, 0, 1, 1);

    float phi = -time * texCoord.s;
    float c = cos(phi), s = sin(phi);
    mat3 rotate = mat3(
            vec3(c, 0, -s),
            vec3(0, 1, 0),
            vec3(s, 0, c)
        );
    vec3 RV = rotate * vertex;

    gl_Position = modelViewProjectionMatrix * vec4(RV, 1.0);
}
