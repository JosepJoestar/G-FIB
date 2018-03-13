#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

float scaleVert(float y, float ma, float mi) {
    return (y - mi) / (ma  - mi);
}

vec4 getFrontColor(float height) {
    if (height < -0.5)
        return mix(vec4(1, 0, 0, 1), vec4(1, 1, 0, 1), scaleVert(height, -0.5, -1.0));
    else if (height < 0.0)
        return mix(vec4(1, 1, 0, 1), vec4(0, 1, 0, 1), scaleVert(height, 0.0, -0.5));
    else if (height < 0.5)
        return mix(vec4(0, 1, 0, 1), vec4(0, 1, 1, 1), scaleVert(height, 0.5, 0.0));
    else
        return mix(vec4(0, 1, 1, 1), vec4(0, 0, 1, 1), scaleVert(height, 1.0, 0.5));
}

void main()
{
    vec4 vtx = modelViewProjectionMatrix * vec4(vertex, 1.0);
    frontColor = getFrontColor(vtx.y / vtx.w);
    gl_Position = vtx;
}
