state
requireUpdate
	super requireUpdate.
	self legend ifNotNilDo: [ :aLegend | aLegend requireUpdate ]