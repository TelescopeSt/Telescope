convenience
obtain: aValuableorObject on: anObject
	"This method will try to apply the valuable on the object; in succeed case, this method will return the result; otherwise it will return the ValuableorObject"

	^ (aValuableorObject isSymbol or: [ aValuableorObject isBlock ])
		ifTrue: [ aValuableorObject value: anObject ]
		ifFalse: [ aValuableorObject ]