executing - interaction
executeInteraction: aKindOfInteraction onDrawableId: aDrawableId
	| drawable |
   drawable := self tlDrawableFromId: aDrawableId.
	drawable allInteractions
		select: [ :anInteraction | anInteraction shouldOccursOn: aKindOfInteraction with: drawable ]
		thenDo: [ :anInteraction | 
			self flag: 'dirty, will need a refactor'.
			aKindOfInteraction = #mouseOver
				ifTrue: [ self executeRegularInteraction: anInteraction forDrawable: drawable ]
				ifFalse: [ 
					aKindOfInteraction = #mouseOut
						ifTrue: [ self executeReverseInteraction: anInteraction forDrawable: drawable ]
						ifFalse: [ 'on'crLog.self executeInteraction: anInteraction forDrawable: drawable referencedElement ] ] ]