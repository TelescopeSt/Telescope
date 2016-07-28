executing - interaction
executeMoveInteraction: aDrawablePosition onDrawableId: aDrawableId
	| aDrawable |
	aDrawable := self tlDrawableFromId: aDrawableId.
	(self elementFromTLDrawable: aDrawable)
		in: [ :anElement | 
			self movedNodesRelativePositionByElement
				at: anElement
				put: (anElement calculateRelativePositionFromAbsolute: aDrawablePosition) ].
	(aDrawable allValidInteractionsOfKind: TLNodeMovedInteraction)
		do: [ :anInteraction | self executeRegularInteraction: anInteraction forDrawable: aDrawable referencedElement ]