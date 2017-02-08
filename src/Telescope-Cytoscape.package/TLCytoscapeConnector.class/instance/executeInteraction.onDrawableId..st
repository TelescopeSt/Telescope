executing - interaction
executeInteraction: aKindOfInteraction onDrawableId: aDrawableId
	| drawable interactions |
	drawable := self tlDrawableFromId: aDrawableId.
	interactions := drawable allInteractions
		select: [ :anInteraction | anInteraction shouldOccursOn: aKindOfInteraction with: drawable ].
	interactions ifEmpty: [ self sendAcknowledgeReceiptFor: drawable referencedElement ]
		ifNotEmpty:[ interactions do: [ :anInteraction | 
			self flag: 'dirty, will need a refactor'.
			aKindOfInteraction = #mouseOver
				ifTrue: [ self executeRegularInteraction: anInteraction forDrawable: drawable ]
				ifFalse: [ 
					aKindOfInteraction = #mouseOut
						ifTrue: [ self executeReverseInteraction: anInteraction forDrawable: drawable ]
						ifFalse: [ self executeInteraction: anInteraction forDrawable: drawable referencedElement ] ] ] ]