Class {
	#name : #TLPropertyBasedStrategy,
	#superclass : #TLSortingStrategy,
	#instVars : [
		'property'
	],
	#category : #'Telescope-Core-Strategy'
}

{ #category : #'as yet unclassified' }
TLPropertyBasedStrategy class >> onProperty: aProperty [
	^ self new
		property: aProperty;
		yourself
]

{ #category : #accessing }
TLPropertyBasedStrategy >> property [
	^ property
]

{ #category : #accessing }
TLPropertyBasedStrategy >> property: anObject [
	property := anObject
]

{ #category : #sorting }
TLPropertyBasedStrategy >> sortNodes: aCollectionOfTLNodes [
	aCollectionOfTLNodes
		sort: [ :node1 :node2 | (self property value: node1 entity) <= (self property value: node2 entity) ]
]
