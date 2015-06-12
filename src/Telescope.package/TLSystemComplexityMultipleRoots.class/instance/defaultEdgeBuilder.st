building
defaultEdgeBuilder
	^ (TLEdgeLineBuilder newWithGenerator: self generator)
		attachPoint: RTVerticalAttachPoint;
		color: Color gray