adding
addAbsentNodesInVisualizationFromEntities: aGroupOfEntities
	"only add nodes for entities that are not yet in visualization"
	self flag: 'Should check that aGroupOfEntities does not contains twice the same entity'.
	^ self
		addNodesFromEntities:
		
			(aGroupOfEntities
				reject: [ :anEntity | 
					[ 
					(self visualization ifNil: [self parent ifNil: [self]])nodeForEntity: anEntity.
					true ]
						on: NotFound
						do: [ false ] ])