"
I am a strategy that will keep the order of the stuff i am applied on
"
Class {
	#name : #TLKeepingOrderStrategy,
	#superclass : #TLSortingStrategy,
	#category : #'Telescope-Core-Strategies'
}

{ #category : #sorting }
TLKeepingOrderStrategy >> sortNodes: aCollectionOfTLNodes [
	"I do nothing"
	^ aCollectionOfTLNodes
]
