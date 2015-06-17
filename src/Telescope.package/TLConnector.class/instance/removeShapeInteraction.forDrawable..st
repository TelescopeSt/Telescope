removing - interaction
removeShapeInteraction: aTLShapeInteraction forDrawable: aTLDrawable
	"here we are removing the trigger from the connector after asked to it to remove from the view"
	(self triggerForInteractionAndDrawable removeKey: aTLShapeInteraction -> aTLDrawable) removeWith: self