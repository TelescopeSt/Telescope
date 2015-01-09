generation - node
createElementNodeFromNode: aNode
	| element shape |
	shape := aNode shape generateWith: self.
	element := shape elementOn: aNode entity.
	^ element