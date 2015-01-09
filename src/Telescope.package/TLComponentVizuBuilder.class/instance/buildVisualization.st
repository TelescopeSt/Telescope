building
buildVisualization
	self componentsToDisplay do: [ :acomp | self addNodeFromEntity: acomp].
	self doLayout.
	super buildVisualization