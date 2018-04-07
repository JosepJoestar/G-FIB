#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform vec2 Min = vec2(-1, -1);
uniform vec2 Max = vec2(1, 1);

float norm(float value, float mi, float ma) {
<<<<<<< HEAD
    return (value - mi) / (ma - mi);
}

void main() {
    float s = norm(texCoord.s, 0, 1);
    float t = norm(texCoord.t, 0, 1);
    frontColor = vec4(color, 1);
    gl_Position = vec4(s, t, 0 , 1.0);
=======
    float dif = ma - mi;
    return fract(value)*dif - dif/2;
}

void main() {
    frontColor = vec4(color, 1);
    float s = norm(texCoord.s, Min.x, Max.x);
    float t = norm(texCoord.t, Min.y, Max.y);
    gl_Position = vec4(s, t, 0 , 1);
>>>>>>> Add lab sessions and missing shader exercices
}
