generation - node
makeCompositeShape: aShape withLabel: aLabel
	^ ((aShape isKindOf: RTLabel) or: [ aLabel = TLNoNodeLabel ])
		ifTrue: [ aShape ]
		ifFalse: [ TLRoassalCompositeLabelShape shape: aShape label: aLabel ]