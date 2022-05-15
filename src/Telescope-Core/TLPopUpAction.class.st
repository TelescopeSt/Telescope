"
I am an action that show a popup with the provided text or block with the node entity.
"
Class {
	#name : #TLPopUpAction,
	#superclass : #TLReversibleNodeAction,
	#instVars : [
		'textBlock',
		'position'
	],
	#category : #'Telescope-Core-Actions'
}

{ #category : #'instance creation' }
TLPopUpAction class >> onMouseOver [
	^ (self text: #asString) onMouseOver
]

{ #category : #'instance creation' }
TLPopUpAction class >> text: aTextBlock [
	^ self new
		textBlock: aTextBlock;
		yourself
]

{ #category : #'instance creation' }
TLPopUpAction class >> text: aTextBlock position: aPosition [
	^ self new
		textBlock: aTextBlock;
		position: aPosition;
		yourself
]

{ #category : #testing }
TLPopUpAction >> isPopUp [
	^ true
]

{ #category : #accessing }
TLPopUpAction >> obtainsPositionFrom: aTLNode [
	^ self position cull: aTLNode entity cull: aTLNode
]

{ #category : #accessing }
TLPopUpAction >> position [
	self flag: 'Maybe this position should be in the stylesheet'.
	^ position ifNil: [ TLPosition bottom ]
]

{ #category : #accessing }
TLPopUpAction >> position: anObject [
	position := anObject
]

{ #category : #action }
TLPopUpAction >> regularActionOn: aTLSimpleNode [ 
	self flag: 'Only supported with Cytoscape on web now and managed by client side'
]

{ #category : #accessing }
TLPopUpAction >> textBlock [
	^ textBlock
]

{ #category : #accessing }
TLPopUpAction >> textBlock: anObject [
	textBlock := anObject
]

{ #category : #interactions }
TLPopUpAction >> withMenu: aTitle [
	TLNotSupportedFunctionalityException signal: 'Popup cannot be triggered by a menu, only by Click and MouseOver'
]
