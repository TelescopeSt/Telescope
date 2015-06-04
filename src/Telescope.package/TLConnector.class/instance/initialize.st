initialization
initialize
	super initialize.
	self shapeByDrawable: Dictionary new.
	self menuInteractionByDrawable: Dictionary new.
	self interactionsByDrawable: Dictionary new.
	self nestByParent: Dictionary new