private
obtainValue: aPropertyOrValuable forEntity: anEntity inNode: aNode
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
			[ result cull: anEntity cull: aNode ]
				on: MessageNotUnderstood
				do: [ TLStyleSheetPropertyBadlyUsed signalForProperty: aPropertyOrValuable propertyBlock: result entity: anEntity ] ]
		ifFalse: [ result ]