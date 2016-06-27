*Telescope-Cytoscape
obtainValue: aPropertyOrValuable forEntity: anEntity
	| result |
	[ result := aPropertyOrValuable cull: self ]
		on: MessageNotUnderstood
		do: [ :msg | KeyNotFound signal ].
	^ result isEvaluable
		ifTrue: [ 
			[ result value: anEntity ]
				on: MessageNotUnderstood
				do: [ 
					TLStyleSheetPropertyBadlyUsed new
						property: aPropertyOrValuable;
						propertyBlock: result;
						entity: anEntity;
						signal ] ]
		ifFalse: [ result ]