"
I am the legend entry for nodes width
"
Class {
	#name : 'TLWidthLegendEntry',
	#superclass : 'TLStaticLegendEntry',
	#category : 'Telescope-Core-Model-Legend',
	#package : 'Telescope-Core',
	#tag : 'Model-Legend'
}

{ #category : 'generation' }
TLWidthLegendEntry >> generateWith: aTLCytoscapeConnector [ 
	^ aTLCytoscapeConnector generateTLWidthLegendEntry: self
]
