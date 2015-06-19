generation - interaction
placeElement: anElement correspondingToTrigger: aTLShapeTrigger relativeToDrawable: aTLCompositeNode
	| element |
	element := self elementFromTLDrawable: aTLCompositeNode.
	TLRoassal2ShapePlacer place: anElement trachelShape relativeTo: (element shape isComposite
				ifTrue: [ element trachelShape shapes second ]
				ifFalse: [ element trachelShape ]) following: aTLShapeTrigger effectiveStyleSheet triggerPosition.