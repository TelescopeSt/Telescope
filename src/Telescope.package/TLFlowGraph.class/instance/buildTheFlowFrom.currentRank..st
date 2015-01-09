private
buildTheFlowFrom: aCollectionOfObjects currentRank: anIntegerRank
	aCollectionOfObjects
		ifNotEmpty: [ 
			self > anIntegerRank
				addNodesFromEntities: aCollectionOfObjects;
				layout: (RTVerticalLineLayout new gapSize: 30).
			self
				buildTheFlowFrom:
					((self removeDuplicatesIn: (aCollectionOfObjects flatCollect: [ :anObject | anObject perform: self nextProperty ]))
						reject: [ :anEntity | 
							[ 
							self nodeForEntity: anEntity.
							true ]
								on: NotFound
								do: [ false ] ])
				currentRank: anIntegerRank + 1.
			(self > anIntegerRank) nodes
				do: [ :aNode | (aNode entity perform: self nextProperty) do: [ :anEntity | aNode connectTo: (self nodeForEntity: anEntity) ] ] ]