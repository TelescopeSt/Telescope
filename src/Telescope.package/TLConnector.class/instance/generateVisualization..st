generation - group
generateVisualization: aTLVisualization
	self displayGroupElement: (self generateGroup: aTLVisualization).
	aTLVisualization legend generateWith: self.
	self postGenerationFor: aTLVisualization	"the connection is not managed because it does not exist"