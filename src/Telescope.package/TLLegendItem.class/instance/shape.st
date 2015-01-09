accessing
shape
	shape ifNil: [ self shape: self defaultShape ].
	^ shape