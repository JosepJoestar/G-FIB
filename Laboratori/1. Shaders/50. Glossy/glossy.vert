#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 3) in vec2 texCoord;

out vec3 V;
out vec3 N;
out vec2 vtexCoord;

uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 modelViewProjectionMatrix;

void main() {
    V = (modelViewMatrix * vec4(vertex, 1)).xyz;
    N = normalMatrix * normal;
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1);
}
