private
addNodes: aCollectionOfObjects at: anIntegerRank
	self > anIntegerRank
		addNodesFromEntities: aCollectionOfObjects;
		layout: (TLLinearLayout topToBottom gap: 30)