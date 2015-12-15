adding
addAllNodes: aCollectionOfTLVirtualNodes
	self nodes addAll: (aCollectionOfTLVirtualNodes select: #isNode)