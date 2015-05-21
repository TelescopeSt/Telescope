building
buildVisualization
	self configureInteractions.
	self buildLegend.
	self shape: TLEllipseShape new.
	self styleSheet nodeLabel: #name.
	self addNodeFromEntity: self root