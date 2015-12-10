generation - connection
createElementConnectionFrom: fromNode to: toNode using: aStylesheet
	| edge fromElement toElement |
	self flag: 'the shape logic of edge is not good'.
	fromElement := self elementFromTLDrawable: fromNode.
	toElement := self elementFromTLDrawable: toNode.
	edge := (self obtainEdgeShapeFromStylesheet: aStylesheet) edgeFrom: fromElement to: toElement.
	self customizeEdgeShape: edge withStyleSheet: aStylesheet.
			
	"edge trachelShape pushBack."
	^ edge