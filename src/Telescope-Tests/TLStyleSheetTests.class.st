Class {
	#name : #TLStyleSheetTests,
	#superclass : #TestCase,
	#instVars : [
		'stylesheet'
	],
	#category : 'Telescope-Tests-Style'
}

{ #category : #running }
TLStyleSheetTests >> setUp [
	stylesheet := TLStyleSheet new
]

{ #category : #tests }
TLStyleSheetTests >> testCreation [
]

{ #category : #tests }
TLStyleSheetTests >> testObtainValueForEntityWithBlock [
	stylesheet color: [:entity | Color red].
	self assert: (stylesheet obtainValue: #color forEntity: 1 inNode: #node) equals: Color red
]

{ #category : #tests }
TLStyleSheetTests >> testObtainValueForEntityWithDirectValue [
	stylesheet color: Color red.
	self assert: (stylesheet obtainValue: #color forEntity: 1 inNode: #node) equals: Color red
]

{ #category : #tests }
TLStyleSheetTests >> testObtainValueForEntityWithGradient [
	stylesheet color: (Color red property: #yourself gradientAt: 1).
	self assert: (stylesheet obtainValue: #color forEntity: 1 inNode: #node) equals: Color red
]

{ #category : #tests }
TLStyleSheetTests >> testObtainValueForEntityWithStringDirectValue [
	stylesheet nodeLabel: 'Foo'.
	self assert: (stylesheet obtainValue: #nodeLabel forEntity: 1 inNode: #node) equals: 'Foo'
]

{ #category : #tests }
TLStyleSheetTests >> testObtainValueForEntityWithSymbol [
	stylesheet color: #red.
	self assert: (stylesheet obtainValue: #color forEntity: Color inNode: #node) equals: Color red
]

{ #category : #tests }
TLStyleSheetTests >> testObtainValueForEntityWithWrongBlock [
	stylesheet color: [ :entity | entity foo ].
	self should: [ stylesheet obtainValue: #color forEntity: 1 inNode: #node ] raise: TLStyleSheetPropertyBadlyUsed
]

{ #category : #tests }
TLStyleSheetTests >> testObtainValueWithMissingProperty [
	self should: [ stylesheet obtainValue: #color forEntity: 1 inNode: #node] raise: TLStyleSheetMissingProperty
]
