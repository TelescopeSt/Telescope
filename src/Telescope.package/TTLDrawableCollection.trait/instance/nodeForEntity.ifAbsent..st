nodes-entity
nodeForEntity: anEntity ifAbsent: aBlock
	^ self nodes
		detect: [ :aTLEntity | aTLEntity entity = anEntity ]
		ifNone: [ 
			self subGroups
				do: [ :aSubgroup | 
					[ ^ aSubgroup nodeForEntity: anEntity ]
						on: NotFound
						do: [  ] ].
			aBlock value ]