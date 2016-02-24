actions
executeInteraction: aKindOfInteraction onDrawableId: aDrawableId
	| drawable |
	drawable := self tlDrawableFromId: aDrawableId.
	drawable allInteractions
		select: [ :anInteraction | anInteraction kind = aKindOfInteraction and: [ anInteraction condition value: drawable ] ]
		thenDo: [ :anInteraction | self executeInteraction: anInteraction forDrawable: drawable referencedElement ]