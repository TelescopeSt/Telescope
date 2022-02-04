Class {
	#name : #TLConnectActionTest,
	#superclass : #TestCase,
	#category : #'Telescope-Core-Tests-Actions'
}

{ #category : #tests }
TLConnectActionTest >> testTriggerAction [
	| connectAction sourceNode targetNode |
	sourceNode := TLSimpleNode withEntity: 4.
	targetNode := TLSimpleNode withEntity: 2.
	connectAction := TLConnectAction
		property: [ :e | {e sqrt} ]
		context: (TLDrawableCollection with: sourceNode with: targetNode).
	connectAction actionOn: sourceNode.
	self assert: sourceNode outgoingConnections size equals: 1.
	self assert: targetNode incomingConnections size equals: 1.
	self
		assert: sourceNode outgoingConnections anyOne
		equals: targetNode incomingConnections anyOne
]

{ #category : #tests }
TLConnectActionTest >> testTriggerActionTwiceForReversibility [
	"this test is valid only if testTriggerAction is valid"
	| connectAction sourceNode targetNode |
	sourceNode := TLSimpleNode withEntity: 4.
	targetNode := TLSimpleNode withEntity: 2.
	connectAction := TLConnectAction
		property: [ :e | {e sqrt} ]
		context: (TLDrawableCollection with: sourceNode with: targetNode).
	connectAction actionOn: sourceNode.
	connectAction actionOn: sourceNode.
	self assert: sourceNode outgoingConnections isEmpty.
	self assert: targetNode incomingConnections isEmpty
]
