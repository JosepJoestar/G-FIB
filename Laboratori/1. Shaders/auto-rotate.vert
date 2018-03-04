#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float speed = 0.5;
uniform float time;

void main() {
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color, 1.0);
    float phi = speed * time;
    float c = cos(phi), s = sin(phi);
    vec3 vtx = mat3(
        vec3(c, 0, -s),
        vec3(0, 1, 0),
        vec3(s, 0, c)
    ) * vertex;
    gl_Position = modelViewProjectionMatrix * vec4(vtx, 1.0);
}
