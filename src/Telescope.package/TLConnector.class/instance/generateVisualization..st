generation - group
generateVisualization: aTLVisualization
	self displayGroupElement: (self generateGroup: aTLVisualization).
	self generateLegend: aTLVisualization legend.
	self postGenerationFor: aTLVisualization	"the connection is not managed because it does not exist"