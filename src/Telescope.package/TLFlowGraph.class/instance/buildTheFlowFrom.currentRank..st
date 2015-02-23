private
buildTheFlowFrom: aCollectionOfObjects currentRank: anIntegerRank
	aCollectionOfObjects
		ifNotEmpty: [ 
			self > anIntegerRank
				addNodesFromEntities: aCollectionOfObjects;
				layout: (RTVerticalLineLayout new gapSize: 30).
			self
				buildTheFlowFrom:
					((self removeDuplicatesIn: (aCollectionOfObjects flatCollect: [ :anObject | self nextProperty cull: anObject]))
						reject: [ :anEntity | 
							[ 
							self nodeForEntity: anEntity.
							true ]
								on: NotFound
								do: [ false ] ])
				currentRank: anIntegerRank + 1.
			(self > anIntegerRank) nodes
				do: [ :aNode | (self nextProperty cull: aNode entity ) do: [ :anEntity | aNode connectTo: (self nodeForEntity: anEntity) ] ] ]