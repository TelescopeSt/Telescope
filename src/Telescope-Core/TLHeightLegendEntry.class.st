"
I am the legend entry for nodes height
"
Class {
	#name : 'TLHeightLegendEntry',
	#superclass : 'TLStaticLegendEntry',
	#category : 'Telescope-Core-Model-Legend',
	#package : 'Telescope-Core',
	#tag : 'Model-Legend'
}

{ #category : 'generation' }
TLHeightLegendEntry >> generateWith: aTLCytoscapeConnector [ 
	^ aTLCytoscapeConnector generateTLHeightLegendEntry: self
]
