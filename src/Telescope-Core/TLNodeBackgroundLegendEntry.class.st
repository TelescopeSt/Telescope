Class {
	#name : #TLNodeBackgroundLegendEntry,
	#superclass : #TLDynamicLegendEntry,
	#category : #'Telescope-Core-Model-Legend'
}

{ #category : #generation }
TLNodeBackgroundLegendEntry >> generateWith: aTLCytoscapeConnector [ 
	^ aTLCytoscapeConnector generateNodeBackgroundLegendEntry: self.
]
