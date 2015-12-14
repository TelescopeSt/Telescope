generation - connection
createElementConnection: aTLConnection From: fromNode to: toNode
	| edge fromElement toElement effectiveStylesheet |
	self flag: 'the shape logic of edge is not good'.
	effectiveStylesheet := aTLConnection effectiveStyleSheet.
	fromElement := self elementFromTLDrawable: fromNode.
	toElement := self elementFromTLDrawable: toNode.
	edge := (self obtainEdgeShapeFromStylesheet: effectiveStylesheet) edgeFrom: fromElement to: toElement.
	self customizeEdgeShape: edge withStyleSheet: effectiveStylesheet.
			
	"edge trachelShape pushBack."
	^ edge