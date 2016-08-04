as yet unclassified
parent: aNode
	self assert: (aNode isNil or: [ aNode isVisualization ]) description: 'Only visualizations can have connections as childrens'.
	parent := aNode