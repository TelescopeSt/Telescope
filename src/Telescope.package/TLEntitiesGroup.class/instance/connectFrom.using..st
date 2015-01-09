connect
connectFrom: aTLEntity using: anEdgeBuilder
		^ self telescopeEntities collect: [:aLocalTLEntity | aLocalTLEntity connectFrom: aTLEntity using: anEdgeBuilder ]