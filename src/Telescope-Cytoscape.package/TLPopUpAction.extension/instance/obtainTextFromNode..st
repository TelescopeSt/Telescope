*Telescope-Cytoscape
obtainTextFromNode: aTLNode
	| text |
	text := self textBlock cull: aTLNode entity cull: aTLNode.
	(text isNil or: [ text isEmpty ])
		ifTrue: [ TLNilOrEmptyTextException signal ].
	^ text