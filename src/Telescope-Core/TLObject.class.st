"
A TLObject is a superclass to group everything that belongs to Telescope.

"
Class {
	#name : #TLObject,
	#superclass : #Object,
	#category : #'Telescope-Core-Model'
}

{ #category : #convenience }
TLObject >> obtain: aValuableorObject on: anObject [
	"This method will try to apply the valuable on the object; in succeed case, this method will return the result; otherwise it will return the ValuableorObject"

	^ (aValuableorObject isSymbol or: [ aValuableorObject isBlock ])
		ifTrue: [ aValuableorObject cull: anObject ]
		ifFalse: [ aValuableorObject ]
]
