#version 330 core

in vec3 V;
in vec3 N;
in vec2 vtexCoord;

out vec4 fragColor;

uniform int r = 0;
uniform sampler2D texture0;
uniform vec4 lightPosition;

const int W = 256;
const int H = 256;

vec4 sphereMapTex(sampler2D tex, vec3 R) {
    float z = sqrt((R.z + 1)/2);
    vec2 st = vec2(
        (R.x/(2*z) + 1)/2,
        (R.y/(2*z) + 1)/2
    );
    return texture(tex, st);
}

vec4 sampleTexture(sampler2D sampler, vec2 st, int r, vec3 R)  {
    vec4 acc = vec4(0);
    for (int i = -r; i <= r; ++i) {
        for (int j = -r; j <= r; ++j) {
            acc += texture(sampler, vec2(st.s + i/W, st.t + j/H));
        }
    }
    acc.xyz = acc.xyz / pow(2*r + 1, 2);
    return acc;
}

void main() {
    vec3 L = normalize(lightPosition.xyz - V);
    vec3 R = reflect(-L, N);
    fragColor = sampleTexture(texture0, vtexCoord, r, R);
}
