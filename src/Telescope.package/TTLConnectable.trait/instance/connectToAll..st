connect
connectToAll: aCollectionOfTLEntity
	^ aCollectionOfTLEntity collect: [:aTLEntity | self connectTo: aTLEntity ]