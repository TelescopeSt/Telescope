accessing
expanded
	(self state at: #childrenExpanded) ifNil: [ self expanded: self effectiveStyleSheet compositeExpandedByDefault ].
	^ self state at: #childrenExpanded