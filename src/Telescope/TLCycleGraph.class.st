"
A TLCycleGraph is work in progress

Instance Variables
	data:		<Object>
	nextProperty:		<Object>
	objectAdded:		<Object>
	rank:		<Object>

data
	- xxxxx

nextProperty
	- xxxxx

objectAdded
	- xxxxx

rank
	- xxxxx

"
Class {
	#name : #TLCycleGraph,
	#superclass : #TLVisualization,
	#instVars : [
		'data',
		'nextProperty',
		'rank',
		'objectAdded'
	],
	#category : 'Telescope-Visualizations'
}

{ #category : #'as yet unclassified' }
TLCycleGraph >> addNewObject: obj atRank: nextRank [
	self rank at: obj put: nextRank.
	self > nextRank addNodeFromEntity: obj.
	self > nextRank layout: (TLLinearLayout topToBottom gap: 30).
	^ self buildCycleStartingAt: obj
]

{ #category : #'as yet unclassified' }
TLCycleGraph >> buildCycleStartingAt: anObject [
	| next nextRank currentRank |
	next := anObject perform: self nextProperty.
	currentRank := self rank at: anObject.
	next
		ifNotEmpty: [ 
			next
				do: [ :obj | 
					nextRank := currentRank + 1.
					self rank
						at: obj
						ifPresent: [ :r | nextRank := r ]
						ifAbsent: [ 
							self rank at: obj put: nextRank.
							self objectAdded at: obj put: false.
							self > nextRank addNodeFromEntity: obj.
							self > nextRank layout: (TLLinearLayout topToBottom gap: 30) ].
					self > currentRank connectInsideGroupEntity: anObject toEntity: obj FromAnotherGroup: self > nextRank ].
			self objectAdded at: anObject put: true.
			next
				do: [ :obj | 
					(self objectAdded at: obj)
						ifFalse: [ self buildCycleStartingAt: obj ] ] ]
]

{ #category : #'as yet unclassified' }
TLCycleGraph >> buildVisualization [
	| first |
	first := self data first.
	self rank at: first put: 0.
	(self > 0) addNodeFromEntity: first.
	self buildCycleStartingAt: first.
	(self > 0) layout: (TLLinearLayout topToBottom gap: 30).
	self layout: (RTCircleLayout "new gapSize: 30").
]

{ #category : #accessing }
TLCycleGraph >> data [
	^ data
]

{ #category : #accessing }
TLCycleGraph >> data: anObject [
	data := anObject
]

{ #category : #accessing }
TLCycleGraph >> nextProperty [
	^ nextProperty
]

{ #category : #accessing }
TLCycleGraph >> nextProperty: anObject [
	nextProperty := anObject
]

{ #category : #accessing }
TLCycleGraph >> objectAdded [
	objectAdded ifNil: [ self objectAdded: Dictionary new ].
	^ objectAdded
]

{ #category : #accessing }
TLCycleGraph >> objectAdded: anObject [
	objectAdded := anObject
]

{ #category : #accessing }
TLCycleGraph >> rank [
	rank ifNil: [ self rank: Dictionary new ].
	^ rank
]

{ #category : #accessing }
TLCycleGraph >> rank: anObject [
	rank := anObject
]
