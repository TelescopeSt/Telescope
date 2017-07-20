accessing
parent: aTLVisualization
	self assert: aTLVisualization isVisualization description: 'A legend can only have a visualization as parent'.
	parent := aTLVisualization