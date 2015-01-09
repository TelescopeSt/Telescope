generation - interaction
createElementInteractionFromInteraction: aTLShapeInteraction onDrawable: aTLDrawable
	| shapeInteraction interactionElement element |
	shapeInteraction := aTLShapeInteraction shape generateWith: self.
	interactionElement := shapeInteraction element.
	
	"This part has to be improved"
	element := self elementFromTLDrawable: aTLDrawable.
	aTLShapeInteraction placeShape: interactionElement relativeToElement: element.
	""
	
	interactionElement
		when: TRMouseLeftClick
		do: [ 
			self executeInteraction: aTLShapeInteraction forDrawable: aTLDrawable.
			aTLShapeInteraction shape updateWithDrawable: aTLDrawable.
			self update: interactionElement shape withTLShape: aTLShapeInteraction shape.
			interactionElement update ].
	^ interactionElement