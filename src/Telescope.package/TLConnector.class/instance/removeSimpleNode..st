removing - node
removeSimpleNode: aNode
	| element |
	element := self elementFromTLDrawable: aNode.
	self removeElementFromView: element associatedToDrawable: aNode.
	self shapeByDrawable removeKey: aNode.
	self removeInteractionsOf: aNode.
	aNode connections do: [:aConnection | [aConnection removeWith: self] on: KeyNotFound do: ["Here the connection was with another node still removed"]].