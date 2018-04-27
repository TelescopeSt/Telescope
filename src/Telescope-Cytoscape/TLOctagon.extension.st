Extension { #name : #TLOctagon }

{ #category : #'*Telescope-Cytoscape' }
TLOctagon classSide >> forCytoscape [
	^ 'octagon'
]

{ #category : #'*Telescope-Cytoscape' }
TLOctagon classSide >> forCytoscapeConnection [
	^ TLCytoscapeNotSupportedFunctionalityException signal: 'Impossible to put an octagon on a connection'
]
