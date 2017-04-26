building
buildInteractionActions
	self > #center
		addInteraction: (TLPopUpAction text: #asString) onMouseOver;
		addNodeFromEntity: self centerNode.
	self > #around
		addInteraction: (TLPopUpAction text: #asString) onMouseOver.
	defaultInteraction
		ifTrue: [ self > #around addInteraction: self selectNodeInteraction ]