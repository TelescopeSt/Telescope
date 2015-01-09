generation - interaction
generateBasicInteraction: aTLInteraction onNode: aTLNode
	| element |
	element := self elementFromTLDrawable: aTLNode.
	element @ aTLInteraction interaction