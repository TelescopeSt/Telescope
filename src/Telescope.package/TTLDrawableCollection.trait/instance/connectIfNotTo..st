connect
connectIfNotTo: aTLEntity
	^ self flatCollect: [ :aLocalTLEntity | (aLocalTLEntity connectIfNotTo: aTLEntity) asTLDrawableCollection ]