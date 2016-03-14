connect
connectIfNotToAll: aCollectionOfTLEntity
	^ aCollectionOfTLEntity collect: [ :aTLEntity | self connectIfNotTo: aTLEntity ]