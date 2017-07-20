building
buildLegend
	super buildLegend.
	self legend backgroundDescription: [ :entity | (property cull: entity) asString ] forNodes: (self > #containers) allChildrenNodes