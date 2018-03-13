#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform vec2 Min = vec2(-1, -1);
uniform vec2 Max = vec2(1, 1);

float norm(float value, float mi, float ma) {
    return (value - mi) / (ma - mi);
}

void main() {
    float s = norm(texCoord.s, 0, 1);
    float t = norm(texCoord.t, 0, 1);
    frontColor = vec4(color, 1);
    gl_Position = vec4(s, t, 0 , 1.0);
}
