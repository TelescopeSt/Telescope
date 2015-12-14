*Telescope-Cytoscape
obtainValue: aPropertyOrValuable forEntity: anEntity
	^ [ ([self perform: aPropertyOrValuable] on: MessageNotUnderstood
		do: [ :msg | KeyNotFound signal ]) value: anEntity ]
		on: MessageNotUnderstood
		do: [ :msg | msg receiver ]