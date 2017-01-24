interaction
addInteraction: anInteraction 
	self do: [ :each | each addInteraction: anInteraction ].
	^ anInteraction