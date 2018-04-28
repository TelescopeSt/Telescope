"
I am a static legend entry to add a signification to a color
"
Class {
	#name : #TLColorLegendEntry,
	#superclass : #TLStaticLegendEntry,
	#instVars : [
		'color'
	],
	#category : #'Telescope-Core-Model-Legend'
}

{ #category : #creation }
TLColorLegendEntry class >> description: aString color: aColor [
	^ (self description: aString)
		color: aColor;
		yourself
]

{ #category : #accessing }
TLColorLegendEntry >> color [
	^ color
]

{ #category : #accessing }
TLColorLegendEntry >> color: anObject [
	color := anObject
]

{ #category : #generation }
TLColorLegendEntry >> generateWith: aTLConnector [
	^ aTLConnector generateTLColorLegendEntry: self
]
