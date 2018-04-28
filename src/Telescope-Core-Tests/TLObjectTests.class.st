Class {
	#name : #TLObjectTests,
	#superclass : #TestCase,
	#instVars : [
		'tlObject'
	],
	#category : #'Telescope-Core-Tests'
}

{ #category : #running }
TLObjectTests >> setUp [
	tlObject := TLObject new
]

{ #category : #tests }
TLObjectTests >> testObtainOnBlock [
	self assert: (tlObject obtain: [ :object | {object} ] on: tlObject) equals: {tlObject}
]

{ #category : #tests }
TLObjectTests >> testObtainOnNonExistingMethodCall [
	self should: [ tlObject obtain: #foo on: tlObject ] raise: MessageNotUnderstood
]

{ #category : #tests }
TLObjectTests >> testObtainOnNonValuable [
	self assert: (tlObject obtain: (1 to: 5) on: tlObject) equals: (1 to: 5)
]

{ #category : #tests }
TLObjectTests >> testObtainOnSimpleMethodCall [
	self assert: (tlObject obtain: #class on: tlObject) equals: TLObject
]
