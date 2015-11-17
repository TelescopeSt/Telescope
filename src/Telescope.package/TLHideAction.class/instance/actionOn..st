action
actionOn: aTLDrawable
	| drawablesToHide |
	drawablesToHide := ([self hidingValuableOrEntity value: aTLDrawable] on: MessageNotUnderstood do: [self hidingValuableOrEntity]) asOrderedCollection.
	drawablesToHide
		do: [ :aDrawableToHide | 
			aDrawableToHide isVisible
				ifTrue: [ aDrawableToHide hide ]
				ifFalse: [ aDrawableToHide show ] ]