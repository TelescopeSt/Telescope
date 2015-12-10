connect
connectFromNode: aTLNode
	^ self collect: [ :aTLDrawable | aTLDrawable connectFromNode: aTLNode ]