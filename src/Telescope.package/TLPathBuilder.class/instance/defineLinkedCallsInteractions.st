building
defineLinkedCallsInteractions
	| keepNodeAction keepNodeMenuInteraction |
	keepNodeAction := TLCustomAction block: [ :node | self keepNode: node ].
	keepNodeMenuInteraction := keepNodeAction withMenu: 'Keep Node (Right Click)'.
	self > #incomingCalls
		addInteraction: keepNodeAction onRightClick;
		addInteraction: keepNodeMenuInteraction.
	self > #outgoingCalls
		addInteraction: keepNodeAction onRightClick;
		addInteraction: keepNodeMenuInteraction