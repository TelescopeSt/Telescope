label
nodeLabelPosition: aNodeLabelPosition
	self
		at: #nodeLabelPosition
		put:
			(aNodeLabelPosition isBlock
				ifTrue: [ aNodeLabelPosition ]
				ifFalse: [ TLPosition for: aNodeLabelPosition ])