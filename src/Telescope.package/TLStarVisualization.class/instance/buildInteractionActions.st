building
buildInteractionActions
	self > #center
		addInteraction: (TLNodeBasicInteraction popup: #mooseName);
		addNodeFromEntity: self centerNode.
	(self > #around)
		addInteraction: TLNodeBasicInteraction draggable;
		addInteraction: (TLNodeBasicInteraction popup: #mooseName).
	defaultInteraction ifTrue: [ (self > #around ) addInteraction: self selectNodeInteraction ]