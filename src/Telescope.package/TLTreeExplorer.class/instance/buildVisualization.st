building
buildVisualization
	self configureInteractions.
	self buildLegend.
	self styleSheet shape: TLEllipse.
	self styleSheet nodeLabel: #asString.
	self addNodeFromEntity: self root