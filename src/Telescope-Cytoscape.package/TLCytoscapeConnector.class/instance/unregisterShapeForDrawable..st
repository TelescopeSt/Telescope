accessing
unregisterShapeForDrawable: aDrawable
	super unregisterShapeForDrawable: aDrawable.
	self drawablesById keysAndValuesRemove: [ :shape :drawable | aDrawable = drawable ].