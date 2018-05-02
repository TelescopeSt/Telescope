Class {
	#name : #TLHideActionTests,
	#superclass : #TestCase,
	#category : #'Telescope-Core-Tests-Actions'
}

{ #category : #tests }
TLHideActionTests >> testHideBlock [
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
TLHideActionTests >> testHideNode [
	| node hideAction |
	node := TLSimpleNode new.
	hideAction := TLHideAction hide: node.
	self assert: node isVisible.
	hideAction actionOn: node.
	self deny: node isVisible
]

{ #category : #tests }
TLHideActionTests >> testHideSymbol [
	| node hideAction secondNode connection |
	node := TLSimpleNode new.
	secondNode := TLSimpleNode new.
	connection := node connectTo: secondNode.
	hideAction := TLHideAction hide: #allConnections.
	self assert: connection isVisible.
	hideAction actionOn: node.
	self deny: connection isVisible
]
