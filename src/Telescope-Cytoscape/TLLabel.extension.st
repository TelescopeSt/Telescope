Extension { #name : #TLLabel }

{ #category : #'*Telescope-Cytoscape' }
TLLabel classSide >> cytoscapeAttribute [
	^ #'shape-polygon-points'
]

{ #category : #'*Telescope-Cytoscape' }
TLLabel classSide >> forCytoscapeConnection [
	^ TLCytoscapeNotSupportedFunctionalityException signal: 'Impossible to put a label on a connection'
]

{ #category : #'*Telescope-Cytoscape' }
TLLabel classSide >> polygonPoints [
	^ {(-1 @ 0.7).
	(0.5 @ 0.7).
	(1 @ 0).
	(0.5 @ -0.7).
	(-1 @ -0.7)}
]
