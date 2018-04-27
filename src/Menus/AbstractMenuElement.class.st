Class {
	#name : #AbstractMenuElement,
	#superclass : #Object,
	#instVars : [
		'name',
		'help',
		'label'
	],
	#category : 'Menus'
}

{ #category : #accessing }
AbstractMenuElement >> label [
	"to be deprecated to follow the Spec API"
	^ label
]

{ #category : #accessing }
AbstractMenuElement >> label: aString [
	"to be deprecated to follow the Spec API"
	label := aString
]

{ #category : #accessing }
AbstractMenuElement >> name [
	"to be deprecated to follow the Spec API"
	^ label
]

{ #category : #accessing }
AbstractMenuElement >> name: aString [
	"to be deprecated to follow the Spec API"
	label := aString
]

{ #category : #accessing }
AbstractMenuElement >> title [

	^ label
]

{ #category : #accessing }
AbstractMenuElement >> title: aString [
	"to be deprecated to follow the Spec API"
	label := aString
]
