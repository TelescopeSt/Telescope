generation - group
generateVisualization: aTLVisualization
	self flag: 'we should not access trachelShape pushFront at thie level but in Roassal2Connector'.
	self displayGroupElement: (self generateGroup: aTLVisualization).
	self generateLegend: aTLVisualization legend.
	self postGenerationFor: aTLVisualization	"the connection is not managed because it does not exist"