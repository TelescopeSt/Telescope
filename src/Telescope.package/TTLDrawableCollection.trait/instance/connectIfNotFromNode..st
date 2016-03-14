connect
connectIfNotFromNode: aTLNode
	^ self flatCollect: [ :aTLDrawable | (aTLDrawable connectIfNotFromNode: aTLNode) asTLDrawableCollection ]