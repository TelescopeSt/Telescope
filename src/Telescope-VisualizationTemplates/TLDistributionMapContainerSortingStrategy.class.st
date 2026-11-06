"
Sorting strategy used for the containers in a distribution map.
For each entity, it computes its representation as a vector.
From the vectors a cosine distance can be computed between any two containers.
From these distances, the containers are ordered by serialisation of a dendrogram (TLDendrogram).
"
Class {
	#name : 'TLDistributionMapContainerSortingStrategy',
	#superclass : 'TLPropertyBasedStrategy',
	#instVars : [
		'innerEntitiesBlock'
	],
	#category : 'Telescope-VisualizationTemplates',
	#package : 'Telescope-VisualizationTemplates'
}

{ #category : 'instance creation' }
TLDistributionMapContainerSortingStrategy class >> onDistributionMap: aTLVisualization [
	^self new
		innerEntitiesBlock: aTLVisualization innerEntitiesSelector ;
		property: aTLVisualization property ;
		yourself
]

{ #category : 'private utilities' }
TLDistributionMapContainerSortingStrategy >> getVectorsDimensions: aCollectionOfTLNodes [
	^(aCollectionOfTLNodes
		flatCollectAsSet: [ :node | (self innerEntitiesBlock value: node entity) collect: [:inner | self property value: inner]])
			asOrderedCollection 
]

{ #category : 'accessing' }
TLDistributionMapContainerSortingStrategy >> innerEntitiesBlock [
	^ innerEntitiesBlock
]

{ #category : 'accessing' }
TLDistributionMapContainerSortingStrategy >> innerEntitiesBlock: aBlock [
	innerEntitiesBlock := aBlock 
]

{ #category : 'sorting' }
TLDistributionMapContainerSortingStrategy >> sortNodes: aCollectionOfTLNodes [
	| dimensions leaves |
	aCollectionOfTLNodes size < 2 ifTrue: [ ^ self ].
	dimensions := self getVectorsDimensions: aCollectionOfTLNodes.
	leaves := aCollectionOfTLNodes collect: [ :node | TLDendrogram item: node vector: (self vectorDescription: node forDimensions: dimensions) ].
	"now re-order elements WITHIN aCollectionOfTLNodes"
	aCollectionOfTLNodes removeAll; addAll: (TLDendrogram singleLinkageOf: leaves) orderLeaves items
]

{ #category : 'private utilities' }
TLDistributionMapContainerSortingStrategy >> vectorDescription: aTLNode forDimensions: dimensions [
	"The number of inner entities of the node for each dimension"

	| entityProps |
	entityProps := (self innerEntitiesBlock value: aTLNode entity) collect: [ :inner | self property value: inner ].
	^ dimensions collect: [ :dimension | (entityProps select: [ :property | property = dimension ]) size ]
]
