executeInteraction
executeMultiChoice: aChoiceIndex menuInteraction: anEntryIndex onDrawableId: aDrawableId
	| drawable |
	drawable := self tlDrawableFromId: aDrawableId.
	self
		executeChoice: aChoiceIndex
		interaction: ((drawable allInteractions select: #isMenu) at: anEntryIndex)
		forDrawable: drawable referencedElement