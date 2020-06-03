"
Description
--------------------

A TLHideAction is an action that will hyde a drawable. This action is reversible and can restore the drawable.

Example
--------------------

	| visualization |
	visualization := TLVisualization new.
	""Define a first node"" 
	(visualization addNodeFromEntity: 1)  addInteraction: (TLHideAction on: (visualization addNodeFromEntity: 2)) onMouseOver. 
	""Define an interaction on a second node. When the mouse will enter the first node, the second will desapear. When the mouse will leave the first node, the socond node will by redrawn.""
	^ visualization
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	hiddedDrawables:			<aDictionary>		This dictionary will keep for each drawable the elements he hides.
	hidingValuableOrEntity:		<aBlockOrEntity>		A block or an entity taking as parameter a drawble and returning the entities to hide.

"
Class {
	#name : #TLHideAction,
	#superclass : #TLReversibleNodeAction,
	#instVars : [
		'hidingValuableOrEntity',
		'hiddedDrawables'
	],
	#category : #'Telescope-Core-Actions'
}

{ #category : #'instance creation' }
TLHideAction class >> hide: aTLDrawable [
	^ self new
		hidingValuableOrEntity: aTLDrawable;
		yourself
]

{ #category : #'instance creation' }
TLHideAction class >> on: aTLDrawable [
	^ self hide: aTLDrawable
]

{ #category : #accessing }
TLHideAction >> hiddedDrawables [
	^ hiddedDrawables
]

{ #category : #accessing }
TLHideAction >> hiddedDrawables: anObject [
	hiddedDrawables := anObject
]

{ #category : #accessing }
TLHideAction >> hidingValuableOrEntity [
	^ hidingValuableOrEntity
]

{ #category : #accessing }
TLHideAction >> hidingValuableOrEntity: anObject [
	hidingValuableOrEntity := anObject
]

{ #category : #initialization }
TLHideAction >> initialize [
	super initialize.
	self hiddedDrawables: Dictionary new.
	self hidingValuableOrEntity: #yourself
]

{ #category : #action }
TLHideAction >> regularActionOn: aTLDrawable [
	(self hiddedDrawables
		at: aTLDrawable
		put: (self obtain: self hidingValuableOrEntity on: aTLDrawable) asOrderedCollection) do: #hide
]

{ #category : #action }
TLHideAction >> reverseActionOn: aTLDrawable [
	(self hiddedDrawables removeKey: aTLDrawable) do: #show
]

{ #category : #testing }
TLHideAction >> shouldTriggerReverseActionFor: aTLDrawable [
	self hiddedDrawables at: aTLDrawable ifAbsent: [ ^ false ].
	^ true
]
