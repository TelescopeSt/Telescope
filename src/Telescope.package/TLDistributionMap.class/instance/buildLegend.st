building
buildLegend
	super buildLegend.
	self legend backGroundDescription: [ :entity | (property cull: entity) asString ] forNodes: (self > #containers) allChildrenNodes