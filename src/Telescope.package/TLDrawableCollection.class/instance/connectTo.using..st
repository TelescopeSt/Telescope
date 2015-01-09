connect
connectTo: aTLEntity using: anEdgeBuilder
	^ self collect: [:aLocalTLEntity | aLocalTLEntity connectTo: aTLEntity using: anEdgeBuilder ]