executing - interaction
executeExternalTrigger: aTriggerId
	| drawables |
	drawables := self drawablesById.	"get visualizations to avoid many union of inherit interactions"
	drawables anyOne visualization allInteractions
		select: [ :anInteraction | (anInteraction shouldOccursOn: #externalTrigger) and: [ anInteraction triggerId = aTriggerId ] ]
		thenDo: [ :anInteraction | 
			self
				executeInteraction: anInteraction
				forDrawables: (drawables select: [ :aDrawable | anInteraction shouldOccursOn: #externalTrigger with: aDrawable ]) ]