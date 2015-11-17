accessing
compositeProperty: anObject
	compositeProperty := anObject.
	anObject ifNotNil: [ self childrenStrategy ifNil: [ self childrenStrategy: self class default ] ].
	^ self childrenStrategy