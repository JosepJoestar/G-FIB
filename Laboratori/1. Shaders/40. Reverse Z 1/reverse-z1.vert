#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

void main() {
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vec4 vtx = modelViewProjectionMatrix * vec4(vertex.x, vertex.y, -vertex.z, 1.0);
    gl_Position = vtx;
}
