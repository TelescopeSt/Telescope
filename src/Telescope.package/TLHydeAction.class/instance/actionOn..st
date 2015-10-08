action
actionOn: aTLDrawable
	self drawableToHyde isVisible 
			ifTrue: [ self drawableToHyde hide ]
			ifFalse: [ self drawableToHyde show ]