generation - interaction
generateShapeInteraction: aTLShapeInteraction onDrawable: aTLDrawable
	| element |
	aTLShapeInteraction shape updateWithDrawable: aTLDrawable.
	element := self createElementInteractionFromInteraction: aTLShapeInteraction onDrawable: aTLDrawable.
	self addElementInteractionInView: element.
	(self shapeInteractionByDrawable at: aTLDrawable ifAbsentPut: [ OrderedCollection new ]) add: element