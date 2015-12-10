connect
connectTo: aTLEntity entity: anObject
		^ self collect: [:aLocalTLEntity | aLocalTLEntity connectTo: aTLEntity entity: anObject ]