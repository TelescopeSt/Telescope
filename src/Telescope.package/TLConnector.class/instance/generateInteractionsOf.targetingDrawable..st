generation - interaction
generateInteractionsOf: aDrawable targetingDrawable: aTargetDrawable
	aDrawable allInteractions
		select: [ :anInteraction | anInteraction condition value: aTargetDrawable ]
		thenDo: [ :anInteraction | anInteraction generateWith: self on: aDrawable targeting: aTargetDrawable ]