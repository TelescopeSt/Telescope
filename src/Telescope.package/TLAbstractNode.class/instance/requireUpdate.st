as yet unclassified
requireUpdate
	super requireUpdate.
	[self shape updateWithDrawable: self] on: KeyNotFound do: [ ]