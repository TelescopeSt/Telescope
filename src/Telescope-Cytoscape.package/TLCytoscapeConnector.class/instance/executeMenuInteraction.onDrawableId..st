interaction
executeMenuInteraction: anEntryName onDrawableId: aDrawableId 
	| drawable |
	drawable := self tlDrawableFromId: aDrawableId.
	drawable allInteractions
		select: [:anInteraction | anInteraction isMenu and: [ anInteraction title = anEntryName ]]
		thenDo: [:anInteraction | self executeInteraction: anInteraction forDrawable: drawable referencedElement]