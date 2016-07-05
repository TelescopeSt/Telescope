private
obtainValue: aPropertyOrValuable forEntity: anEntity
	| result |
	[ result := aPropertyOrValuable cull: self ]
		on: KeyNotFound
		do: [ :msg | 
			TLStyleSheetMissingProperty new
				property: aPropertyOrValuable;
				entity: anEntity;
				signal ].
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