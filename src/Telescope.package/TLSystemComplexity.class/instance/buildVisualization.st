building
buildVisualization
	self styleSheet width: [ :c | c numberOfVariables * 5 max: 5 ]; height: [ :c | c numberOfMethods max: 5 ];backgroundColor: ((RTGrayLinearColor new command: #linesOfCode; scope: self root withAllSubclasses));borderColor: Color black.
	self > #default addNodeFromEntity: self root.
	self createNodesUsingPropertyOf: self root.
	self > #default connectFollowingProperty: self property.
	self > #default layout: RTTreeLayout.