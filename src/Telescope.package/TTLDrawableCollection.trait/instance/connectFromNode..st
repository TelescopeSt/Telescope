connect
connectFromNode: aTLNode
	^ self flatCollect: [ :aTLDrawable | (aTLDrawable connectFromNode: aTLNode) asTLDrawableCollection ]