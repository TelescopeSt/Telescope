"
i am the abstract superclass for all sorting strategies
"
Class {
	#name : #TLSortingStrategy,
	#superclass : #TLObject,
	#category : #'Telescope-Core-Strategy'
}

{ #category : #sorting }
TLSortingStrategy >> sortNodes: aCollectionOfTLNodes [
	self subclassResponsibility 
]
