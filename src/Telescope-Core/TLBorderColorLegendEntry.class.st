"
I am a static legend entry to add a signification to a border color
"
Class {
	#name : #TLBorderColorLegendEntry,
	#superclass : #TLStaticLegendEntry,
	#instVars : [
		'color'
	],
	#category : #'Telescope-Core-Model-Legend'
}

{ #category : #creation }
TLBorderColorLegendEntry class >> description: aString color: aColor [
	^ (self description: aString)
		color: aColor;
		yourself
]

{ #category : #accessing }
TLBorderColorLegendEntry >> color [
	^ color
]

{ #category : #accessing }
TLBorderColorLegendEntry >> color: anObject [
	color := anObject
]

{ #category : #generation }
TLBorderColorLegendEntry >> generateWith: aTLConnector [
	^ aTLConnector generateTLBorderColorLegendEntry: self
]
