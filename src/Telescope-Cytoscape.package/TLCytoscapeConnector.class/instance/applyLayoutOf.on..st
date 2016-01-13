layout
applyLayoutOf: aTLGroup on: group
	self positionNodesCommand addAllNodes: group.
	group restoreElementsPosition.
	aTLGroup layout on: group