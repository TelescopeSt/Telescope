Class {
	#name : #MenuItem,
	#superclass : #AbstractMenuElement,
	#instVars : [
		'action',
		'checked',
		'enabled',
		'separator',
		'subMenu',
		'icon',
		'enabledBlock',
		'keyText'
	],
	#category : 'Menus'
}

{ #category : #accessing }
MenuItem >> action [
	"Answer the action associated with the receiver"
	^action
]

{ #category : #accessing }
MenuItem >> action: aMessageSend [
	"Answer the action associated with the receiver"
	action := aMessageSend
]

{ #category : #utils }
MenuItem >> analyzeLabel [
	"For Morphic compatiblity. Some labels include markup such as <on>, <off> etc.
	Analyze the label for these annotations and take appropriate action."
	label ifNotNil: [
		| marker |
		marker := label copyFrom: 1 to: (label indexOf: $>).
		(marker = '<on>' or:[marker = '<yes>']) ifTrue:[
			checked := true.
			label := label copyFrom: marker size+1 to: label size.
		].
		(marker = '<off>' or:[marker = '<no>']) ifTrue:[
			checked := false.
			label := label copyFrom: marker size+1 to: label size.
		]]

]

{ #category : #accessing }
MenuItem >> checked [
	"Answer whether the receiver is checked"
	^checked 
]

{ #category : #accessing }
MenuItem >> checked: aBool [
	"Indicate whether the receiver is checked"
	checked := aBool.
]

{ #category : #accessing }
MenuItem >> enabled [
	"Answer whether the receiver is enabled"
	^ enabledBlock
		ifNil:[enabled ifNil: [ true ]]
		ifNotNil: [ enabledBlock value ]
]

{ #category : #accessing }
MenuItem >> enabled: aBool [
	"Indicate whether the receiver is enabled"
	enabled := aBool
]

{ #category : #accessing }
MenuItem >> enabledBlock [

	^ enabledBlock
]

{ #category : #accessing }
MenuItem >> enabledBlock: aBlock [

	enabledBlock := aBlock
]

{ #category : #testing }
MenuItem >> hasCheckBox [	
	^ checked notNil
]

{ #category : #accessing }
MenuItem >> icon [
	^ icon
]

{ #category : #accessing }
MenuItem >> icon: aForm [
	 icon := aForm
]

{ #category : #accessing }
MenuItem >> keyText [
	^keyText
]

{ #category : #accessing }
MenuItem >> keyText: aString [
	keyText := aString.
]

{ #category : #accessing }
MenuItem >> label [
	"Answer the receiver's label"
	^label
]

{ #category : #accessing }
MenuItem >> label: aString [
	"Set the receiver's label"
	label := aString
]

{ #category : #accessing }
MenuItem >> separator [
	"Answer whether the receiver should be followed by a separator"
	^separator ifNil:[false]
]

{ #category : #accessing }
MenuItem >> separator: aBool [
	"Indicate whether the receiver should be followed by a separator"
	separator := aBool.
]

{ #category : #accessing }
MenuItem >> subMenu [
	"Answer the receiver's subMenu"
	^subMenu
]

{ #category : #accessing }
MenuItem >> subMenu: aMenuSpec [
	"Answer the receiver's subMenu"
	subMenu := aMenuSpec
]
