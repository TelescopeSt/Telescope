Extension { #name : #Object }

{ #category : #'*Telescope' }
Object >> isEvaluable [
	^ self isBlock or: [ self isSymbol ]
]
