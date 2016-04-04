building
buildInteractionActions
	self > #center
		addInteraction: (TLPopUpAction text: #mooseName) onMouseOver;
		addNodeFromEntity: self centerNode.
	self > #around
		addInteraction: TLNodeBasicInteraction draggable;
		addInteraction: (TLPopUpAction text: #mooseName) onMouseOver.
	defaultInteraction
		ifTrue: [ self > #around addInteraction: self selectNodeInteraction ]