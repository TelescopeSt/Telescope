Class {
	#name : #TLNodeCreationStrategyTest,
	#superclass : #TestCase,
	#instVars : [
		'strategy'
	],
	#category : #'Telescope-Core-Tests-Strategies'
}

{ #category : #running }
TLNodeCreationStrategyTest >> setUp [
	super setUp.
	strategy := TLNodeCreationStrategy new
]

{ #category : #tests }
TLNodeCreationStrategyTest >> testCompositePropertyFillingAddADefaultChildrenNodeCreationStrategy [
	strategy compositeProperty: #whatever.
	self assert: strategy childrenStrategy notNil.
]

{ #category : #tests }
TLNodeCreationStrategyTest >> testCompositeWithLayout [
	| node |
	strategy := TLNodeCreationStrategy composite: [ :i | i + 1 to: i + 5 ] withLayout: #aFakeLayout.
	node := strategy createNodeFromEntity: 6.
	self assert: node isComposite.
	self assert: node childrenLayout equals: #aFakeLayout
]

{ #category : #tests }
TLNodeCreationStrategyTest >> testCopyAsSimpleStrategy [
	| aTLNodeCreationStrategy |
	aTLNodeCreationStrategy := strategy copyAsSimpleStrategy.
	self
		assert: aTLNodeCreationStrategy class
		equals: TLNodeCreationStrategy.
	self assert: aTLNodeCreationStrategy childrenStrategy isNil.
	self assert: aTLNodeCreationStrategy compositeProperty isNil.
	self assert: aTLNodeCreationStrategy childrenSortingStrategy isNil.
	self assert: aTLNodeCreationStrategy compositeChildrenLayout isNil.
	self assert: aTLNodeCreationStrategy nodeStyle isNil
]

{ #category : #tests }
TLNodeCreationStrategyTest >> testStrategyDefiningStyleForNode [
	| node |
	strategy nodeStyle: #myStyle.
	node := strategy createNodeFromEntity: #whatever.
	self assert: node styles equals: {#node . #myStyle} asOrderedCollection
]

{ #category : #tests }
TLNodeCreationStrategyTest >> testStrategyForCompositeNodeCreation [
	| node |
	strategy compositeProperty: (1 to: 9).
	node := strategy createNodeFromEntity: #Digit.
	self assert: node isComposite.
	self assert: node entity equals: #Digit.
	self assert: node childrenNodes size equals: 9
]

{ #category : #tests }
TLNodeCreationStrategyTest >> testStrategyForCompositeNodeCreationAlsoCreatingComposite [
	| node |
	(strategy compositeProperty: {1}) childrenProperty: [:i | i to: i + 1].
	node := strategy createNodeFromEntity: #Digit.
	self assert: node isComposite.
	self assert: node entity equals: #Digit.
	self assert: node childrenNodes size equals: 1.
	self assert: node childrenNodes first isComposite.
	self assert: node childrenNodes first childrenNodes size equals: 2.
	self assert: node childrenNodes first childrenNodes first entity equals: 1.
	self assert: node childrenNodes first childrenNodes second entity equals: 2.
	self deny: node childrenNodes first childrenNodes first isComposite.
	self deny: node childrenNodes first childrenNodes second isComposite.
	
]
