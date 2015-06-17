generation - node
generateSimpleNode: aSimpleNode
	^ (super generateSimpleNode: aSimpleNode)
		update;
		yourself