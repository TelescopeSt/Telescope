Class {
	#name : #TLConnectWithEntityActionTest,
	#superclass : #TestCase,
	#category : #'Telescope-Core-Tests-Actions'
}

{ #category : #tests }
TLConnectWithEntityActionTest >> testTriggerAction [
	| connectAction sourceNode targetNode |
	sourceNode := TLSimpleNode withEntity: 4.
	targetNode := TLSimpleNode withEntity: 2.
	connectAction := TLConnectWithEntityAction
		connectionProperty: [ :e | {e squared} ]
		property: [ :connectionEntity | connectionEntity / 8 ]
		context: (TLDrawableCollection with: sourceNode with: targetNode).
	connectAction actionOn: sourceNode.
	self assert: sourceNode outgoingConnections size equals: 1.
	self assert: targetNode incomingConnections size equals: 1.
	self
		assert: sourceNode outgoingConnections anyOne
		equals: targetNode incomingConnections anyOne
]

{ #category : #tests }
TLConnectWithEntityActionTest >> testTriggerActionTwiceForReversibility [
	"this test is valid only if testTriggerAction is valid"
	| connectAction sourceNode targetNode |
	sourceNode := TLSimpleNode withEntity: 4.
	targetNode := TLSimpleNode withEntity: 2.
	connectAction := TLConnectWithEntityAction
		connectionProperty: [ :e | {e squared} ]
		property: [ :connectionEntity | connectionEntity / 8 ]
		context: (TLDrawableCollection with: sourceNode with: targetNode).
	connectAction actionOn: sourceNode.
	connectAction actionOn: sourceNode.
	self assert: sourceNode outgoingConnections isEmpty.
	self assert: targetNode incomingConnections isEmpty
]
