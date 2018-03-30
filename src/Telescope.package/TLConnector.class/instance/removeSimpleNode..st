removing - node
removeSimpleNode: aNode
	[ | element |
	element := self elementFromTLDrawable: aNode.
	self removeElementFromView: element associatedToDrawable: aNode.
	self unregisterShapeForDrawable: aNode.
	self removeInteractionsOf: aNode.
	aNode connections
		do: [ :aConnection | 
			[ aConnection removeWith: self ]
				on: KeyNotFound
				do: [ "Here the connection was with another node still removed" ] ] ]
		on: KeyNotFound
		do: [ "A node might not be visible on the visualisation and thus does not have a shape" self flag: #toCheck. "Cyril: There was a bug here but I don't know Telescope enough to be 100% sure of waht to do." ]