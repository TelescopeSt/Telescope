"
I am a binary tree of clusters. A leaf holds an item and the vector which describes it, and a node joins two clusters. #singleLinkageOf: builds the tree from leaves by joining again and again the two closest clusters, the distance between two clusters being the one of their two closest leaves, and the distance between two leaves being the cosine distance of their vectors. #orderLeaves turns the clusters so that the leaves which are next to each other are the closest ones, and #items answers the items in that order.
"
Class {
	#name : 'TLDendrogram',
	#superclass : 'Object',
	#instVars : [
		'item',
		'vector',
		'left',
		'right'
	],
	#category : 'Telescope-VisualizationTemplates',
	#package : 'Telescope-VisualizationTemplates'
}

{ #category : 'private' }
TLDendrogram class >> closestAmong: activeIndexes in: distances [
	"The indexes of the two closest clusters, as an association from the first one to the second one. The first pair wins when several are as close"

	| closest smallest |
	smallest := Float infinity.
	activeIndexes doWithIndex: [ :column :position |
		(activeIndexes first: position - 1) do: [ :row | | distance |
			distance := (distances at: row) at: column.
			distance < smallest ifTrue: [ smallest := distance. closest := row -> column ] ] ].
	^ closest
]

{ #category : 'private' }
TLDendrogram class >> cosineDistanceBetween: aVector and: anotherVector [
	"1 minus the cosine of the angle between the vectors. A vector without any value has no direction, so it is at a distance of 1 of every other vector"

	^ 1 - (((self unitVectorOf: aVector) with: (self unitVectorOf: anotherVector) collect: [ :first :second | first * second ]) inject: 0 into: [ :sum :product | sum + product ])
]

{ #category : 'instance creation' }
TLDendrogram class >> item: anObject vector: aCollectionOfNumbers [
	"A leaf"

	^ self new setItem: anObject vector: aCollectionOfNumbers
]

{ #category : 'instance creation' }
TLDendrogram class >> left: aDendrogram right: anotherDendrogram [
	"A node which joins two clusters"

	^ self new setLeft: aDendrogram right: anotherDendrogram
]

{ #category : 'instance creation' }
TLDendrogram class >> singleLinkageOf: aCollectionOfLeaves [
	"Answers the tree which joins the leaves, or nil when there is none. When some distances are the same, the first clusters in the order of the leaves are joined"

	| clusters distances active |
	aCollectionOfLeaves ifEmpty: [ ^ nil ].
	clusters := aCollectionOfLeaves asArray.
	distances := clusters collect: [ :first | clusters collect: [ :second | self cosineDistanceBetween: first vector and: second vector ] ].
	active := (1 to: clusters size) asOrderedCollection.
	[ active size > 1 ] whileTrue: [ | closest |
		closest := self closestAmong: active in: distances.
		active remove: closest value.
		active do: [ :other |
			other = closest key ifFalse: [ | distance |
				distance := ((distances at: closest key) at: other) min: ((distances at: closest value) at: other).
				(distances at: closest key) at: other put: distance.
				(distances at: other) at: closest key put: distance ] ].
		clusters at: closest key put: (self left: (clusters at: closest key) right: (clusters at: closest value)) ].
	^ clusters at: active first
]

{ #category : 'private' }
TLDendrogram class >> unitVectorOf: aVector [
	| length |
	length := (aVector inject: 0 into: [ :sum :value | sum + (value * value) ]) sqrt.
	^ length isZero
		ifTrue: [ aVector ]
		ifFalse: [ aVector collect: [ :value | value / length ] ]
]

{ #category : 'ordering' }
TLDendrogram >> distanceTo: aDendrogram [
	"The mean of the squared euclidean distances between the leaves of the two clusters"

	| sum |
	sum := 0.
	self leaves do: [ :first |
		aDendrogram leaves do: [ :second |
			sum := sum + ((first vector with: second vector collect: [ :one :another | (one - another) squared ]) inject: 0 into: [ :total :square | total + square ]) ] ].
	^ sum / (self leaves size * aDendrogram leaves size) asFloat
]

{ #category : 'ordering' }
TLDendrogram >> firstChild [
	"A leaf is its own children"

	^ self isLeaf ifTrue: [ self ] ifFalse: [ left ]
]

{ #category : 'testing' }
TLDendrogram >> isLeaf [
	^ left isNil
]

{ #category : 'accessing' }
TLDendrogram >> item [
	^ item
]

{ #category : 'accessing' }
TLDendrogram >> items [
	"The items of the leaves, from the left to the right"

	^ self leaves collect: #item
]

{ #category : 'accessing' }
TLDendrogram >> leaves [
	^ self isLeaf
		ifTrue: [ { self } ]
		ifFalse: [ left leaves , right leaves ]
]

{ #category : 'ordering' }
TLDendrogram >> orderLeaves [
	"Turns the clusters, from the top of the tree to its leaves, so that the two of them which are the closest are side by side. Answers the tree"

	| options |
	self isLeaf ifTrue: [ ^ self ].
	options := {
		(left firstChild distanceTo: right firstChild) -> [ left swapChildren ].
		(left firstChild distanceTo: right secondChild) -> [ left swapChildren. right swapChildren ].
		(left secondChild distanceTo: right firstChild) -> [  ].
		(left secondChild distanceTo: right secondChild) -> [ right swapChildren ] }.
	(options copy sort: [ :first :second | first key < second key ]) first value value.
	left orderLeaves.
	right orderLeaves
]

{ #category : 'ordering' }
TLDendrogram >> secondChild [
	^ self isLeaf ifTrue: [ self ] ifFalse: [ right ]
]

{ #category : 'initialization' }
TLDendrogram >> setItem: anObject vector: aCollectionOfNumbers [
	item := anObject.
	vector := aCollectionOfNumbers
]

{ #category : 'initialization' }
TLDendrogram >> setLeft: aDendrogram right: anotherDendrogram [
	left := aDendrogram.
	right := anotherDendrogram
]

{ #category : 'ordering' }
TLDendrogram >> swapChildren [
	| swap |
	self isLeaf ifTrue: [ ^ self ].
	swap := left.
	left := right.
	right := swap
]

{ #category : 'accessing' }
TLDendrogram >> vector [
	"The vector of a leaf"

	^ vector
]
