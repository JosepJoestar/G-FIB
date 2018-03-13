#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 2) in vec3 color;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float time;

void main() {
    float phi = 0.4 * vertex.y * sin(time);
    float c = cos(phi), s = sin(phi);
    mat3 rot = mat3(
        vec3(c, 0, -s),
        vec3(0, 1, 0),
        vec3(s, 0, c)
    );

    frontColor = vec4(color, 1.0);
    gl_Position = modelViewProjectionMatrix * vec4(rot * vertex, 1.0);
}
