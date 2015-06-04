generation - interaction
generateShapeInteraction: aTLShapeInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
	| triggerElement |
	"Create graphic element"
	triggerElement := aTLShapeInteraction shapeTrigger generateWith: self.
	"place it"
	self
		placeElement: triggerElement
		correspondingToTrigger: aTLShapeInteraction shapeTrigger
		relativeToDrawable: aTLDrawable.
	"add it to the view"
	self addElementInteractionInView: triggerElement.
	"register the element in the connector"
	self shapeByDrawable at: aTLShapeInteraction shapeTrigger put: triggerElement.
	"register the interaction on the drawable"
	(self registerInteraction: aTLShapeInteraction onDrawable: aTLDrawable).
	
	self generateInteractionsOf: aTLShapeInteraction shapeTrigger targetingDrawable: aTargetDrawable