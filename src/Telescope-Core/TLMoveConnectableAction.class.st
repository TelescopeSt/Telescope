"
Description
------------------
A TLMoveConnectableAction is an action that move a connectable (node or group into another group).

Public API and Key Messages
------------------

- #destinationGroup:  aGroup  			The group where the drawable should move.

 Examples
-----------------

	| visualization |
	visualization := TLVisualization new.
	visualization styleSheet nodeLabel: #asString.
	visualization > #group1
		layout: TLLinearLayout topToBottom;
		addNodesFromEntities: ($a to: $d);
		addInteraction: (TLMoveConnectableAction destination: visualization > #group2) onClick.
	visualization > #group2
		layout: TLLinearLayout topToBottom;
		addNodesFromEntities: ($e to: $h);
		addInteraction: (TLMoveConnectableAction destination: visualization > #group1) onClick.
	^ visualization
	
Internal Representation and Key Implementation Points.
-----------------

    Instance Variables
	destinationGroup:				<aTLGroup>		The destination group for the drawables
"
Class {
	#name : #TLMoveConnectableAction,
	#superclass : #TLReversibleNodeAction,
	#instVars : [
		'destinationGroup'
	],
	#category : #'Telescope-Core-Actions'
}

{ #category : #accessing }
TLMoveConnectableAction class >> destination: aTLEntitiesGroup [
	^ self new destinationGroup: aTLEntitiesGroup; yourself
]

{ #category : #accessing }
TLMoveConnectableAction >> destinationGroup [
	^ destinationGroup
]

{ #category : #accessing }
TLMoveConnectableAction >> destinationGroup: anObject [
	destinationGroup := anObject
]

{ #category : #action }
TLMoveConnectableAction >> regularActionOn: aTLDrawable [
	aTLDrawable state at: self stateKey put: aTLDrawable parent.
	aTLDrawable moveToGroup: self destinationGroup
]

{ #category : #action }
TLMoveConnectableAction >> reverseActionOn: aTLDrawable [
	aTLDrawable moveToGroup: (aTLDrawable state removeKey: self stateKey)
]

{ #category : #testing }
TLMoveConnectableAction >> shouldTriggerReverseActionFor: aTLDrawable [
	^ aTLDrawable state at: self stateKey ifPresent: [ true ] ifAbsent: [ false ]
]

{ #category : #action }
TLMoveConnectableAction >> stateKey [
	^ #movingAction
]
