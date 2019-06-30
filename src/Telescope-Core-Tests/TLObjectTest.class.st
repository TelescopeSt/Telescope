Class {
	#name : #TLObjectTest,
	#superclass : #TestCase,
	#instVars : [
		'tlObject'
	],
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #running }
TLObjectTest >> setUp [
	tlObject := TLObject new
]

{ #category : #tests }
TLObjectTest >> testError [
	self should: [ tlObject error: 'Test' ] raise: TLError
]

{ #category : #tests }
TLObjectTest >> testObtainOnBlock [
	self assert: (tlObject obtain: [ :object | {object} ] on: tlObject) equals: {tlObject}
]

{ #category : #tests }
TLObjectTest >> testObtainOnNonExistingMethodCall [
	self should: [ tlObject obtain: #foo on: tlObject ] raise: MessageNotUnderstood
]

{ #category : #tests }
TLObjectTest >> testObtainOnNonValuable [
	self assert: (tlObject obtain: (1 to: 5) on: tlObject) equals: (1 to: 5)
]

{ #category : #tests }
TLObjectTest >> testObtainOnSimpleMethodCall [
	self assert: (tlObject obtain: #class on: tlObject) equals: TLObject
]
