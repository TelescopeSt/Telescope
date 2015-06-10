removing - node
removeSimpleNode: aNode
	| shape |
	shape := self elementFromTLDrawable: aNode.
	self removeElementNodeFromView: shape.
	self shapeByDrawable removeKey: aNode.
	self removeInteractionsOf: aNode.
	aNode allConnections do: [:aConnection | [aConnection removeWith: self] on: KeyNotFound do: ["Here the connection was with another node still removed"]].