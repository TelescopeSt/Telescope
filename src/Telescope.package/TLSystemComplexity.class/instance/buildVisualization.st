building
buildVisualization
	self nodeBuilder shapeBuilder width: [ :c | c numberOfVariables * 5 max: 5 ].
	self nodeBuilder shapeBuilder height: [ :c | c numberOfMethods max: 5 ].
	self nodeBuilder backgroundColor: ((RTGrayLinearColor new command: #linesOfCode; scope: self root withAllSubclasses)).
	self nodeBuilder borderColor: Color black.
	self > #default addNodeFromEntity: self root.
	self createNodesUsingPropertyOf: self root.
	self > #default connectFollowingProperty: self property.
	self > #default layout: RTTreeLayout.