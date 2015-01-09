building
buildInteractionActions
	self > #center
		addInteraction: (TLNodeBasicInteraction popup: #mooseName);
		addNodeFromEntity: self centerNode.
	(self > #around) nodeBuilder
		addInteraction: TLNodeBasicInteraction draggable;
		addInteraction: (TLNodeBasicInteraction popup: #mooseName).
	defaultInteraction ifTrue: [ (self > #around ) nodeBuilder addInteraction: self selectNodeInteraction ]