action
actionOn: aTLDrawable
	self drawableToHide isVisible 
			ifTrue: [ self drawableToHide hide ]
			ifFalse: [ self drawableToHide show ]