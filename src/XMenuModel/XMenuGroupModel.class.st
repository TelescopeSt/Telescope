"
I am a group of menu items.

I am part of a menu, and groups items by meaning
"
Class {
	#name : #XMenuGroupModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'items',
		'autoRefresh'
	],
	#category : 'XMenuModel'
}

{ #category : #specs }
XMenuGroupModel class >> adapterName [

	^ #MenuGroupAdapter
]

{ #category : #specs }
XMenuGroupModel class >> defaultSpec [
	<spec: #default>
	
	^ #(MenuGroupAdapter
		adapt: #(model))
]

{ #category : #protocol }
XMenuGroupModel >> addItem: aBlock [
	| item |
	
	item := XMenuItemModel new.
	aBlock value: item.
	self addMenuItem: item
]

{ #category : #private }
XMenuGroupModel >> addMenuItem: aMenuItem [

	items add: aMenuItem.
	self autoRefresh 
		ifNotNil: [ aMenuItem autoRefresh: self autoRefresh ]
]

{ #category : #protocol }
XMenuGroupModel >> autoRefresh [

	^ autoRefresh value
]

{ #category : #protocol }
XMenuGroupModel >> autoRefresh: aBoolean [

	autoRefresh value: aBoolean
]

{ #category : #private }
XMenuGroupModel >> buildWithSpecLayout: aSpecLayout [
	"Build the widget using the spec name provided as argument"
	| widget |
	
	widget := SpecInterpreter interpretASpec: aSpecLayout model: self.
	widget := widget asWidget.
	
	self announce: (WidgetBuilt model: self widget: widget).
	
	^ widget
]

{ #category : #'protocol-building' }
XMenuGroupModel >> fromSpec: aSpec [

	aSpec addToMenuGroupModel: self
]

{ #category : #initialize }
XMenuGroupModel >> initialize [

	super initialize.

	items := OrderedCollection new asReactiveVariable.
	autoRefresh := nil asReactiveVariable.
	
	autoRefresh whenChangedDo: [ :aBoolean | self menuItems do: [ :each | each autoRefresh: aBoolean ] ]
]

{ #category : #testing }
XMenuGroupModel >> isEmpty [

	^ items isEmpty
]

{ #category : #protocol }
XMenuGroupModel >> menuItems [

	^ items value
]
