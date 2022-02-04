Extension { #name : #Object }

{ #category : #'*Telescope-Core' }
Object >> isEvaluable [
	^ self isBlock or: [ self isSymbol ]
]
