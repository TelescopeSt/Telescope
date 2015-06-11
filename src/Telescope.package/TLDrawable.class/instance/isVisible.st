accessing
isVisible
	^ isVisible and: [ self parent isNil ifTrue: [ true ] ifFalse: [self parent isVisible] ]