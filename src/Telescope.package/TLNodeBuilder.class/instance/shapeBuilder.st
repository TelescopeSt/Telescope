accessing
shapeBuilder
	shapeBuilder ifNil: [ shapeBuilder := self defaultShapeBuilder ].
	^ shapeBuilder