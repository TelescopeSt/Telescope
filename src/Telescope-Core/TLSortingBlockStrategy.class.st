"
Description
--------------------

I am a strategy where the user can directly use a sorting block to sort the elements.
"
Class {
	#name : #TLSortingBlockStrategy,
	#superclass : #TLSortingStrategy,
	#instVars : [
		'sortingBlock'
	],
	#category : #'Telescope-Core-Strategy'
}

{ #category : #'instance creation' }
TLSortingBlockStrategy class >> sortingBlock: aBlock [
	^ self new
		sortingBlock: aBlock;
		yourself
]

{ #category : #sorting }
TLSortingBlockStrategy >> sortNodes: aCollectionOfTLNodes [
	aCollectionOfTLNodes sort: self sortingBlock
]

{ #category : #accessing }
TLSortingBlockStrategy >> sortingBlock [
	^ sortingBlock
]

{ #category : #accessing }
TLSortingBlockStrategy >> sortingBlock: anObject [
	sortingBlock := anObject
]
