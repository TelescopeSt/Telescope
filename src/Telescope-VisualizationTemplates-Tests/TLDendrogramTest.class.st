"
I test the single linkage clustering and the order of the leaves of a dendrogram. The expected orders are the ones which the MooseAlgos clustering gave for the same vectors, so the maps keep their look.
"
Class {
	#name : 'TLDendrogramTest',
	#superclass : 'TestCase',
	#category : 'Telescope-VisualizationTemplates-Tests',
	#package : 'Telescope-VisualizationTemplates-Tests'
}

{ #category : 'helpers' }
TLDendrogramTest >> orderOfVectors: aCollectionOfVectors [
	| leaves |
	leaves := aCollectionOfVectors withIndexCollect: [ :vector :index | TLDendrogram item: index vector: vector ].
	^ (TLDendrogram singleLinkageOf: leaves) orderLeaves items
]

{ #category : 'tests' }
TLDendrogramTest >> testOrderKeepsEveryItemOnce [
	| order |
	order := self orderOfVectors: { #(0 0 0). #(0 0 0). #(1 0 0). #(0 1 0) }.
	self assert: order asSortedCollection asArray equals: #(1 2 3 4)
]

{ #category : 'tests' }
TLDendrogramTest >> testOrderOfSevenVectorsInTwoDimensions [
	self
		assert: (self orderOfVectors: { #(1 2). #(2 4). #(3 1). #(6 2). #(1 1). #(0 5). #(5 5) })
		equals: #(6 2 1 5 7 3 4)
]

{ #category : 'tests' }
TLDendrogramTest >> testOrderOfTenVectorsInFourDimensions [
	self
		assert: (self orderOfVectors: { #(3 0 0 1). #(0 2 0 0). #(1 1 1 0). #(0 0 4 1). #(3 1 0 1). #(0 2 1 0). #(1 0 4 1). #(5 5 0 0). #(0 0 1 0). #(2 2 2 2) })
		equals: #(8 5 1 3 10 6 2 9 4 7)
]

{ #category : 'tests' }
TLDendrogramTest >> testOrderWithTiesBetweenDistances [
	self
		assert: (self orderOfVectors: { #(1 0 0). #(0 1 0). #(1 1 0). #(0 0 1). #(1 0 1). #(0 1 1). #(2 0 0). #(0 3 0) })
		equals: #(8 2 3 1 7 5 4 6)
]

{ #category : 'tests' }
TLDendrogramTest >> testSingleItemIsItsOwnOrder [
	self assert: (self orderOfVectors: { #(1 2) }) equals: #(1)
]
