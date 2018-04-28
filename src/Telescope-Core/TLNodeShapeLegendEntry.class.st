Class {
	#name : #TLNodeShapeLegendEntry,
	#superclass : #TLDynamicLegendEntry,
	#category : #'Telescope-Core-Model-Legend'
}

{ #category : #generation }
TLNodeShapeLegendEntry >> generateWith: aTLCytoscapeConnector [
	^ aTLCytoscapeConnector generateNodeShapeLegendEntry: self
]
