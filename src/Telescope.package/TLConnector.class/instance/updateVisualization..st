updating - group
updateVisualization: aTLVisualization
	self updateAllConnections.
	self updateGroup: aTLVisualization.
	aTLVisualization legend updateWith: self.
	self updateView 