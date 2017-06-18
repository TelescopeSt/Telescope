building
buildVisualization
	super buildVisualization.
	self addNodesFromEntities: self versionsNodes.
	self connectFollowingProperty: [ :each | each projects collect: #version ].
	self styleSheet
		nodeLabel: [ :each | #(#ConfigurationOf #BaselineOf) inject: each asString into: [ :name :toRemove | name copyReplaceAll: toRemove with: '' ] ];
		nodeLabelPosition: #bottom;
		labelSize: 11.
	self layout: self defaultLayout