generation - interaction
placeElement: anElement correspondingToTrigger: aTLShapeTrigger2 relativeToDrawable: aTLCompositeNode
	| element |
	element := self elementFromTLDrawable: aTLCompositeNode.
	TRConstraint
		stick: anElement trachelShape
		onTheRightOf:
			(element shape isComposite
				ifTrue: [ element trachelShape shape2 ]
				ifFalse: [ element trachelShape ])