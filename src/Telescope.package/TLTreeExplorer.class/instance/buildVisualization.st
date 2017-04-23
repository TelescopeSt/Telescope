building
buildVisualization
	self configureInteractions.
	self styleSheet shape: TLEllipse.
	self styleSheet nodeLabel: #asString.
	self addNodeFromEntity: self root.
	super buildVisualization