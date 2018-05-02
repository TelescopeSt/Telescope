"
I am a legend entry explaining a gradient
"
Class {
	#name : #TLGradientLegendEntry,
	#superclass : #TLStaticLegendEntry,
	#instVars : [
		'gradient'
	],
	#category : #'Telescope-Core-Model-Legend'
}

{ #category : #'instance-creation' }
TLGradientLegendEntry class >> description: aDescription gradient: aGradient [
	^ (self description: aDescription)
		gradient: aGradient;
		yourself
]

{ #category : #generation }
TLGradientLegendEntry >> generateWith: aTLCytoscapeConnector [ 
	^ aTLCytoscapeConnector generateTLGradientLegendEntry: self
]

{ #category : #accessing }
TLGradientLegendEntry >> gradient [
	^ gradient
]

{ #category : #accessing }
TLGradientLegendEntry >> gradient: anObject [
	gradient := anObject
]
