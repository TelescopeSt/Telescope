connect
connectToAll: aCollectionOfTLEntity
	^ aCollectionOfTLEntity collect: [:aTLEntity | self connectTo: aTLEntity using: self edgeBuilder ]