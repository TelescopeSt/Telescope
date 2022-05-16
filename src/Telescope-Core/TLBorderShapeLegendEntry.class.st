"
I am a static legend entry to add a signification to a border shape
"
Class {
	#name : #TLBorderShapeLegendEntry,
	#superclass : #TLStaticLegendEntry,
	#category : #'Telescope-Core-Model-Legend'
}

{ #category : #'instance creation' }
TLBorderShapeLegendEntry class >> description: aString shape: aShape [
	^ (self description: aString)
		shape: aShape;
		yourself
]

{ #category : #generation }
TLBorderShapeLegendEntry >> generateWith: aTLConnector [
	^ aTLConnector generateTLBorderShapeLegendEntry: self
]
