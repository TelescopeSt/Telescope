"
I am a layout placing nodes as a tree
"
Class {
	#name : #TLTreeLayout,
	#superclass : #TLLayout,
	#instVars : [
		'levelGap',
		'leavesGap',
		'incomingUsed'
	],
	#category : #'Telescope-Layouts-Core'
}

{ #category : #testing }
TLTreeLayout class >> isConnectionDependant [
	"I use the connections to know the levels of the elements and the adjacent nodes. Thus I am connection dependant."

	^ true
]

{ #category : #private }
TLTreeLayout >> calculateMaxForLevel: aLevel forTree: tree inTable: aTable [
	tree keys
		do: [ :node | 
			| height |
			height := (self obtainsNodeDimension: node) y.
			[ aTable at: aLevel put: (height max: (aTable at: aLevel)) ]
				on: SubscriptOutOfBounds
				do: [ aTable addLast: height ].
			self calculateMaxForLevel: aLevel + 1 forTree: (tree at: node) inTable: aTable ]
]

{ #category : #placing }
TLTreeLayout >> executeOn: aGroup [
	| tree yTable |
	tree := self obtainTreesFromNodes: aGroup.
	yTable := self obtainYtableForTree: tree.
	self
		positionNodesInTree: tree
		yDec: yTable
		level: 1
		xStart: 0
]

{ #category : #accessing }
TLTreeLayout >> gap: aGap [
	self leavesGap: aGap.
	self levelGap: aGap
]

{ #category : #accessing }
TLTreeLayout >> incomingUsed [
	^ incomingUsed
]

{ #category : #accessing }
TLTreeLayout >> incomingUsed: anObject [
	incomingUsed := anObject
]

{ #category : #initialization }
TLTreeLayout >> initialize [
	super initialize.
	self gap: 25.
	self incomingUsed: true
]

{ #category : #accessing }
TLTreeLayout >> leavesGap [
	^ leavesGap
]

{ #category : #accessing }
TLTreeLayout >> leavesGap: anObject [
	leavesGap := anObject
]

{ #category : #accessing }
TLTreeLayout >> levelGap [
	^ levelGap
]

{ #category : #accessing }
TLTreeLayout >> levelGap: anObject [
	levelGap := anObject
]

{ #category : #private }
TLTreeLayout >> obtainTargetedAdjacentNodesFor: aNode [
	^ self incomingUsed
		ifTrue: [ aNode incomingAdjacentNodes ]
		ifFalse: [ aNode outgoingAdjacentNodes ]
]

{ #category : #private }
TLTreeLayout >> obtainTreeWithRoot: root childrenIn: remainingNodes existingTrees: trees [
	^ (self obtainTargetedAdjacentNodesFor: root)
		inject: OrderedDictionary new
		into: [ :dictionary :node | 
			trees
				at: node
				ifPresent: [ :branch | dictionary at: node put: (trees removeKey: node) ]
				ifAbsent: [ 
					[ 
					dictionary
						at: node
						put:
							(self
								obtainTreeWithRoot: node
								childrenIn:
									(remainingNodes
										remove: node;
										yourself)
								existingTrees: trees) ]
						on: NotFound
						do: [ 
							"no children found in existing trees (at first level) or remaining nodes"
							 ] ].
			dictionary ]
]

{ #category : #private }
TLTreeLayout >> obtainTreesFromNodes: aGroup [
	| trees remainingNodes |
	remainingNodes := aGroup asOrderedCollection.
	remainingNodes == aGroup
		ifTrue: [ remainingNodes := remainingNodes copy ].
	trees := Dictionary new.
	[ remainingNodes notEmpty ]
		whileTrue: [ 
			| root |
			root := remainingNodes first.
			remainingNodes := remainingNodes allButFirst.
			trees at: root put: (self obtainTreeWithRoot: root childrenIn: remainingNodes existingTrees: trees) ].
	^ trees
]

{ #category : #private }
TLTreeLayout >> obtainYtableForTree: tree [
	| maxHeightByLevel pointer |
	maxHeightByLevel := OrderedCollection with: 0.
	self calculateMaxForLevel: 2 forTree: tree inTable: maxHeightByLevel.
	pointer := self levelGap negated.
	^ maxHeightByLevel collect: [ :yDec | pointer := pointer + yDec + self levelGap ]
]

{ #category : #private }
TLTreeLayout >> positionNodesInTree: aTree yDec: aDecTable level: aLevel xStart: xStart [
	| xDec |
	xDec := xStart.
	aTree
		keysAndValuesDo: [ :aNode :aBranch | 
			| usedWidth nodeDimension |
			nodeDimension := self obtainsNodeDimension: aNode.
			usedWidth := nodeDimension x
				max:
					(self
						positionNodesInTree: aBranch
						yDec: aDecTable
						level: aLevel + 1
						xStart: xDec).
			self definePosition: (xDec + (usedWidth / 2)) @ ((aDecTable at: aLevel) + (nodeDimension y / 2)) forNode: aNode.
			xDec := xDec + usedWidth + self leavesGap ].
	^ xDec - xStart - self leavesGap
]

{ #category : #customization }
TLTreeLayout >> useIncomingLinks [
	self incomingUsed: true
]

{ #category : #customization }
TLTreeLayout >> useOutgoingLinks [
	self incomingUsed: false
]
