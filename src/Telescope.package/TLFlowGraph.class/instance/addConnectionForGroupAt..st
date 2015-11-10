private
addConnectionForGroupAt: anIntegerRank
	^ (self > anIntegerRank) nodes
		do: [ :aNode | (self nextProperty cull: aNode entity) do: [ :anEntity | aNode connectTo: (self nodeForEntity: anEntity) ] ]