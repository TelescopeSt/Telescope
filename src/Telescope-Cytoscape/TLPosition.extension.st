Extension { #name : #TLPosition }

{ #category : #'*Telescope-Cytoscape' }
TLPosition >> forQTip [
	^ self vertical, ' ', self horizontal
]
