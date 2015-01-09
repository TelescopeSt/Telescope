generation - group
generateVisualization: aTLVisualization
	self flag: 'we should not access trachelShape pushFront at thie level but in Roassal2Connector'.
	self generateGroup: aTLVisualization.
	self generateLegend: aTLVisualization legend.
	aTLVisualization allConnections do: [ :aConnection | (self elementFromTLDrawable: aConnection) trachelShape pushFront ]
	