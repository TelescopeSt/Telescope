connect
connectFrom: aTLEntity using: anEdgeBuilder
	^ self collect: [ :aLocalTLEntity | aLocalTLEntity connectFrom: aTLEntity using: anEdgeBuilder ]