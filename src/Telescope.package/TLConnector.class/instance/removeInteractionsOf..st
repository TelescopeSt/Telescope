removing - interaction
removeInteractionsOf: aDrawable

	(self interactionsByDrawable removeKey: aDrawable ifAbsent: [ #() ]) do: [ :interaction | interaction removeWith: self  forDrawable: aDrawable].
	self menuInteractionByDrawable removeKey: aDrawable ifAbsent: [  ].