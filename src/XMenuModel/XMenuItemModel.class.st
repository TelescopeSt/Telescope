"
I represent a menu item.

I have a name, a description, an icon, a shortcut, and an action to perform (aBlock).

I can also have a sub menu.
(and usually I do NOT have an action AND a sub menu)
"
Class {
	#name : #XMenuItemModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'action',
		'name',
		'shortcut',
		'subMenu',
		'icon',
		'description',
		'state',
		'enabled',
		'autoRefresh'
	],
	#category : 'XMenuModel'
}

{ #category : #specs }
XMenuItemModel class >> adapterName [

	^ #MenuItemAdapter
]

{ #category : #specs }
XMenuItemModel class >> defaultSpec [
	<spec: #default>
	
	^ #(MenuItemAdapter
		adapt: #(model))
]

{ #category : #accessing }
XMenuItemModel >> action [

	^ action value
]

{ #category : #accessing }
XMenuItemModel >> action: aBlock [

	action value: aBlock
]

{ #category : #accessing }
XMenuItemModel >> autoRefresh [

	^ autoRefresh value
]

{ #category : #accessing }
XMenuItemModel >> autoRefresh: aBlock [

	autoRefresh value: aBlock
]

{ #category : #protocol }
XMenuItemModel >> description [

	^ description value
]

{ #category : #protocol }
XMenuItemModel >> description: aString [

	description value: aString
]

{ #category : #accessing }
XMenuItemModel >> enabled [

	^ enabled value
]

{ #category : #accessing }
XMenuItemModel >> enabled: aBoolean [

	enabled value: aBoolean
]

{ #category : #'protocol-building' }
XMenuItemModel >> fromSpec: aSpec [

	aSpec addToMenuItemModel: self
]

{ #category : #protocol }
XMenuItemModel >> icon [

	^ icon value
]

{ #category : #protocol }
XMenuItemModel >> icon: anIcon [

	icon value: anIcon
]

{ #category : #initialize }
XMenuItemModel >> initialize [

	super initialize.

	action := [] asReactiveVariable.
	enabled := true asReactiveVariable.
	state := nil asReactiveVariable.
	description := nil asReactiveVariable.
	name := '' asReactiveVariable.
	shortcut := nil asReactiveVariable.
	subMenu := nil asReactiveVariable.
	autoRefresh := false asReactiveVariable.
	icon := nil asReactiveVariable
]

{ #category : #protocol }
XMenuItemModel >> name [

	^ name value
]

{ #category : #protocol }
XMenuItemModel >> name: aString [

	name value: aString
]

{ #category : #protocol }
XMenuItemModel >> performMenuActionWith: aMenuItem [
	| en |

	en := self enabled.
	en isBlock ifTrue: [ en := en value ].
	en ifFalse: [ ^ self ].

	action value cull: aMenuItem
]

{ #category : #protocol }
XMenuItemModel >> shortcut [

	^ shortcut value
]

{ #category : #protocol }
XMenuItemModel >> shortcut: aShortcut [

	shortcut value: aShortcut
]

{ #category : #accessing }
XMenuItemModel >> state [

	^ state value
]

{ #category : #accessing }
XMenuItemModel >> state: aBoolean [

	state value: aBoolean
]

{ #category : #protocol }
XMenuItemModel >> subMenu [

	^ subMenu value
]

{ #category : #protocol }
XMenuItemModel >> subMenu: aMenuModel [

	subMenu value: aMenuModel
]
