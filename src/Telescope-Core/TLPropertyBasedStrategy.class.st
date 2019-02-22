"
Sorting startegies according to the order of a property they have.

I can be parametrized with a sorting direction (ascending or descending). By default I am ascending.
"
Class {
	#name : #TLPropertyBasedStrategy,
	#superclass : #TLSortingStrategy,
	#instVars : [
		'property',
		'isAscending'
	],
	#category : #'Telescope-Core-Strategy'
}

{ #category : #'instance creation' }
TLPropertyBasedStrategy class >> onProperty: aProperty [
	^ self new
		property: aProperty;
		yourself
]

{ #category : #options }
TLPropertyBasedStrategy >> ascending [
	isAscending := true
]

{ #category : #options }
TLPropertyBasedStrategy >> descending [
	isAscending := false
]

{ #category : #initialization }
TLPropertyBasedStrategy >> initialize [ 
	super initialize.
	self ascending
]

{ #category : #accessing }
TLPropertyBasedStrategy >> isAscending [
	^ isAscending
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
	| node1Value node2Value |
	aCollectionOfTLNodes
		sort: [ :node1 :node2 | 
			node1Value := self property value: node1 entity.
			node2Value := self property value: node2 entity.
			[ self isAscending
				ifTrue: [ node1Value <= node2Value ]
				ifFalse: [ node1Value >= node2Value ] ]
				on: MessageNotUnderstood
				do: [ false ] ]
]
