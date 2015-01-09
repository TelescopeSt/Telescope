connect
connectTo: aTLEntity using: anEdgeBuilder
		^ self telescopeEntities collect: [:aLocalTLEntity | aLocalTLEntity connectTo: aTLEntity using: anEdgeBuilder ]