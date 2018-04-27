Class {
	#name : #TLNodeCreationStrategyTests,
	#superclass : #TestCase,
	#instVars : [
		'strategy'
	],
	#category : 'Telescope-Tests'
}

{ #category : #running }
TLNodeCreationStrategyTests >> setUp [
	strategy := TLNodeCreationStrategy new
]

{ #category : #tests }
TLNodeCreationStrategyTests >> testCompositePropertyFillingAddADefaultChildrenNodeCreationStrategy [
	strategy compositeProperty: #whatever.
	self assert: strategy childrenStrategy notNil.
]

{ #category : #tests }
TLNodeCreationStrategyTests >> testCompositeWithLayout [
	| node |
	strategy := TLNodeCreationStrategy composite: [ :i | i + 1 to: i + 5 ] withLayout: #aFakeLayout.
	node := strategy createNodeFromEntity: 6.
	self assert: node isComposite.
	self assert: node childrenLayout equals: #aFakeLayout
]

{ #category : #tests }
TLNodeCreationStrategyTests >> testStrategyDefiningStyleForNode [
	| node |
	strategy nodeStyle: #myStyle.
	node := strategy createNodeFromEntity: #whatever.
	self assert: node styles equals: {#node . #myStyle} asOrderedCollection
]

{ #category : #tests }
TLNodeCreationStrategyTests >> testStrategyForCompositeNodeCreation [
	| node |
	strategy compositeProperty: (1 to: 9).
	node := strategy createNodeFromEntity: #Digit.
	self assert: node isComposite.
	self assert: node entity equals: #Digit.
	self assert: node childrenNodes size equals: 9
]

{ #category : #tests }
TLNodeCreationStrategyTests >> testStrategyForCompositeNodeCreationAlsoCreatingComposite [
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
