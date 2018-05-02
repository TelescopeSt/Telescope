Class {
	#name : #TLGradientTests,
	#superclass : #TestCase,
	#instVars : [
		'gradient'
	],
	#category : #'Telescope-Core-Tests-Style'
}

{ #category : #running }
TLGradientTests >> setUp [
	gradient:= TLGradient new levelProperty: #yourself.
]

{ #category : #tests }
TLGradientTests >> testRatioForLevel [
	gradient to: Color red at: 5.
	gradient to: Color green at: 15.
	self assert: (gradient value: 2) equals: Color red.
	self assert: (gradient value: 5) equals: Color red.
	self assert: (gradient value: 7.5) equals: (Color red alphaMixed: 0.75 with: Color green ).
	self assert: (gradient value: 10) equals: (Color red alphaMixed: 0.5 with: Color green ).
	self assert: (gradient value: 12.5) equals: (Color red alphaMixed: 0.25 with: Color green ).
	self assert: (gradient value: 15) equals: Color green.
	self assert: (gradient value: 17) equals: Color green
]
