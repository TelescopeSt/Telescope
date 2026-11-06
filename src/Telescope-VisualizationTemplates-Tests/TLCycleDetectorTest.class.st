"
I test the detection of the nodes which are in a cycle of dependencies.
"
Class {
	#name : 'TLCycleDetectorTest',
	#superclass : 'TestCase',
	#category : 'Telescope-VisualizationTemplates-Tests',
	#package : 'Telescope-VisualizationTemplates-Tests'
}

{ #category : 'helpers' }
TLCycleDetectorTest >> cyclicNodesOf: aCollectionOfNodes dependencies: aDictionary [
	^ (TLCycleDetector nodes: aCollectionOfNodes successors: [ :node | aDictionary at: node ifAbsent: [ #() ] ]) cyclicNodes asSortedCollection asArray
]

{ #category : 'tests' }
TLCycleDetectorTest >> testDependenciesOutOfTheNodesAreIgnored [
	self assertEmpty: (self cyclicNodesOf: #(1) dependencies: { 1 -> #(9). 9 -> #(1) } asDictionary)
]

{ #category : 'tests' }
TLCycleDetectorTest >> testIsInCycle [
	| detector |
	detector := TLCycleDetector nodes: #(1 2 3) successors: [ :node | { 1 -> #(2). 2 -> #(1) } asDictionary at: node ifAbsent: [ #() ] ].
	self assert: (detector isInCycle: 1).
	self deny: (detector isInCycle: 3)
]

{ #category : 'tests' }
TLCycleDetectorTest >> testLongCycle [
	self assert: (self cyclicNodesOf: #(1 2 3 4) dependencies: { 1 -> #(2). 2 -> #(3). 3 -> #(4). 4 -> #(1) } asDictionary) equals: #(1 2 3 4)
]

{ #category : 'tests' }
TLCycleDetectorTest >> testNoCycleInAChain [
	self assertEmpty: (self cyclicNodesOf: #(1 2 3) dependencies: { 1 -> #(2). 2 -> #(3) } asDictionary)
]

{ #category : 'tests' }
TLCycleDetectorTest >> testNodeWhichDependsOnlyOnItselfIsNotInACycle [
	self assertEmpty: (self cyclicNodesOf: #(1 2) dependencies: { 1 -> #(1). 2 -> #(1) } asDictionary)
]

{ #category : 'tests' }
TLCycleDetectorTest >> testNodesBetweenTwoCyclesAreNotInACycle [
	self assert: (self cyclicNodesOf: #(1 2 3 4 5) dependencies: { 1 -> #(2). 2 -> #(1 3). 3 -> #(4). 4 -> #(5). 5 -> #(4) } asDictionary) equals: #(1 2 4 5)
]

{ #category : 'tests' }
TLCycleDetectorTest >> testTwoNodesWhichDependOnEachOtherAreInACycle [
	self assert: (self cyclicNodesOf: #(1 2 3) dependencies: { 1 -> #(2). 2 -> #(1). 3 -> #(1) } asDictionary) equals: #(1 2)
]
