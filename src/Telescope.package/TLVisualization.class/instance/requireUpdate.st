state
requireUpdate
	super requireUpdate.
	self legend ifNotNil: [ :aLegend | aLegend requireUpdate ]