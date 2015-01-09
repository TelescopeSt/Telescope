as yet unclassified
defineLinkedCallsInteractions
	| keepNodeAction keepNodeMenuInteraction |
	keepNodeAction := TLCustomAction block: [ :node | self keepNode: node ].
	keepNodeMenuInteraction := keepNodeAction withMenu: 'Keep Node (double click)'.
	self > #incomingCalls
		addInteraction: keepNodeAction onDoubleClick;
		addInteraction: keepNodeMenuInteraction.
	self > #outgoingCalls
		addInteraction: keepNodeAction onDoubleClick;
		addInteraction: keepNodeMenuInteraction