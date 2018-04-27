Class {
	#name : #TLNodeBackgroundLegendEntry,
	#superclass : #TLDynamicLegendEntry,
	#category : 'Telescope-Model-Legend'
}

{ #category : #generation }
TLNodeBackgroundLegendEntry >> generateWith: aTLCytoscapeConnector [ 
	^ aTLCytoscapeConnector generateNodeBackgroundLegendEntry: self.
]
