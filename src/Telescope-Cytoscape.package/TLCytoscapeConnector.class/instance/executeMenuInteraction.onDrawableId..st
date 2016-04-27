interaction
executeMenuInteraction: anEntryIndex onDrawableId: aDrawableId
	| drawable |
	drawable := self tlDrawableFromId: aDrawableId.
	self
		executeInteraction: ((drawable allInteractions select: #isMenu) at: anEntryIndex)
		forDrawable: drawable referencedElement