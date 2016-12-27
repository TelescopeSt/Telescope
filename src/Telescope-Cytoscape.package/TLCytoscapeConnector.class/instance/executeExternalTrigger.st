executing - interaction
executeExternalTrigger
	| drawables |
	drawables := self drawablesById.
	drawables anyOne allInteractions 
		select: [ :anInteraction |  anInteraction shouldOccursOn: #externalTrigger ]
		thenDo: [ :anInteraction |
			self
				executeInteraction: anInteraction
				forDrawables: (drawables select: [ :aDrawable | anInteraction shouldOccursOn: #externalTrigger with: aDrawable ]) ]