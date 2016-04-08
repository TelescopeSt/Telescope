private
addNodes: aCollectionOfObjects At: anIntegerRank
	self > anIntegerRank
		addNodesFromEntities: aCollectionOfObjects;
		layout: (TLLinearLayout topToBottom gap: 30)