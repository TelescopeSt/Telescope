Class {
	#name : #TLConnectorTests,
	#superclass : #BabyMock2TestCase,
	#instVars : [
		'connector'
	],
	#category : 'Telescope-Tests'
}

{ #category : #running }
TLConnectorTests >> setUp [
	connector := TLConnectorTest new
]

{ #category : #tests }
TLConnectorTests >> testCompositeUpdatingChildNode [
	| group  composite  |
	group := TLEntitiesGroup new.
	group styleSheet expandCompositeNodes.
	group generator: connector.
	composite := group addCompositeNodeFromEntity: #parent children: #(child1).
	group generate.
	self assert: connector shapeByDrawable size equals: 4.
	"group + composite + composite children group + child1"
	composite childrenNodes first requireUpdate.
	self assert: composite isUpdateRequired.
	group update.
	self deny: composite isUpdateRequired.
	self assert: connector shapeByDrawable size equals: 4.
	
]

{ #category : #tests }
TLConnectorTests >> testGroupUpdatingAddElement [
	| group cNode aNode bNode |
	group := TLEntitiesGroup new.
	group generator: connector.
	group nodeCreationStrategy: TLNodeCreationStrategy default; layout: nil.
	aNode := group addNodeFromEntity: $a.
	bNode := group addNodeFromEntity: $b.
	group generate.
	cNode := group addNodeFromEntity: $c.
	group update.
	self assert: (connector elementFromTLDrawable: group) equals: {aNode -> #element . bNode -> #element . cNode -> #element } asOrderedCollection
]

{ #category : #tests }
TLConnectorTests >> testGroupUpdatingKeepOrder [
	| group cNode aNode bNode |
	group := TLEntitiesGroup new.
	group generator: connector.
	group nodeCreationStrategy: TLNodeCreationStrategy default; layout: nil.
	aNode := group addNodeFromEntity: $a.
	bNode := group addNodeFromEntity: $b.
	cNode := group addNodeFromEntity: $c.
	group generate.
	group moveToFirstPosition: cNode.
	group update.
	self assert: (connector elementFromTLDrawable: group) equals: {cNode -> #element . aNode -> #element . bNode -> #element } asOrderedCollection
]

{ #category : #tests }
TLConnectorTests >> testNodeWithShapeInteractionCorrectlyGenerated [
	| node interaction |
	node := TLSimpleNode new.
	interaction := ((TLCustomAction block: [ :aTLDrawable |  ]) withTriggerStyle: #aStyle) onClick.
	node addInteraction: interaction.
	node generateWith: connector.
	self assert: connector view size equals: 2. "the node and the trigger"
	self assert: ((connector interactionsByDrawable at: node) includes: interaction).
]

{ #category : #tests }
TLConnectorTests >> testNodeWithShapeInteractionCorrectlyRemoved [
	| node interaction |
	node := TLSimpleNode new.
	interaction := (TLCustomAction block: [ :aTLDrawable |  ]) withTriggerStyle: #aStyle.
	node addInteraction: interaction.
	node generateWith: connector.
	self assert: connector view size equals: 2. "the node and the trigger"
	node removeWith: connector.
	self assert: connector view isEmpty
	
]
