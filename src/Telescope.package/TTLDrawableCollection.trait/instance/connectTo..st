connect
connectTo: aTLEntity
		^ self flatCollect: [:aLocalTLEntity | (aLocalTLEntity connectTo: aTLEntity) asTLDrawableCollection ]