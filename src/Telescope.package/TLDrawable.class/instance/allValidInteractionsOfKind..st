private
allValidInteractionsOfKind: anInteractionClass
	^ self allInteractions
		select: [ :anInteraction | anInteraction class = anInteractionClass and: [ anInteraction condition value: self ] ]