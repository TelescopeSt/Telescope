building
buildVisualization
	self nodeCreationStrategy beRecursive.
	self componentsToDisplay do: [ :acomp | self addNodeFromEntity: acomp].
	self doLayout.
	super buildVisualization