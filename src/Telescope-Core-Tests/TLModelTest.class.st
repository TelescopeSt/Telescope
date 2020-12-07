Class {
	#name : #TLModelTest,
	#superclass : #TestCase,
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #tests }
TLModelTest >> testCompositeParentDefinition [
	| composite node |
	composite:= TLCompositeNode new.
	node := TLSimpleNode new.
	node parentNode: composite.
	self assert: node parentNode equals: composite.
	self assert: composite childrenNodes asArray equals: { node }
]

{ #category : #tests }
TLModelTest >> testRemoveAllFromGroup [
	| group node1 node2 |
	group := TLEntitiesGroup new.
	node1 := group addDrawable: (TLSimpleNode new).
	node2 := group addDrawable: (TLSimpleNode new).
	self assert: group size equals: 2.
	self assert: node1 parent equals: group.
	self assert: node2 parent equals: group.
	group removeAll.
	self assert: group size equals: 0.
	self assert: node1 parent equals: nil.
	self assert: node2 parent equals: nil.
	
]

{ #category : #tests }
TLModelTest >> testRemoveAllThenAddAgainGroup [
	| group subGroup secondSubGroup |
	group := TLEntitiesGroup new.
	subGroup := group > #group1.
	self assert: subGroup parent equals: group.
	group removeAll.
	self assert: subGroup parent equals: nil.
	self assert: group isEmpty.
	self assert: group subGroupsDictionary isEmpty.
	secondSubGroup := group > #group1.
	self assert: secondSubGroup parent equals: group.
	self deny: secondSubGroup equals: subGroup
]
