private
addNodes: aCollectionOfObjects At: anIntegerRank
	self > anIntegerRank
		addNodesFromEntities: aCollectionOfObjects;
		layout: (RTVerticalLineLayout new gapSize: 30)