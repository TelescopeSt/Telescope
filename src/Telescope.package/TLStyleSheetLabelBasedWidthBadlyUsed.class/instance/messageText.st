accessing
messageText
	^ 'Your tried to adapt the width of a node to his label size but this node has no label. If you want to use a default value in that case use #adaptNodeWidthFromLabelWithDefault: instead of adaptNodeWidthFromLabel. Concerned entity: '
		, self entity asString