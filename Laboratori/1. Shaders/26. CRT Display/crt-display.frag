#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform int n = 1;

void main() {
<<<<<<< HEAD
    float yCoord = gl_FragCoord.y;
    if (int(yCoord)%n != 0) discard;
=======
    if (int(gl_FragCoord.y)%n != 0) discard;
>>>>>>> Add lab sessions and missing shader exercices
    fragColor = frontColor;
}
