"
I am a strategy that rely on the #<= comparator method of the entity
"
Class {
	#name : 'TLComparableUsingStrategy',
	#superclass : 'TLSortingStrategy',
	#category : 'Telescope-Core-Strategies',
	#package : 'Telescope-Core',
	#tag : 'Strategies'
}

{ #category : 'sorting' }
TLComparableUsingStrategy >> sortNodes: aCollectionOfTLNodes [
	aCollectionOfTLNodes sort: [ :node1 :node2 | node1 entity <= node2 entity ]
]
