Class {
	#name : #TLObtainRequestTest,
	#superclass : #TestCase,
	#instVars : [
		'simple',
		'composite',
		'group',
		'collection',
		'compositeChildrenNode',
		'compositeChildrenGroup',
		'groupSimpleNode',
		'groupChildrenGroup'
	],
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #running }
TLObtainRequestTest >> setUp [
	super setUp.
	simple := TLSimpleNode new.
	composite := TLCompositeNode new.
	group := TLEntitiesGroup new.
	compositeChildrenNode := TLSimpleNode new
		parent: composite;
		yourself.
	compositeChildrenGroup := TLEntitiesGroup new
		parent: composite;
		yourself.
	groupSimpleNode := TLSimpleNode new
		parent: group;
		yourself.
	groupChildrenGroup := TLEntitiesGroup new
		parent: group;
		yourself.
	collection := TLDrawableCollection
		withAll:
			{simple.
			composite.
			group}
]

{ #category : #tests }
TLObtainRequestTest >> testObtainAll [
	self assert: collection obtain all size equals: 3
]

{ #category : #tests }
TLObtainRequestTest >> testObtainCompositeNodes [
	self assert: collection obtain compositeNodes asArray equals: {composite}
]

{ #category : #tests }
TLObtainRequestTest >> testObtainCompositeRecursivelySimpleNodes [
	self
		assert: collection obtain compositeRecursively simpleNodes asArray
		equals:
			{simple.
			compositeChildrenNode}
]

{ #category : #tests }
TLObtainRequestTest >> testObtainGroupRecursivelyGroups [
	self
		assert: collection obtain groupRecursively groups asArray
		equals:
			{group.
			groupChildrenGroup}
]

{ #category : #tests }
TLObtainRequestTest >> testObtainGroupRecursivelySimpleNodes [
	self assert: collection obtain groupRecursively simpleNodes asArray equals: {simple . groupSimpleNode}
]

{ #category : #tests }
TLObtainRequestTest >> testObtainGroups [
	self assert: collection obtain groups asArray equals: {group}
]

{ #category : #tests }
TLObtainRequestTest >> testObtainGroupsWithSelf [
	self
		assert: group obtain recursively withSelf groups asArray
		equals:
			{group.
			groupChildrenGroup}
]

{ #category : #tests }
TLObtainRequestTest >> testObtainNodes [
	self
		assert: collection obtain nodes asArray
		equals:
			{simple.
			composite}
]

{ #category : #tests }
TLObtainRequestTest >> testObtainNodesFromVisualization [
	| visu |
	visu := TLVisualization new.
	visu addNodesFromEntities: (1 to: 3).
	self assert: visu obtain nodes size equals: 3
]

{ #category : #tests }
TLObtainRequestTest >> testObtainRecursivelyAll [
	self assert: collection obtain recursively all size equals: 7
]

{ #category : #tests }
TLObtainRequestTest >> testObtainRecursivelyLowestVisiblesNodesCompositeExpanded [
	composite expanded: true.
	self
		assert: collection obtain recursively lowestVisibles nodes asArray
		equals:
			{simple.
			compositeChildrenNode.
			groupSimpleNode}
]

{ #category : #tests }
TLObtainRequestTest >> testObtainRecursivelyLowestVisiblesNodesCompositeNotExpanded [
	composite expanded: false.
	self
		assert: collection obtain recursively lowestVisibles nodes asArray
		equals:
			{simple.
			composite.
			groupSimpleNode}
]

{ #category : #tests }
TLObtainRequestTest >> testObtainRecursivelyLowestVisiblesNodesCompositeNotExpandedGroupInvisible [
	composite expanded: false.
	group hide.
	self
		assert: collection obtain recursively lowestVisibles nodes asArray
		equals:
			{simple.
			composite}
]

{ #category : #tests }
TLObtainRequestTest >> testObtainRecursivelySimpleNodes [
	self
		assert: collection obtain recursively simpleNodes asArray
		equals:
			{simple.
			compositeChildrenNode.
			groupSimpleNode}
]

{ #category : #tests }
TLObtainRequestTest >> testObtainRecursivelyVisiblesNodes [
	simple hide.
	composite expanded: false.
	self assert: collection obtain recursively visibles nodes asArray equals: {composite. groupSimpleNode }
]

{ #category : #tests }
TLObtainRequestTest >> testObtainRecursivelyVisiblesNodesCompositeExpanded [
	simple hide.
	composite expanded: true.
	self
		assert: collection obtain recursively visibles nodes asArray
		equals:
			{composite.
			compositeChildrenNode.
			groupSimpleNode}
]

{ #category : #tests }
TLObtainRequestTest >> testObtainSimpleNodes [
	self assert: collection obtain simpleNodes asArray equals: {simple}
]

{ #category : #tests }
TLObtainRequestTest >> testObtainVisiblesNodes [
	simple hide.
	self assert: collection obtain visibles nodes asArray equals: {composite}
]
