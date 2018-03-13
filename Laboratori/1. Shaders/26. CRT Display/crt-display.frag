#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform int n = 1;

void main() {
    float yCoord = gl_FragCoord.y;
    if (int(yCoord)%n != 0) discard;
    fragColor = frontColor;
}
