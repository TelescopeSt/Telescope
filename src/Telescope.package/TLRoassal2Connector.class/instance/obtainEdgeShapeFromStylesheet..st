generation - connection
obtainEdgeShapeFromStylesheet: aStylesheet
	self flag: 'here we should manage all roassal shit about lines'.
	^ ((aStylesheet > #head) shape = TLTriangle
		ifTrue: [ RTArrowedLine ] ifFalse: [RTLine]) new
		attachPoint: TLTelescopeAttachPoint new;
		color: aStylesheet color;
		yourself