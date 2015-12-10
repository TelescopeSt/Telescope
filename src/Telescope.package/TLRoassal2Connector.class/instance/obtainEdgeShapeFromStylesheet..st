generation - connection
obtainEdgeShapeFromStylesheet: aStylesheet
	^ ((aStylesheet > #target) shape = TLTriangle
		ifTrue: [ RTArrowedLine ]) new
		attachPoint: TLTelescopeAttachPoint new;
		color: aStylesheet backgroundColor;
		yourself