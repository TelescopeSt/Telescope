generation - interaction
generateInteractionsOf: aDrawable
	aDrawable allInteractions
		select: [ :anInteraction | anInteraction condition value: aDrawable ]
		thenDo: [ :anInteraction | anInteraction generateWith: self on: aDrawable ]