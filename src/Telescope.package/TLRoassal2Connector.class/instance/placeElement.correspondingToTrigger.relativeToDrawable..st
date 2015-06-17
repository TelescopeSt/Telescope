generation - interaction
placeElement: anElement correspondingToTrigger: aTLShapeTrigger relativeToDrawable: aTLCompositeNode
	| element |
	element := self elementFromTLDrawable: aTLCompositeNode.
	TRConstraint
		stick: anElement trachelShape
		onTheRightOf:
			(element shape isComposite
				ifTrue: [ element trachelShape shapes second ]
				ifFalse: [ element trachelShape ])