Extension { #name : #TLArrow }

{ #category : #'*Telescope-Cytoscape' }
TLArrow classSide >> forCytoscapeConnection [
	^ 'triangle-backcurve'
]

{ #category : #'*Telescope-Cytoscape' }
TLArrow classSide >> forCytoscapeNode [
	^ TLCytoscapeNotSupportedFunctionalityException signal: 'Arrow is only usable for connections'
]
