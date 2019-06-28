"
Sorting strategy used for the containers in a distribution map.
For each entity, it computes its representation as a vector.
From the vectors a cosine distance can be computed betwen any two containers
From  these distance, the containers are ordered  by serialisation of a dendrogram
"
Class {
	#name : #TLDistributionMapContainerSortingStrategy,
	#superclass : #TLPropertyBasedStrategy,
	#instVars : [
		'innerEntitiesBlock'
	],
	#category : #'Telescope-VisualizationTemplates-Core'
}

{ #category : #'as yet unclassified' }
TLDistributionMapContainerSortingStrategy class >> onDistributionMap: aTLVisualization [
	^self new
		innerEntitiesBlock: aTLVisualization innerEntitiesSelector ;
		property: aTLVisualization property ;
		yourself
]

{ #category : #'private utilities' }
TLDistributionMapContainerSortingStrategy >> getVectorsDimensions: aCollectionOfTLNodes [
	^(aCollectionOfTLNodes
		flatCollectAsSet: [ :node | (self innerEntitiesBlock value: node entity) collect: [:inner | self property value: inner]])
			asOrderedCollection 
]

{ #category : #accessing }
TLDistributionMapContainerSortingStrategy >> innerEntitiesBlock [
	^ innerEntitiesBlock
]

{ #category : #accessing }
TLDistributionMapContainerSortingStrategy >> innerEntitiesBlock: aBlock [
	innerEntitiesBlock := aBlock 
]

{ #category : #sorting }
TLDistributionMapContainerSortingStrategy >> sortNodes: aCollectionOfTLNodes [
	| dims vectors clust dendrogram |
	dims := self getVectorsDimensions: aCollectionOfTLNodes.
	vectors := aCollectionOfTLNodes collect: [ :node | self vectorDescription: node forDimensions: dims ].
	"clustering expects a distance metric and #cosine: is a similarity in [0,1]"
	clust := MalClusterEngine with: vectors using: [ :v1 :v2 | 1 - (v1 cosine: v2)].
	dendrogram := clust singleLinkage orderLeafs.

	"now re-order elements WITHIN aCollectionOfTLNodes"
	aCollectionOfTLNodes removeAll.
	aCollectionOfTLNodes addAll: (dendrogram elements collect: #item)

]

{ #category : #'private utilities' }
TLDistributionMapContainerSortingStrategy >> vectorDescription: aTLNode forDimensions: dims [
	| entityProps |
	entityProps  := (self innerEntitiesBlock value: aTLNode entity) collect: [:inner | self property value: inner].
	^ MalVectorItem with: aTLNode and: (dims collect: [ :d | (entityProps select: [ :p | p = d ]) size ])
]
