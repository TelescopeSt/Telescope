"
I am a simple model describing a menu.

I only contains a list of menu groups. Each group is separated by a splitter
"
Class {
	#name : #XMenuModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'groups',
		'title',
		'icon',
		'autoRefresh'
	],
	#category : 'XMenuModel'
}

{ #category : #specs }
XMenuModel class >> adapterName [

	^ #MenuAdapter
]

{ #category : #specs }
XMenuModel class >> defaultSpec [
	<spec: #default>
	
	^ #(MenuAdapter
		adapt: #(model))
]

{ #category : #specs }
XMenuModel class >> popup [
	<spec>
	
	^ #(MenuAdapter
		adaptAsPopup: #(model))
]

{ #category : #'protocol-building' }
XMenuModel >> addAllFromPragma: pragma target: target [

	self fromSpec: (PragmaMenuBuilder 
		pragmaKeyword: pragma
		model: target) menuSpec
]

{ #category : #protocol }
XMenuModel >> addGroup: aBlock [
	| group |
	
	group := XMenuGroupModel new.
	aBlock value: group.
	self addMenuGroup: group
]

{ #category : #private }
XMenuModel >> addMenuGroup: aMenuGroup [

	groups add: aMenuGroup.
	self autoRefresh 
		ifNotNil: [ aMenuGroup autoRefresh: self autoRefresh ]
]

{ #category : #protocol }
XMenuModel >> applyTo: aModel [

	aModel applyMenuModel: self
]

{ #category : #protocol }
XMenuModel >> autoRefresh [

	^ autoRefresh value
]

{ #category : #protocol }
XMenuModel >> autoRefresh: aBoolean [

	autoRefresh value: aBoolean
]

{ #category : #protocol }
XMenuModel >> buildWithSpecAsPopup [

	^ self buildWithSpec: #popup
]

{ #category : #'protocol-building' }
XMenuModel >> fromSpec: aSpec [

	aSpec addToMenuModel: self
]

{ #category : #protocol }
XMenuModel >> icon [

	^ icon value
]

{ #category : #protocol }
XMenuModel >> icon: anIcon [

	icon value: anIcon
]

{ #category : #initialize }
XMenuModel >> initialize [

	super initialize.

	groups := OrderedCollection new asReactiveVariable.
	title := nil asReactiveVariable.
	icon := nil asReactiveVariable.
	autoRefresh := nil asReactiveVariable.
	
	autoRefresh whenChangedDo: [ :aBoolean | self menuGroups do: [ :each | each autoRefresh: aBoolean ] ]
]

{ #category : #protocol }
XMenuModel >> menuGroups [

	^ groups value
]

{ #category : #protocol }
XMenuModel >> neglect: aModel [

	aModel neglectMenuModel: self
]

{ #category : #protocol }
XMenuModel >> openWithSpecAt: aPosition [

	self buildWithSpecAsPopup.
	self changed: #openAt: with: { aPosition }
]

{ #category : #printing }
XMenuModel >> printOn: aStream [

	super printOn: aStream.
	self title value ifNotNil: [:t | aStream nextPutAll: ' ''', t , '''' ]
]

{ #category : #protocol }
XMenuModel >> title [

	^ title value
]

{ #category : #protocol }
XMenuModel >> title: aString [

	title value: aString
]
