private
configureInteractions
	| shapeInteraction |
	shapeInteraction := (TLEllipseShape new color: (Color red alpha: 0.8); size: 8).
	shapeInteraction stateUpdate at: #expanded put: [ :result  :shape |
		shape color: (result ifTrue: [ Color blue ] ifFalse: [ Color red ]) ].
	self nodeBuilder addInteraction: ((TLExpandCollapseNodesAction new property: (self property)) withShape: shapeInteraction)