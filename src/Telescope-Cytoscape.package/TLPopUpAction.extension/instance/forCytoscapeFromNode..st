*Telescope-Cytoscape
forCytoscapeFromNode: aTLNode
	^ {('content' -> (self textBlock value: aTLNode entity)).
	('position'
		->
			{('my' -> self popUpArrowPosition forQTip).
			('at' -> self position forQTip)} asDictionary).
	('styles'
		->
			{('classes' -> 'qtip-bootstrap').
			('tip'
				->
					{('width' -> 16).
					('height' -> 8)} asDictionary)} asDictionary)} asDictionary