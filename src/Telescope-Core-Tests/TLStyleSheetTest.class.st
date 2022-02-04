Class {
	#name : #TLStyleSheetTest,
	#superclass : #TestCase,
	#instVars : [
		'stylesheet'
	],
	#category : #'Telescope-Core-Tests-Style'
}

{ #category : #running }
TLStyleSheetTest >> setUp [
	super setUp.
	stylesheet := TLStyleSheet new
]

{ #category : #tests }
TLStyleSheetTest >> testCreation [
]

{ #category : #tests }
TLStyleSheetTest >> testObtainValueForEntityWithBlock [
	stylesheet color: [:entity | Color red].
	self assert: (stylesheet obtainValue: #color forEntity: 1 inNode: #node) equals: Color red
]

{ #category : #tests }
TLStyleSheetTest >> testObtainValueForEntityWithDirectValue [
	stylesheet color: Color red.
	self assert: (stylesheet obtainValue: #color forEntity: 1 inNode: #node) equals: Color red
]

{ #category : #tests }
TLStyleSheetTest >> testObtainValueForEntityWithGradient [
	stylesheet color: (Color red property: #yourself gradientAt: 1).
	self assert: (stylesheet obtainValue: #color forEntity: 1 inNode: #node) equals: Color red
]

{ #category : #tests }
TLStyleSheetTest >> testObtainValueForEntityWithStringDirectValue [
	stylesheet nodeLabel: 'Foo'.
	self assert: (stylesheet obtainValue: #nodeLabel forEntity: 1 inNode: #node) equals: 'Foo'
]

{ #category : #tests }
TLStyleSheetTest >> testObtainValueForEntityWithSymbol [
	stylesheet color: #red.
	self assert: (stylesheet obtainValue: #color forEntity: Color inNode: #node) equals: Color red
]

{ #category : #tests }
TLStyleSheetTest >> testObtainValueForEntityWithWrongBlock [
	stylesheet color: [ :entity | entity foo ].
	self should: [ stylesheet obtainValue: #color forEntity: 1 inNode: #node ] raise: TLStyleSheetPropertyBadlyUsed
]

{ #category : #tests }
TLStyleSheetTest >> testObtainValueWithMissingProperty [
	self should: [ stylesheet obtainValue: #color forEntity: 1 inNode: #node] raise: TLStyleSheetMissingProperty
]
