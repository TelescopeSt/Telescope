*Telescope-Cytoscape
iconName
	| shapeName |
	shapeName := self name allButFirst: 2.
	(shapeName endsWith: 'Shape')
		ifTrue: [ shapeName := shapeName allButLast: 5 ].
	^ shapeName capitalized