connect
connectTo: aTLEntity entity: anObject
		^ self flatCollect: [:aLocalTLEntity | (aLocalTLEntity connectTo: aTLEntity entity: anObject) asTLDrawableCollection ]