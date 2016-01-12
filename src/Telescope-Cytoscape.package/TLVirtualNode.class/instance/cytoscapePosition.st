as yet unclassified
cytoscapePosition
	"Cytoscape require the center of the node and Telescope works with left upper corner"
	^ self relativePositionToParentNodeOrAbsolute + (self dimension / 2)