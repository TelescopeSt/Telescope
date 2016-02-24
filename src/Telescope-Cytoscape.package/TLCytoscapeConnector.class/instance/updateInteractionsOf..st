updating - interaction
updateInteractionsOf: aDrawable
	self flag: #todo.	"Remove the interaction that are no longer needed and add the new ones."
	(aDrawable allInteractions select: #isGraphicallyRepresented)
		do: [ :aGraphicInteraction | aGraphicInteraction updateWith: self forDrawable: aDrawable ]