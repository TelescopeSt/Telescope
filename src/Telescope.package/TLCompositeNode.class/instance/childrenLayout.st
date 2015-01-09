accessing
childrenLayout
	childrenLayout ifNil: [ childrenLayout :=  self defaultLayout ].
	^ childrenLayout