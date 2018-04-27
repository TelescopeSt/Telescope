"
A TLLazyMenuMorph is a submenu that will comput childs only when required.

"
Class {
	#name : #TLLazyMenuMorph,
	#superclass : #MenuMorph,
	#instVars : [
		'childBlock',
		'displayBlock',
		'actionBlock',
		'computed'
	],
	#category : 'Telescope-Connector'
}

{ #category : #accessing }
TLLazyMenuMorph >> actionBlock [
	^ actionBlock
]

{ #category : #accessing }
TLLazyMenuMorph >> actionBlock: anObject [
	actionBlock := anObject
]

{ #category : #accessing }
TLLazyMenuMorph >> childBlock [
	^ childBlock
]

{ #category : #accessing }
TLLazyMenuMorph >> childBlock: anObject [
	childBlock := anObject
]

{ #category : #'as yet unclassified' }
TLLazyMenuMorph >> computeChild [
	self removeAllMorphs.
	self menuItems removeAll.
	self childBlock value
		ifEmpty: [ self
						add: 'empty'
						target: [ :entity | ]
						selector: #cull:
						argument: nil  ]
		ifNotEmptyDo: [ :children | 
			children
				do: [ :aChild | 
					self
						add: (self displayBlock value: aChild)
						target: [ :entity | self actionBlock value: entity ]
						selector: #cull:
						argument: aChild ] ]
]

{ #category : #'as yet unclassified' }
TLLazyMenuMorph >> computeIfNecessary [
	computed ifFalse: [ self computeChild. computed := false ]
]

{ #category : #accessing }
TLLazyMenuMorph >> displayBlock [
	^ displayBlock
]

{ #category : #accessing }
TLLazyMenuMorph >> displayBlock: anObject [
	displayBlock := anObject
]

{ #category : #'as yet unclassified' }
TLLazyMenuMorph >> initialize [
	super initialize.
	computed := false
]
