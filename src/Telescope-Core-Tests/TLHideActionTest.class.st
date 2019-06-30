Class {
	#name : #TLHideActionTest,
	#superclass : #TestCase,
	#category : #'Telescope-Core-Tests-Actions'
}

{ #category : #tests }
TLHideActionTest >> testHideBlock [
	| node hideAction secondNode connection |
	node := TLSimpleNode new.
	secondNode := TLSimpleNode new.
	connection := node connectTo: secondNode.
	hideAction := TLHideAction hide: [ :aNode | aNode allConnections ].
	self assert: connection isVisible.
	hideAction actionOn: node.
	self deny: connection isVisible
]

{ #category : #tests }
TLHideActionTest >> testHideNode [
	| node hideAction |
	node := TLSimpleNode new.
	hideAction := TLHideAction hide: node.
	self assert: node isVisible.
	hideAction actionOn: node.
	self deny: node isVisible
]

{ #category : #tests }
TLHideActionTest >> testHideSymbol [
	| node hideAction secondNode connection |
	node := TLSimpleNode new.
	secondNode := TLSimpleNode new.
	connection := node connectTo: secondNode.
	hideAction := TLHideAction hide: #allConnections.
	self assert: connection isVisible.
	hideAction actionOn: node.
	self deny: connection isVisible
]
