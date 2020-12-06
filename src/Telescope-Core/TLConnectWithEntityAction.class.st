"
TLConnectionectAction is an action that create TLConnectionWithEntity from the receiver to an other node
"
Class {
	#name : #TLConnectWithEntityAction,
	#superclass : #TLConnectAction,
	#instVars : [
		'connectionProperty'
	],
	#category : #'Telescope-Core-Actions'
}

{ #category : #'as yet unclassified' }
TLConnectWithEntityAction class >> connectionProperty: aConnectionBlockOrProperty property: aBlockOrProperty [
	^ self new
		connectionProperty: aConnectionBlockOrProperty;
		property: aBlockOrProperty;
		yourself
]

{ #category : #'as yet unclassified' }
TLConnectWithEntityAction class >> connectionProperty: aConnectionBlockOrProperty property: aBlockOrProperty context: aTLGroup [
	^ (self
		connectionProperty: aConnectionBlockOrProperty
		property: aBlockOrProperty)
		context: aTLGroup;
		yourself
]

{ #category : #accessing }
TLConnectWithEntityAction >> connectionProperty [
	^ connectionProperty
]

{ #category : #accessing }
TLConnectWithEntityAction >> connectionProperty: anObject [
	connectionProperty := anObject
]

{ #category : #action }
TLConnectWithEntityAction >> regularActionOn: aNode [
	| connectionEntities contextNodesByEntities |
	connectionEntities := self
		obtain: self connectionProperty
		on: aNode entity.
	contextNodesByEntities := (self obtainContextFor: aNode)
		groupedBy: #entity.
	self connectionsByNode
		at: aNode
		put:
			((self obtain: self connectToOrigin on: aNode entity)
				ifFalse: [ connectionEntities
						collect: [ :aConnectionEntity | 
							aNode
								connectTo:
									(contextNodesByEntities
										at: (self obtain: self property on: aConnectionEntity))
								entity: aConnectionEntity ] ]
				ifTrue: [ connectionEntities
						collect: [ :aConnectionEntity | 
							(contextNodesByEntities
								at: (self obtain: self property on: aConnectionEntity))
								connectTo: aNode
								entity: aConnectionEntity ] ]).
	self connectionStyle
		ifNotNil: [ (self connectionsByNode at: aNode)
				do: [ :c | c addStyle: self connectionStyle ] ]
]
