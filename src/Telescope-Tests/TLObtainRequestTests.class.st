Class {
	#name : #TLObtainRequestTests,
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
	#category : 'Telescope-Tests-Model'
}

{ #category : #tests }
TLObtainRequestTests >> setUp [
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
TLObtainRequestTests >> testObtainAll [
	self assert: collection obtain all size equals: 3
]

{ #category : #tests }
TLObtainRequestTests >> testObtainCompositeNodes [
	self assert: collection obtain compositeNodes asArray equals: {composite}
]

{ #category : #tests }
TLObtainRequestTests >> testObtainCompositeRecursivelySimpleNodes [
	self
		assert: collection obtain compositeRecursively simpleNodes asArray
		equals:
			{simple.
			compositeChildrenNode}
]

{ #category : #tests }
TLObtainRequestTests >> testObtainGroupRecursivelyGroups [
	self
		assert: collection obtain groupRecursively groups asArray
		equals:
			{group.
			groupChildrenGroup}
]

{ #category : #tests }
TLObtainRequestTests >> testObtainGroupRecursivelySimpleNodes [
	self assert: collection obtain groupRecursively simpleNodes asArray equals: {simple . groupSimpleNode}
]

{ #category : #tests }
TLObtainRequestTests >> testObtainGroups [
	self assert: collection obtain groups asArray equals: {group}
]

{ #category : #tests }
TLObtainRequestTests >> testObtainGroupsWithSelf [
	self
		assert: group obtain recursively withSelf groups asArray
		equals:
			{group.
			groupChildrenGroup}
]

{ #category : #tests }
TLObtainRequestTests >> testObtainNodes [
	self
		assert: collection obtain nodes asArray
		equals:
			{simple.
			composite}
]

{ #category : #tests }
TLObtainRequestTests >> testObtainNodesFromVisualization [
	| visu |
	visu := TLVisualization new.
	visu addNodesFromEntities: (1 to: 3).
	self assert: visu obtain nodes size equals: 3
]

{ #category : #tests }
TLObtainRequestTests >> testObtainRecursivelyAll [
	self assert: collection obtain recursively all size equals: 7
]

{ #category : #tests }
TLObtainRequestTests >> testObtainRecursivelyLowestVisiblesNodesCompositeExpanded [
	composite expanded: true.
	self
		assert: collection obtain recursively lowestVisibles nodes asArray
		equals:
			{simple.
			compositeChildrenNode.
			groupSimpleNode}
]

{ #category : #tests }
TLObtainRequestTests >> testObtainRecursivelyLowestVisiblesNodesCompositeNotExpanded [
	composite expanded: false.
	self
		assert: collection obtain recursively lowestVisibles nodes asArray
		equals:
			{simple.
			composite.
			groupSimpleNode}
]

{ #category : #tests }
TLObtainRequestTests >> testObtainRecursivelyLowestVisiblesNodesCompositeNotExpandedGroupInvisible [
	composite expanded: false.
	group hide.
	self
		assert: collection obtain recursively lowestVisibles nodes asArray
		equals:
			{simple.
			composite}
]

{ #category : #tests }
TLObtainRequestTests >> testObtainRecursivelySimpleNodes [
	self
		assert: collection obtain recursively simpleNodes asArray
		equals:
			{simple.
			compositeChildrenNode.
			groupSimpleNode}
]

{ #category : #tests }
TLObtainRequestTests >> testObtainRecursivelyVisiblesNodes [
	simple hide.
	composite expanded: false.
	self assert: collection obtain recursively visibles nodes asArray equals: {composite. groupSimpleNode }
]

{ #category : #tests }
TLObtainRequestTests >> testObtainRecursivelyVisiblesNodesCompositeExpanded [
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
TLObtainRequestTests >> testObtainSimpleNodes [
	self assert: collection obtain simpleNodes asArray equals: {simple}
]

{ #category : #tests }
TLObtainRequestTests >> testObtainVisiblesNodes [
	simple hide.
	self assert: collection obtain visibles nodes asArray equals: {composite}
]
