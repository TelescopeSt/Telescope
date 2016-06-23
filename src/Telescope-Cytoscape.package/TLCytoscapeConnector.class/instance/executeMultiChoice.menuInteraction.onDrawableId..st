executing - interaction
executeMultiChoice: aChoiceIndex menuInteraction: anEntryIndex onDrawableId: aDrawableId
	| drawable |
	drawable := self tlDrawableFromId: aDrawableId.
	self
		executeChoice: aChoiceIndex
		interaction:
			((drawable allInteractions
				select: [ :anInteraction | anInteraction isMenu and: [ anInteraction condition value: drawable ] ]) at: anEntryIndex)
		forDrawable: drawable referencedElement