removing - node
removeSimpleNode: aNode
	| shape |
	shape := self elementFromTLDrawable: aNode.
	self removeElementNodeFromView: shape.
	self shapeByDrawable removeKey: aNode.
	self removeInteractionsOf: aNode.