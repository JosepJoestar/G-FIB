#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;

out vec3 N;
out vec4 frontColor;

uniform mat3 normalMatrix;
uniform mat4 modelViewProjectionMatrix;

void main() {
    N = normalMatrix * normal;
    frontColor = vec4(color, 1);
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1);
}
