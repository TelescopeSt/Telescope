Class {
	#name : #TLNodeShapeLegendEntry,
	#superclass : #TLDynamicLegendEntry,
	#category : 'Telescope-Model-Legend'
}

{ #category : #generation }
TLNodeShapeLegendEntry >> generateWith: aTLCytoscapeConnector [
	^ aTLCytoscapeConnector generateNodeShapeLegendEntry: self
]
