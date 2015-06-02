label
nodeLabelPosition: aNodeLabelPosition 
	self assert: (TLRoassalCompositeLabelShape availablePlacing includes: aNodeLabelPosition) description: ('aNodeLabelPosition must be one of those: ', TLRoassalCompositeLabelShape availablePlacing asString). 
	self at: #nodeLabelPosition put: aNodeLabelPosition