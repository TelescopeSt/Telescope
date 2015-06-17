generation - interaction
generateShapeInteraction: aTLShapeInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
	| triggerElement trigger |
	"Create a trigger for the drawable"
	trigger := (aTLShapeInteraction shapeTrigger copyForDrawable: aTargetDrawable).
	"Create graphic element"
	triggerElement := trigger generateWith: self.
	"place it"
	
	self
		placeElement: triggerElement
		correspondingToTrigger: trigger
		relativeToDrawable: aTLDrawable.
	"add it to the view"
	self addElementInteractionInView: triggerElement.
	"register the element in the connector"
	self shapeByDrawable at: trigger put: triggerElement.
	"register the interaction on the drawable"
	(self registerInteraction: aTLShapeInteraction withTrigger: trigger onDrawable: aTLDrawable).
	
	self generateInteractionsOf: trigger targetingDrawable: aTargetDrawable