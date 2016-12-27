private
obtainTargetDrawablesFrom: aTLDrawable
	^ (self target ifNotNil: [ :t | t value: aTLDrawable ] ifNil: [ aTLDrawable ]) asOrderedCollection