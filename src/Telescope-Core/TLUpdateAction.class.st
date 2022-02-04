"
I am an action that will perform the provided action and also update a drawable.

It is useful to create actions between differents visualizations and update everyone.

It is not necessary to create it by yourself, prefer to call #updateAlso: on the action.
"
Class {
	#name : #TLUpdateAction,
	#superclass : #TLDrawableAction,
	#instVars : [
		'drawable',
		'action'
	],
	#category : #'Telescope-Core-Actions'
}

{ #category : #'instance creation' }
TLUpdateAction class >> drawable: aTLDrawable action: aTLDrawableAction [
	^ self new
		drawable: aTLDrawable;
		action: aTLDrawableAction;
		yourself
]

{ #category : #accessing }
TLUpdateAction >> action [
	^ action
]

{ #category : #accessing }
TLUpdateAction >> action: anObject [
	action := anObject
]

{ #category : #action }
TLUpdateAction >> actionOn: aTLDrawable [
	self action actionOn: aTLDrawable.
	self drawable update.
]

{ #category : #action }
TLUpdateAction >> actionOn: aTLCompositeNode parameter: aParameter [
	self action actionOn: aTLCompositeNode parameter: aParameter.
	self drawable update
]

{ #category : #accessing }
TLUpdateAction >> drawable [
	^ drawable
]

{ #category : #accessing }
TLUpdateAction >> drawable: anObject [
	drawable := anObject
]

{ #category : #interactions }
TLUpdateAction >> onDrop [
	^ TLDropInteraction new action: self 
]
