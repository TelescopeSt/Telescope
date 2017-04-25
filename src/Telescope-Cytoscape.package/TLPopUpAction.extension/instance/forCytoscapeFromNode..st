*Telescope-Cytoscape
forCytoscapeFromNode: aTLNode
	| pos |
	pos := self obtainsPositionFrom: aTLNode.
	^ {('content' -> (self obtainTextFromNode: aTLNode)).
	('position'
		->
			{('my' -> pos reversed forQTip).	"This is for the arrow of the popup"
			('at' -> pos forQTip)} asDictionary).
	('styles'
		->
			{('classes' -> 'qtip-bootstrap').
			('tip'
				->
					{('width' -> 16).
					('height' -> 8)} asDictionary)} asDictionary)} asDictionary