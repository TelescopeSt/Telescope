private
obtainTargetDrawablesFrom: aTLDrawable
	^ (self target ifNotNil: [ self target value: aTLDrawable ] ifNil: [ aTLDrawable ]) asOrderedCollection