instance creation
polygonPoints
	"In order to define some shapes, framworks can take a set of points. This method should return a collection of points ranging on [-1, 1]. This represents the points in the polygon for the node’s shape. The bounding box of the node is given by (-1, 1), (1, 1), (1, -1), (-1, -1)."

	^ self subclassResponsibility