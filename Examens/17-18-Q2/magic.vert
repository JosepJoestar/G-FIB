#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 3) in vec2 texCoord;

out vec2 vtexCoord;
out vec3 N;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main() {
    N = normalMatrix * normal;
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1);
}
