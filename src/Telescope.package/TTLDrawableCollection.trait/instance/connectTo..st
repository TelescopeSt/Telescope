connect
connectTo: aTLEntity
		^ self collect: [:aLocalTLEntity | aLocalTLEntity connectTo: aTLEntity ]