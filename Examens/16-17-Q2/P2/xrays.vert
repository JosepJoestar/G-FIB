#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 3) in vec2 texCoord;

out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;

void main() {
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex * vec3(0.5, 1, 1), 1);
}
