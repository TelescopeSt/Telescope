building
buildVisualization
	self configureInteractions.
	self buildLegend.
	self nodeBuilder shapeBuilder: TLEllipseShape new.
	self nodeBuilder nodeLabel: #name position: #inside.
	self addNodeFromEntity: self root