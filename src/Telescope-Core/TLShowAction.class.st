"
Description
--------------------

A TLShowAction is an action that will show a drawable. This action is reversible and can hide the drawable.

Example
--------------------

	| visualization |
	visualization := TLVisualization new.
	""Define a first node"" 
	(visualization addNodeFromEntity: 1)  addInteraction: (TLShowAction on: (visualization addNodeFromEntity: 2) hide; yourself) onMouseOver. 
	""Define an interaction on a second node. When the mouse will enter the first node, the second will desapear. When the mouse will leave the first node, the socond node will by redrawn.""
	^ visualization
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	shownDrawables:			<aDictionary>		This dictionary will keep for each drawable the elements he show.
	showingValuableOrEntity:		<aBlockOrEntity>		A block or an entity taking as parameter a drawble and returning the entities to show.

"
Class {
	#name : #TLShowAction,
	#superclass : #TLReversibleNodeAction,
	#instVars : [
		'shownDrawables',
		'showingValuableOrEntity'
	],
	#category : #'Telescope-Core-Actions'
}

{ #category : #'instance creation' }
TLShowAction class >> on: aTLDrawable [
	^ self show: aTLDrawable
]

{ #category : #'instance creation' }
TLShowAction class >> show: aTLDrawable [
	^ self new
		showingValuableOrEntity: aTLDrawable;
		yourself
]

{ #category : #initialization }
TLShowAction >> initialize [
	super initialize.
	self shownDrawables: Dictionary new
]

{ #category : #action }
TLShowAction >> regularActionOn: aTLDrawable [
	(self shownDrawables
		at: aTLDrawable
		put: (self obtain: self showingValuableOrEntity on: aTLDrawable) asOrderedCollection) do: #show
]

{ #category : #action }
TLShowAction >> reverseActionOn: aTLDrawable [
	(self shownDrawables removeKey: aTLDrawable) do: #hide
]

{ #category : #testing }
TLShowAction >> shouldTriggerReverseActionFor: aTLDrawable [
	self shownDrawables at: aTLDrawable ifAbsent: [ ^ false ].
	^ true
]

{ #category : #accessing }
TLShowAction >> showingValuableOrEntity [
	^ showingValuableOrEntity
]

{ #category : #accessing }
TLShowAction >> showingValuableOrEntity: anObject [
	showingValuableOrEntity := anObject
]

{ #category : #accessing }
TLShowAction >> shownDrawables [
	^ shownDrawables
]

{ #category : #accessing }
TLShowAction >> shownDrawables: anObject [
	shownDrawables := anObject
]
