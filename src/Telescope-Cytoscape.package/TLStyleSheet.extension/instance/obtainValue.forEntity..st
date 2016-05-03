*Telescope-Cytoscape
obtainValue: aPropertyOrValuable forEntity: anEntity
	| result |
	[ result := aPropertyOrValuable cull: self] 
		on: MessageNotUnderstood
		do: [ :msg | KeyNotFound signal ].
	^ (result isEvaluable)
		ifTrue: [ result value: anEntity ]
		ifFalse: [ result ]