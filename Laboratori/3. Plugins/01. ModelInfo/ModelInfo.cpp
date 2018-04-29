#include "ModelInfo.h"
#include "glwidget.h"

void ModelInfo::onPluginLoad() {
	updateCounters();
}

void ModelInfo::postFrame() {
	cout << "Objects: " << ModelInfo::objectCount << endl;
	cout << "|- Polygons: " << ModelInfo::polygonCount << endl;
	cout << "|   \\- " << ModelInfo::trianglePercent << "\% triangles" << endl;
	cout << "\\- Vertices: " << ModelInfo::vertexCount << endl << endl;
}

void ModelInfo::onObjectAdd() {
	updateCounters();
}

void ModelInfo::onSceneClear() {
	updateCounters();
}

void ModelInfo::updateCounters() {
	int polygonCount = 0;
	int triangleCount = 0;
	int vertexCount = 0;
	for (Object obj : scene()->objects()) {
		polygonCount += obj.faces().size();
		for (Face f : obj.faces())
			if (f.numVertices() == 3)
				++triangleCount;
		vertexCount += obj.vertices().size();
	}
	float percent = triangleCount == 0 ? 0 : ((float) triangleCount / (float) polygonCount) * 100;

	ModelInfo::objectCount = scene()->objects().size();
	ModelInfo::polygonCount = polygonCount;
	ModelInfo::vertexCount = vertexCount;
	ModelInfo::trianglePercent = percent;
}