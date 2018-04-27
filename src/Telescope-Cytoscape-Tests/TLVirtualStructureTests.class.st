Class {
	#name : #TLVirtualStructureTests,
	#superclass : #TestCase,
	#category : 'Telescope-Cytoscape-Tests-Virtual'
}

{ #category : #tests }
TLVirtualStructureTests >> setUp [
	self crLog: testSelector.
]

{ #category : #tests }
TLVirtualStructureTests >> testLayoutApplication [
	| nodes |
	nodes := (1 to: 10) collect: [ :i | TLVirtualNode new dimension: 5@8 ].
	RTGridLayout new applyOn: nodes.
	nodes do: [:aNode | self assert: aNode position notNil ]
]

{ #category : #tests }
TLVirtualStructureTests >> testNodeInCompositeInCompositePosition [
	| parent child grandParent |
	grandParent := TLVirtualNode new dimension: 16 @ 12.
	grandParent compositeMargin: 10@17.
	grandParent position: 7@24.
	parent := TLVirtualNode new dimension: 50 @ 40.
	parent compositeMargin: 5@5.
	parent parent: grandParent.
	child := TLVirtualNode new dimension: 5 @ 10.
	child parent: parent.
	child position: 2@2.
	parent position: 12@12.
	self assert: child absolutePosition equals: 36@60.
	self assert: child dimension equals: 5@10.
	self assert: parent absolutePosition equals: 29@53.
	self assert: parent dimension equals: 15@20.
	self assert: grandParent absolutePosition equals: 7@24.
	self assert: grandParent dimension equals: 35@54.
]

{ #category : #tests }
TLVirtualStructureTests >> testNodeInCompositePosition [
	| parent child |
	parent := TLVirtualNode new dimension: 50 @ 40.
	parent compositeMargin: 5 @ 5.
	
	child := TLVirtualNode new dimension: 6 @ 10.
	child parent: parent.
	child position: 2 @ 2.
	parent position: 12 @ 12.
	
	self assert: parent position equals: 12 @ 12.
	self assert: parent absolutePosition equals: 12 @ 12.
	self assert: parent children absolutePosition equals: 12 @ 12.	"The children of the parent is a virtual group containing children of the composite."
	self assert: child absolutePosition equals: 14 @ 14.
	self assert: parent dimension equals: 16 @ 20
]

{ #category : #tests }
TLVirtualStructureTests >> testNodeWithDimension [
	| node |
	node := TLVirtualNode new dimension: 6 @ 10.
	node position: 42 @ 47.
	self assert: node absolutePosition equals: 42 @ 47.
	self assert: node extent equals: 6 @ 10.
	self assert: node encompassingRectangle equals: (39 @ 42 corner: 45 @ 52)
]

{ #category : #tests }
TLVirtualStructureTests >> testNodesInGroupInGroup [
	| group child1 child2 |
	group := TLVirtualGroup new.
	
	child1 := TLVirtualNode new dimension: 5 @ 10.
	child1 parent: group.
	child1 position: 2@2.
	
	child2 := TLVirtualNode new dimension: 7 @ 14.
	child2 parent: group.
	child2 position: 25@40.
	
	group position: 12@12.
	
	self assert: child1 absolutePosition equals: 14@14.
	self assert: child2 absolutePosition equals: 37@52.
	
	
	self assert: group extent equals: 30@52
]

{ #category : #tests }
TLVirtualStructureTests >> testRemoveNodeFromAGroupThenAddToAnotherWithAdd [
	|groupSource groupTarget node|
	node:= TLVirtualNode new.
	groupSource := TLVirtualGroup new.
	groupTarget := TLVirtualGroup new.
	groupSource add: node.
	self assert: node parent equals: groupSource.
	self assert: groupSource size equals: 1.
	self assert: groupSource first equals: node.
	 
	groupSource remove: node.
	groupTarget add: node.
	self assert: node parent equals: groupTarget.
	self assert: groupSource size equals: 0.
	self assert: groupTarget size equals: 1.
	self assert: groupTarget first equals: node.
	
]

{ #category : #tests }
TLVirtualStructureTests >> testRemoveNodeFromAGroupThenAddToAnotherWithParentSelector [
	|groupSource groupTarget node|
	node:= TLVirtualNode new.
	groupSource := TLVirtualGroup new.
	groupTarget := TLVirtualGroup new.
	node parent: groupSource.
	self assert: node parent equals: groupSource.
	self assert: groupSource size equals: 1.
	self assert: groupSource first equals: node.
	 
	groupSource remove: node.
	node parent: groupTarget.
	self assert: node parent equals: groupTarget.
	self assert: groupSource size equals: 0.
	self assert: groupTarget size equals: 1.
	self assert: groupTarget first equals: node.
	
]

{ #category : #tests }
TLVirtualStructureTests >> testTwoNodesInCompositePosition [
	| parent child1 child2 |
	parent := TLVirtualNode new dimension: 50 @ 40.
	parent compositeMargin: 0@0.
	child1 := TLVirtualNode new dimension: 6 @ 10.
	child1 parent: parent.
	child1 position: 3@5.
	
	child2 := TLVirtualNode new dimension: 8 @ 16.
	child2 parent: parent.
	child2 position: 26@40.
	
	parent position: 15@24.
	
	self assert: child1 absolutePosition equals: 3@5.
	self assert: child2 absolutePosition equals: 26@40.
	self assert: parent dimension equals: 30@48
]
