"
I'm a spec for a menu. The World menu pragma based registration uses it for now. I'm moved in this package so that later the ToolBuilder package can be unloaded. 
We could probably avoid MenuSpec and just use MenuMorph instead. 
"
Class {
	#name : #Menu,
	#superclass : #AbstractMenuElement,
	#instVars : [
		'model',
		'items',
		'parentMenu'
	],
	#category : 'Menus'
}

{ #category : #example }
Menu class >> exampleWithOneSingleItem [
	"self exampleWithOneSingleItem"
	
	| s |
	s := (self withModel: nil ) label: 'Hello'. 
	s add: 'Print Hello' action: (MessageSend receiver: [Transcript show: 'Hello', String cr] selector: #value).

]

{ #category : #example }
Menu class >> exampleWithSubMenu [
	"
	self exampleWithSubMenu
	"
	| s i sub |
	s := (self withModel: nil ) label: 'Tools'. 
	i := s add: 'Tools'.
	sub := (self withModel: nil ).
	sub add: 'System browser'  target: Smalltalk tools selector: #openClassBrowser argumentList: #().
	sub add: 'Workspace'  target: Smalltalk tools selector: #openWorkspace argumentList: #().
	i subMenu: sub.
]

{ #category : #example }
Menu class >> exampleWithTwoSimpleItems [
	"self exampleWithTwoSimpleItems"
	| s |
	s := (self withModel: Transcript ) label: 'Hello'. 
	s add: 'Print Hello' action: (MessageSend receiver: [Transcript show: 'Hello', String cr] selector: #value).
	s add: 'Print Hello again' selector: #show: argumentList: {'Hello again', String cr}.

]

{ #category : #construction }
Menu >> add: aString [
	^ self add: aString action: nil
	
]

{ #category : #construction }
Menu >> add: aString action: aMessageSend [
	| item |
	item := self addMenuItem.
	item label: aString.
	item action: aMessageSend.
	^item
]

{ #category : #construction }
Menu >> add: aString selector: aSelector argumentList: anArray [
	^self add: aString action: (MessageSend 
				receiver: model 
				selector: aSelector
				arguments: anArray).
]

{ #category : #construction }
Menu >> add: aString target: anObject selector: aSelector argumentList: anArray [
	^self add: aString action: (MessageSend 
				receiver: anObject 
				selector: aSelector
				arguments: anArray).
]

{ #category : #construction }
Menu >> addList: aList [
	"Add the given items to this menu, where each item is a pair (<string> <actionSelector>)..  If an element of the list is simply the symobl $-, add a line to the receiver.  The optional third element of each entry, if present, provides balloon help."

	aList do: [:tuple |
		(tuple == #-)
			ifTrue: [self addSeparator]
			ifFalse:[ | item |
				item := self add: tuple first target: model selector: tuple second argumentList: #().
				(tuple size > 2 and: [tuple third notNil]) ifTrue:
					[item help: tuple third].
				(tuple size > 3 and: [tuple fourth notNil]) ifTrue: 
					[item icon: (self theme  iconNamed: tuple fourth)]]]
]

{ #category : #construction }
Menu >> addMenuItem [
	| item |
	item := self newMenuItem.
	self items add: item.
	^item
]

{ #category : #construction }
Menu >> addSeparator [
	self items isEmpty ifTrue:[^nil].
	self items last separator: true.
]

{ #category : #utils }
Menu >> analyzeItemLabels [
	"Analyze the item labels"
	items ifNotNil: [items do:[:item| item analyzeLabel]]

]

{ #category : #accessing }
Menu >> items [
	^ items ifNil: [items := OrderedCollection new]
]

{ #category : #factory }
Menu >> menuItemClass [

	^ MenuItem 
]

{ #category : #accessing }
Menu >> model [
	^ model
]

{ #category : #accessing }
Menu >> model: anObject [
	model := anObject
]

{ #category : #factory }
Menu >> newMenuItem [
	^ self menuItemClass new
]
