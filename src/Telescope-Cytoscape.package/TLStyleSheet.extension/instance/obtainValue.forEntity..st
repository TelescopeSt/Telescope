*Telescope-Cytoscape
obtainValue: aPropertyOrValuable forEntity: anEntity
	^ [ (self perform: aPropertyOrValuable) value: anEntity ]
		on: MessageNotUnderstood
		do: [ :msg | msg receiver ]