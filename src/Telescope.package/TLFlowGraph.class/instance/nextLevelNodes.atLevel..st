private
nextLevelNodes: aCollectionOfObjects atLevel: aLevel
	^ (self removeDuplicatesIn: (aCollectionOfObjects flatCollect: [ :anObject | self nextProperty cull: anObject ]))
		reject: [ :anEntity | 
			[ 
			self nodeForEntity: anEntity.
			true ]
				on: NotFound
				do: [ false ] ]