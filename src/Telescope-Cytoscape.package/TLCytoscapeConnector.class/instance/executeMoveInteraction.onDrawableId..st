executing - interaction
executeMoveInteraction: aDrawablePosition onDrawableId: aDrawableId
	| aDrawable |
	aDrawable := self tlDrawableFromId: aDrawableId.
	(self elementFromTLDrawable: aDrawable) defineFixedPositionFromAbsolute: aDrawablePosition.
	(aDrawable allValidInteractionsOfKind: TLNodeMovedInteraction)
		do: [ :anInteraction | self executeRegularInteraction: anInteraction forDrawable: aDrawable referencedElement ]