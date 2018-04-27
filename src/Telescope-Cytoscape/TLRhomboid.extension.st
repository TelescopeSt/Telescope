Extension { #name : #TLRhomboid }

{ #category : #'*Telescope-Cytoscape' }
TLRhomboid classSide >> forCytoscape [
	^ 'rhomboid'
]

{ #category : #'*Telescope-Cytoscape' }
TLRhomboid classSide >> forCytoscapeConnection [
	^ TLCytoscapeNotSupportedFunctionalityException signal: 'Impossible to put a rhomboid on a connection'
]
