removing - interaction
removeInteractionsOf: aDrawable
	self menuInteractionByDrawable removeKey: aDrawable ifAbsent: [  ].
	
	aDrawable allInteractions do: [ :shapeInteraction | shapeInteraction removeWith: self ].
	self unregisterAllInteractionsForDrawable: aDrawable.