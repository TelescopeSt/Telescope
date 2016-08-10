accessing
childrenGroup
	childrenGroup isEmpty
		ifTrue: [ 
			[ self createChildrenNodes ]
				on: TLNoChildrenPropertyException , TLCompositeChildrenAlreadyGeneratedException
				do: [ 
					"Those cases are managed and so can happen"
					 ] ].
	^ childrenGroup