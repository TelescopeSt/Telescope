building
buildVisualization
	self configureInteractions.
	self buildLegend.
	self styleSheet shape: TLEllipse.
	self styleSheet nodeLabel: #name.
	self addNodeFromEntity: self root