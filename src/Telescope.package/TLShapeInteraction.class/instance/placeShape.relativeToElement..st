as yet unclassified
placeShape: aRTInteractionElement relativeToElement: aRTElement
	| s |
	self flag: 'ugly, should be removed'.
	s := aRTElement shape isComposite
		ifTrue: [ aRTElement trachelShape shape2 ]
		ifFalse: [ aRTElement trachelShape ].
	TRConstraint stick: aRTInteractionElement trachelShape onTheRightOf: s