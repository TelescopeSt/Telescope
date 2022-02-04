Class {
	#name : #TLStyleSheetLegendEntry,
	#superclass : #TLStaticLegendEntry,
	#instVars : [
		'icon'
	],
	#category : #'Telescope-Core-Model-Legend'
}

{ #category : #'instance creation' }
TLStyleSheetLegendEntry class >> description: aDescription styleSheet: aStyleSheet [
	^ (self description: aDescription)
		styleSheet:  aStyleSheet;
		yourself
]

{ #category : #'instance creation' }
TLStyleSheetLegendEntry class >> description: aDescription styleSheet: aStyleSheet icon: aString [
	^ (self description: aDescription)
		styleSheet:  aStyleSheet;
		icon: aString;
		yourself
]

{ #category : #generation }
TLStyleSheetLegendEntry >> generateWith: aTLCytoscapeConnector [ 
	^ aTLCytoscapeConnector  generateTLStyleSheetLegendEntry: self
]

{ #category : #generation }
TLStyleSheetLegendEntry >> icon [
  ^icon
]

{ #category : #generation }
TLStyleSheetLegendEntry >> icon:aString [
  icon:=aString
]
