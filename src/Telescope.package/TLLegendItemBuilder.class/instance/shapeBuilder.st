accessing
shapeBuilder
	^ shapeBuilder ifNil: [ self defaultShapeBuilder ]