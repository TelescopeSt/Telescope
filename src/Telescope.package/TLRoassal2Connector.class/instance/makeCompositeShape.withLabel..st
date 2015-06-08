generation - node
makeCompositeShape: aShape withLabel: aLabel
	^ (aShape isKindOf: RTLabel)
		ifTrue: [ aShape ]
		ifFalse: [ TLRoassalCompositeLabelShape shape: aShape label: aLabel ]