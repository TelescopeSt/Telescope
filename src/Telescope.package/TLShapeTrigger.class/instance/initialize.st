as yet unclassified
initialize
	super initialize.
	action:= (TLCustomAction block: [:aDrawable | self shapeInteraction actionOn: aDrawable])