action
actionOn: aDrawable
	(aDrawable generator elementFromTLDrawable: aDrawable)
		in: [ :anElement | anElement defineFixedRelativePosition: (aDrawable generator movedNodesRelativePositionByElement at: anElement) ]