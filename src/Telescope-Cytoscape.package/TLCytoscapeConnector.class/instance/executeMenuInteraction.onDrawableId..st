interaction
executeMenuInteraction: anEntryIndex onDrawableId: aDrawableId
	| drawable |
	drawable := self tlDrawableFromId: aDrawableId.
	self
		executeInteraction:
			((drawable allInteractions
				select: [ :anInteraction | anInteraction isMenu and: [ anInteraction condition value: drawable ] ]) at: anEntryIndex)
		forDrawable: drawable referencedElement