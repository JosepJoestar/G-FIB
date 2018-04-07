#version 330 core

in vec4 frontColor;
in vec3 V;
in vec3 N;

out vec4 fragColor;

uniform float epsilon = 0.1;
uniform float light = 0.5;

void main() {
<<<<<<< HEAD
    if (abs(dot(normalize(V), normalize(N))) < epsilon) {
        fragColor = vec4(0.7, 0.6, 0, 1);
    } else {
        fragColor = frontColor * light;
    }
=======
    fragColor = (abs(dot(normalize(V), normalize(N))) < epsilon)
        ? vec4(.7, .6, 0, 1) : frontColor * light;
>>>>>>> Add lab sessions and missing shader exercices
}
