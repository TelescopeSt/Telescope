layout
applyLayoutOf: aTLGroup on: group
	self positionNodesCommand addAllNodes: group.
	aTLGroup layout on: group