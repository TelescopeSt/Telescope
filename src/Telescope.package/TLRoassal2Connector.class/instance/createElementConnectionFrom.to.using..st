generation - connection
createElementConnectionFrom: fromNode to: toNode using: aShape
	| edge fromElement toElement |
	self flag: 'the shape logic of edge is not good'.
	fromElement := self elementFromTLDrawable: fromNode.
	toElement := self elementFromTLDrawable: toNode.
	edge := aShape edgeFrom: fromElement to: toElement.
	"edge trachelShape pushBack."
	^ edge